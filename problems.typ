#let raw_problems = (
  // Div.2 Number, Div.1 Number, Title, Difficulty, 예상 티어 "bsgpdr" 중 하나, 출제진 튜플 - 1명인 경우 뒤에 콤마 붙여야함
  // 정해 알고리즘, div2(AC, submission), div2 퍼솔, Div1(AC, submissions), Div1 퍼솔
    ("A", " ", "얼룩말을 찾아라!", "Beginner", "b", 
                (("이동훈", "aru0504"),), "implementation, string", 
                (19, 33), ("권순호", 4), (0, 0), ("-", 0)),
    ("B", "A", "이제는 더 이상 물러날 곳이 없다", "Easy", "b", 
                (("이동훈", "aru0504"),), "game_theory, ad_hoc", 
                (21, 24), ("권순호", 5), (28, 28), ("김태현", 0)),

    ("C", " ", "바닥수", "Easy", "b", 
                (("이동훈", "aru0504"), ("윤찬규", "dldyou")), "constructive, math", 
                (13, 24), ("권순호", 9), (0, 0), ("-", 0)),

    ("D", "B", "단체줄넘기", "Easy", "b", 
                (("이동훈", "aru0504"),), "implementation", 
                (21, 27), ("최승현", 13), (28, 43), ("장은준", 3)),

    ("E", " ", "팰린드롬 애너그램", "Normal", "s", 
                (("이동훈", "aru0504"),), "ad_hoc", 
                (14, 61), ("박서진", 14), (0, 0), ("-", 0)),

    ("F", "C", "현수막 걸기", "Normal", "s", 
                (("김수현", "creampuffshu"),), "binary_search", 
                (4, 21),  ("박서진", 66), (17, 100), ("나윤상", 13)),

    ("G", " ", "스위치", "Normal", "s", 
                (("윤찬규", "dldyou"),), "dynamic_programming", 
                (4, 13), ("박서진", 31), (0, 0), ("-", 0)),

    ("H", "D", "낚시", "Normal", "g", 
                (("이동훈", "aru0504"),), "prefix_sum", 
                (12, 43),  ("박서진", 55), (22, 63), ("이승엽", 15)),

    (" ", "E", "시간낭비", "Hard", "g", 
                (("이동훈", "aru0504"),), "dynamic_programming, graphs, topological_sorting",
                (0, 0),  ("-", 0), (5, 68), ("이승엽", 57)),

    (" ", "F", "K-문자열", "Hard", "g", 
                (("김명기", "riroan"),), "string, bitmask, combinatorics", 
                (0, 0),  ("-", 0), (8, 34), ("나윤상", 37)),
    
    ("I", "G", "MEXchange", "Hard", "g", 
                (("김명기", "riroan"),), "ad_hoc, constructive", 
                (3, 25),  ("박서진", 133), (4, 16), ("이승엽", 52)),
    
    (" ", "H", "등불 날리기", "Challenging", "p", 
                (("윤찬규", "dldyou"),), "segment_tree, sliding_window", 
                (0, 0),  ("-", 0), (3, 19), ("황재상", 111)),

    (" ", "I", "우정은 BFS처럼, 사랑은 DFS처럼", "Challenging", "p",
                (("이동훈", "aru0504"), ("윤찬규", "dldyou")), "constructive, greedy, graph_traversal", 
                (0, 0),  ("-", 0), (0, 2), ("-", 0)),

    ("J", "J", "양손 정렬", "Challenging", "p",
                (("이동훈", "aru0504"), ("윤찬규", "dldyou"), ("김명기", "riroan")), "permutation_cycle_decomposition", 
                (0, 3),  ("-", 0), (0, 8), ("-", 0)),
)

#let contest_problems = raw_problems.map( problem => {
  (
    d2: problem.at(0),
    d1: problem.at(1),
    title: problem.at(2),
    difftext: problem.at(3),
    diff: problem.at(4),
    setter: problem.at(5),
    algorithms: problem.at(6),
    d2_stat: problem.at(7),
    d2_first_ac: problem.at(8),
    d1_stat: problem.at(9),
    d1_first_ac: problem.at(10)
  )
})
