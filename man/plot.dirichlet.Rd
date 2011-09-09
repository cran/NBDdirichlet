\name{plot.dirichlet}
\alias{plot.dirichlet}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plot of theoretical penetration growth and buying rate growth}
\description{
     This function plots a 'dirichlet' object.  It is a method for the
     generic function \code{plot} for objects of the class
'dirichlet'. It plots the theoretical penetration growth and buying rate
growth across multiple brands according to the Dirichlet model over a specified time sequence.
   }
   
\usage{
plot.dirichlet(x, t = 4, brand = 1:x$nbrand, incr = 1, result = NULL,...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{An object of "dirichlet" class.}
  \item{t}{Maximum of the projection time period,  which is specified as
    a multiple of the base time period.  For example, if the base
    time period is quarterly, then \code{t=4} would mean
    annually.}

  \item{brand}{A vector specifying the subset of brands to be ploted.  }
  \item{incr}{Increment for the time sequence that starts at 0.  Its
    unit is one base time period.  Can be a fractional number such as 0.1. }
  \item{result}{A list returned from the previous run of the
    \code{plot.dirichlet}.  It is used to avoid repeating the computation when
    \code{incr} is changed.  }

  \item{...}{Other parameters passing to the generic function.}
  
}

\details{ A time sequence will be made from 0 up to \code{t} with increment
\code{incr}, against each component of which  the theoretical penetration and
brand buying rate will be plotted.  Each plotted point represents the
\emph{cumulated} penetration or buying rate from time 0 to its current
time point (expressed as the multiple of the base time period).   
}
\value{
  A list with two components:
  \item{pen }{A matrix with the penetration values.  Its number of rows
is the number of brands, and its number of columns is the length of the
time sequence used for plotting the X coordinates of the points.}

  \item{buy }{A matrix with the buying rate values.  Its dimension is
    the same as that of \code{pen}.}
}

\references{
  \emph{The Dirichlet: A Comprehensive Model of Buying
    Behavior}.  G.J. Goodhardt, A.S.C. Ehrenberg, C. Chatfield.  \emph{Journal
of the Royal Statistical Society. Series A  (General)}, Vol. 147, No. 5 (1984), pp. 621-655
}

\author{Feiming Chen  }

\seealso{\code{\link{dirichlet}}, \code{\link{summary.dirichlet}},
    \code{\link{print.dirichlet}}, \code{\link{NBDdirichlet-package}}}

  \examples{
cat.pen <- 0.56 # Category Penetration
cat.buyrate <- 2.6 # Category Buyer's Average Purchase Rate in a given period.
brand.share <- c(0.25, 0.19, 0.1, 0.1, 0.09, 0.08, 0.03, 0.02) # Brands' Market Share
brand.pen.obs <- c(0.2,0.17,0.09,0.08,0.08,0.07,0.03,0.02) # Brand Penetration
brand.name <- c("Colgate DC", "Macleans","Close Up","Signal","ultrabrite",
"Gibbs SR","Boots Priv. Label","Sainsbury Priv. Lab.")

dobj <- dirichlet(cat.pen, cat.buyrate, brand.share, brand.pen.obs, brand.name)
plot(dobj)
}

\keyword{methods}% at least one, from doc/KEYWORDS
