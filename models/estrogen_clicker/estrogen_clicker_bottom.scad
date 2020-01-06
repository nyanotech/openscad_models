// connector that gets chucked on a drill on one end, and sits on an estrogen
// clicker on the other.
//
// https://twitter.com/nyanotech/status/1188263391351070720

dia = 54;
nubbin_inner_dia = 52;
nubbin_dia = 4;
nubbin_count = 28;

hole_depth = 2;
thickness = 10;
size = dia + 10;

difference() {
  translate([-size/2, -size/2, 0]) {
    cube([size, size, thickness]);
  }

  translate([0, 0, thickness - hole_depth]) {
    difference() {
    cylinder($fn=120, d=dia, h=hole_depth + 0.001);
      for (i = [1 : nubbin_count]) {
        rotate([0, 0, (360/nubbin_count) * i]) {
          translate([(nubbin_inner_dia + nubbin_dia) / 2, 0, 0]) {
            cylinder($fn=60, d=nubbin_dia, h=hole_depth + 0.001);
          }
        }
      }
    }
  }
  
  cylinder(d=(dia/2), h=thickness);
}
