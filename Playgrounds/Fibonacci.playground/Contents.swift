import UIKit

func fibonacci(_ until: Int) {
    print(0)
    print(1)
    var num1 : Int = 0
    var num2 : Int = 1
    
    for _ in 0..<until - 2 {
        let num = num1 + num2
        print(num)
        
        num1 = num2
        num2 = num
    }
}

fibonacci(5)
