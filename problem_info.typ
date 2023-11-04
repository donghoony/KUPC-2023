#import "colors.typ" : *
#import "abstractions.typ" : pick_color

#let mono(s, color: black) = {text(font: "Inconsolata", fill: color)[#s]}

#let isDiv1(problem) = {
  return problem.d1.trim().len() != 0
}

#let isDiv2(problem) = {
  return problem.d2.trim().len() != 0
}

#let constructTitle(problem, size: 2.5em, bookmark: true) = {
  let title = "";
  if (isDiv2(problem)) {title += "2" + problem.d2}
  if (isDiv2(problem) and isDiv1(problem)) {title += "/"}
  if (isDiv1(problem)) {title += "1" + problem.d1}
  
  if (bookmark == true) {
      heading()[#text(title, weight: 600, fill:KUPC_GREEN, size:size)#text(". " + problem.title, weight: 400, fill:KUPC_GREEN, size:size)]
  }
  else {
    set text(size: size)
    text(title, weight: 600, fill:KUPC_GREEN)
    text(". " + problem.title, weight: 400, fill:KUPC_GREEN)
  }
  text("")
}

#let printDetails(problem, size: 1.5em) = {
  set text(size: 1.5em)
  v(-1em)
  text(font: "Inconsolata")[#problem.algorithms]
  linebreak()
  v(0em)
  text[출제진 의도 - #text(weight: 600, problem.difftext, fill: pick_color(tier: problem.diff))]
}

#let printStat(problem) = {
  set text(size: 2em)
  let d1_submit_count = problem.d1_stat.at(1)
  let d1_ac_count = problem.d1_stat.at(0)
  
  let d1_rate_count = d1_submit_count
  if (d1_submit_count == 0) {d1_rate_count = 1}
  let d1_ac_rate = calc.round(d1_ac_count / d1_rate_count * 100, digits: 2);

  let d2_submit_count = problem.d2_stat.at(1)
  let d2_ac_count = problem.d2_stat.at(0)
  
  let d2_rate_count = d2_submit_count
  if (d2_submit_count == 0) {d2_rate_count = 1}
  let d2_ac_rate = calc.round(d2_ac_count / d2_rate_count * 100, digits: 2);

  let d1_first_ac = problem.d1_first_ac.at(0)
  let d1_ac_at = problem.d1_first_ac.at(1)
  let d2_first_ac = problem.d2_first_ac.at(0)
  let d2_ac_at = problem.d2_first_ac.at(1)

  if (isDiv1(problem) == false) {d1_submit_count = "─ "; d1_ac_count = "─ "; d1_ac_rate = "─ "}
  if (isDiv2(problem) == false) {d2_submit_count = "─ "; d2_ac_count = "─ "; d2_ac_rate = "─ "}

  list(marker: [#text("🦆", size:1.2em)],
    text[제출 #d2_submit_count\회, 정답 #d2_ac_count\명 (정답률 #d2_ac_rate\%)#v(0.5em)],
  )
  
  list(marker: [#text("🥇", size:1.2em)],
    [#if (isDiv2(problem) == true and d2_ac_count != 0) { [#d2_first_ac, #d2_ac_at\분] } else {"─"}]
  )
  v(2em)
  list(marker: [#text("🪿", size:1.2em)],
    text[제출 #d1_submit_count\회, 정답 #d1_ac_count\명 (정답률 #d1_ac_rate\%)#v(0.5em)]
  )
  list(marker: [#text("🥇", size:1.2em)],
    [#if (isDiv1(problem) == true and d1_ac_count != 0) {[#d1_first_ac, #d1_ac_at\분]} else {"─"}]
  )
}

#let printSetter(problem) = {
  set text(size: 2em)
  let setter_names = problem.setter.map(setter => {
    text(setter.at(0) + " ")
    text(setter.at(1), size: 0.8em, font: "Inconsolata", fill: gray)
  }).join(", ")

  v(2em)
  list(marker: [#text("📣", size:1.2em)],
    [#setter_names]
  )
  v(1em)
}

#let info(problem) = {

  pad(left: -1em)[

    #v(1em)
    
    #pad(left: 0em)[
      #constructTitle(problem)
      #linebreak()
      #v(1em)
      #printDetails(problem)
      #v(5em)
    ]

    #pad(left: -2em)[
      #printStat(problem)
      #printSetter(problem)
    ]
  ]
  pagebreak()

  
}