# stDBSCAN.R
# wrapper of space-time DBSCAN
# use threshold distance to judge near and far

# 2016-03-17
# developed by Huanfa Chen
# contact: chenhuanfa@gmail.com

stDBSCAN <- function(distSpace, distTime, numThreDistSpace, numThreDistTime, paraMinPts)
{
        matDistST <- (as.matrix(distSpace) <= numThreDistSpace) & (as.matrix(distTime) <= numThreDistTime)
        # turn into 0 (near) and Inf (far)
        distSTBinary <- ifelse(matDistST, 0, Inf)
		if (!require("fpc")) 
		{
			install.packages("pacman")
			require("fpc")
		}

        dbscanCBI(data = as.dist(distSTBinary), eps = 0.1, MinPts = paraMinPts, diss = TRUE)
        
}