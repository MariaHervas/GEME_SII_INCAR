with Ada.Numerics; use Ada.Numerics;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;


with Tipos_nuevos; use Tipos_nuevos;
with Calc_temp_media; use Calc_temp_media;
with porc_temp_umbral; use porc_temp_umbral;
with rellenarArrayTemp; use rellenarArrayTemp;
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

   procedure calentar is

   begin
      null;
   end calentar;



   function menu return Boolean is


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
         when 2=>
            Put_Line("Opci�n: Mostrar temperatura actual");
            temperatura_actual := leer_temperatura;
            Put("La temperatura actual es: ");
            Put(item=>temperatura_actual, Fore => 2, Aft => 2, Exp => 0);
            Put(" grados"); New_Line; New_Line;
         when 3=>
            Put_Line("Opci�n: Leer temperatura y guardar en array");
            --rellenarArray(valorTemp, arrayTemp, lenArray);
         when 4=>
            Put_Line("Opci�n: Mostrar temperaturas del array");
         when 5=>
            Put_Line("Opci�n: Calcular y mostrar temperatura media");

         when 6=>
            Put_Line("Opci�n: Calcular y mostrar porcentaje temperaturas > umbral");
         when 7=>
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
   ------------------------------------------



   terminar : Boolean;
   lenArray : Integer := 0;

begin

   loop
      terminar := menu;
      if terminar = True then
         exit;
      end if;
   end loop;


end Main;
