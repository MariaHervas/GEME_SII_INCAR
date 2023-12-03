--librerías
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

with Tipos_nuevos; use Tipos_nuevos;



package body Calc_temp_media is --el array no se pone, no???
   
   procedure Calcular_Temp_media (arrayTemp: in  TipoArrayTemp; lenArray: in Integer) is
  
  
   begin
      Temp_Media:= 0.0;
      Tot:= 0.0;
   for I in 1..lenArray loop
         Tot := Tot + ArrayTemp(I);   
   end loop;

   -- Calcular temp. media:
   Temp_Media := Tot / Float(lenArray);

   -- Mostrar el valor de Temp_Media con dos decimales:
   Put("La temperatura media es: ");
   Put(Item => Temp_Media, Fore => 3, Aft => 2, Exp => 0);
   New_Line;
   end Calcular_Temp_media;
   
end Calc_temp_media;
