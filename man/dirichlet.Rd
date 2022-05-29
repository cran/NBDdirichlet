\name{dirichlet}
\alias{dirichlet}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Estimation of the Dirichlet model}
\description{
  Given consumer purchase summary data, it estimates the parameters of the
  Dirichlet model, which describes the consumer repeat-buying behavior
  of branded products.  It also returns with several probability
  functions for users to calculate various theoretical quantities. 
}
\usage{
dirichlet(cat.pen, cat.buyrate, brand.share, brand.pen.obs,
brand.name = NA, cat.pur.var = NA, nstar = 50,
max.S = 30, max.K = 30, check = F)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{cat.pen}{ Product category penetration, which is the observed proportion
    of category buyers over a specific time period.  }

  \item{cat.buyrate}{Category buyers' average purchase rate in a given
    period. This is derived as the total number of category purchase
    occasions divided by the total number of category buyers during a
    time period.   }

  \item{brand.share}{ A vector of brand market share.  We typically
    define it as the proportions of purchase occasions that belong to
    different brands during the time period.  }

  \item{brand.pen.obs}{ A vector of observed brand penetration, which is the proportion of
    buyers for each brand during the time period.   }

  \item{brand.name}{ A character vector of the brand names.  If not
    given (default), use "B1", "B2", etc. }

  \item{cat.pur.var}{ The observed variance of category purchase rates
    across individuals.  It is used for the method of moment estimation
    of the parameter K in the Dirichlet model.  If it is
    not given (default), then estimate K by "mean and zeros"(see reference).   }

  \item{nstar}{Maximum number of category purchases in the time period considered in the calculation.  Any number larger than \code{nstar}  is assumed to have occurred with probability zero.  By default, it is 50.  For higher frequently
    purchased category and longer study time period, it is necessary to
    increase \code{nstar}  to the level (say, 100, 300, etc.)
    where \eqn{\sum_{n=1}^{nstar} P(n) > 0.9999}.  We did not use the
    truncation procedure (suggested by the reference authors) in order
    to simplify coding.    
     }
  \item{max.S}{Upper bound for the model parameter S in the optimization procedure to solve
    for S. Default to 30.    }
  \item{max.K}{Upper bound for the model parameter K in the optimization procedure to solve
    for K. Default to 30.   }
  \item{check}{A logical value.  If T, print some diagnostic
    information.  Defaul to F.   }
}
\details{
The Dirichlet model and its estimation can be found in the reference
paper.  It is found to fit and reproduce the patterns of repeat buying of branded
products quite well.  Specifically, the dirichlet model is a mixture of distributions at four levels:

\enumerate{
\item Each consumer's purchase incidences in a product category follow the Poisson process.

\item The purchase rates of the category by different consumers follow a Gamma distribution. 

\item Each consumer's choices among the available brands follow a multinomial distribution, and 

\item These brand choice probabilities follow a multivariate Beta or
"Dirichlet" distribution across different consumers.  }

There are three structural parameters to be estimated:
\describe{
\item{M}{Mean purchase rate of the category.}
\item{K}{Measures the diversity of the overal category purchase
frequency across consumers (smaller K implies more diversity).}
\item{S}{Measures the diversity of the brand purchase propensity
across consumers (smaller S implies more diversity).}
}



To estimate M and K, we use the observed category penetration
(\code{cat.pen}) and purchase rate (\code{cat.buyrate}).  To estimate S,
we use additionally the observed brand penetrations
(\code{brand.pen.obs}) and brand market shares (\code{brand.share}).
Note however once these three parameters are estimated, only the brand
market shares are needed by the Dirichlet model to compute various
repeat-buying theoretical statistics.

The estimated parameters, along with several probability functions that can access
the object data, are passed back in a list, which is assigned a 
"dirichlet" class attribute.  The result can be used by the \code{\link{print.dirichlet}},
\code{\link{summary.dirichlet}}, and \code{\link{plot.dirichlet}}
method.

The study period (where we report the model result) is assumed to be 4
times of the observation period (input data).  So if we use quarterly
data, the model output is annulized.  This multiple (4) can be changed
using the member function \code{period.set}.  }

\value{ A list with the following components:

\item{M}{Estimated Dirichlet model parameter:  mean purchase rate of the category.}

\item{K}{Estimated Dirichlet model parameter: it measures the diversity
of the overal category purchase frequency (smaller K implies more
diversity).}

\item{S}{Estimated Dirichlet model parameter: it measures the diversity of the brand purchase propensity (smaller S implies more diversity).}

\item{nbrand}{Number of brands being considered in the produt category.}

\item{nstar}{Input parameter: Maximum number of category purchases considered.}

\item{cat.pen}{Input parameter: Category penetration in a given time period. }

\item{cat.buyrate}{ Input parameter: Category buyers' average purchase rate in a given
time period.}

\item{brand.share}{Input parameter: A vector of brand market share.}  

\item{brand.pen.obs}{Input parameter: A vector of observed brand penetration.}

\item{brand.name}{Input parameter: A character vector of the brand names.} 

\item{check}{A logical flag that indicates whether to print the
intermediate information in the model estimation. Default to F.}

\item{error}{A logical flag that indicates if \code{nstar} is too small
    to sufficently cover the support of category purchase probabilities
    (calculated by \code{Pn}, see below).  If it is returned \code{T}, then
\code{nstar} should be increased and the Dirichlet model be
re-estimated.}
 
\item{period.set}{A member function of the "dirichlet" class object with
one required parameter \code{(t)}, which can be any positive real number.  It resets
the study time period to be \code{t} times of the assumed base time
period in the sample.}

\item{period.print}{A member function of the "dirichlet" class object
with no parameter.  It indicates the current time period by printing the
multiple \code{t} of the base time period.}

\item{p.rj.n}{ A member function of the "dirichlet" class object with
three required parameters \code{(r_j, n, j)}.  It calculates the conditional
probability of buying brand \code{j} for exactly \code{r_j} times given
that the consumer has made \code{n} category purchases.}


\item{Pn}{A member function of the "dirichlet" class object with one
required parameter \code{(n)}.  It calculates the probability that a consumer has
made \code{n} category purchases in the study time period.}

\item{brand.pen}{A member function of the "dirichlet" class object with
one required and one optional parameter (\code{j, limit=c(0:nstar)}). It
calculates the probability that a consumer makes at least one purchase of
the brand \code{j} (theoretical penetration) in the study time period. 
The optional vector \code{limit} enumerates the exact frequencies that a
consumer will be buying in the category and is used to index the
summation of the probabilities of \emph{not} buying brand \code{j} given
those category purchases in \code{limit}.}


\item{brand.buyrate}{A member function of the "dirichlet" class object
with one required and one optional parameter \code{(j, limit=c(0:nstar))}. It
calculates the expected number of brand \code{j} purchases given that
the consumer is a buyer of the brand \code{j} in the time period (theoretical brand
buying rate).  The \code{limit} parameter has the same meaning as that
in the function \code{brand.pen}.}

\item{wp}{A member function of the "dirichlet" class object with one
required and one optional parameter \code{(j, limit=c(0:nstar))}. It
calculates the expected number of the product category purchases given
that the consumer is a buyer of the brand \code{j} in the time period
(theoretical category buying rate for brand buyer).  The \code{limit}
parameter has the same meaning as that in the function \code{brand.pen}.}

}

\references{
  \emph{The Dirichlet: A Comprehensive Model of Buying
    Behavior}.  G.J. Goodhardt, A.S.C. Ehrenberg, C. Chatfield.  \emph{Journal
of the Royal Statistical Society. Series A  (General)}, Vol. 147, No. 5 (1984), pp. 621-655
}

\author{Feiming Chen  }

\seealso{\code{\link{print.dirichlet}}, \code{\link{summary.dirichlet}},
    \code{\link{plot.dirichlet}}, \code{\link{NBDdirichlet-package}}}

  \examples{
# The following data comes from the example in section 3 of
# the reference paper.  They are Toothpaste purchase data in UK
# in 1st quarter of 1973 from the AGB panel (5240 static panelists).

cat.pen <- 0.56 # Category Penetration
cat.buyrate <- 2.6 # Category Buyer's Average Purchase Rate in a given period.
brand.share <- c(0.25, 0.19, 0.1, 0.1, 0.09, 0.08, 0.03, 0.02) # Brands' Market Share
brand.pen.obs <- c(0.2,0.17,0.09,0.08,0.08,0.07,0.03,0.02) # Brand Penetration
brand.name <- c("Colgate DC", "Macleans","Close Up","Signal","ultrabrite",
"Gibbs SR","Boots Priv. Label","Sainsbury Priv. Lab.")

dobj <- dirichlet(cat.pen, cat.buyrate, brand.share, brand.pen.obs, brand.name)
print(dobj)
}

\keyword{ models }% at least one, from doc/KEYWORDS
