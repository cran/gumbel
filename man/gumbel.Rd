\name{Gumbel}
\alias{gumbel}
\alias{dgumbel}
\alias{pgumbel}
\alias{rgumbel}
\alias{phigumbel}
\alias{invphigumbel}
\alias{gumbel.MBE}
\alias{gumbel.EML}
\alias{gumbel.IFM}
\alias{gumbel.CML}
\title{The Gumbel Hougaard Copula}
\description{
  Density function, distribution function, random generation,
  generator and inverse generator function for the Gumbel Copula with
  parameters \code{alpha}. The 4 classic estimation methods for copulas.
}
\usage{
dgumbel(u, v=NULL, alpha, dim=2, warning = FALSE)
pgumbel(u, v=NULL, alpha, dim=2)
rgumbel(n, alpha, dim=2, method=1)
phigumbel(t, alpha=1)
invphigumbel(t, alpha=1)
gumbel.MBE(x, y, marg = "exp")
gumbel.EML(x, y, marg = "exp")
gumbel.IFM(x, y, marg = "exp")
gumbel.CML(x, y)
}
\arguments{
  \item{u}{vector of quantiles if argument \code{v} is provided
	or matrix of quantiles if argument \code{v} is not provided}
  \item{v}{vector of quantiles, needed if \code{u} is not a matrix}
  \item{n}{number of observations. If \code{length(n) > 1}, the length is
    taken to be the number required.}
  \item{alpha}{parameter of the Copula. Must be greater than \eqn{1}.}
  \item{dim}{an integer specifying the dimension of the copula.}
  \item{t}{dummy variable of the generator \eqn{\phi} or the inverse generator \eqn{\phi^-1}. could be a n-dimensional array}
  \item{method}{an integer code for the method used in simulation. 1 is the common frailty approach, 2 uses the K function (only valid with \code{dim}=2).}
  \item{x,y}{vectors of observations, realizations of random variable \eqn{X} and \eqn{Y}.}
  \item{marg}{a character string specifying the marginals of vector \eqn{(X,Y)}. It must be either 
"exp"(default value) or "gamma".}
  \item{warning}{a logical (default value \code{FALSE}) if you want warnings.}	
}
\details{
	The Gumbel Hougaard Copula with parameter \code{alpha} is defined by
	its generator \deqn{\phi(t) = (-ln(t))^alpha.} The generator and inverse generator are
	implemented in \code{phigumbel} and \code{invphigumbel} respectively. 
	As an Archimedean copula, its
	distribution function is \deqn{ C(u_1, ...,u_n) = \phi^{-1}(\phi(u_1)+...+\phi(u_n)) 
	= exp(-( (-ln(u_1))^alpha+...+(-ln(u_n))^alpha )^1/\alpha).}
	\code{pgumbel} and \code{dgumbel} computes the distribution function (expression above) and
	the density (\eqn{n} times differentiation of expression above with respect to \eqn{u_i}). 
	As there is no explicit
	formulas for the density of a Gumbel copula, \code{dgumbel} is not yet impemented 
	for argument \code{dim>3}. This two functions works with a \code{dim}-dimensional array with
	the last dimension being equalled to \code{dim} or with a matrix with \code{dim} 
	columns (see examples).

	Random generation is carried out with 2 algorithms the common frailty 
	algorithm (method=1) and the 'K' algorithm (method=2).
	The common frailty algorithm (cf. Marshall & Olkin(1988)) can be sum up in three lines
	\itemize{ 
	\item{}{generate \eqn{y_1}, \eqn{y_2} from exponential distribution of mean 1,}
	\item{}{generate \eqn{\theta} from a stable distribution with parameter\eqn{(1/alpha,1,1,0)},} 
	\item{}{\eqn{u_1 <- phi(y_1/\theta)} and \eqn{u_2 <- phi(y_2/\theta)}.}
	}
	This algorithm works with any dimension. See Chambers et al(1976) for stable random generation.
	The 'K' algorithm use the fact the distribution function of random variable \eqn{C(U,V)} is \eqn{K(t) = t-\phi(y)/\phi'(t)}. The algorithm is
	\itemize{
	\item{}{generate \eqn{v_1}, \eqn{t} from uniform distribution}
	\item{}{generate \eqn{v_2} from the \eqn{K} distribution i.e. \eqn{v_2<-K^{-1}(t)}. }
	\item{}{\eqn{u_1<-\phi^{-1}(\phi(v_1)v_2)} and \eqn{u_2<-\phi^{-1}(\phi(v_1)(1-v_2)) }.}
	}
	Warning, the 'K' algorithm does NOT work with \code{dim>2}. 
	
	We implements the 4 usual method of estimation for copulas, namely the Exact Maximum
	Likelihood (\code{gumbel.EML}), the Inference for Margins (\code{gumbel.IFM}), the
	Moment-base Estimation (\code{gumbel.MBE}) and the Canonical Maximum 
	Likelihood (\code{gumbel.CML}). For the moment, only two types of marginals are 
	available : exponential distribution (\code{marg="exp"}) and gamma distribution
	(\code{marg="gamma"}).
	
}
\value{
  \code{dgumbel} gives the density,
  \code{pgumbel} gives the distribution function,
  \code{rgumbel} generates random deviates,
	\code{phigumbel} gives the generator,
	\code{invphigumbel} gives the inverse generator.

  \code{gumbel.EML}, \code{gumbel.IFM}, \code{gumbel.MBE} and \code{gumbel.CML}
  returns the vector of estimates.	

  Invalid arguments will result in return value \code{NaN}.
}
\references{
 Nelsen, R. (2006),
  \emph{An Introduction to Copula, Second Edition}, Springer.
  
 Marshall & Olkin(1988),
  \emph{Families of multivariate distributions}, Journal of the American Statistical Association.
  
 Chambers et al (1976),
  \emph{A method for simulating stable random variables}, Journal of the American Statistical Association.

 Nelsen, R. (2005),
  \emph{Dependence Modeling with Archimedean Copulas}, booklet available at www.lclark.edu/~mathsci/brazil2.pdf.	
}
\author{
 A.-L. Caillat, C. Dutang, M. V. Larrieu and T. Nguyen
}
\examples{
	#dim=2
	u<-seq(0,1, .1)
	v<-u
	#classic parametrization
	#independance case (alpha=1)
	dgumbel(u,v,1)
	pgumbel(u,v,1)
	#another parametrization
	dgumbel(cbind(u,v), alpha=1)
	pgumbel(cbind(u,v), alpha=1)

	#dim=3 - equivalent parametrization
	x <- cbind(u,u,u)
	y <- array(u, c(1,11,3))
	pgumbel(x, alpha=2, dim=3)
	pgumbel(y, alpha=2, dim=3)
	dgumbel(x, alpha=2, dim=3)
	dgumbel(y, alpha=2, dim=3)

	#dim=4
	x <- cbind(x,u)
	pgumbel(x, alpha=3, dim=4)
	y <- array(u, c(2,1,11,4))
	pgumbel(y, alpha=3, dim=4)
	
	
	#independence case
	rand <- t(rgumbel(200,1))
	plot(rand[1,], rand[2,], col="green", main="Gumbel copula")
	
	#positive dependence
	rand <- t(rgumbel(200,2))
	plot(rand[1,], rand[2,], col="red", main="Gumbel copula")
	
	#comparison of random generation algorithms
	nbsimu <- 10000
	#Marshall Olkin algorithm
	system.time(rgumbel(nbsimu, 2, dim=2, method=1))[3]
	#K algortihm
	system.time(rgumbel(nbsimu, 2, dim=2, method=2))[3]
	
	#pseudo animation
	\dontrun{
	anim <-function(n, max=50)
	{
	for(i in seq(1,max,length.out=n)) 
	{
		u <- t(rgumbel(10000, i, method=2))
		plot(u[1,], u[2,], col="green", main="Gumbel copula", xlim=c(0,1), ylim=c(0,1), pch=".")
		cat()
	}	
	}
	anim(20, 20)
	}
	
	#3D plots

	#plot the density
 	x <- seq(.05, .95, length = 30)
	y <- x
	z <- outer(x, y, dgumbel, alpha=2)
		
	persp(x, y, z, theta = 30, phi = 30, expand = 0.5, col = "lightblue",
      ltheta = 100, shade = 0.25, ticktype = "detailed",
      xlab = "x", ylab = "y", zlab = "density")
	
	#with wonderful colors
	#code of P. Soutiras
	zlim <- c(0, max(z))
	ncol <- 100
	nrz <- nrow(z)
	ncz <- ncol(z)
	jet.colors <- colorRampPalette(c("#00007F", "blue", "#007FFF", 
	"cyan", "#7FFF7F", "yellow", "#FF7F00", "red", "#7F0000")) 
	couleurs <- tail(jet.colors(1.2*ncol),ncol)
	fcol <- couleurs[trunc(z/zlim[2]*(ncol-1))+1]
	dim(fcol) <- c(nrz,ncz)
	fcol <- fcol[-nrz,-ncz]
	persp(x, y, z, col=fcol, zlim=zlim, theta=30, phi=30, ticktype = "detailed", box = TRUE, 	xlab = "x", ylab = "y", zlab = "density")
	

	#plot the distribution function
	z <- outer(x, y, pgumbel, alpha=2)
	persp(x, y, z, theta = 30, phi = 30, expand = 0.5, col = "lightblue",
        ltheta = 100, shade = 0.25, ticktype = "detailed",
        xlab = "u", ylab = "v", zlab = "cdf")
	
	

	#parameter estimation
	#true value : lambdaX=lambdaY=1, alpha=2
	simu <- qexp(rgumbel(200, 2))
	gumbel.MBE(simu[,1], simu[,2])
	gumbel.IFM(simu[,1], simu[,2])
	gumbel.EML(simu[,1], simu[,2])
	gumbel.CML(simu[,1], simu[,2])

	#true value : lambdaX=lambdaY=1, alphaX=alphaY=2, alpha=3
	simu <- qgamma(rgumbel(200, 3), 2, 1)
	gumbel.MBE(simu[,1], simu[,2], "gamma")
	gumbel.IFM(simu[,1], simu[,2], "gamma")
	gumbel.EML(simu[,1], simu[,2], "gamma")
	gumbel.CML(simu[,1], simu[,2])
		

		
}
\keyword{distribution}
