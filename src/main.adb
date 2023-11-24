with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

with rellenarArrayTemp; use rellenarArrayTemp;
with mostrarArray; use mostrarArray;

procedure Main is

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
      Put_Line("7: Función extra");--FALTA POR DEFINIR ---
      Put_Line("0: Salir");

      get(eleccion);

      ---parte de elección incorrecta----
      -----------------------------------



      if eleccion = 0 then
         return True;
      else
         return False;
      end if;





   end menu;


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
