##' Plot a tree diagram for a simple 2x2 game theory model.
##'
##' @details \code{gameTree} draws a game tree with specified players ("Player 1" and "Player 2) who sequentially choose from the same strategies ("Collude" or "Defect") to earn payoffs.
##'
##' @param players is a character vector of name labels for the players in each stage (default is \code{c("Player 1", "Player 2")}.
##' @param strategies is a character vector of name labels for the strategies (default is \code{c("Collude", "Defect")}.
##' @param payoffs1 is a numerical vector of length 4 listing the payoffs of player 1 (default is \code{c(0, 0, 0, 0)})
##' @param payoffs2 is a numerical vector of length 4 listing the payoffs of player 2 (default is \code{c(0, 0, 0, 0)})
##'
##' @return A ggplot object with a 2x2 game tree.
##'
##' @export

gameTree <-
  function(players = c("Player 1", "Player 2"),
           strategies = c("Collude", "Defect"),
           payoffs1 = NULL,
           payoffs2 = NULL) {
    players <- c(players[1], rep(players[2], 2))
    if (is.null(payoffs1)) {
      payoffs1 <- c(0, 0, 0, 0)
    }
    if (is.null(payoffs2)) {
      payoffs2 <- c(0, 0, 0, 0)
    }
    payoffs <- paste0("(", payoffs1, ", ", payoffs2, ")")
    nodes <-
      data.frame(
        label = c(players, payoffs),
        x = c(0, 1, 1, 2, 2, 2, 2),
        y = c(0, 1, -1, 1.5, 0.5, -0.5, -1.5)
      )
    out <-
      ggplot(data = nodes, mapping = aes(x = x, y = y, label = label)) +
      geom_point() +
      xlim(c(-0.5, 3)) +
      ylim(c(-2, 2)) +
      theme_void() +
      geom_text(
        hjust = c(1, 1, 1, 0, 0, 0, 0),
        vjust = c(0.5, 0, 1, 0.5, 0.5, 0.5, 0.5),
        nudge_x = c(-0.1, -0.1, -0.1, 0.1, 0.1, 0.1, 0.1)
      ) +
      geom_segment(arrow = arrow(length = unit(0.30, "cm"), type = "closed"),
                   aes(
                     x = 0,
                     y = 0,
                     xend = 1,
                     yend = 1
                   )) +
      geom_segment(arrow = arrow(length = unit(0.30, "cm"), type = "closed"),
                   aes(
                     x = 1,
                     y = 1,
                     xend = 2,
                     yend = 1.5
                   )) +
      geom_segment(arrow = arrow(length = unit(0.30, "cm"), type = "closed"),
                   aes(
                     x = 1,
                     y = 1,
                     xend = 2,
                     yend = 0.5
                   )) +
      geom_segment(arrow = arrow(length = unit(0.30, "cm"), type = "closed"),
                   aes(
                     x = 0,
                     y = 0,
                     xend = 1,
                     yend = -1
                   )) +
      geom_segment(arrow = arrow(length = unit(0.30, "cm"), type = "closed"),
                   aes(
                     x = 1,
                     y = -1,
                     xend = 2,
                     yend = -1.5
                   )) +
      geom_segment(arrow = arrow(length = unit(0.30, "cm"), type = "closed"),
                   aes(
                     x = 1,
                     y = -1,
                     xend = 2,
                     yend = -0.5
                   )) +
      geom_text(x = 0.5, y =  0.50, label = strategies[1]) +
      geom_text(x = 0.5, y = -0.50, label = strategies[2]) +
      geom_text(x = 1.5, y =  1.25, label = strategies[1]) +
      geom_text(x = 1.5, y =  0.75, label = strategies[2]) +
      geom_text(x = 1.5, y = -0.75, label = strategies[1]) +
      geom_text(x = 1.5, y = -1.25, label = strategies[2])
      out
  }
