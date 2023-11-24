procedure Main is

   function menu return Boolean is
   begin
      Put_Line("----------- MENU OPCIONES -----------");
      Put_Line("1: Calentar");
      Put_Line("2: Mostrar temperatura actual");
      Put_Line("3: Leer temperatura y guardar en array");
      Put_Line("4: Mostrar temperaturas del array");
      Put_Line("5: Calcular y mostrar temperatura media");
      Put_Line("6: Calcular y mostrar porcentaje temperaturas > umbral");
      Put_Line("7: Función extra");--FALTA POR DEFINIR ---
   end menu;


   terminar : Boolean;


begin

   loop
      terminar := menu;
      if terminar := True then
         exit;
      end if;
   end loop;


end Main;
