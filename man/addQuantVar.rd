\name{addQuantVar}
\alias{addQuantVar}
\title{Input response variable for use in the createNparReg function}
\description{
This function takes a \code{formLatticeOutput} object, which encodes a region
possibly with and irregular boundary and holes.  This and a matrix of
locations where a response variable has been measured, and a vector of
the responses, is used to create an initial distribution for use in the
non-parametric regression function \code{createNparReg}.  If, instead, you
have a point process and wish to produce a density estimate, you should use
the function \code{addObservations}.}
\usage{
addQuantVar(formLatticeOutput, Z, locations, will.plot=TRUE)
}

\arguments{
  \item{formLatticeOutput}{
a formLatticeOutput object.  This is returned by the functions formLattice and
editLattice.
}
  \item{Z}{
a vector of the response variable.
}
  \item{locations}{
a matrix with two columns or a data frame.  Other arguments will be
coerced (if possible) with as.matrix.
}
  \item{will.plot}{
logical.  If TRUE (default), plots the actual point process along with
the nearest nodes, to which they are relocated.
}
}
%\details{
%
%}
\value{
a list with three elements.
\item{init.quantvar}{Numerical vector of initial probability distribution 
  multiplied by the response variable.  This is used to compute the 
  numerator of the kernel estimator.}
\item{init.prob}{Numerical vector with the initial probability distribution
  based on locations.  This is used to compute the denominator of the 
  kernel estimator.}
\item{which.nodes}{vector of nodes to which observations were assigned}
}
%\references{
%Ronald P. Barry, Julie McIntyre.  Estimation animal densities and home
%range in regions with irregular boundaries and holes:  A lattice-based
%alternative to the kernel density estimator.
%Ecological Modelling 222 (2011)  1666-1672.
%}
\author{
Ronald P. Barry <rpbarry@alaska.edu>
}

\examples{
data(nparExample)
attach(nparExample)
#
plot(rbind(polygon2,polygon2[1,]),type="l")
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

