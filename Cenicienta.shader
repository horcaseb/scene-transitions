Shader "Huse360/Cenicienta"
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

            #define INVP (1 - _param)
            float PI = UNITY_TWO_PI;

            float4 frag(v2f_img i) : COLOR
            {
                //Agrega aquí el código de la transición Cenicienta:
                i.uv.x -= 0.25 * INVP * sin(3* INVP * UNITY_TWO_PI * i.uv.y);
                float4 color;
                color= tex2D(_MainTex, i.uv);
                return lerp(float4(0, 0, 0, 0), color, saturate(3 * _param)); 
            }
        

            
            ENDCG
        }// pass
    }// Subshader
}// Shader
