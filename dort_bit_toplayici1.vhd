library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity dort_bit_toplayici1 is                                        --dort_bit_toplayicinin port tanımlamalari
    Port ( in_giris_elde : in STD_LOGIC;                            -- in_giris_elde portu in modunda std_logic_vector tipindedir.
           in_giris1 : in STD_LOGIC_VECTOR (3 downto 0);            -- in_giris_1 portu in modunda  4 bitlik std_logic_vector tipindedir.
           in_giris2 : in STD_LOGIC_VECTOR (3 downto 0);            -- in_giris_2 portu in modunda  4 bitlik std_logic_vector tipindedir.
           out_cikis : out STD_LOGIC_VECTOR (3 downto 0);           -- out_cikis portu out modunda  4 bitlik std_logic_vector tipindedir. 
           out_cikis_elde : out STD_LOGIC             );              -- out_cikis_elde portu out modunda std_logic_vector tipindedir.       
 end dort_bit_toplayici1;                                             -- port tanımlamaları sonlandı.

architecture Behavioral of dort_bit_toplayici1 is                     
   component tam_toplayici1                                        -- tam_toplayici alt devresinin tanımlama işlemleri(component birden fazla devrelerdeki pin haberlesmesini saglar.)
      port(
           in_giris_elde : in std_logic;
           in_giris1 : in std_logic;
           in_giris2 : in std_logic;
           out_cikis : out std_logic;
           out_cikis_elde :out std_logic   );
   end component;
   signal r_elde : std_logic_vector(1 to 3);                    
begin
    adim_0: tam_toplayici1 port map (                 --port map ile adım0 tam toplayici devresine port atamalarını yapıyoruz. alt devreye bu portlar giris olarak atanıyor.
            in_giris_elde,in_giris1(0),
            in_giris2(0),out_cikis(0),r_elde(1));
    adim_1:tam_toplayici1 port map (                  -- adım0 daki cıkıslar cıkısa elde degeri adım1 aktarılıyor
             r_elde(1),in_giris1(1),
             in_giris2(1),out_cikis(1),r_elde(2));
    adim_2:tam_toplayici1 port map (            --adım1 de de r_elde(1) degeriile diger giris portlarını tam toplayıcı ya atanıyor sonuclar out_cıkıs(1) le r_elde(2)ye aktarılıyor.
          r_elde(2),in_giris1(2),
          in_giris2(2),out_cikis(2),r_elde(3)); --adım2 de de r_elde(2) degeri ile diger giris portlarını tam toplayiciya atanıyor sonuclar out cıkıs(2) le r_elde(3) e aktarılıyor.        
    adim_3: tam_toplayici1 port map (                           
            in_giris_elde => r_elde(3),                           -- adım3 de de r_elde(3) sinyali tam_toplayici alt devresinin in_giris_elde giris portuna bağlanmıştır.
            in_giris1=>in_giris1(3),                              --in_giris1(3) ve in_giris2(3)giris portlaro alt devreye giris olarak verilmistir.
            in_giris2=>in_giris2(3),
            out_cikis=>out_cikis(3),
            out_cikis_elde=>out_cikis_elde
            );
end Behavioral;
