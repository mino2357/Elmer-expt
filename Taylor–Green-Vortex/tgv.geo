//+
pi = 3.14159265358979323846;
//+
Point(1) = {0, 0, 0, 1.0};
//+
Extrude {2*pi, 0, 0} {
  Point{1}; Layers {256}; Recombine;
}
//+
Extrude {0, 2*pi, 0} {
  Curve{1}; Layers {256}; Recombine;
}
//+
Physical Curve("left") = {3};
//+
Physical Curve("right") = {4};
//+
Physical Curve("top") = {2};
//+
Physical Curve("bottom") = {1};
//+
Physical Surface("fluid") = {5};
