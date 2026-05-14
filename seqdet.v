module seqdet(input clk, reset, a output y);

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
always @(posedge clk )
   if (reset)
      Pstate = INIT;
    else
       Pstate = nstate;

always @(Pstate, a) begin
    case (Pstate)
        INIT : begin if (a==1)
                        nstate = G1;
                    else
                        nstate = G0;
                    y = 0;
        end

        G0   : begin if (a==1)
                        nstate = G1;
                    else
                        nstate = G00;
                    y = 0;
        end

        G00  : begin if (a==1)
                        nstate = G001;
                    else
                        nstate = G00;
                    y = 0;
        end

        G001 : begin if (a==1)
                        nstate = G1;
                    else
                        nstate = G0010;
                        y = 1;
        end

        G0010: begin if (a==1)
                        nstate = G1;
                    else
                        nstate = G100;
                    y = 0;
        end

        G1   : begin if (a==1)
                        nstate = G1;
                    else
                        nstate = G10;
                    y = 0;
        end

        G10  : begin if (a==1)
                        nstate = G1;
                    else
                        nstate = G100;
                    y = 0;
        end

        G100 : begin if (a==1)
                        nstate = G1001;
                        y = 1
                    else
                        nstate = G00;
        end

        G1001: begin if (a==1)
                        nstate = G1;
                    else
                        nstate = G0010;
                        y = 1
        end
        
    endcase
end