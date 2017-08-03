----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.07.2017 21:25:40
-- Design Name: 
-- Module Name: tam_toplayici1 - Behavioral
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

entity tam_toplayici1 is                        --ana devresi olan dort_bit_toplayicidan gelen port aamalýrýnýn altdevresi olan tam toplayici devresinin port tanýmlamalarý
    Port ( in_giris_elde : in STD_LOGIC;
           in_giris1 : in STD_LOGIC;
           in_giris2 : in STD_LOGIC;
           out_cikis : out STD_LOGIC;
           out_cikis_elde : out STD_LOGIC);
end tam_toplayici1;

architecture Behavioral of tam_toplayici1 is

begin
out_cikis <= in_giris_elde xor in_giris1 xor in_giris2;    --in_giris_elde veya in_giris1 veyain_giris2 si herhangi birisi 1 oldugunda out_cikisi1 yap
out_cikis_elde <= (in_giris_elde and in_giris1) or         --in_giris_elde ve in_giris1 veya  
                  (in_giris_elde and in_giris2) or         --in_giris_elde ve in_giris2 veya
                  (in_giris1 and in_giris2);               --in_giris1 ve in_giris2 her hangi birisi bir oldugunda out_cikis_elde 1 yap
end Behavioral;
