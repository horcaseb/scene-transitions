Shader "Huse360/Snes"
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
            #define PP (_param * _param)

            float4 frag(v2f_img i) : COLOR
            {
                //Agrega aquí el código de la transición Snes:

                i.uv = round(500 * PP * i.uv) / (500 * PP);
                float4 color = tex2D(_MainTex, i.uv);
                return lerp(float4(0, 0, 0, 1), color, saturate(3*_param));
            }

            
            ENDCG
        }// pass
    }// Subshader
}// Shader
