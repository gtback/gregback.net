Title: Double-buffered Panels in C#
Date: 2011-01-23 17:08
Author: Greg Back
Category: Programming
Tags: .NET, C#, WinForms

Having panels which update quickly without flickering requires
double-buffering. To accomplish this in C\#, you'll have to derive from
the standard `Panel` class as shown below, and then replace the
declaration and instantiation of the panel with your new class.

    :::csharp
    using System.Windows.Forms;

    namespace WindowsFormsApplication1
    {
        public class DoubleBufferedPanel : Panel
        {
            public DoubleBufferedPanel()
            {
                this.SetStyle(ControlStyles.AllPaintingInWmPaint |
                    ControlStyles.OptimizedDoubleBuffer |
                    ControlStyles.UserPaint, true);
            }
        }
    }


and then replace `System.Windows.Forms.Panel` with `DoubleBufferedPanel` in
the `Designer.cs` class.
