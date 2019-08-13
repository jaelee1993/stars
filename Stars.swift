
import UIKit


extension UIView {
    func drawStar(numberOfStars:Double, multiplier:Double = 1, fillColor:UIColor? = .black, strokeColor:UIColor? = .black) {
        var i:Double = 1
        var xCoordinateMultiplier:Double = 1
        var shouldDrawHalfStar = false
        while i <= numberOfStars {
            
            
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 12 * multiplier, y: 2 * multiplier))
            path.addLine(to: CGPoint(x: 9.2 * multiplier, y: 8.6 * multiplier))
            path.addLine(to: CGPoint(x: 2 * multiplier, y: 9.2 * multiplier))
            path.addLine(to: CGPoint(x: 7.5 * multiplier, y: 14 * multiplier))
            path.addLine(to: CGPoint(x: 5.8 * multiplier, y: 21 * multiplier))
            path.addLine(to: CGPoint(x: 12 * multiplier, y: 17.3 * multiplier)) //half way point
            
            if !shouldDrawHalfStar {
                path.addLine(to: CGPoint(x: 18.2 * multiplier, y: 21 * multiplier))
                path.addLine(to: CGPoint(x: 16.5 * multiplier, y: 14 * multiplier))
                path.addLine(to: CGPoint(x: 22 * multiplier, y: 9.2 * multiplier))
                path.addLine(to: CGPoint(x: 14.8 * multiplier, y: 8.6 * multiplier))
                
            }
            
            path.close()
            
            let layer = CAShapeLayer()
            layer.path = path.cgPath
            
            // Set up the appearance of the shape layer
            layer.strokeEnd = 1
            layer.lineWidth = 1
            if let fillColor = fillColor {
                layer.fillColor = fillColor.cgColor
            }
            if let strokeColor = strokeColor {
                layer.strokeColor = strokeColor.cgColor
            }
            
            let starView = UIView(frame: CGRect(x: ((22 * (xCoordinateMultiplier-1)) * multiplier), y: 0, width: 22, height: 21))
            starView.backgroundColor = .clear
            starView.layer.addSublayer(layer)
            self.addSubview(starView)
            
            if (numberOfStars - i) != 0.5 {
                shouldDrawHalfStar = false
                i += 1
            } else {
                shouldDrawHalfStar = true
                i += (numberOfStars - i)
            }
            xCoordinateMultiplier += 1
        }
    }
}
