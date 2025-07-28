#' Removes holes from the region prior to density estimation.
#' 
#' If a hole in a region is specified as a polygon, the function 
#' removeHole removes all nodes in the nodeFillingOutput that 
#' are contained in the hole. This function is called by 
#' nodeFilling, so it is generally not needed by users.
#' 
#' @param hole_poly A numerical matrix of vertices of the hole polygon. 
#' @param nodeFillingOutput An object of type nodeFillingOutput, returned 
#' by nodeFilling or removeHole.
#' @return An object of type nodeFillingOutput, with values:
#' \itemize{
#'   \item EW_locs EW coordinates for the contour plot.
#'   \item NS_locs NS coordinates for the contour plot.
#'   \item nodes Matrix of node locations.
#'   \item poly Matrix of vertices of boundary polygon.
#'   \item node_spacing Vertical and horizontal node spacing.
#'   \item hole_list List of polygons representing holes in region.}
#' @author Ronald P. Barry
#' 
#' @import utils
#' @import graphics
#' @import stats
#' @export
removeHole <-
function(hole_poly, nodeFillingOutput) {

  #
  #  This function finds all nodes contained in hole.poly
  #  and deletes them.  It is up to the user to insure that
  #  this polygon is really contained in the larger polynomial
  #  and that it is non-intersecting.  This function can be
  #  repeated for each hole.
  #
  hole_poly <- as.matrix(hole_poly)
  if(!inherits(nodeFillingOutput,"nodeFillingOutput")){
    stop("Should be the output from the function nodeFilling")}
  nodes <- nodeFillingOutput$nodes
  nodes <- nodes[!inout(pts = nodes, poly = hole_poly),]
  nodeFillingOutput$nodes <- nodes
  return(nodeFillingOutput)
 
 }
