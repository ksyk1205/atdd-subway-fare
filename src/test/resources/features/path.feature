Feature: 지하철 경로 관련 기능

#     교대역    --- *2호선* ---   강남역
#     |                        |
#     *3호선*                   *신분당선*
#     |                        |
#     남부터미널역  --- *3호선* ---   양재
  Background: 지하철 노선도 준비
    Given 지하철역들을 생성 요청하고
      | name   |
      | 교대역    |
      | 강남역    |
      | 양재역    |
      | 남부터미널역 |
    And 지하철 노선들을 생성 요청하고
      | name | color  | upStation | downStation | distance | duration |
      | 2호선  | green  | 교대역     | 강남역        | 10       | 5        |
      | 신분당선 | red    | 강남역    | 양재역        | 10       | 5        |
      | 3호선  | orange | 교대역     | 남부터미널역    | 2        | 10       |
    And 지하철 구간을 등록 요청하고
      | lineName | upStation | downStation | distance | duration |
      | 3호선     | 남부터미널역  | 양재역        | 3        | 2        |

  Scenario: 어린이 회원이 두 역의 최단 거리 경로를 조회
    When "교대역"과 "양재역"의 최단거리 경로를 "어린이" 토큰으로 조회를 요청
    Then "교대역,남부터미널역,양재역" 경로가 조회된다.
    And 총 거리는 "5"이고 최소 시간은 "12"이다.
    And 지하철 요금은 450원으로 조회된다.

  Scenario: 어린이 회원이 두 역의 최소 시간 경로를 조회
    When "교대역"에서 "양재역"까지의 최소시간 경로를 "어린이" 토큰으로 조회를 요청
    Then "교대역,강남역,양재역" 경로가 조회된다.
    And 총 거리는 "20"이고 최소 시간은 "10"이다.
    And 지하철 요금은 550원으로 조회된다.

  Scenario: 청소년 회원이 두 역의 최단 거리 경로를 조회
    When "교대역"과 "양재역"의 최단거리 경로를 "청소년" 토큰으로 조회를 요청
    Then "교대역,남부터미널역,양재역" 경로가 조회된다.
    And 총 거리는 "5"이고 최소 시간은 "12"이다.
    And 지하철 요금은 720원으로 조회된다.

  Scenario: 청소년 회원이 두 역의 최소 시간 경로를 조회
    When "교대역"에서 "양재역"까지의 최소시간 경로를 "청소년" 토큰으로 조회를 요청
    Then "교대역,강남역,양재역" 경로가 조회된다.
    And 총 거리는 "20"이고 최소 시간은 "10"이다.
    And 지하철 요금은 880원으로 조회된다.