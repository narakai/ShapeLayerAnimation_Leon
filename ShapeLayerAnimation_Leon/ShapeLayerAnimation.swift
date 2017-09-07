//
//  ShapeLayerAnimation.swift
//  ShapeLayerAnimation_Leon
//
//  Created by lai leon on 2017/9/7.
//  Copyright © 2017 clem. All rights reserved.
//

import UIKit

class ShapeLayerAnimation: UIViewController {

    let centerX: Double = (Double)(YHRect.width) / 2
    let centerY: Double = 300.0

    let circle: CAShapeLayer = {
        let circle = CAShapeLayer()
        circle.fillColor = UIColor.clear.cgColor//填充颜色
        circle.strokeColor = UIColor.red.cgColor//相当于线条颜色
        circle.lineWidth = 20.0//线条宽度
        circle.lineCap = "round"//线条风格
        circle.lineJoin = "round"//连接风格
        circle.autoreverses = false
        return circle
    }()

    let animation: CABasicAnimation = {
        //创建动画，strokeEnd属性
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = 3.0
        return animation
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    private func setupView() {
        view.layer.addSublayer(circle)

        //贝塞尔曲线
        //从0移动到360度
        let path = UIBezierPath(arcCenter: CGPoint(x: centerX, y: centerY),
                radius: 80, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: false)
        //关联layer和贝塞尔曲线
        circle.path = path.cgPath

        //设置动画
        circle.add(animation, forKey: nil)
        animation.delegate = self

        //外围16根线条
        let count = 16
        for i in 0..<count {
            let line = CAShapeLayer()
            line.fillColor = UIColor.clear.cgColor
            line.strokeColor = UIColor.yellow.cgColor
            line.lineWidth = 15.0
            line.lineCap = "round"
            line.lineJoin = "round"
            view.layer.addSublayer(line)

            let path2 = UIBezierPath()
            let x = centerX + 100 * cos(2.0 * Double(i) * Double.pi / Double(count))
            let y = centerY - 100 * sin(2.0 * Double(i) * Double.pi / Double(count))
            let len = 50
            //移动线条
            path2.move(to: CGPoint(x: x, y: y))
            path2.addLine(to: CGPoint(x: x + Double(len) * cos(2 * Double.pi / Double(count) * Double(i)),
                    y: y - Double(len) * sin(2 * Double.pi / Double(count) * Double(i))))

            line.path = path2.cgPath
            line.add(animation, forKey: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ShapeLayer动画"
        setupView()
        //自定义返回按钮
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backTapped))
    }

    func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: false)
        view.layer.removeAllAnimations()
    }
}

extension ShapeLayerAnimation: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        //结束后设置整个填充为红色
        circle.fillColor = UIColor.red.cgColor
    }
}
