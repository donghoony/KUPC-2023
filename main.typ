#import "template.typ": *
#import "abstractions.typ" : abstract_page
#import "problems.typ" : contest_problems
#import "problem_info.typ" : info
#import "colors.typ" : *
#import "description.typ" : create_page

#show: project.with()


#abstract_page(problems: contest_problems)

#for i in range(contest_problems.len()) {
  info(contest_problems.at(i))
  create_page(i)
}