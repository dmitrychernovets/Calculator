import Foundation // она по дефолту импортируется, но если не используешь убирай

// пробел перед {
class SimpeCalculator{
    
    // тип можно не писать)
    private var firstNumber: String = ""
    private var secondNumber: String = ""
    private var pressedOperator: String = ""
    private var isPressedOperator: Bool = false // isOperatorPressed с точки англ более правильно; возможно симпатичнее будет сделать его вычисляемым проверять есть ли оператор в строке уже
    private var isPressedPointFirst: Bool = false
    private var isPressedPointSecond: Bool = false
    
    // после -> пробел
    // я бы сделала так func setNumbers(_ number: String) ->String { и тогда при вызове красиво
    // тоже мб как на гард заменить уберет вложенность, суть останется такой же, но так предпочитают больше
    func setNumbers(number: String) ->String{
        if !isPressedOperator {
            firstNumber += number
            return firstNumber
        }else { // проебел
            secondNumber += number
            return firstNumber + pressedOperator + secondNumber
        }
    }
    
    // мб вынести в отдельную функцию то что внутри первого иф оно в двух практически одинаковое и даже мб по тернарному оператору тут
    // все не очень любят так много вложенностей и if else так что мб некоторые аменить на гард и будет проще выглядеть, не так пугающе
    func setPoint() ->String {
        // вводим первое число
        if !isPressedOperator{ // пробел перед {
            // первое число пустое
            if firstNumber.isEmpty{
                firstNumber += "0."
                isPressedPointFirst = true // мб isPressedPointFirst не ставить самому, а проверяй есть ли в числе . firstNumber.contains(".") и тогда эта переменная мб вообще не нужна будет, также isPressedPointSecond
                return firstNumber
            }else{
                // первое число НЕ пустое
                // точка нажимается первый раз
                if !isPressedPointFirst{
                    firstNumber += "."
                    isPressedPointFirst = true
                    return firstNumber
                }else{
                    return firstNumber
                }
            }
        }else{
        // вводим второе число
            // 2 число пустое
            if secondNumber.isEmpty{
                secondNumber += "0."
                isPressedPointSecond = true
                return firstNumber + pressedOperator + secondNumber
            }else{
                // 2 число НЕ пустое
                // точка нажимается 1 раз
                if !isPressedPointSecond{
                    secondNumber += "."
                    isPressedPointSecond = true
                    return firstNumber + pressedOperator + secondNumber
                }else{
                    // точка нажимается 2 раз
                    return firstNumber + pressedOperator + secondNumber
                }
            }
        }
    }
    
    
    func setOperator(_ oper: Int) ->String {
        isPressedOperator = true
        switch oper {
            // без пробела перед :
            // оперделять так по тегу не лучшее решение, считается непонятный набор цифр, но вообще как по мне норм, к тому это в одном месте
            // но мб попробуем сделать enum с операторами и по тексту кнопки определять какой оператор, но вообще а надо оно? если просто текст кнопки подсьавлять в выражение не будет тоже самое?
        case 13 :
            pressedOperator = "/"
            return firstNumber + pressedOperator
        case 14 :
            pressedOperator = "*"
            return firstNumber + pressedOperator
        case 15 :
            pressedOperator = "-"
            return firstNumber + pressedOperator
        case 16 :
            pressedOperator = "+"
            return firstNumber + pressedOperator
        default:
            return "error"
        }
    }
    
    func calculate() ->String {
        // не надо пробел после Double
        let first = Double (firstNumber) ?? 0.0
        let second = Double (secondNumber) ?? 0.0
        
        // а вот тут уже можно сделать enum и по rawValue опредялть какой оператор, просто сипатичнее и в будущем можно переиспользовать лиюо в setOperator можно сразу ставить тип из enum в pressedOperator и по типу смотреть
        switch pressedOperator {
        case "/" :
            return "\(first / second)"
        case "*" :
            return "\(first * second)"
        case "-" :
            return "\(first - second)"
        case "+" :
            return "\(first + second)"
        default:
            return "error"
        }
    }
    
    // лучше использовать так Double(firstNumber)?.squareRoot(), Darwin это вообще либа которая работает с ядром айфоном, предпочитают ей так на прямую не пользоваться (если что за 5 минут как посмотреть эту часть мне первый раз про нее рассказал Даник хаха)
    // принудительно лучше не разворачивать, потому что в случае не успеха будет краш, просто приложение вылетит, я бы через гард проверила
    func sqrt() ->String {
        "\(Darwin.sqrt(Double(firstNumber)!))"
    }
    
    func clearAll() ->String {
        firstNumber = ""
        secondNumber = ""
        pressedOperator = ""
        isPressedOperator = false
        isPressedPointFirst = false
        isPressedPointSecond = false
        return "0"
    }
}
