I want to use huxreg

- it seems easier to manipulate
- I like working with tidy model objects
- formats look cool

But here are my stumbling blocks:

1. Titles and captions -- no easy approach

2. How to show exponentiated coefficients after, e.g., polr? I only could manage this by doing a separate `broom::tidy(conf.int = TRUE, exponentiate = TRUE)` ... But that gets rid of the number of observations and I can't get them back easily.  I can't seem to get `tidy_override` to help with this.

None of the commented out stuff belowseems to help, broom gets rid of the number of obs anyways:

```
 polr(
    m_f(cat_out, {{rhs}}), data = df, Hess = TRUE
    ) %>%
#tidy_override(glance = list(nobs = 1000L, r.squared = 0.000,  extend = TRUE)) %>%
    broom::tidy(conf.int = TRUE, exponentiate = TRUE) %>%
#broom.helpers::tidy_and_attach(conf.int = TRUE, exponentiate = TRUE) %>%
#broom.helpers::tidy_add_n() %>%

    ```

3. I want to save the model objects as well (to use in other ways) but I can't get that to work with my function thing, so I end up having to run the whole thing twice.

E.g.,

```
ol_mdl <- function(df, rhs) {
  polr(
    m_f(cat_out, {{rhs}}), data = df, Hess = TRUE
    ) %>%
    broom::tidy(conf.int = TRUE, exponentiate = TRUE) %>%
    dplyr::arrange(-str_detect(term, 'd2sd')) %>%
      mutate(
        term = str_replace_all(term, c("where_live_cat" = "Where live: ")
            }
```


Note

```
m_f

function(lhs, rhs) {
  as.formula(paste(lhs," ~ ", paste(rhs, collapse= "+")))
}
```

I want to separate the 'pre-tidy' part of the above out in order to preserve the model object itself. I could split up the function, but I can't figure out how to have the _output_ model object (results) as the input to a second function.

4. Not sure how to manipulate the object 'Classes ‘huxtable’ and 'data.frame'  at the end. (Probably I just need to read the docs on this?)

5. I haven't managed to get a beautiful format for the regression table

6. The display *within* Rstudio is not great, and I sometimes need to show intermediate output without building my big bookdown every time.
