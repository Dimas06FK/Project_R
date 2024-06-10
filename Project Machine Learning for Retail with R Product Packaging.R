#Import Data
library(arules)
transaksi_tabular <- read.transactions(file="https://storage.googleapis.com/dqlab-dataset/transaksi_dqlab_retail.tsv", format="single", sep="\t", cols=c(1,2), skip=1)
write(transaksi_tabular, file="test_project_retail_1.txt", sep=",")


#Statistik Top 10
transaksi <- read.transactions(file="D:\\DATA SCIENCE\\R studio notes\\Project R Studio\\Machine Learning for Retail with R\\transaksi_dqlab_retail.tsv", format="single", sep="\t", cols=c(1,2), skip=1)

data_item <- itemFrequency(transaksi, type="absolute")

#Melakukan sorting pada data_item
data_item <- sort(data_item, decreasing = TRUE)

#Mengambil 10 item pertama
data_item <- data_item[1:10]

#Konversi data_item menjadi data frame dengan kolom Nama_Produk dan Jumlah
data_item <- data.frame("Nama Produk"=names(data_item), "Jumlah"=data_item, row.names=NULL)

write.csv(data_item, file = "top10_item_retail.txt")

print(data_item)

#Statistik Bottom 10
library(arules)

transaksi <- read.transactions(file="D:\\DATA SCIENCE\\R studio notes\\Project R Studio\\Machine Learning for Retail with R\\transaksi_dqlab_retail.tsv", format="single", sep="\t", cols=c(1,2), skip=1)


data_item <- itemFrequency(transaksi, type="absolute")

#Melakukan sorting pada data_item
data_item <- sort(data_item, decreasing = FALSE)

#Mengambil 3 item pertama
data_item <- data_item[1:10]

#Konversi data_item menjadi data frame dengan kolom Nama_Produk dan Jumlah
data_item <- data.frame("Nama Produk"=names(data_item), "Jumlah"=data_item, row.names=NULL)

write.csv(data_item, file = "bottom10_item_retail.txt")

print(data_item)


#Mendapatkan Kombinasi Produk menarik
library(arules)

transaksi_retail <- "D:\\DATA SCIENCE\\R studio notes\\Project R Studio\\Machine Learning for Retail with R\\transaksi_dqlab_retail.tsv"

transaksi_tabular <- read.transactions(file=transaksi_retail, format="single", sep="\t", cols=c(1,2), skip=1)
apriori_rules <- apriori(transaksi_tabular, 
                         parameter=list(supp=10/length(transaksi_tabular), conf=0.5, minlen=2, maxlen=3))
apriori_rules <- head(sort(apriori_rules, by='lift', decreasing = T),n=10)
inspect(apriori_rules)
write(apriori_rules, file="kombinasi_retail.txt")



