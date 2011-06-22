\name{homerange}
\alias{homerange}
\title{
Produces a homerange map.
}
\description{
\code{homerange} produces a map of the homerange, for any given percentage.
The homerange contains the smallest number of nodes with total density greater
than the percent.  This function is illustrated in Barry and McIntyre (2011).
}
\usage{
homerange(densityOut, percent = 0.95,output=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{densityOut}{
a \code{densityOut} object, produced by \code{createDensity}.
}
  \item{percent}{
the sum of the probabilities of all nodes in the homerange exceeds this value.
}
  \item{output}{
if TRUE, the function returns a matrix containing, for each node, a
location (first two columns) and whether the node is in the homerange.
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
%\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
%}
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

nodeFillingOutput = nodeFilling(poly=polygon1,node.spacing=0.015)
plot(nodeFillingOutput)
formLatticeOutput = formLattice(nodeFillingOutput)
plot(formLatticeOutput)

Pointdata = csr(polygon1,100)
Pointdata = Pointdata[Pointdata[,1]<0.5,]
plot(rbind(polygon1,polygon1[1,]),type="l")
points(Pointdata,pch=19)

out = crossvalDensity(formLatticeOutput,PointPattern=Pointdata, 
    M=0.5,num.steps = 50)

densityOut = createDensity(formLatticeOutput,PointPattern=Pointdata, 
  k=out$k,intensity=FALSE, sparse = TRUE)
plot(densityOut)

homerange(densityOut, percent = 0.95)



}
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
