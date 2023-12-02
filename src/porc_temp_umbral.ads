package porc_temp_umbral is
 
   private
    --variables internas, que van al .ads, deben ser PRIVADAS
   type T_Umbral is 0.0..100.0 of float --límites que el umbral pueda tener, decidido por nosotros
   Umbral_Min, Umbral_Max: T_Umbral;
   Kont, Tot: Integer;
   Porcentaje: Float;
  
   arrayTemp: tipoArrayTemp;
   lenArray: Integer;
   
   procedure Porcentaje_Dentro_Del_Umbral (ArrayTemp: in TipoArrayTemp);
end porc_temp_umbral;
