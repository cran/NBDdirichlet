\name{print.dirichlet}
\alias{print.dirichlet}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Print Dirichlet model information}
\description{
  This function prints a 'dirichlet' object.  It is a method for the
  generic function \code{print} of class 'dirichlet'. It prints
  descriptive information on the product category, brand, and the
  estimated Dirichlet model parameters. 
}
\usage{
print.dirichlet(x,...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{An object of "dirichlet" class.}
    \item{...}{Other parameters passing to the generic function}
}
\details{
  The following information is printed:
  \itemize{
  \item Number of brands in the category

  \item Brand list 

  \item Brands' market shares.
  \item Brands' penetrations.
  \item The multiple of the base time period that indicates the study time
  period, and the corresponding M value.
  \item Category penetration and  category buying rate.
  \item Estimated dirichlet model parameters: M (for base period), K,
  and S.
}
}
\value{
NULL 
}
\references{\emph{The Dirichlet: A Comprehensive Model of Buying
    Behavior}.  G.J. Goodhardt, A.S.C. Ehrenberg, C. Chatfield.  \emph{Journal
of the Royal Statistical Society. Series A  (General)}, Vol. 147, No. 5 (1984), pp. 621-655
}
\author{Feiming Chen}
\seealso{\code{\link{dirichlet}}, \code{\link{summary.dirichlet}},
    \code{\link{plot.dirichlet}}, \code{\link{NBDdirichlet-package}}}

  \examples{
cat.pen <- 0.56 # Category Penetration
cat.buyrate <- 2.6 # Category Buyer's Average Purchase Rate in a given period.
brand.share <- c(0.25, 0.19, 0.1, 0.1, 0.09, 0.08, 0.03, 0.02) # Brands' Market Share
brand.pen.obs <- c(0.2,0.17,0.09,0.08,0.08,0.07,0.03,0.02) # Brand Penetration
brand.name <- c("Colgate DC", "Macleans","Close Up","Signal","ultrabrite",
"Gibbs SR","Boots Priv. Label","Sainsbury Priv. Lab.")

dobj <- dirichlet(cat.pen, cat.buyrate, brand.share, brand.pen.obs, brand.name)
print(dobj)  # YOU WILL SEE THE FOLLOWING:

# Number of Brands in the Category = 8 
# Brand List : Colgate DC : Macleans : Close Up : Signal : ultrabrite : Gibbs SR : Boots Priv. Label : Sainsbury Priv. Lab.
# Brands' Market Shares: 0.25 0.19 0.1 0.1 0.09 0.08 0.03 0.02 
# Brands' Penetration:   0.2 0.17 0.09 0.08 0.08 0.07 0.03 0.02 
# Multiple of Base Time Period: 1 , Current M = 1.456 

# Channel Penetration = 0.56 , with Shopping Rate = 2.6 
# Estimated Dirichlet Model Parameters:
# NBD: M = 1.46 ,  K = 0.78 ;  Dirichlet: S = 1.55 
}
\keyword{methods}% at least one, from doc/KEYWORDS

