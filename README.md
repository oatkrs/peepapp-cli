# 🌟 **PeepApp Standalone** 🌟
Welcome to the **PeepApp CLI** client – your ultimate tool for local APK static analysis! 🚀 Whether you're a seasoned security pro or just diving into app analysis, PeepApp Standalone has you covered. 🎯

## 🎉 **Summary** 🎉

- [✨ **Manual Usage** ✨](#manual-usage)
  - [🔧 **Installation**](#installation)
  - [🕵️‍♂️ **Analyze an APK File**](#analyze-an-apk-file)
  - [🌐 **Download an APK from a PeepApp Instance**](#download-an-apk-from-a-peepapp-instance)
- [📝 **Workflow Diagram**](#workflow-diagram)
- [🔄 **Continuous Integration**](#continuous-integration)
  - [🛠️ **GitLab CI/CD**](#gitlab-cicd)
  - [💻 **GitHub Actions**](#github-actions)

## 🛠️ **Manual Usage** 🛠️

### 🔧 **Installation**

First, let's get you set up! Clone the repository and install the necessary tools:

```bash
git clone https://github.com/oatkrs/peepapp-cli.git
cd peepapp-cli
```

Install `dexdump`:

```bash
sudo apt-get install dexdump
```

Create a Python `virtualenv`:

```bash
sudo apt-get install virtualenv
virtualenv venv -p python3
source venv/bin/activate
```

Download and install dependencies:

```bash
pip install -r requirements.txt
```

### 🕵️‍♂️ **Analyze an APK File** 🕵️‍♂️

Time to analyze! Use the `peepapp_analyze.py` script to dive deep into your APK:

#### 📜 **Usage**

```bash
$ ./peepapp_analyze.py --help
usage: peepapp_analyze.py [-h] [-t] [-j] [-o OUTPUT_FILE] [-i IGNORE] [-e CODE] apk

positional arguments:
  apk                   the apk file to analyze

optional arguments:
  -h, --help            show this help message and exit
  -t, --text            print textual report (default)
  -j, --json            print JSON report
  -o OUTPUT_FILE, --output OUTPUT_FILE
                        store JSON report in file (requires -j option)
  -i IGNORE, --ignore IGNORE
                        comma-separated IDs of trackers to ignore
  -e CODE, --exit-code CODE
                        use the CODE instead of trackers counter as exit code if trackers were detected
```

#### 📝 **Text Output**

Analyze an APK and get a simple text report:

```bash
./peepapp_analyze.py randomgame.apk
```

Don't forget to activate the Python `virtualenv` before running `peepapp_analyze.py`.

**Example:**

```bash
=== Information
- APK path: randomgame.apk
- APK sum: d05f855f7d13bf51d73a7eb6fe5fe42b432e81ad60f732222d1e0e6f0b745e7f
- App version: 2.35.2
- App version code: 1344
- App UID: 15CB4411EB319E2EDD610D48871908C82309053D
- App name: Hempire
- App package: ca.lbcstudios.hempire
- App permissions: 13
    - com.singular.preinstall.READ_PERMISSION_SINGULAR
    - android.permission.POST_NOTIFICATIONS
    - android.permission.WAKE_LOCK
    - com.google.android.c2dm.permission.RECEIVE
    - android.permission.FOREGROUND_SERVICE
    - com.android.vending.CHECK_LICENSE
    - ca.lbcstudios.hempire.permission.C2D_MESSAGE
    - com.android.vending.BILLING
    - android.permission.ACCESS_NETWORK_STATE
    - android.permission.INTERNET
    - com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE
    - com.google.android.gms.permission.AD_ID
    - ca.lbcstudios.hempire.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION
- App libraries:
- Certificates: 1
    - Issuer: Organization: LBC Studios Inc 
Subject: Organization: LBC Studios Inc 
Fingerprint: 37910ee62e6373599c3dbc3c1a63818c3e6e07a9 
Serial: 1583023575
=== Found trackers: 14
 - Google CrashLytics
 - Google Firebase Analytics
 - HelpShift
 - Facebook Ads
 - Facebook Analytics
 - Facebook Login
 - Facebook Share
 - Unity3d Ads
 - ironSource
 - Tapjoy
 - GameAnalytics
 - Singular
 - Google AdMob
 - IAB Open Measurement
```

#### 📊 **JSON Output**

Need structured data? Generate a JSON report with ease:

```bash
./peepapp_analyze.py -j -o report.json randomgame.apk
```

Be sure to activate the Python `virtualenv` before running `peepapp_analyze.py`.

**Example:**

```json
{
  "application": {
    "handle": "ca.lbcstudios.hempire",
    "version_name": "2.35.2",
    "version_code": "1344",
    "uaid": "15CB4411EB319E2EDD610D48871908C82309053D",
    "name": "Hempire",
    "permissions": [
      "android.permission.FOREGROUND_SERVICE",
      "android.permission.INTERNET",
      "ca.lbcstudios.hempire.permission.C2D_MESSAGE",
      "com.singular.preinstall.READ_PERMISSION_SINGULAR",
      "android.permission.POST_NOTIFICATIONS",
      "com.google.android.c2dm.permission.RECEIVE",
      "android.permission.WAKE_LOCK",
      "com.android.vending.CHECK_LICENSE",
      "android.permission.ACCESS_NETWORK_STATE",
      "ca.lbcstudios.hempire.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION",
      "com.google.android.gms.permission.AD_ID",
      "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
      "com.android.vending.BILLING"
    ],
    "libraries": []
  },
  "apk": {
    "path": "ca.lbcstudios.hempire_2.35.2-1344_minAPI22(arm64-v8a,armeabi-v7a,x86,x86_64)(nodpi)_apkmirror.com.apk",
    "checksum": "d05f855f7d13bf51d73a7eb6fe5fe42b432e81ad60f732222d1e0e6f0b745e7f"
  },
  "trackers": [
    {
      "name": "Google CrashLytics",
      "id": 27
    },
    {
      "name": "Google Firebase Analytics",
      "id": 49
    },
    {
      "name": "HelpShift",
      "id": 58
    },
    {
      "name": "Facebook Ads",
      "id": 65
    },
    {
      "name": "Facebook Analytics",
      "id": 66
    },
    {
      "name": "Facebook Login",
      "id": 67
    },
    {
      "name": "Facebook Share",
      "id": 70
    },
    {
      "name": "Unity3d Ads",
      "id": 121
    },
    {
      "name": "ironSource",
      "id": 146
    },
    {
      "name": "Tapjoy",
      "id": 199
    },
    {
      "name": "GameAnalytics",
      "id": 205
    },
    {
      "name": "Singular",
      "id": 251
    },
    {
      "name": "Google AdMob",
      "id": 312
    },
    {
      "name": "IAB Open Measurement",
      "id": 328
    }
  ]
}
```

#### ⚠️ **Pitfalls**

Keep in mind that this tool uses `dexdump` and currently only provides a `GNU/Linux x86_64` version.

### 🌐 **Download an APK from a PeepApp Instance** 🌐

Easily download APKs directly from a PeepApp instance.

#### ⚙️ **Configuration**

Create a `config.py` file in the project directory with the following:

```bash
CONFIG = {
    'username': 'alice',
    'password': 'bob',
    'host': 'http://localhost:8000'
}
```

#### 📜 **Usage**

```bash
$ ./peepapp_download.py --help
usage: peepapp_download.py [-h] report_id destination

positional arguments:
  report_id    the report of the app to download
  destination  the destination folder

optional arguments:
  -h, --help   show this help message and exit
```

Be sure to activate the Python `virtualenv` before running `peepapp_download.py`.

#### 🌟 **Example of Output**

```bash
./peepapp_download.py 15 /tmp/
Successfully logged in
Downloading the APK ...
APK successfully downloaded: /tmp/fr.meteo.apk
```

## 📝 **Workflow Diagram** 📝

![FLOWDIAG!](https://raw.githubusercontent.com/oatkrs/peepapp-cli/main/d2.png)

## 🔄 **Continuous Integration** 🔄

Integrate PeepApp Standalone effortlessly into your CI pipelines! 🛠️

### 🛠️ **GitLab CI/CD**

Here's how you can add PeepApp to your GitLab CI/CD:

```yml
peepapp_scan:
  stage: audit
  image:
    name: oatkrs/peepapp-cli:latest
    entrypoint: [""]
  script:
    - /peepapp_analyze.py [YOUR_APK_PATH]
```

### 💻 **GitHub Actions**

And here's how to get started with GitHub Actions:

```yml
steps:
  - name: Execute peepapp-cli
    uses: docker://oatkrs/peepapp-cli:latest
    with:
      args: /github/workspace/[YOUR_APK_PATH]
```

---

Unleash the power of **PeepApp Standalone** and make app security a breeze! 🚀✨