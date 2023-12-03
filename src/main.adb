with Ada.Numerics; use Ada.Numerics;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;


with Tipos_nuevos; use Tipos_nuevos;
with Calc_temp_media; use Calc_temp_media;
with porc_temp_umbral; use porc_temp_umbral;

--with rellenarArrayTemp; use rellenarArrayTemp;
with utilidades; use utilidades;
--with mostrarArray; use mostrarArray;

with gestionArrayTemp; use gestionArrayTemp;


--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------




procedure Main is


   ---------TIPOS------------


   --------------------------

   --------FUNCIONES---------



   function leer_temperatura return T_temp is

      G : Generator;
      voltage_leido : Float;

      temperatura_leida : T_temp;
   begin
      Reset(G);
      voltage_leido := Random(G)*5.0;
      temperatura_leida := T_temp(20.0*voltage_leido);
      return temperatura_leida;
   end leer_temperatura;

   procedure calentar is                                     --En esta funci�n introducimos la consigna de calentamiento deseada
                                                             --en watios (T_wat) y se le hace una conversi�n a voltios (T_volt)
      consigna_T_wat : T_wat;                                --que es la se�al que se le mandar� al GEME
      consigna_T_volt : T_volt;
   begin
      Put("Introduzca los watios de consigna (50..350):");   --Buena idea crear una escepci�n que si no se introduce un valor
      Get(consigna_T_wat);                                   --correcto vuelva a preguntar?
      New_Line;
      consigna_T_volt := consigna_T_wat/80.0;

      --Aqu�, en la prueba con GEME hay que mandar una se�al de salida para que se ponga en marcha el calentador
      --con el valor especificado

   end calentar;

<<<<<<< HEAD



<<<<<<< HEAD
=======

      eleccion : Natural range 0..7;
      temperatura_actual : T_temp;
      arrayTemp: tipoArrayTemp;
      lenArray : Integer := 0;

   begin

      Put_Line("----------- MENU OPCIONES -----------");
      Put_Line("1: Calentar");
      Put_Line("2: Mostrar temperatura actual");
      Put_Line("3: Leer temperatura y guardar en array");
      Put_Line("4: Mostrar temperaturas del array");
      Put_Line("5: Calcular y mostrar temperatura media");
      Put_Line("6: Calcular y mostrar porcentaje temperaturas > umbral");
      Put_Line("7: Funci�n extra");--FALTA POR DEFINIR ---
      Put_Line("0: Salir");

      Put("   Pulsa el n�mero de la opci�n: ");
      get(eleccion);
      New_Line;

      case eleccion is
         when 0=>
            Put_Line("Opci�n: Salir");

         when 1=>
            Put_Line("Opci�n: Calentar");
            calentar;
         when 2=>
            Put_Line("Opci�n: Mostrar temperatura actual");
            temperatura_actual := leer_temperatura;
            Put("La temperatura actual es: ");
            Put(item=>temperatura_actual, Fore => 2, Aft => 2, Exp => 0);
            Put(" grados"); New_Line; New_Line;
         when 3=>
            Put_Line("Opci�n: Leer temperatura y guardar en array");
            temperatura_actual := leer_temperatura;
            rellenarArray(temperatura_actual, arrayTemp, lenArray);
            mostrarArray(arrayTemp, lenArray);
            Put_Line("Longitud array: " & Integer'Image(lenArray));

         when 4=>
            Put_Line("Opci�n: Mostrar temperaturas del array");
            mostrarArray(arrayTemp, lenArray);
         when 5=>
         Put_Line("Opci�n: Calcular y mostrar temperatura media");
         Calcular_Temp_Media(arrayTemp);
<<<<<<< HEAD
         when 6=>
         Put_Line("Opci�n: Calcular y mostrar porcentaje de temperaturas dentro de un umbral");
         Porcentaje_Dentro_Del_Umbral(arrayTemp);
         when 7=>
=======

         when 6=>
            Put_Line("Opci�n: Calcular y mostrar porcentaje temperaturas > umbral");
         when 7=>
>>>>>>> 66592ed8984e395879e65d3934d127733a8160ac
            Put_Line("Opci�n: Funci�n extra");--FALTA POR DEFINIR ---
         when others =>
            Put_Line("No es una opci�n v�lida.");
      end case;


      if eleccion = 0 then
         return True;
      else
         return False;
      end if;


   end menu;
>>>>>>> 0ba6f3a3c030504333d38f4ba8272d1a35d49eef
=======
>>>>>>> 1a0aacb9775351f97c4b7217444082f62639128b
   ------------------------------------------






   lenArray : Integer := 0;
   temperatura_actual : T_temp;
   opcion : Character;


begin

   loop
      opcion := menu;

      case opcion is
      when '0'=>
         Put_Line("Opci�n: Salir");
         exit;
      when '1'=>
         Put_Line("Opci�n: Calentar");
         calentar;
      when '2'=>
         Put_Line("Opci�n: Mostrar temperatura actual");
         temperatura_actual := leer_temperatura;
         Put("La temperatura actual es: ");
         Put(item=>temperatura_actual, Fore => 2, Aft => 2, Exp => 0);
         Put(" grados"); New_Line; New_Line;
      when '3'=>
         Put_Line("Opci�n: Leer temperatura y guardar en array");
         --rellenarArray(valorTemp, arrayTemp, lenArray);
      when '4'=>
         Put_Line("Opci�n: Mostrar temperaturas del array");
         --mostrarArray();
      when '5'=>
         Put_Line("Opci�n: Calcular y mostrar temperatura media");
      when '6'=>
         Put_Line("Opci�n: Calcular y mostrar porcentaje temperaturas > umbral");
      when '7'=>
         Put_Line("Opci�n: Funci�n extra");--FALTA POR DEFINIR ---
      when 'f' =>
         Put_Line("No es una opci�n v�lida");
      when others =>
         null;
      end case;
   end loop;
end Main;
