We are exploring how to build AOSP on the phone first, so checkout the Intel's Android source tree.

```
repo init -u https://android-review.01.org/platform/manifest -b android-4.1.2_r1-ia0
repo sync -j8
```

Now overlay this device tree onto the repository. Do a source of the build files, do lunch and select the following for now:

```
full_smi-userdebug
```

After that, now issue the following command (I am using 10 jobs on my PC).

```
time make -j10 ota-dev
```

An error near the end will appear since we did not build boot.img and other stuff, but you can now base the *.zip that was created as a starting point.
