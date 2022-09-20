//
//  GameScene.swift
//  MilestoneProjectDay66
//
//  Created by Maksat Baiserke on 20.09.2022.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var scoreLabel: SKLabelNode!
    var bulletsLabel: SKLabelNode!
    var gameOverLabel: SKLabelNode!
    var gameTimerLabel: SKLabelNode!
    var emitterNode1: SKEmitterNode!
    var emitterNode2: SKEmitterNode!
    var emitterNode3: SKEmitterNode!
    
    var gameTimer: Timer?
    
    var differentThings = ["pirate", "pen", "house", "table", "bottle", "rocket", "skull", "witch"]
    
    override func didMove(to view: SKView) {
        scoreLabel = SKLabelNode(fontNamed: "Optima-ExtraBlack")
        scoreLabel.text = "Score: 0"
        scoreLabel.fontSize = 36
        scoreLabel.position = CGPoint(x: 1008, y: 730)
        scoreLabel.horizontalAlignmentMode = .right
        addChild(scoreLabel)
        
        bulletsLabel = SKLabelNode(fontNamed: "Optima-Bold")
        bulletsLabel.text = "Bullets: 6"
        bulletsLabel.position = CGPoint(x: 16, y: 16)
        bulletsLabel.horizontalAlignmentMode = .left
        bulletsLabel.fontSize = 24
        addChild(bulletsLabel)
        
        gameOverLabel = SKLabelNode(fontNamed: "Chalkduster")
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontSize = 80
        gameOverLabel.position = CGPoint(x: 512, y: 384)
        gameOverLabel.isHidden = true
        addChild(gameOverLabel)
        
        gameTimerLabel = SKLabelNode(fontNamed: "System")
        gameTimerLabel.text = "Timer: 60"
        gameTimerLabel.position = CGPoint(x: 80, y: 730)
        gameTimerLabel.fontSize = 35
        addChild(gameTimerLabel)
        
        emitterNode1 = SKEmitterNode(fileNamed: "SparkB")
        emitterNode1.position = CGPoint(x: 0, y: 128)
        emitterNode1.advanceSimulationTime(10)
        emitterNode1.zPosition = -1
        addChild(emitterNode1)
        
        emitterNode2 = SKEmitterNode(fileNamed: "Spark")
        emitterNode2.position = CGPoint(x: 1024, y: 384)
        emitterNode2.advanceSimulationTime(10)
        emitterNode2.zPosition = -1
        addChild(emitterNode2)
        
        emitterNode3 = SKEmitterNode(fileNamed: "SparkG")
        emitterNode3.position = CGPoint(x: 0, y: 640)
        emitterNode3.zPosition = -1
        emitterNode3.advanceSimulationTime(10)
        addChild(emitterNode3)
        
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = .zero
        
        
        startTimer()
    }
    
    func startTimer(){
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(createEnemies), userInfo: nil, repeats: true)
    }
    
    override func update(_ currentTime: TimeInterval) {

    }
    
    @objc func createEnemies() {
        print("here")

        guard let enemy1 = differentThings.randomElement() else {return}
        guard let enemy2 = differentThings.randomElement() else {return}
        guard let enemy3 = differentThings.randomElement() else {return}
        let sprite = SKSpriteNode(imageNamed: enemy1)
        sprite.position = CGPoint(x: 0, y: Int.random(in: 512...700))
        addChild(sprite)
        
        sprite.physicsBody = SKPhysicsBody(texture: sprite.texture!, size: sprite.size)
        sprite.physicsBody?.contactTestBitMask = 1
        sprite.physicsBody?.velocity = CGVector(dx: 100, dy: 0)
        sprite.physicsBody?.angularDamping = 0
        sprite.physicsBody?.angularVelocity = 5
        sprite.physicsBody?.linearDamping = 0
        
        
        let sprite2 = SKSpriteNode(imageNamed: enemy2)
        sprite2.position = CGPoint(x: 0, y: Int.random(in: 256...512))
        addChild(sprite2)
        
        sprite2.physicsBody = SKPhysicsBody(texture: sprite2.texture!, size: sprite2.size)
        sprite2.physicsBody?.contactTestBitMask = 1
        sprite2.physicsBody?.velocity = CGVector(dx: 100, dy: 0)
        sprite2.physicsBody?.angularDamping = 0
        sprite2.physicsBody?.angularVelocity = 5
        sprite2.physicsBody?.linearDamping = 0
        
        let sprite3 = SKSpriteNode(imageNamed: enemy3)
        sprite3.position = CGPoint(x: 0, y: Int.random(in: 50...256))
        addChild(sprite3)
        
        sprite3.physicsBody = SKPhysicsBody(texture: sprite3.texture!, size: sprite3.size)
        sprite3.physicsBody?.contactTestBitMask = 1
        sprite3.physicsBody?.velocity = CGVector(dx: 100, dy: 0)
        sprite3.physicsBody?.angularDamping = 0
        sprite3.physicsBody?.angularVelocity = 5
        sprite3.physicsBody?.linearDamping = 0
    }
    
    
}
