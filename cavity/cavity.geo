//+
SetFactory("OpenCASCADE");
//+
Point(1) = {0, 0, 0, 1.0};
//+
Extrude {1, 0, 0} {
  Point{1}; Layers {129}; Recombine;
}
//+
Extrude {0, 1, 0} {
  Curve{1}; Layers {129}; Recombine;
}
//+
Physical Curve("MovingWall", 5) = {4};
//+
Physical Curve("Wall", 6) = {2, 1, 3};
//+
Physical Surface("Fluid", 7) = {1};
