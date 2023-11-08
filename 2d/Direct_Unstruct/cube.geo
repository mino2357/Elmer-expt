//+
SetFactory("OpenCASCADE");
//+
Point(1) = {0, 0, 0, 1.0};
//+
Extrude {2, 0, 0} {
  Point{1};
}
//+
Extrude {1, 0, 0} {
  Point{2};
}
//+
Extrude {20, 0, 0} {
  Point{3};
}
//+
Extrude {0, 2.0, 0} {
  Curve{1}; Curve{2}; Curve{3};
}
//+
Extrude {0, 1, 0} {
  Curve{6}; Curve{10};
}
//+
Line(17) = {10, 11};
//+
Extrude {0, 2.0, 0} {
  Curve{13}; Curve{17}; Curve{16};
}
//+
BooleanUnion{ Surface{6}; Delete; }{ Surface{4}; Surface{1}; Surface{2}; Surface{3}; Surface{5}; Surface{8}; Surface{7}; Delete; }
//+
Physical Curve("Inlet", 22) = {21};
//+
Physical Curve("Outlet", 23) = {19};
//+
Physical Curve("Side", 24) = {18, 20};
//+
Physical Curve("Wall", 25) = {17, 12, 8, 14};
//+
Physical Surface("Fluid", 26) = {6};
//+
Transfinite Curve {12, 17, 14, 8} = 40 Using Progression 1;
