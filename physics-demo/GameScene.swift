//
//  GameScene.swift
//  physics-demo
//
//  Created by Joey Newfield on 1/21/18.
//  Copyright © 2018 Joey Newfield. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let square = SKSpriteNode(imageNamed: "square")
    let circle = SKSpriteNode(imageNamed: "circle")
    let triangle1 = SKSpriteNode(imageNamed: "triangle")
    let triangle2 = SKSpriteNode(imageNamed: "triangle")
    let weirdShape = SKSpriteNode(imageNamed: "weirdShape")
    
    
    override func didMove(to view: SKView) {
        
        backgroundColor = UIColor.gray
        
        square.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        square.setScale(0.5)
        square.position = CGPoint(x: self.size.width * 0.25, y: self.size.height * 0.75)
        square.name = "heavyshape"
        square.physicsBody = SKPhysicsBody(rectangleOf: square.frame.size)
        addChild(square)
        
        circle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        circle.setScale(0.5)
        circle.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.75)
        circle.name = "heavyshape"
        circle.physicsBody = SKPhysicsBody(circleOfRadius: circle.size.width / 2)
        addChild(circle)
        
        triangle1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        triangle1.setScale(0.35)
        triangle1.position = CGPoint(x: square.position.x, y: triangle1.size.height / 2)
        triangle1.name = "lightshape"
        
        let triangle1BodyPath = CGMutablePath()
        triangle1BodyPath.move(to: CGPoint(x: -triangle1.size.width / 2, y: -triangle1.size.height / 2))
        triangle1BodyPath.addLine(to: CGPoint(x: triangle1.size.width / 2, y: -triangle1.size.height / 2))
        triangle1BodyPath.addLine(to: CGPoint(x: 0, y: triangle1.size.height / 2))
        triangle1BodyPath.addLine(to: CGPoint(x: -triangle1.size.width / 2, y: -triangle1.size.height / 2))
        triangle1.physicsBody = SKPhysicsBody(polygonFrom: triangle1BodyPath)
        
        addChild(triangle1)
        
        triangle2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        triangle2.setScale(0.35)
        triangle2.position = CGPoint(x: circle.position.x, y: triangle2.size.height / 2)
        triangle2.name = "lightshape"
        
        let triangle2BodyPath = CGMutablePath()
        triangle2BodyPath.move(to: CGPoint(x: -triangle2.size.width / 2, y: -triangle2.size.height / 2))
        triangle2BodyPath.addLine(to: CGPoint(x: triangle2.size.width / 2, y: -triangle2.size.height / 2))
        triangle2BodyPath.addLine(to: CGPoint(x: 0, y: triangle2.size.height / 2))
        triangle2BodyPath.addLine(to: CGPoint(x: -triangle2.size.width / 2, y: -triangle2.size.height / 2))
        triangle2.physicsBody = SKPhysicsBody(polygonFrom: triangle2BodyPath)
        
        addChild(triangle2)
        
        makeWeirdShape()
        spawnRocks()
    }
    
    func makeWeirdShape() {
        
        weirdShape.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        weirdShape.position = CGPoint(x: self.size.width * 0.75, y: self.size.height * 0.75)
        weirdShape.name = "lightshape"
        
        //custom physics body
        let offsetX = weirdShape.frame.size.width * weirdShape.anchorPoint.x
        let offsetY = weirdShape.frame.size.height * weirdShape.anchorPoint.y
        
        let path = CGMutablePath()
        
        path.move(to: CGPoint(x: 133 - offsetX, y: 77 - offsetY))
        path.addLine(to: CGPoint(x: 151 - offsetX, y: 85 - offsetY))
        path.addLine(to: CGPoint(x: 128 - offsetX, y: 87 - offsetY))
        path.addLine(to: CGPoint(x: 88 - offsetX, y: 90 - offsetY))
        path.addLine(to: CGPoint(x: 110 - offsetX, y: 126 - offsetY))
        path.addLine(to: CGPoint(x: 19 - offsetX, y: 148 - offsetY))
        path.addLine(to: CGPoint(x: 7 - offsetX, y: 148 - offsetY))
        path.addLine(to: CGPoint(x: 14 - offsetX, y: 129 - offsetY))
        path.addLine(to: CGPoint(x: 45 - offsetX, y: 84 - offsetY))
        path.addLine(to: CGPoint(x: 47 - offsetX, y: 80 - offsetY))
        path.addLine(to: CGPoint(x: 54 - offsetX, y: 70 - offsetY))
        path.addLine(to: CGPoint(x: 54 - offsetX, y: 65 - offsetY))
        path.addLine(to: CGPoint(x: 40 - offsetX, y: 8 - offsetY))
        path.addLine(to: CGPoint(x: 49 - offsetX, y: 10 - offsetY))
        path.addLine(to: CGPoint(x: 87 - offsetX, y: 68 - offsetY))
        path.addLine(to: CGPoint(x: 114 - offsetX, y: 73 - offsetY))
        
        path.closeSubpath()
        
        
        /*
         CGPathMoveToPoint(path, nil, 133 - offsetX, 77 - offsetY)
         CGPathAddLineToPoint(path, nil, 151 - offsetX, 85 - offsetY)
         CGPathAddLineToPoint(path, nil, 128 - offsetX, 87 - offsetY)
         CGPathAddLineToPoint(path, nil, 88 - offsetX, 90 - offsetY)
         CGPathAddLineToPoint(path, nil, 110 - offsetX, 126 - offsetY)
         CGPathAddLineToPoint(path, nil, 19 - offsetX, 148 - offsetY)
         CGPathAddLineToPoint(path, nil, 7 - offsetX, 148 - offsetY)
         CGPathAddLineToPoint(path, nil, 14 - offsetX, 129 - offsetY)
         CGPathAddLineToPoint(path, nil, 45 - offsetX, 84 - offsetY)
         CGPathAddLineToPoint(path, nil, 47 - offsetX, 80 - offsetY)
         CGPathAddLineToPoint(path, nil, 54 - offsetX, 70 - offsetY)
         CGPathAddLineToPoint(path, nil, 54 - offsetX, 65 - offsetY)
         CGPathAddLineToPoint(path, nil, 40 - offsetX, 8 - offsetY)
         CGPathAddLineToPoint(path, nil, 49 - offsetX, 10 - offsetY)
         CGPathAddLineToPoint(path, nil, 87 - offsetX, 68 - offsetY)
         CGPathAddLineToPoint(path, nil, 114 - offsetX, 73 - offsetY)
         */
        
        
        weirdShape.physicsBody = SKPhysicsBody(polygonFrom: path)
        
        addChild(weirdShape)
    }
    
    func createRocks() {
        
        let rock = SKSpriteNode(imageNamed: "rock")
        rock.setScale(0.4)
        rock.name = "rock"
        rock.position = CGPoint(
            x: CGFloat.random(min: 0.0, max: (self.scene?.size.width)!), y: ((self.scene?.size.height)!) - rock.size.height)
        rock.physicsBody = SKPhysicsBody(circleOfRadius: rock.size.width / 2)
        addChild(rock)
        
    }
    
    func spawnRocks() {
        
        let wait = SKAction.wait(forDuration: 1.5)
        let changeGravity = SKAction.run {
            self.scene?.physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        }
        let addRocks = SKAction.run {
            self.run(SKAction.repeat(SKAction.sequence([SKAction.run(self.createRocks), SKAction.wait(forDuration: 0.05)]), count: 250))
        }
        
        let spawnSequence = SKAction.sequence([wait, changeGravity, addRocks])
        
        run(spawnSequence)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        applyImpulseToSprites()
        }
    
    func applyImpulseToSprites() {
        
        scene?.enumerateChildNodes(withName: "rock") { node, _ in
            node.physicsBody!.applyImpulse(CGVector(dx: CGFloat.random(min: -10, max: 10), dy: CGFloat.random(min: 10, max: 35)))
        }
        
        scene?.enumerateChildNodes(withName: "lightshape") { node, _ in
            node.physicsBody!.applyImpulse(CGVector(dx: CGFloat.random(min: -30, max: 30), dy: CGFloat.random(min: 100, max: 250)))
        }
        
        scene?.enumerateChildNodes(withName: "heavyshape") { node, _ in
            node.physicsBody!.applyImpulse(CGVector(dx: CGFloat.random(min: -50, max: 50), dy: CGFloat.random(min: 250, max: 1000)))
        }
        
    }
    

    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

extension CGFloat {
    
    static func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(UInt32.max))
    }
    
    static func random(min: CGFloat, max: CGFloat) -> CGFloat {
        assert(min < max)
        return CGFloat.random() * (max - min) + min
    }
    
}

//CUSTOM PHYSICS: http://mortenjust.com/path-generator/
