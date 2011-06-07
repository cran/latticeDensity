\name{createNparReg}
\alias{createNparReg}
\title{
This function performs nonparametric regression.
}
\description{
This function takes the lattice from formLattice (which fills the 
region of interest) along with the list of responses and their locations,
and creates a prediction surface.  The approach is kernel non-parametric
regression with the kernels created by a k-step diffusion on the
lattice about each location where a response was collected.
}
\usage{
createNparReg(formLatticeOutput,Z,PointPattern=NULL,M=0.5,k, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{formLatticeOutput}{
a formLatticeOutput object, returned by formLattice or by editLattice.
}
  \item{Z}{
a numerical vector of N responses.
}
  \item{PointPattern}{
a 2xN matrix of locations where the response variables were collected.
}
  \item{M}{
probability that the random walk stays in the same location on a single step.
}
  \item{k}{
the smoothing parameter, k is the number of steps in the diffusion.
}
  \item{\dots}{
arguments for the contour function.
}
}
\details{
We denote by \eqn{K_{ik}(s)} the kernel obtained by assigning the node
nearest to the ith response and then running a k-step diffusion on 
the lattice and evaluating the resulting density at location s.  
Then the estimator \eqn{\hat{f}(s) = (\sum_i K_{ik}(s)*Z_i)/\sum_i K_{ik}(s)}
which is the traditional kernal regression estimator with diffusion 
kernels.  This approach leads to a non-parametric regression that
respects the boundaries of the polygonal region.  The construction of the
kernels is detailed in Barry and McIntyre (2011).  Using kernels to 
perform nonparametric regression is described in many publications, including
Wasserman (2006).
}
\value{An object of type \code{NparRegOut}}
\references{
Ronald P. Barry, Julie McIntyre.  Estimation animal densities and home
range in regions with irregular boundaries and holes:  A lattice-based
alternative to the kernel density estimator.
Ecological Modelling 222 (2011)  1666-1672.

Larry Wasserman.  All of Nonparametric Statistics.  Springer Science + 
Business Media, Inc. N.Y. 2006.
}
\author{
Ronald P. Barry <rpbarry@alaska.edu>
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
%}
\examples{
data(nparExample)
attach(nparExample)
plot.new()
#  Simulate a response variable
index1 = (grid2[,2]<0.8)|(grid2[,1]>0.6)
Z = rep(NA,length(grid2[,1]))
n1 = sum(index1)
n2 = sum(!index1)
Z[index1] = 3*grid2[index1,1] + 4 + rnorm(n1,0,sd=0.4)
Z[!index1] = -2*grid2[!index1,1] + 4 + rnorm(n2,0,sd=0.4)
#
coords=rbind(polygon2,polygon2[1,])
plot(coords,type="l")
points(grid2,pch=19,cex=0.5,xlim=c(-0.1,1))
text(grid2,labels=round(Z,1),pos=4,cex=0.5)
#
nodeFillingOutput = nodeFilling(poly=polygon2,node.spacing=0.025)
plot(nodeFillingOutput)
formLatticeOutput = formLattice(nodeFillingOutput)
plot(formLatticeOutput)
NparRegOut = createNparReg(formLatticeOutput,Z,PointPattern=grid2,k=2)
plot(NparRegOut)
}
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
