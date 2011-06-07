\name{makeTmatrix}
\alias{makeTmatrix}
\title{
Create the transition matrix for the diffusion.
}
\description{
This function generates a transition matrix for the diffusion process
on the lattice.
}
\usage{
makeTmatrix(formLatticeOutput, M = 0.5, sparse = TRUE)
}
\arguments{
  \item{formLatticeOutput}{
a \code{formLatticeOutput} object, returned by the functions \code{formLattice} 
or by the function \code{editLattice}.
}
  \item{M}{
a smoothing parameter.  It is the probability that the random walk stays
on the same node in a single step.  Since the number of steps k also
determines smoothing, M is usually left at 0.5.  Note that values of
M = 1 or M = 0 can lead to pathological results.  The paper of Barry and
McIntyre (2011) shows the exact construction of the transition matrix.
}
  \item{sparse}{
logical.  If TRUE, then uses sparse matrix computations from packages spdep
and spam.  If FALSE, uses full matrix computations.  The use of sparse 
matrices is almost always more efficient.
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
an NxN transition matrix, where N is the number of nodes.
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

nodeFillingOutput = nodeFilling(poly=polygon1,node.spacing=0.02)
formLatticeOutput = formLattice(nodeFillingOutput)

Pointdata = csr(polygon1,100)
Pointdata = Pointdata[Pointdata[,1]<0.5,]

poly.area = areapl(polygon1)

init.prob = addObservations(formLatticeOutput, Pointdata)
T = makeTmatrix(formLatticeOutput, M = 0.5, sparse=TRUE)
p10 = Tkp(T,10,p=init.prob$init.prob)
cbind(init.prob$init.prob,p10)



}
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
