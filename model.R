## A basic script to generate a FMD model

library(SimInf)

data("u0_SISe3", package = "SimInf")
data("events_SISe3", package = "SimInf")

model <- SISe3(u0 = u0_SISe3, 1:10, upsilon_1 = 1, upsilon_2 = 1,
      upsilon_3 = 1, gamma_1 = 1, gamma_2 = 1, gamma_3 = 1, alpha = 1,
      beta_t1 = 1, beta_t2 = 1, beta_t3 = 1, beta_t4 = 1, epsilon = 1, end_t1 = 1, end_t2 = 2, end_t3 = 4, end_t4 = 6, events = events_SISe3)

table(events_SISe3$event)
table(events_SISe3$select)
table(events_SISe3$shift)

## Select matrix that we can use straight away with these events. This
## seems like a reasonable structure unless we want to simlify it to
## hj́ust one age category with no ageing events.
model@events@E

## Shift matrix that we can use. If we drop the age categories we can
## eliminate the first two columns. The shift from I to S might be
## useful. Perhaps we just want to start from scratch because we want
## an SIR model and a shift that is for vaccination.
model@events@N
