setwd("~/Lawrence_DataMining")
tsv_fungimeta <- read.table(file = 'results_read_run_tsv.txt', sep = '\t', header = TRUE, quote = "", comment.char = "")
empty_columns <- colSums(is.na(tsv_fungimeta) | tsv_fungimeta == "") == nrow(tsv_fungimeta)

tsv_fungimeta <- tsv_fungimeta[, !empty_columns]
gc()
tsv_fungimeta <- tsv_fungimeta[!is.na(tsv_fungimeta$lat) & !is.na(tsv_fungimeta$lon),]
install.packages("maps")
maps::map(
  "world", # world coastlines
  resolution = 2, # highest resolution
  xlim = c(-180, 180), # area to be plotted
  ylim = c(-90, 90), 
  fill = T, # fill land masses
  col = "grey90", # land color
  border = NA,
  mar = c(0, 0, 0, 0)
)
points(
  tsv_fungimeta$lon,
  tsv_fungimeta$lat,
  pch = 16,
  cex = 0.2
)
table(tsv_fungimeta$environment_biome)

