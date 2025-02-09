#!/usr/bin/env Rscript


pacman::p_load(
    quarto,
    fs,
    purrr
)

ce_path <- here::here("critical_elements")

qmd_files <- fs::dir_ls(ce_path, glob = "*.qmd")


qmd_files |>
    walk(.f = \(x) quarto_render(
        input = x,
        output_file = path_ext_set(path_ext_remove(path_file(x)), ".docx"),
        quiet = TRUE ), .progress = TRUE
        ) 

    
quarto_render(
        qmd_files[1], 
    output_file = path_file(qmd_files[1])
)
