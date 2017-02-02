----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/02/2017 03:27:15 PM
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- Check component, 

entity top is
    port ( a     :  in STD_LOGIC;
           b     :  in STD_LOGIC;
           c_in  :  in STD_LOGIC;
           c_out :  out STD_LOGIC;
           s     :  out STD_LOGIC);
end top;

architecture Behavioral of top is
begin
    
    process(a, b, c_in)
    begin
        s <= ((a xor b) xor c_in);
        c_out <= ((a xor b) and c_in);
    end process;

end Behavioral;
