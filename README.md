
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Signed
by](https://img.shields.io/badge/Keybase-Verified-brightgreen.svg)](https://keybase.io/hrbrmstr)
![Signed commit
%](https://img.shields.io/badge/Signed_Commits-100%25-lightgrey.svg)
[![Linux build
Status](https://travis-ci.org/hrbrmstr/lizzard.svg?branch=master)](https://travis-ci.org/hrbrmstr/lizzard)  
![Minimal R
Version](https://img.shields.io/badge/R%3E%3D-3.2.0-blue.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

# lizzard

Compute and Compare Lempel-Ziv Jaccard (LZJD) Similarity Hashes

## Description

The Lempel-Ziv Jaccard Distance (LZJD) is a method to measure the
similarity between binary byte sequences. Tools are provided that wrap
Java methods by Raff et al, (2017) (arXiv:1708.03346v2) for computing
and comparing LZJD hashes.

## What’s Inside The Tin

The following functions are implemented:

  - `as_lzjd_hash`: Turn an base 64 encoded LZJD hash into an lzjd\_hash
    object
  - `as.character.lzjd_hash`: Turn an lzhd\_hash object into a base 64
    encoded string
  - `compute_distance`: Compute the distance between two LZJD hashes
  - `compute_similarity`: Compute the similarity between two LZJD hashes
  - `min_hash_for_file`: Compute the LZJD hash for a file

## Installation

``` r
remotes::install_git("https://git.rud.is/hrbrmstr/lizzard.git")
# or
remotes::install_git("https://git.sr.ht/~hrbrmstr/lizzard")
# or
remotes::install_gitlab("hrbrmstr/lizzard")
# or
remotes::install_bitbucket("hrbrmstr/lizzard")
# or
remotes::install_github("hrbrmstr/lizzard")
```

NOTE: To use the ‘remotes’ install options you will need to have the
[{remotes} package](https://github.com/r-lib/remotes) installed.

## Usage

``` r
library(lizzard)

# current version
packageVersion("lizzard")
## [1] '0.1.0'
```

  - `index.html` is a static copy of a blog main page with a bunch of
    `<div>`s with article snippets
  - `index1.html` is the same file as `index.htmnl` with a changed cache
    timestamp at the end
  - `index2.html` is the same file as `index.html` with one article
    snippet removed
  - `RMacOSX-FAQ.html` is the CRAN ‘R for Mac OS X FAQ’

<!-- end list -->

``` r
(h1 <- min_hash_for_file(system.file("extdat", "index.html", package = "lizzard")))
## <lzjd_hash>

(h2 <- min_hash_for_file(system.file("extdat", "index1.html", package = "lizzard")))
## <lzjd_hash>

(h3 <- min_hash_for_file(system.file("extdat", "index2.html", package = "lizzard")))
## <lzjd_hash>

(h4 <- min_hash_for_file(system.file("extdat", "RMacOSX-FAQ.html", package = "lizzard")))
## <lzjd_hash>

str(h4, 1)
##  'lzjd_hash' int [1:1024] -2147454987 -2147257791 -2146600770 -2146541478 -2146366824 -2146162740 -2146022774 -2145538333 -2145157878 -2144913431 ...

as.character(h4)
## [1] "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"

str(as_lzjd_hash(as.character(h4)), 1)
##  'lzjd_hash' int [1:1024] -2147454987 -2147257791 -2146600770 -2146541478 -2146366824 -2146162740 -2146022774 -2145538333 -2145157878 -2144913431 ...

identical(as_lzjd_hash(as.character(h4)), h4)
## [1] TRUE

compute_similarity(h1, h1)
## [1] 1
compute_distance(h1, h1)
## [1] 0

compute_similarity(h1, h2)
## [1] 0.6344773
compute_distance(h1, h2)
## [1] 0.3655227

compute_similarity(h1, h3)
## [1] 0.6241079
compute_distance(h1, h3)
## [1] 0.3758921

compute_similarity(h1, h4)
## [1] 0.09753483
compute_distance(h1, h4)
## [1] 0.9024652

compute_similarity(h2, h3)
## [1] 0.8334825
compute_distance(h2, h3)
## [1] 0.1665175

compute_similarity(h2, h4)
## [1] 0.09460182
compute_distance(h2, h4)
## [1] 0.9053982

compute_similarity(h3, h4)
## [1] 0.093433
compute_distance(h3, h4)
## [1] 0.906567
```

## lizzard Metrics

| Lang  | \# Files |  (%) | LoC |  (%) | Blank lines |  (%) | \# Lines |  (%) |
| :---- | -------: | ---: | --: | ---: | ----------: | ---: | -------: | ---: |
| Java  |        5 | 0.38 | 972 | 0.81 |         222 | 0.78 |      268 | 0.77 |
| Maven |        1 | 0.08 |  70 | 0.06 |           0 | 0.00 |        0 | 0.00 |
| XML   |        1 | 0.08 |  69 | 0.06 |           0 | 0.00 |        0 | 0.00 |
| R     |        4 | 0.31 |  49 | 0.04 |          27 | 0.10 |       45 | 0.13 |
| Rmd   |        1 | 0.08 |  30 | 0.02 |          31 | 0.11 |       34 | 0.10 |
| make  |        1 | 0.08 |  11 | 0.01 |           4 | 0.01 |        0 | 0.00 |

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
