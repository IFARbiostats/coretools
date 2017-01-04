#' ggplot scatter plot with lm
#'
#' @import ggplot2
#' @export

gglm <- function(dt, x, y){
  out <- NULL
  lm_formula <- as.formula(paste0(y, " ~ ", x))
  fit_lm <- lm(lm_formula, data = dt)
  lm_equation <- paste0("y = ", signif(fit_lm$coef[[2]], 3), " * x + ",
                        signif(fit_lm$coef[[1]], 3))
  dt <- eval(parse(text = paste0(
    "filter(dt, !is.na(", x, ") & !is.na(", y, "))"
  )))
  out[[1]] <- ggplot(dt, aes_string(x = x, y = y)) +
    geom_point() +
    stat_smooth(method = "lm", col = "red") +
    labs(caption = paste0(
      "Adjusted R^2 = ", signif(summary(fit_lm)$adj.r.squared, 2),
      "\nP value = ", signif(summary(fit_lm)$coef[2,4], 4),
      "\n", lm_equation
    )) +
    theme_minimal()
  out[[2]] <- data.frame(
    x = x,
    y = y,
    r2 = summary(fit_lm)$adj.r.squared,
    p = summary(fit_lm)$coef[2,4]
  )
  return(out)
}
