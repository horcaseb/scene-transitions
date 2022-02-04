﻿Shader "Huse360/CortinaB"
{
    Properties
    {
        _MainTex ("Base (RGB)", 2D) = "White" {}
        _param ("Param.", Float) = 0.5
    }
    SubShader
    {
      
        Pass
        {
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag
            
            #include "UnityCG.cginc"

            uniform sampler2D _MainTex;
            uniform float _param;


            float4 frag (v2f_img i) : COLOR
            {
                //Agrega aquí el código de la transición Cortina B:

               float4 color = tex2D(_MainTex,i.uv);
               float tp = 10 * i.uv.x;
               float saw = tp - floor(tp);
               float q = 1 - 2 * saw;
               q = 1 - q * q;
               q *= 0.1;

               //float driver = i.uv.y + q > 1.1 * _param;
               //float driver = i.uv.y + q < 1.1 * _param;
               float driver = i.uv.y + q < 1.1 * _param || i.uv.y + q > 1.1 * (1-_param);
               //float driver = i.uv.y + q < 1.1 * _param || i.uv.y + q > 1.1 * (1 - _param) || i.uv.x + q < 1.1 * _param || i.uv.x + q > 1.1 * (1 - _param);

               return lerp(color, float4(0, 0, 0, 0), driver);
            }


           
            ENDCG
        }// pass
    }// Subshader
}// Shader
