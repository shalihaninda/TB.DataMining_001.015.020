lokasi_kerja <- "D:/SHALIHA.001/3A/DATA MINING/Tugas Besar/wd"
setwd(lokasi_kerja)
getwd()

dataset <- read.csv("buddymove_holidayiq.csv", sep = ",")
head(dataset)


#K-Means
cl <- kmeans(dataset[2:3], 3)

cl

cl$size

cl$centers

plot(dataset[2:3], col = cl$cluster)

points(cl$centers, col = 1:2, pch = 8, cex =2)


#Agglomerative Hierarchical Clustering
install.packages("factoextra")
install.packages("cluster")
install.packages("magrittr")
library(factoextra)
library(cluster)
library(magrittr)

res.hc <- dataset[2:3] %>% scale() %>% dist(method = "euclidean") %>% 
  hclust(method = "ward.D2")

res.hc
head(res.hc)

fviz_dend(res.hc, k=3,
          cex = 0.5,
          k_colors = c("#2E9FDF","#FC4E07","#00AFBB"),
          color_labels_by_k = TRUE,
          rect = TRUE
)

?fviz_dend

