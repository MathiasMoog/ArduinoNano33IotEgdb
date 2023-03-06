/* Löthilfe für Pogo Pins 
   Copyright, 2023, Mathias Moog, Hochschule Ansbach, Deutschland, CC-BY-NC-SA
*/

// Abmessung in Anzahl der Pins
nx=2;
ny=3;
// Höhe
h=8;
// Durchmesser der Löcher, nicht zu groß wählen
d=2;
// Durchmesser und Höhe der Montagescheibe der Pogo Pins
ds=2.5;
hs=0.6;
// Rastermaß
r=2.54;
// Schöne runde Löcher
$fn=30;

difference() {
  cube([nx*r+r,ny*r+r,h]);
  for(x=[1:nx]) {
    for(y=[1:ny]) {
      // Pin
      translate([x*r,y*r,-h]) cylinder(d=d,h=3*h);
      // Scheibe
      translate([x*r,y*r,-hs]) cylinder(d=ds,h=2*hs);
    }
  }
}
  

