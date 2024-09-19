// The Swift Programming Language
// https://docs.swift.org/swift-book

import raylib

print("Hello, world!")

extension Comparable {
    func clamped(_ f: Self, _ t: Self) -> Self {
        var r = self
        if r < f { r = f }
        if r > t { r = t }
        // (use SIMPLE, EXPLICIT code here to make it utterly clear
        // whether we are inclusive, what form of equality, etc etc)
        return r
    }
}

let screenWidth: Int32 = 800
let screenHeight: Int32 = 450

InitWindow(screenWidth, screenHeight, "RayZig Window :)")
SetTargetFPS(120)

var ballPos = Vector2(x: Float(screenWidth) / 2.0, y: Float(screenHeight) / 2.0)
var ballRad: Float = 10.0

while !WindowShouldClose() {

    if IsKeyDown(Int32(KEY_RIGHT.rawValue)) {
        ballPos.x += 2.0
    }
    if IsKeyDown(Int32(KEY_LEFT.rawValue)) {
        ballPos.x -= 2.0
    }
    if IsKeyDown(Int32(KEY_UP.rawValue)) {
        ballPos.y -= 2.0
    }
    if IsKeyDown(Int32(KEY_DOWN.rawValue)) {
        ballPos.y += 2.0
    }
    if IsKeyDown(Int32(KEY_P.rawValue)) {
        ballRad += 2.0
    }
    if IsKeyDown(Int32(KEY_O.rawValue)) {
        ballRad -= 2.0
    }

    ballRad = ballRad.clamped(4, Float(min(screenWidth, screenHeight) / 2))
    ballPos.x = ballPos.x.clamped(ballRad, Float(screenWidth) - ballRad)
    ballPos.y = ballPos.y.clamped(ballRad, Float(screenHeight) - ballRad)

    BeginDrawing()
    ClearBackground(Color.black)
    DrawText("Hello Window from Zig!", 10, screenWidth / 2, 20, Color.lightGray)
    DrawCircleV(ballPos, ballRad, Color.maroon)

    EndDrawing()
}

CloseWindow()
