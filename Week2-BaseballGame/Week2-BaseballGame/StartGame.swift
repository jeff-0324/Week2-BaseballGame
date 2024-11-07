
class StartGame {
    let baseBallGame = BaseBallGame()
    
    // 초기 보기화면 모드 선택
    func roof() {
        if baseBallGame.endPoint == 0 {
            initGame()
        } 
    }
    
    // 초기 게임 시작시 화면 출력
    func initGame() {
        let range = 1...3
        var select = 0
        print("환영합니다! 원하시는 번호를 입력해주세요")
      
        // 보기 선택이 이루어지도록 구현
        while !range.contains(select) {
            print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
            if let input = readLine() {
                select = Int(input) ?? 0
                switch select {
                case 1 :    // 게임 시작
                    baseBallGame.settingGame()
                    baseBallGame.startGame()
                case 2 :    // 기록 보기
                    print("게임 기록 보기")
                case 3 :    // 종료하기
                    print("종료하기")
                default :   // 정해진 숫자 외의 값을 입력 받았을 때
                    print(" # 보기에 있는 숫자를 입력해주세요. # ")
                    
                }
            }
        }
        roof()
    }
}
