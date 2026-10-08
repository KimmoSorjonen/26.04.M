
############################# BIENVENUE #############################

############# I SOLEMNLY SWEAR THAT I AM UP TO NO GOOD ##############

#################################
## Loading packages

library(lavaan)

#################################

n <- 421 ## sample size

rm <- matrix(c( ## correlations reported by Ding et al. (2026)
  
   1.000, -0.519, -0.626,  0.702,
  -0.519,  1.000,  0.600, -0.641,
  -0.626,  0.600,  1.000, -0.862,
   0.702, -0.641, -0.862,  1.000), nrow=4)

colnames(rm) <- rownames(rm) <- c("CRB","PD","PC","OB") ## names of variables

#################################
## Alternative model

altmod <- "

## Loadings

CSE =~ start(-0.5)*CRB+PD+1*PC+start(-0.5)*OB

## (Error) variances

CRB ~~ CRB
PD ~~ PD
PC ~~ PC
OB ~~ OB

CSE ~~ CSE

"

fit.alt <- lavaan(altmod, sample.cov=rm, ## fitting model to data 
            sample.nobs=n, meanstructure=F)

summary(fit.alt, fit.measures=T, ci=T, standardized=T, rsq=T) ## the results


########################## MISCHIEF MANAGED #########################

############################# AU REVOIR #############################

