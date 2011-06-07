\name{removeHole}
\alias{removeHole}
\title{
Removes holes from the region prior to density estimation.
}
\description{
If a hole in a region is specified as a polygon, the function
\code{removeHole} removes all nodes in the \code{nodeFillingOutput} that are
contained in the hole.  This function is called by \code{nodeFilling},
so it is generally not needed by users.
}
\usage{
removeHole(hole.poly, nodeFillingOutput)
}
\arguments{
  \item{hole.poly}{
a numerical matrix of vertices of the hole polygon.
}
  \item{nodeFillingOutput}{
an object of type \code{nodeFillingOutput}, returned by 
code{nodeFilling} or \code{removeHole}.
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
an object of type \code{nodeFillingOutput}.
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
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
%}
%\examples{
%}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
