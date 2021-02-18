syms wx wy wz;
w = [wx; wy; wz];
R = sym('R',[3,3]);

syms tx ty tz;

Rz = [
    cos(tz) -sin(tz) 0;
    sin(tz) cos(tz) 0;
    0 0 1
]


Ry = [
    cos(ty) 0 sin(ty);
    0 1 0;
    -sin(ty) 0 cos(ty)
]

Rx = [
    1 0 0;
    0 cos(tx) -sin(tx);
    0 sin(tx) cos(tx)

]


RR = simplify(Rx*Ry*Rz)


skw = SkewSymmetrical(w);
exp1 = SkewSymmetrical(RR*w);
exp2 = expand(RR*skw*transpose(RR));
diff = exp1 - exp2;
simplify(diff)

