//+
SetFactory("OpenCASCADE");
//+
n=4;
//
Point(1) = {0, 0, 0, 1.0};
//+
Extrude {2, 0, 0} {
  Point{1}; Layers {20*n}; Recombine;
}
//+
Extrude {1, 0, 0} {
  Point{2}; Layers {10*n}; Recombine;
}
//+
Extrude {10, 0, 0} {
  Point{3}; Layers {100*n}; Recombine;
}
//+
Extrude {0, 2.0, 0} {
  Curve{1}; Curve{2}; Curve{3}; Layers {20*n}; Recombine;
}
//+
Extrude {0, 1, 0} {
  Curve{6}; Curve{10}; Layers {10*n}; Recombine;
}
//+
Line(17) = {10, 11};
//+
Transfinite Curve {17} = 10*n+1 Using Progression 1;
//+
Extrude {0, 2.0, 0} {
  Curve{13}; Curve{17}; Curve{16}; Layers {20*n}; Recombine;
}
//+
Physical Curve("Inlet", 25) = {18, 11, 4};
//+
Physical Curve("Outlet", 26) = {23, 15, 9};
//+
Physical Curve("SideWall", 27) = {20, 22, 24, 1, 2, 3};
//+
Physical Curve("Wall", 28) = {17, 12, 8, 14};
//+
Physical Surface("Fluid", 29) = {8, 7, 6, 5, 4, 3, 2, 1};
//+
Coherence;
