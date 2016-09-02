# Cleanup

Here are the steps to take to clean up your computer after infection with Keydnap through Transmission 2.92.

TLDR; These only works with Keydnap 1.5 and were published on August 30, 2016. Would probably not work with future versions of Keydnap.

Make sure you follow these steps precisely!

## Running Processes

Start by quitting Transmission. 

Then, in Activity Monitor, kill processes with any of the following names:

- `icloudproc`
- `License.rtf`
- `icloudsyncd`
- `/usr/libexec/icloudsyncd -launchd netlogon.bundle`

## Remove Files
Remove the following files and directories:

- /Library/Application Support/com.apple.iCloud.sync.daemon/
- /Library/LaunchAgents/com.apple.iCloud.sync.daemon.plist
- $HOME/Library/Application Support/com.apple.iCloud.sync.daemon/
- $HOME/Library/Application Support/com.geticloud/
- $HOME/Library/LaunchAgents/com.apple.iCloud.sync.daemon.plist
- $HOME/Library/LaunchAgents/com.geticloud.icloud.photo.plist

Remove Transmission from your system and redownload it from a trusted source. The Transmission website and binaries are now hosted on Github. 

You can verify the hash and the signature of the legitimate binary package with the following commands.

### Check the DMG Checksum

```
$ shasum -a 256 Transmission-2.92.dmg 
926a878cac007e591cfcea987048abc0689d77e7729a28255b9ea7b73f22d693  Transmission-2.92.dmg
```

Compare with the values on [https://transmissionbt.com/download/](https://transmissionbt.com/download/)

### Check the app signature
Open the .dmg and drag the Transmission.app to your local folder. From the Terminal run this command from the same directory:

`$ codesign -dv Transmission.app`

And verify if it is signed by `Digital Ignition LLC` with team identifier `5DPYRBHEAR`.

```
$ codesign -dvvv Transmission.app/
[...]
Authority=Developer ID Application: Digital Ignition LLC
Authority=Developer ID Certification Authority
Authority=Apple Root CA
TeamIdentifier=5DPYRBHEAR
[...]
```

If all is good, then you can safely use Transmission!