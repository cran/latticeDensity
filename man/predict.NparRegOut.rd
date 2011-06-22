\name{predict.NparRegOut}
\alias{predict.NparRegOut}
\title{
Predictions at data locations from lattice-based non-parametric regression.
}
\description{
Takes as input a \code{NparRegOut} object from the function \code{createNparReg}.  
A vector of predicted values is produced corresponding to each location 
in the data.
}
\usage{
\method{predict}{NparRegOut}(object,new.pred=NULL,\dots)
}
\arguments{
  \item{object}{
an object of type \code{NparRegOut} returned by \code{createNparReg}.
}
  \item{new.pred}{
if new.pred is left out, predictions are made at the locations of
the point pattern.  Otherwise, new.pred is a 2-column matrix of
locations where you wish to obtain predictions
  }
  \item{\dots}{
aditionally arguments affecting the predictions, of which there
are none at this time.
}
}
\details{
If new.pred is not used as an arguments, this function returns a vector
of predictions at each node closest to an observations of the original
point process.  If you wish to make predictions at arbitrary locations,
let new.pred be a 2-column matrix of those locations.  Note that all
predictions are actually at the nearest node to the desired locations.
NOTE:  Like all functions in this package, new locations are relocated to the
nearest node in the region, even if they are outside the boundary.  Thus you
should ensure that your locations of interest are inside the boundary and
that the density of nodes is high enough that the nearest node is close
enough to the location you queried.
}

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
data(nparExample)
attach(nparExample)
plot.new()
#  Simulate a response variable
index1 = (grid2[,2]<0.8)|(grid2[,1]>0.6)
Z = rep(NA,length(grid2[,1]))
n1 = sum(index1)
n2 = sum(!index1)
Z[index1] = 3*grid2[index1,1] + 4 + rnorm(n1,0,sd=0.4)
Z[!index1] = -2*grid2[!index1,1] + 4 + rnorm(n2,0,sd=0.4)
#
plot(rbind(polygon2,polygon2[1,]),type="l")
points(grid2,pch=19,cex=0.5,xlim=c(-0.1,1))
text(grid2,labels=round(Z,1),pos=4,cex=0.5)
#  Following is the generation of the nonparametric
#  regression prediction surface.
nodeFillingOutput = nodeFilling(poly=polygon2,node.spacing=0.025)
plot(nodeFillingOutput)
formLatticeOutput = formLattice(nodeFillingOutput)
plot(formLatticeOutput)
NparRegOut = createNparReg(formLatticeOutput,Z,PointPattern=grid2,k=2)
plot(NparRegOut)
predict(NparRegOut)
}
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
