package gestionArrayTemp is
   
   type tipoArrayTemp is array(1..15) of Float; 
   
   procedure rellenarArray(valorTemp: Float; arrayTemp: out tipoArrayTemp; lenArray: in out Integer); 
   function arrayLLeno(arrayTemp: tipoArrayTemp) return tipoArrayTemp;
   procedure mostrarArray(arrayTemp: in tipoArrayTemp; lenArray: in Integer);
   
end gestionArrayTemp;
