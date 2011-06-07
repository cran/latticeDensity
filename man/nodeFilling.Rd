\name{nodeFilling}
\alias{nodeFilling}
\title{
Produces a grid of locations inside the region boundary.
}
\description{
\code{nodeFilling} produces a grid of locations that are the nodes in the
diffusion process.
}
\usage{
nodeFilling(poly, node.spacing, hole.list)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{poly}{
a matrix that contains the vertices of the bounding polygon.
}
  \item{node.spacing}{
the distance between grid locations.
}
  \item{hole.list}{
  optional list of holes to be removed from the region
}
  \item{\dots}{
arguments for the plot produced as a side effect.
}
}
\details{
\code{nodeFilling} superimposes a square grid of points over the region, with
spacing given by the parameter \code{node.spacing}.  The points contained in 
the region are retained.  The output, a \code{nodeFillingOutput} object, contains 
the boundaries of the region (and holes), the set of nodes, and EW and NS
coordinates necessary for creating a contour plot.
}
\value{
an object of type nodeFillingOutput is produced.
\item{EW.locs }{EW coordinates for the contour plot}
\item{NS.locs }{NS coordinates for the contour plot}
\item{nodes}{matrix of node locations}
\item{poly}{matrix of vertices of boundary polygon}
\item{node.spacing}{verticle and horizontal node spacing}
\item{hole.list}{list of polygons representing holes in region}
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
plot(nodeFillingOutput)
formLatticeOutput = formLattice(nodeFillingOutput)
plot(formLatticeOutput)

Pointdata = csr(polygon1,100)
Pointdata = Pointdata[Pointdata[,1]<0.5,]
plot(rbind(polygon1,polygon1[1,]),type="l")
points(Pointdata,pch=19)

densityOut = createDensity(formLatticeOutput,PointPattern=Pointdata, 
  k=20,intensity=FALSE, sparse = TRUE)
plot(densityOut)

homerange(densityOut, percent = 0.95)



}
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
