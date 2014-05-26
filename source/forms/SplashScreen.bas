Version =20
VersionRequired =20
PublishOption =1
    PopUp = NotDefault
    RecordSelectors = NotDefault
    NavigationButtons = NotDefault
    CloseButton = NotDefault
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    ScrollBars =0
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =14683
    DatasheetFontHeight =11
    ItemSuffix =2
    Left =3825
    Top =2415
    Right =10815
    Bottom =8355
    DatasheetGridlinesColor =14806254
        0x5b6414511c5de440
    End
    Caption ="Welcome"
    OnOpen ="[Event Procedure]"
    DatasheetFontName ="Calibri"
        0x6801000068010000680100006801000000000000201c0000e010000001000000 ,
        0x010000006801000000000000a10700000100000001000000
    End
    AllowDatasheetView =0
    AllowPivotTableView =0
    AllowPivotChartView =0
    AllowPivotChartView =0
    FilterOnLoad =0
    ShowPageMargins =0
    DisplayOnSharePointSite =1
    DatasheetAlternateBackColor =15921906
    DatasheetGridlinesColor12 =0
    FitToScreen =1
    DatasheetBackThemeColorIndex =1
    BorderThemeColorIndex =3
    ThemeFontIndex =1
    ForeThemeColorIndex =0
    AlternateBackThemeColorIndex =1
    AlternateBackShade =95.0
            BackStyle =0
            FontSize =11
            FontName ="Calibri"
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =0
            BorderTint =50.0
            ForeThemeColorIndex =0
            ForeTint =50.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
            BackStyle =0
            OldBorderStyle =0
            BorderLineStyle =0
            SizeMode =3
            PictureAlignment =2
            Width =1701
            Height =1701
            BorderColor =16777215
            GridlineColor =16777215
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
            Height =8787
            BackColor =15590879
            Name ="Detail"
            AlternateBackColor =15921906
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
                    OverlapFlags =85
                    Left =10771
                    Top =6746
                    Width =2715
                    Height =510
                    FontSize =20
                    FontWeight =700
                    BorderColor =8355711
                    ForeColor =12349952
                    Name ="Label1"
                    Caption ="By Jason McKee"
                    GridlineColor =10921638
                    LayoutCachedLeft =10771
                    LayoutCachedTop =6746
                    LayoutCachedWidth =13486
                    LayoutCachedHeight =7256
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
                End
                    PictureType =2
                    Left =7530
                    Top =3630
                    Width =4350
                    Height =2250
                    BorderColor =10921638
                    Name ="Image3"
                    Picture ="Logo_transparent"
                    GridlineColor =10921638

                    LayoutCachedLeft =7530
                    LayoutCachedTop =3630
                    LayoutCachedWidth =11880
                    LayoutCachedHeight =5880
                End
            End
        End
    End
End
CodeBehindForm
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database

Private Sub Form_Open(Cancel As Integer)
DoCmd.Maximize
End Sub
