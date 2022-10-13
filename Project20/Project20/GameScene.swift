//
//  GameScene.swift
//  Project20
//
//  Created by Maksat Baiserke on 08.10.2022.
//

import SpriteKit

class GameScene: SKScene {
    var gameTimer: Timer?
    var fireworks = [SKNode]()
    var ScoreLabel: SKLabelNode!
    
    let leftEdge = -22
    let bottomEdge = -22
    let rightEdge = 1024 + 22
    
    var score = 0 {
        didSet{
            ScoreLabel.text = "Score: \(score)"
        }
    }
    
    
    override func didMove(to view: SKView) {
        ScoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        ScoreLabel.text = "Score: 0"
        ScoreLabel.fontSize = 44
        ScoreLabel.position = CGPoint(x: 16, y: 16)
        ScoreLabel.horizontalAlignmentMode = .left
        addChild(ScoreLabel)
        
        let background = SKSpriteNode(imageNamed: "background")
        background.zPosition = -1
        background.blendMode = .replace
        background.position = CGPoint(x: 512, y: 384)
        addChild(background)
        
        gameTimer = Timer.scheduledTimer(timeInterval: 6, target: self, selector: #selector(launchFireworks), userInfo: nil, repeats: true)
    }
    
    func createFirework(xMovement: CGFloat, x: Int, y: Int){
        let node = SKNode()
        node.position = CGPoint(x: x, y: y)
        
        let firework = SKSpriteNode(imageNamed: "rocket")
        firework.colorBlendFactor = 1
        firework.name = "firework"
        node.addChild(firework)
        
        switch Int.random(in: 0...2){
        case 0:
            firework.color = .cyan
        case 1:
            firework.color = .green
        default:
            firework.color = .red
        }
        
        let path = UIBezierPath()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: xMovement, y: 1000))
        
        let move = SKAction.follow(path.cgPath, asOffset: true, orientToPath: true, speed: 200)
        node.run(move)
        
        if let emitter = SKEmitterNode(fileNamed: "fuse"){
            emitter.position = CGPoint(x: 0, y: -22)
            node.addChild(emitter)
        }
        
        fireworks.append(node)
        addChild(node)
    }
    @objc func launchFireworks() {
        let movementAmount: CGFloat = 1800
        switch Int.random(in: 0...3){
        case 0:
            createFirework(xMovement: 0, x: 512, y: bottomEdge)
            createFirework(xMovement: 0, x: 512 - 200, y: bottomEdge)
            createFirework(xMovement: 0, x: 512 - 100, y: bottomEdge)
            createFirework(xMovement: 0, x: 512 + 100, y: bottomEdge)
            createFirework(xMovement: 0, x: 512 + 200, y: bottomEdge)
        case 1:
            createFirework(xMovement: 0, x: 512, y: bottomEdge)
            createFirework(xMovement: -200, x: 512 - 200, y: bottomEdge)
            createFirework(xMovement: -100, x: 512 - 100, y: bottomEdge)
            createFirework(xMovement: 100, x: 512 + 100, y: bottomEdge)
            createFirework(xMovement: 200, x: 512 + 200, y: bottomEdge)
        case 2:
            createFirework(xMovement: movementAmount, x: leftEdge, y: 100)
            createFirework(xMovement: movementAmount, x: leftEdge, y: 200)
            createFirework(xMovement: movementAmount, x: leftEdge, y: 300)
            createFirework(xMovement: movementAmount, x: leftEdge, y: 400)
            createFirework(xMovement: movementAmount, x: leftEdge, y: 500)
        case 3:
            createFirework(xMovement: -movementAmount, x: rightEdge, y: 100)
            createFirework(xMovement: -movementAmount, x: rightEdge, y: 200)
            createFirework(xMovement: -movementAmount, x: rightEdge, y: 300)
            createFirework(xMovement: -movementAmount, x: rightEdge, y: 400)
            createFirework(xMovement: -movementAmount, x: rightEdge, y: 500)
        default:
           break
        }

    }
    
}
