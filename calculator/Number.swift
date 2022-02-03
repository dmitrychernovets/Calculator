final class Number {
    
    private var numberValue = ""
    
    var arrrrr : Dictionary<String, () -> Int> = ["+" : {2+7}]
    
    func addToNumberValue(_ point:String){numberValue += point}
    
    func getNumberValue() -> String {numberValue}
    
    func setNumberValue(_ number: String){numberValue = number}
}
