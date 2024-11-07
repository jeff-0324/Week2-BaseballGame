
class BaseBallGame {
    let answer = GetAnswer()
    let userValue = GetUserValue()
    lazy var checkAnswer = CheckAnswer(getAnswer: answer, getUserValue: userValue)
    static var endPoint = 0
    
    
    // 게임 초기화
    func settingGame() {
        // 정답 배열 초기화
        answer.answerArray.removeAll()
        checkAnswer.strike = 0
        // 정답 생성
        answer.getAnswser()
        print("< 게임을 시작합니다. >")
    }
    
    
    // 게임 시작
    func startGame() {
        // 게임 횟수를 카운트, 도전 횟수 초기화
        GameRecord.gameCount += 1
        GameRecord.tryCount = 0
        
        // User입력값 초기화, 값 입력 받기(정답이 맞을때 까지 반복)
        while checkAnswer.strike != answer.answerArray.count {
            userValue.initUserValue()
            do { // do catch를 이용한 에러처리
                try userValue.inputUserValue()
                checkAnswer.checkAnswer()
                checkAnswer.printResult()
                GameRecord.tryCount += 1    // 도전 횟수 카운트
            } catch ErrorHandling.emptyInput {
                print("값을 입력해주세요.")
            } catch ErrorHandling.wrongInput {
                print("숫자 이외의 값을 입력하셨습니다.")
            } catch ErrorHandling.duplicateNumber {
                print("중복된 값을 입력하셨습니다.")
            } catch ErrorHandling.outOfRange {
                print("3자릿수를 입력해주세요")
            } catch {
                print("알 수 없는 오류")
            }
        }
        GameRecord.tryRecordArray.append(GameRecord.tryCount)   // try횟수 배열에 추가
        BaseBallGame.endPoint = 0   // 게임이 종료를 표시
    }
}

