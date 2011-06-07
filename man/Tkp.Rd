\name{Tkp}
\alias{Tkp}
\title{
Compute the vector T^k*p
}
\description{
T is the transition matrix of the random walk on the lattice.  By
multiplying by the probability density p at time t, you get the
probability density at time t+1.  Thus, to get the probability density
after k steps, pk, compute \eqn{p_k = T^kp_1}.  This application of
finite Markov processes is described in Barry and McIntyre (2011).
}
\usage{
Tkp(T, k, p)
}
\arguments{
  \item{T}{
transition matrix returned by \code{makeTmatrix}.
}
  \item{k}{
the number of steps in the diffusion.
}
  \item{p}{
a numerical vector of length equal to the number of nodes, of 
initial probabilities.
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
%\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
%}
\references{
Ronald P. Barry, Julie McIntyre.  Estimation animal densities and home
range in regions with irregular boundaries and holes:  A lattice-based
alternative to the kernel density estimator.
Ecological Modelling 222 (2011)  1666-1672.
}
\author{
Ronald P. Barry \email{rpbarry@alaska.edu}
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
%}
\examples{
plot.new()
data(polygon1)
require(splancs)
require(spatstat)

nodeFillingOutput = nodeFilling(poly=polygon1,node.spacing=0.015)
formLatticeOutput = formLattice(nodeFillingOutput)

Pointdata = csr(polygon1,80)
Pointdata = Pointdata[Pointdata[,1]<0.5,]


init.prob = addObservations(formLatticeOutput, Pointdata)
T = makeTmatrix(formLatticeOutput, M = 0.5, sparse=TRUE)
p10 = Tkp(T,10,p=init.prob$init.prob)
cbind(init.prob$init.prob,p10)
}

%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
