Title: TOP (Linux Program) CPU States
Date: 2009-08-12 07:36
Author: Greg Back
Category: Linux
Tags: top

The Unix/Linux program "top" is used to determine various information
about processes your computer is executing. It is comparable to the "ps"
command, but I prefer using top. It a good equivalent of the Task
Manager on Windows, but much more powerful and customizable, if you're
comfortable with the command line (though not as good as Process
Explorer, in my opinion). I plan to write a more detailed comparison
between ps and top in the future, but until then, here is the first
question I had about top, as well as the solution I found on the web:

What do the "us/sy/ni", etc. abreviations mean in the (default) third
line of top output (the one that begins with "Cpu(s):") ?

-   **us**- *User CPU time*. The time the CPU has spent running users’
    processes with default priorities
-   **sy**- *System CPU time*. The time the CPU has spent running the
    kernel and its processes
-   **ni**- *Nice CPU time*. The time the CPU has spent running users’
    proccess that have been prioritized up using **nice**command
-   **wa**- *I/O wait*. Amount of time the CPU has been waiting for I/O
    operations to complete
-   **hi**- *Hardware IRQ*. The amount of time the CPU has been
    servicing hardware interrupts
-   **si**- *Software Interrupts*. The amount of time the CPU has been
    servicing software interrupts
-   **st**- *Steal Time*. The amount of CPU ’stolen’ from this virtual
    machine by the hypervisor for other tasks (such as running another
    virtual machine) – a fairly recent addition to the top command,
    introduced with the increased virtualization focus in modern
    operating systems

[Source: [UnixTutorial.org][]]

  [UnixTutorial.org]: http://www.unixtutorial.org/commands/top/
