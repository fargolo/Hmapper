module Distances (edt) where
import Numeric.LinearAlgebra.Data (Vector)
import Numeric.LinearAlgebra (norm_2)


--Euclidian distance between vectors
edt :: Vector Double -> Vector Double -> Double
edt x y = norm_2 (x - y)
