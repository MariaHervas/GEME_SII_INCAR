with Tipos_nuevos; use Tipos_nuevos;

package manejoArray is

   procedure rellenarArray(arrayTemp: out tipoArrayTemp; lenArray: in out Integer; maxHistorico, minHistorico: in out T_temp); 

   procedure mostrarArray(arrayTemp: in tipoArrayTemp; lenArray: in Integer);
   
   procedure plotarray (arrayTemp : in tipoArraytemp; lenArray : in Integer; minHistorico, MaxHistorico: in T_temp );
   
   procedure Calcular_Temp_media (arrayTemp: in  TipoArrayTemp; LenArray: in Integer);
   
   
   procedure Porcentaje_Dentro_Del_Umbral (arrayTemp: in TipoArrayTemp; LenArray: in integer);
   
   function continuarRecogidaDatos return Boolean;
   
   private
   --variables internas, que van al .ads, deben ser PRIVADAS
   
   function arrayLLeno(arrayTemp: tipoArrayTemp; valorTemp: T_temp) return tipoArrayTemp;
   procedure valoresHistoricos(valorTemp: T_temp; maxHistorico, minHistorico: in out T_temp);
  
   
end manejoArray;
