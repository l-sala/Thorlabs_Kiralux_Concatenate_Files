# This script combines .tif stacks from the Thorlabs Kyralux 135MUN camera in one single folder
# Luca Sala, PhD
# 30/11/2021
#------------------------------------------------------------------------------------------------

require(filesstrings)

dir = chcoose.dir(default = "", caption = "Select folder")
lista <- list.files(dir, pattern = "*.tif")
lista_senza_suffisso <- str_extract(lista, regex("(.*)_"))

for (f in 1:length(lista_senza_suffisso)){
  dir.create(paste(dir, "/", unique(lista_senza_suffisso[f]), sep = ""))
}

for (w in 1:length(unique(lista_senza_suffisso))){
  ind = which(lista_senza_suffisso %in% unique(lista_senza_suffisso)[w])
  files = lista[ind]
  file.move(paste(dir, "/", files, sep = ""),
            paste(dir, "/", lista_senza_suffisso[ind], sep = ""), overwrite = FALSE)
}
