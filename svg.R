suppressMessages(library(svglight))

#' Convert a ggplot object to an SVG string
toSVG <- function(g){
    svg <- svgstring(fix_text_size = FALSE, standalone = FALSE)
    plot(g)
    invisible(dev.off())
    s <- svg()

    # This is a hack to fix issue #168 from r-lib/svglite
    xlink_def <- ' xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"'
    s <- sub("(<svg class[^>]*)(.*)", paste("\\1", xlink_def, "\\2"), s)

    s
}
