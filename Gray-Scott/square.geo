//+
SetFactory("OpenCASCADE");
//+
n=1;
//+
Point(1) = {0, 0, 0, 1.0};
//+
Extrude {2*n, 0, 0} {
  Point{1}; Layers {200}; Recombine;
}
//+
Extrude {0, 2*n, 0} {
  Curve{1}; Layers {200}; Recombine;
}
//+
Physical Curve("top", 5) = {4};
//+
Physical Curve("bottom", 6) = {1};
//+
Physical Curve("left", 7) = {2};
//+
Physical Curve("right", 8) = {3};
//+
Physical Surface("in", 9) = {1};
