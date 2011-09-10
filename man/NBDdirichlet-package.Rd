\name{NBDdirichlet-package}
\alias{NBDdirichlet-package}
\docType{package}
\title{
NBD-Dirichlet model of consumer buying behavior
}

\description{ The Dirichlet (aka NBD-Dirichlet) model describes the
probability distributions of the consumer purchase incidences and brand
choices.  We estimate the model and calculate various theoretical
quantities of interest to marketing researchers.  }

\details{
\tabular{ll}{
Package: \tab dirichlet\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2008-08-12\cr
License: \tab  GPL (>=2)\cr
}

}
\author{
Feiming Chen

Maintainer: Feiming Chen <feimingchen@yahoo.com>

}
\references{
  \emph{The Dirichlet: A Comprehensive Model of Buying
    Behavior}.  G.J. Goodhardt, A.S.C. Ehrenberg, C. Chatfield.  \emph{Journal
of the Royal Statistical Society. Series A
  (General)}, Vol. 147, No. 5 (1984), pp. 621-655

  \emph{Repeat-Buying:Facts,Theory and Applications}, 2nd edn.
  A.S.C. Ehrenberg, 1988, London, Charles Griffin, ISBN 0 85264 287 3

  \emph{Book Review: Repeat-Buying:Facts,Theory and Applications by
    A.S.C. Ehrenberg}. Norman Pigden. \emph{The Statistician}, Vol. 40,
  No. 3, Special Issue (1991), pp. 349-350

} \keyword{ package } \seealso{ \code{\link{dirichlet}},
\code{\link{print.dirichlet}}, \code{\link{summary.dirichlet}},
\code{\link{plot.dirichlet}} }

\examples{
cat.pen <- 0.56 # Category Penetration
cat.buyrate <- 2.6 # Category Buyer's Average Purchase Rate in a given period.
brand.share <- c(0.25, 0.19, 0.1, 0.1, 0.09, 0.08, 0.03, 0.02) # Brands' Market Share
brand.pen.obs <- c(0.2,0.17,0.09,0.08,0.08,0.07,0.03,0.02) # Brand Penetration
brand.name <- c("Colgate DC", "Macleans","Close Up","Signal","ultrabrite",
"Gibbs SR","Boots Priv. Label","Sainsbury Priv. Lab.")

dobj <- dirichlet(cat.pen, cat.buyrate, brand.share, brand.pen.obs, brand.name)
print(dobj)
summary(dobj)
# plot(dobj)
}
