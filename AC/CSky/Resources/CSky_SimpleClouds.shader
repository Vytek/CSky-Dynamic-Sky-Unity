//////////////////////////////////
/// CSky.
/// Moon.
/// Description: Moon Shader.
//////////////////////////////////

Shader "AC/CSky/Simple Clouds"
{
	Properties
	{
		
		_CloudsTex("Clouds Texture", 2D) = "white" {}
		//=================================================================

		_CoverageTex("Coverage Texture", 2D) = "white" {}
		//=================================================================

		_Color("Color", Color) = (1,1,1,1)
		//=================================================================

		_Intensity("Intensity", Float) = 1.0
		//=================================================================

		_Density("Density", Float) = 2
		//=================================================================

		_Coverage("Coverage", Float) = 1.0      
		//=================================================================

		_Scale("Scale", Float) = 0.05
		//=================================================================

		_Speed("Speed", Vector) = (0.5,0.1,0.3,0.05)
		//=================================================================

		CSky_HorizonFade("HorizonFade", Float) = 0.0 
		//=================================================================
		
	}

	CGINCLUDE


		#include "CSky_Common.cginc" 
		#include "CSky_AtmosphereCommon.cginc"
		//===============================

		sampler2D      _CloudsTex;
		float4         _CloudsTex_ST;
		//===============================

		sampler2D      _CoverageTex;
		float4         _CoverageTex_ST;
		//===============================

		uniform float  _Density;
		uniform float  _Coverage;

		//===============================

		uniform float  _Intensity;
		uniform float4 _Color;
		//===============================


		uniform float  _Scale;

		//===============================

		uniform float4  _Speed;

		//===============================
		
		
		struct v2f
		{
			float2 texcoord : TEXCOORD0;
			float3 normal   : TEXCOORD1;
			float3 worldPos : TEXCOORD2;
			float4 vertex   : SV_POSITION;

			UNITY_VERTEX_OUTPUT_STEREO 
		};


		v2f vert(appdata_base v)
		{

			v2f o;
			UNITY_INITIALIZE_OUTPUT(v2f, o);
			//=======================================================================

			UNITY_SETUP_INSTANCE_ID(v);
			UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
			//=======================================================================

			o.vertex   = UnityObjectToClipPos(v.vertex);
			o.normal   = normalize(mul((float3x3)unity_ObjectToWorld, v.normal));
			//=======================================================================

			o.worldPos = normalize(mul((float3x3)unity_ObjectToWorld, v.vertex.xyz));
			o.worldPos.y += 0.3;
			o.texcoord = o.worldPos.xz / o.worldPos.y; //(o.vertex.xy / o.vertex.w + 1) * 0.5;
			o.texcoord *= _Scale;
			//=======================================================================

			return o;
		}

		half4 frag(v2f i) : SV_Target
		{

			float3 worldPos = normalize(i.worldPos);
			//=======================================================================

			
			half4 ct = tex2D(_CloudsTex, i.texcoord+ (_Time.xx * _Speed.xy));

			half4 cct = tex2D(_CoverageTex, i.texcoord+ (_Time.xx * _Speed.zw));
		
		
		
			half4 col = ct + cct;

			//col = saturate(col);

			half a = saturate(smoothstep(cct.a,0,0)-smoothstep(0, col.rgb,_Coverage));

			col.a = a;

			

			//float d = 1.0-exp(-col *2);


			//col = lerp(col*_Intensity,0, d);

				col = 1.0-exp(-col*2*_Density);

			col.rgb *= _Intensity;

			col.rgb += MiePhaseSimplified(dot(worldPos, CSky_SunDirection.xyz), CSky_SunBetaMiePhase, CSky_SunMieScattering, CSky_SunMieColor).rgb;
			col.rgb += MiePhaseSimplified(dot(worldPos, CSky_MoonDirection.xyz), CSky_MoonBetaMiePhase, CSky_MoonMieScattering, CSky_MoonMieColor).rgb;

			col.rgb *=  (1.0/exp2((a) *_Density));

			
			

			col.a *=  HORIZON_FADE(worldPos.y);

		
			//col = saturate(col);
		

			ColorCorrection(col.rgb);
			//=======================================================================

			return half4( col.rgb *_Color.rgb, col.a  );
			//=======================================================================
		}
	ENDCG

	SubShader
	{

		Tags{"Queue"="Background+1600" "RenderType"="Background" "IgnoreProjector"="True"}
		//==============================================================================================

		Pass
		{

			Cull Front 
			ZWrite Off 
			ZTest LEqual  
			//Blend One One
			Blend SrcAlpha OneMinusSrcAlpha 
			Fog{ Mode Off }
			//==========================================================================================
		
			CGPROGRAM

				#pragma target   2.0
				#pragma vertex   vert
				#pragma fragment frag
				#pragma multi_compile __ CSky_GAMMA_COLOR_SPACE
				#pragma multi_compile __ CSky_HDR

			ENDCG

			//==========================================================================================
		}
	}
}
