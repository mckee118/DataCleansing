Option Compare Database

       Option Explicit

       Dim gSplashStart     ' The time when the splash screen opened.
       Dim gSplashInterval  ' The minimum time to leave the splash screen
                            ' up.
       Dim gSplashForm      ' The name of the splash screen form.
       
       Function SplashStart(ByVal SplashForm As String, ByVal SplashInterval As Integer)
           ' Open the splash form.
           DoCmd.OpenForm SplashForm  ' In Microsoft Access 97 and 7.0.
           'DoCmd OpenForm SplashForm ' In versions 1.x and 2.0 only.

           ' Set the starting time.
           gSplashStart = Timer

           ' Record the global information.
           gSplashInterval = SplashInterval
           gSplashForm = SplashForm
       End Function

       Function SplashEnd()
          Dim RetVal

          ' Loop until the splash screen has been active for
          ' the desired interval.
          Do Until Timer - gSplashStart > gSplashInterval
             ' Yield control so other applications can process.
             RetVal = DoEvents()
          Loop

          ' Close the splash screen.
          DoCmd.Close acForm, gSplashForm

       End Function