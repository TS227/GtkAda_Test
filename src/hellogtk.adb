with Gtk.Label; use Gtk.Label;
with Gtk.Button; use Gtk.Button;
with Gtk.Box; use Gtk.Box;
with Gtk.Container; use Gtk.Container;
with Gtk.Main;
with Gtk.Widget; use Gtk.Widget;
with Gtk.Window; use Gtk.Window;

procedure Hellogtk is
   Main_Window : Gtk_Window;
   Hello_Label_H : Gtk_Label;
   Hello_Button_H : Gtk_Button;
   Bye_Button_H : Gtk_Button;
   Hello_Label_V : Gtk_Label;
   Hello_Button_V : Gtk_Button;
   Bye_Button_V : Gtk_Button;
   Horizontal_Box : Gtk_Box;
   Vertical_Box : Gtk_Box;
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
   Gtk_New_Hbox (Horizontal_Box, Homogeneous => False, Spacing =>0 );
   Gtk_New_Vbox (Vertical_Box, Homogeneous => False, Spacing =>0 );
   Gtk_New_Vbox (Main_Box, Homogeneous => False, Spacing =>0 );
   Gtk_New (Hello_Label_H, "Hello, World");
    Gtk_New (Hello_Button_H, "Click Me!");
    Gtk_New (Bye_Button_H, "Click Me!");
    Gtk_New (Hello_Label_V, "Hello, World");
    Gtk_New (Hello_Button_V, "Click Me!");
    Gtk_New (Bye_Button_V, "Click Me!");
   Horizontal_Box.Pack_Start (Hello_Label_H, Expand => False, Fill => False, Padding => 0);
    Horizontal_Box.Pack_Start (Hello_Button_H, Expand => False, Fill => False, Padding => 0);
    Horizontal_Box.Pack_Start (Bye_Button_H);
    Vertical_Box.Pack_Start (Hello_Label_V, Expand => False, Fill => False, Padding => 0);
    Vertical_Box.Pack_Start (Hello_Button_V, Expand => False, Fill => False, Padding => 0);
    Vertical_Box.Pack_Start (Bye_Button_V);
    
   Main_Box.Pack_Start (Horizontal_Box, Expand => False, Fill => False, Padding => 0);
   Main_Box.Pack_Start (Vertical_Box, Expand => False, Fill => False, Padding => 0);
   -- Add Main_Box to the window
   Main_Window.Add (Main_Box);
   Main_Window.Show_All;
   Gtk.Main.Main;
end Hellogtk;
