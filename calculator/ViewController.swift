import UIKit

// класс лучше помечать final если не планируешь наследоваться дальше от него, увеличивает скорость компиляции (тоже самое относится к private)
final class ViewController: UIViewController {
    
    // после : пробел, писать тип не обязательно либо можно покрыть проток
    private var calculator = SimpeCalculator()
    
    // аутлеты тоже стоит помечать как private если не используются вне класса
    @IBOutlet private weak var resultLable: UILabel! // почему тут ?
    @IBOutlet private weak var sqrt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sqrt.setTitle("\u{221a}", for: .normal)
        resultLable.text = "0"
    }

    // можно тоже помечть как private, потом не будет лишние предлагаться и также как выше писала повышает скорость компиляции
    @IBAction private func numberButton(_ sender: UIButton) {
        // как обратитья к title ? button.titleLabel.text
        // нужно что-то сразу String
        resultLable.text = calculator.setNumbers(number: String(sender.tag))
        // интересное решение) а мб брать просто текст кнопки? или на тот момент не нашел как и поэтому тег?
    }
    
    // если sender не планируешь использовать, то лучше делать аутлет без него
    @IBAction func setPoint() {
        resultLable.text = calculator.setPoint()
    }
    
    // лучше все разделять отступом
    @IBAction private func operatorsButton(_ sender: UIButton) {
        resultLable.text = calculator.setOperator(sender.tag)
    }
    
    @IBAction private func calculate() {
        resultLable.text = calculator.calculate()
    }
    
    @IBAction private func sqrtCalc() {
        resultLable.text = calculator.sqrt()
    }
       
    @IBAction private func clearAll() {
        resultLable.text = calculator.clearAll()
    }
}

