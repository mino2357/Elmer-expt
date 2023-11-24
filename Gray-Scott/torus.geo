//+
SetFactory("OpenCASCADE");
//+
Torus(1) = {0, 0, 0, 1.0, 0.7, 2*Pi};
//+
Physical Surface("Reaction", 3) = {1};
