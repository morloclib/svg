suppressMessages(library(svglite))

data("iris")

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

#' Make a ggplot scatterplot from the iris data
scatterTest <- function(){
    ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
        geom_point()
}

# For now, SVGs are just strings, I'll make them flexible typeclasses later on
packSVG <- function(x) x
unpackSVG <- function(x) x
