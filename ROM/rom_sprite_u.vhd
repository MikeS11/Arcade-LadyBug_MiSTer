library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity rom_sprite_u is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(11 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of rom_sprite_u is
	type rom is array(0 to  4095) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"07",X"00",X"35",X"00",X"55",X"01",X"DD",
		X"00",X"00",X"00",X"00",X"00",X"00",X"55",X"00",X"55",X"40",X"55",X"00",X"C0",X"00",X"00",X"00",
		X"01",X"54",X"01",X"DC",X"01",X"50",X"01",X"D0",X"00",X"50",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"2A",X"00",X"AA",X"00",X"AA",X"02",X"AA",
		X"00",X"00",X"00",X"00",X"00",X"00",X"55",X"40",X"95",X"00",X"95",X"00",X"A9",X"00",X"A0",X"00",
		X"02",X"AA",X"02",X"AA",X"02",X"AB",X"02",X"BE",X"00",X"AA",X"00",X"28",X"00",X"00",X"00",X"00",
		X"A0",X"00",X"80",X"00",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"02",X"00",X"0A",X"00",X"0A",X"00",X"2A",
		X"00",X"00",X"00",X"00",X"00",X"00",X"B5",X"40",X"BD",X"00",X"AD",X"00",X"AB",X"00",X"A8",X"00",
		X"00",X"2A",X"00",X"AA",X"00",X"AA",X"02",X"A8",X"02",X"A0",X"00",X"00",X"00",X"00",X"00",X"00",
		X"A0",X"00",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"28",X"00",X"AA",X"02",X"AA",
		X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"40",X"05",X"00",X"04",X"00",X"10",X"00",X"54",X"40",
		X"02",X"AA",X"00",X"AE",X"00",X"28",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"41",X"40",X"10",X"00",X"04",X"00",X"05",X"00",X"01",X"40",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"00",X"01",X"00",X"15",
		X"00",X"00",X"00",X"00",X"00",X"00",X"44",X"00",X"11",X"00",X"44",X"00",X"11",X"00",X"40",X"00",
		X"00",X"10",X"01",X"55",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"11",X"00",X"54",X"40",X"11",X"00",X"44",X"40",X"11",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"2A",X"00",X"AA",X"00",X"AA",X"02",X"AA",X"02",X"AA",
		X"00",X"00",X"00",X"00",X"00",X"00",X"A0",X"00",X"A8",X"00",X"A5",X"00",X"A9",X"00",X"A5",X"00",
		X"02",X"AA",X"02",X"AA",X"00",X"AA",X"00",X"AF",X"00",X"2A",X"00",X"00",X"00",X"00",X"00",X"00",
		X"A9",X"40",X"A5",X"00",X"E9",X"00",X"A5",X"00",X"A0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"0A",X"00",X"AA",X"02",X"A5",X"00",X"95",X"01",X"55",
		X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"00",X"A0",X"00",X"A0",X"00",X"40",X"00",X"50",X"00",
		X"01",X"55",X"00",X"95",X"02",X"A5",X"00",X"AA",X"00",X"0A",X"00",X"00",X"00",X"00",X"00",X"00",
		X"5A",X"00",X"40",X"00",X"A0",X"00",X"A0",X"00",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"AA",X"02",X"A9",X"03",X"A5",X"01",X"66",
		X"00",X"00",X"00",X"00",X"00",X"00",X"10",X"00",X"50",X"00",X"68",X"00",X"9A",X"00",X"96",X"80",
		X"02",X"5A",X"03",X"96",X"02",X"A5",X"03",X"A5",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"A5",X"80",X"A5",X"00",X"A5",X"00",X"41",X"00",X"40",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"00",X"0F",
		X"00",X"00",X"00",X"00",X"00",X"00",X"02",X"00",X"16",X"80",X"F5",X"00",X"FD",X"00",X"FC",X"00",
		X"00",X"3F",X"00",X"FF",X"03",X"FF",X"03",X"FC",X"03",X"F0",X"00",X"00",X"00",X"00",X"00",X"00",
		X"F0",X"00",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"55",
		X"00",X"00",X"00",X"00",X"00",X"00",X"28",X"00",X"AA",X"00",X"BA",X"00",X"BA",X"80",X"5A",X"80",
		X"01",X"55",X"01",X"54",X"00",X"50",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"5A",X"80",X"BA",X"80",X"BA",X"00",X"AA",X"00",X"28",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"02",X"00",X"2A",X"00",X"AE",X"02",X"AA",
		X"00",X"00",X"00",X"00",X"00",X"00",X"2A",X"00",X"AA",X"80",X"BA",X"80",X"AA",X"80",X"AB",X"80",
		X"02",X"AA",X"02",X"AA",X"02",X"AB",X"02",X"EA",X"00",X"AA",X"00",X"00",X"00",X"00",X"00",X"00",
		X"AA",X"00",X"A0",X"00",X"80",X"00",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"3C",X"00",X"FF",X"03",X"AA",X"02",X"FF",X"03",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"C0",X"00",X"B0",X"00",X"D5",X"40",
		X"02",X"AA",X"03",X"FF",X"02",X"FF",X"00",X"BE",X"00",X"28",X"00",X"00",X"00",X"00",X"00",X"00",
		X"B4",X"00",X"E0",X"00",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"00",X"0B",X"00",X"2E",X"00",X"BA",
		X"00",X"00",X"00",X"00",X"00",X"00",X"D4",X"00",X"F5",X"00",X"FD",X"40",X"F5",X"40",X"FF",X"40",
		X"02",X"AA",X"03",X"AB",X"03",X"EA",X"00",X"FA",X"00",X"3E",X"00",X"00",X"00",X"00",X"00",X"00",
		X"EF",X"00",X"AC",X"00",X"B0",X"00",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"02",X"00",X"0A",X"00",X"08",X"00",X"08",X"00",X"02",
		X"00",X"00",X"00",X"00",X"00",X"00",X"02",X"80",X"2A",X"80",X"AA",X"80",X"A8",X"00",X"80",X"00",
		X"00",X"D2",X"03",X"F4",X"03",X"FD",X"03",X"FF",X"03",X"FC",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"AA",X"00",X"0A",X"80",X"02",X"80",X"00",X"80",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"02",X"00",X"0A",X"00",X"2A",
		X"00",X"00",X"00",X"00",X"00",X"00",X"3F",X"C0",X"AF",X"00",X"AB",X"00",X"AB",X"00",X"A8",X"00",
		X"00",X"AA",X"00",X"AA",X"02",X"A0",X"02",X"80",X"02",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"A0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",
		X"00",X"00",X"00",X"00",X"00",X"00",X"28",X"80",X"88",X"80",X"22",X"00",X"68",X"80",X"58",X"80",
		X"00",X"15",X"03",X"55",X"03",X"D5",X"00",X"F4",X"00",X"3C",X"00",X"00",X"00",X"00",X"00",X"00",
		X"40",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"02",X"00",X"2A",X"00",X"AA",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"AA",X"00",X"AA",X"00",X"AA",X"00",X"A8",X"00",
		X"02",X"AA",X"02",X"AA",X"02",X"AA",X"02",X"AA",X"02",X"A0",X"00",X"00",X"00",X"00",X"00",X"00",
		X"A0",X"00",X"A0",X"00",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"00",X"01",X"00",X"15",X"00",X"55",X"00",X"05",
		X"00",X"00",X"00",X"00",X"00",X"00",X"02",X"00",X"50",X"80",X"55",X"00",X"54",X"80",X"40",X"80",
		X"00",X"05",X"00",X"55",X"00",X"54",X"01",X"55",X"00",X"10",X"00",X"00",X"00",X"00",X"00",X"00",
		X"42",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"0A",X"00",X"02",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"00",X"A0",X"00",
		X"00",X"02",X"00",X"0A",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"A0",X"00",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"2A",X"00",X"0A",X"00",X"02",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"00",X"A8",X"00",X"A8",X"00",
		X"00",X"02",X"00",X"0A",X"00",X"2A",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"A8",X"00",X"A8",X"00",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"2A",X"00",X"0A",X"00",X"02",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"00",X"A8",X"00",X"AA",X"00",X"AA",X"00",
		X"00",X"00",X"00",X"02",X"00",X"0A",X"00",X"2A",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"AA",X"00",X"AA",X"00",X"A8",X"00",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"2A",X"00",X"0A",X"00",X"02",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"00",X"A0",X"00",X"A2",X"00",X"8A",X"80",X"08",X"80",
		X"00",X"00",X"00",X"00",X"00",X"02",X"00",X"0A",X"00",X"2A",X"00",X"00",X"00",X"00",X"00",X"00",
		X"08",X"80",X"8A",X"80",X"A2",X"00",X"A0",X"00",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"2A",X"00",X"0A",X"00",X"02",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"80",X"00",X"A0",X"00",X"A0",X"00",X"80",X"80",X"02",X"A0",X"02",X"20",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"02",X"00",X"0A",X"00",X"2A",X"00",X"00",X"00",X"00",
		X"02",X"20",X"02",X"A0",X"80",X"80",X"A0",X"00",X"A0",X"00",X"80",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"0A",X"00",X"02",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"A0",X"00",X"A8",X"00",X"A8",X"00",X"20",X"20",X"00",X"A8",X"00",X"88",X"00",X"88",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"02",X"00",X"0A",X"00",X"00",
		X"00",X"88",X"00",X"88",X"00",X"A8",X"20",X"20",X"A8",X"00",X"A8",X"00",X"A0",X"00",X"00",X"00",
		X"00",X"0A",X"00",X"02",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"A0",X"00",X"A8",X"00",X"A8",X"00",X"20",X"00",X"00",X"08",X"00",X"2A",X"00",X"22",X"00",X"22",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"02",X"00",X"0A",
		X"00",X"22",X"00",X"22",X"00",X"2A",X"00",X"08",X"20",X"00",X"A8",X"00",X"A8",X"00",X"A0",X"00",
		X"00",X"00",X"00",X"00",X"15",X"00",X"55",X"40",X"45",X"54",X"05",X"55",X"15",X"55",X"55",X"55",
		X"02",X"55",X"00",X"55",X"00",X"55",X"01",X"55",X"05",X"55",X"55",X"55",X"55",X"55",X"55",X"55",
		X"55",X"55",X"55",X"40",X"55",X"00",X"54",X"00",X"54",X"00",X"54",X"00",X"14",X"00",X"50",X"00",
		X"55",X"55",X"55",X"55",X"01",X"55",X"00",X"05",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"55",X"55",X"55",X"55",X"55",X"D5",X"57",X"F5",X"57",X"F1",X"57",X"C0",X"14",X"00",X"50",X"00",
		X"55",X"95",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"15",X"55",X"05",X"55",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"01",X"55",X"00",X"55",X"00",X"15",X"00",X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"3F",X"00",X"FF",X"C0",X"CF",X"FC",X"0F",X"FF",X"3F",X"FF",X"FF",X"FF",
		X"05",X"55",X"01",X"55",X"00",X"D5",X"03",X"FE",X"0F",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"C0",X"FF",X"00",X"FC",X"00",X"FC",X"00",X"FC",X"00",X"3C",X"00",X"F0",X"00",
		X"FF",X"FF",X"FF",X"FF",X"03",X"FF",X"00",X"0F",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FD",X"55",X"FD",X"55",X"F5",X"57",X"F5",X"5F",X"D5",X"43",X"F5",X"40",X"14",X"00",X"F0",X"00",
		X"55",X"65",X"55",X"55",X"55",X"55",X"D5",X"55",X"D5",X"55",X"F5",X"55",X"35",X"55",X"0D",X"55",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"03",X"55",X"00",X"D5",X"00",X"35",X"00",X"0D",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"56",X"55",X"56",X"55",X"5A",X"55",X"42",
		X"5A",X"AA",X"6A",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",
		X"55",X"00",X"54",X"00",X"50",X"00",X"40",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"0A",X"AA",X"00",X"2A",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"56",X"55",X"5A",X"55",X"6A",X"55",X"EA",X"57",X"F2",
		X"5A",X"AA",X"6A",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",
		X"5F",X"C0",X"7F",X"00",X"FC",X"00",X"F0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"0A",X"AA",X"00",X"2A",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"55",X"5A",X"56",X"AA",X"AA",X"AA",X"AA",X"AA",X"EA",X"AA",X"FE",X"AA",X"FF",X"EA",X"FF",X"C2",
		X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",
		X"FF",X"00",X"FC",X"00",X"F0",X"00",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"0A",X"AA",X"00",X"2A",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"56",X"55",X"56",X"55",X"5A",X"55",X"52",
		X"5A",X"AA",X"6A",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",
		X"55",X"40",X"55",X"00",X"54",X"00",X"50",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"0A",X"AA",X"00",X"2A",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"55",X"55",X"A9",X"55",X"AA",X"A5",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"A8",
		X"55",X"55",X"55",X"54",X"55",X"50",X"55",X"50",X"95",X"40",X"95",X"40",X"55",X"00",X"55",X"00",
		X"AA",X"00",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"00",X"00",
		X"54",X"00",X"57",X"00",X"5F",X"C0",X"53",X"F0",X"54",X"FC",X"14",X"3C",X"17",X"3C",X"50",X"F0",
		X"55",X"55",X"A9",X"55",X"AA",X"A5",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"AA",X"A8",
		X"55",X"55",X"55",X"56",X"55",X"5A",X"55",X"5A",X"95",X"6A",X"95",X"40",X"55",X"00",X"55",X"00",
		X"AA",X"00",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"00",X"00",
		X"54",X"00",X"D5",X"00",X"F5",X"40",X"F1",X"50",X"F0",X"50",X"3C",X"14",X"3D",X"14",X"F0",X"50",
		X"00",X"01",X"00",X"45",X"00",X"14",X"00",X"00",X"00",X"00",X"00",X"03",X"00",X"00",X"00",X"00",
		X"C0",X"05",X"F0",X"00",X"F0",X"00",X"3C",X"00",X"0C",X"00",X"3C",X"00",X"F0",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"55",X"55",X"A9",X"55",X"AA",X"A5",X"AA",X"A5",X"AA",X"A5",X"AA",X"96",X"AA",X"96",X"AA",X"5A",
		X"56",X"AA",X"6A",X"AA",X"6A",X"A9",X"AA",X"A9",X"AA",X"A5",X"AA",X"A5",X"AA",X"95",X"AB",X"C0",
		X"AA",X"5A",X"AA",X"94",X"00",X"04",X"01",X"14",X"00",X"50",X"00",X"00",X"00",X"00",X"00",X"00",
		X"83",X"F0",X"00",X"FC",X"00",X"3C",X"00",X"0F",X"00",X"03",X"00",X"CF",X"00",X"3C",X"00",X"00",
		X"55",X"55",X"95",X"55",X"A5",X"55",X"A5",X"55",X"A5",X"75",X"A5",X"75",X"25",X"F5",X"15",X"D5",
		X"55",X"40",X"55",X"40",X"55",X"40",X"55",X"40",X"D5",X"40",X"D5",X"40",X"F5",X"40",X"55",X"40",
		X"17",X"D5",X"17",X"D5",X"5F",X"55",X"5F",X"55",X"5D",X"55",X"7D",X"45",X"3D",X"54",X"05",X"40",
		X"55",X"00",X"55",X"00",X"54",X"00",X"54",X"00",X"50",X"00",X"40",X"00",X"00",X"00",X"00",X"00",
		X"55",X"55",X"95",X"55",X"A5",X"55",X"A5",X"55",X"A5",X"5D",X"A5",X"5D",X"29",X"5F",X"09",X"5F",
		X"55",X"54",X"5D",X"54",X"5F",X"54",X"5C",X"55",X"57",X"55",X"55",X"55",X"55",X"55",X"55",X"55",
		X"01",X"5F",X"01",X"57",X"00",X"57",X"00",X"57",X"00",X"17",X"00",X"17",X"00",X"07",X"00",X"00",
		X"D5",X"54",X"D5",X"54",X"35",X"54",X"35",X"44",X"0D",X"54",X"3D",X"50",X"05",X"00",X"00",X"00",
		X"55",X"55",X"95",X"55",X"A5",X"55",X"A5",X"55",X"A5",X"55",X"A5",X"5D",X"25",X"73",X"15",X"C3",
		X"55",X"50",X"55",X"50",X"75",X"50",X"7D",X"50",X"71",X"54",X"5D",X"54",X"55",X"54",X"55",X"54",
		X"15",X"C3",X"15",X"C0",X"17",X"00",X"17",X"00",X"17",X"00",X"1C",X"00",X"00",X"00",X"00",X"00",
		X"55",X"50",X"D5",X"50",X"D5",X"50",X"D4",X"40",X"35",X"40",X"F5",X"00",X"14",X"00",X"00",X"00",
		X"55",X"55",X"95",X"55",X"A5",X"55",X"A5",X"55",X"A5",X"55",X"A5",X"75",X"25",X"75",X"15",X"F5",
		X"55",X"40",X"55",X"40",X"55",X"40",X"75",X"40",X"F5",X"40",X"C5",X"40",X"D5",X"40",X"55",X"40",
		X"15",X"F5",X"15",X"F5",X"17",X"35",X"17",X"35",X"17",X"35",X"1C",X"35",X"00",X"F5",X"00",X"15",
		X"55",X"40",X"55",X"40",X"55",X"00",X"55",X"00",X"55",X"00",X"14",X"00",X"50",X"00",X"40",X"00",
		X"55",X"55",X"95",X"55",X"A5",X"55",X"A5",X"55",X"A5",X"55",X"A5",X"75",X"25",X"75",X"15",X"F5",
		X"55",X"40",X"55",X"40",X"55",X"40",X"55",X"40",X"75",X"40",X"F5",X"40",X"35",X"40",X"D5",X"40",
		X"15",X"F5",X"15",X"D5",X"17",X"D5",X"17",X"D5",X"17",X"55",X"1F",X"55",X"03",X"55",X"01",X"50",
		X"55",X"00",X"55",X"00",X"54",X"00",X"54",X"00",X"50",X"00",X"50",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"15",X"41",X"55",X"55",X"55",X"55",X"7F",X"55",X"CD",X"55",X"55",X"55",X"55",
		X"00",X"00",X"40",X"00",X"50",X"00",X"54",X"00",X"55",X"00",X"55",X"40",X"55",X"40",X"55",X"40",
		X"55",X"55",X"55",X"55",X"55",X"CD",X"55",X"7F",X"55",X"55",X"01",X"55",X"00",X"15",X"00",X"00",
		X"55",X"40",X"55",X"40",X"55",X"40",X"55",X"00",X"54",X"00",X"50",X"00",X"40",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"40",X"00",X"55",X"40",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"50",X"00",X"54",X"00",X"55",X"00",X"55",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"40",X"00",X"55",X"40",X"55",X"55",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"40",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"50",X"00",X"55",X"54",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",
		X"00",X"00",X"00",X"00",X"00",X"00",X"40",X"00",X"50",X"00",X"54",X"00",X"55",X"00",X"55",X"00",
		X"02",X"A9",X"02",X"A9",X"02",X"AA",X"0F",X"AA",X"FF",X"AA",X"03",X"AA",X"0F",X"EA",X"FF",X"EA",
		X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"95",X"55",X"A5",X"55",X"A9",X"55",X"AA",X"55",
		X"FF",X"FA",X"FF",X"FA",X"FF",X"CE",X"FF",X"02",X"FC",X"00",X"FC",X"00",X"3C",X"00",X"F0",X"00",
		X"AA",X"95",X"AA",X"95",X"AA",X"A5",X"AA",X"A5",X"AA",X"A5",X"AA",X"95",X"2A",X"95",X"0A",X"95",
		X"02",X"A9",X"02",X"A9",X"02",X"AA",X"00",X"AA",X"00",X"AA",X"00",X"AA",X"00",X"2A",X"00",X"2A",
		X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"95",X"55",X"A5",X"55",X"A9",X"55",X"AA",X"55",
		X"00",X"0A",X"00",X"0A",X"00",X"0E",X"05",X"7E",X"15",X"53",X"01",X"57",X"15",X"55",X"55",X"55",
		X"AA",X"95",X"AA",X"95",X"AA",X"A5",X"AA",X"A5",X"AA",X"A5",X"AA",X"95",X"EA",X"95",X"5A",X"95",
		X"02",X"A9",X"02",X"A9",X"02",X"AA",X"05",X"6A",X"15",X"5A",X"01",X"56",X"05",X"56",X"55",X"55",
		X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"95",X"55",X"A5",X"55",X"A9",X"55",X"AA",X"55",
		X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"15",X"54",X"05",X"54",X"01",X"14",X"00",X"50",X"00",
		X"5A",X"95",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"15",X"55",
		X"02",X"A9",X"02",X"A9",X"02",X"AA",X"00",X"AA",X"00",X"AA",X"00",X"AA",X"00",X"2A",X"00",X"2A",
		X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"95",X"55",X"A5",X"55",X"A9",X"55",X"AA",X"55",
		X"00",X"0A",X"00",X"0A",X"00",X"05",X"0F",X"D5",X"3F",X"F1",X"03",X"F5",X"3F",X"55",X"FF",X"55",
		X"AA",X"95",X"AA",X"95",X"AA",X"A5",X"6A",X"A5",X"6A",X"A5",X"5A",X"A5",X"56",X"A5",X"55",X"A5",
		X"50",X"00",X"55",X"00",X"55",X"54",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",
		X"00",X"00",X"00",X"00",X"00",X"00",X"50",X"00",X"55",X"40",X"55",X"55",X"55",X"55",X"55",X"55",
		X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",
		X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"40",X"00",X"55",X"40",X"55",X"55",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"40",X"00",
		X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",
		X"55",X"40",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",
		X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",
		X"50",X"00",X"54",X"00",X"55",X"00",X"55",X"54",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",
		X"55",X"55",X"A5",X"55",X"AA",X"55",X"AA",X"A5",X"AA",X"A5",X"AA",X"96",X"AA",X"96",X"AA",X"A5",
		X"5A",X"5F",X"69",X"F5",X"67",X"D4",X"A7",X"55",X"A7",X"55",X"A7",X"D4",X"A9",X"F5",X"AA",X"5F",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"40",X"00",X"55",X"40",X"55",X"55",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"40",X"00",
		X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",
		X"50",X"00",X"54",X"00",X"55",X"40",X"55",X"56",X"55",X"56",X"55",X"56",X"55",X"5A",X"55",X"6A",
		X"A5",X"54",X"A5",X"54",X"A5",X"54",X"A5",X"55",X"A5",X"55",X"A9",X"55",X"A9",X"55",X"A9",X"55",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"40",X"00",X"40",X"00",
		X"A9",X"55",X"AA",X"55",X"2A",X"55",X"2A",X"55",X"2A",X"95",X"0A",X"95",X"0A",X"A5",X"0A",X"A5",
		X"50",X"00",X"50",X"00",X"54",X"00",X"55",X"00",X"55",X"40",X"55",X"50",X"55",X"54",X"55",X"55",
		X"0A",X"95",X"0A",X"55",X"0A",X"55",X"2A",X"55",X"2A",X"55",X"29",X"55",X"A9",X"55",X"A9",X"55",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"40",X"00",X"40",X"00",
		X"A9",X"55",X"AA",X"55",X"2A",X"55",X"2A",X"55",X"2A",X"95",X"0A",X"95",X"0A",X"A5",X"0A",X"A5",
		X"50",X"00",X"50",X"00",X"54",X"00",X"55",X"00",X"55",X"40",X"55",X"50",X"55",X"54",X"55",X"55",
		X"02",X"A5",X"02",X"95",X"0A",X"95",X"0A",X"55",X"2A",X"55",X"29",X"55",X"29",X"55",X"A9",X"55",
		X"40",X"00",X"40",X"00",X"40",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"40",X"00",X"40",X"00",
		X"A9",X"55",X"AA",X"55",X"AA",X"55",X"2A",X"55",X"2A",X"95",X"0A",X"95",X"0A",X"A5",X"0A",X"A5",
		X"50",X"00",X"50",X"00",X"54",X"00",X"55",X"00",X"55",X"40",X"55",X"50",X"55",X"54",X"55",X"55",
		X"00",X"14",X"00",X"94",X"02",X"54",X"02",X"50",X"0A",X"50",X"09",X"40",X"29",X"40",X"25",X"40",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"25",X"40",X"A5",X"40",X"95",X"40",X"95",X"40",X"95",X"50",X"95",X"50",X"95",X"50",X"A5",X"50",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"02",X"00",X"0A",
		X"00",X"00",X"00",X"00",X"00",X"50",X"09",X"40",X"25",X"00",X"94",X"00",X"94",X"00",X"54",X"00",
		X"00",X"09",X"00",X"29",X"00",X"25",X"00",X"A5",X"00",X"95",X"02",X"95",X"02",X"95",X"02",X"95",
		X"50",X"00",X"50",X"00",X"50",X"00",X"40",X"00",X"40",X"00",X"40",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"0A",X"00",X"29",X"02",X"A5",X"0A",X"55",X"29",X"55",X"A9",X"54",X"A5",X"50",
		X"A8",X"00",X"96",X"80",X"55",X"60",X"55",X"54",X"50",X"55",X"00",X"05",X"00",X"00",X"00",X"00",
		X"00",X"3C",X"00",X"FC",X"00",X"FF",X"00",X"3F",X"00",X"3F",X"00",X"FC",X"00",X"FC",X"03",X"F0",
		X"00",X"00",X"00",X"00",X"C0",X"00",X"C0",X"00",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"03",X"F0",X"0F",X"C0",X"0F",X"C0",X"FF",X"00",X"FF",X"00",X"FF",X"C0",X"0F",X"C0",X"0F",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"50",X"00",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",X"55",
		X"00",X"00",X"00",X"00",X"40",X"00",X"54",X"00",X"55",X"00",X"55",X"40",X"55",X"50",X"55",X"50",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
