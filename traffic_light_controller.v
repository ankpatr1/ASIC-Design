module traffic_light_controller (
    input clk,
    input rst,
    output reg [1:0] ns_light,
    output reg [1:0] ew_light,
    output reg [1:0] sn_light,
    output reg [1:0] we_light
);

parameter RED = 2'b00, GREEN = 2'b01, YELLOW = 2'b10;

// State encoding
parameter NS_GREEN = 3'd0,
          NS_YELLOW = 3'd1,
          EW_GREEN = 3'd2,
          EW_YELLOW = 3'd3,
          SN_GREEN = 3'd4,
          SN_YELLOW = 3'd5,
          WE_GREEN = 3'd6,
          WE_YELLOW = 3'd7;

reg [2:0] state, next_state;
reg [4:0] timer;

parameter GREEN_TIME = 10;
parameter YELLOW_TIME = 3;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= NS_GREEN;
        timer <= GREEN_TIME;
    end else if (timer == 0) begin
        state <= next_state;
        if (next_state == NS_YELLOW || next_state == EW_YELLOW ||
            next_state == SN_YELLOW || next_state == WE_YELLOW)
            timer <= YELLOW_TIME;
        else
            timer <= GREEN_TIME;
    end else begin
        timer <= timer - 1;
    end
end

always @(*) begin
    case (state)
        NS_GREEN:   next_state = NS_YELLOW;
        NS_YELLOW:  next_state = EW_GREEN;
        EW_GREEN:   next_state = EW_YELLOW;
        EW_YELLOW:  next_state = SN_GREEN;
        SN_GREEN:   next_state = SN_YELLOW;
        SN_YELLOW:  next_state = WE_GREEN;
        WE_GREEN:   next_state = WE_YELLOW;
        WE_YELLOW:  next_state = NS_GREEN;
        default:    next_state = NS_GREEN;
    endcase
end

always @(*) begin
    ns_light = RED;
    ew_light = RED;
    sn_light = RED;
    we_light = RED;

    case (state)
        NS_GREEN:   ns_light = GREEN;
        NS_YELLOW:  ns_light = YELLOW;
        EW_GREEN:   ew_light = GREEN;
        EW_YELLOW:  ew_light = YELLOW;
        SN_GREEN:   sn_light = GREEN;
        SN_YELLOW:  sn_light = YELLOW;
        WE_GREEN:   we_light = GREEN;
        WE_YELLOW:  we_light = YELLOW;
    endcase
end

endmodule
