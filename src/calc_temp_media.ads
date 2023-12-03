with Tipos_nuevos; use Tipos_nuevos;

package Calc_temp_media is --sin variables in out??
   
   

   --variables no visibles para el usuario
   --variables internas del proceso
   -- Variables internas del proceso
   Tot, Temp_Media: Float;
   Kont: Integer := 0;
   --type T_Array is array (1..5) of Float;
   arrayTemp: tipoArrayTemp;
   lenArray: Integer;
   
   procedure Calcular_Temp_media (arrayTemp: in  tipoArrayTemp);
end Calc_temp_media;
