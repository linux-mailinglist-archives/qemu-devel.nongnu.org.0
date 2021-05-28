Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B826393B88
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 04:44:49 +0200 (CEST)
Received: from localhost ([::1]:59762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmSUS-0004mS-Gq
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 22:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSL3-00065P-MB
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:35:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSKz-0000q7-Lx
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:35:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622169301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qViv04h9D5668zJqWA8NS1tRki7tqdyt8EqtB6TU2jk=;
 b=dg9eYt+0LyOMuyK+RxHXi30XRqwvD+siIpGTJoQa7q4Q4XKeouDbn92m+ymmFC8ryqHChW
 LWU1a5hTMHmvWK6XMv9d7P41uHyqYGUkeb2Y2g8kf8jsgqTozC/rtSlpNJPhbYOK1gNJTI
 XLRb5lRblmnSdsP4PsiZ//ZYZDDjDE4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-2B-oCHPwOHaFQgcM0jIVJA-1; Thu, 27 May 2021 22:34:58 -0400
X-MC-Unique: 2B-oCHPwOHaFQgcM0jIVJA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C01F107ACCA;
 Fri, 28 May 2021 02:34:57 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD93A1F0C0;
 Fri, 28 May 2021 02:34:55 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/44] python: Add flake8 to pipenv
Date: Thu, 27 May 2021 22:32:09 -0400
Message-Id: <20210528023220.417057-34-jsnow@redhat.com>
In-Reply-To: <20210528023220.417057-1-jsnow@redhat.com>
References: <20210528023220.417057-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

flake8 3.5.x does not support the --extend-ignore syntax used in the
.flake8 file to gracefully extend default ignores, so 3.6.x is our
minimum requirement. There is no known upper bound.

flake8 can be run from the python/ directory with no arguments.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
Message-id: 20210527211715.394144-21-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Pipfile      |  1 +
 python/Pipfile.lock | 51 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/python/Pipfile b/python/Pipfile
index 285e2c8e671..053f344dcbe 100644
--- a/python/Pipfile
+++ b/python/Pipfile
@@ -4,6 +4,7 @@ url = "https://pypi.org/simple"
 verify_ssl = true
 
 [dev-packages]
+flake8 = ">=3.6.0"
 pylint = ">=2.8.0"
 
 [packages]
diff --git a/python/Pipfile.lock b/python/Pipfile.lock
index c9debd09503..5c34019060a 100644
--- a/python/Pipfile.lock
+++ b/python/Pipfile.lock
@@ -1,7 +1,7 @@
 {
     "_meta": {
         "hash": {
-            "sha256": "bd4fb76fcdd145bbf23c3a9dd7ad966113c5ce43ca51cc2d828aa7e73d572901"
+            "sha256": "3c842ab9c72c40d24d146349aa144e00e4dec1c358c812cfa96489411f5b3f87"
         },
         "pipfile-spec": 6,
         "requires": {
@@ -25,6 +25,22 @@
             "markers": "python_version ~= '3.6'",
             "version": "==2.5.6"
         },
+        "flake8": {
+            "hashes": [
+                "sha256:07528381786f2a6237b061f6e96610a4167b226cb926e2aa2b6b1d78057c576b",
+                "sha256:bf8fd333346d844f616e8d47905ef3a3384edae6b4e9beb0c5101e25e3110907"
+            ],
+            "index": "pypi",
+            "version": "==3.9.2"
+        },
+        "importlib-metadata": {
+            "hashes": [
+                "sha256:8c501196e49fb9df5df43833bdb1e4328f64847763ec8a50703148b73784d581",
+                "sha256:d7eb1dea6d6a6086f8be21784cc9e3bcfa55872b52309bc5fad53a8ea444465d"
+            ],
+            "markers": "python_version < '3.8'",
+            "version": "==4.0.1"
+        },
         "isort": {
             "hashes": [
                 "sha256:0a943902919f65c5684ac4e0154b1ad4fac6dcaa5d9f3426b732f1c8b5419be6",
@@ -68,6 +84,22 @@
             ],
             "version": "==0.6.1"
         },
+        "pycodestyle": {
+            "hashes": [
+                "sha256:514f76d918fcc0b55c6680472f0a37970994e07bbb80725808c17089be302068",
+                "sha256:c389c1d06bf7904078ca03399a4816f974a1d590090fecea0c63ec26ebaf1cef"
+            ],
+            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3'",
+            "version": "==2.7.0"
+        },
+        "pyflakes": {
+            "hashes": [
+                "sha256:7893783d01b8a89811dd72d7dfd4d84ff098e5eed95cfa8905b22bbffe52efc3",
+                "sha256:f5bc8ecabc05bb9d291eb5203d6810b49040f6ff446a756326104746cc00c1db"
+            ],
+            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3'",
+            "version": "==2.3.1"
+        },
         "pylint": {
             "hashes": [
                 "sha256:586d8fa9b1891f4b725f587ef267abe2a1bad89d6b184520c7f07a253dd6e217",
@@ -120,11 +152,28 @@
             "markers": "implementation_name == 'cpython' and python_version < '3.8'",
             "version": "==1.4.3"
         },
+        "typing-extensions": {
+            "hashes": [
+                "sha256:0ac0f89795dd19de6b97debb0c6af1c70987fd80a2d62d1958f7e56fcc31b497",
+                "sha256:50b6f157849174217d0656f99dc82fe932884fb250826c18350e159ec6cdf342",
+                "sha256:779383f6086d90c99ae41cf0ff39aac8a7937a9283ce0a414e5dd782f4c94a84"
+            ],
+            "markers": "python_version < '3.8'",
+            "version": "==3.10.0.0"
+        },
         "wrapt": {
             "hashes": [
                 "sha256:b62ffa81fb85f4332a4f609cab4ac40709470da05643a082ec1eb88e6d9b97d7"
             ],
             "version": "==1.12.1"
+        },
+        "zipp": {
+            "hashes": [
+                "sha256:3607921face881ba3e026887d8150cca609d517579abe052ac81fc5aeffdbd76",
+                "sha256:51cb66cc54621609dd593d1787f286ee42a5c0adbb4b29abea5a63edc3e03098"
+            ],
+            "markers": "python_version >= '3.6'",
+            "version": "==3.4.1"
         }
     }
 }
-- 
2.31.1


