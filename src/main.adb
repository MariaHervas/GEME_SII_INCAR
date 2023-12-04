with Ada.Numerics; use Ada.Numerics;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;


with Tipos_nuevos; use Tipos_nuevos;

with utilidades; use utilidades;
with manejoArray; use manejoArray;
with maqueta; use maqueta;


--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------




procedure Main is


   lenArray : Integer := 0;
   temperatura_actual : T_temp;
   opcion : Character;
   arrayTemp: tipoArrayTemp;
   maxHistorico: T_temp := 0.0;
   minHistorico: T_temp := 100.0;

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
         temperatura_actual := leer_temperatura;
         rellenarArray(temperatura_actual, arrayTemp, lenArray,maxHistorico,minHistorico);
      when '4'=>
         Put_Line("Opci�n: Mostrar temperaturas del array");
         mostrarArray(arrayTemp, lenArray);
      when '5'=>
         Put_Line("Opci�n: Calcular y mostrar temperatura media");
         Calcular_Temp_Media(arrayTemp, lenArray);
      when '6'=>
         Put_Line("Opci�n: Calcular y mostrar porcentaje temperaturas > umbral");
         Porcentaje_Dentro_Del_Umbral(arrayTemp, lenArray);
      when '7'=>
         Put_Line("Opci�n: Graficar valores de temperatura actuales respecto a valores hist�ricos");

         plotarray(arrayTemp, lenArray, minHistorico, maxHistorico);

      when 'f' =>
         null;

      when others =>
         null;
      end case;
   end loop;

end Main;
