set -e

mkdir -p xcarchives
mkdir -p xcframeworks

rm -rf xcarchives/*.xcarchive
rm -rf xcframeworks/*.xcframework

echo "==> Building for iOS...\n";
xcodebuild archive \
-project IfcPlusPlus.xcodeproj \
-scheme ifcpp \
-destination generic/platform=iOS \
-archivePath "xcarchives/ifcpp-iOS.xcarchive" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

echo "==> Building for iOS simulator...\n";
xcodebuild archive \
-project IfcPlusPlus.xcodeproj \
-scheme ifcpp \
-destination "generic/platform=iOS Simulator" \
-archivePath "xcarchives/ifcpp-iOS_Simulator.xcarchive" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# -destination generic/platform=macOS \

echo "==> Merging archives into an xcframework...\n";
xcodebuild -create-xcframework \
-archive xcarchives/ifcpp-iOS.xcarchive -framework ifcpp.framework \
-archive xcarchives/ifcpp-iOS_Simulator.xcarchive -framework ifcpp.framework \
-output xcframeworks/ifcpp.xcframework
