--------------------------------------
-- Projet : Gestion de Monnaie pour
-- un Distributeur de Cafe 1er annee
-- Master Technologies Immersives
-- Realisé par :
-- Yacine BENDNAIBA
-- Soufiane SALIKI
-- Oumaima AIT EL MOUDENE
--------------------------------------

Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Distributeur is
	port (
		rst : in std_logic;
		clk : in std_logic;
		voy_cafe_delivre, voy_monnaie_insuff : out std_logic := '0';
		piece_monnaie : in std_logic_vector(2 downto 0);
		cafe_type : in std_logic_vector(2 downto 0);
		somme_monnaie : out std_logic_vector(7 downto 0);
		reste_monnaie : out std_logic_vector(7 downto 0)
	);
end Distributeur;

architecture gestion_monnaie of Distributeur is

signal somme : std_logic_vector(7 downto 0) := (others => '0');
signal reste : std_logic_vector(7 downto 0) := (others => 'Z');
signal cafe_choix : std_logic_vector(2 downto 0) := (others => '0');
-- prix des cafe
constant cafe_au_lait_prix : std_logic_vector(7 downto 0) := "00001010"; -- 10 DH
constant Americano_prix : std_logic_vector(7 downto 0) := "00001100"; -- 12 DH
constant Cappuccino_prix : std_logic_vector(7 downto 0) := "00000111"; -- 7 DH
constant Espresso_prix : std_logic_vector(7 downto 0) := "00001001"; -- 9 DH
