//
//  DrawRectView.swift
//  ShapeLayerAnimation_Leon
//
//  Created by lai leon on 2017/9/7.
//  Copyright © 2017 clem. All rights reserved.
//

import UIKit

class DrawRectView: UIView {

    var tap: UITapGestureRecognizer?

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func draw(_ rect: CGRect) {
        // Drawing code
        if tap == nil {
            tap = UITapGestureRecognizer(target: self, action: #selector(removeSelf))
            addGestureRecognizer(tap!)
        }
        simpleDraw()
        pathARC()
        pathTriangle()
        pathSecondBezier()
    }

    //圆角矩形
    private func simpleDraw() {
        let path = UIBezierPath(roundedRect: CGRect(x: 20, y: 20, width: 200, height: 100), cornerRadius: 20)
        path.lineWidth = 5
        //填充颜色
        UIColor.orange.set()
        path.fill()
        //线条颜色
        UIColor.red.set()
        path.stroke()
    }

    //圆弧
    private func pathARC() {
        let path = UIBezierPath(arcCenter: CGPoint(x: 20, y: 150), radius: 100, startAngle: 0,
                endAngle: CGFloat(Double.pi * 90 / 180), clockwise: true)
        //连接样式
        path.lineCapStyle = .round
        //连接方式
        path.lineJoinStyle = .round
        path.lineWidth = 5
        UIColor.red.set()
        path.stroke()
    }

    //三角形
    private func pathTriangle() {
        let path = UIBezierPath()
        //起点
        path.move(to: CGPoint(x: 75, y: 300))
        path.addLine(to: CGPoint(x: 150, y: 400))
        path.addLine(to: CGPoint(x: 20, y: 400))
        path.close()

        path.lineWidth = 5

        UIColor.purple.set()
        path.fill()

        UIColor.red.set()
        path.stroke()
    }

    //贝塞尔曲线
    private func pathSecondBezier() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 200, y: 150))
        path.addLine(to: CGPoint(x: 20, y: 150))
        path.addQuadCurve(to: CGPoint(x: 200, y: 300), controlPoint: CGPoint(x: 50, y: 50))
        path.addCurve(to: CGPoint(x: 250, y: 450), controlPoint1: CGPoint(x: 150, y: 50), controlPoint2: CGPoint(x: 200, y: 60))
        path.lineWidth = 5

        UIColor.red.set()
        path.stroke()
    }

    func removeSelf() {
        self.removeFromSuperview()
    }



}
