# Prognozowanie oceny klientów w skali 5-punktowej na podstawie parametrów

# load the package  
library('C50')


nazwa <- c("Smartfon_1","Smartfon_2","Smartfon_3","Smartfon_4","Smartfon_5",
          "Smartfon_6","Smartfon_7","Smartfon_8","Smartfon_9",
          "Smartfon_10","Smartfon_11")
wyswietlacz <-c(6.7,6.7,5.9,6.4,6.7,6.5,6.1,6.2,6.7,6.7, 5.8)
pamiec_RAM <-c(8,6,4,4,6,4,8,2,8,6, 3)
pamiec_wbudowana <-c(128,128,64,64,128,128,128,32,128, 128, 32)
aparat_foto <-c(64,64,16,25,32,48,16,13,48,12, 13)
cena <-c(3949, 1999, 999, 849,1499, 1699, 3299,699,2799,2649, 749)
liczba_opinii <-c(7,38,20,21,65,20,77,22,10,8, 42)
opinia_klientow <- c(4.8, 4.6, 4.7, 4.7, 4.7, 4.8, 4.8, 4.7, 4.9, 4.8, 4.7)



smartphones <- data.frame(wyswietlacz, pamiec_RAM, pamiec_wbudowana, aparat_foto, opinia_klientow)

head(smartphones)


# Trenujemy drzewo
smartphones_tree <- C5.0(smartphones[,-5], as.factor(smartphones[,5]))

# Zobacz podsumowanie drzewa 
summary(smartphones_tree) 

# rysuj wykres drzewa  
plot(smartphones_tree, main = 'Drzewo wyboru smartfonów') 

smartphones_tree_rules <- C5.0(smartphones[,-5], as.factor(smartphones[,5]), rules = TRUE) 
summary(smartphones_tree_rules) # view the ruleset  