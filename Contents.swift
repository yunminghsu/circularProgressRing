import UIKit

//定義基本變數：每單位角度、圓圈寬度、半徑、起始角度
let aDegree=CGFloat.pi/180
let lineWidth: CGFloat=10
let radius: CGFloat=50
let startDegree: CGFloat=270

//繪製 oval 圓形
let circlePath = UIBezierPath(ovalIn: CGRect(x: lineWidth, y: lineWidth, width: radius*2, height: radius*2))

//建立底層灰色圓框圖層
let circleLayer = CAShapeLayer()
circleLayer.path = circlePath.cgPath
circleLayer.strokeColor = UIColor.gray.cgColor
circleLayer.lineWidth = lineWidth
circleLayer.fillColor=UIColor.clear.cgColor

//建立％變數
let percentage: CGFloat=60

//繪製比例圓弧框（含四個變數，圓弧位置、半徑大小、起始角度、終點角度）
let percenragePath = UIBezierPath(arcCenter: CGPoint(x: lineWidth+radius, y: lineWidth+radius), radius: radius , startAngle: aDegree*startDegree, endAngle: aDegree*(startDegree+360*percentage/100), clockwise: true)

//建立 % 圓弧框圖層
let percentageLayer = CAShapeLayer()
percentageLayer.path = percenragePath.cgPath
percentageLayer.strokeColor = UIColor.yellow.cgColor
percentageLayer.lineWidth=lineWidth
percentageLayer.fillColor=UIColor.clear.cgColor
percentageLayer.lineCap = .round

//建立中央數字標籤，為包含整體圓形的正方形圖幅
let label = UILabel(frame: CGRect(x: 0, y: 0, width: 2*(radius+lineWidth), height: 2*(radius+lineWidth)))

//設定標籤排列方式
label.textAlignment = .center

//設定含內變數文字
label.text="\(percentage)%"

//建立正方形的圖幅
let view=UIView(frame: label.frame)

//將圖層按照先後順序貼上
view.layer.addSublayer(circleLayer)
view.layer.addSublayer(percentageLayer)
view.addSubview(label)
view
