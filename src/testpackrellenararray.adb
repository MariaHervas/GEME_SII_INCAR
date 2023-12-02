with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

with gestionArrayTemp; use gestionArrayTemp;


procedure testPackRellenarArray is
   
   valorTemp : T_temp;
   lenArray : Integer := 0;
   arrayTemp: tipoArrayTemp; 
   
begin
   
   while True loop
      
      Put_Line("Introduce un valor de temperatura:");
      Get(valorTemp);
      rellenarArray(valorTemp, arrayTemp, lenArray);
      
      mostrarArray(arrayTemp, lenArray); 
      
   end loop;
   
   
end testPackRellenarArray;
