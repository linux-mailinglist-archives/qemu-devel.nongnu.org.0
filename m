Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B6450C00E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 20:57:33 +0200 (CEST)
Received: from localhost ([::1]:54870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhyTE-0004kc-Sh
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 14:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhyLm-0000Va-2V
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 14:49:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhyLi-0007tP-VQ
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 14:49:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650653386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d1G9/pjXOnIgBED0FsY25zj7ShgiF7C1JEpfR9qj62Q=;
 b=ODxWc6O8RsYRgH2h7fsabfH8PZe3X+RgeUET49eJ4u0Bfx5c672eXv81P3H/Qt+zAx6U8H
 m1DS0agcnJHqsVjIdz5wtp//VZBaBQ99ZWH32pzCY317j/zr54aX2NKbGwMTRYwExEUIWM
 eynt2d96u0XMYImy6QLCGpwH2fq0hzM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-MzT0aOI2NOqRR2owYn2pWg-1; Fri, 22 Apr 2022 14:49:45 -0400
X-MC-Unique: MzT0aOI2NOqRR2owYn2pWg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 058C480A0AD
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 18:49:45 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.10.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9BBD1468940;
 Fri, 22 Apr 2022 18:49:44 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu.qmp PATCH 10/12] update Pipfile
Date: Fri, 22 Apr 2022 14:49:38 -0400
Message-Id: <20220422184940.1763958-11-jsnow@redhat.com>
In-Reply-To: <20220422184940.1763958-1-jsnow@redhat.com>
References: <20220422184940.1763958-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: John Snow <jsnow@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The name of the package has changed and the dependencies are different,
so the Pipfile needs to be updated.

This is a little annoying, but Python doesn't offer any tool (to my
knowledge) that behaves in a manner that gives you the *oldest*, but
still adequate, versions of dependencies. So testing minimum version
requirements is actually kind of challenging.

So, do it manually: pin every version at the minimum that still allows
the tests to succeed. This is the best way to experimentally determine
what precisely our development minimum criteria actually are.

Most of these follow from just observing the minimum stated requirements
for each package, manually, recursively. However, I observed that toml's
stated dependency of >= 0.9.4 in pylint actually needs to be >= 0.10.0.

(If you're new to pipenv, it's a tool separate from packaging metadata
that is used to provide a precise specification for a virtual
environment. In this repository, I am using it to pin a testing
environment against the very oldest packages we support in order to test
that we do not break compatibility with older versions of python,
pylint, mypy, etc.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 Pipfile      |  37 ++++++-
 Pipfile.lock | 288 ++++++++++++++++++++++++++++-----------------------
 2 files changed, 195 insertions(+), 130 deletions(-)

diff --git a/Pipfile b/Pipfile
index e7acb8c..595b83f 100644
--- a/Pipfile
+++ b/Pipfile
@@ -4,10 +4,43 @@ url = "https://pypi.org/simple"
 verify_ssl = true
 
 [dev-packages]
-qemu = {editable = true, extras = ["devel"], path = "."}
+avocado-framework = "==90.0"
+isort = "==5.1.2"
+tox = "==3.18.0"
+toml = "==0.10.0"
+six = "==1.14.0"
+filelock = "==3.0.0"
+virtualenv = "==16.0.0"
+py = "==1.4.17"
+pluggy = "==0.12.0"
+pyparsing = "==2.0.2"
+"backports.entry-points-selectable" = "==1.0.4"
+platformdirs = "==2.0.0"
+distlib = "==0.3.1"
+importlib-metadata = "==0.12"
+zipp = "==0.5"
+pylint = "==2.8.0"
+astroid = "==2.5.4"
+mccabe = "==0.6"
+lazy-object-proxy = "==1.4.0"
+wrapt = "==1.11"
+flake8 = "==3.6.0"
+pycodestyle = "==2.4.0"
+pyflakes = "==2.0.0"
+mypy = "==0.780"
+typed-ast = "==1.4.0"
+typing-extensions = "==3.7.4"
+mypy-extensions = "==0.4.3"
+urwid = "==2.1.2"
+urwid-readline = "==0.13"
+Pygments = "==2.9.0"
+"qemu.qmp" = {editable = true, extras = ["devel"], path = "."}
 
 [packages]
-qemu = {editable = true,path = "."}
+urwid = "==2.1.2"
+urwid-readline = "==0.13"
+Pygments = "==2.9.0"
+"qemu.qmp" = {editable = true, extras = ["tui"], path = "."}
 
 [requires]
 python_version = "3.6"
diff --git a/Pipfile.lock b/Pipfile.lock
index ce46404..f771fb6 100644
--- a/Pipfile.lock
+++ b/Pipfile.lock
@@ -1,7 +1,7 @@
 {
     "_meta": {
         "hash": {
-            "sha256": "f1a25654d884a5b450e38d78b1f2e3ebb9073e421cc4358d4bbb83ac251a5670"
+            "sha256": "b9067d0e558c07da0a02abceee8495da37c3eb7246d555e7061709521cdf3777"
         },
         "pipfile-spec": 6,
         "requires": {
@@ -16,26 +16,51 @@
         ]
     },
     "default": {
-        "qemu": {
+        "pygments": {
+            "hashes": [
+                "sha256:a18f47b506a429f6f4b9df81bb02beab9ca21d0a5fee38ed15aef65f0545519f",
+                "sha256:d66e804411278594d764fc69ec36ec13d9ae9147193a1740cd34d272ca383b8e"
+            ],
+            "index": "pypi",
+            "version": "==2.9.0"
+        },
+        "qemu-qmp": {
             "editable": true,
+            "extras": [
+                "tui"
+            ],
             "path": "."
+        },
+        "qemu.qmp": {
+            "editable": true,
+            "extras": [
+                "tui"
+            ],
+            "path": "."
+        },
+        "urwid": {
+            "hashes": [
+                "sha256:588bee9c1cb208d0906a9f73c613d2bd32c3ed3702012f51efe318a3f2127eae"
+            ],
+            "index": "pypi",
+            "version": "==2.1.2"
+        },
+        "urwid-readline": {
+            "hashes": [
+                "sha256:018020cbc864bb5ed87be17dc26b069eae2755cb29f3a9c569aac3bded1efaf4"
+            ],
+            "index": "pypi",
+            "version": "==0.13"
         }
     },
     "develop": {
-        "appdirs": {
-            "hashes": [
-                "sha256:7d5d0167b2b1ba821647616af46a749d1c653740dd0d2415100fe26e27afdf41",
-                "sha256:a841dacd6b99318a741b166adb07e19ee71a274450e68237b4650ca1055ab128"
-            ],
-            "version": "==1.4.4"
-        },
         "astroid": {
             "hashes": [
-                "sha256:09bdb456e02564731f8b5957cdd0c98a7f01d2db5e90eb1d794c353c28bfd705",
-                "sha256:6a8a51f64dae307f6e0c9db752b66a7951e282389d8362cc1d39a56f3feeb31d"
+                "sha256:f040fe9c4a2a7699a8ec30c9ed10fb59067c97f64c36577f476c0953ba29847c",
+                "sha256:f9f472d4002d55199b1c151ef0570cf71d42aaa34aaa3d29c3e41c75f6f47564"
             ],
             "index": "pypi",
-            "version": "==2.6.0"
+            "version": "==2.5.4"
         },
         "avocado-framework": {
             "hashes": [
@@ -45,21 +70,28 @@
             "index": "pypi",
             "version": "==90.0"
         },
+        "backports.entry-points-selectable": {
+            "hashes": [
+                "sha256:2a238e1d8b212b9cf50156b63cd748d54dc33df74e590d614507fc9ce57d0d4a",
+                "sha256:4acda84d96855beece3bf9aad9a1030aceb5f744b8ce9af7d5ee6dd672cdd3bd"
+            ],
+            "index": "pypi",
+            "version": "==1.0.4"
+        },
         "distlib": {
             "hashes": [
-                "sha256:106fef6dc37dd8c0e2c0a60d3fca3e77460a48907f335fa28420463a6f799736",
-                "sha256:23e223426b28491b1ced97dc3bbe183027419dfc7982b4fa2f05d5f3ff10711c"
+                "sha256:8c09de2c67b3e7deef7184574fc060ab8a793e7adbb183d942c389c8b13c52fb",
+                "sha256:edf6116872c863e1aa9d5bb7cb5e05a022c519a4594dc703843343a9ddd9bff1"
             ],
             "index": "pypi",
-            "version": "==0.3.2"
+            "version": "==0.3.1"
         },
         "filelock": {
             "hashes": [
-                "sha256:18d82244ee114f543149c66a6e0c14e9c4f8a1044b5cdaadd0f82159d6a6ff59",
-                "sha256:929b7d63ec5b7d6b71b0fa5ac14e030b3f70b75747cef1b10da9b879fef15836"
+                "sha256:b3ad481724adfb2280773edd95ce501e497e88fa4489c6e41e637ab3fd9a456c"
             ],
             "index": "pypi",
-            "version": "==3.0.12"
+            "version": "==3.0.0"
         },
         "flake8": {
             "hashes": [
@@ -69,29 +101,13 @@
             "index": "pypi",
             "version": "==3.6.0"
         },
-        "fusepy": {
-            "hashes": [
-                "sha256:10f5c7f5414241bffecdc333c4d3a725f1d6605cae6b4eaf86a838ff49cdaf6c",
-                "sha256:a9f3a3699080ddcf0919fd1eb2cf743e1f5859ca54c2018632f939bdfac269ee"
-            ],
-            "index": "pypi",
-            "version": "==2.0.4"
-        },
         "importlib-metadata": {
             "hashes": [
-                "sha256:90bb658cdbbf6d1735b6341ce708fc7024a3e14e99ffdc5783edea9f9b077f83",
-                "sha256:dc15b2969b4ce36305c51eebe62d418ac7791e9a157911d58bfb1f9ccd8e2070"
-            ],
-            "markers": "python_version < '3.8'",
-            "version": "==1.7.0"
-        },
-        "importlib-resources": {
-            "hashes": [
-                "sha256:54161657e8ffc76596c4ede7080ca68cb02962a2e074a2586b695a93a925d36e",
-                "sha256:e962bff7440364183203d179d7ae9ad90cb1f2b74dcb84300e88ecc42dca3351"
+                "sha256:2f2e54cbf6b06b16351e4c40a6adb0860cab6cfb95a0c0fcb58bb789c4b450f5",
+                "sha256:37bbea81dec44d1ff72d58a1b5c1599a9f3436537f33e9e26f276610064c4830"
             ],
             "index": "pypi",
-            "version": "==5.1.4"
+            "version": "==0.12"
         },
         "isort": {
             "hashes": [
@@ -103,38 +119,35 @@
         },
         "lazy-object-proxy": {
             "hashes": [
-                "sha256:17e0967ba374fc24141738c69736da90e94419338fd4c7c7bef01ee26b339653",
-                "sha256:1fee665d2638491f4d6e55bd483e15ef21f6c8c2095f235fef72601021e64f61",
-                "sha256:22ddd618cefe54305df49e4c069fa65715be4ad0e78e8d252a33debf00f6ede2",
-                "sha256:24a5045889cc2729033b3e604d496c2b6f588c754f7a62027ad4437a7ecc4837",
-                "sha256:410283732af311b51b837894fa2f24f2c0039aa7f220135192b38fcc42bd43d3",
-                "sha256:4732c765372bd78a2d6b2150a6e99d00a78ec963375f236979c0626b97ed8e43",
-                "sha256:489000d368377571c6f982fba6497f2aa13c6d1facc40660963da62f5c379726",
-                "sha256:4f60460e9f1eb632584c9685bccea152f4ac2130e299784dbaf9fae9f49891b3",
-                "sha256:5743a5ab42ae40caa8421b320ebf3a998f89c85cdc8376d6b2e00bd12bd1b587",
-                "sha256:85fb7608121fd5621cc4377a8961d0b32ccf84a7285b4f1d21988b2eae2868e8",
-                "sha256:9698110e36e2df951c7c36b6729e96429c9c32b3331989ef19976592c5f3c77a",
-                "sha256:9d397bf41caad3f489e10774667310d73cb9c4258e9aed94b9ec734b34b495fd",
-                "sha256:b579f8acbf2bdd9ea200b1d5dea36abd93cabf56cf626ab9c744a432e15c815f",
-                "sha256:b865b01a2e7f96db0c5d12cfea590f98d8c5ba64ad222300d93ce6ff9138bcad",
-                "sha256:bf34e368e8dd976423396555078def5cfc3039ebc6fc06d1ae2c5a65eebbcde4",
-                "sha256:c6938967f8528b3668622a9ed3b31d145fab161a32f5891ea7b84f6b790be05b",
-                "sha256:d1c2676e3d840852a2de7c7d5d76407c772927addff8d742b9808fe0afccebdf",
-                "sha256:d7124f52f3bd259f510651450e18e0fd081ed82f3c08541dffc7b94b883aa981",
-                "sha256:d900d949b707778696fdf01036f58c9876a0d8bfe116e8d220cfd4b15f14e741",
-                "sha256:ebfd274dcd5133e0afae738e6d9da4323c3eb021b3e13052d8cbd0e457b1256e",
-                "sha256:ed361bb83436f117f9917d282a456f9e5009ea12fd6de8742d1a4752c3017e93",
-                "sha256:f5144c75445ae3ca2057faac03fda5a902eff196702b0a24daf1d6ce0650514b"
+                "sha256:118d53f8819f9457732dd0e418752f2850f395c5405b2e12485f52336e4ad0f5",
+                "sha256:495c583b363c3eded649e2c00177093f03f856f5c9f95b527420084a9ce17b9d",
+                "sha256:55fa9eab93482891ce97473e63610efdd9c8fa5c05cca9f60468c412e602e499",
+                "sha256:642fc0a9b61920669dab66e400f79f1b8b0e8f698dcde85f7e9ae5528dbcaf4a",
+                "sha256:7003959a170fde9b92936c38562810f94679c80608fb4b007e026b915bef8b27",
+                "sha256:7e63da94f5a1ddb0d2dcdb5d17ff4d1d33f51f3368bdf0475d5f56c0f3b99592",
+                "sha256:7fb11d33d99a374e4b0c3fb20128890b9cf784ca7e4b91ecbb191d34618bd9fe",
+                "sha256:8758715ea005afa293783797498d64f40ab14d1ded208b3e282760cde9512f1d",
+                "sha256:8995543f47a8b81962e384f12791114af9f4997be7a0db71abc40d2a2dfee961",
+                "sha256:91c7e1316116fedda36818ce7cd269378fffc4219781536eff441ea1e68e1caf",
+                "sha256:9b41ec246d31ca6a840dcf67673b2668adc5a095c64310d26d73292588563ea3",
+                "sha256:a8be3cfd7c3154e8d39276c627c5e7ee55d1f2094597b060ece99620ef9fe86b",
+                "sha256:afcab74f471652b643900e0862b31892ac5fe5a75e435b786a1825855f4effdf",
+                "sha256:d49a90c27074f44c8dc147d83e31140523948ee147b3248634c540e053caea58",
+                "sha256:d6957cadc9c079ef4697564af500d52fba6d14fb2f08d20ce92f52201fb77050",
+                "sha256:da7f2a6c82a11dc4e05bab73522f0d6dd4f3bbc8378cd4b0769137f342cdb3f0",
+                "sha256:f03a21f6f6e54778860122a620f70c8b148ec4ee175968782bcaaa94955a46f9",
+                "sha256:f6c718ffca055852479880debbe717da952fcfd60067a0ddb6fe3b053b1d4de0"
             ],
             "index": "pypi",
-            "version": "==1.6.0"
+            "version": "==1.4.0"
         },
         "mccabe": {
             "hashes": [
-                "sha256:ab8a6258860da4b6677da4bd2fe5dc2c659cff31b3ee4f7f5d64e79735b80d42",
-                "sha256:dd8d182285a0fe56bace7f45b5e7d1a6ebcbf524e8f3bd87eb0f125271b8831f"
+                "sha256:c6f88ac33667c89d6588e5189334d051f186f4dd3ae5139586af54677c36b5a8",
+                "sha256:de9bbfe5b771e4c11b1521f3e338fe265a12296b59302f43a3bbf3e02d4b98b1"
             ],
-            "version": "==0.6.1"
+            "index": "pypi",
+            "version": "==0.6"
         },
         "mypy": {
             "hashes": [
@@ -161,31 +174,39 @@
                 "sha256:090fedd75945a69ae91ce1303b5824f428daf5a028d2f6ab8a299250a846f15d",
                 "sha256:2d82818f5bb3e369420cb3c4060a7970edba416647068eb4c5343488a6c604a8"
             ],
+            "index": "pypi",
             "version": "==0.4.3"
         },
         "packaging": {
             "hashes": [
-                "sha256:5b327ac1320dc863dca72f4514ecc086f31186744b84a230374cc1fd776feae5",
-                "sha256:67714da7f7bc052e064859c05c595155bd1ee9f69f76557e21f051443c20947a"
+                "sha256:dd47c42927d89ab911e606518907cc2d3a1f38bbd026385970643f9c5b8ecfeb",
+                "sha256:ef103e05f519cdc783ae24ea4e2e0f508a9c99b2d4969652eed6a2e1ea5bd522"
+            ],
+            "markers": "python_version >= '3.6'",
+            "version": "==21.3"
+        },
+        "platformdirs": {
+            "hashes": [
+                "sha256:9fc2bc9a5f04bfd5b12c1edb64394f6108c17b2a5be0a461f9a8b08c8a7d8991",
+                "sha256:c4d969c6d051f37548994641338c74f3125b771e8fbbe4a45d60d4a976e34533"
             ],
             "index": "pypi",
-            "version": "==20.9"
+            "version": "==2.0.0"
         },
         "pluggy": {
             "hashes": [
-                "sha256:15b2acde666561e1298d71b523007ed7364de07029219b604cf808bfa1c765b0",
-                "sha256:966c145cd83c96502c3c3868f50408687b38434af77734af1e9ca461a4081d2d"
+                "sha256:0825a152ac059776623854c1543d65a4ad408eb3d33ee114dff91e57ec6ae6fc",
+                "sha256:b9817417e95936bf75d85d3f8767f7df6cdde751fc40aed3bb3074cbcb77757c"
             ],
             "index": "pypi",
-            "version": "==0.13.1"
+            "version": "==0.12.0"
         },
         "py": {
             "hashes": [
-                "sha256:21b81bda15b66ef5e1a777a21c4dcd9c20ad3efd0b3f817e7a809035269e1bd3",
-                "sha256:3b80836aa6d1feeaa108e046da6423ab8f6ceda6468545ae8d02d9d58d18818a"
+                "sha256:45d74855a614c73f97b0cbbe5615e5be34fa623ecf5ee6b7a4417f9a52665fb7"
             ],
             "index": "pypi",
-            "version": "==1.10.0"
+            "version": "==1.4.17"
         },
         "pycodestyle": {
             "hashes": [
@@ -193,6 +214,7 @@
                 "sha256:cbc619d09254895b0d12c2c691e237b2e91e9b2ecf5e84c26b35400f93dcfb83",
                 "sha256:cbfca99bd594a10f674d0cd97a3d802a1fdef635d4361e1a2658de47ed261e3a"
             ],
+            "index": "pypi",
             "version": "==2.4.0"
         },
         "pyflakes": {
@@ -200,6 +222,7 @@
                 "sha256:9a7662ec724d0120012f6e29d6248ae3727d821bba522a0e6b356eff19126a49",
                 "sha256:f661252913bc1dbe7fcfcbf0af0db3f42ab65aabd1a6ca68fe5d466bace94dae"
             ],
+            "index": "pypi",
             "version": "==2.0.0"
         },
         "pygments": {
@@ -220,14 +243,31 @@
         },
         "pyparsing": {
             "hashes": [
-                "sha256:c203ec8783bf771a155b207279b9bccb8dea02d8f0c9e5f8ead507bc3246ecc1",
-                "sha256:ef9d7589ef3c200abe66653d3f1ab1033c3c419ae9b9bdb1240a85b024efc88b"
+                "sha256:1039385c4702ba1834f1d5d6a832c3acdb499c7a8ffdd460ba6d381df3c30cda",
+                "sha256:1584a093537c6f0add04a514b91b55fda93e2331de7e5140f835d7d8662ea291",
+                "sha256:17e43d6b17588ed5968735575b3983a952133ec4082596d214d7090b56d48a06",
+                "sha256:3a203a88fc0f0b3c21909de3367ade6b51b2f32abb4e6932bcbf197273593f72",
+                "sha256:4dda9208817b3a1fe7d500408e4d5ebbb8e4549ba377e6a259ab2552e1275b0b",
+                "sha256:7145b41ff85f2428e365f2b9bd16b69bd68f1150c3f8d05528273505ede15abe",
+                "sha256:8e395e5c5c7d95e62b4a6a5311afbf8644b6d5f8280e033aebfca38d1f637486",
+                "sha256:a4c2134b09d85dc250422cdd1ab1c4bc4603dd5016f881c2a987c472778a9a14",
+                "sha256:d61cce2ef4bc4eb27d99bc5130e30be1bfbe59fe41e804255f06061cbec0388f"
             ],
             "index": "pypi",
-            "version": "==2.4.7"
+            "version": "==2.0.2"
         },
-        "qemu": {
+        "qemu-qmp": {
             "editable": true,
+            "extras": [
+                "tui"
+            ],
+            "path": "."
+        },
+        "qemu.qmp": {
+            "editable": true,
+            "extras": [
+                "tui"
+            ],
             "path": "."
         },
         "setuptools": {
@@ -240,19 +280,20 @@
         },
         "six": {
             "hashes": [
-                "sha256:1e61c37477a1626458e36f7b1d82aa5c9b094fa4802892072e49de9c60c4c926",
-                "sha256:8abb2f1d86890a2dfb989f9a77cfcfd3e47c2a354b01111771326f8aa26e0254"
+                "sha256:236bdbdce46e6e6a3d61a337c0f8b763ca1e8717c03b369e87a7ec7ce1319c0a",
+                "sha256:8f3cd2e254d8f793e7f3d6d9df77b92252b52637291d0f0da013c76ea2724b6c"
             ],
-            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3'",
-            "version": "==1.16.0"
+            "index": "pypi",
+            "version": "==1.14.0"
         },
         "toml": {
             "hashes": [
-                "sha256:806143ae5bfb6a3c6e736a764057db0e6a0e05e338b5630894a5f779cabb4f9b",
-                "sha256:b3bda1d108d5dd99f4a20d24d9c348e91c4db7ab1b749200bded2f839ccbe68f"
+                "sha256:229f81c57791a41d65e399fc06bf0848bab550a9dfd5ed66df18ce5f05e73d5c",
+                "sha256:235682dd292d5899d361a811df37e04a8828a5b1da3115886b73cf81ebc9100e",
+                "sha256:f1db651f9657708513243e61e6cc67d101a39bad662eaa9b5546f789338e07a3"
             ],
-            "markers": "python_version >= '2.6' and python_version not in '3.0, 3.1, 3.2, 3.3'",
-            "version": "==0.10.2"
+            "index": "pypi",
+            "version": "==0.10.0"
         },
         "tox": {
             "hashes": [
@@ -264,48 +305,38 @@
         },
         "typed-ast": {
             "hashes": [
-                "sha256:01ae5f73431d21eead5015997ab41afa53aa1fbe252f9da060be5dad2c730ace",
-                "sha256:067a74454df670dcaa4e59349a2e5c81e567d8d65458d480a5b3dfecec08c5ff",
-                "sha256:0fb71b8c643187d7492c1f8352f2c15b4c4af3f6338f21681d3681b3dc31a266",
-                "sha256:1b3ead4a96c9101bef08f9f7d1217c096f31667617b58de957f690c92378b528",
-                "sha256:2068531575a125b87a41802130fa7e29f26c09a2833fea68d9a40cf33902eba6",
-                "sha256:209596a4ec71d990d71d5e0d312ac935d86930e6eecff6ccc7007fe54d703808",
-                "sha256:2c726c276d09fc5c414693a2de063f521052d9ea7c240ce553316f70656c84d4",
-                "sha256:398e44cd480f4d2b7ee8d98385ca104e35c81525dd98c519acff1b79bdaac363",
-                "sha256:52b1eb8c83f178ab787f3a4283f68258525f8d70f778a2f6dd54d3b5e5fb4341",
-                "sha256:5feca99c17af94057417d744607b82dd0a664fd5e4ca98061480fd8b14b18d04",
-                "sha256:7538e495704e2ccda9b234b82423a4038f324f3a10c43bc088a1636180f11a41",
-                "sha256:760ad187b1041a154f0e4d0f6aae3e40fdb51d6de16e5c99aedadd9246450e9e",
-                "sha256:777a26c84bea6cd934422ac2e3b78863a37017618b6e5c08f92ef69853e765d3",
-                "sha256:95431a26309a21874005845c21118c83991c63ea800dd44843e42a916aec5899",
-                "sha256:9ad2c92ec681e02baf81fdfa056fe0d818645efa9af1f1cd5fd6f1bd2bdfd805",
-                "sha256:9c6d1a54552b5330bc657b7ef0eae25d00ba7ffe85d9ea8ae6540d2197a3788c",
-                "sha256:aee0c1256be6c07bd3e1263ff920c325b59849dc95392a05f258bb9b259cf39c",
-                "sha256:af3d4a73793725138d6b334d9d247ce7e5f084d96284ed23f22ee626a7b88e39",
-                "sha256:b36b4f3920103a25e1d5d024d155c504080959582b928e91cb608a65c3a49e1a",
-                "sha256:b9574c6f03f685070d859e75c7f9eeca02d6933273b5e69572e5ff9d5e3931c3",
-                "sha256:bff6ad71c81b3bba8fa35f0f1921fb24ff4476235a6e94a26ada2e54370e6da7",
-                "sha256:c190f0899e9f9f8b6b7863debfb739abcb21a5c054f911ca3596d12b8a4c4c7f",
-                "sha256:c907f561b1e83e93fad565bac5ba9c22d96a54e7ea0267c708bffe863cbe4075",
-                "sha256:cae53c389825d3b46fb37538441f75d6aecc4174f615d048321b716df2757fb0",
-                "sha256:dd4a21253f42b8d2b48410cb31fe501d32f8b9fbeb1f55063ad102fe9c425e40",
-                "sha256:dde816ca9dac1d9c01dd504ea5967821606f02e510438120091b84e852367428",
-                "sha256:f2362f3cb0f3172c42938946dbc5b7843c2a28aec307c49100c8b38764eb6927",
-                "sha256:f328adcfebed9f11301eaedfa48e15bdece9b519fb27e6a8c01aa52a17ec31b3",
-                "sha256:f8afcf15cc511ada719a88e013cec87c11aff7b91f019295eb4530f96fe5ef2f",
-                "sha256:fb1bbeac803adea29cedd70781399c99138358c26d05fcbd23c13016b7f5ec65"
+                "sha256:1170afa46a3799e18b4c977777ce137bb53c7485379d9706af8a59f2ea1aa161",
+                "sha256:18511a0b3e7922276346bcb47e2ef9f38fb90fd31cb9223eed42c85d1312344e",
+                "sha256:262c247a82d005e43b5b7f69aff746370538e176131c32dda9cb0f324d27141e",
+                "sha256:2b907eb046d049bcd9892e3076c7a6456c93a25bebfe554e931620c90e6a25b0",
+                "sha256:354c16e5babd09f5cb0ee000d54cfa38401d8b8891eefa878ac772f827181a3c",
+                "sha256:48e5b1e71f25cfdef98b013263a88d7145879fbb2d5185f2a0c79fa7ebbeae47",
+                "sha256:4e0b70c6fc4d010f8107726af5fd37921b666f5b31d9331f0bd24ad9a088e631",
+                "sha256:630968c5cdee51a11c05a30453f8cd65e0cc1d2ad0d9192819df9978984529f4",
+                "sha256:66480f95b8167c9c5c5c87f32cf437d585937970f3fc24386f313a4c97b44e34",
+                "sha256:71211d26ffd12d63a83e079ff258ac9d56a1376a25bc80b1cdcdf601b855b90b",
+                "sha256:7954560051331d003b4e2b3eb822d9dd2e376fa4f6d98fee32f452f52dd6ebb2",
+                "sha256:838997f4310012cf2e1ad3803bce2f3402e9ffb71ded61b5ee22617b3a7f6b6e",
+                "sha256:95bd11af7eafc16e829af2d3df510cecfd4387f6453355188342c3e79a2ec87a",
+                "sha256:bc6c7d3fa1325a0c6613512a093bc2a2a15aeec350451cbdf9e1d4bffe3e3233",
+                "sha256:cc34a6f5b426748a507dd5d1de4c1978f2eb5626d51326e43280941206c209e1",
+                "sha256:d755f03c1e4a51e9b24d899561fec4ccaf51f210d52abdf8c07ee2849b212a36",
+                "sha256:d7c45933b1bdfaf9f36c579671fec15d25b06c8398f113dab64c18ed1adda01d",
+                "sha256:d896919306dd0aa22d0132f62a1b78d11aaf4c9fc5b3410d3c666b818191630a",
+                "sha256:fdc1c9bbf79510b76408840e009ed65958feba92a88833cdceecff93ae8fff66",
+                "sha256:ffde2fbfad571af120fcbfbbc61c72469e72f550d676c3342492a9dfdefb8f12"
             ],
-            "markers": "python_version < '3.8' and implementation_name == 'cpython'",
-            "version": "==1.4.3"
+            "index": "pypi",
+            "version": "==1.4.0"
         },
         "typing-extensions": {
             "hashes": [
-                "sha256:0ac0f89795dd19de6b97debb0c6af1c70987fd80a2d62d1958f7e56fcc31b497",
-                "sha256:50b6f157849174217d0656f99dc82fe932884fb250826c18350e159ec6cdf342",
-                "sha256:779383f6086d90c99ae41cf0ff39aac8a7937a9283ce0a414e5dd782f4c94a84"
+                "sha256:2ed632b30bb54fc3941c382decfd0ee4148f5c591651c9272473fea2c6397d95",
+                "sha256:b1edbbf0652660e32ae780ac9433f4231e7339c7f9a8057d0f042fcbcea49b87",
+                "sha256:d8179012ec2c620d3791ca6fe2bf7979d979acdbef1fca0bc56b37411db682ed"
             ],
             "index": "pypi",
-            "version": "==3.10.0.0"
+            "version": "==3.7.4"
         },
         "urwid": {
             "hashes": [
@@ -323,25 +354,26 @@
         },
         "virtualenv": {
             "hashes": [
-                "sha256:14fdf849f80dbb29a4eb6caa9875d476ee2a5cf76a5f5415fa2f1606010ab467",
-                "sha256:2b0126166ea7c9c3661f5b8e06773d28f83322de7a3ff7d06f0aed18c9de6a76"
+                "sha256:2ce32cd126117ce2c539f0134eb89de91a8413a29baac49cbab3eb50e2026669",
+                "sha256:ca07b4c0b54e14a91af9f34d0919790b016923d157afda5efdde55c96718f752"
             ],
             "index": "pypi",
-            "version": "==20.4.7"
+            "version": "==16.0.0"
         },
         "wrapt": {
             "hashes": [
-                "sha256:b62ffa81fb85f4332a4f609cab4ac40709470da05643a082ec1eb88e6d9b97d7"
+                "sha256:e03f19f64d81d0a3099518ca26b04550026f131eced2e76ced7b85c6b8d32128"
             ],
-            "version": "==1.12.1"
+            "index": "pypi",
+            "version": "==1.11"
         },
         "zipp": {
             "hashes": [
-                "sha256:3607921face881ba3e026887d8150cca609d517579abe052ac81fc5aeffdbd76",
-                "sha256:51cb66cc54621609dd593d1787f286ee42a5c0adbb4b29abea5a63edc3e03098"
+                "sha256:46dfd547d9ccbf8bdc26ecea52818046bb28509f12bb6a0de1cd66ab06e9a9be",
+                "sha256:d7ac25f895fb65bff937b381353c14eb1fa23d35f40abd72a5342cd57eb57fd1"
             ],
             "index": "pypi",
-            "version": "==3.4.1"
+            "version": "==0.5"
         }
     }
 }
-- 
2.34.1


