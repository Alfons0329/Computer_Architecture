module full_add(x,y,cin,s,cout);

	input wire x,y,cin;
	output wire s,cout;
         // wires (from ands to or)
   wire w1, w2, w3;
         
         // carry-out circuitry
   and( w1, x, y);
   and( w2, x, cin );
   and( w3, y, cin );
   assign cout= |{w1,w2,w3};
         
         // sum
   xor( s, x, y, cin );
	//assign  {cout,s}=x+y+cin;
endmodule
