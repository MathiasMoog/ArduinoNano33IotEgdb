/* Führung damit die Nanos gut die Lötstifte treffen
   Copyright, 2023, Mathias Moog, Hochschule Ansbach, Deutschland, CC-BY-NC-SA
*/

// Abmessung in Anzahl der Pins
nx=4;
ny=7;
// Höhe
h=4;
// Durchmesser der Löcher für die Pins, nicht zu groß wählen
dp=2;
// Durchmesser und höhe der Scheiben an den Pogo Pins
ds=2.5;
hs=0.6;
// Positionierhilfe, rastet auf der Platine ein.
// Durchmesser und Höhe der Nibbel die in die Bohrlöcher passen.
dn=0.7;
hn=0.6;
// Rastermaß
r=2.54;
// Schöne runde Löcher
$fn=30;

// löcher von unten an
module loch(x,y,d,h) {
  translate([x*r,y*r,-hn]) cylinder(d=d,h=h+hn);
}

// Löcher der Pogo Pins
module pogo(x,y) {
  // Scheibe
  loch(x,y,ds,hs);
  // Pogo
  loch(x,y,dp,h+hs);
}

difference() {
  // Platte mit allen Positionierhilfen
  union() {  
    cube([nx*r+r,ny*r+r,h]);
    for(x=[1:nx]) {
      for(y=[1:ny]) {
       loch(x,y,dn,0);
      }
    }
  }
  // Pins des Nano
  for(x=[3:nx+1]) {
    loch(x,1,1.3,2*h);
    loch(x,7,1.3,2*h);
  }
  // Pogo Pins
  pogo(2,3); 
  pogo(2,5); 
  pogo(3,3); 
  pogo(3,4); 
  pogo(3,5); 
  // Mein Aufbau ist zu knapp. Säbel ein Stück zum Pico hin ab
  cube([0.6*r,ny*5,h]);
}
  

