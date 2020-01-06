// A square with a recess that holds an estrogen clicky.
//
// https://twitter.com/nyanotech/status/1188263391351070720

max_chuck_size = (3/8) * 25.4;
chuck_depth = 25;

// I think dia could be 51, but expanded a bit for tolerances
spinny_dia = 53;
spinny_thickness = 4.5;
rim_thickness = 2;

notch_width = 3.5;
notch_depth = 1.8;
notch_length = 7;

difference() {
  cylinder($fn=120, d=(spinny_dia + 2*rim_thickness), h=rim_thickness + spinny_thickness);
  cylinder($fn=120, d=spinny_dia, h=spinny_thickness);
}

translate([-notch_width/2, -spinny_dia/2, spinny_thickness - notch_depth]) {
  cube([notch_width, notch_length, notch_depth]);
}

translate([0, 0, rim_thickness + spinny_thickness]) {
  cylinder($fn=6, d=(max_chuck_size / (sqrt(3)/2)), h=chuck_depth);
}
