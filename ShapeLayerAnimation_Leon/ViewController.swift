//
//  ViewController.swift
//  ShapeLayerAnimation_Leon
//
//  Created by lai leon on 2017/9/7.
//  Copyright © 2017 clem. All rights reserved.
//

import UIKit

let YHRect = UIScreen.main.bounds
let YHHeight = YHRect.size.height
let YHWidth = YHRect.size.width

class ViewController: UIViewController {

    let btn1: UIButton = {
        let btn1 = UIButton(frame: CGRect(x: 100, y: 200, width: YHWidth - 200, height: 30))
        btn1.setTitle("DrawRect", for: .normal)
        btn1.setTitleColor(.orange, for: .normal)
        btn1.addTarget(self, action: #selector(showView), for: .touchUpInside)
        return btn1
    }()

    let btn2: UIButton = {
        let btn2 = UIButton(frame: CGRect(x: 100, y: 300, width: YHWidth - 200, height: 30))
        btn2.setTitle("CAShapeLayer", for: .normal)
        btn2.setTitleColor(.orange, for: .normal)
        btn2.addTarget(self, action: #selector(showView), for: .touchUpInside)
        return btn2
    }()

    let drawView: DrawRectView = {
        let drawView = DrawRectView(frame: CGRect(x: 0, y: 64, width: YHWidth, height: YHHeight - 64))
        return drawView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupView()
    }


    private func setupView() {
        title = "画图与动画"
        view.backgroundColor = .white
        view.addSubview(btn1)
        view.addSubview(btn2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showView(_ sender: UIButton) {
        if sender.currentTitle == "DrawRect" {
            print("采用drawrect画图")
            view.addSubview(drawView)
        } else {
            print("采用cashapelayer")
            navigationController?.pushViewController(ShapeLayerAnimation(), animated: false)
        }
    }
}
