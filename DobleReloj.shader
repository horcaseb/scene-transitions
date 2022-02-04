Shader "Huse360/DobleReloj"
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

            #define DIR float2(0,1)

            float4 frag (v2f_img i) : COLOR
            {
                //Agrega aquí el código de la transición DobleReloj:
                
                float2 reloj = normalize (2 * i.uv - 1);
                float driver = dot(reloj, DIR) < 2 * _param -1;
                float4 color = tex2D(_MainTex, i.uv);
                return lerp(float4(0, 0, 0, 0),color, driver);

            }


           
            ENDCG
        }// pass
    }// Subshader
}// Shader
