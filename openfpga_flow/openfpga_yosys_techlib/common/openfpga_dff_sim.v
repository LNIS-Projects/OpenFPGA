(* abc9_flop, lib_whitebox *)
module dff(
    output reg Q,
    input D,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C)
                Q <= D;
          1'b1:
            always @(negedge C)
                Q <= D;
    endcase
endmodule

(* abc9_flop, lib_whitebox *)
module dffr(
    output reg Q,
    input D,
    input R,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or posedge R)
                if (R == 1'b1)
                        Q <= 1'b0;
                else
                        Q <= D;
          1'b1:
            always @(negedge C or posedge R)
                if (R == 1'b1)
                        Q <= 1'b0;
                else
                        Q <= D;
    endcase
endmodule

(* abc9_flop, lib_whitebox *)
module dffre(
    output reg Q,
    input D,
    input R,
    input E,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or posedge R)
              if (R == 1'b1)
                Q <= 1'b0;
              else if(E)
                Q <= D;
          1'b1:
            always @(negedge C or posedge R)
              if (R == 1'b1)
                Q <= 1'b0;
              else if(E)
                Q <= D;
        endcase
endmodule

//-----------------------------
// D-type flip-flop with active-low asynchronous reset
//-----------------------------
(* abc9_flop, lib_whitebox *)
module dffrn(
    output reg Q,
    input D,
    input RN,
    (* clkbuf_sink *)
    (* invertible_pin = "IS_C_INVERTED" *)
    input C
);
    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    initial Q = INIT;
    case(|IS_C_INVERTED)
          1'b0:
            always @(posedge C or negedge RN)
                if (RN == 1'b0)
                        Q <= 1'b0;
                else
                        Q <= D;
          1'b1:
            always @(negedge C or negedge RN)
                if (RN == 1'b0)
                        Q <= 1'b0;
                else
                        Q <= D;
    endcase
endmodule

(* abc9_flop, lib_whitebox *)
module latchre (
    output reg Q,
    input S,
    input R,
    input D,
    input G,
    input E
);
    parameter [0:0] INIT = 1'b0;
    initial Q = INIT;
    always @*
            begin
              if (R) Q <= 1'b0;
              if (S) Q <= 1'b1;
            else if (E && G) Q <= D;
    end
endmodule
