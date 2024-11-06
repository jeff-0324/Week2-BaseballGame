// Lv 2 (11/06 까지)

/*
 - 정답을 맞추기 위해 3자리수를 입력하고 힌트를 받습니다
 - 힌트는 야구용어인 **볼**과 **스트라이크**입니다.
 - 같은 자리에 같은 숫자가 있는 경우 **스트라이크**, 다른 자리에 숫자가 있는 경우 **볼**입니다
 - ex) 정답 : 456 인 경우
 - 435를 입력한 경우 → 1스트라이크 1볼
 - 357를 입력한 경우 → 1스트라이크
 - 678를 입력한 경우 → 1볼
 - 123를 입력한 경우 → out
 - 만약 올바르지 않은 입력값에 대해서는 오류 문구를 보여주세요
 - 3자리 숫자가 정답과 같은 경우 게임이 종료됩니다
 - 실행 예시(정답 : 456)13123213
 */

import Foundation

func levelTwo() {
    let baseballGame = BasballGame()
    let inputUserValue1 = InputUserValue()
    let checkAnswer1 = CheckAnswer(baseballGame: baseballGame, inputUserValue: inputUserValue1)
    
    // 게임시작 -> 정답 생성
    print("< 게임 시작 >")
    baseballGame.getAnswser()
    
    // 값을 입력 받기 -> User입력값 초기화, 값 입력 받기(정답이 맞을때 까지)
    while baseballGame.strike != 3 {
        inputUserValue1.initUserValue()
        inputUserValue1.inputUserValue()
        checkAnswer1.checkAnswer()
    }
    
}

class BasballGame {
    var setRandomValue:Set<Int> = []
    var answerArray:[Int] = []
    var strike = 0
    var ball = 0
    
    
    // 랜덤값 생성 메서드
    func getRandomValue() -> Int {
        return Int.random(in: 1...9)
    }
    
    // 정답 생성 메서드
    func getAnswser()  {
        // 정답 리셋(나중에 추가 - 다른 새로운 게임 시작시)
//        setRandomValue = []
//        answerArray = []
        
        // 중복 값을 제거해주고 3개의 임의의 수를 저장
        while setRandomValue.count != 3 {
            setRandomValue.insert(getRandomValue())
        }
        // set에 저장된 랜덤 값을 배열에 다시 추가
        for i in setRandomValue {
            answerArray.append(i)
        }
        print(answerArray)
    }
}

// 유저 입력값 받기
class InputUserValue {
    let test = BasballGame()
    var inputStringValue:[Character] = []
    var userArray:[Int] = []
    
    
    func initUserValue() {
        print("숫자를 입력해주세요")
        userArray.removeAll()
        inputStringValue.removeAll()
    }
    
    //깂 입력 받는 메서드
    func inputUserValue() {
        guard let input = readLine() else {return}
        inputStringValue.append(contentsOf: input)
        
        for i in inputStringValue {
            userArray.append(Int(String(i))!)
        }
        print(userArray)
    }
}


class CheckAnswer {
    let baseballGame: BasballGame
    let inputUserValue: InputUserValue
    
    init(baseballGame: BasballGame, inputUserValue: InputUserValue) {
        self.baseballGame = baseballGame
        self.inputUserValue = inputUserValue
    }
    
    func checkAnswer() {
        baseballGame.strike = 0
        baseballGame.ball = 0
        var ballCount1:Set<Int> = []
        var ballCount2:Set<Int> = []
        
        for i in inputUserValue.userArray {
            ballCount1.insert(i)
        }
        for i in baseballGame.answerArray {
            ballCount2.insert(i)
        }
        
        baseballGame.ball = ballCount1.intersection(ballCount2).count
        
        
        for i in 0...2 {
            if (inputUserValue.userArray[i] == baseballGame.answerArray[i]) {
                baseballGame.strike += 1
                baseballGame.ball -= 1
            }
        }
        if ballCount1.intersection(ballCount2).count == 0 {
            print("아웃")
        } else if baseballGame.strike == 3 {
            print("정답입니다.")
        } else {
            print("\(baseballGame.strike)스트라이크, \(baseballGame.ball)볼")
        }
    }
}
