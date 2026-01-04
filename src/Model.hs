----------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
----------------------------------------------------------------------
{-# OPTIONS_GHC -fno-warn-orphans #-}
----------------------------------------------------------------------
module Model where
----------------------------------------------------------------------
import Data.Map as Map (fromList, Map)
----------------------------------------------------------------------
import Miso.Lens (Lens, lens)
import Miso.Lens.TH (makeLenses)
import Miso.Media (Media(..))
import Miso.String (MisoString)
-------------------------------------------------------------------------------
newtype ClipId = ClipId { _clipId :: MisoString }
  deriving (Eq, Ord)
----------------------------------------------------------------------
makeLenses ''ClipId
----------------------------------------------------------------------
mkClipId :: MisoString -> ClipId
mkClipId = ClipId
----------------------------------------------------------------------
data Clip = Clip 
  { _clipWidth   :: Int
  , _clipHeight  :: Int
  } deriving (Eq)
----------------------------------------------------------------------
makeLenses ''Clip
----------------------------------------------------------------------
mkClip :: Clip
mkClip = Clip 0 0
----------------------------------------------------------------------
data Model = Model
  { _modelPlaying   :: Maybe ClipId
  , _modelSmall     :: Bool
  , _modelPlaylist  :: Map ClipId Clip
  } deriving (Eq)
----------------------------------------------------------------------
makeLenses ''Model
----------------------------------------------------------------------
mkModel :: [MisoString] -> Model
mkModel filenames = Model Nothing False clips
  where
    clips = Map.fromList [ (mkClipId f, mkClip) | f <- filenames ]
----------------------------------------------------------------------
