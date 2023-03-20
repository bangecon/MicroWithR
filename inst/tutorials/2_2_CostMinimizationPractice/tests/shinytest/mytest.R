y <- function(x){
    x[1]^0.25 * x[2]^0.75
}
w_ch = 5; r_ch = 25
w_us = 30; r_us = 5
TC_ch <- function(x) {
    w_ch*x[1] + r_ch*x[2]
}
TC_us <- function(x) {
    w_us*x[1] + r_us*x[2]
}
library(Rsolnp)
costminChina <- solnp(
    pars = c(1,1),
    fun = TC_ch,
    ineqfun = y,
    ineqLB = 1,
    ineqUB = Inf,
    LB = c(0,0))
costminUS <- solnp(
    pars = c(1,1),
    fun = TC_us,
    ineqfun = y,
    ineqLB = 1,
    ineqUB = Inf,
    LB = c(0,0))
