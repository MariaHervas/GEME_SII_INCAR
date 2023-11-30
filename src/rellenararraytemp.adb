package body rellenarArrayTemp is


   procedure rellenarArray(valorTemp: Float; arrayTemp: out tipoArrayTemp; lenArray: in out Integer) is
      -- Esta funci�n se llamar� cada vez que se genere un nuevo valor de temperatura y lo almacenar� en
      -- la �ltima posici�n ocupada de ese array.


   begin

      lenArray := lenArray + 1;
      arrayTemp(lenArray) := valorTemp;

      if lenArray = 15 then
         arrayTemp := arrayLLeno(arrayTemp);
         lenArray := 3;
      end if;

   end rellenarArray;

   function arrayLLeno(arrayTemp: tipoArrayTemp) return tipoArrayTemp is
      -- Esta funci�n se llamar� cuando se hayan ocupado las 15 posiciones del array.

      -- El array de salida de esta funci�n es todo cero, excepto los tres primeros valores.
      arraySalida: tipoArrayTemp := (others => 0.0);

   begin

      arraySalida(1) := arrayTemp(13);
      arraySalida(2) := arrayTemp(14);
      arraySalida(3) := arrayTemp(15);

      return arraySalida;

   end arrayLLeno;

   procedure mostrarArray(arrayTemp: in tipoArrayTemp; lenArray: in Integer) is

   begin

      Put_Line("Las temperaturas del array son: ");

      for i in 1..lenArray loop

         New_Line;
         Put(Float'Image(arrayTemp(i)));
      end loop;

      New_Line;

   end mostrarArray;

end rellenarArrayTemp;
