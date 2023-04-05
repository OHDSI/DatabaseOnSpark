# DatabaseOnSpark

## Editing the Databricks User Group Site

The Databricks User Group site is created with RMarkdown, rendered to HTML using rmarkdown::render_site(), and deployed via GitHub Pages.

The site can be edited by: 
1. Forking the DatabaseOnSpark repository
1. Making edits to the documents in the **rmd** directory
    - The elements of the navbar and overall structure of the site are defined in the **_site.yml** file 
    - The content for each individual page are in ***.rmd** files
1. Running the function **rmarkdown::render_site('rmd')**, which parses the contents of the **rmd** directory and outputs to the **docs** directory
1. Commiting changes to your fork of DatabaseOnSpark and opening a pull request at OHDSI/DatabaseOnSpark

[More information](https://pkgs.rstudio.com/rmarkdown/reference/render_site.html) on the **render_site()** function
