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
    Width =11168
    DatasheetFontHeight =11
    ItemSuffix =1
    Left =3720
    Top =1320
    Right =15270
    Bottom =8265
    DatasheetGridlinesColor =14806254
        0xb1919b3a0063e440
    End
    Caption ="More Information"
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
            AddColon = NotDefault
            FELineBreak = NotDefault
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            FontSize =11
            FontName ="Calibri"
            AsianLineBreak =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            ThemeFontIndex =1
            ForeThemeColorIndex =0
            ForeTint =75.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
            CanGrow = NotDefault
            Height =4705
            BackColor =15590879
            Name ="Detail"
            AlternateBackColor =15921906
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
                    OverlapFlags =85
                    Left =9135
                    Top =4095
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

                    LayoutCachedLeft =9135
                    LayoutCachedTop =4095
                    LayoutCachedWidth =11062
                    LayoutCachedHeight =4606
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
                    OverlapFlags =85
                    Left =120
                    Top =225
                    Width =10935
                    Height =3750
                    FontSize =16
                    BorderColor =8355711
                    ForeColor =6108695
                    Name ="infoText"
                    Caption ="No information at this time."
                    GridlineColor =10921638
                    LayoutCachedLeft =120
                    LayoutCachedTop =225
                    LayoutCachedWidth =11055
                    LayoutCachedHeight =3975
                    ForeThemeColorIndex =-1
                    ForeTint =100.0
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
Public statusmsg As Variant

Private Sub Command4_Click()

statusmsg = SysCmd(acSysCmdSetStatus, "Idle")

DoCmd.Close
End Sub
