\name{summary.dirichlet}
\alias{summary.dirichlet}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Theoretical summary statistics from the Dirichlet model.}
\description{
     This function summarizes a 'dirichlet' object.  It is a method for the
     generic function \code{summary} of class 'dirichlet'.  It
calculate four types of theoretical summary statistics, which can be
compared with the corresponding observed statistics.}

\usage{
\method{summary}{dirichlet}(object, t = 1, type = c("buy", "freq", "heavy", "dup"),
digits = 2, freq.cutoff = 5, heavy.limit = 1:6, dup.brand = 1, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{An object of "dirichlet" class.}
  \item{t}{Multiple of the base time period. For example, if the assumed
    base time period is quarterly, then \code{t=4} would mean
    annually. Default to one.}
  \item{type}{A character vector that specifies which types of
    theoretical statistics (during the time period indicated by \code{t}) are to be
calculated.  Four character strings can be listed:

\describe{
  \item{buy}{Theoretical brand penetration, buying rate, and the buying
  rate of the category per brand buyer.}

  \item{freq}{Distribution of the number of brand purchases.}

  \item{heavy}{Theoretical brand penetration and buying rate among
 category buyers with a specific frequency range.}

 \item{dup}{Brand duplication (proportion of buyers of a particular
 brand also buying other brand).}
}
}

  \item{digits}{Number of decimal digits to control the rounding
    precision of the reported statistics. Default to 2. }

  \item{freq.cutoff}{For the \code{type="freq"} table, where to cut off and
    lump the tail of the frequency distribution.}

  \item{heavy.limit}{For the \code{type="heavy"} table, a vector containing the
    specific purchase frequency range of the category buyers. The
    upper-bound of the frequency is \code{nstar}.}

  \item{dup.brand}{For the \code{type="dup"} table, the focal
    brand. Defaul to the first brand in the brand list.}

  \item{...}{Other parameters passing to the generic function.}
}
\details{
  The output corresponds to the theoretical portion of the Table 3, 4,
  5, 6 in the reference paper.  We also have another set of functions
  (available upon request) that put observed and theoretical statistics
together for making tables that resemble those in the reference.

Let \eqn{P_n} be the probability of a consumer buying the product
category \eqn{n} times.  Then \eqn{P_n} has a Negative Binomial
Distribution (NBD).   Let \eqn{p(r_j|n)} be the probability of making
\eqn{r_j} purchases of brand \eqn{j}, gien that \eqn{n} purchases
of the category having been make (\eqn{r_j\leq n}).  Then \eqn{p(r_j|n)}
has a Beta-Binomial distribution.

The theoretical brand penetration \eqn{b} is then
\deqn{b = 1 - \sum_{n=0} P_n p(0|n)}

The theoretical brand buying rate \eqn{w} is
\deqn{w = \frac{\sum_{n=1} \{  P_n \sum_{r=1}^n r p(r|n) \}}{b} }
and the category buying rate per brand buyer \eqn{w_P} is
\deqn{w_P = \frac{\sum_{n=1} \{ n P_n [ 1 - p(0|n)] \}}{b} }

The brand purchase frequency distribution is
\deqn{ f(r) = \sum_{n \geq r} P_n p(r|n) }

The brand penetration given a specific category purchase frequency range
\eqn{R=\{i_1, i_2, i_3, \ldots\}} is
\deqn{1 - \frac{\sum_{n \in R}  P(n) p(0|n)}{\sum_{n \in R} P(n)}}

The brand buying rate given a specific category purchase frequency range
\eqn{R=\{i_1, i_2, i_3, \ldots\}} is
\deqn{\frac{\sum_{n \in R} P(n) [\sum_{r=1}^n r p(r|n)]}{\sum_{n \in R}
    P(n) [1 - p(0|n)] }}

To calculate the brand duplication measure, we first get the penetration \eqn{b_{(j+k)}}
of the "composite" brand of two brands \eqn{j} and \eqn{k} as:
\deqn{ b_{(j+k)} = 1 - \sum_n  P_n p_k(0|n) p_j(0|n)}
Then the theoretical proportion \eqn{b_{jk}} of the population buying both brands at
least once  is:
\deqn{b_{jk} = b_j + b_k - b_{(j+k)}}
and the brand duplication \eqn{b_{j/k}} (where brand \eqn{k} is the focal
brand) is:
\deqn{b_{j/k} = b_{jk} / b_k}
}
\value{
   A list with those components that are specified by the input
   \code{type} parameter. 

   \item{buy}{A data frame with three components: \code{pen.brand} (Theoretical brand penetration),
    \code{pur.brand} (buying rate of the brand), \code{pur.cat} (buying
    rate of the category per brand buyer). }
  
  \item{freq}{A matrix that lists the distribution of brand
    purchases.  The number of rows is the number of brands.}

  \item{heavy}{A matrix with two columns.  The first column
    (\code{Penetration}) is the theoretical brand penetration among
category buyers with a specific frequency range. The second column
(\code{Avg Purchase Freq}) is the brand buying rate of those category
buyers. The number of rows is the number of brands.}

  \item{dup}{A vector with dimension as the number of brands. It reports
    the brand duplication (proportion of buyers of a particular brand
also buying other brand) of the focal brand (\code{dup.brand}).}

}

\references{
  \emph{The Dirichlet: A Comprehensive Model of Buying
    Behavior}.  G.J. Goodhardt, A.S.C. Ehrenberg, C. Chatfield.  \emph{Journal
of the Royal Statistical Society. Series A  (General)}, Vol. 147, No. 5 (1984), pp. 621-655
}

\author{Feiming Chen  }

\seealso{\code{\link{dirichlet}}, \code{\link{print.dirichlet}},
    \code{\link{plot.dirichlet}}, \code{\link{NBDdirichlet-package}}}

  \examples{
cat.pen <- 0.56 # Category Penetration
cat.buyrate <- 2.6 # Category Buyer's Average Purchase Rate in a given period.
brand.share <- c(0.25, 0.19, 0.1, 0.1, 0.09, 0.08, 0.03, 0.02) # Brands' Market Share
brand.pen.obs <- c(0.2,0.17,0.09,0.08,0.08,0.07,0.03,0.02) # Brand Penetration
brand.name <- c("Colgate DC", "Macleans","Close Up","Signal","ultrabrite",
"Gibbs SR","Boots Priv. Label","Sainsbury Priv. Lab.")

dobj <- dirichlet(cat.pen, cat.buyrate, brand.share, brand.pen.obs, brand.name)

\dontrun{summary(dobj)}
summary(dobj, t=4, type="freq")
summary(dobj, t=4, type="heavy", heavy.limit=c(7:50))
summary(dobj, t=1, type="dup", dup.brand=2)
}

\keyword{methods}% at least one, from doc/KEYWORDS

