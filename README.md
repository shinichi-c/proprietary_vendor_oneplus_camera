# crDroid - OnePlus Camera and Gallery for OP 6-series
_Because sometimes you forgot to bring a real camera and actually need Pro mode_

## For users - How to enable OnePlus Camera & Gallery after installing crDroid:
_They said it came with OPCam but there's no icon, what gives?_

You're going to need to do this from a computer via USB, because the "File Transfer" connection mode is actually more privileged than the built-in "Files" app thanks to Android's Scoped Storage restrictions:
- Download the `OnePlusCamera-platformcert.zip`, `OnePlusGallery-platformcert.zip`, and `OPGalleryExpansion.zip` files from within the `postinstall` directory here.
- Unzip all three files on the computer, connect USB cable, enable File Transfer, then copy the extracted `OnePlusCamera-platformcert.apk` & `OnePlusCamera-platformcert.apk` files into Internal Storage \> Downloads (ignore the extracted `Internal Storage` for now).
- On the phone, use the Files app to navigate to the `Download` folder, and then try to install the `OnePlusCamera-platformcert.apk` file.
  - If you have Google Apps installed, it will throw up a big scary warning that Play Protect blocked this potentially harmful app installation! O noes! Either compile it from source (there is no source) or find the small "install anyway" option buried somewhere on that warning pop-up, and then agree to updating the app.
- DO NOT OPEN IT YET; just choose "Done". It won't break anything, but it won't work right yet because it requires OPGallery.
- On the phone, use the Files app to navigate to the `Download` folder, and then try to install the `OnePlusGallery-platformcert.apk` file.
  - Decide again that this random stranger on the internet (arguably three raccoons in a trenchcoat) knows better than all of Google's security engineers, and install anyway.
- Go ahead and choose "Open" instead of "Done" for OPGallery, agree to permissions, and then at the top tab section, swipe over to "Explore".
- It will ask you if you want to download the expansion file, which doesn't work. BUT... it creates a directory for you on the phone. Go to home screen & clear OnePlus Gallery app from recents to close the app.
- On the computer, navigate to the phone's "Internal Storage \> Android \> obb \> com.oneplus.gallery" folder in one window, and the same folder from the extracted `OPGallery.zip` archive in another window.
- Copy the `main.40010295.com.oneplus.gallery.obb` file from the computer to the `com.oneplus.gallery` folder on the phone. Running OnePlus Gallery should no longer bug you to download the expansion file.
- Now you can open the OnePlus Camera app, grant permissions, and enjoy!

*Please note: Slow-motion seems to crash the OnePlus Camera app the first time you select it. Just open the camera app again and switch to Slow-Motion mode again, and it should work.*
Maybe don't leave it on that mode when you're done, to avoid camera crashes later.

*Please note: OnePlus Gallery likes to periodically spin up the image classification process in the background after device has been idle for some time, even if not plugged in.*
At least I think that's what it's doing. Whatever it is, it eats a LOT of battery, so you may want to get app info & set background battery usage to "Restricted" instead of the default "Optimized", or just remove the expansion .obb file altogether, if you're experiencing this drain.

## For ~~build bots~~ developers - Using this repository for compiling:
_Yeah it's not an all-in-one magic self-contained solution like PJGowtham's work back in the day, sorry._

You're gonna need several changes to device/oneplus/sdm845-common, hardware/oneplus, and vendor/oneplus/sdm845-common to make things work well:
- Device: Start with the `sdm845-common: camera: Add halide/hexagon blobs` commit and pick through `sdm845-common: overlay: Move aux camera allowlist back to props` from https://github.com/Terminator-J/crdroid_device_oneplus_sdm845-common/commits/15.0-cam1/
- Hardware: Pick `interfaces: Build camera HALs from source [2/3]` & `oneplus-fwk: Sync OpFeatures with OxygenOS 11.1.2.2` from https://github.com/Terminator-J/crdroid_hardware_oneplus/commits/15.0-cam1/
- Vendor: Pick ` sdm845-common: camera: Add halide/hexagon blobs` & ` sdm845-common: camera: Build camera HALs from source [3/3]` from https://gitlab.com/Terminator-J/crdroid_vendor_oneplus_sdm845-common/-/commits/15.0-cam1?ref_type=heads

Then `git clone` this repo/branch to `vendor/oneplus/camera` to include it inline.

This will... create stub apks with your ROM's platform key cert.
That doesn't help you update to full versions later, and the included "-platformcert" APK zips are all signed with the crDroid platform cert (which won't do you any good).

You'll want to extract the full APKs (included, as noted above, in zips within the `postinstall/` dir here), and either use Google's apksigner tool in your build tools if you have the cert file, or compile with those APKs copied into the correct dirs in `proprietary/` to have the build system do it for you.
You should end up with OnePlusCamera.apk and OnePlusGallery.apk signed with your ROM's platform key cert either way, which can be used to upgrade the stub apks after first boot, and save ~150MB space in your system partition.
