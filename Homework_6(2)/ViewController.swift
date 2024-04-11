//
//  ViewController.swift
//  Homework_6(2)
//
//  Created by Maryia Dziarkach on 4.04.24.
//


/* 2. На экране кружок по центру. Четыре кнопки - вверх, вниз, вправо, влево. При нажатии кнопки кружок перемещается на фиксированное расстояние.
 За края экрана не выходит, на кнопки не налезает */

//import UIKit
//
//class ViewController: UIViewController {
//
//    let circle = UIView()
//    let movingDistance: CGFloat = 20
//
//    let screenWidth = UIScreen.main.bounds.width // определяем ширину экрана 393.0
//    let screenHeight = UIScreen.main.bounds.height // определяем высоту экрана 852.0
//
//    let screenWidthCenter = UIScreen.main.bounds.width / 2 // определяем центр экрана по ширине
//    let screenHeightCenter = UIScreen.main.bounds.height / 2 // определяем центр экрана по высоте
//
//    @IBOutlet weak var viewBoards: UIView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        creatingCircle()
//
//
//
//        let viewBoardsWidth = viewBoards.frame.width
//        let viewBoardsHeight = viewBoards.frame.height
//        let viewBoardsX = viewBoards.frame.origin.x
//        let viewBoardsY = viewBoards.frame.origin.y
//    }
//
//
//
//
//    func creatingCircle() {
//
//        circle.frame = CGRect(x: 0, y: 0, width: 100, height: 100) // создаем квадрат
//        circle.center = CGPoint(x: screenWidthCenter, y: screenHeightCenter) // перемещаем квадрат на центр экрана
//        circle.backgroundColor = UIColor.systemPink // задаем цвет квадрата
//        circle.layer.cornerRadius = 50 // закругляем квадрат и получаем круг
//        view.addSubview(circle)
//
//    }
//
//
//    func movingLeft() {
//        let newX = circle.center.x - movingDistance // определяем новвую координату, в которую нужно переместить центр круга (393-20)
//
//        let minX = circle.frame.width / 2 // минимально допустимое значение координаты x (= радиус круга)
//
//        let maxX = UIScreen.main.bounds.width - minX // максимально допустимое значение координаты x (ширина экрана - радиус)
//
//        if newX >= minX && newX <= maxX {
//            circle.center.x = newX
//        }
//    }
//
//
//    func movingRight() {
//        let newX = circle.center.x + movingDistance
//
//        let minX = circle.frame.width / 2
//
//        let maxX = UIScreen.main.bounds.width - minX
//
//        if newX >= minX && newX <= maxX {
//            circle.center.x = newX
//        }
//
//    }
//
//
//    func movingUp() {
//        let newY = circle.center.y - movingDistance
//
//        let minY = circle.frame.height / 2
//
//        let maxY = UIScreen.main.bounds.height - minY
//
//        if newY >= minY && newY <= maxY {
//            circle.center.y = newY
//
//        }
//
//    }
//
//
//    func movingDown() {
//
//        let viewBoardsY = viewBoards.frame.origin.y
//
//        let newY = circle.center.y + movingDistance
//
//        let minY = circle.frame.height / 2
//
//        let maxY = viewBoardsY - minY
//
//        if newY >= minY && newY <= maxY {
//            circle.center.y = newY
//        }
//
//
//    }
//
//
//
//    @IBAction func pressedLeftButton(_ sender: UIButton) {
//        movingLeft()
//    }
//
//
//    @IBAction func pressedRightButton(_ sender: UIButton) {
//        movingRight()
//    }
//
//
//    @IBAction func pressedUpButton(_ sender: UIButton) {
//        movingUp()
//    }
//
//
//    @IBAction func pressedDownButton(_ sender: UIButton) {
//        movingDown()
//    }
//
//    }





// ДЗ урок 7. Сделать перемещение кружочка через enum, кружок не касается стен, при невозможности перемещения в label сообщение об ошибке, при перемещении в label направление перемещения


import UIKit

class ViewController: UIViewController {
    
    let circle = UIView()
    let movingDistance: CGFloat = 20
    
    let screenWidth = UIScreen.main.bounds.width // определяем ширину экрана 393.0
    let screenHeight = UIScreen.main.bounds.height // определяем высоту экрана 852.0
    
    let screenWidthCenter = UIScreen.main.bounds.width / 2 // определяем центр экрана по ширине
    let screenHeightCenter = UIScreen.main.bounds.height / 2 // определяем центр экрана по высоте
    
    @IBOutlet weak var viewBoards: UIView!
    
    @IBOutlet weak var labelUnderButtons: UILabel!
    
    enum Direction {
        case left
        case right
        case up
        case down
    } // создаем перечисление направлений
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Add print, please")
        
        
        creatingCircle()
        labelUnderButtons.isHidden = true
        
        
        let viewBoardsWidth = viewBoards.frame.width
        let viewBoardsHeight = viewBoards.frame.height
        let viewBoardsX = viewBoards.frame.origin.x
        let viewBoardsY = viewBoards.frame.origin.y
    }
    
    
    
    
    func creatingCircle() {
        
        circle.frame = CGRect(x: 0, y: 0, width: 100, height: 100) // создаем квадрат
        circle.center = CGPoint(x: screenWidthCenter, y: screenHeightCenter) // перемещаем квадрат на центр экрана
        circle.backgroundColor = UIColor.systemPink // задаем цвет квадрата
        circle.layer.cornerRadius = 50 // закругляем квадрат и получаем круг
        view.addSubview(circle)
        
    }
    
    
    func movingCircle(to direction: Direction) {
            var newX = circle.center.x
            var newY = circle.center.y
            let minX: CGFloat = circle.frame.width / 2
            let maxX: CGFloat = UIScreen.main.bounds.width - minX
            let minY: CGFloat = circle.frame.height / 2
            let maxY: CGFloat = viewBoards.frame.origin.y - minY
            
            switch direction {
            case .left:
                newX -= movingDistance
                if newX < minX { showErrorMessage(message: "Cannot move left") }
            case .right:
                newX += movingDistance
                if newX > maxX { showErrorMessage(message: "Cannot move right") }
            case .up:
                newY -= movingDistance
                if newY < minY { showErrorMessage(message: "Cannot move up") }
            case .down:
                newY += movingDistance
                if newY > maxY { showErrorMessage(message: "Cannot move down") }
            }
            
            if newX >= minX && newX <= maxX && newY >= minY && newY <= maxY {
                circle.center = CGPoint(x: newX, y: newY)
            }
        }
    
    func showErrorMessage(message: String) {
        labelUnderButtons.text = message
        labelUnderButtons.isHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.labelUnderButtons.isHidden = true
        }
    }
    
    @IBAction func pressedLeftButton(_ sender: UIButton) {
        movingCircle(to: .left)
        }
    
    
        @IBAction func pressedRightButton(_ sender: UIButton) {
            movingCircle(to: .right)
        }
    
    
        @IBAction func pressedUpButton(_ sender: UIButton) {
            movingCircle(to: .up)
        }
    
    
        @IBAction func pressedDownButton(_ sender: UIButton) {
            movingCircle(to: .down)
        }

    
    
    
    
   
}









//























