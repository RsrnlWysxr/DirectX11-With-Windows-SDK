#include "Basic.hlsli"

// ������ɫ��(2D)
VertexPosHTex VS_2D(VertexPosTex pIn)
{
    VertexPosHTex pOut;
    pOut.PosH = float4(pIn.PosL, 1.0f);
    pOut.Tex = pIn.Tex;
    return pOut;
}
