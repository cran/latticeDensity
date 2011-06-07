\name{plot.densityOut}
\alias{plot.densityOut}
\title{
Plot the density map
}
\description{
Plots the boundary, all holes and the locations of all
nodes along with the density contour map.
}
\usage{
\method{plot}{densityOut}(x,show.observations=FALSE,\dots)
}
\arguments{
  \item{x}{
an object of type \code{densityOut} returned by createDensity.
}
  \item{show.observations}{
if TRUE, prints the data in the plot.
}
  \item{\dots}{
other arguments to be passed to functions plot, points, lines.
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}

\references{
Ronald P. Barry, Julie McIntyre.  Estimation animal densities and home
range in regions with irregular boundaries and holes:  A lattice-based
alternative to the kernel density estimator.
Ecological Modelling 222 (2011)  1666-1672.
}
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
#
nodeFillingOutput = nodeFilling(poly=polygon1,node.spacing=0.025)
plot(nodeFillingOutput)
formLatticeOutput = formLattice(nodeFillingOutput)
plot(formLatticeOutput)
#
Pointdata = csr(polygon1,100)
Pointdata = Pointdata[Pointdata[,1]<0.5,]
plot(rbind(polygon1,polygon1[1,]),type="l")
points(Pointdata,pch=19)

#
densityOut = createDensity(formLatticeOutput,PointPattern=Pointdata, 
  k=60,intensity=FALSE, sparse = TRUE)
plot(densityOut)
#
homerange(densityOut, percent = 0.95)



}
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
