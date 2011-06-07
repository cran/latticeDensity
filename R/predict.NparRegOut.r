predict.NparRegOut <-
function(object,...){
#
  Zk <- as.vector(object$NparRegDenom)
  Pk <- as.vector(object$NparRegNum)
  which.nodes <- as.vector(object$which.nodes)
  return(predictions=(Zk/Pk)[which.nodes])
  }
  