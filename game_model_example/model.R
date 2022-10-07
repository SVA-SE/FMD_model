args <- commandArgs(trailingOnly = TRUE)
library(SimInf)
model <- function(U_path,
                  events_path,
                  output_path) {
    events <- read.csv(events_path)
    tspan <- seq(min(events$time), max(events$time))
    u0 <- read.csv(U_path)
    model <- SIR(u0     = u0,
                 tspan  = tspan,
                 events = events,
                 beta   = 0.16,
                 gamma  = 0.077)
    compartments <- rownames(model@u0)
    result <- trajectory(run(model))[, compartments]
    write.csv(result, file = output_path, row.names = FALSE)
}

model(U_path = args[1],
      events_path= args[2],
      output_path= args[3])
