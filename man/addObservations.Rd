\name{addObservations}
\alias{addObservations}
\title{Input observations for use in the lattice-based density estimator.}
\description{
This function takes a \code{formLatticeOutput} object, which encodes a region
possibly with and irregular boundary and holes, and adds point process
observations.  The observations should be in the form of a matrix or
data frame.  \code{addObservations} is used when the aim is to produce
a density map from a point process.  If, instead, you wish to produce
a nonparametric regression surface given responses and their locations, you
should use \code{addQuantVar} instead.}
\usage{
addObservations(formLatticeOutput, observations, will.plot=TRUE)
}

\arguments{
  \item{formLatticeOutput}{
a formLatticeOutput object.  This is returned by the functions formLattice and
editLattice.
}
  \item{observations}{
a matrix with two columns or a data frame.  Other arguments will be
coerced (if possible) with as.matrix.
}
  \item{will.plot}{
logical.  If TRUE (default), plots the actual point process along with
the nearest nodes, to which they are relocated.
}
}
\details{
Every node in the \code{formLatticOutput} object is assigned an initial density
that is equal to the fraction of all observations that are nearest to that
node.  Note that this means observations can be outside the boundary of the
region of interest - they will just be associated with the nearest node inside
the region.  The function returns a vector equal in length to the number of
nodes that has the initial density for each node.  This vector corresponds to
\eqn{p_0}, the inital probability vector as in Barry and McIntyre (2011).
}
\value{
a list with two elements.
\item{init.prob}{Numerical vector with the initial probability distribution}
\item{which.nodes}{vector of nodes to which observations were assigned}
}
\references{
Ronald P. Barry, Julie McIntyre.  Estimation animal densities and home
range in regions with irregular boundaries and holes:  A lattice-based
alternative to the kernel density estimator.
Ecological Modelling 222 (2011)  1666-1672.
}
\author{
Ronald P. Barry <rpbarry@alaska.edu>
}

\examples{
plot.new()
data(polygon1)

nodeFillingOutput = nodeFilling(poly=polygon1,node.spacing=0.01)
plot(nodeFillingOutput)
formLatticeOutput = formLattice(nodeFillingOutput)
plot(formLatticeOutput)

Pointdata = csr(polygon1,100)
Pointdata = Pointdata[Pointdata[,1]<0.5,]
plot(rbind(polygon1,polygon1[1,]),type="l")
points(Pointdata,pch=19)

out = crossvalDensity(formLatticeOutput,PointPattern=Pointdata,M=0.5,
num.steps = 50)

densityOut = createDensity(formLatticeOutput,PointPattern=Pointdata, 
  k=out$k,intensity=FALSE, sparse = TRUE)
plot(densityOut)

homerange(densityOut, percent = 0.95)



%\keyword{ ~kwd1 }
 }
