with Gtk.Label; use Gtk.Label;
with Gtk.Button; use Gtk.Button;
with Gtk.Box; use Gtk.Box;
with Gtk.Container; use Gtk.Container;
with Gtk.Main;
with Gtk.Widget; use Gtk.Widget;
with Gtk.Window; use Gtk.Window;

procedure Hellogtk is
   Main_Window : Gtk_Window;
   Hello_Label : Gtk_Label;
   Hello_Button : Gtk_Button;
   Bye_Button : Gtk_Button;
   Main_Box : Gtk_Box;
   procedure Window_Close_CB (Window : access Gtk_Widget_Record'Class) is
      pragma Unreferenced (Window);
   begin
      Gtk.Main.Main_Quit;
   end Window_Close_CB;
begin
   Gtk.Main.Init;
   Gtk_New (Main_Window);
   Main_Window.Set_Title ("Hello Gtk");
   Main_Window.On_Destroy (Window_Close_CB'Unrestricted_Access);
   Gtk_New_Hbox (Main_Box, Homogeneous => False, Spacing =>0 );
   Gtk_New (Hello_Label, "Hello, World");
   Gtk_New (Hello_Button, "Click Me!");
   Gtk_New (Bye_Button, "Click Me!");
   Main_Box.Pack_Start (Hello_Label, Expand => False, Fill => False, Padding => 0);
   Main_Box.Pack_Start (Hello_Button, Expand => False, Fill => False, Padding => 0);
   Main_Box.Pack_Start (Bye_Button);

   -- Add Main_Box to the window
   Main_Window.Add (Main_Box);
   Main_Window.Show_All;
   Gtk.Main.Main;
end Hellogtk;
