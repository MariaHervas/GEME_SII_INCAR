with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Main is


   ---------TIPOS------------

   --------------------------

   function menu return Boolean is


      eleccion : Natural range 0..7;
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
         when 3=>
            Put_Line("Opci�n: Leer temperatura y guardar en array");
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


   terminar : Boolean;

begin

   loop
      terminar := menu;
      if terminar = True then
         exit;
      end if;
   end loop;


end Main;
