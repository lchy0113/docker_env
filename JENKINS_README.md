jenkins setting 
=====
# General 
## Restrict where this project can be run

# Source Code management
## Gerrit Repo
> 	Manifest Repository Url
```
ssh://192.168.27.12/androidce/android/platform/manifest.git
```

# Artifactory Configuration
## Upload Details
> Artifactory upload server	
```
http://192.168.27.12:8082:Artifactory
```
> Upload spec source 
```
{
    "files": [
        {
            "pattern": "NHN-1033/bootable/bootloader/lk/build-tcc898x_android_stb/lk.rom",
            "target": "jenkins/${JOB_NAME}/${BUILD_TIMESTAMP}-${BUILD_NUMBER}/lk.rom",
            "recursive": "false"
        },
        {
            "pattern": "NHN-1033/out/target/product/tcc898x/build_fingerprint.txt",
            "target": "jenkins/${JOB_NAME}/${BUILD_TIMESTAMP}-${BUILD_NUMBER}/build_fingerprint.txt",
            "recursive": "false"
        },
        {
            "pattern": "NHN-1033/out/target/product/tcc898x/installed-files.txt",
            "target": "jenkins/${JOB_NAME}/${BUILD_TIMESTAMP}-${BUILD_NUMBER}/installed-files.txt",
            "recursive": "false"
        },
        {
            "pattern": "NHN-1033/out/target/product/tcc898x/installed-files-vendor.txt",
            "target": "jenkins/${JOB_NAME}/${BUILD_TIMESTAMP}-${BUILD_NUMBER}/installed-files-vendor.txt",
            "recursive": "false"
        },
        {
            "pattern": "NHN-1033/out/target/product/tcc898x/boot.img",
            "target": "jenkins/${JOB_NAME}/${BUILD_TIMESTAMP}-${BUILD_NUMBER}/boot.img",
            "recursive": "false"
        },
        {
            "pattern": "NHN-1033/out/target/product/tcc898x/system.img",
            "target": "jenkins/${JOB_NAME}/${BUILD_TIMESTAMP}-${BUILD_NUMBER}/system.img",
            "recursive": "false"
        },
        {
            "pattern": "NHN-1033/out/target/product/tcc898x/cache.img",
            "target": "jenkins/${JOB_NAME}/${BUILD_TIMESTAMP}-${BUILD_NUMBER}/cache.img",
            "recursive": "false"
        },
        {
            "pattern": "NHN-1033/out/target/product/tcc898x/recovery.img",
            "target": "jenkins/${JOB_NAME}/${BUILD_TIMESTAMP}-${BUILD_NUMBER}/recovery.img",
            "recursive": "false"
        },
        {
            "pattern": "NHN-1033/out/target/product/tcc898x/tcc8985-android-nhn1033.dtb",
            "target": "jenkins/${JOB_NAME}/${BUILD_TIMESTAMP}-${BUILD_NUMBER}/tcc8985-android-nhn1033.dtb",
            "recursive": "false"
        },
        {
            "pattern": "NHN-1033/out/target/product/tcc898x/vendor.img",
            "target": "jenkins/${JOB_NAME}/${BUILD_TIMESTAMP}-${BUILD_NUMBER}/vendor.img",
            "recursive": "false"
        },
        {
            "pattern": "NHN-1033/out/target/product/tcc898x/sest.img",
            "target": "jenkins/${JOB_NAME}/${BUILD_TIMESTAMP}-${BUILD_NUMBER}/sest.img",
            "recursive": "false"
        },
        {
            "pattern": "NHN-1033/out/target/product/tcc898x/userdata.img",
            "target": "jenkins/${JOB_NAME}/${BUILD_TIMESTAMP}-${BUILD_NUMBER}/userdata.img",
            "recursive": "false"
        }
    ]
}


```

# Build
## Execute shell
> Command
```
#!/bin/bash

. ${HOME}/tools/env-nhn1033.env

cd ${WORK_PATH}/${NHN1033_REPO}

cp ${BUILD_SCRIPT_PATH}/make-bootloader.sh ${NHN1033_PATH}/${BOOTLOADER_PATH}
cp ${BUILD_SCRIPT_PATH}/make-kernel.sh ${NHN1033_PATH}/${KERNEL_PATH}
cp ${BUILD_SCRIPT_PATH}/richgold.sh ${NHN1033_PATH}

echo "-----"
echo "build script copy done !"
echo "-----"
#!/bin/bash
. ${NHN1033_PATH}/build/envsetup.sh
lunch full_tcc898x-eng

cd ${BOOTLOADER_PATH}
./make-bootloader.sh

cd ${KERNEL_PATH}
./make-kernel.sh

croot
./richgold.sh


```
