\name{formLattice}
\alias{formLattice}
\title{
Builds a neighbor structure on the nodes.
}
\description{
\code{formLattice} connects all nodes into a neighbor lattice by linking
any two nodes that are within 1.5*node.spacing.  Typically this
will result in links in the E, W, N, S, NE, NW, SE, SW directions.
The lattice object is created by the function dnearneigh from spdep.
}
\usage{
formLattice(nodeFillingOutput)
}
\arguments{
  \item{nodeFillingOutput}{
a \code{nodeFillingOutput} object, as produced by the function \code{nodeFilling}.
}
}
\details{
When forming the lattice, the function does not check to see if any
node is completely isolated from the rest of the nodes, nor does it
check to see that paths exist between all pairs of nodes.  Thus the
lattice might be disconnected.  You can still determine a nonparametric
density in this case, but you need to think about whether it makes sense
to allow disconnected sublattices.  If you wish to connect isolated nodes to
the lattice, use the editing function \code{editLattice}.
}
\value{
formLatticeOutput object
\item{EW.locs }{EW coordinates for use by contour}
\item{NS.locs }{NS coordinates for use by contour}
\item{nodes}{matrix of node locations}
\item{poly}{outer boundary}
\item{latt}{neighbor lattice}
\item{hole.poly}{list of hole polygons}
}
\references{
Ronald P. Barry, Julie McIntyre.  Estimation animal densities and home
range in regions with irregular boundaries and holes:  A lattice-based
alternative to the kernel density estimator.
Ecological Modelling 222 (2011)  1666-1672.
}
\author{
Ronald P. Barry
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

Pointdata = csr(polygon1,80)
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
