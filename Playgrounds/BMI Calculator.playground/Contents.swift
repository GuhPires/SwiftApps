import UIKit

func calculateBMI(weight: Float, height: Float){
    let bmi = weight/(pow(height, 2))
    if bmi > 25 {
        print("You're overweight! (BMI: \(String(format: "%.2f" ,bmi)))")
    } else if bmi >= 18.5 && bmi < 25 {
        print("You're normal weight! (BMI: \(String(format: "%.2f" ,bmi)))")
    } else {
        print("You're underweight! (BMI: \(String(format: "%.2f" ,bmi)))")
    }
}

calculateBMI(weight: 60, height: 1.7)
