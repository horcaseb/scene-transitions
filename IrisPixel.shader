Shader "Huse360/IrisPixel"
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


            float4 frag(v2f_img i) : COLOR
            {
                //Agrega aquí el código de la transición IrisPixel:
                float2 circle = 2 * round(50 * i.uv) / 50 - 1;
                float driver = dot(circle, circle) < 2 * _param * _param;
                float4 color = tex2D(_MainTex, i.uv);

                return lerp(float4(0, 0, 0, 1), color, driver);
            }


           
            ENDCG
        }// pass
    }// Subshader
}// Shader
