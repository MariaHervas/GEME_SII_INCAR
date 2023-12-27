with Ada.Numerics; use Ada.Numerics;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;


with Tipos_nuevos; use Tipos_nuevos;
with utilidades; use utilidades;
with manejoArray; use manejoArray;
with maqueta; use maqueta;

--with driver_pcm3712_ao_ehu; use driver_pcm3712_ao_ehu;
--with Driver_PCM3718_ai; use Driver_PCM3718_ai;

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

--   Configuracion_Inicial(Conexion => Differential_Ended,
--                         Canal_Primero => 0,
--                         Canal_Ultimo => 0,
--                         Disparo => Software,
--                         Numero_muestras => 1,
--                         Rango => Unipolar_5);
--   Initialize_PCM3712;

   loop
      opcion := menu;
      -- La opci�n escogida ser� igual al valor devuelto por la funci�n men�,
      --La cual es de tipo char y ser� escogida por el usuario
      case opcion is
      --En funci�n de esta opci�n se realizar� una acci�n u otra
      when '0'=>
         Put_Line("Opci�n: Salir");
         -- Fin_Adquisicion;
         -- sale del programa
         exit;
      when '1'=>
         Put_Line("Opci�n: Calentar");
         calentar;
         -- Calienta la maqueta
      when '2'=>
         Put_Line("Opci�n: Mostrar temperatura actual");
         temperatura_actual := leer_temperatura;
         Put("La temperatura actual es: ");
         Put(item=>temperatura_actual, Fore => 2, Aft => 2, Exp => 0);
         Put(" grados"); New_Line; New_Line;
         -- Muestra la temperatura actual de la maqueta
      when '3'=>
         rellenarArray(arrayTemp, lenArray,maxHistorico,minHistorico);
         -- Rellena el array de temperatura con un valor nuevo del instante.
      when '4'=>
         Put_Line("Opci�n: Mostrar temperaturas del array");
         mostrarArray(arrayTemp, lenArray);
         -- Muestra todas la temperaturas que tiene el array hasta el momento
      when '5'=>
         Put_Line("Opci�n: Calcular y mostrar temperatura media");
         Calcular_Temp_Media(arrayTemp, lenArray);
         -- Calcula la temperatura media con los valores del array almacenados hasta el momento
      when '6'=>
         Put_Line("Opci�n: Calcular y mostrar porcentaje temperaturas > umbral");
         Porcentaje_Dentro_Del_Umbral(arrayTemp, lenArray);
         -- Calcula el porcentaje de temperaturas que existen dentro de un umbral
         -- dado por el usuario
      when '7'=>
         Put_Line("Opci�n: Graficar valores de temperatura actuales respecto a valores hist�ricos");
         plotarray(arrayTemp, lenArray, minHistorico, maxHistorico);
         -- Grafica los valores hist�ricos m�ximos y minimos as� como los valores actuales de temperatura
         -- Que contenga el array en ese determinado instante.
      when 'f' =>
         null;

      when others =>
         null;
      end case;
   end loop;

end Main;
