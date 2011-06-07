\name{latticeDensity-package}
\alias{latticeDensity-package}
\alias{latticeDensity}
\docType{package}
\title{
Creates a 2-dimensional density estimate or nonparametric regression surface.
}
\description{
Lattice Density can take a region bounded externally with a polygon and
possibly containing polygonal holes, along with a point pattern in the
region, and produces a 2-dimensional density map.  Given a set of 
locations each associated with a response, \code{latticeDensity} can produce
a 2-dimensional nonparametric regression surface.
}
\details{
\tabular{ll}{
Package: \tab latticeDensity\cr
Type: \tab Package\cr
Version: \tab 1.0.5\cr
Date: \tab 2011-06-07\cr
License: \tab GPL-2\cr
LazyLoad: \tab yes\cr
}

}
\author{
Ronald P. Barry <rpbarry@alaska.edu>
}
%\references{}



%\keyword{ package }
%\seealso{
%~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
%}
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

out = crossvalDensity(formLatticeOutput,PointPattern=Pointdata, M=0.5,num.steps = 50)

densityOut = createDensity(formLatticeOutput,PointPattern=Pointdata, 
  k=out$k,intensity=FALSE, sparse = TRUE)
plot(densityOut)

homerange(densityOut, percent = 0.95)
}
