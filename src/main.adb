with Ada.Numerics; use Ada.Numerics;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;


with Tipos_nuevos; use Tipos_nuevos;
with Calc_temp_media; use Calc_temp_media;
with porc_temp_umbral; use porc_temp_umbral;
<<<<<<< HEAD
with rellenarArrayTemp; use rellenarArrayTemp;
with utilidades; use utilidades;
--with mostrarArray; use mostrarArray;
=======
with gestionArrayTemp; use gestionArrayTemp;

>>>>>>> 0ba6f3a3c030504333d38f4ba8272d1a35d49eef
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

   procedure calentar is                                     --En esta función introducimos la consigna de calentamiento deseada
                                                             --en watios (T_wat) y se le hace una conversión a voltios (T_volt)
      consigna_T_wat : T_wat;                                --que es la señal que se le mandará al GEME
      consigna_T_volt : T_volt;
   begin
      Put("Introduzca los watios de consigna (50..350):");   --Buena idea crear una escepción que si no se introduce un valor
      Get(consigna_T_wat);                                   --correcto vuelva a preguntar?
      New_Line;
      consigna_T_volt := consigna_T_wat/80.0;

      --Aquí, en la prueba con GEME hay que mandar una señal de salida para que se ponga en marcha el calentador
      --con el valor especificado

   end calentar;




<<<<<<< HEAD
=======

      eleccion : Natural range 0..7;
      temperatura_actual : T_temp;
   begin

      Put_Line("----------- MENU OPCIONES -----------");
      Put_Line("1: Calentar");
      Put_Line("2: Mostrar temperatura actual");
      Put_Line("3: Leer temperatura y guardar en array");
      Put_Line("4: Mostrar temperaturas del array");
      Put_Line("5: Calcular y mostrar temperatura media");
      Put_Line("6: Calcular y mostrar porcentaje temperaturas > umbral");
      Put_Line("7: Función extra");--FALTA POR DEFINIR ---
      Put_Line("0: Salir");

      Put("   Pulsa el número de la opción: ");
      get(eleccion);
      New_Line;

      case eleccion is
         when 0=>
            Put_Line("Opción: Salir");

         when 1=>
            Put_Line("Opción: Calentar");
            calentar;
         when 2=>
            Put_Line("Opción: Mostrar temperatura actual");
            temperatura_actual := leer_temperatura;
            Put("La temperatura actual es: ");
            Put(item=>temperatura_actual, Fore => 2, Aft => 2, Exp => 0);
            Put(" grados"); New_Line; New_Line;
         when 3=>
            Put_Line("Opción: Leer temperatura y guardar en array");
            rellenarArray(valorTemp, arrayTemp, lenArray);
         when 4=>
            Put_Line("Opción: Mostrar temperaturas del array");
            mostrarArray(arrayTemp, lenArray);
         when 5=>
            Put_Line("Opción: Calcular y mostrar temperatura media");

         when 6=>
            Put_Line("Opción: Calcular y mostrar porcentaje temperaturas > umbral");
         when 7=>
            Put_Line("Opción: Función extra");--FALTA POR DEFINIR ---
         when others =>
            Put_Line("No es una opción válida.");
      end case;


      if eleccion = 0 then
         return True;
      else
         return False;
      end if;


   end menu;
>>>>>>> 0ba6f3a3c030504333d38f4ba8272d1a35d49eef
   ------------------------------------------



   lenArray : Integer := 0;
   temperatura_actual : T_temp;
   opcion : Character;

begin

   loop
      opcion := menu;

      case opcion is
      when '0'=>
         Put_Line("Opción: Salir");
         exit;
      when '1'=>
         Put_Line("Opción: Calentar");
         calentar;
      when '2'=>
         Put_Line("Opción: Mostrar temperatura actual");
         temperatura_actual := leer_temperatura;
         Put("La temperatura actual es: ");
         Put(item=>temperatura_actual, Fore => 2, Aft => 2, Exp => 0);
         Put(" grados"); New_Line; New_Line;
      when '3'=>
         Put_Line("Opción: Leer temperatura y guardar en array");
         --rellenarArray(valorTemp, arrayTemp, lenArray);
      when '4'=>
         Put_Line("Opción: Mostrar temperaturas del array");
         --mostrarArray();
      when '5'=>
         Put_Line("Opción: Calcular y mostrar temperatura media");
      when '6'=>
         Put_Line("Opción: Calcular y mostrar porcentaje temperaturas > umbral");
      when '7'=>
         Put_Line("Opción: Función extra");--FALTA POR DEFINIR ---
      when 'f' =>
         Put_Line("No es una opción válida");
      when others =>
         null;
      end case;
   end loop;
end Main;
