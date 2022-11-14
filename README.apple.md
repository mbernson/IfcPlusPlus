# IfcPlusPlus for Apple platforms

Using the Xcode project `IfcPlusPlus.xcodeproj` you can make builds of IfcPlusPlus as a dynamic library for all Apple platforms.

```
xcodebuild archive \
-project IfcPlusPlus.xcodeproj \
-scheme ifcpp \
-destination generic/platform=iOS \
-archivePath "xcarchives/ifcpp-iOS.xcarchive" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES
```
