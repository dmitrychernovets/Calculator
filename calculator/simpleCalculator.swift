// import Foundation  она по дефолту импортируется, но если не используешь убирай
enum Operations: String {
    case addition = "+"
    case substraction = "-"
    case muitiplication = "*"
    case division = "/"
}

// пробел перед {
class SimpeCalculator {
    // тип можно не писать)
    private var firstNumber = Number()
    private var secondNumber = Number()
    private var pressedOperator = ""
    
    // isOperatorPressed с точки англ более правильно; возможно симпатичнее будет сделать его вычисляемым проверять есть ли оператор в строке уже
    // после -> пробел
    // я бы сделала так func setNumbers(_ number: String) ->String { и тогда при вызове красиво
    // тоже мб как на гард заменить уберет вложенность, суть останется такой же, но так предпочитают больше
    func setNumbers(_ number: String) ->String {
        getCurrentNumber().addToNumberValue(number)
        return allLine()
    }
    // мб вынести в отдельную функцию то что внутри первого иф оно в двух практически одинаковое и даже мб по тернарному оператору тут
    // все не очень любят так много вложенностей и if else так что мб некоторые аменить на гард и будет проще выглядеть, не так пугающе
    func setPoint() ->String {
        let number = getCurrentNumber()
        let value = number.getNumberValue()
        
        if value.isEmpty {
            number.addToNumberValue("0.")
        }else if !value.contains(".") {
            number.addToNumberValue(".")
        }
        return allLine()
    }
    
    func setOperator(_ oper: String) ->String {
            // без пробела перед :
            // оперделять так по тегу не лучшее решение, считается непонятный набор цифр, но вообще как по мне норм, к тому это в одном месте
            // но мб попробуем сделать enum с операторами и по тексту кнопки определять какой оператор, но вообще а надо оно? если просто текст кнопки подсьавлять в выражение не будет тоже самое?
        pressedOperator = oper
        return allLine()
    }
    
    func calculate() ->String {
        // не надо пробел после Double
        let first = Double(firstNumber.getNumberValue()) ?? 0.0
        let second = Double(secondNumber.getNumberValue()) ?? 0.0
        
        // а вот тут уже можно сделать enum и по rawValue опредялть какой оператор, просто сипатичнее и в будущем можно переиспользовать лиюо в setOperator можно сразу ставить тип из enum в pressedOperator и по типу смотреть
        switch pressedOperator {
        case Operations.division.rawValue :
            return "\(first / second)"
        case Operations.muitiplication.rawValue :
            return "\(first * second)"
        case Operations.substraction.rawValue :
            return "\(first - second)"
        case Operations.addition.rawValue :
            return "\(first + second)"
        default:
            return "error"
        }
    }
    
    // лучше использовать так Double(firstNumber)?.squareRoot(), Darwin это вообще либа которая работает с ядром айфоном, предпочитают ей так на прямую не пользоваться (если что за 5 минут как посмотреть эту часть мне первый раз про нее рассказал Даник хаха)
    // принудительно лучше не разворачивать, потому что в случае не успеха будет краш, просто приложение вылетит, я бы через гард проверила
    func sqrt() ->String {String(Double(firstNumber.getNumberValue())?.squareRoot() ?? 0.0)}
    
    func clearAll() ->String {
        firstNumber.setNumberValue("")
        secondNumber.setNumberValue("")
        pressedOperator = ""
        return "0"
    }
    
    private func getCurrentNumber() ->Number {pressedOperator.isEmpty ? firstNumber : secondNumber}
    
    private func allLine() ->String {firstNumber.getNumberValue() + pressedOperator + secondNumber.getNumberValue()}
}
