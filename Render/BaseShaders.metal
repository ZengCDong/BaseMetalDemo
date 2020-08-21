//
//  BaseShaders.metal
//  BaseMetalDemo
//
//  Created by fenwei on 2020/8/21.
//  Copyright © 2020 sxcoal.com. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

#import "BaseShaderTypes.h"

//结构体
typedef struct {
    //处理空间的 顶点信息
    float4 clipSpacePosition [[position]];
    //颜色
    float4 color;
}RasterizerData;

//顶点着色器
vertex RasterizerData
vertexShader(uint vertexID [[vertex_id]],
             constant BaseVertex *vertices [[buffer(BaseVertexInputIndexVertices)]],
             constant vector_uint2 *viewportSizePointer [[buffer(BaseVertexInputIndexViewportSize)]])
{
    /*
     处理顶点数据:
        1) 执行坐标系转换,将生成的顶点剪辑空间写入到返回值中.
        2) 将顶点颜色值传递给返回值
     */
    RasterizerData out;
    out.clipSpacePosition = vertices[vertexID].position;
    out.color = vertices[vertexID].color;
    return out;
}

// 片元函数
//[[stage_in]],片元着色函数使用的单个片元输入数据是由顶点着色函数输出.然后经过光栅化生成的.单个片元输入函数数据可以使用"[[stage_in]]"属性修饰符.
//一个顶点着色函数可以读取单个顶点的输入数据,这些输入数据存储于参数传递的缓存中,使用顶点和实例ID在这些缓存中寻址.读取到单个顶点的数据.另外,单个顶点输入数据也可以通过使用"[[stage_in]]"属性修饰符的产生传递给顶点着色函数.
//被stage_in 修饰的结构体的成员不能是如下这些.Packed vectors 紧密填充类型向量,matrices 矩阵,structs 结构体,references or pointers to type 某类型的引用或指针. arrays,vectors,matrices 标量,向量,矩阵数组.
fragment float4 fragmentShader(RasterizerData in [[stage_in]])
{
    
    //返回输入的片元颜色
    return in.color;
}
