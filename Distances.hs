module Distances (edt) where
import Numeric.LinearAlgebra.Data (Vector)

--Euclidian distance between vectors
edt :: Vector Double -> Vector Double -> Double
edt a b = let squareResiduals x l = (x-l)**2 
              in sqrt $ sum map squareResiduals a b 
