#pragma once
#include "Types.h"


struct Vertex {
	Vec3 position;
	// Color color;
	Vec2 uv;
};

struct TransformData {
	Vec3 offset;
	float dummy;   // 16 Byte 정렬을 해야하기에 쓰레기 더미 값 
};