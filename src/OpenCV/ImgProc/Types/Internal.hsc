module OpenCV.ImgProc.Types.Internal where

import "base" Foreign.C.Types
import "lens" Control.Lens ( (^.), from )
import "linear" Linear.V4 ( V4(..) )
import "lumi-hackage-extended" Lumi.Prelude hiding ( shift )
import "this" OpenCV.Core.Types ( Scalar, isoScalarV4 )
import "this" OpenCV.ImgProc.Types


--------------------------------------------------------------------------------

#include <bindings.dsl.h>
#include "opencv2/core.hpp"
#include "opencv2/imgproc.hpp"

#include "namespace.hpp"
#include "macros.hpp"

#num INTER_NEAREST
#num INTER_LINEAR
#num INTER_CUBIC
#num INTER_AREA
#num INTER_LANCZOS4

marshalInterpolationMethod :: InterpolationMethod -> CInt
marshalInterpolationMethod = \case
   InterNearest  -> c'INTER_NEAREST
   InterLinear   -> c'INTER_LINEAR
   InterCubic    -> c'INTER_CUBIC
   InterArea     -> c'INTER_AREA
   InterLanczos4 -> c'INTER_LANCZOS4

#num BORDER_CONSTANT
#num BORDER_REPLICATE
#num BORDER_REFLECT
#num BORDER_WRAP
#num BORDER_REFLECT_101
#num BORDER_TRANSPARENT
#num BORDER_ISOLATED

marshalBorderMode :: BorderMode -> (CInt, Scalar)
marshalBorderMode = \case
    BorderConstant scalar -> (c'BORDER_CONSTANT    , scalar    )
    BorderReplicate       -> (c'BORDER_REPLICATE   , zeroScalar)
    BorderReflect         -> (c'BORDER_REFLECT     , zeroScalar)
    BorderWrap            -> (c'BORDER_WRAP        , zeroScalar)
    BorderReflect101      -> (c'BORDER_REFLECT_101 , zeroScalar)
    BorderTransparent     -> (c'BORDER_TRANSPARENT , zeroScalar)
    BorderIsolated        -> (c'BORDER_ISOLATED    , zeroScalar)
  where
    zeroScalar :: Scalar
    zeroScalar = (V4 0 0 0 0 :: V4 Double) ^. from isoScalarV4
