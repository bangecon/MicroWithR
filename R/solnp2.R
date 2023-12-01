##' Maximize a function with `solnp()`..
##'
##' This is a wrapper function adds an option to `Rsolnp::solnp()` to switch to maximization instead of minimization..
##'
##' @param pars The starting parameter vector.
##' @param fun The main function which takes as first argument the parameter vector and returns a single value.
##' @param eqfun (Optional) The equality constraint function returning the vector of evaluated equality constraints.
##' @param eqB (Optional) The equality constraints.
##' @param ineqfun (Optional) The inequality constraint function returning the vector of evaluated inequality constraints.
##' @param ineqLB (Optional) The lower bound of the inequality constraints.
##' @param ineqUB (Optional) The upper bound of the inequality constraints.
##' @param LB (Optional) The lower bound on the parameters.
##' @param UB (Optional) The upper bound on the parameters.
##' @param control (Optional) The control list of optimization parameters. See below for details.
##' @param type is a logical value indicating whether to clear the main tutorial or practice.
##' @export

solnp2 <-
  function(pars,
           fun,
           eqfun = NULL,
           eqB = NULL,
           ineqfun = NULL,
           ineqLB = NULL,
           ineqUB = NULL,
           LB = NULL,
           UB = NULL,
           max = FALSE,
           control = list(),
           ...) {
    if (max == TRUE) {
      fun2 <- function(x) -1*fun(x)
      } else {
      fun2 <- function(x) fun(x)
      }
    out <-
      Rsolnp::solnp(
        pars = pars,
        fun = fun2,
        eqfun = eqfun,
        eqB = eqB,
        ineqfun = ineqfun,
        ineqLB = ineqLB,
        ineqUB = ineqUB,
        LB = LB,
        UB = UB,
        control = control
      )
    if (max == TRUE) {
      out$values <- -out$values
      out$lagrange <- -out$lagrange
      out$hessian <- -out$hessian
    }
    out
  }
