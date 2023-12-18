with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Tipos_nuevos; use Tipos_nuevos;

with maqueta; use maqueta;

with Ada.Real_Time; use Ada.Real_Time; 

package body manejoArray is

      
   function continuarRecogidaDatos return Boolean is 
      
      -- Funci�n para preguntar al usuario si quiere recoger m�s datos
      
      resp: Character := 's'; 
      continuar : Boolean := True; 
      
      
   begin 
         
         Put_Line("�Quiere recoger m�s datos de temperatura?");
         Get(resp);
         
         if resp = 'n' or resp = 'N' then
           continuar := False;           
      
      else               
         delay 5.0; -- delay de 5 segundos
      end if;
      
         
         return continuar;

      end continuarRecogidaDatos; 
   
procedure plotarray (arrayTemp : in tipoArraytemp; lenArray : in Integer; minHistorico, MaxHistorico: in T_temp ) is

      tempRedondeada : Float;
   
   begin
      Put_Line("temperatura hist�rica m�nima: ");
      Put("(");
      Put(item=>minHistorico, Fore => 2, Aft => 2, Exp => 0);
      Put(") => ");
      
      for i in 1..Integer(minHistorico) loop
         Put("*");
         
      end loop;
      New_Line;
      
      for I in 1..lenArray loop
         Put("(");
         Put(item=>arrayTemp(I), Fore => 2, Aft => 2, Exp => 0);
         Put(") => ");
         tempRedondeada := T_temp'Rounding(arrayTemp(I));
         
         for J in 1..Integer(tempRedondeada) loop
            Put ("*");
         end loop;
         New_Line;
   end loop;
      Put_Line("temperatura hist�rica m�xima: " );
      Put("(");
      Put(item=>maxHistorico, Fore => 2, Aft => 2, Exp => 0);
      Put(") => ");
      
      for i in 1..Integer(maxHistorico) loop
         Put("*");
         
      end loop;
      New_Line;
   end plotarray;
   
procedure valoresHistoricos(valorTemp: T_temp; maxHistorico, minHistorico: in out T_temp) is
      
   begin
      
      if valorTemp > maxHistorico then 
         maxHistorico := valorTemp;
      end if; 
      
      if valorTemp < minHistorico then 
         minHistorico := valorTemp;
      end if; 
        
   end valoresHistoricos; 
   
procedure rellenarArray(arrayTemp: out tipoArrayTemp; lenArray: in out Integer; maxHistorico, minHistorico: in out T_temp) is
      -- Esta funci�n se llamar� cada vez que se genere un nuevo valor de temperatura y lo almacenar� en 
      -- la �ltima posici�n ocupada de ese array. 
      
       
      continuar : Boolean;
      valorTemp : T_temp; 
      
      
   begin
        
      Put_Line("Valor de temperatura a�adido");
      
      loop
         
         continuar := continuarRecogidaDatos; 
         
         valorTemp := leer_temperatura;
      
      
      valoresHistoricos(valorTemp, maxHistorico, minHistorico);
              
      if lenArray < arrayTemp'Length then 
         
         lenArray := lenArray + 1;    
         arrayTemp(lenArray) := valorTemp; 
         
           
      elsif lenArray = arrayTemp'Length then 
         
         lenArray := 3;
         arrayTemp := arrayLLeno(arrayTemp, valorTemp); 
      
         end if;   
         
         exit when continuar = False; 
      end loop; 
  
   end rellenarArray;
   

   
       
   function arrayLLeno(arrayTemp: tipoArrayTemp; valorTemp: T_temp) return tipoArrayTemp is
      -- Esta funci�n se llamar� cuando se hayan ocupado las 15 posiciones del array. 
      
      -- El array de salida de esta funci�n es todo cero, excepto los tres primeros valores. 
      arraySalida: tipoArrayTemp := (others => 0.0); 
      
   begin
      
      arraySalida(1) := arrayTemp(arrayTemp'Last-1);
      arraySalida(2) := arrayTemp(arrayTemp'Last);
      arraySalida(3) := valorTemp;
      
      return arraySalida;
      
   end arrayLLeno; 
   
   procedure mostrarArray(arrayTemp: in tipoArrayTemp; lenArray: in Integer) is
      
   begin 
      
      Put_Line("Las temperaturas del array son: "); 
      New_Line;
      
      for i in 1..lenArray loop
         
         Put(item=>arrayTemp(i), Fore => 2, Aft => 2, Exp => 0); 
         Put("   ");
      end loop; 
      
      New_Line; 
      
   end mostrarArray; 
   
   
   procedure Calcular_Temp_media (arrayTemp: in  TipoArrayTemp; lenArray: in Integer) is
   --2 entradas, arrayTemp = array que se leer�; lenArray = Longitud del array le�do.

   --variables internas del proceso
   Temp_Media: Float:= 0.0;
   Kont: Integer := 0;
   --Variable utilizada para el c�lculo de la parte correspondiente al sumatorio
   --de una media.
   Tot : Float:= 0.0;
      
   begin
      --inicializaci�n de variables antes de cada llamamiento
      Temp_Media:= 0.0;
      Tot:= 0.0;
      --Bucle de 1 al rango del array utilizado
      for I in 1..lenArray loop
         --Actualizaci�n del valor total que representa el valor del sumatorio en la posici�n "I".
         Tot := Tot + ArrayTemp(I);   
      end loop;
      
   -- Proceso de calcular temperatura media:
   Temp_Media := Tot / Float(lenArray);

   -- Mostrar el valor de Temp_Media con dos decimales:
   Put("La temperatura media es: ");
   Put(Item => Temp_Media, Fore => 3, Aft => 2, Exp => 0);
   New_Line;
   end Calcular_Temp_media;
   
   
   procedure Porcentaje_Dentro_Del_Umbral (arrayTemp: in TipoArrayTemp; lenArray: in integer) is
      
  --Variables internas del proceso
   
   Kont, Tot: Integer; --Variables usadas como contador, y como total
   Porcentaje: Float; --Variable que nos indica que porcentaje de temperaturas hay dentro del umbral seleccionado
   Umbral_Min, Umbral_Max: Float; --L�mites m�ximos y m�nimos del umbral
      
   begin
      --Inicializaci�n del umbral antes de cada llamamiento
      Porcentaje := 0.0;
      Tot := 0;
      --Petici�n de l�mites del umbral
      Put_Line("Escribe un valor para el umbral entre 0 y 100 gracos centrigrados:");Skip_Line(1);
      Put_Line("primero introduce el valor m�nimo del umbral y despu�s el m�ximo:");
      Get(Umbral_Min);
      Get(Umbral_Max);
      --Mientras el valor a�adido en el umbral sea mayor al m�ximo o menor al m�nimo, volver� a pedir valores al usuario.
      while Umbral_Min < 0.0 or Umbral_Max > 100.0 loop  
         if Umbral_Min < 0.0 then
            Put_Line("el umbral m�nimo es menor al permitido, escribe un valor mayor a 0:");
            Get(Umbral_Min);
         elsif Umbral_Max > 100.0 then
            Put_Line("el umbral m�ximo es mayor al permitido, escribe un valor mayor a 100:"); 
            Get(Umbral_Max);
         else null;
         end if;
      end loop;
      --Inicializaci�n de variables antes del c�lculo del umbral
      Kont:= 0;
      Tot:= 0;
      --Mensaje que indica que el valor del umbral introducido est� dentro del permitido
      Put_Line("valor del umbral admitido, procediendo al c�lculo:");
      Skip_Line(1);
      Put_Line("==================================================");
      --c�lculo del porcentaje dentro del umbral
      for I in 1..lenArray loop
         Tot:= Tot + 1;
         --Si el valor del array en la posici�n "I" se encuentra comprendido entre el valor m�nimo
         -- y m�ximo del umbral, se sumar� 1 a la variable de contador.
         if arrayTemp(I) >= Umbral_Min and arrayTemp(I) <= Umbral_Max then
            Kont:= Kont + 1;
         end if;
      end loop;
      --porcentaje: Se divide el n�mero que el contador contiene y se divide entre todos los valores
      --Le�dos en el array.
    Porcentaje := ((Float(Kont) / Float( Tot)) * 100.0);
    Put_Line("el porcentaje de valores dentro del umbral escogido es del:");

      Put(Item => Porcentaje, Fore => 3, Aft => 2, Exp => 0); Put_Line(" %."); 
      
      New_Line;
   end Porcentaje_Dentro_Del_Umbral;
   
   
   

   
   

end manejoArray;
