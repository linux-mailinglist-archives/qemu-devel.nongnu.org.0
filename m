Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86511478331
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 03:32:33 +0100 (CET)
Received: from localhost ([::1]:46236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my32u-0003uq-Bc
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 21:32:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1my30H-00013V-Rf
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 21:29:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1my30E-0000YB-UK
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 21:29:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639708186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JwU7LK5Z1Ktcj4EReLiCbGjLGzOJ8Es3pFxzyRtewb4=;
 b=EOmHqeocL967+bRGxtD0tzE+bHbMP8ngAg5on3zw5tVRcXnM88o1H7GWkevX1fhjlGEGhG
 3+NGpE2wE/DdpJkMHiLdHTbN0xou+rbpN66orFbZ49cV+17S+SdsNSuDHxVktA6pnpvZHb
 lef4lSiQNCWj0Yq6tPfAXcUnhVD/R6I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-zvMU2IksOsekWI0xh_0zmg-1; Thu, 16 Dec 2021 21:29:43 -0500
X-MC-Unique: zvMU2IksOsekWI0xh_0zmg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 350D21808338;
 Fri, 17 Dec 2021 02:29:42 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2286622DF6;
 Fri, 17 Dec 2021 02:29:41 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/9] Python: Update mypy dependency to >= 0.780
Date: Thu, 16 Dec 2021 21:29:31 -0500
Message-Id: <20211217022939.279559-2-jsnow@redhat.com>
In-Reply-To: <20211217022939.279559-1-jsnow@redhat.com>
References: <20211217022939.279559-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A forthcoming commit makes use of the 'venv' package inside of
iotests.py, which only has stubs available in the version of typeshed
bundled with mypy 0.780 or greater, which increases our minimum
dependency from 0.770.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Pipfile.lock | 64 +++++++++++++++++++++++++++++++++------------
 python/setup.cfg    |  2 +-
 2 files changed, 49 insertions(+), 17 deletions(-)

diff --git a/python/Pipfile.lock b/python/Pipfile.lock
index d2a7dbd88b..b60f3fa508 100644
--- a/python/Pipfile.lock
+++ b/python/Pipfile.lock
@@ -1,7 +1,7 @@
 {
     "_meta": {
         "hash": {
-            "sha256": "784b327272db32403d5a488507853b5afba850ba26a5948e5b6a90c1baef2d9c"
+            "sha256": "b6cdebf9bfa760e4f8148949936aeeeed681ca910900e89be07e13424228f9a0"
         },
         "pipfile-spec": 6,
         "requires": {
@@ -45,6 +45,14 @@
             "index": "pypi",
             "version": "==90.0"
         },
+        "backports.entry-points-selectable": {
+            "hashes": [
+                "sha256:7fceed9532a7aa2bd888654a7314f864a3c16a4e710b34a58cfc0f08114c663b",
+                "sha256:914b21a479fde881635f7af5adc7f6e38d6b274be32269070c53b698c60d5386"
+            ],
+            "markers": "python_version >= '2.7'",
+            "version": "==1.1.1"
+        },
         "distlib": {
             "hashes": [
                 "sha256:106fef6dc37dd8c0e2c0a60d3fca3e77460a48907f335fa28420463a6f799736",
@@ -136,23 +144,23 @@
         },
         "mypy": {
             "hashes": [
-                "sha256:15b948e1302682e3682f11f50208b726a246ab4e6c1b39f9264a8796bb416aa2",
-                "sha256:219a3116ecd015f8dca7b5d2c366c973509dfb9a8fc97ef044a36e3da66144a1",
-                "sha256:3b1fc683fb204c6b4403a1ef23f0b1fac8e4477091585e0c8c54cbdf7d7bb164",
-                "sha256:3beff56b453b6ef94ecb2996bea101a08f1f8a9771d3cbf4988a61e4d9973761",
-                "sha256:7687f6455ec3ed7649d1ae574136835a4272b65b3ddcf01ab8704ac65616c5ce",
-                "sha256:7ec45a70d40ede1ec7ad7f95b3c94c9cf4c186a32f6bacb1795b60abd2f9ef27",
-                "sha256:86c857510a9b7c3104cf4cde1568f4921762c8f9842e987bc03ed4f160925754",
-                "sha256:8a627507ef9b307b46a1fea9513d5c98680ba09591253082b4c48697ba05a4ae",
-                "sha256:8dfb69fbf9f3aeed18afffb15e319ca7f8da9642336348ddd6cab2713ddcf8f9",
-                "sha256:a34b577cdf6313bf24755f7a0e3f3c326d5c1f4fe7422d1d06498eb25ad0c600",
-                "sha256:a8ffcd53cb5dfc131850851cc09f1c44689c2812d0beb954d8138d4f5fc17f65",
-                "sha256:b90928f2d9eb2f33162405f32dde9f6dcead63a0971ca8a1b50eb4ca3e35ceb8",
-                "sha256:c56ffe22faa2e51054c5f7a3bc70a370939c2ed4de308c690e7949230c995913",
-                "sha256:f91c7ae919bbc3f96cd5e5b2e786b2b108343d1d7972ea130f7de27fdd547cf3"
+                "sha256:00cb1964a7476e871d6108341ac9c1a857d6bd20bf5877f4773ac5e9d92cd3cd",
+                "sha256:127de5a9b817a03a98c5ae8a0c46a20dc44442af6dcfa2ae7f96cb519b312efa",
+                "sha256:1f3976a945ad7f0a0727aafdc5651c2d3278e3c88dee94e2bf75cd3386b7b2f4",
+                "sha256:2f8c098f12b402c19b735aec724cc9105cc1a9eea405d08814eb4b14a6fb1a41",
+                "sha256:4ef13b619a289aa025f2273e05e755f8049bb4eaba6d703a425de37d495d178d",
+                "sha256:5d142f219bf8c7894dfa79ebfb7d352c4c63a325e75f10dfb4c3db9417dcd135",
+                "sha256:62eb5dd4ea86bda8ce386f26684f7f26e4bfe6283c9f2b6ca6d17faf704dcfad",
+                "sha256:64c36eb0936d0bfb7d8da49f92c18e312ad2e3ed46e5548ae4ca997b0d33bd59",
+                "sha256:75eed74d2faf2759f79c5f56f17388defd2fc994222312ec54ee921e37b31ad4",
+                "sha256:974bebe3699b9b46278a7f076635d219183da26e1a675c1f8243a69221758273",
+                "sha256:a5e5bb12b7982b179af513dddb06fca12285f0316d74f3964078acbfcf4c68f2",
+                "sha256:d31291df31bafb997952dc0a17ebb2737f802c754aed31dd155a8bfe75112c57",
+                "sha256:d3b4941de44341227ece1caaf5b08b23e42ad4eeb8b603219afb11e9d4cfb437",
+                "sha256:eadb865126da4e3c4c95bdb47fe1bb087a3e3ea14d39a3b13224b8a4d9f9a102"
             ],
             "index": "pypi",
-            "version": "==0.770"
+            "version": "==0.780"
         },
         "mypy-extensions": {
             "hashes": [
@@ -169,6 +177,14 @@
             "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3'",
             "version": "==20.9"
         },
+        "platformdirs": {
+            "hashes": [
+                "sha256:367a5e80b3d04d2428ffa76d33f124cf11e8fff2acdaa9b43d545f5c7d661ef2",
+                "sha256:8868bbe3c3c80d42f20156f22e7131d2fb321f5bc86a2a345375c6481a67021d"
+            ],
+            "markers": "python_version >= '3.6'",
+            "version": "==2.4.0"
+        },
         "pluggy": {
             "hashes": [
                 "sha256:15b2acde666561e1298d71b523007ed7364de07029219b604cf808bfa1c765b0",
@@ -228,6 +244,14 @@
             "editable": true,
             "path": "."
         },
+        "setuptools": {
+            "hashes": [
+                "sha256:22c7348c6d2976a52632c67f7ab0cdf40147db7789f9aed18734643fe9cf3373",
+                "sha256:4ce92f1e1f8f01233ee9952c04f6b81d1e02939d6e1b488428154974a4d0783e"
+            ],
+            "markers": "python_version >= '3.6'",
+            "version": "==59.6.0"
+        },
         "six": {
             "hashes": [
                 "sha256:1e61c37477a1626458e36f7b1d82aa5c9b094fa4802892072e49de9c60c4c926",
@@ -244,6 +268,14 @@
             "markers": "python_version >= '2.6' and python_version not in '3.0, 3.1, 3.2, 3.3'",
             "version": "==0.10.2"
         },
+        "tomli": {
+            "hashes": [
+                "sha256:05b6166bff487dc068d322585c7ea4ef78deed501cc124060e0f238e89a9231f",
+                "sha256:e3069e4be3ead9668e21cb9b074cd948f7b3113fd9c8bba083f48247aab8b11c"
+            ],
+            "markers": "python_version >= '3.6'",
+            "version": "==1.2.3"
+        },
         "tox": {
             "hashes": [
                 "sha256:c60692d92fe759f46c610ac04c03cf0169432d1ff8e981e8ae63e068d0954fc3",
diff --git a/python/setup.cfg b/python/setup.cfg
index 911ae02de7..16f3236485 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -40,7 +40,7 @@ devel =
     flake8 >= 3.6.0
     fusepy >= 2.0.4
     isort >= 5.1.2
-    mypy >= 0.770
+    mypy >= 0.780
     pylint >= 2.8.0
     tox >= 3.18.0
     urwid >= 2.1.2
-- 
2.31.1


