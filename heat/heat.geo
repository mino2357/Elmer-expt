//+
SetFactory("OpenCASCADE");
//+
Point(1) = {0, 0, 0, 1.0};
//+
Extrude {1, 0, 0} {
  Point{1}; Layers {50}; Recombine;
}
//+
Extrude {0, 1, 0} {
  Curve{1}; Layers {50}; Recombine;
}
//+
Extrude {0, 0, 1} {
  Surface{1}; Layers {50}; Recombine;
}
//+
Physical Surface("Wall", 13) = {6, 4, 2, 3, 1, 5};
//+
Physical Volume("Heat", 14) = {1};
