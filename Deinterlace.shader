Shader "Huse360/Deinterlace"
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
                //Agrega aquí el código de la transición Deinterlace:
                //float tp = 100 * i.uv.y;
                float tp = 100 * i.uv.x;
                float saw = tp - floor(tp);
                float s = saw < 0.5f;
                //i.uv.x -= (1 - _param) * s;
                //i.uv.x += (1 - _param) * (1-s);
                i.uv.y -= (1 - _param) * s;
                i.uv.y += (1 - _param) * (1 - s);
                float4 color = tex2D(_MainTex, i.uv);
                return lerp(float4(0, 0, 0, 0), color, saturate(3 * _param)); 
            }


           
            ENDCG
        }// pass
    }// Subshader
}// Shader
