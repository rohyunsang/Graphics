
struct VS_INPUT
{
    float4 position : POSITION;
    // float4 color : COLOR;
    float2 uv : TEXCOORD;
};

struct VS_OUTPUT
{
    float4 position : SV_POSITION;
    // float4 color : COLOR;
    float2 uv : TEXCOORD;
};

cbuffer TransformData : register(b0)
{
    row_major matrix matWorld; 
    row_major matrix matView; 
    row_major matrix matProjection;
}

VS_OUTPUT VS(VS_INPUT input){    // VS is VertexShader
    VS_OUTPUT output;
    
    // WVP
    float4 worldPos = mul(input.position, matWorld);    // W
    float4 viewPos = mul(worldPos, matView);            // V
    float4 projPos = mul(viewPos, matProjection);       // P 

    output.position = projPos;
    output.uv = input.uv;
    
    return output;
}

Texture2D texture0 : register(t0);
SamplerState sampler0 : register(s0);

float4 PS(VS_OUTPUT input) : SV_Target     // PS is PixelShader
{ 
    float4 color = texture0.Sample(sampler0, input.uv);
    
    return color;

}