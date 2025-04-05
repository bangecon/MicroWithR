edgeworthBox <- function(Q1_h = NULL, E_h = c(10,0), E_f = c(0,10), alpha = 0.5, beta = 0.5, contract = TRUE, budget = TRUE, mrs = FALSE, solution = TRUE, ...) {
  E  <- E_h + E_f
  E1 <- E[1]; E2 <- E[2]
  a  <- alpha/(1-alpha)
  b  <- beta/(1-beta)
  Q1_h_star <- (b*E_h[1]*E_f[2]+(1+b)*E1*E_h[2]-b*E_f[1]*E_h[2]) /
    (((b/a)+b)*E_f[2]+(1+b)*E_h[2])
  Q2_h_star <- b*Q1_h_star*E2/(a*(E1-Q1_h_star)+b*Q1_h_star)
  if(is.null(Q1_h)) {
    Q1_h <- Q1_h_star
  }
  Q1_h <- sort(Q1_h)
  Q2_h <- b*Q1_h*E2/(a*(E1-Q1_h)+b*Q1_h)
  U_h <- function(x) {
    x1_h <- x[1]; x2_h <- x[2]
    x1_h^alpha * x2_h^(1-alpha)
  }
  V_f <- function(x) {
    x1_h <- x[1]; x2_h <- x[2]
    (E1-x1_h)^beta * (E2-x2_h)^(1-beta)
  }
  Ustar_h <- Q1_h^alpha * Q2_h^(1-alpha)
  Vstar_f <- (E1-Q1_h)^beta * (E2-Q2_h)^(1-beta)
  MRS <- a*Q2_h/Q1_h
  # Initialize the graphics options
  hues = seq(15, 375, length = length(Q1_h) + 1)
  cols = hcl(h = hues, l = 65, c = 100)[1:length(Q1_h)]
  p <- ggplot(data = data.frame(x = 0), mapping = aes(x = x)) +
    geom_point(aes(x = E_h[1], y = E_h[2]), color = 'black') +
    geom_vline(xintercept = E1) + geom_hline(yintercept = E2) +
    annotate('text', x = E_h[1], y = E_h[2]+0.025*E2, label = 'E', size = 18) +
    xlim(0, E1) + ylim(0, E2) +
    labs(x = bquote(~Q[1]^h), y = bquote(~Q[2]^h)) +
    theme(text = element_text(size = 18))
  for(i in 1:length(Q1_h)){
    p <- p +
      stat_function(fun = function(x,i) (Ustar_h[i]/(x^alpha))^(1/(1-alpha)),
                    args = list(i = i), color = cols[length(cols)-i+1]) +
      stat_function(fun = function(x,i) E2 - (Vstar_f[i]/((E1-x)^beta))^(1/(1-beta)),
                    args = list(i = i), color = cols[i])
    if(budget) {
      p <- p +
        stat_function(fun = function(x,i) ((E_h[2]+E_h[1]*(E_h[2]-Q2_h[i])/(Q1_h[i]-E_h[1]))
                                           +x*(Q2_h[i]-E_h[2])/(Q1_h[i]-E_h[1])),
                      args = list(i = i), color = 'gray', lty = 2)
    }
    if(mrs) {
      p <- p +
        stat_function(fun = function(x,i) (Q2_h[i]*(1+a)-a*x*(Q2_h[i]/Q1_h[i])),
                      args = list(i = i), color = 'gray', lty = 3)
    }
  }
  if(contract) {
    p <- p + stat_function(fun = function(x) b*x*E2/(a*(E1-x)+b*x))
  }
  if(solution) {
    Ulabel <- paste("q^h == ", round(Q1_h_star, 2), round(Q2_h_star, 2), "\n",
                    "U == ", U_h(c(Q1_h_star, Q2_h_star)))
    p<- p +
      # stat_function(fun = function(x,i) (U_h(c(Q1_h_star, Q2_h_star))/(x^alpha))^(1/(1-alpha)),
      #               args = list(i = i), color = 'black') +
      # stat_function(fun = function(x,i) E2 - (V_f(c(Q1_h_star, Q2_h_star))/
      #                                           ((E1-x)^beta))^(1/(1-beta)),
      #               args = list(i = i), color = 'black') +
      geom_point(aes(x = Q1_h_star, y = Q2_h_star), color = 'black', shape = 8) +
      geom_abline(slope = (Q2_h_star-E_h[2])/(Q1_h_star-E_h[1]),
                  intercept = E_h[2]-E_h[1]*(Q2_h_star-E_h[2])/(Q1_h_star-E_h[1]))
      # annotate('text', x = Q1_h_star, y = Q2_h_star+0.025*E2,
      #           label = Ulabel, parse = TRUE)
               # label = paste('q[h] == (', round(Q1_h_star, 2), ', ',
               #                    round(Q2_h_star, 2), ') \n ',
               #                    'U(q[h]) == ', round(U_h(c(Q1_h_star, Q2_h_star)), 2), sep = ''),
               # parse = TRUE)
  }
  out <- list(
    Home.Consumption = c(Q1_h_star, Q2_h_star),
    Foreign.Consumption = c(E1 - Q1_h_star, E2 - Q2_h_star),
    Terms.of.Trade = c(abs((Q2_h_star - E_h[2])/(Q1_h_star - E_h[1])), 1),
    p = p
  )
  out
}
