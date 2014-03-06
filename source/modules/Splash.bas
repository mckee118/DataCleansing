Option Compare Database

       '******************************************************************
       ' MODULE NAME: Splash
       ' DECLARATION SECTION
       '******************************************************************
       Option Explicit

       Dim gSplashStart     ' The time when the splash screen opened.
       Dim gSplashInterval  ' The minimum time to leave the splash screen
                            ' up.
       Dim gSplashForm      ' The name of the splash screen form.

       '******************************************************************
       ' FUNCTION: SplashStart()
       '
       ' PURPOSE: Used to invoke the splash screen form specified by the
       '    SplashForm argument.
       '
       ' ARGUMENTS:
       '    SplashForm     - The name of the form to use as the splash
       '                     screen.
       '    SplashInterval - The minimum time, in seconds, that the splash
       '                     screen must remain active on the screen.
       '
       '******************************************************************
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

       '******************************************************************
       ' FUNCTION: SplashEnd()
       '
       ' PURPOSE: Used to close the splash screen form opened by the
       '    SplashStart() function. This function checks to ensure that
       '    the splash screen remains active until the user-specified
       '    interval has expired.
       '
       '******************************************************************
       Function SplashEnd()
          Dim RetVal

          ' Loop until the splash screen has been active for
          ' the desired interval.
          Do Until Timer - gSplashStart > gSplashInterval
             ' Yield control so other applications can process.
             RetVal = DoEvents()
          Loop

          ' Close the splash screen.
          DoCmd.Close acForm, gSplashForm ' In Microsoft Access 97 and 7.0.
         'DoCmd Close A_FORM, gSplashForm ' In version 1.x and 2.0 only.

       End Function