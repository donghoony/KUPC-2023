#import "colors.typ" : KUPC_GREEN, PALE_RED
#import "problem_info.typ" : constructTitle
#import "problems.typ" : contest_problems
#import "emoji/lib.typ" : *

#let mono(s, color: black) = {text(font: "Inconsolata", fill: color)[#s]}
#let bf(s) = {text(weight: "bold")[#s]}

// 줄바꿈은 #linebreak()를 중간에 넣으면 됩니다.
// 페이지 넘김은 문제 내부에서 ()를 새로 만들어 주세요.
// monospace 문자열은 #mono("abc")와 같이 쓸 수 있습니다.
// 미리 정의되지 않은 operation의 경우에는 #math.op("MEX")와 같이 쓰면 됩니다. 대부분은 정의돼 있으니 그냥 $cos$ 와 같이 쓰면 됩니다.
// 시간복잡도는 $cal(O)(N log N)$ 와 같이 써주세요. log가 자체적으로 함수가 있습니다.
// 이모지는 그냥 넣으면 됩니다. 지원하지 않는 이모지는 깨집니다. 이모지는 https://github.com/polazarus/typst-svg-emoji 를 사용했습니다.
// 그래프도 작성 가능합니다. https://www.graphviz.org/docs/graph/ 를 참고해서 ```render <여기에 그래프를 작성하세요>```

#let cell(num, color: black, fill: none, stroke: none) = {
  rect(
    height: 50pt, width: 50pt,
    stroke: stroke,
    fill: fill,
  )[#align(center + horizon)[#text(fill: color)[#num]]];
}

#let descriptions = (
  // 2A
  (
    (
      [- 주어진 문자열에서 $1$이 연속으로 등장하는 구간을 알아내는 방법은 무엇일까요?],
      [- 여러 가지 방법이 있지만, 구현이 간단한 방법을 소개합니다.],
      [- #mono(1) 이후에 #mono(0) 이 등장한다면, 검은 줄의 구간이 끝나는 것을 의미합니다.],
      [- 주어진 문자열을 훑으면서, #mono("s[i] = 1")이면서 #mono("s[i+1] = 0")인 #mono("i")의 개수를 셉시다.],
      [- 편의를 위해, 주어진 문자열에 #mono(0) 을 추가해도 답은 같습니다.],
      [- 시간복잡도는 $cal(O)(N)$ 입니다.],
    ),
  ),

  // 2B/1A
  (
    (
      [- 건덕이와 건구스는 자신의 차례에 #bf("반드시") 움직여야 합니다.],
      [- 건덕이와 건구스는 다음과 같은 네 가지 종류로 움직입니다: #mono("RR"), #mono("RL"), #mono("LL"), #mono("LR")],
      [- 어떻게 움직이더라도 두 플레이어 사이 간격의 #bf("홀짝성")#sub(mono("parity"))은 변하지 않습니다.],
    ),
    (
      [- 전장의 길이가 주어지는 순간 승자는 결정되며, 승자는 상대를 향해 전진합니다.],
      [- 패자의 경우 앞으로 가면 패배로 더 빠르게 도달하므로, 가능하다면 뒤로 후퇴합니다.],
      [- 전장을 벗어나도록 이동할 수 없으므로, #bf("두 플레이어간 간격은 단조감소")합니다.],
    ),
    (
      [- 간격을 짝수로 만드는 사람은 결국 두 플레이어 사이의 거리를 $0$으로 만듭니다.],
      [- 플레이어 사이의 거리가 $0$이 되는 순간, 다음 차례의 플레이어는 공격할 수 있습니다.],
      [- 주어진 전장의 길이가 짝수라면, 선공이 먼저 둘 사이의 간격을 홀수로 만듭니다.],
      [- 홀수라면, 선공이 둘 사이의 간격을 짝수로 만듭니다.],
      [- 따라서 전장의 길이가 짝수인 경우, 건덕이가 승리합니다.],
      [- 주어진 전장의 길이의 홀짝성을 판단하므로 시간복잡도는 $cal(O)(1)$입니다.],
      [],[],
      [#emoji.arm.muscle $N times N$ 전장에서 각 플레이어가 $(1,1)$, $(N,N)$에서 시작하면 누가 승리할까요?]
    ),
  ),

  // 2C
  (
    (
      [- 바닥수 $N$이 주어졌을 때, 바닥수가 $N$인 길이 $L$의 원래 수를 구해야 합니다.],
      [- 길이 $L$의 모든 수에 대해서 바닥수가 되는지 확인하는 것은 오래 걸립니다.],
      [- 곱셈의 성질을 활용해서 쉽게 문제를 해결해 봅시다.]
    ),
    (
      [- 곱셈의 항등원을 이용합시다. $1$은 여러 번 곱해도 $1$입니다.],
      [- $1$을 $L-1$번 적은 뒤, $N$를 뒤에 덧붙인 수의 바닥수는 $N$입니다.],
      [- 원래 수는 $0$으로 시작하지 않음에 주의합시다.]
    ),
  ),

  // 2D/1B
  (
    (
      [- 학생의 키가 같은 쌍이 존재하지 않는다면, 모든 학생이 참여할 수 있습니다.],
      [- 모두가 한 쪽을 바라보고, 바라보는 방향으로 키가 작아지도록 줄세우면 됩니다.],
      [- 학생의 키가 같은 쌍이 존재하는 경우에는 몇 명까지 참여할 수 있을까요?],
    ),
    (
      [- 두 명의 키가 서로 같다면, 서로 반대 방향을 보고 서면 됩니다.],
      [- 세 명의 키가 서로 같다면, 한 명은 어느 쪽을 보든 점프할 타이밍을 놓칠 수 있습니다.],
      [- 따라서 키가 같은 사람은 #bf("최대 두 명")까지만 참여할 수 있습니다.],
      [- 줄을 세울 수 있는지의 여부를 물어보았으므로, 각 사람들의 키에 대해서 참여할 수 있는 사람의 수를 세어 줍시다.],
      [- 시간복잡도는 $cal(O)(N)$입니다.],
      [],[],
      [#emoji.arm.muscle 올바르게 줄 세우는 방법 중 하나를 구할 수 있을까요?]
    ),
  ),
  // 2E
  (
    (
      [- 왼쪽 절반의 문자와 오른쪽 절반의 문자의 교환을 통해 팰린드롬을 만들어 봅시다.],
      [- 연산을 통해 임의의 위치에 존재하는 두 문자를 교환할 수 있다면, #linebreak() 모든 문자를 원하는 곳에 배치할 수 있습니다. 과연 가능할까요?#v(0.5em)],
      [- 편의상 배열의 길이가 짝수라고 가정합시다. 교환하는 경우의 수는 두 가지입니다. ],
      [#h(2em) #emoji.ast 두 문자가 서로 다른 절반에 속하는 경우],
      [#h(2em) #emoji.ast 두 문자가 같은 절반에 속하는 경우],
    ),
    (
      [- 두 문자가 서로 다른 절반에 속하는 경우, 두 원소를 직접 교환할 수 있습니다.],
      [- 두 문자가 서로 같은 절반에 속하는 경우에는 두 원소를 직접 교환할 수 없습니다.],
      [- 이때, 반대쪽 절반에 속하는 원소 한 개를 임시로 사용해 교환할 수 있습니다.],
      [
        #let cell(num, color: black, fill: none) = {
          rect(
            height: 50pt, width: 50pt,
            stroke: none,
            fill: fill,
          )[#align(center + horizon)[#text(fill: color)[#num]]];
        }
        #set table(align: center, stroke: gray + 0.5pt, inset: 0pt, columns: 4)

        #align(center)[
          #table(
          )[#cell(1, color: blue, fill:rgb("ddd"))][#cell(2)][#cell(3, color: PALE_RED)][#cell(4, color: PALE_RED, fill: rgb("ddd"))]
        ]
        #v(-0.8em)
        #align(center)[
          #table(
          )[#cell(4, color: PALE_RED, fill:rgb("ddd"))][#cell(2)][#cell(3, color: PALE_RED, fill:rgb("ddd"))][#cell(1, color: blue)]
        ]
        #v(-0.8em)
        #align(center)[
          #table(
          )[#cell(3, color: PALE_RED, fill:rgb("ddd"))][#cell(2)][#cell(4, color: PALE_RED)][#cell(1, color: blue, fill:rgb("ddd"))]
        ]
        #v(-0.8em)
        #align(center)[
          #table(
          )[#cell(1, color: blue)][#cell(2)][#cell(4, color: PALE_RED)][#cell(3, color: PALE_RED)]
        ]
      ]
    ),
    (
      [- 문자열의 길이가 홀수인 경우에는 가운데 글자를 교환할 수 없음에 유의합시다.],
      [- 해당 문자를 세지 않고, 짝수 길이의 문자열이라고 생각하면 됩니다.],
      [- 팰린드롬이 되기 위해서는 양 쪽에 같은 수의 문자가 존재해야 합니다.],
      [- 알파벳이 문자열에 짝수번 등장한다면 양 쪽에 골고루 분배할 수 있습니다.],
      [- 시간복잡도는 $cal(O)(N)$입니다.],
    ),
  ),

  (
    (
      [- 두 개의 말뚝과 깃대 하나를 골라 만들 수 있는 삼각형 넓이 중 최댓값을 구합시다.],
      [- 단, 넓이가 $R$ 이하여야 합니다.],
      [- 간단한 방법은 모든 말뚝 쌍에 대해서, 모든 깃대를 탐색하는 방법입니다.],
      [- 해당 풀이는 $cal(O)(N^2M)$으로, 제한 시간 안에 해결할 수 없습니다.],
    ),
    (
      [- 만약 밑변을 고정한다면, 주어진 깃대를 정렬한 뒤 이분탐색을 사용할 수 있습니다.],
      [- 가능한 모든 밑변을 구하는 데에는 $cal(O)(N^2)$입니다.],
      [- 하나의 밑변 길이에 대해서, $R$ 이하인 최대 넓이를 구하는 데 $cal(O)(log M)$이 듭니다.],
      [- $cal(O)(N^2 log M)$ 제한에는 충분히 통과할 수 있습니다.]
    ),
  ),

  (
    (
      [- 스위치를 누르면 $3$초동안 두 배의 점수를 얻을 수 있습니다.],
      [- 음수의 점수도 두 배로 계산됨에 유의해야 합니다.],
      [- 그리디하게 스위치를 누르는 전략은 오답을 받습니다.],
      [- 스위치를 누른 뒤, $i$초 시점에 스위치의 효과가 $j$초 남았다는 것을 활용합시다.],
    ),
    (
      [- $i$초에 $j=0$이라면, $i-1$초에 $j=0$이거나 $j=1$인 경우 중 최댓값을 가져옵시다.],
      [- $j=1$이라면 아직 스위치의 효과가 남아있으므로 $i-1$초의 $j=2$를 가져옵니다.],
      [- $j=2$인 경우도 마찬가지로 $i-1$초의 $j=3$을 가져옵니다.],
      [- $j=3$은 지금 스위치를 누른 상황으로, $i-1$초의 $j=0$이거나 $j=1$인 경우에서 가져올 수 있습니다.],
      [- 스위치의 효과가 적용되는 경우에는 배열의 값의 두배를 더해줍시다.],
      [- 시간복잡도는 $cal(O)(N)$입니다.]
    )
  ),

  (
    (
      [ #let cell(num, color: black, fill: none, stroke: none) = {
          rect(
            height: 50pt, width: 50pt,
            stroke: stroke,
            fill: fill,
          )[#align(center + horizon)[#text(fill: color)[#num]]];
        }
        #set table(align: center, stroke: rgb("add8e6") + 1pt, inset: 0pt, columns: 5)
        #align(center)[
          #table()[#cell(1)][#cell(2)][#cell(3, stroke: red)][#cell(4)][#cell(5)][#cell(5)][#cell(2)][#cell(1, stroke: red)][#cell(4)][#cell(6)][#cell(0)][#cell(2)][#cell(4,fill: rgb("ddd"), stroke: red)][#cell(2)][#cell(1)][#cell(0)][#cell(0)][#cell(2)][#cell(1)][#cell(7)]
        ]
      ],
      [- 일감호입니다. #emoji.fishing],
      [- 무게추 $3$을 달아 $3$의 힘으로 낚싯대를 휘두르면 회색 칸에 찌가 도달합니다.],
      [- 빨간 색 테두리에 해당하는 칸에 존재하는 $8$마리의 물고기가 사로잡힙니다.]
    ),

    (
      [ #set table(align: center, stroke: rgb("add8e6") + 1pt, inset: 0pt, columns: 5)
        #align(center)[
          #table()[#cell(1)][#cell(2, stroke: red)][#cell(3, fill: rgb("add8e6"))][#cell(4)][#cell(5)][#cell(5)][#cell(2, fill: rgb("ddd"), stroke: red)][#cell(1, fill: rgb("add8e6"))][#cell(4)][#cell(6)][#cell(0)][#cell(2)][#cell(4, fill: rgb("add8e6"))][#cell(2)][#cell(1)][#cell(0)][#cell(0)][#cell(2)][#cell(1)][#cell(7)]
        ]
      ],
      [- 낚싯줄을 한 바퀴 감아올리면 찌의 위치가 바뀝니다.],
      [- 바뀐 칸에서 물고기 $4$마리가 사로잡힙니다.],
      [- 이를 미끼가 일감호를 벗어날 때까지 반복합니다.],
    ),
    (
      [ #let cell(num, color: black, fill: none, stroke: none) = {
          rect(
            height: 50pt, width: 50pt,
            stroke: stroke,
            fill: fill,
          )[#align(center + horizon)[#text(fill: color)[#num]]];
        }
        #set table(align: center, stroke: rgb("add8e6") + 1pt, inset: 0pt, columns: 5)
        #align(center)[
          #table()[#cell(1, fill: rgb("add8e6"))][#cell(2, fill: rgb("add8e6"))][#cell(3, fill: rgb("add8e6"))][#cell(4)][#cell(5)][#cell(5)][#cell(2, fill: rgb("add8e6"))][#cell(1, fill: rgb("add8e6"))][#cell(4)][#cell(6)][#cell(0)][#cell(2)][#cell(4, fill: rgb("add8e6"))][#cell(2)][#cell(1)][#cell(0)][#cell(0)][#cell(2)][#cell(1)][#cell(7)]
        ]
      ],
      [- 쿼리가 주어질 때마다 다음과 같은 계단 모양에 칠해진 수의 합을 구하는 문제입니다.],
      [- 간단하게 생각하면, 매 쿼리마다 계산하는 $cal(O)(N M Q)$ 풀이가 있습니다 #emoji.face.explode.],
      [- 이는 시간 초과입니다. 어떻게 빠르게 해결할 수 있을까요?]
    ),
    (
      [- 여러 방법 중 하나를 소개합니다.],
      [- 2차원 배열에서 직사각형 모양의 부분합은 $cal(O)(N M + Q)$에 구할 수 있습니다.],
      [- 쿼리가 직사각형의 부분합을 구하게끔 일감호를 재배치할 수 있을까요?],

    ),
    (
      [
        
        #set table(align: center, stroke: rgb("add8e6") + 1pt, inset: 0pt, columns: 3)
        #align(center)[
        #grid(columns: 3)[
          #align(center + horizon)[
        #table()[#cell(1, fill: rgb("add8e6"))][#cell(2,fill: rgb("add8e6"))][#cell(3,fill: rgb("add8e6"))][#cell(5)][#cell(2,fill: rgb("add8e6"))][#cell(1,fill: rgb("add8e6"))][#cell(0)][#cell(2)][#cell(4,fill: rgb("add8e6"))]]
        ][#align(center + horizon)[#h(3em)->#h(3em)]][
        #align(center + horizon)[
        #table()[#cell(0, fill: rgb("add8e6"))][#cell(0, fill: rgb("add8e6"))][#cell(3, fill: rgb("add8e6"), stroke: PALE_RED)][#cell(0,fill: rgb("add8e6"))][#cell(2,fill: rgb("add8e6"), stroke: PALE_RED)][#cell(1,fill: rgb("add8e6"), stroke: PALE_RED)][#cell(1, fill: rgb("add8e6"), stroke: PALE_RED)][#cell(2, fill: rgb("add8e6"), stroke: PALE_RED)][#cell(4,fill: rgb("add8e6"), stroke: PALE_RED)][#cell(5, stroke: PALE_RED)][#cell(2, stroke: PALE_RED)][#cell(0)][#cell(0, stroke: PALE_RED)][#cell(0)][#cell(0)]]
        ]
      ]

      ],
      [- 가능합니다.],
      [- 시간복잡도는 2차원 부분합과 같은 $cal(O)(N M + Q)$입니다.],
    ),
  ),

  (
    (
      [- 우선 언제 #mono("NO", color:PALE_RED) 를 출력해야할 지 생각해봅니다.],
      [- #math.op("MEX")의 정의에 의해, 길이가 $N$인 수열의 #math.op("MEX")는 $N+1$보다 클 수 없습니다.],
      [- $A$는 순열이기 때문에 $B_N = N+1$입니다.],
      [- $S_i = {A_1, A_2, dots, A_i}$라고 할 때, $S_i subset S_(i+1)$이므로 #linebreak() $B_i > B_(i+1) (1 <= i <= N-1)$일 수 없습니다. 즉 $B$는 #bf("단조증가")합니다.],
    ),
    (
      [- 몇 가지 관찰을 해 봅시다.],
      [- 만약 $A_i = K$라면, $i<=j$일 때 $B_j = K$일 수 없습니다.],
      [- $K$를 포함하는 집합의 #math.op("MEX")는 정의상 $K$일 수 없기 때문입니다.],
      [- 결국 $B_j = K$일 때, $A_i = K (j<i)$입니다.]
    ),
    (
      [- $B_i != B_(i+1) (1 <= i <= N-1)$인 경우에 주목합니다.],
      [- #math.op("MEX")값이 $B_(i+1)$이기 위해서는 해당 집합이 $B_i$를 가지고 있어야 합니다.],
      [- 이전 관찰과 종합하면 $B_i != B_(i+1)$일 때, $A_(i+1) = B_i$가 됨을 알 수 있습니다.],
      [- 이제 남은 값은 작은 수부터 빈 자리에 넣어주면 됩니다.]
    ),
    (
      [- $B_i != B_(i+1)$일 때, $A_(i+1) = B_i$ #v(1em)],
      [#align(center)[#table(columns:5)[#cell(1)][#cell(2)][#cell(2)][#cell(4)][#cell(6)]]],
      [#v(-0.5em) $ B $ ],

      [#align(center)[#table(columns:5)[#cell("?")][#cell(1, color:PALE_RED)][#cell("?")][#cell(2, color:PALE_RED)][#cell(4, color:PALE_RED)]]],
      [#v(-0.5em) $ A $ ],
    ),
    (
      [- 이제 남은 값은 작은 수부터 빈 자리에 넣어주면 됩니다. #v(1em)],
      [#align(center)[#table(columns:5)[#cell(1)][#cell(2)][#cell(2)][#cell(4)][#cell(6)]]],
      [#v(-0.5em) $ B $ ],

      [#align(center)[#table(columns:5)[#cell(3, color:PALE_RED)][#cell(1)][#cell(5, color:PALE_RED)][#cell(2)][#cell(4)]]],
      [#v(-0.5em) $ A $ ],
      
      [- 시간복잡도는 $cal(O)(N)$입니다.],
    )
  ),

  (
    (
      [- 주어진 문자열을 하나의 집합으로 생각합니다.],
      [- 예를 들어 문자열이 #mono("0011223344")라면 대응되는 집합은 ${0,1,2,3,4}$입니다.],
      [- 숫자는 $10$개 이므로 만들어질 수 있는 집합의 개수는 $2^10 = 1024$개입니다.],
      [- 이제 집합 두 개를 합쳐 크기가 $K$인 집합의 개수를 세면 됩니다.],
    ),
    (
      [- 그럼 크기가 $K$인 집합의 개수는 어떻게 셀까요?],
      [- 만들어질 수 있는 $1024$개의 집합 중 $A union B$의 원소의 개수가 $K$개인 두 집합 $A$, $B$를 순서를 고려하지 않고 뽑습니다.],
      [- $A=B$일 때는 정답에 $(#math.op("cnt")\(A\) times (#math.op("cnt") (A) - 1))/2$를 더합니다.],
      [- $A!=B$일 때는 정답에 $#math.op("cnt") (A) times #math.op("cnt") (B)$를 더합니다.],
      [- 시간복잡도는 $cal(O)(N + 1024^2 times 10)$입니다.],
      [- 비트집합을 사용하면 $cal(O)(N + 1024^2)$으로 줄일 수 있지만, 사용하지 않아도 됩니다.]
    ),
  ),

  (
    (
      [- 주어진 등굣길을 그래프로 모델링해 봅시다.],
      [- 각 칸에 쓰인 수만큼 양쪽 방향으로 떨어진 칸으로 향하는 간선을 만들 수 있습니다.],
      [- 최대 두 번 방향을 반전할 수 있으므로, 같은 칸이라도 $0$번 반전했을 때와 $2$번 반전했을 때는 다르게 생각해야 합니다.],
    ),

    (
      [- 아래와 같은 그래프 모형을 생각할 수 있습니다.],
      [#align(center)[#image("images/time.png", width: 70%)]]
    ),
    (
      [- 문제의 정답은 $1$번 정점에서 학교에 해당하는 정점들까지의 최장거리와 같습니다.],
      [- 구축한 그래프는 사이클 없는 방향 그래프입니다.],
      [- $1$번 정점에서 위상정렬을 시행한 뒤, 정렬한 순서대로 정답을 갱신해나가면 됩니다.],
      [- 학교에 처음 도착한 시간을 늦추는 것에 유의합시다. 학교에서 되돌아가는 간선은 존재할 수 없습니다.],
      [- 시간복잡도는 $cal(O)(N)$입니다.],
    ),
  ),

  (
    (
      // [- BFS의 순회 순서대로 정점에 번호를 붙이겠습니다. 하나를 고정하는 것은 정답에 영향을 미치지 않습니다.],
      // [- 루트 바로 아래에 $k$개의 정점이 존재한다고 합시다.],
      // [- 각 정점을 루트로 하는 서브트리의 크기를 $S_t$라고 합시다.],
      // [- $sum_(t=2)^(k+1) S_i$ 는 루트 노드를 제외한 값이므로 $N-1$입니다.]
    ),

    // (
    //   [- $D_2 = B_2 = 2$이고, $2 < i <= k+1$인 $i$에 대한 $D_i$와 $B_i$값은 아래와 같습니다.],
    //   [#h(2em) #emoji.ast $D_i = sum_(j=2)^(i-1)S_j + 2$],
    //   [#h(2em) #emoji.ast $B_i = i$#v(1em)],
    //   [- $sum_(i=2)^(k+1)|D_i-B_i|=&|2-2|+|S_2+2-3|+|S_2+S_3+2-4|+dots#linebreak()
    //   & + |sum^(k-1)_(j=1)S_j+2-(k+1)| #linebreak() &=|S_1-1| + |S_1+S_2-2| + dots + |sum^(k-1)_(j=1)S_j-(k-1)|$],
    //   [- 여기에서 $S_i>=1$이므로, ]
    // ),
  ),

  (
    (
      [- 팰린드롬 애너그램에서 보였듯, $N$이 짝수인 경우 항상 가능합니다.],
      [- 홀수인 경우에는 한가운데의 원소가 자신의 자리에 있을 때에만 가능합니다.],
      [- 어떻게 최소한의 연산으로 원하는 배열을 만들 수 있을까요?]
    ),
  ),

  (
    (
      [- 하나의 등불이 다른 등불을 앞지르는 횟수가 곧 소원을 비는 횟수입니다.],
      [- 상대적으로 오른쪽의 등불이 상승하는 정도가 더 크면, #linebreak()왼쪽의 등불을 앞지르는 순간이 존재합니다.],
      [- $i<=j$ 에서 $A_i < A_j$인 쌍의 개수를 길이가 $S$인 구간에서 세어줘야 합니다.],
    ),
    (
      [- 간단하게 생각하면 구간 내 원소에 대해서 모든 쌍을 찾는 방법을 떠올릴 수 있습니다.],
      [- 구간 하나에 $cal(O)(N^2)$이므로, 모든 구간에서 계산한다면 $cal(O)(N^3)$으로 시간초과입니다.],
      [- 앞지르는 쌍의 개수를 더 빠르게 구할 수 있을까요?],
    ),
    (
      [- Merge Sort를 응용하면 문제를 조금 더 효율적으로 풀 수 있습니다.],
      [- 두 배열을 합치는 과정에서, 양쪽 배열은 정렬된 상태입니다.],
      [- 왼쪽 절반 배열의 원소가 더 작다면, 해당 원소보다 뒤에 존재하는 원소 모두가 오른쪽에서 고른 원소보다 작습니다.],
      [- 하나의 구간에서 모든 쌍의 개수를 $cal(O)(N log N)$에 구할 수 있습니다.],
      [- 여전히 모든 구간을 확인하는 데 $cal(O)(N^2 log N)$으로, 더 빠른 방법이 필요합니다.],
    ),
    (
      [- 문제의 특성을 파악해서 빠르게 풀어 봅시다.],
      [- $k$번 등불부터 $S$개 고른 구간을 $T_k$라고 합시다.],
      [- $T_k$ 구간과 $T_(k+1)$ 구간의 공통된 구간은 $[k+1, k+S-1]$입니다.],
      [- 공통된 구간에서 발생하는 앞지르는 쌍의 개수는 $k$번째 등불과 $k+S$번째 등불에 영향받지 않습니다.],
      [- 해당 구간의 연산을 하지 않으면 효율적으로 풀 수 있습니다.],
    ),
    (
      [- $T_k $구간에서 다음 구간으로 넘어갈 때 아래의 값들을 빼고 더해줘야 합니다.],
      [#h(2em) #emoji.ast $k$ 번째 등불을 제거했을 때 감소하는 앞지르는 쌍의 개수],
      [#h(2em) #emoji.ast $k+S$ 번째 등불을 추가할 때 증가하는 앞지르는 쌍의 개수],
      [],
      [- 세그먼트 트리를 활용하면 앞지르는 쌍의 개수를 빠르게 구할 수 있습니다.],
      [#h(2em)#emoji.ast $k$번째 등불을 제거할 때, $A_k$보다 상승하는 정도가 큰 등불의 개수],
      [#h(2em)#emoji.ast $k+S$번째 등불을 추가할 때, $A_(k+S)$보다 상승하는 정도가 작은 등불의 개수]
    ),
    (
      [- 주어진 등불 상승 속도의 범위가 최대 $10^9$이므로 좌표압축을 먼저 진행해야 합니다.],
      [- 시간복잡도는 $cal(O)(N log N)$입니다.],

    ),
  )
)


#let create_page(index) = {

  set list(marker: text(fill:KUPC_GREEN)[✓])

  for pg in descriptions.at(index) {
    [
      #constructTitle(contest_problems.at(index), size: 2em, bookmark:false)
      #v(5em)
    ]
  for desc in pg {
    set text(size: 2em)
    pad(left: -1.5em)[#desc]
    v(0em);
  }
    pagebreak(weak: true)
  }
}

