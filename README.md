# SFVC-Spotify-Login
Example code for using SFSafariViewController as a login handler for Spotify SDK

![](http://zippy.gfycat.com/DeadlyCommonGeese.gif)

---
## Getting started

Assuming you already have a Spotify iOS SDK App created, fill in your `ClientID` and `RedirectURL`.

    class ViewController: UIViewController {
    
      let ClientID = ""
      let RedirectURL = NSURL(string: "")
      ...

Also don't forget to add your redirect url (less the `://callback` portion) to the Info -> URL Types tab in Xcode:

![](http://i.imgur.com/xYHYbo8.png)

If you do not have a developer account or application set up yet you can go [here](https://developer.spotify.com/my-applications/#!/applications) and get started. Here is some relevant information from the Spotify tutorial:

> As an example, if your app is named “My Awesome App”, your URI might be something like `my-awesome-app-login://callback` or `awesomeprotocol123://returnafterlogin`.

This project already has the build environment created but if you are creating your own project [here are the steps from the Spotify tutorial to get set your environment up.](https://developer.spotify.com/technologies/spotify-ios-sdk/tutorial/#setting-up-your-build-environment)

That is it! Run it and see it in action!
