#' Compute the LZJD hash for a file
#'
#' @param path path to file (it will be [path.expand()]ed).
#' @return a `lzjd_hash` object which corresponds to a `jsat.classifiers.DataPoint`
#'         (<https://github.com/EdwardRaff/JSAT/blob/master/JSAT/src/jsat/classifiers/DataPoint.java)>
#'         object which, in this case, is an integer vector.
#' @export
#' @examples
#' h1 <- min_hash_for_file(system.file("extdat", "index.html", package = "lizzard"))
min_hash_for_file <- function(path) {

  path <- path.expand(path[1])
  stopifnot(file.exists(path))

  jlzjdf <- J("com.edwardraff.jlzjd.LZJDf")
  File <- J("java.io.File")

  res <- jlzjdf$getMHforFile(.jnew(File, path))

  class(res) <- c("lzjd_hash")

  res

}

#' Compute the similarity between two LZJD hashes
#'
#' @param h1,h2 LZJD hashes
#' @return numeric similarity value (0-1)
#' @export
compute_similarity <- function(h1, h2) {

  stopifnot(inherits(h1, "lzjd_hash"))
  stopifnot(inherits(h2, "lzjd_hash"))

  jlzjdf <- J("com.edwardraff.jlzjd.LZJDf")

  jlzjdf$similarity(unclass(h1), unclass(h2))

}

#' Compute the distance between two LZJD hashes
#'
#' @param h1,h2 LZJD hashes
#' @return numeric distance value (0-1)
#' @export
compute_distance <- function(h1, h2) {

  stopifnot(inherits(h1, "lzjd_hash"))
  stopifnot(inherits(h2, "lzjd_hash"))

  jlzjdf <- J("com.edwardraff.jlzjd.LZJDf")

  jlzjdf$dist(unclass(h1), unclass(h2))

}

#' @rdname min_hash_for_file
#' @param x, an `lzhd_hash` object
#' @param ... ignored
#' @export
print.lzjd_hash <- function(x, ...) {
  cat("<lzjd_hash>")
}

#' Turn an `lzhd_hash` object into a base 64 encoded string
#'
#' @param x, an `lzhd_hash` object
#' @param ... ignored
#' @return character
#' @export
as.character.lzjd_hash <- function(x, ...) {

  jlzjdf <- J("com.edwardraff.jlzjd.LZJDf")
  ret <- jlzjdf$toBase64(unclass(x))
  if (ret == "") NA_character_ else ret

}

#' Turn an base 64 encoded LZJD hash into an `lzjd_hash` object
#'
#' @param x base 64 encoded LZJD
#' @return `lzjd_hash`
#' @export
as_lzjd_hash <- function(x) {

  x <- x[1]
  stopifnot(is.character(x))

  jlzjdf <- J("com.edwardraff.jlzjd.LZJDf")
  ret <- jlzjdf$fromBase64(x)
  if (length(ret)) {
    class(ret) <- c("lzjd_hash")
    ret
  } else {
    return(NULL)
  }

}

