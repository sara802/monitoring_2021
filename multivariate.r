> install.packages(vegan)
Error in install.packages(vegan) : object 'vegan' not found
> install.packages("vegan")
Installing package into ‘C:/Users/goran/Documents/R/win-library/4.0’
(as ‘lib’ is unspecified)
--- Please select a CRAN mirror for use in this session ---
also installing the dependency ‘permute’

trying URL 'https://cloud.r-project.org/bin/windows/contrib/4.0/permute_0.9-5.zip'
Content type 'application/zip' length 506317 bytes (494 KB)
downloaded 494 KB

trying URL 'https://cloud.r-project.org/bin/windows/contrib/4.0/vegan_2.5-7.zip'
Content type 'application/zip' length 3940296 bytes (3.8 MB)
downloaded 3.8 MB

package ‘permute’ successfully unpacked and MD5 sums checked
package ‘vegan’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\goran\AppData\Local\Temp\RtmpOW9zHJ\downloaded_packages
> setwd("C:/lab/")
> library(vegan)
Loading required package: permute
Loading required package: lattice
This is vegan 2.5-7
> load("biomes_multivar.RData")
> ls()
[1] "biomes"       "biomes_types" "cl"           "snow2000"    

>     head(biomes)
  chestnut beech giant_orb maple_acer rafflesia lichens brown_bear oak lianas
1        1     0         0          0         0       0          0   0      0
2        3     0         0          2         0       3          4   0      0
3        0     4         0          7         0       2          0   0      0
4        0     8         0          2         0       2          3   0      2
5        2     0         0          0         4       2          2   0      0
6        2     0         0          0         3       0          0   0      0
  bufo fox lynx red_colubus tree_fern mosses pandinus robin_bird fir_abies deer
1    0   0    4           0         0      0        0          7         0    4
2    0   0    4           0         0      0        0          5         0    4
3    0   0    4           0         0      0        0          6         0    5
4    0   0    4           0         0      0        0          5         0    4
5    0   0    4           0         0      0        0          2         5    2
6    0   0    0           0         0      0        0          6         5    3
  viper alnus rein_deer plerotus orangutan tiger wolf banana_tree dinoponera
1     2     0         0        0         0     0    0           0          0
2     7     0         0        0         0     5    0           5          0
3     6     0         0        0         0     2    0           2          0
4     5     0         0        5         0     2    0           1          0
5     6     0         5        0         0     3    2           2          0
6     4     0         6        0         0     3    5           5          0
  python squirrel
1      0        0
2      0        0
3      2        0
4      2        0
5      2        0
6      6        0

> 
> multivar <- decorana(biomes)
> head(biomes)
  chestnut beech giant_orb maple_acer rafflesia lichens brown_bear oak lianas
1        1     0         0          0         0       0          0   0      0
2        3     0         0          2         0       3          4   0      0
3        0     4         0          7         0       2          0   0      0
4        0     8         0          2         0       2          3   0      2
5        2     0         0          0         4       2          2   0      0
6        2     0         0          0         3       0          0   0      0
  bufo fox lynx red_colubus tree_fern mosses pandinus robin_bird fir_abies deer
1    0   0    4           0         0      0        0          7         0    4
2    0   0    4           0         0      0        0          5         0    4
3    0   0    4           0         0      0        0          6         0    5
4    0   0    4           0         0      0        0          5         0    4
5    0   0    4           0         0      0        0          2         5    2
6    0   0    0           0         0      0        0          6         5    3
  viper alnus rein_deer plerotus orangutan tiger wolf banana_tree dinoponera
1     2     0         0        0         0     0    0           0          0
2     7     0         0        0         0     5    0           5          0
3     6     0         0        0         0     2    0           2          0
4     5     0         0        5         0     2    0           1          0
5     6     0         5        0         0     3    2           2          0
6     4     0         6        0         0     3    5           5          0
  python squirrel
1      0        0
2      0        0
3      2        0
4      2        0
5      2        0
6      6        0
> multivar

Call:
decorana(veg = biomes) 

Detrended correspondence analysis with 26 segments.
Rescaling of axes with 4 iterations.

                  DCA1   DCA2    DCA3    DCA4
Eigenvalues     0.5117 0.3036 0.12125 0.14267
Decorana values 0.5360 0.2869 0.08136 0.04814
Axis lengths    3.7004 3.1166 1.30055 1.47888

> plot(multivar)
> 
> attach(biomes_types)
The following objects are masked from biomes_types (pos = 3):

    A1, tcode, type

>     attach(biomes_types)
The following objects are masked from biomes_types (pos = 3):

    A1, tcode, type

The following objects are masked from biomes_types (pos = 4):

    A1, tcode, type

> ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull

ordispider(multivar, type, col=c("black","red","green","blue"), label = T)
pdf("multivar.pdf")


