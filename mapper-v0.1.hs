-- Mapper implementation in Haskell
-- To do:
-- (X) 1 . Distances 
-- ( ) 2 . Covering
-- ( ) 3 . Clustering
-- ( ) 4 . Link Clusters

import Control.Monad (replicateM)
import Numeric.LinearAlgebra.Data (Matrix,toRows,(><),Vector,toList)
import Distances (edt)
import Utils (pairs)

mydata = (4><3)[1..] -- 4 rows/observations, 3 collumns/dimensions. values = 1...

-- 1. Calculates distance matrix
-- Outputs list of Doubles
map (\(x,y) -> edt x y) $ pairs $ toRows mydata

-- 2. Creates covering over datset according to filter function
pca :: Int -> [Vector Double] -> PCA -- PCA function which returns 1st component as vector
cover :: Double -> -- overlap
         Int -> -- bins
         [Double Vector] -> [Double] -> -- filter
         Matrix -> -- Data
         [Matrix] -- Subsets
cover overlap bins pca data = subset Matrix -- TO DO:fazer subsets Matrix -> [Matrix] 
                                     where subset = sample bins overlap 
                                           Matrix/bins

-- 3. Execute clustering on each cover
-- 4. Each cluster is a node
-- 5. Clusters(nodes) with overlapping observations are connected

-- http://hackage.haskell.org/package/Learning-0.1.0/docs/Learning.html#t:PCA
-- 1o argumento eh numero de componentes. Observacoes Vector Double.
-- Exemplo: pca 1 observacoes
-- Constructor _u eh Matrix Double com compression matrix

--http://hackage.haskell.org/package/DistanceTransform-0.1.2/docs/DistanceTransform-Euclidean.html
-- Euclidian distance
-- [columns,rows]. 
singleLinkage :: (Ord a, Eq a) => DistanceFunction a -> ClusterFunction a

Node :: (Int,[Int])
Vertex :: (Node,Node)


-- type 'a' will be a Vector Double
dendrogram :: Linkage -> [a] -> (a->a->Distance) -> Dendrogram a

cluster :: [Matrix] -> [Dendrogram]
cluster data = map dendrogram parts
	    where parts = cover 0.3 15 data

nodes :: [Dendrogram] -> -- Lista de clusters hierarquicos
         [[Dendrogram]]-> -- Lista cortada com cutAt gera lista de lista de clusters. 
         [[Node]] -- Transforma lista de lista de Clusters em lista de lista de nodos
nodes clusters = map flatten $ map cutAt 0.66 clusters
                                   where clusters = cluster data
-- TO DO: Enumerar nodos
-- Comparacao pairwise de branches/nodos de parts diferentes 
-- contendo observacoes identicas sao conectados
