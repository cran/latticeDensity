\name{areaRegion}
\alias{areaRegion}
\title{Computes the area of a region}
\description{
This function computes the area of a region by first finding
the area of the bounding polygon, then subtracting the area
of each hole.}
\usage{
areaRegion(formLatticeOutput)
}

\arguments{
  \item{formLatticeOutput}{
a \code{formLatticeOutput} object.  This is returned by the functions 
\code{formLattice} and \code{editLattice}.
}
}
\details{
Note that this program does not check to see if the holes are non-intersecting
or if the holes intersect the polygon.
}
\value{
Numerical area.
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
data(areaRegionExample)
attach(areaRegionExample)
#
hole.list = list(hole1,hole2)
nodeFillingOutput = nodeFilling(poly=boundary,node.spacing=0.03,
 hole.list = hole.list)
formLatticeOutput = formLattice(nodeFillingOutput)
plot(formLatticeOutput)

areaRegion(formLatticeOutput)
}
%\keyword{ ~kwd1 }

