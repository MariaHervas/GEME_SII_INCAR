with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Tipos_nuevos; use Tipos_nuevos;


package body gestionArrayTemp is
  
   
   procedure rellenarArray(valorTemp: T_temp; arrayTemp: out tipoArrayTemp; lenArray: in out Integer) is
      -- Esta función se llamará cada vez que se genere un nuevo valor de temperatura y lo almacenará en 
      -- la última posición ocupada de ese array. 

       
   begin
              
      if lenArray < 15 then 
         
         lenArray := lenArray + 1;    
         arrayTemp(lenArray) := valorTemp; 
         
           
      elsif lenArray = 15 then 
         
         lenArray := 3;
         arrayTemp := arrayLLeno(arrayTemp, valorTemp); 
      
      end if;   
      
   end rellenarArray; 
       
   function arrayLLeno(arrayTemp: tipoArrayTemp; valorTemp: T_temp) return tipoArrayTemp is
      -- Esta función se llamará cuando se hayan ocupado las 15 posiciones del array. 
      
      -- El array de salida de esta función es todo cero, excepto los tres primeros valores. 
      arraySalida: tipoArrayTemp := (others => 0.0); 
      
   begin
      
      arraySalida(1) := arrayTemp(14);
      arraySalida(2) := arrayTemp(15);
      arraySalida(3) := valorTemp;
      
      return arraySalida;
      
   end arrayLLeno; 
   
   procedure mostrarArray(arrayTemp: in tipoArrayTemp; lenArray: in Integer) is
      
   begin 
      
      Put_Line("Las temperaturas del array son: "); 
      New_Line;
      
      for i in 1..lenArray loop
         
         Put(T_temp'Image(arrayTemp(i))); 
      end loop; 
      
      New_Line; 
      
   end mostrarArray; 

end gestionArrayTemp;
