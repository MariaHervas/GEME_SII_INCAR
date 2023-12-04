with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;


package body utilidades is

   function menu return Character is
      eleccion : Natural;
      
   begin
      
      loop
         Put_Line("----------- MENU OPCIONES -----------");
         Put_Line("1: Calentar");
         Put_Line("2: Mostrar temperatura actual");
         Put_Line("3: Leer temperatura y guardar en array");
         Put_Line("4: Mostrar temperaturas del array");
         Put_Line("5: Calcular y mostrar temperatura media");
         Put_Line("6: Calcular y mostrar porcentaje temperaturas > umbral");
         Put_Line("7: Graficar valores de temperatura actuales respecto a valores históricos");
         Put_Line("0: Salir");

         Put("   Pulsa el número de la opción: ");
         get(eleccion);
         New_Line;
         
         if eleccion >= 0 and eleccion <= 7 then
            exit;
         end if;
         Put_Line("Opción errónea");
               
      end loop;
      
      case eleccion is
         when 0=>
            return '0';
         when 1=>
            return '1';
         when 2=>
            return '2';
         when 3=>
            return '3';
         when 4=>
            return '4';
         when 5=>
            return '5';
         when 6=>
            return '6';
         when 7=>
            return '7';
         when others =>
            return 'f';
      end case;
   end menu;
   

begin
   
null;
end utilidades;
