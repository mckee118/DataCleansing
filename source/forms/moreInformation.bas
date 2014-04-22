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
    BorderStyle =3
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =7143
    DatasheetFontHeight =11
    ItemSuffix =1
    Left =3720
    Top =2685
    Right =10860
    Bottom =6180
    DatasheetGridlinesColor =14806254
        0xb1919b3a0063e440
    End
    Caption ="More Information"
    DatasheetFontName ="Calibri"
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
            Width =1701
            Height =283
            FontSize =11
            FontWeight =400
            FontName ="Calibri"
            ForeThemeColorIndex =0
            ForeTint =75.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
            UseTheme =1
            Shape =1
            Gradient =12
            BackThemeColorIndex =4
            BackTint =60.0
            BorderLineStyle =0
            BorderColor =16777215
            BorderThemeColorIndex =4
            BorderTint =60.0
            ThemeFontIndex =1
            HoverThemeColorIndex =4
            HoverTint =40.0
            PressedThemeColorIndex =4
            PressedShade =75.0
            HoverForeThemeColorIndex =0
            HoverForeTint =75.0
            PressedForeThemeColorIndex =0
            PressedForeTint =75.0
        End
            Height =4025
            BackColor =15590879
            Name ="Detail"
            AlternateBackColor =15921906
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
                    OverlapFlags =85
                    Left =120
                    Top =225
                    Width =6885
                    Height =3060
                    FontSize =16
                    BorderColor =8355711
                    Name ="infoText"
                    Caption ="No extra information at this time."
                    GridlineColor =10921638
                    LayoutCachedLeft =120
                    LayoutCachedTop =225
                    LayoutCachedWidth =7005
                    LayoutCachedHeight =3285
                    ForeTint =100.0
                End
                    OverlapFlags =85
                    Left =5160
                    Top =3375
                    Width =1927
                    Height =511
                    FontSize =16
                    FontWeight =700
                    ForeColor =6373413
                    Name ="Command4"
                    Caption ="Close X"
                    OnClick ="[Event Procedure]"
                    ControlTipText ="Click to continue"
                    GridlineColor =10921638

                    LayoutCachedLeft =5160
                    LayoutCachedTop =3375
                    LayoutCachedWidth =7087
                    LayoutCachedHeight =3886
                    ForeThemeColorIndex =4
                    ForeTint =100.0
                    ForeShade =50.0
                    Gradient =0
                    BackColor =14136213
                    BorderColor =14136213
                    HoverColor =16051931
                    HoverThemeColorIndex =8
                    HoverTint =20.0
                    PressedColor =9592887
                    HoverForeColor =6373413
                    HoverForeThemeColorIndex =4
                    HoverForeTint =100.0
                    HoverForeShade =50.0
                    PressedForeColor =4210752
                    WebImagePaddingLeft =2
                    WebImagePaddingTop =2
                    WebImagePaddingRight =1
                    WebImagePaddingBottom =1
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

Private Sub Command4_Click()
DoCmd.Close
End Sub
