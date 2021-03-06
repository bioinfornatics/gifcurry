{-
  Gifcurry
  (C) 2018 David Lettier
  lettier.com
-}

{-# LANGUAGE
    DuplicateRecordFields
#-}

module GuiRecords where

import Data.IORef
import Data.Int
import qualified GI.Gtk
import qualified Graphics.Rendering.Pango.Font as GRPF
import GI.Gst

data GuiComponents =
  GuiComponents
    { window                            :: GI.Gtk.Window
    , startTimeSpinButton               :: GI.Gtk.SpinButton
    , durationTimeSpinButton            :: GI.Gtk.SpinButton
    , widthSpinButton                   :: GI.Gtk.SpinButton
    , fpsSpinButton                     :: GI.Gtk.SpinButton
    , colorCountSpinButton              :: GI.Gtk.SpinButton
    , leftCropSpinButton                :: GI.Gtk.SpinButton
    , rightCropSpinButton               :: GI.Gtk.SpinButton
    , topCropSpinButton                 :: GI.Gtk.SpinButton
    , bottomCropSpinButton              :: GI.Gtk.SpinButton
    , inFileChooserButton               :: GI.Gtk.Button
    , inFileChooserDialogCancelButton   :: GI.Gtk.Button
    , inFileChooserDialogOpenButton     :: GI.Gtk.Button
    , outFileChooserButton              :: GI.Gtk.FileChooserButton
    , textOverlaysAddButton             :: GI.Gtk.Button
    , saveButton                        :: GI.Gtk.Button
    , openButton                        :: GI.Gtk.Button
    , confirmMessageDialogYesButton     :: GI.Gtk.Button
    , confirmMessageDialogNoButton      :: GI.Gtk.Button
    , aboutButton                       :: GI.Gtk.Button
    , aboutDialogCloseButton            :: GI.Gtk.Button
    , giphyUploadButton                 :: GI.Gtk.Button
    , imgurUploadButton                 :: GI.Gtk.Button
    , saveAsVideoRadioButton            :: GI.Gtk.RadioButton
    , fileSizeToggleButton              :: GI.Gtk.ToggleButton
    , cropToggleButton                  :: GI.Gtk.ToggleButton
    , textOverlaysToggleButton          :: GI.Gtk.ToggleButton
    , saveOpenToggleButton              :: GI.Gtk.ToggleButton
    , uploadToggleButton                :: GI.Gtk.ToggleButton
    , videoPreviewPauseToggleButton     :: GI.Gtk.ToggleButton
    , inFileChooserDialogLabel          :: GI.Gtk.Label
    , inFileChooserButtonLabel          :: GI.Gtk.Label
    , startTimeAdjustment               :: GI.Gtk.Adjustment
    , durationTimeAdjustment            :: GI.Gtk.Adjustment
    , widthAdjustment                   :: GI.Gtk.Adjustment
    , fpsAdjustment                     :: GI.Gtk.Adjustment
    , colorCountAdjustment              :: GI.Gtk.Adjustment
    , outFileNameEntry                  :: GI.Gtk.Entry
    , aboutDialogLabel                  :: GI.Gtk.Label
    , statusLabel                       :: GI.Gtk.Label
    , sidebarControlsPreviewbox         :: GI.Gtk.Box
    , mainPreviewBox                    :: GI.Gtk.Box
    , imagesPreviewBox                  :: GI.Gtk.Box
    , videoPreviewBox                   :: GI.Gtk.Box
    , videoPreviewOverlayChildBox       :: GI.Gtk.Box
    , cropSpinButtonsBox                :: GI.Gtk.Box
    , textOverlaysMainBox               :: GI.Gtk.Box
    , textOverlaysBox                   :: GI.Gtk.Box
    , saveOpenBox                       :: GI.Gtk.Box
    , uploadBox                         :: GI.Gtk.Box
    , fileSizeSpinButtonsGrid           :: GI.Gtk.Grid
    , videoPreviewDrawingArea           :: GI.Gtk.DrawingArea
    , timeSlicesDrawingArea             :: GI.Gtk.DrawingArea
    , firstFramePreviewImageDrawingArea :: GI.Gtk.DrawingArea
    , lastFramePreviewImageDrawingArea  :: GI.Gtk.DrawingArea
    , inFileChooserButtonImage          :: GI.Gtk.Image
    , firstFrameImage                   :: GI.Gtk.Image
    , lastFrameImage                    :: GI.Gtk.Image
    , inFileChooserDialog               :: GI.Gtk.Dialog
    , confirmMessageDialog              :: GI.Gtk.MessageDialog
    , aboutDialog                       :: GI.Gtk.Dialog
    , saveSpinner                       :: GI.Gtk.Spinner
    , inFileChooserWidget               :: GI.Gtk.FileChooserWidget
    , maybeVideoPreviewWidget           :: Maybe GI.Gtk.Widget
    , maybePlaybinElement               :: Maybe GI.Gst.Element
    , temporaryDirectory                :: FilePath
    , textOverlaysRef                   :: IORef [GuiTextOverlayComponents]
    , guiInFilePropertiesRef            :: IORef GuiInFileProperties
    , guiPreviewStateRef                :: IORef GuiPreviewState
    }

data GuiPreviewState =
  GuiPreviewState
    { maybeInFilePath   :: Maybe String
    , maybeStartTime    :: Maybe Double
    , maybeDurationTime :: Maybe Double
    , maybeColorCount   :: Maybe Double
    , loopRunning       :: Bool
    }

data GuiInFileProperties =
  GuiInFileProperties
    { inFileUri      :: String
    , inFileDuration :: Double
    , inFileWidth    :: Double
    , inFileHeight   :: Double
    }

data GuiTextOverlayComponents =
  GuiTextOverlayComponents
    { textOverlayId                      :: Int
    , textOverlayBox                     :: GI.Gtk.Box
    , textOverlayVisibilityBox           :: GI.Gtk.Box
    , textOverlayVisibilityToggleButton  :: GI.Gtk.ToggleButton
    , textOverlayLeftSpinButton          :: GI.Gtk.SpinButton
    , textOverlayTopSpinButton           :: GI.Gtk.SpinButton
    , textOverlayStartTimeSpinButton     :: GI.Gtk.SpinButton
    , textOverlayDurationTimeSpinButton  :: GI.Gtk.SpinButton
    , textOverlayRotationSpinButton      :: GI.Gtk.SpinButton
    , textOverlayOutlineSizeSpinButton   :: GI.Gtk.SpinButton
    , textOverlayOutlineColorButton      :: GI.Gtk.ColorButton
    , textOverlayFillColorButton         :: GI.Gtk.ColorButton
    , textOverlayTextEntry               :: GI.Gtk.Entry
    , textOverlayFontButton              :: GI.Gtk.FontButton
    , textOverlayRemoveButton            :: GI.Gtk.Button
    }

data GuiTextOverlayData =
  GuiTextOverlayData
    { textOverlayText          :: String
    , textOverlayLeft          :: Double
    , textOverlayTop           :: Double
    , textOverlayStartTime     :: Double
    , textOverlayDurationTime  :: Double
    , textOverlayEndTime       :: Double
    , textOverlayRotation      :: Int32
    , textOverlayOutlineSize   :: Int32
    , textOverlayOutlineColor  :: String
    , textOverlayFillColor     :: String
    , textOverlayMaybeFontDesc :: Maybe GRPF.FontDescription
    }

data GuiPreviewFunctionArgs =
  GuiPreviewFunctionArgs
    { guiComponents       :: GuiComponents
    , inFilePath          :: String
    , startTime           :: Double
    , durationTime        :: Double
    , colorCount          :: Double
    , inFileWidth         :: Double
    , inFileHeight        :: Double
    , inFilePathChanged   :: Bool
    , startTimeChanged    :: Bool
    , durationTimeChanged :: Bool
    , colorCountChanged   :: Bool
    }

data GuiMakeFramePreviewFunctionArgs =
  GuiMakeFramePreviewFunctionArgs
    { inFilePath         :: String
    , startTime          :: Double
    , durationTime       :: Double
    , colorCount         :: Double
    , previewWidth       :: Double
    , firstFrameImage    :: GI.Gtk.Image
    , lastFrameImage     :: GI.Gtk.Image
    , temporaryDirectory :: String
    , window             :: GI.Gtk.Window
    }

data GuiSetOrResetFramePrevewFunctionArgs =
  GuiSetOrResetFramePrevewFunctionArgs
    { inputValid   :: Bool
    , inFilePath   :: String
    , outFilePath  :: String
    , time         :: Double
    , colorCount   :: Double
    , previewWidth :: Double
    , image        :: GI.Gtk.Image
    , window       :: GI.Gtk.Window
    }

defaultGuiPreviewState :: GuiPreviewState
defaultGuiPreviewState =
  GuiPreviewState
    { maybeInFilePath   = Nothing
    , maybeStartTime    = Nothing
    , maybeDurationTime = Nothing
    , maybeColorCount   = Nothing
    , loopRunning       = False
    }

defaultGuiInFileProperties :: GuiInFileProperties
defaultGuiInFileProperties =
  GuiInFileProperties
    { inFileUri      = ""
    , inFileDuration = 0.0
    , inFileWidth    = 0.0
    , inFileHeight   = 0.0
    }
