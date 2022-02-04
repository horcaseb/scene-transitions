Shader "Huse360/Barrido"
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
                //Agrega aquí el código de la transición Barrido: 

                float4 color = tex2D(_MainTex,i.uv);
                //float driver = i.uv.y > _param;
                //float driver = i.uv.y < _param;
                //float driver = i.uv.y < _param || i.uv.y > (1-_param)|| i.uv.x < _param || i.uv.x >(1 - _param);
                float driver = i.uv.y < _param || i.uv.y >(1 - _param);
                return lerp (color,float4(0,0,0,0),driver);
                
            }


           
            ENDCG
        }// pass
    }// Subshader
}// Shader






//Horizontal ambos:
                //float mult = i.uv.y > _param  || i.uv.y < (1 - _param );

/*
                float4 color;
                color = tex2D (_MainTex, i.uv) ;
                
                float driver =  i.uv.x > _param  || i.uv.x < (1 - _param )
                    || i.uv.y > _param  || i.uv.y < (1 - _param )  ;
                
                return lerp( color, float4(0,0,0,0), driver);


                float4 color = tex2D (_MainTex, i.uv) ;
                
                float driver =  i.uv.y > _param  ;
                
                return lerp( color, float4(0,0,0,0), driver);


*/