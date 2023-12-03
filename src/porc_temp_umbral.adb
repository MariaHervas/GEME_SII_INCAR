with Tipos_nuevos; use Tipos_nuevos;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;


package body porc_temp_umbral is
   
   procedure Porcentaje_Dentro_Del_Umbral (ArrayTemp: in tipoArrayTemp) is
      
   begin
      
      Put_Line("Escribe un valor para el umbral entre 0 y 100 gracos centrigrados:");Skip_Line(1);
      Put_Line("primero introduce el valor mínimo del umbral y después el máximo:");
      Get(Umbral_Min);
      Get(Umbral_Max);
   
      while Umbral_Min < 0.0 or Umbral_Max > 100.0 loop  --se repite si lo mete mal
         if Umbral_Min < 0.0 then
            Put_Line("el umbral mínimo es menor al permitido, escribe un valor mayor a 0:");
            Get(Umbral_Min);
         elsif Umbral_Max > 100.0 then
            Put_Line("el umbral máximo es mayor al permitido, escribe un valor mayor a 100:"); 
            Get(Umbral_Max);
         
         
         else null;
         end if;
      end loop;
      Kont:= 0;
      Tot:= 0;
      --sale del while y ejecuta lo siguiente:
      Put_Line("valor del umbral admitido, procediendo al cálculo:");
      Skip_Line(1);
      Put_Line("==================================================");
      --cálculo del porcentaje dentro del umbral
      for I in 1..lenArray loop
         Tot:= Tot + 1;
         if arrayTemp(I) >= Umbral_Min and arrayTemp(I) <= Umbral_Max then
            Kont:= Kont + 1;
         end if;
      end loop;
      --porcentaje:
      Porcentaje := ((Float(Kont) / Float( Tot)) * 100.0);
   Put_Line("el porcentaje de valores dentro del umbral escogido es del:");
   Put(Item => Porcentaje, Fore => 3, Aft => 2, Exp => 0); Put("porciento.");
   end Porcentaje_Dentro_Del_Umbral;
end porc_temp_umbral;

