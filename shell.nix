{ pkgs ? import <nixpkgs-25.05> { 
    config = { 
      android_sdk.accept_license = true; 
      allowUnfree = true; 
    }; 
  } 
}:

with pkgs;

let
  # Use composeAndroidPackages with the correct arguments for nixpkgs-25.05
  androidComposition = androidenv.composeAndroidPackages {
    platformVersions = [ "31" ];
    buildToolsVersions = [ "31.0.0" ];
    cmdLineToolsVersion = "latest";
  };

  # The actual SDK is available under the 'androidsdk' attribute of the composition.
  androidSdk = androidComposition.androidsdk;

in
mkShell {
  buildInputs = [
    jdk11
    gradle
    androidSdk
  ];

  # Set the necessary environment variables for Android tools and Gradle.
  shellHook = ''
    export ANDROID_SDK_ROOT="${androidSdk}/libexec/android-sdk"
    export ANDROID_HOME="$ANDROID_SDK_ROOT"
    export GRADLE_OPTS="-Dorg.gradle.project.android.aapt2FromMavenOverride=$ANDROID_SDK_ROOT/build-tools/31.0.0/aapt2"
  '';
}
