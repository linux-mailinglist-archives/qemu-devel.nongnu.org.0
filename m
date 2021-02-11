Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD2E319334
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 20:37:37 +0100 (CET)
Received: from localhost ([::1]:33784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAHmS-0005B3-TW
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 14:37:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHCu-0004w2-22
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:00:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHCS-0005e5-Md
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:00:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613070009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bzr+mzP91oNsCjVF80mDSIpIsuSJkrf11WIlRT92Vik=;
 b=WPkL0iNbg+DzcjFlttpQCV4ddESvkA2tAltUAFksyFRK3VE75blTFga9ZRy0q3C9U6kJoK
 pU8i/ltksMFTyXTzSzeopobYw2lrxOugVhlE7XWlzXyulH/g8r/NO9CrSKXKOUh/twUsS/
 qZiEYFg7s4k/x/Pf8EJfJOssqurJmUo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-MSSdy5j7NzS6PHlD-zJi6Q-1; Thu, 11 Feb 2021 14:00:06 -0500
X-MC-Unique: MSSdy5j7NzS6PHlD-zJi6Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8480785B6CA;
 Thu, 11 Feb 2021 18:59:58 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 134A63828;
 Thu, 11 Feb 2021 18:59:56 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 19/24] python: add devel package requirements to setuptools
Date: Thu, 11 Feb 2021 13:58:51 -0500
Message-Id: <20210211185856.3975616-20-jsnow@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

setuptools doesn't have a formal understanding of development requires,
but it has an optional feataures section. Fine; add a "devel" feature
and add the requirements to it.

To avoid duplication, we can modify pipenv to install qemu[devel]
instead. This enables us to run invocations like "pip install -e
.[devel]" and test the package on bleeding-edge packages beyond those
specified in Pipfile.lock.

Importantly, this also allows us to install the qemu development
packages in a non-networked mode: `pip3 install --no-index -e .[devel]`
will now fail if the proper development dependencies are not already
met. This can be useful for automated build scripts where fetching
network packages may be undesirable.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Pipfile      |  5 +----
 python/Pipfile.lock | 14 +++++++++-----
 python/setup.cfg    |  9 +++++++++
 3 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/python/Pipfile b/python/Pipfile
index 214fb175e7a..e7acb8cefa4 100644
--- a/python/Pipfile
+++ b/python/Pipfile
@@ -4,10 +4,7 @@ url = "https://pypi.org/simple"
 verify_ssl = true
 
 [dev-packages]
-flake8 = ">=3.6.0"
-isort = ">=5.0.5"
-mypy = ">=0.770"
-pylint = ">=2.6.0"
+qemu = {editable = true, extras = ["devel"], path = "."}
 
 [packages]
 qemu = {editable = true,path = "."}
diff --git a/python/Pipfile.lock b/python/Pipfile.lock
index 4b4402f49e5..85b3124a491 100644
--- a/python/Pipfile.lock
+++ b/python/Pipfile.lock
@@ -1,7 +1,7 @@
 {
     "_meta": {
         "hash": {
-            "sha256": "e38d142c3fadc2f2ed849e86f7ebd14e25974dc12228751490aef5a9ee074f2f"
+            "sha256": "eff562a688ebc6f3ffe67494dbb804b883e2159ad81c4d55d96da9f7aec13e91"
         },
         "pipfile-spec": 6,
         "requires": {
@@ -35,7 +35,7 @@
                 "sha256:749dbbd6bfd0cf1318af27bf97a14e28e5ff548ef8e5b1566ccfb25a11e7c839",
                 "sha256:aadae8761ec651813c24be05c6f7b4680857ef6afaae4651a4eccaef97ce6c3b"
             ],
-            "index": "pypi",
+            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3'",
             "version": "==3.8.4"
         },
         "importlib-metadata": {
@@ -51,7 +51,7 @@
                 "sha256:c729845434366216d320e936b8ad6f9d681aab72dc7cbc2d51bedc3582f3ad1e",
                 "sha256:fff4f0c04e1825522ce6949973e83110a6e907750cd92d128b0d14aaaadbffdc"
             ],
-            "index": "pypi",
+            "markers": "python_version >= '3.6' and python_version < '4.0'",
             "version": "==5.7.0"
         },
         "lazy-object-proxy": {
@@ -113,7 +113,7 @@
                 "sha256:e497a544391f733eca922fdcb326d19e894789cd4ff61d48b4b195776476c5cf",
                 "sha256:f5fdf935a46aa20aa937f2478480ebf4be9186e98e49cc3843af9a5795a49a25"
             ],
-            "index": "pypi",
+            "markers": "python_version >= '3.5'",
             "version": "==0.800"
         },
         "mypy-extensions": {
@@ -144,9 +144,13 @@
                 "sha256:bb4a908c9dadbc3aac18860550e870f58e1a02c9f2c204fdf5693d73be061210",
                 "sha256:bfe68f020f8a0fece830a22dd4d5dddb4ecc6137db04face4c3420a46a52239f"
             ],
-            "index": "pypi",
+            "markers": "python_version >= '3.5'",
             "version": "==2.6.0"
         },
+        "qemu": {
+            "editable": true,
+            "path": "."
+        },
         "six": {
             "hashes": [
                 "sha256:30639c035cdb23534cd4aa2dd52c3bf48f06e5f4a941509c8bafd8ce11080259",
diff --git a/python/setup.cfg b/python/setup.cfg
index bc90d52b9ca..11c361501e8 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -19,6 +19,15 @@ classifiers =
 python_requires = >= 3.6
 packages = find_namespace:
 
+[options.extras_require]
+# Run `pipenv lock` when changing these requirements.
+devel =
+    flake8 >= 3.6.0
+    isort >= 5.0.5
+    mypy >= 0.770
+    pylint >= 2.6.0
+
+
 [flake8]
 extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
 
-- 
2.29.2


