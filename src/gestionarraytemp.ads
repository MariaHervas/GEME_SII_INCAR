with Tipos_nuevos; use Tipos_nuevos;

package gestionArrayTemp is
   
   type tipoArrayTemp is array(1..15) of T_temp; 
   
   procedure rellenarArray(valorTemp: T_temp; arrayTemp: out tipoArrayTemp; lenArray: in out Integer); 
   function arrayLLeno(arrayTemp: tipoArrayTemp; valorTemp: T_temp) return tipoArrayTemp;
   procedure mostrarArray(arrayTemp: in tipoArrayTemp; lenArray: in Integer);
   
end gestionArrayTemp;
