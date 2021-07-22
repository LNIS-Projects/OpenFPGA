// Basic DFF
module \$_DFF_P_ (D, C, Q);
    input D;
    input C;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dff _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C));
endmodule

// Async reset
module \$_DFF_PP0_ (D, C, R, Q);
    input D;
    input C;
    input R;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffr _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .R(R));
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

// Async reset, enable
module  \$_DFFE_PP0P_ (D, C, E, R, Q);
    input D;
    input C;
    input E;
    input R;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffre  _TECHMAP_REPLACE_ (.D(D), .Q(Q), .C(C), .E(E), .R(R));
endmodule

// Latch with Async reset, enable
module  \$_DLATCH_PP0_ (input E, R, D, output Q);
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    latchre _TECHMAP_REPLACE_ (.D(D), .Q(Q), .E(1'b1), .G(E),  .R(R));
endmodule

// The following techmap operation are not performed right now
// as Negative edge FF are not legalized in synth_quicklogic for qlf_k6n10
// but in case we implement clock inversion in the future, the support is ready for it.
module \$_DFF_N_ (D, C, Q);
    input D;
    input C;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dff #(.IS_C_INVERTED(1'b1)) _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C));
endmodule

module \$_DFF_NP0_ (D, C, R, Q);
    input D;
    input C;
    input R;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffr #(.IS_C_INVERTED(1'b1)) _TECHMAP_REPLACE_ (.Q(Q), .D(D), .C(C), .R(R));
endmodule

module  \$_DFFE_NP0P_ (D, C, E, R, Q);
    input D;
    input C;
    input E;
    input R;
    output Q;
    parameter _TECHMAP_WIREINIT_Q_ = 1'bx;
    dffre  #(.IS_C_INVERTED(1'b1)) _TECHMAP_REPLACE_ (.D(D), .Q(Q), .C(C), .E(E), .R(R));
endmodule
