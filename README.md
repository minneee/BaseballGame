# ⚾️ 숫자 야구 게임 (Swift Console App)

이 프로젝트는 Swift를 사용하여 콘솔 환경에서 실행되는 숫자 야구 게임입니다. 단순한 기능 구현이 아닌 객체 지향 설계 원칙에 따라 코드를 작성하기 위해 고민하고 리팩토링하였습니다.

-----

## ✨ 주요 기능

  - **게임 플레이**: 컴퓨터가 생성한 중복 없는 세자리 숫자를 맞힙니다.
  - **스트라이크/볼 판정**: 사용자의 추측에 따라 스트라이크와 볼 개수를 알려줍니다.
  - **게임 기록**: 각 게임을 할 때마다 시도 횟수를 기록하고, 원할 때 기록을 조회할 수 있습니다.
  - **입력 유효성 검사**: 규칙에 맞지 않는 입력(문자, 자릿수 오류, 중복 숫자 등)을 처리합니다.

-----

## 🛠️ 기술 스택 (Tech Stack)

### 언어 (Language)
- **Swift**

### 주요 설계 원칙 (Key Design Principles)
- **객체 지향 프로그래밍 (OOP)**
- **단일 책임 원칙 (SRP)**
- **의존성 주입 (DI)**
- **불변성 (Immutability)**

### 실행 환경 (Environment)
- **Console Application**: 별도의 GUI 없이 터미널 환경에서 실행됩니다.

-----

## 🚀 리팩토링 및 학습 포인트

이 프로젝트에서 신경쓴 부분은 더 나은 코드 구조를 위한 고민과 리팩토링입니다.

### 1\. 단일 책임 원칙 (Single Responsibility Principle, SRP)

초기의 거대했던 `BaseballGame` 클래스를 각자의 책임에만 집중하는 작은 객체들로 분리했습니다. 이를 통해 코드의 응집도는 높이고 결합도는 낮춰, 유지보수와 테스트가 훨씬 용이해졌습니다.

  - **GameMenu**: 게임 메뉴 표시 및 사용자 선택 처리
  - **BaseballGame**: 게임의 흐름 조율
  - **NumberGenerator**: 정답 숫자 생성
  - **InputValidator**: 사용자 입력 유효성 검사
  - **GameRecordManager**: 게임 기록 저장 및 조회

### 2\. 의존성 주입 (Dependency Injection, DI)

객체가 필요로 하는 다른 객체(의존성)를 내부에서 직접 생성하지 않고, 외부(생성자)에서 전달받도록 설계했습니다. 이 구조는 테스트 시 객체(Mock Object)를 주입하기 쉽게 만들어 **테스트 용이성**을 향상시키고, 클래스 간의 결합을 느슨하게 하여 **유연성**을 높입니다.

```swift
// BaseballGame은 필요한 객체들을 외부에서 주입받습니다.
class BaseballGame {
    private let numberGenerator: NumberGenerator
    // ...
    init(numberGenerator: NumberGenerator, ...) {
        self.numberGenerator = numberGenerator
        // ...
    }
}
```

### 3\. 불변성(Immutability)을 통한 상태 관리

한 게임의 정답(`answerNumber`)은 절대 바뀌면 안 됩니다. `var` 대신 `let`을 사용하여 정답을 불변 상수로 만들고, 객체가 생성될 때 한 번만 할당하도록 강제했습니다.

### 4\. 규칙을 단 한 곳에서 관리 (Single Source of Truth)

코드 곳곳에 흩어져 있던 하드코딩된 숫자 `3`을 `numbersCount`라는 프로퍼티로 한곳에서 관리하도록 변경했습니다. 덕분에 `numbersCount` 값만 바꾸면 게임의 정답이 4자리, 5자리 게임으로 쉽게 확장될 수 있는 유연한 구조를 갖추게 되었습니다.

-----

## 📔 트러블 슈팅 TIL
[코드 리팩토링과정 블로그](https://0minnie0.tistory.com/60)

