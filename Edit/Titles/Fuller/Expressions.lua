-- Expressions for the Chapter Titles tool

-- This expression is for the HorizontalLine > Controls > Center
-- This sets the center the Horizontal LIne based on the center of the Chapter title.
Point( 0.940 - ( ( Title.Output.DataWindow[ 3 ] - Title.Output.DataWindow[ 1 ] ) / Title.Output.Width / 2 ), 0.115 )

-- This expression is for the HorizontalLine > Controls > Width
-- This sets the width the Horizontal LIne based on the width of the Chapter title.
( Title.Output.DataWindow[ 3 ] - Title.Output.DataWindow[ 1 ] ) / Title.Output.Width

-- This expression is for the VerticalLine > Controls > Center
-- This essentially sets the right edge of the Vertical LIne based on the width of the Episode Info.
Point( Episode.Center.X - ( ( Episode.Output.DataWindow[ 3 ] - Episode.Output.DataWindow[ 1 ] ) / Episode.Output.Width ) - .015, 0.0843028515241 )

-- This expression is for the Series > Layout > Center
-- This essentially sets the right edge of the Series Title based on the width of the Episode Info.
Point( Episode.Center.X - ( ( Episode.Output.DataWindow[ 3 ] - Episode.Output.DataWindow[ 1 ] ) / Episode.Output.Width ) - .023, 0.0754783343756 )

-- This expression is for the HorizontalLine > Controls > Width.
-- This sets the width of the Horizontal Line based on the width of the greater of the Title or the combined text under the line.
iif(time > 9, ( max(BackgroundForTitleWidth:GetValue("Width", 71), (DummyBackgroundForEpisodeData:GetValue("EpisodeRightSideDoD", 71) - DummyBackgroundForSeriesData:GetValue("SeriesLeftSideDoD", 71)) ) / comp:GetPrefs("Comp.FrameFormat.Width") ) * (3 * (min((time - 9) / 12, 1))^2 - 2 * (min((time - 9) / 12, 1))^3), 0)

-- This expression is for the HorizontalLine > Controls > Center.
-- This sets the center of the Horizontal Line based on the width of the greater of the Title or the combined text under the line.
Point ( ( ( DummyBackgroundForEpisodeData:GetValue("EpisodeRightSideDoD", 71) - ( max( BackgroundForTitleWidth:GetValue("Width", 71), DummyBackgroundForEpisodeData:GetValue("EpisodeRightSideDoD", 71) - DummyBackgroundForSeriesData:GetValue("SeriesLeftSideDoD", 71) ) / 2 ) ) / comp:GetPrefs("Comp.FrameFormat.Width") ), 0.115 )


-- Working Scratchpad
img=comp:FindTool("Title").Output:GetValue();w=img and img.DataWindow and (img.DataWindow[3]-img.DataWindow[1]) or 0;maxF=30;startF=18;t=time<startF and 0 or (time-startF)/(maxF-startF);ease=(1-math.cos(math.pi*t))/2;(w*ease)/comp.CurrentFrame.RenderWidth

(Text("Title").StyledText.Value * Text("Title").Size * Text("Title").CharacterSpacing)

time < 36 and 360 * ((1 - math.cos(math.pi * time / 36)) / 2) or 360

Point(0.940 - ((Title.Output.DataWindow[3] - Title.Output.DataWindow[1]) / Title.Output.Width / 2), 0.115)

iif( time < 49,  time/200, ((Title.Output.DataWindow[3]-Title.Output.DataWindow[1])/Title.Output.Width + .002))

Point( iif( time < 19, 1 - ( time * .01 ), ( 0.940 - ( ( Title.Output.DataWindow[3] - Title.Output.DataWindow[1]) / Title.Output.Width / 2 ) ) ), 0.115 )

FollowerAnimateTitle:GetValue("Size", 49)

string.len(FollowerAnimateTitle.StyledText.Value) * Title:GetValue("Size", 49) * 0.3    

iif( time < 49, min( string.len(FollowerAnimateTitle.StyledText.Value) * Title:GetValue("Size", 49) * 0.3 , 0.002 * time * string.len(FollowerAnimateTitle.StyledText.Value) * Title:GetValue("Size", 49) ), string.len(FollowerAnimateTitle.StyledText.Value) * Title:GetValue("Size", 49) * 0.3)

min( string.len(FollowerAnimateTitle.StyledText.Value) * Title:GetValue("Size", 49) * 0.3 , 0.001 * time * string.len(FollowerAnimateTitle.StyledText.Value) * Title:GetValue("Size", 49) )

-- Get node values
episodeRight = DummyBackgroundForEpisodeData:GetValue("EpisodeRightSideDoD", 71)
titleWidth = BackgroundForTitleWidth:GetValue("Width", 71)
seriesLeft = DummyBackgroundForSeriesData:GetValue("SeriesLeftSideDoD", 71)
fullWidth = comp:GetPrefs("Comp.FrameFormat.Width")
xPoint = ( episodeRight - ( max( titleWidth, episodeRight - seriesLeft ) / 2 ) ) / fullWidth
Point ( xPoint, 0.115 )
Point ( iif(time > 9, xPoint, 0), 0.115 )

Point ( ( ( episodeRight - ( max( titleWidth, episodeRight - seriesLeft ) / 2 ) ) / fullWidth ), 0.115 )

Point(iif(time > 9, (DummyBackgroundForEpisodeData:GetValue("EpisodeRightSideDoD", 71) / comp:GetPrefs("Comp.FrameFormat.Width") + (((DummyBackgroundForEpisodeData:GetValue("EpisodeRightSideDoD", 71) - (max(BackgroundForTitleWidth:GetValue("Width", 71), DummyBackgroundForEpisodeData:GetValue("EpisodeRightSideDoD", 71) - DummyBackgroundForSeriesData:GetValue("SeriesLeftSideDoD", 71)) / 2)) / comp:GetPrefs("Comp.FrameFormat.Width")) - DummyBackgroundForEpisodeData:GetValue("EpisodeRightSideDoD", 71) / comp:GetPrefs("Comp.FrameFormat.Width")) * (3 * (min((time - 9) / 12, 1))^2 - 2 * (min((time - 9) / 12, 1))^3)), DummyBackgroundForEpisodeData:GetValue("EpisodeRightSideDoD", 71) / comp:GetPrefs("Comp.FrameFormat.Width")), 0.115)