with Ada.Numerics; use Ada.Numerics;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;


with Tipos_nuevos; use Tipos_nuevos;
with Calc_temp_media; use Calc_temp_media;
with porc_temp_umbral; use porc_temp_umbral;
with rellenarArrayTemp; use rellenarArrayTemp;
with utilidades; use utilidades;
--with mostrarArray; use mostrarArray;
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
