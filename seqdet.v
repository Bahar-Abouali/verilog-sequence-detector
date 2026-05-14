module seqdet (
    input clk, reset, a,
    output reg y
);

parameter [3:0]
   INIT  = 4'b0000,
   G0    = 4'b0001,
   G00   = 4'b0010,
   G001  = 4'b0011,
   G0010 = 4'b0100,
   G1    = 4'b0101,
   G10   = 4'b0110,
   G100  = 4'b0111,
   G1001 = 4'b1000;

reg [3:0] Pstate, nstate;

always @(posedge clk)
   if (reset)
      Pstate <= INIT;
    else
       Pstate <= nstate;

always @(Pstate, a) begin
    nstate = INIT;
    y = 0;
    case (Pstate)
        INIT : if (a==1)
                    nstate = G1;
                else
                    nstate = G0;

        G0   : if (a==1)
                    nstate = G1;
                else
                    nstate = G00;

        G00  : if (a==1)
                    nstate = G001;
                else
                    nstate = G00;

        G001 : if (a==1)
                    nstate = G1;
                else begin
                    nstate = G0010;
                    y = 1;
                end

        G0010: if (a==1)
                    nstate = G1;
                else
                    nstate = G100;


        G1   : if (a==1)
                    nstate = G1;
                else
                    nstate = G10;

        G10  : if (a==1)
                    nstate = G1;
                else
                    nstate = G100;

        G100 : if (a==1) begin
                        nstate = G1001;
                        y = 1;
                    end
                    else
                        nstate = G00;

        G1001: if (a==1)
                        nstate = G1;
                    else begin
                        nstate = G0010;
                        y = 1;
                    end
        
    endcase
end

endmodule
