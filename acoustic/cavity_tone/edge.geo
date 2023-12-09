//+
SetFactory("OpenCASCADE");
//+
Point(1) = {0, 0, 0, 1.0};
//+
Point(2) = {0.01, 0, 0, 1.0};
//+
Point(3) = {0.01, -0.002, 0, 1.0};
//+
Point(4) = {0, -0.002, 0, 1.0};
//+
Point(5) = {0, -0.01, 0, 1.0};
//+
Point(6) = {0.04, -0.01, 0, 1.0};
//+
Point(7) = {0.04, -0.002, 0, 1.0};
//+
Point(8) = {0.01, -0.001, 0, 1.0};
//+
Point(9) = {0.00, -0.001, 0, 1.0};
//+
Point(10) = {0.01, -0.01, 0, 1.0};
//+
//+
Line(1) = {1, 2};
//+
Line(2) = {9, 8};
//+
Line(3) = {4, 3};
//+
Line(4) = {5, 10};
//+
Line(5) = {7, 3};
//+
Line(6) = {6, 10};
//+
Line(7) = {6, 7};
//+
Line(8) = {10, 3};
//+
Line(9) = {5, 4};
//+
Line(10) = {1, 9};
//+
Line(11) = {4, 9};
//+
Line(12) = {2, 8};
//+
Line(13) = {3, 8};
//+
Curve Loop(1) = {1, 12, -2, -10};
//+
Surface(1) = {1};
//+
Curve Loop(3) = {2, -13, -3, 11};
//+
Surface(2) = {3};
//+
Curve Loop(5) = {9, 3, -8, -4};
//+
Surface(3) = {5};
//+
Curve Loop(7) = {5, -8, -6, 7};
//+
Surface(4) = {7};
//+
Point(11) = {0.0, 1.0, 0, 1.0};
//+
Point(12) = {0.01, 1.0, 0, 1.0};
//+
Point(13) = {1.0, 0.0, 0, 1.0};
//+
Point(14) = {1.0, 1.0, 0, 1.0};
//+
Point(15) = {-1.0, 0.0, 0, 1.0};
//+
Point(16) = {-1.0, 1.0, 0, 1.0};
//+
Line(14) = {16, 15};
//+
Line(15) = {11, 1};
//+
Line(16) = {12, 2};
//+
Line(17) = {14, 13};
//+
Line(18) = {13, 2};
//+
Line(19) = {14, 12};
//+
Line(20) = {16, 11};
//+
Line(21) = {15, 1};
//+
Line(22) = {11, 12};
//+
Curve Loop(9) = {18, -16, -19, 17};
//+
Surface(5) = {9};
//+
Curve Loop(11) = {16, -1, -15, 22};
//+
Surface(6) = {11};
//+
Curve Loop(13) = {20, 15, -21, -14};
//+
Surface(7) = {13};
//+
Transfinite Curve {1, 3, 4, 22} = 100 Using Progression 1;
//+
Transfinite Curve {-2} = 100 Using Progression 1.00;
//+
Transfinite Curve {-5, -6} = 100 Using Progression 1.02;
//+
Transfinite Curve {-9, -8, -7} = 50 Using Progression 1.02;
//+
Transfinite Curve {10, 12} = 25/2 Using Progression 1;
//+
Transfinite Curve {11, 13} = 25/2 Using Progression 1;
//+
Transfinite Curve {-14, -15, -16, -17} = 160 Using Progression 1.04;
//+
Transfinite Curve {-20, -21} = 160 Using Progression 1.04;
//+
Transfinite Curve {-19, -18} = 160 Using Progression 1.04;
//+
Transfinite Surface "*";
Recombine Surface "*";
Transfinite Volume "*";
//+
Physical Curve("Inlet", 23) = {10, 11};
//+
Physical Curve("Wall", 24) = {9, 4, 6, 7, 5, 13, 12, 18, 21, 17, 19, 22, 20, 14};
//+
//+
//+
//+
//+
//+
Physical Surface("Fluid", 25) = {7, 6, 1, 2, 3, 4, 5};
//+
Physical Curve("NBC", 26) = {15, 16, 2, 8};
