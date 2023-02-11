import geometry;

settings.outformat = "svg";
defaultpen(fontsize(8pt));
unitsize(1cm);
size(150, 0);

perpfactor = .5;

pair A = (0, 0);
pair B = (2, 4.5);
pair C = (5, .2);

pair A1 = extension(B, C, A, dir(A--C, A--B) + A);
pair B1 = extension(A, C, B, dir(B--C, B--A) + B);

pair M = A1 - (A1 - B1) / 3;

pair M1 = (M + reflect(B, C) * M)/2;
pair M2 = (M + reflect(A, C) * M)/2;
pair M3 = (M + reflect(A, B) * M)/2;

pair At1 = (A1 + reflect(A, B) * A1)/2;
pair At2 = (A1 + reflect(A, C) * A1)/2;

pair Bt1 = (B1 + reflect(A, B) * B1)/2;
pair Bt2 = (B1 + reflect(B, C) * B1)/2;

draw(A -- B -- C -- cycle);

draw(A -- A1);
draw(B -- B1);
draw(B1 -- M, red, L=Label("$y$", position=MidPoint, align=W));
draw(M -- A1, red, L=Label("$x$", position=MidPoint, align=W));


draw(M -- M1, blue);
draw(M -- M2, blue);
draw(M -- M3, blue);

draw(B1 -- Bt1, blue+dashed, L=Label("$a$", position=MidPoint));
draw(B1 -- Bt2, blue+dashed, L=Label("$a$", position=MidPoint));

draw(A1 -- At1, darkgreen+dashed, L=Label("$b$", position=MidPoint));
draw(A1 -- At2, darkgreen+dashed, L=Label("$b$", position=MidPoint));

markrightangle(M, M1, C, blue);
markrightangle(M, M2, A, blue);
markrightangle(M, M3, B, blue);

markrightangle(B1, Bt1, B, blue);
markrightangle(B1, Bt2, C, blue);

markrightangle(A1, At1, B, darkgreen);
markrightangle(A1, At2, C, darkgreen);

markangle(2, A1, A, B, radius=10);
markangle(2, C, A, A1, radius=8);

markangle(1, A, B, B1, radius=10);
markangle(1, B1, B, C, radius=8);

dot(M, red);
dot(A1, red);
dot(B1, red);

dot(M1, blue);
dot(M2, blue);
dot(M3, blue);

label("$A$", A, W);
label("$B$", B, N);
label("$C$", C, E);

label("$A_1$", A1, E, red);
label("$B_1$", B1, S, red);
label("$M$", M, W, red);
label("$M_1$", M1, E, blue);
label("$M_2$", M2, S, blue);
label("$M_3$", M3, W, blue);
