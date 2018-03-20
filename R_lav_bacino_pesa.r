library(raster)
library(rgdal)
library(rgeos)
library(mapview)
library(htmlwidgets)
library(sp)
library(doBy)
library(igraph)
library(DiagrammeR)

setwd("/home/alf/Scrivania/lav_vergari_pesa")

bacino_pesa=readRDS("bacino_pesa.rds")
writeOGR(bacino_pesa, 
         ".", 
         "bacino_pesa", 
         driver="ESRI Shapefile",
         overwrite_layer = T)
proj4string(bacino_pesa) <- CRS("+init=epsg:3003")
saveRDS(bacino_pesa,"bacino_pesa.rds")


ucs_bacino_pesa_amm_2017=readOGR(".","ucs_pesa_comuni")
saveRDS(ucs_bacino_pesa_amm_2017,"ucs_bacino_pesa_amm_2017.rds")


ucs_bacino_pesa_amm_2017@data$UCS2010=NULL


ucs_bacino_pesa_amm_2017$UCS2007=as.character(ucs_bacino_pesa_amm_2017$UCS2007)
ucs_bacino_pesa_amm_2017$UCS2013=as.character(ucs_bacino_pesa_amm_2017$UCS2013)
ucs_bacino_pesa_amm_2017$UCS2016=as.character(ucs_bacino_pesa_amm_2017$UCS2016)

ucs_bacino_pesa_amm_2017_df=data.frame(ucs_bacino_pesa_amm_2017@data,stringsAsFactors =F)

#########################################################################################################################

id2016=which(ucs_bacino_pesa_amm_2017_df$UCS2016=="0000")
id2016_bis=which(ucs_bacino_pesa_amm_2017_df$UCS2016=="0")
id2016=c(id2016,id2016_bis)
ucs_bacino_pesa_amm_2017_df$UCS2016[id2016]=ucs_bacino_pesa_amm_2017_df$UCS2013[id2016]
ucs_bacino_pesa_amm_2017_df$UCS2016=as.character(ucs_bacino_pesa_amm_2017_df$UCS2016)

ucs_bacino_pesa_amm_2017_df$UCS2016[which(ucs_bacino_pesa_amm_2017_df$UCS2016=="399")]="324"
ucs_bacino_pesa_amm_2017_df$UCS2013[which(ucs_bacino_pesa_amm_2017_df$UCS2013=="399")]="324"
ucs_bacino_pesa_amm_2017_df$UCS2007[which(ucs_bacino_pesa_amm_2017_df$UCS2007=="399")]="324"

#########################################################################################################################

ucs_bacino_pesa_amm_2017_df$UCS2016urb=as.character(ucs_bacino_pesa_amm_2017_df$UCS2016)
ucs_bacino_pesa_amm_2017_df$UCS2013urb=as.character(ucs_bacino_pesa_amm_2017_df$UCS2013)
ucs_bacino_pesa_amm_2017_df$UCS2007urb=as.character(ucs_bacino_pesa_amm_2017_df$UCS2007)


ucs_bacino_pesa_amm_2017_df$UCS2007agro=as.character(ucs_bacino_pesa_amm_2017_df$UCS2007)
ucs_bacino_pesa_amm_2017_df$UCS2013agro=as.character(ucs_bacino_pesa_amm_2017_df$UCS2013)
ucs_bacino_pesa_amm_2017_df$UCS2016agro=as.character(ucs_bacino_pesa_amm_2017_df$UCS2016)

#########################################################################################################################

id2016_u=c(which(ucs_bacino_pesa_amm_2017_df$UCS2016=="142"),
           which(ucs_bacino_pesa_amm_2017_df$UCS2016=="112"),
           which(ucs_bacino_pesa_amm_2017_df$UCS2016=="122"),
           which(ucs_bacino_pesa_amm_2017_df$UCS2016=="1221"),
           which(ucs_bacino_pesa_amm_2017_df$UCS2016=="1221"),
           which(ucs_bacino_pesa_amm_2017_df$UCS2016=="131"),
           which(ucs_bacino_pesa_amm_2017_df$UCS2016=="132"))

id2013_u=c(which(ucs_bacino_pesa_amm_2017_df$UCS2013=="142"),
           which(ucs_bacino_pesa_amm_2017_df$UCS2013=="112"),
           which(ucs_bacino_pesa_amm_2017_df$UCS2013=="122"),
           which(ucs_bacino_pesa_amm_2017_df$UCS2013=="1221"),
           which(ucs_bacino_pesa_amm_2017_df$UCS2013=="1221"),
           which(ucs_bacino_pesa_amm_2017_df$UCS2013=="131"),
           which(ucs_bacino_pesa_amm_2017_df$UCS2013=="132"))

id2007_u=c(which(ucs_bacino_pesa_amm_2017_df$UCS2007=="142"),
           which(ucs_bacino_pesa_amm_2017_df$UCS2007=="112"),
           which(ucs_bacino_pesa_amm_2017_df$UCS2007=="122"),
           which(ucs_bacino_pesa_amm_2017_df$UCS2007=="1221"),
           which(ucs_bacino_pesa_amm_2017_df$UCS2007=="1221"),
           which(ucs_bacino_pesa_amm_2017_df$UCS2007=="131"),
           which(ucs_bacino_pesa_amm_2017_df$UCS2007=="132"))


id2016_sem=grep("^210",ucs_bacino_pesa_amm_2017_df$UCS2016)
id2013_sem=grep("^210",ucs_bacino_pesa_amm_2017_df$UCS2013)
id2007_sem=grep("^210",ucs_bacino_pesa_amm_2017_df$UCS2007)

id2016_vig=grep("^221",ucs_bacino_pesa_amm_2017_df$UCS2016)
id2013_vig=grep("^221",ucs_bacino_pesa_amm_2017_df$UCS2013)
id2007_vig=grep("^221",ucs_bacino_pesa_amm_2017_df$UCS2007)

id2016_agr=grep("^24",ucs_bacino_pesa_amm_2017_df$UCS2016)
id2013_agr=grep("^24",ucs_bacino_pesa_amm_2017_df$UCS2013)
id2007_agr=grep("^24",ucs_bacino_pesa_amm_2017_df$UCS2007)

id2016_bos=grep("^31",ucs_bacino_pesa_amm_2017_df$UCS2016)
id2013_bos=grep("^31",ucs_bacino_pesa_amm_2017_df$UCS2013)
id2007_bos=grep("^31",ucs_bacino_pesa_amm_2017_df$UCS2007)


id2016_arb=grep("^32",ucs_bacino_pesa_amm_2017_df$UCS2016)
id2013_arb=grep("^32",ucs_bacino_pesa_amm_2017_df$UCS2013)
id2007_arb=grep("^32",ucs_bacino_pesa_amm_2017_df$UCS2007)

id2016_rad=grep("^33",ucs_bacino_pesa_amm_2017_df$UCS2016)
id2013_rad=grep("^33",ucs_bacino_pesa_amm_2017_df$UCS2013)
id2007_rad=grep("^33",ucs_bacino_pesa_amm_2017_df$UCS2007)

id2016_idr=grep("^51",ucs_bacino_pesa_amm_2017_df$UCS2016)
id2013_idr=grep("^51",ucs_bacino_pesa_amm_2017_df$UCS2013)
id2007_idr=grep("^51",ucs_bacino_pesa_amm_2017_df$UCS2007)

###################################################################################

ucs_bacino_pesa_amm_2017_df$UCS2016agro[id2016_u]="111"
ucs_bacino_pesa_amm_2017_df$UCS2013agro[id2013_u]="111"
ucs_bacino_pesa_amm_2017_df$UCS2007agro[id2007_u]="111"

ucs_bacino_pesa_amm_2017_df$UCS2016agro[id2016_sem]="210"
ucs_bacino_pesa_amm_2017_df$UCS2013agro[id2013_sem]="210"
ucs_bacino_pesa_amm_2017_df$UCS2007agro[id2007_sem]="210"

ucs_bacino_pesa_amm_2017_df$UCS2016agro[id2016_vig]="221"
ucs_bacino_pesa_amm_2017_df$UCS2013agro[id2013_vig]="221"
ucs_bacino_pesa_amm_2017_df$UCS2007agro[id2007_vig]="221"

ucs_bacino_pesa_amm_2017_df$UCS2016agro[id2016_agr]="24"
ucs_bacino_pesa_amm_2017_df$UCS2013agro[id2013_agr]="24"
ucs_bacino_pesa_amm_2017_df$UCS2007agro[id2007_agr]="24"

ucs_bacino_pesa_amm_2017_df$UCS2016agro[id2016_bos]="31"
ucs_bacino_pesa_amm_2017_df$UCS2013agro[id2013_bos]="31"
ucs_bacino_pesa_amm_2017_df$UCS2007agro[id2007_bos]="31"

ucs_bacino_pesa_amm_2017_df$UCS2016agro[id2016_arb]="32"
ucs_bacino_pesa_amm_2017_df$UCS2013agro[id2013_arb]="32"
ucs_bacino_pesa_amm_2017_df$UCS2007agro[id2007_arb]="32"

ucs_bacino_pesa_amm_2017_df$UCS2016agro[id2016_rad]="33"
ucs_bacino_pesa_amm_2017_df$UCS2013agro[id2013_rad]="33"
ucs_bacino_pesa_amm_2017_df$UCS2007agro[id2007_rad]="33"

ucs_bacino_pesa_amm_2017_df$UCS2016agro[id2016_idr]="51"
ucs_bacino_pesa_amm_2017_df$UCS2013agro[id2013_idr]="51"
ucs_bacino_pesa_amm_2017_df$UCS2007agro[id2007_idr]="51"

ucs_bacino_pesa_amm_2017$UCS2016=as.character(ucs_bacino_pesa_amm_2017_df$UCS2016)
ucs_bacino_pesa_amm_2017$UCS2013=as.character(ucs_bacino_pesa_amm_2017_df$UCS2013)
ucs_bacino_pesa_amm_2017$UCS2007=as.character(ucs_bacino_pesa_amm_2017_df$UCS2007)
ucs_bacino_pesa_amm_2017$UCS2016agro=as.character(ucs_bacino_pesa_amm_2017_df$UCS2016agro)
ucs_bacino_pesa_amm_2017$UCS2013agro=as.character(ucs_bacino_pesa_amm_2017_df$UCS2013agro)
ucs_bacino_pesa_amm_2017$UCS2007agro=as.character(ucs_bacino_pesa_amm_2017_df$UCS2007agro)

#####################################################################################

ucs_bacino_pesa_amm_2017$v_2016_2013=ifelse(ucs_bacino_pesa_amm_2017_df$UCS2016==ucs_bacino_pesa_amm_2017_df$UCS2013,0,1)
ucs_bacino_pesa_amm_2017$v_2016_2010=ifelse(ucs_bacino_pesa_amm_2017_df$UCS2016==ucs_bacino_pesa_amm_2017_df$UCS2010,0,1)
ucs_bacino_pesa_amm_2017$v_2016_2007=ifelse(ucs_bacino_pesa_amm_2017_df$UCS2016==ucs_bacino_pesa_amm_2017_df$UCS2007,0,1)


saveRDS(ucs_bacino_pesa_amm_2017_df,"ucs_bacino_pesa_amm_2017_df.rds")

#####################################################################################




names_ucs_agro_df=c("AREA_2007","AREA_2013","AREA_2016")

ucs_bacino_pesa_amm_2017_geo=spTransform(ucs_bacino_pesa_amm_2017,CRS("+init=epsg:4326"))
  
#####################################################################################




#################################################################################################
class_urb=c(111,112,1121,121,1212,122,1221,131,132,133,141,1411,142)

name_urb=c("Zone residenziali a tessuto continuo",
            "Zone residenziali a tessuto discontinuo",
            "Pertinenza abitativa, edificato sparso",
            "Aree industriali, commerciali e servizi pubblici e privati",
            "Impianto fotovoltaico", 
            "Reti stradali, ferroviarie ed infrastrutture tecniche",
            "Strade in aree boscate",
            "Aree estrattive", 
            "Discariche, depositi di rottami", 
            "Cantieri , edifici in costruzione", 
            "Aree verdi urbane",
            "Cimiteri",
            "Aree ricreative e sportive")



class_agro=c(210,2101,2102,221,222,2221,223,231,241,242,243,244,311,312,313,321,324,332,333,411,511,512)

name_agro=c("Seminativi","Serre","Vivai","Vigneti","Frutteti","Arboricoltura","Oliveti"
                  ,"Prati","Colture temporanee associate a colture permanenti"
                  ,"Sistemi particellari complessi"
                  ,"Colture agrarie con presenza di spazi naturali importanti"
                  ,"Aree agroforestali"
                  ,"Boschi latifoglie"
                  ,"Boschi conifere"
                  ,"Boschi misti"
                  ,"Pascoli"
                  ,"Arbusti_erbacee"
                  ,"Rocce nude"
                  ,"Vegetazione_rada"
                  ,"Zone Umide"
                  ,"Corsi d'acqua"
                  ,"Specchi d'acqua")

class_ucs=as.character(c(1,121,1212,133,141,21,23,24,221,222,223,31,32,33,4,51))

name_class=c("Zone urbane",
             "Aree industriali o commerciali",
             "Impianti fotovoltaico",
             "Cantieri",
             "Aree urbane verdi",
             "Seminativi",
             "Prati",
             "Zone_AGR_eterogenee",
             "Vigneti",
             "Frutteti",
             "Oliveti",
             "Boschi",
             "Arbusti_erbacee",
             "Vegetazione_rada",
             "Zone umide",
             "Corpi_idrici")


###################################################################################################################################################################################




ucs_bacino_pesa_amm_2017_geo$names=NA
for ( i in 1:length(class_ucs)) {ucs_bacino_pesa_amm_2017_geo$names[grep(paste0("^",class_ucs[i]),ucs_bacino_pesa_amm_2017_geo$UCS2016)]=name_class[i];
                                }


names(ucs_bacino_pesa_amm_2017_geo)[16:18]=c("v_16_13","v_16_10","v_16_07")

saveRDS(ucs_bacino_pesa_amm_2017_geo,"ucs_bacino_pesa_amm_2017_geo.rds")


writeOGR(ucs_bacino_pesa_amm_2017_geo, 
         ".", 
         "ucs_bacino_pesa_amm_2017_geo", 
         driver="ESRI Shapefile",
         overwrite_layer = T)

###################################################################################################################################################################################

com_ucs_2016=summaryBy(AREA_METER~UCS2016+NOME,data=ucs_bacino_pesa_amm_2017_df,FUN=sum)
com_ucs_2013=summaryBy(AREA_METER~UCS2013+NOME,data=ucs_bacino_pesa_amm_2017_df,FUN=sum)
com_ucs_2007=summaryBy(AREA_METER~UCS2007+NOME,data=ucs_bacino_pesa_amm_2017_df,FUN=sum)

agro_ucs_2016=summaryBy(AREA_METER~UCS2016,data=ucs_bacino_pesa_amm_2017_df,FUN=sum)
agro_ucs_2013=summaryBy(AREA_METER~UCS2013,data=ucs_bacino_pesa_amm_2017_df,FUN=sum)
agro_ucs_2007=summaryBy(AREA_METER~UCS2007,data=ucs_bacino_pesa_amm_2017_df,FUN=sum)

com_ucs_2016$names=NA
com_ucs_2013$names=NA
com_ucs_2007$names=NA

agro_ucs_2016$names=NA
agro_ucs_2013$names=NA
agro_ucs_2007$names=NA

for ( i in 1:length(class_agro)) {com_ucs_2016$names[grep(paste0("^",class_agro[i]),com_ucs_2016$UCS2016)]=name_agro[i];
                                  com_ucs_2013$names[grep(paste0("^",class_agro[i]),com_ucs_2013$UCS2013)]=name_agro[i];
                                  com_ucs_2007$names[grep(paste0("^",class_agro[i]),com_ucs_2007$UCS2007)]=name_agro[i];
                                  agro_ucs_2016$names[grep(paste0("^",class_agro[i]),agro_ucs_2016$UCS2016)]=name_agro[i];
                                  agro_ucs_2013$names[grep(paste0("^",class_agro[i]),agro_ucs_2013$UCS2013)]=name_agro[i];
                                  agro_ucs_2007$names[grep(paste0("^",class_agro[i]),agro_ucs_2007$UCS2007)]=name_agro[i];
                                  }


agro_ucs_2007a=na.omit(agro_ucs_2007)
agro_ucs_2013a=na.omit(agro_ucs_2013)
agro_ucs_2016a=na.omit(agro_ucs_2016)

com_ucs_2007a=na.omit(com_ucs_2007)
com_ucs_2013a=na.omit(com_ucs_2013)
com_ucs_2016a=na.omit(com_ucs_2016)
com_ucs_2013a=com_ucs_2013a[-98,]
com_ucs_2007a=com_ucs_2007a[-98,]

ucs_agro_df=data.frame(UCScode=agro_ucs_2016a[,1],
           UCSlabel=agro_ucs_2016a[,3],
           AREA_2007=agro_ucs_2007a[,2],
           AREA_2013=agro_ucs_2013a[,2],
           AREA_2016=agro_ucs_2016a[,2],
           Vperc_2016_2007=round(100*(agro_ucs_2016a[,2]-agro_ucs_2007a[,2])/agro_ucs_2007a[,2],2),
           Vperc_2016_2013=round(100*(agro_ucs_2016a[,2]-agro_ucs_2013a[,2])/agro_ucs_2013a[,2],2))

com_agro_df=data.frame(UCScode=com_ucs_2016a[,1],
                       UCSlabel=com_ucs_2016a[,4],
                       Comune=com_ucs_2016a[,2],
                       AREA_2007=com_ucs_2007a[,3],
                       AREA_2013=com_ucs_2013a[,3],
                       AREA_2016=com_ucs_2016a[,3],
                       Vperc_2016_2007=round(100*(com_ucs_2016a[,3]-com_ucs_2007a[,3])/com_ucs_2007a[,3],2),
                       Vperc_2016_2013=round(100*(com_ucs_2016a[,3]-com_ucs_2013a[,3])/com_ucs_2013a[,3],2))



XLConnect::writeWorksheetToFile("ucs_agro_pesa.xls",ucs_agro_df,"bacino pesa")


XLConnect::writeWorksheetToFile("ucs_agro_pesa_comune.xls",com_agro_df,"bacino pesa")

#########################################################################################################################################################

com_ucs_2016=summaryBy(AREA_METER~UCS2016+NOME,data=ucs_bacino_pesa_amm_2017_df,FUN=sum)
com_ucs_2013=summaryBy(AREA_METER~UCS2013+NOME,data=ucs_bacino_pesa_amm_2017_df,FUN=sum)
com_ucs_2007=summaryBy(AREA_METER~UCS2007+NOME,data=ucs_bacino_pesa_amm_2017_df,FUN=sum)

urb_ucs_2016=summaryBy(AREA_METER~UCS2016,data=ucs_bacino_pesa_amm_2017_df,FUN=sum)
urb_ucs_2013=summaryBy(AREA_METER~UCS2013,data=ucs_bacino_pesa_amm_2017_df,FUN=sum)
urb_ucs_2007=summaryBy(AREA_METER~UCS2007,data=ucs_bacino_pesa_amm_2017_df,FUN=sum)

com_ucs_2016$names=NA
com_ucs_2013$names=NA
com_ucs_2007$names=NA
urb_ucs_2016$names=NA
urb_ucs_2013$names=NA
urb_ucs_2007$names=NA

 
for ( i in 1:length(class_urb)) {com_ucs_2016$names[grep(paste0("^",class_urb[i]),com_ucs_2016$UCS2016)]=name_urb[i];
                                 com_ucs_2013$names[grep(paste0("^",class_urb[i]),com_ucs_2013$UCS2013)]=name_urb[i];
                                 com_ucs_2007$names[grep(paste0("^",class_urb[i]),com_ucs_2007$UCS2007)]=name_urb[i];
                                 urb_ucs_2016$names[grep(paste0("^",class_urb[i]),urb_ucs_2016$UCS2016)]=name_urb[i];
                                 urb_ucs_2013$names[grep(paste0("^",class_urb[i]),urb_ucs_2013$UCS2013)]=name_urb[i];
                                 urb_ucs_2007$names[grep(paste0("^",class_urb[i]),urb_ucs_2007$UCS2007)]=name_urb[i];
           }




urb_ucs_2007=na.omit(urb_ucs_2007)
urb_ucs_2013=na.omit(urb_ucs_2013)
urb_ucs_2016=na.omit(urb_ucs_2016)
urb_ucs_2007[13,]=urb_ucs_2013[5,]
urb_ucs_2007[13,]$AREA_METER.sum=0
urb_ucs_2007=urb_ucs_2007[order(urb_ucs_2007$UCS2007),]
rownames(urb_ucs_2007)=1:13



ucs_urb_df=data.frame(UCScode=urb_ucs_2016[,1],
                       UCSlabel=urb_ucs_2016[,3],
                       AREA_2007=urb_ucs_2007[,2],
                       AREA_2013=urb_ucs_2013[,2],
                       AREA_2016=urb_ucs_2016[,2],
                       Vperc_2016_2007=round(100*(urb_ucs_2016[,2]-urb_ucs_2007[,2])/urb_ucs_2007[,2],2),
                       Vperc_2016_2013=round(100*(urb_ucs_2016[,2]-urb_ucs_2013[,2])/urb_ucs_2013[,2],2))


XLConnect::writeWorksheetToFile("ucs_urb_pesa.xls",ucs_urb_df,"bacino pesa")



com_ucs_2007=na.omit(com_ucs_2007)
com_ucs_2013=na.omit(com_ucs_2013)
com_ucs_2016=na.omit(com_ucs_2016)

XLConnect::writeWorksheetToFile("ucs_urb_pesa_comune.xls",com_ucs_2016,"bacino pesa 2016")
XLConnect::writeWorksheetToFile("ucs_urb_pesa_comune.xls",com_ucs_2013,"bacino pesa 2013")
XLConnect::writeWorksheetToFile("ucs_urb_pesa_comune.xls",com_ucs_2007,"bacino pesa 2007")






##########################################################################################################
#
# 11 Zone Urbane 
# 111 - Zone residenziali a tessuto continuo 
# 112 - Zone residenziali a tessuto discontinuo 
# 1121 – Pertinenza abitativa, edificato sparso
# 12 - Zone industriali, commerciali ed infrastrutture
# 121 - Aree industriali, commerciali e servizi pubblici e privati
# 1211 – Depuratori
# 1212 – Impianto fotovoltaico 
# 122 - Reti stradali, ferroviarie ed infrastrutture tecniche 
# 1221 - Strade in aree boscate
# 123 – Aree portuali
# 124 – Aeroporti
# 13 - Zone estrattive, cantieri, discariche e terreni artefatti e abbandonati 
# 131 – Aree estrattive 
# 132 – Discariche, depositi di rottami 
# 133 – Cantieri , edifici in costruzione 
# 14 - Zone verdi artificiali non agricole
# 141 – Aree verdi urbane
# 1411 – Cimitero
# 142 – Aree ricreative e sportive

##########################################################################################################

ucs_bacino_pesa_amm_2017_geo=readRDS("ucs_bacino_pesa_amm_2017_geo.rds")

id_change_16_07=which(ucs_bacino_pesa_amm_2017_geo$v_16_07==1)

ucs_change_pesa=ucs_bacino_pesa_amm_2017_geo[id_change_16_07,]

t=as.data.frame(t(tapply(ucs_change_pesa$AREA_METER,ucs_change_pesa$UCS2007,sum)))

actors=unique(c(ucs_change_pesa$UCS2007,to=ucs_change_pesa$UCS2016))
relations=data.frame(from=ucs_change_pesa$UCS2007,to=ucs_change_pesa$UCS2016)

g <- graph_from_data_frame(relations, directed=TRUE, vertices=actors)
E(g)$area <- ucs_change_pesa$AREA_METER
gpesa=simplify(g,remove.multiple = T, remove.loops = T, edge.attr.comb=list(area="sum")) 

g2 <- graph_from_data_frame(relations, directed=TRUE, vertices=actors)
E(g2)$weight <- 1
gpesa2=simplify(g2,remove.multiple = T, remove.loops = T,edge.attr.comb=list(weight="sum"))  
deg <- degree(gpesa2, mode = "in")
idx=which(deg > 3)
gpesa2.sim <-induced.subgraph(gpesa2, idx)
gd <- get.data.frame(gpesa, what = "edges")

class_tot=c(class_urb,class_agro)
name_tot=c(name_urb,name_agro)

gd$from=as.character(gd$from)
gd$to=as.character(gd$to)

gd$ucs_from=as.character(gd$from)
gd$ucs_to=as.character(gd$to)

for ( i in 1:length(class_tot)) {gd$from[grep(paste0("^",class_tot[i]),gd$from)]=name_tot[i];
                                 gd$to[grep(paste0("^",class_tot[i]),gd$to)]=name_tot[i];
}

gd=gd[which((gd$from==gd$to)==F),]

XLConnect::writeWorksheetToFile("passaggi_ucs_2016_2007.xls",gd,"bacino pesa")




##############################################################################################################

saveRDS(ucs_bacino_pesa_amm_2017_geo,"ucs_bacino_pesa_amm_2017_geo.rds")

writeOGR(ucs_bacino_pesa_amm_2017_geo, ".", "ucs_bacino_pesa_amm_2017_geo", driver="ESRI Shapefile",overwrite_layer = T)
ucs_bacino_pesa_amm_2017_geo=readOGR(".", "ucs_bacino_pesa_amm_2017_geo")
ucs_bacino_pesa_amm_2017_geo$l_2016=NA
ucs_bacino_pesa_amm_2017_geo$l_2007=NA


for ( i in 1:length(class_ucs)) {ucs_bacino_pesa_amm_2017_geo$l_2016[grep(paste0("^",class_ucs[i]),ucs_bacino_pesa_amm_2017_geo$UCS2016)]=name_class[i];}
for ( i in 1:length(class_ucs)) {ucs_bacino_pesa_amm_2017_geo$l_2007[grep(paste0("^",class_ucs[i]),ucs_bacino_pesa_amm_2017_geo$UCS2007)]=name_class[i];}

setwd("uso_suolo_bacino_pesa/qgis")
ucs_bac_pesa_2007map=ucs_bacino_pesa_amm_2017_geo[,21]
ucs_bac_pesa_2016map=ucs_bacino_pesa_amm_2017_geo[,20]
ucs_bac_pesa_v07_16=ucs_bacino_pesa_amm_2017_geo[,18]

writeOGR(ucs_bac_pesa_2007map, ".", "ucs_bac_pesa_2007map", driver="ESRI Shapefile",overwrite_layer = T)
writeOGR(ucs_bac_pesa_2016map, ".", "ucs_bac_pesa_2016map", driver="ESRI Shapefile",overwrite_layer = T)
writeOGR(ucs_bac_pesa_v07_16, ".", "ucs_bac_pesa_v07_16", driver="ESRI Shapefile",overwrite_layer = T)
ucs_bacino_pesa_amm_2017_df=readRDS("ucs_bacino_pesa_amm_2017_df.rds")

XLConnect::writeWorksheetToFile("ucs_finale_pesa.xls",data.frame(ucs_bacino_pesa_amm_2017_df[,c("AREA_METER","NOME","PROVINCIA","COD_ISTAT")],ucs_bacino_pesa_amm_2017_geo@data),"bacino pesa")
