
(h1 <- min_hash_for_file(system.file("extdat", "index.html", package = "lizzard")))
(h2 <- min_hash_for_file(system.file("extdat", "index1.html", package = "lizzard")))
(h3 <- min_hash_for_file(system.file("extdat", "index2.html", package = "lizzard")))
(h4 <- min_hash_for_file(system.file("extdat", "RMacOSX-FAQ.html", package = "lizzard")))

expect_true(is.character(as.character(h4)))

expect_true(is.integer(as_lzjd_hash(as.character(h4))))

expect_identical(as_lzjd_hash(as.character(h4)), h4)

expect_equal(compute_similarity(h1, h1), 1)

compute_similarity(h1, h2)

compute_similarity(h1, h3)

compute_similarity(h1, h4)

compute_similarity(h2, h3)

compute_similarity(h2, h4)

compute_similarity(h3, h4)


expect_equal(compute_distance(h1, h1), 0)

compute_distance(h1, h2)

compute_distance(h1, h3)

compute_distance(h1, h4)

compute_distance(h2, h3)

compute_distance(h2, h4)

compute_distance(h3, h4)



