\name{plot.nodeFillingOutput}
\alias{plot.nodeFillingOutput}
\title{
Plot a \code{nodeFillingOutput} object.
}
\description{
Plots the boundary, all holes and the locations of all
nodes.  Should be used to decide if the nodes fill the
region and are spaced closely enough to give good resolution
in the plots.  The only reason not to make the nodes too
closely spaced is when the computing time or memory becomes
too great.
}
\usage{
\method{plot}{nodeFillingOutput}(x,\dots)
}
\arguments{
  \item{x}{
an object of type \code{nodeFillingOutput} returned by either \code{nodeFilling}
 or \code{removeHole}.
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

nodeFillingOutput = nodeFilling(poly=polygon1,node.spacing=0.01)
plot(nodeFillingOutput)
}
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
