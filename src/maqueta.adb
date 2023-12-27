with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;

package body maqueta is

    function leer_temperatura return T_temp is

      G : Generator;
      voltage_leido : Float;

      temperatura_leida : T_temp;
   begin
      Reset(G);
      voltage_leido := Random(G)*5.0;
      -- voltage_leido := Adquirir;
      temperatura_leida := T_temp(20.0*voltage_leido);
      return temperatura_leida;
   end leer_temperatura;

   procedure calentar is                                     --En esta función introducimos la consigna de calentamiento deseada
                                                             --en watios (T_wat) y se le hace una conversión a voltios (T_volt)
      consigna_T_wat : T_wat;                                --que es la señal que se le mandará al GEME
      consigna_T_volt : T_volt;
   begin
      Put("Introduzca los watios de consigna (50..350):");
      Get(consigna_T_wat);
      New_Line;
      consigna_T_volt := consigna_T_wat/80.0;


      --Aquí, en la prueba con GEME hay que mandar una señal de salida para que se ponga en marcha el calentador
      --con el valor especificado

      -- Write_ao_PCM3712(consigna_T_volt);

   end calentar;


end maqueta;
