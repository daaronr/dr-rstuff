save_kable_htmlW2 <- function (x, file, bs_theme, self_contained, extra_dependencies, 
          density, ...) 
{
  dependencies <- list(rmarkdown::html_dependency_jquery(), 
                       rmarkdown::html_dependency_bootstrap(theme = bs_theme), 
                       html_dependency_lightable(), html_dependency_kePrint())
  if (!is.null(extra_dependencies)) {
    dependencies <- append(dependencies, extra_dependencies)
  }
  html_header <- htmltools::tags$head(dependencies)
  html_table <- htmltools::HTML(as.character(x))
  html_result <- htmltools::tagList(html_header, html_table)
  if (tools::file_ext(file) %in% c("png", "jpg", "jpeg", "pdf")) {
    file_temp_html <- tempfile(pattern = tools::file_path_sans_ext(basename(file)), 
                               fileext = ".html")
    file.create(file_temp_html)
    file_temp_html <- normalizePath(file_temp_html)
    file.create(file)
    file <- normalizePath(file)
    temp_dir <- sub(pattern = "^[\\\\/]{1,2}", replacement = "", 
                    tempfile(pattern = "lib", tmpdir = "", fileext = ""))
    save_HTML(html_result, file = file_temp_html, libdir = temp_dir, 
              self_contained = FALSE)
    result <- webshot2::webshot(file_temp_html, file, ...)
    if (is.null(result)) {
      file.remove(file)
      file.remove(file_temp_html)
      message("save_kable could not create image with webshot package. Please check for any webshot messages")
    }
    else {
      if (tools::file_ext(file) == "pdf") {
        message("Note that HTML color may not be displayed on PDF properly.")
      }
      file.remove(file_temp_html)
      unlink(file.path(dirname(file_temp_html), temp_dir), 
             recursive = TRUE)
      if (requireNamespace("magick", quietly = TRUE)) {
        img_rework <- magick::image_read(file, density = density)
        img_rework <- magick::image_trim(img_rework)
        img_info <- magick::image_info(img_rework)
        magick::image_write(img_rework, file, density = density)
        attr(file, "info") <- img_info
      }
      else {
        message("save_kable will have the best result with magick installed. ")
      }
    }
  }
  else {
    file.create(file)
    file <- normalizePath(file)
    if (self_contained) {
      temp_dir <- sub(pattern = "^[\\\\/]{1,2}", replacement = "", 
                      tempfile(pattern = "lib", tmpdir = "", fileext = ""))
      save_HTML(html_result, file = file, libdir = temp_dir, 
                self_contained = TRUE)
      self_contained(file, file)
      unlink(file.path(dirname(file), temp_dir), recursive = TRUE)
    }
    else {
      save_HTML(html_result, file = file, self_contained = FALSE)
    }
  }
  return(invisible(file))
}

