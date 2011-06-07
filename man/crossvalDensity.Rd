\name{crossvalDensity}
\alias{crossvalDensity}
\title{
UBC crossvalidation for the lattice-based density estimator.
}
\description{
A function to perform crossvalidation to determine the smoothing
parameter for the lattice-based density estimator.  It minimizes the
UCV criterion.
}
\usage{
crossvalDensity(formLatticeOutput, PointPattern, M = 0.5,num.steps = 200, sparse = TRUE)
}
\arguments{
  \item{formLatticeOutput}{
an object of type formLatticeOutput as returned by functions formLattice and
editLattice
}
  \item{PointPattern}{
a matrix or data frame of point process locations.  Also, any object that
can be coerced to a matrix by the function as.matrix.
}
  \item{M}{
governs how often the random walks stays in the same location.
}
  \item{num.steps}{
the maximum number of steps used in the crossvalidation.
}
  \item{sparse}{
logical.  If TRUE (default), functions use sparse matrix computations from
the package spam.  If FALSE, functions use full matrices.
}
}
\details{
The function computes the k-step diffusion \eqn{p_k = T^kp_0}, then computes the
Unbiased CrossValidation (UCV) criterion of Sain, Baggerly and Scott (1994).
This function can compute the UCV using either full matrix methods or sparse 
(default) matrix methods.  The latter are almost always much faster, though it 
is possible that if the number of points in the point pattern is large compared
to the number of nodes (an unlikely circumstance) that the full matrix method
would be quicker.  The sparse matrix approach typically uses less memory.  The
paper by Barry and McIntyre (2010) shows the approximation to the UCV used
in this approach.
}
\value{
  \item{ucv }{a vector of ubc values, one for each step k}
  \item{k }{the number of steps that minimizes the ucv}
}
\references{
Ronald P. Barry, Julie McIntyre.  Estimation animal densities and home
range in regions with irregular boundaries and holes:  A lattice-based
alternative to the kernel density estimator.
Ecological Modelling 222 (2011)  1666-1672.

Crossvalidation of Multivariate Densities.
Stephan R. Sain, Keith A. Baggerly, David W. Scott; Journal of the American 
Statistical Association, Vol. 89 (1994) 807-817
}
\author{
Ronald P. Barry <rpbarry@alaska.edu>
}

\examples{
plot.new()
data(polygon1)

nodeFillingOutput = nodeFilling(poly=polygon1,node.spacing=0.02)
plot(nodeFillingOutput)
formLatticeOutput = formLattice(nodeFillingOutput)
plot(formLatticeOutput)

Pointdata = csr(polygon1,100)
Pointdata = Pointdata[Pointdata[,1]<0.5,]
plot(rbind(polygon1,polygon1[1,]),type="l")
points(Pointdata,pch=19)

out = crossvalDensity(formLatticeOutput,PointPattern=Pointdata, M=0.5,num.steps = 100)

densityOut = createDensity(formLatticeOutput,PointPattern=Pointdata, 
  k=out$k,intensity=FALSE, sparse = TRUE)
plot(densityOut)

homerange(densityOut, percent = 0.95)





}
%\keyword{ ~kwd1 }

