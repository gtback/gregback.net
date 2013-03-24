Title: PHP Equal-Sign Operators
Date: 2010-04-22 21:51
Author: Greg Back
Category: Programming
Tags: php

Reading some php code, you might get confused about the difference
betweeen =, ==, and === (this single, double, and triple equal signs).
Here's a quick summary.

= (Assignment) Just like in (pretty much) every other programming
language.

== (Equality) Returns true if the two variables have the same value.

=== (Identity) Returns true if the two variables have the same value AND
the same type (integer 0 is not equal to, in the === sense, float 0 or
string 0).

Hope that clears up confusion. It did for me.

[Source: [Wellho.net][]]

  [Wellho.net]: http://www.wellho.net/mouth/406_Assignment-equality-and-identity-in-PHP.html
