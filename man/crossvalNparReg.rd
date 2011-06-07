\name{crossvalNparReg}
\alias{crossvalNparReg}
\title{
Crossvalidation for non-parametric regression.
}
\description{
Performs least-squares crossvalidation for the lattice-based
non-parametric regression estimator.
}
\usage{
crossvalNparReg(formLatticeOutput,Z,PointPattern,M=0.5,num.steps = 200)
}
\arguments{
  \item{formLatticeOutput}{
an object of type formLatticeOutput as returned by functions formLattice and
editLattice
}
  \item{Z}{
the response variable
}
  \item{PointPattern}{
a matrix or data frame of point process locations.  Also, any object that
can be coerced to a matrix by the function as.matrix.
}
  \item{M}{
probability that the random walk stays in the same location in a single step.
}
  \item{num.steps}{
the maximum number of steps used in the crossvalidation.
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
a list consiting of
  \item{SumSq}{A vector of crossvalidated sums of squares for k=1 to num.steps.
  }
  \item{k}{The number of steps that minimizes the crossvalidated sum of 
  squares.
  }
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
#
nodeFillingOutput = nodeFilling(poly=polygon2,node.spacing=0.025)
plot(nodeFillingOutput)
formLatticeOutput = formLattice(nodeFillingOutput)
plot(formLatticeOutput)
hold = crossvalNparReg(formLatticeOutput,Z,
         PointPattern=grid2,M=0.5,num.steps = 75)
NparRegOut = createNparReg(formLatticeOutput,Z,PointPattern=grid2,k=hold$k)
plot(NparRegOut)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
