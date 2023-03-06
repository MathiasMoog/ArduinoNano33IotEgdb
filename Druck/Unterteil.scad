/* Unterteil für den Programmieradapter 
   Copyright, 2023, Mathias Moog, Hochschule Ansbach, Deutschland, CC-BY-NC-SA
*/


l=60;       // Länge
b=24;       // Breite
wu=1.2;     // Stufe unterhalb Platine
wo=1;       // Wandstärke neben Platine
hb=1.2;     // Höhe Bodenplatte
hu=2.5;     // Höhe unter Platine (Pins, Kabel)
ho=1.5;     // Höhe neben Platine


difference() {
  cube([l+wo,b+2*wo,hb+hu+ho]);
  // Abzüglich
  translate([wo+wu,wu+wo,hb]) cube([l,b-2*wu,hb+hu+ho]);
  translate([wo,wo,hb+hu]) cube([l,b,hb+hu+ho]);
}
  

