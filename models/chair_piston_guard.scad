// A cover for computer chair pistons, so you don't accidentally kick the greasy
// piston. Nothing special, just a cylinder with 2 cylinders cut out of it.

// These default values are for an ikea ALRIK and my (badly tuned) pronter.

piston_dia = 28.2;
outer_dia = 53;
contact_length = 5;
covered_length = 147;

thickness = 1.5;

difference() {
    cylinder($fn=120, h=(contact_length + covered_length), d =(outer_dia + 2*thickness));
    cylinder($fn=120, h=contact_length, d=piston_dia);
    translate([0, 0, contact_length]) {
        cylinder($fn=120, h=covered_length, d=outer_dia);
    }
}
