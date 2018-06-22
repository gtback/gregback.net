Title: Careful with those Backslashes!
Date: 2018-06-21 10:59:00
Author: Greg Back
Category: Python
Tags: python, mysql, backslash

# Brainteaser of the day

Given a MySQL database, what value will be put in the database for each of the
following Python statements?

```python
# normal string, 4 backslashes
db.execute( "INSERT INTO `test` (`text`) VALUES ('x\\\\y');")
# raw string, 2 backslashes
db.execute(r"INSERT INTO `test` (`text`) VALUES ('x\\y');"  )
# normal string, 3 backslashes
db.execute( "INSERT INTO `test` (`text`) VALUES ('x\\\y');" )
# raw string, 3 backslashes
db.execute(r"INSERT INTO `test` (`text`) VALUES ('x\\\y');" )
```

Take a guess, or try it out before looking at the answer below. If you want
to set up a database yourself, the following snippets should help.

<details>
    <summary>Code to set up a database and table</summary>

    from sqlalchemy import create_engine
    engine = create_engine('mysql://root@localhost/')
    db = engine.connect()
    db.execute("""
        DROP DATABASE IF EXISTS test_db;
        CREATE DATABASE test_db;
        USE test_db;
        CREATE TABLE `test` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `text` char(8) NOT NULL,
            PRIMARY KEY (`id`)
        ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;"""
    )
    db.close()

</details>

<details>
    <summary>Code to dump contents of database</summary>

    from sqlalchemy import create_engine
    engine = create_engine('mysql://root@localhost/test_db')
    db = engine.connect()
    # Put insert commands here.
    res = db.execute("""SELECT text FROM test;""").fetchall()
    for row in res:
        print(row)
    db.close()

</details>

Here are some adorable Basset Hound pictures for you to look at before scrolling
down to see the answer.

![Basset puppy](https://upload.wikimedia.org/wikipedia/commons/1/19/Cara_de_quem_caiu_do_caminh%C3%A3o....jpg)

![Best friends](https://upload.wikimedia.org/wikipedia/commons/5/52/Bassets_hound_%2C_basset-hound.jpg)

# Answer

**All four** will result in the **same** data being in the database:

```txt
x\y
x\y
x\y
x\y
```

**Crazy, huh!?**

I was confused too until I looked a bit more at the documentation and did some
experimentation.

## Backslashes in Python

Backslashes in Python string literals *sometimes* need to be escaped.

```python
print('a\\a')      # => a\a
print('a\a')       # => a (\a is the escape for BEL)
print('a\s')       # => a\s (\s is not a valid escape, so Python assumes the backslash is literal - DANGER!)
print('a\\s')      # => a\s
'a\\s' == 'a\s'    # True
```

> Unlike Standard C, all unrecognized escape sequences are left in the string unchanged, i.e., the backslash is left in the result. (This behavior is useful when debugging: if an escape sequence is mistyped, the resulting output is more easily recognized as broken.) It is also important to note that the escape sequences only recognized in string literals fall into the category of unrecognized escapes for bytes literals.

[Python 3 documentation](https://docs.python.org/3/reference/lexical_analysis.html#string-and-bytes-literals) 
(and similar for Python 2)

This is part of the reason that "raw" string literals (prefixed with 'r') are useful:

```python
print(r'a\\a')     # => a\\a
print(r'a\a')      # => a\a
print(r'a\s')      # => a\s
print(r'a\\s')     # => a\\s
r'a\\s' == r'a\s'  # False
```

## Backslashes in MySQL

MySQL similarly uses backslash as an escape. However, differently from Python,
if a backslash is not part of a recognized escape sequence, the backlash is just
dropped.

```sql
INSERT INTO `test` (`text`) VALUES ('a\\a');  -- a\a
INSERT INTO `test` (`text`) VALUES ('a\aa');  -- aaa
INSERT INTO `test` (`text`) VALUES ('a\ta');  -- a	a (literal tab character between two a's)
INSERT INTO `test` (`text`) VALUES ('a\a');   -- aa
```

> MySQL recognizes the escape sequences shown in Table 9.1, "Special Character Escape Sequences". For all other escape sequences, backslash is ignored. That is, the escaped character is interpreted as if it was not escaped. For example, \x is just x. These sequences are case-sensitive. For example, \b is interpreted as a backspace, but \B is interpreted as B.

[MySQL 5.7 documentation](https://dev.mysql.com/doc/refman/5.7/en/string-literals.html)

## Putting it together

This combination leads to confusing results. So in the example below (different
than the four original statements):

```python
db.execute("""INSERT INTO `test` (`text`) VALUES ('x\\y');""")
```

This is not using a raw string, so the actual command passed to SQL is:

```sql
INSERT INTO `test` (`text`) VALUES ('x\y');
```

Since `\y` is not a valid escape sequence for MySQL, the table just contains `xy`.

Both of the following (the first two examples at the top) will insert `x\y`:

```python
db.execute( "INSERT INTO `test` (`text`) VALUES ('x\\\\y');")
db.execute(r"INSERT INTO `test` (`text`) VALUES ('x\\y');")
```

because the SQL command in both cases is:

```sql
INSERT INTO `test` (`text`) VALUES ('x\\y')
```

Confusingly, the other two examples also both result in the same data in the
database, but for vastly different reasons:

```python
db.execute( "INSERT INTO `test` (`text`) VALUES ('x\\\y');")
```

In this case, it's because Python will see the first two backslashes as a
single properly-escaped backslash, but also leave the third backslash in,
resulting in the same SQL command as the first two examples.

The last example is perhaps the most confusing, because it generates a different
SQL command:

```python
db.execute(r"INSERT INTO `test` (`text`) VALUES ('x\\\y');")
```

```sql
INSERT INTO `test` (`text`) VALUES ('x\\\y');
```

In this case, MySQL treats the first two backslashes as a single
properly-escaped backslash, but then "drops" the third one, so the resulting
data in the table is still `x\y`.

Go forth and be careful with those backslashes!

## Image credits

- By Anderson Nascimento [<a href="https://creativecommons.org/licenses/by/2.0">CC BY 2.0</a>], <a href="https://commons.wikimedia.org/wiki/File:Cara_de_quem_caiu_do_caminh%C3%A3o....jpg">via Wikimedia Commons</a>
- By eda [Public domain], <a href="https://commons.wikimedia.org/wiki/File:Bassets_hound_,_basset-hound.jpg">from Wikimedia Commons</a>