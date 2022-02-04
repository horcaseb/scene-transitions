Shader "Huse360/Hambrienta2"
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
                //Agrega aquí el código de la transición Hambrienta 2:
               float4 color = tex2D(_MainTex,i.uv);

               float w = 0.5 * sin(10 * 2 * UNITY_PI * i.uv.x) + 0.5;
               w *= 0.1;
               //float driver = i.uv.y + w > 1.1 * _param;
               //float driver = i.uv.y + w < 1.1 * _param;
               float driver = i.uv.y + w < 1.1 * _param || i.uv.y + w > 1.1 * (1 - _param);
               //float driver = i.uv.y + w < 1.1 * _param || i.uv.y + w > 1.1 * (1 - _param) || i.uv.x + w < 1.1 * _param || i.uv.x + w > 1.1 * (1 - _param);

               return lerp(color, float4(0, 0, 0, 0), driver);
            }


           
            ENDCG
        }// pass
    }// Subshader
}// Shader
