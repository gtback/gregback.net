Title: MySQL Change current auto-increment value
Date: 2010-02-20 13:30
Author: Greg Back
Category: Programming
Tags: mysql, sql, database

You can use the following SQL query to set the next value to be used by
an auto-incrementing field in MySQL. Useful if you make a mistake and
want to delete a value you just added without leaving a gap in the
sequence numbers, or if you want to start with an index higher than 1.

    :::mysql
    ALTER TABLE tablename AUTO_INCREMENT = value;

