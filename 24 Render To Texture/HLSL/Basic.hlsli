#include "LightHelper.hlsli"

Texture2D gDiffuseMap : register(t0);
SamplerState gSam : register(s0);


cbuffer CBChangesEveryInstanceDrawing : register(b0)
{
    matrix gWorld;
    matrix gWorldInvTranspose;
}

cbuffer CBChangesEveryObjectDrawing : register(b1)
{
    Material gMaterial;
}

cbuffer CBDrawingStates : register(b2)
{
    float4 gFogColor;
    int gFogEnabled;
    float gFogStart;
    float gFogRange;
    int gTextureUsed;
}

cbuffer CBChangesEveryFrame : register(b3)
{
    matrix gView;
    float3 gEyePosW;
    float gPad;
}

cbuffer CBChangesOnResize : register(b4)
{
    matrix gProj;
}

cbuffer CBChangesRarely : register(b5)
{
    DirectionalLight gDirLight[5];
    PointLight gPointLight[5];
    SpotLight gSpotLight[5];
}

struct VertexPosNormalTex
{
    float3 PosL : POSITION;
    float3 NormalL : NORMAL;
    float2 Tex : TEXCOORD;
};

struct VertexPosHWNormalTex
{
    float4 PosH : SV_POSITION;
    float3 PosW : POSITION; // 在世界中的位置
    float3 NormalW : NORMAL; // 法向量在世界中的方向
    float2 Tex : TEXCOORD;
};

struct VertexPosHTex
{
    float4 PosH : SV_POSITION;
    float2 Tex : TEXCOORD;
};

struct InstancePosNormalTex
{
    float3 PosL : POSITION;
    float3 NormalL : NORMAL;
    float2 Tex : TEXCOORD;
    matrix World : World;
    matrix WorldInvTranspose : WorldInvTranspose;
};



