Title: PuTTY SSH Tunnel for MySQL
Date: 2010-05-09 14:42
Author: Greg Back
Category: Programming
Tags: database, mysql, putty

I just stumbled across the [MySQL GUI Tools Bundle][mysql] which is very
useful for managing a MySQL databases. In my opinion, it's much easier
than using phpMyAdmin, which I had been doing previously. The only
problem is that using it "requires" the machine the database is on (my
web server) having an open external port (typically 3306) for the
applications to have access to the database. "Requires" is in quotes
because you can use PuTTY to open an SSH tunnel from your local machine
to the database server, so that requests to port 3306 on your local
machine are forwarded to the remote machine through the PuTTY
connection.

Quick summary:

1.  In PuTTY (before connecting to the server), go to Connections-\>
    SSH-\> Tunnels.
2.  Add Source: "3306" (the local port you'll be using) and Destination:
    "127.0.0.1:3306" (the connection to be made from the other side of
    the tunnel.
3.  Log into the server using PuTTY as you normally would. (Don't forget
    this step!)
4.  Open MySQL Query Browser (or another of the tools), and for the
    connection info use Server: "localhost" and Port: "3306" (the local
    side of the tunnel), along with the appropriate username and
    password information.
5.  The MySQL GUI tools should now work as normal. Enjoy.

</p>
For more information and screenshots, check out the link below.

[Source: [realprogrammers.com][2]]

  [mysql]: http://dev.mysql.com/downloads/gui-tools/5.0.html
  [2]: http://realprogrammers.com/how_to/set_up_an_ssh_tunnel_with_putty.html
