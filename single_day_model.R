library(SimInf)
## Create an 'SIR' model with 1600 nodes and initialize
## it to run over 4*365 days. Add one infected individual
## to the first node.

## Start with the u0 according to the sample data in the package and
## add a single infected individual:
u0 <- u0_SIR()
u0$I[1] <- 1

## Just run the model for the first day:
tspan <- 1
events <- events_SIR()
events_today<- events[events$time %in% tspan, ]

model <- SIR(u0     = u0,
             tspan  = tspan,
             events = events_today,
             beta   = 0.16,
             gamma  = 0.077)
compartments <- rownames(model@u0)


## Run the model to generate a single stochastic trajectory.
result <- trajectory(run(model))
u0 <- result[, compartments]

## Run the model the next day
tspan <- 2
events_today<- events[events$time %in% tspan, ]

model <- SIR(u0     = u0,
             tspan  = tspan,
             events = events_today,
             beta   = 0.16,
             gamma  = 0.077)


## Run the model to generate a single stochastic trajectory.
result <- trajectory(run(model))
u0 <- result[, compartments]

## Continue with the model on the next day and so one...


## When you run the model you have the posibility to inject or remove
## events from the events data object. I think it might be nice if we
## use the predefied events as a baseline and then we can make
## decisions in the game that results in add or removing from these
## daily events. If we do nothing the events just keep ticking
## away. The Beta and gamma parameters in the model are the
## infectiousness and inverse of recovery respectively and have not
## jyet been set to reasonable values but this could be a starting point.
