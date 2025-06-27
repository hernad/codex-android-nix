# Android Hello World with Nix

This repository provides a Nix-based development environment for Android projects,
and includes a sample “Hello World” Android application. The app displays a button
which, when clicked, shows “hello Ernad” in a text view.

## Prerequisites

- [Nix](https://nixos.org/) installed on your system
- A nixpkgs-25.05 channel added and updated so that `<nixpkgs-25.05>` is available:

  ```bash
  nix-channel --add https://nixos.org/channels/nixos-25.05 nixpkgs-25.05
  nix-channel --update
  ```

## Enter the development shell

```bash
nix-shell
```

This sets up the Android SDK, Java JDK, and Gradle in your environment.

## Build the app

```bash
gradle build
```

## Run unit tests

```bash
gradle test
```

This runs the Robolectric-based test that verifies clicking the button updates
the text view with “hello Ernad”.

## Run on a device or emulator

1. Start your Android emulator or connect a device.
2. Install the debug build:

   ```bash
   gradle installDebug
   ```

3. Launch the app on the device:

   ```bash
   adb shell am start -n ba.out.bring.helloworld/.MainActivity
   ```

## VSCode integration

This project includes a `.vscode/` folder with:

- **Extension recommendations** for Nix, Java & Gradle support
- **Settings** to auto‑activate the Nix shell and configure Gradle & Java
- **Tasks** to build (`assembleDebug`), test (`test`), install (`installDebug`), and launch the app
- **Launch configurations** to debug the Android app (attach via JDWP) and run unit tests

### Before debugging the Android app

The debug configuration will attach to local port 8700. To forward the JDWP port from a device or emulator:

```bash
adb wait-for-device
adb shell pidof ba.out.bring.helloworld | xargs -I {} adb forward tcp:8700 jdwp:{}
```

You can then select **Debug Android App (attach)** in VSCode to step through your code.

#### Usage

 1. **Open VS Code** (it will prompt to install recommended extensions).
 2. **Open the Command Palette** (⇧⌘P / Ctrl+Shift+P) → “Tasks: Run Task” to build/test/run.
 3. **Run & Debug view** (⇧⌘D / Ctrl+Shift+D) to pick your debug configuration.
