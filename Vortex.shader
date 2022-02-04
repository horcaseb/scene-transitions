Shader "Huse360/Vortex"
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

            #define CENTER  float2(0.5,0.5)
            #define CENTER_UV  (CENTER - i.uv)
            #define INVP (1 - _param)
            

            float4 frag(v2f_img i) : COLOR
            {
                //Agrega aquí el código de la transición Vortex:
                float sine; float cosine;
                float distance = dot(CENTER_UV, CENTER_UV) * 5 * INVP;
                sincos(distance * UNITY_TWO_PI, sine, cosine);

                
                i.uv -= CENTER;
                i.uv = float2 (i.uv.x * cosine - i.uv.y * sine,
                    i.uv.x * cosine + i.uv.y * cosine);
                i.uv += CENTER;


                float4 color = tex2D(_MainTex, i.uv);

                return lerp(float4(0, 0, 0, 1), color, saturate(3 * _param));
            }

            
            ENDCG
        }// pass
    }// Subshader
}// Shader
