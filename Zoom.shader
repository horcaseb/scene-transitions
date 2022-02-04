Shader "Huse360/Zoom"
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
                //Agrega aquí el código de la transición Zoom:

                i.uv *= _param;
                i.uv -= _param * 0.5 - 0.5;
                float4 color = tex2D(_MainTex, i.uv);

                return lerp ( float4 (0, 0, 0, 0), color, saturate(3 * _param));
            }


           
            ENDCG
        }// pass
    }// Subshader
}// Shader

