// Basic DFF
module \$_DFF_P_ (D, C, Q);
    input D;
    input C;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dff _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C));
endmodule

// Async active-high reset
module \$_DFF_PP0_ (D, C, R, Q);
    input D;
    input C;
    input R;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffr _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .R(R));
endmodule

// Async active-high set
module \$_DFF_PP1_ (D, C, R, Q);
    input D;
    input C;
    input R;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffs _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .S(R));
endmodule

// Async active-low reset
module \$_DFF_PN0_ (D, C, R, Q);
    input D;
    input C;
    input R;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffrn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .RN(R));
endmodule

// Async active-low set
module \$_DFF_PN1_ (D, C, R, Q);
    input D;
    input C;
    input R;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffsn _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .SN(R));
endmodule
