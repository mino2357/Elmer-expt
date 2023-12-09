//+
SetFactory("OpenCASCADE");
//+
Point(1) = {0, 0, 0, 1.0};
//+
Extrude {1, 0, 0} {
  Point{1}; Layers {250}; Recombine;
}
//+
Extrude {0, 1, 0} {
  Curve{1}; Layers {250}; Recombine;
}
//+
Physical Curve("left", 5) = {2};
//+
Physical Curve("right", 6) = {3};
//+
Physical Curve("top", 7) = {4};
//+
Physical Curve("bottom", 8) = {1};
//+
Physical Surface("fluid", 9) = {1};
