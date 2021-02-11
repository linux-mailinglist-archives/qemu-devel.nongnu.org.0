Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F21C319305
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 20:25:28 +0100 (CET)
Received: from localhost ([::1]:60924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAHah-0000y0-0H
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 14:25:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHCj-0004gw-UQ
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:00:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHCM-0005ep-Jx
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:00:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613070014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XnEq3p2ZhH9uhMDkZJ+a40EDJe0uiUVBdF6f/z2+e2w=;
 b=amO4l1lBmvA4aEbTSQCv4a/TFqDVE6rUiXi6WqtJGb8ECQvilOkU8U/8aX9vxRmP9zXXSL
 jzIr1nlgjyo5pU3kY3Ng7wskHb3KsD9jzvCUCvt5Vz8xLBv2/kD0oqr7X4MOcfc8LlG3e4
 kFxmOYx4svBrUfuYcZFsTFsfcBv8I3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-zBpEOqi0P3ex13Ev4RCjlg-1; Thu, 11 Feb 2021 14:00:09 -0500
X-MC-Unique: zBpEOqi0P3ex13Ev4RCjlg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0B99101C8D7;
 Thu, 11 Feb 2021 18:59:48 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 374303828;
 Thu, 11 Feb 2021 18:59:47 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/24] python: Add flake8 to pipenv
Date: Thu, 11 Feb 2021 13:58:45 -0500
Message-Id: <20210211185856.3975616-14-jsnow@redhat.com>
In-Reply-To: <20210211185856.3975616-1-jsnow@redhat.com>
References: <20210211185856.3975616-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

flake8 3.5.x does not support the --extend-ignore syntax used in the
.flake8 file to gracefully extend default ignores, so 3.6.x is our
minimum requirement. There is no known upper bound.

flake8 can be run from the python/ directory with no arguments.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Pipfile      |  1 +
 python/Pipfile.lock | 51 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/python/Pipfile b/python/Pipfile
index 1e58986c895..d1f7045f680 100644
--- a/python/Pipfile
+++ b/python/Pipfile
@@ -4,6 +4,7 @@ url = "https://pypi.org/simple"
 verify_ssl = true
 
 [dev-packages]
+flake8 = ">=3.6.0"
 pylint = ">=2.6.0"
 
 [packages]
diff --git a/python/Pipfile.lock b/python/Pipfile.lock
index 4506335b7d9..869b0bdf67f 100644
--- a/python/Pipfile.lock
+++ b/python/Pipfile.lock
@@ -1,7 +1,7 @@
 {
     "_meta": {
         "hash": {
-            "sha256": "b7ac1f2ad73bc166244c0378298afba64951a16bb749b81a9668dc41f40f941c"
+            "sha256": "9f6d4857a6c72ad40fc1ec1e58cdb76f187a2986ac4156f0027e5eb798ec69a9"
         },
         "pipfile-spec": 6,
         "requires": {
@@ -25,6 +25,22 @@
             "markers": "python_version >= '3.5'",
             "version": "==2.4.2"
         },
+        "flake8": {
+            "hashes": [
+                "sha256:749dbbd6bfd0cf1318af27bf97a14e28e5ff548ef8e5b1566ccfb25a11e7c839",
+                "sha256:aadae8761ec651813c24be05c6f7b4680857ef6afaae4651a4eccaef97ce6c3b"
+            ],
+            "index": "pypi",
+            "version": "==3.8.4"
+        },
+        "importlib-metadata": {
+            "hashes": [
+                "sha256:ace61d5fc652dc280e7b6b4ff732a9c2d40db2c0f92bc6cb74e07b73d53a1771",
+                "sha256:fa5daa4477a7414ae34e95942e4dd07f62adf589143c875c133c1e53c4eff38d"
+            ],
+            "markers": "python_version < '3.8'",
+            "version": "==3.4.0"
+        },
         "isort": {
             "hashes": [
                 "sha256:c729845434366216d320e936b8ad6f9d681aab72dc7cbc2d51bedc3582f3ad1e",
@@ -67,6 +83,22 @@
             ],
             "version": "==0.6.1"
         },
+        "pycodestyle": {
+            "hashes": [
+                "sha256:2295e7b2f6b5bd100585ebcb1f616591b652db8a741695b3d8f5d28bdc934367",
+                "sha256:c58a7d2815e0e8d7972bf1803331fb0152f867bd89adf8a01dfd55085434192e"
+            ],
+            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3'",
+            "version": "==2.6.0"
+        },
+        "pyflakes": {
+            "hashes": [
+                "sha256:0d94e0e05a19e57a99444b6ddcf9a6eb2e5c68d3ca1e98e90707af8152c90a92",
+                "sha256:35b2d75ee967ea93b55750aa9edbbf72813e06a66ba54438df2cfac9e3c27fc8"
+            ],
+            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3'",
+            "version": "==2.2.0"
+        },
         "pylint": {
             "hashes": [
                 "sha256:bb4a908c9dadbc3aac18860550e870f58e1a02c9f2c204fdf5693d73be061210",
@@ -127,11 +159,28 @@
             "markers": "implementation_name == 'cpython' and python_version < '3.8'",
             "version": "==1.4.2"
         },
+        "typing-extensions": {
+            "hashes": [
+                "sha256:7cb407020f00f7bfc3cb3e7881628838e69d8f3fcab2f64742a5e76b2f841918",
+                "sha256:99d4073b617d30288f569d3f13d2bd7548c3a7e4c8de87db09a9d29bb3a4a60c",
+                "sha256:dafc7639cde7f1b6e1acc0f457842a83e722ccca8eef5270af2d74792619a89f"
+            ],
+            "markers": "python_version < '3.8'",
+            "version": "==3.7.4.3"
+        },
         "wrapt": {
             "hashes": [
                 "sha256:b62ffa81fb85f4332a4f609cab4ac40709470da05643a082ec1eb88e6d9b97d7"
             ],
             "version": "==1.12.1"
+        },
+        "zipp": {
+            "hashes": [
+                "sha256:102c24ef8f171fd729d46599845e95c7ab894a4cf45f5de11a44cc7444fb1108",
+                "sha256:ed5eee1974372595f9e416cc7bbeeb12335201d8081ca8a0743c954d4446e5cb"
+            ],
+            "markers": "python_version >= '3.6'",
+            "version": "==3.4.0"
         }
     }
 }
-- 
2.29.2


