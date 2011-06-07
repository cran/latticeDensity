\name{plot.formLatticeOutput}
\alias{plot.formLatticeOutput}
\title{
Plot the lattice.
}
\description{
This function plots the boundary, holes, nodes and neighbor lattice
for the lattice based density or regression estimators.  The plot can
be examined to determine whether the lattice of connected nodes fills 
the region.  If some nodes are connected when they should not be, or 
are disconnected when they should be connected, use \code{editLattice} to
add or remove neighbor links.
}
\usage{
\method{plot}{formLatticeOutput}(x,\dots)
}
\arguments{
  \item{x}{
an object of type \code{formLatticeOutput} returned by either \code{formLattice}
or \code{editLattice}.
}
  \item{\dots}{
other arguments to be passed to functions plot, points, lines.
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}

%\references{
%Ronald P. Barry, Julie McIntyre.  Estimation animal densities and home
%range in regions with irregular boundaries and holes:  A lattice-based
%alternative to the kernel density estimator.
%Ecological Modelling 222 (2011)  1666-1672.
%}
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

nodeFillingOutput = nodeFilling(poly=polygon1,node.spacing=0.015)
plot(nodeFillingOutput)
formLatticeOutput = formLattice(nodeFillingOutput)
plot(formLatticeOutput)
}
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
