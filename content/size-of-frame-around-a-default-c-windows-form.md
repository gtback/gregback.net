Title: Size of Frame around a default C# Windows Form
Date: 2011-01-23 16:36
Author: Greg Back
Category: Programming
Tags: .NET, C#, WinForms

So here's the scenario. I was looking to have the a panel with exact
dimensions on a C\# form (**700x400**). I wanted even and default
spacing around the panel on the form. I figured out the default spacing
was 12, so I set the size of the form to **724x424**, only to find that
something still looked wrong.

Turns out that the dimensions of the form include the border and title
bar (seems obvious in retrospect, doesn't it). What I really wanted was
to have the form's **ClientSize** equal to 724x424. To figure out what I
needed the form dimensions to be in order to have a correctly-sized
Client area to place my frame in, I used the following snippet:

    :::csharp
    MessageBox.Show(String.Format("{0}, {1}",
                                  this.Width - this.ClientSize.Width,
                                  this.Height - this.ClientSize.Height));

The final result:

The frame takes up 16 pixels horizontally (8 on each size) and 38
vertically (8 on the bottom and 30 on top), so the final size of the
form I needed was **740x462**.
