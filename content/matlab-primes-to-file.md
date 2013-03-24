Title: Matlab Primes to File
Date: 2010-03-30 21:36
Author: Greg Back
Category: Math
Tags: matlab, primes

The MATLAB script below will export 10000 primes to a file named
'primes.txt':

    :::matlab
    x=primes(10000); % Insert your own value here
    fopen('primes.txt','w+'); % Insert the file name heref
    printf(ans, '%d\n',x); % Prints a new line between each prime (C-style formatting)
    fclose all;

