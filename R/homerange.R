#' Produces a homerange map.
#' 
#' homerange produces a map of the homerange, 
#' for any given percentage. The homerange 
#' contains the smallest number of nodes with 
#' total density greater than the percent. This 
#' function is illustrated in Barry and McIntyre (2011).
#' 
#' @param densityOut A densityOut object, produced by createDensity.
#' @param percent the sum of the probabilities of all 
#' nodes in the homerange exceeds this value.
#' @param output if TRUE, the function returns a matrix 
#' containing, for each node, a location (first two columns) 
#' and whether the node is in the homerange.
#' @param show if FALSE, suppresses printing the area
#' @return A list of two vectors used for mapping:
#' \itemize{
#' \item nodes The coordinates of all nodes in the model
#' \item ind Indicator functions, is the location in the homerange?
#' }
#' 
#' @author Ronald P. Barry
#' @references 
#' Ronald P. Barry, Julie McIntyre. Estimating 
#' animal densities and home range in regions 
#' with irregular boundaries and holes: A lattice-based 
#' alternative to the kernel density estimator. 
#' Ecological Modelling 222 (2011) 1666-1672.
#' <doi:10.1016/j.ecolmodel.2011.02.016>
#' 
#' @examples 
#'     plot.new()
#' data(polygon1)
#' nodeFillingOutput <- nodeFilling(poly=polygon1, node_spacing=0.015)
#' plot(nodeFillingOutput)
#' formLatticeOutput <- formLattice(nodeFillingOutput)
#' plot(formLatticeOutput)
#' Pointdata <- splancs::csr(polygon1,75)
#' Pointdata <- Pointdata[Pointdata[,1]<0.5,]
#' plot(polygon1,type="n")
#' polygon(polygon1)
#' points(Pointdata,pch=19)
#' out <- crossvalDensity(formLatticeOutput,PointPattern=Pointdata,
#'                       M=0.5,max_steps = 40)
#' densityOut <- createDensity(formLatticeOutput,PointPattern=Pointdata,
#' k=out$k,intensity=FALSE, sparse = TRUE)
#' plot(densityOut)
#' homerange(densityOut, percent = 0.95)
#' 
#' @import utils
#' @import graphics
#' @import stats
#' @export
homerange <- 
function(densityOut, percent = 0.95, output=FALSE, show=TRUE){
#
      if(!inherits(densityOut,"densityOut")){
       stop("Should be the output from the function createDesity")}
  nodes <- densityOut$nodes
  poly <- densityOut$poly
  area <- densityOut$area
  z <- densityOut$probs
  cmstz <- cumsum(sort(z))
  count <- sum(cmstz <= (1-percent))
  ind <- (z>sort(z)[count])
  plot(nodes,cex=0.1)
  points(nodes[ind,],pch=19,cex=0.5)
  lines(rbind(poly,poly[1,]))
  #
  #  Compute proportion of total area in homerange
  #
  proportion <- sum(ind)/length(nodes[,1])
  prop_of_area <- proportion*area
  if(show){
    cat("Proportion of region in homerange = ", proportion, "\n")
    cat("Area of homerange = ", prop_of_area, "\n")
  }
  if(output){
    return(cbind(nodes,ind))
    }
}

