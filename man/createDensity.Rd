\name{createDensity}
\alias{createDensity}
\title{
Generates a density using random walks on a lattice.
}
\description{
Given a lattice and a point pattern of observations, \code{createDensity} 
starts random walks at each observation.  k steps are taken and the output is
a \code{densityOut} object, which can be used to plot a density estimate.  If
you wish to perform non-parametric regression, you should use the functions
\code{addQuantVar} and \code{createNparReg} instead.
}
\usage{
createDensity(formLatticeOutput, PointPattern = NULL, M = 0.5, k, 
intensity = FALSE, sparse=TRUE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{formLatticeOutput}{
a formLatticeOutput object, returned by formLattice or by editLattice.
}
  \item{PointPattern}{
a matrix of location of the point processes.
}
  \item{M}{
  the probability that the random walk stays in the same location.
  }
  \item{k}{
the smoothing parameter, k is the number of steps in the diffusion.
}
  \item{intensity}{
a logical.  Either an intensity of a density map is produced.
}
  \item{sparse}{
a logical.  If TRUE, function uses sparse matrix compuations.
}
  \item{\dots}{
arguments for the contour function.
}
}
\details{
We start with an initial probability density \eqn{p_0} where the ith entry in 
\eqn{p_0} is the fraction of the point pattern that is nearest to the ith node.
This is the empirical density function with no smoothing.  If \eqn{T} is the
transition matrix, and given a number of steps in the diffusion, \eqn{T^kp_0} is
the probability density of the diffusion after k steps.  This is the major 
output of this function, along with information needed to produce a plot, 
including the polygons for the boundary and holes, and a vector of NS 
coordinates and EW coordinates used by the contour function.  All of the 
necessary information for plotting is bundled in the object of 
class \code{densityOutLBDE}.  Details of this process can be found in Barry
and McIntyre (2011).
}
\value{
an object of type \code{densityOut}
\item{EW.locs}{A vector of the EW coordinates for use in a countour plot
  }
  \item{NS.locs}{A vector of the NS coordinates for use in a contour plot.
  }
  \item{boundaryPoly}{The boundary of the region, a two-column numeric matrix
  }
  \item{hole.list}{A list of polygons, one for each hole in the region
  }
  \item{PointPattern}{A 2 column matrix of object locations
  }
  \item{probs}{probability distribution on the lattice after k steps
  }
  \item{densityLBDE}{A vector that is reformatted by the plot.DensityOut
  function to make a contour plot of the estimated density.}
  \item{area}{area of the region, accounting for holes in the region}
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

out = crossvalDensity(formLatticeOutput,PointPattern=Pointdata, 
  M=0.5,num.steps = 50)

densityOut = createDensity(formLatticeOutput,
  PointPattern=Pointdata, k=out$k,intensity=FALSE, sparse = TRUE)
plot(densityOut)

homerange(densityOut, percent = 0.95)


}
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
