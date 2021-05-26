Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBE0390D93
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 02:54:34 +0200 (CEST)
Received: from localhost ([::1]:41218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llhof-0001Hv-Er
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 20:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llhNx-0005M4-4Z
 for qemu-devel@nongnu.org; Tue, 25 May 2021 20:26:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llhNq-0007VQ-PC
 for qemu-devel@nongnu.org; Tue, 25 May 2021 20:26:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621988808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XxK27A8uGJHXHRr5a0MJcH6qpSAC07DUgdR0j1cQcKA=;
 b=OeQRV4+hNB/gajH2DzFKKf3DBk2M95/gqFDi0mqftyaglTUMobcO6qYxJxf8wQpn+JvoRB
 MtrBLXeI+JsIsCdtLerW3UEdvU+lgn2O3hQrTCKUZ01Zhzh6AJLhVIZ/7NPSdD+Hz9u7CW
 1hlz/Kq6cuHEdvg2XQ8DT2UVdJ1cwZE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-TIJZ8npSNHGKiOZmI9_f1Q-1; Tue, 25 May 2021 20:26:46 -0400
X-MC-Unique: TIJZ8npSNHGKiOZmI9_f1Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAFD1107ACC7;
 Wed, 26 May 2021 00:26:45 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4096E60D54;
 Wed, 26 May 2021 00:26:44 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 26/31] python: add devel package requirements to setuptools
Date: Tue, 25 May 2021 20:24:49 -0400
Message-Id: <20210526002454.124728-27-jsnow@redhat.com>
In-Reply-To: <20210526002454.124728-1-jsnow@redhat.com>
References: <20210526002454.124728-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 python/PACKAGE.rst  |  4 ++++
 python/README.rst   |  4 ++++
 python/Pipfile      |  5 +----
 python/Pipfile.lock | 14 +++++++++-----
 python/setup.cfg    |  9 +++++++++
 5 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/python/PACKAGE.rst b/python/PACKAGE.rst
index 1bbfe1b58e2..05ea7789fc1 100644
--- a/python/PACKAGE.rst
+++ b/python/PACKAGE.rst
@@ -31,3 +31,7 @@ official `GitLab mirror <https://gitlab.com/qemu-project/qemu>`_.
 Please report bugs on the `QEMU issue tracker
 <https://gitlab.com/qemu-project/qemu/-/issues>`_ and tag ``@jsnow`` in
 the report.
+
+Optional packages necessary for running code quality analysis for this
+package can be installed with the optional dependency group "devel":
+``pip install qemu[devel]``.
diff --git a/python/README.rst b/python/README.rst
index bf9bbca979a..954870973d0 100644
--- a/python/README.rst
+++ b/python/README.rst
@@ -24,6 +24,10 @@ which installs a version of the package that installs a forwarder
 pointing to these files, such that the package always reflects the
 latest version in your git tree.
 
+Installing ".[devel]" instead of "." will additionally pull in required
+packages for testing this package. They are not runtime requirements,
+and are not needed to simply use these libraries.
+
 See `Installing packages using pip and virtual environments
 <https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/>`_
 for more information.
diff --git a/python/Pipfile b/python/Pipfile
index dbe96f71c48..e7acb8cefa4 100644
--- a/python/Pipfile
+++ b/python/Pipfile
@@ -4,10 +4,7 @@ url = "https://pypi.org/simple"
 verify_ssl = true
 
 [dev-packages]
-flake8 = ">=3.6.0"
-isort = ">=5.1.2"
-mypy = ">=0.770"
-pylint = ">=2.8.0"
+qemu = {editable = true, extras = ["devel"], path = "."}
 
 [packages]
 qemu = {editable = true,path = "."}
diff --git a/python/Pipfile.lock b/python/Pipfile.lock
index f0bf576c31e..a2cdc1c50ea 100644
--- a/python/Pipfile.lock
+++ b/python/Pipfile.lock
@@ -1,7 +1,7 @@
 {
     "_meta": {
         "hash": {
-            "sha256": "7c74cc4c2db3a75c954a6686411cda6fd60e464620bb6d5f1ed9a54be61db4cc"
+            "sha256": "eff562a688ebc6f3ffe67494dbb804b883e2159ad81c4d55d96da9f7aec13e91"
         },
         "pipfile-spec": 6,
         "requires": {
@@ -35,7 +35,7 @@
                 "sha256:07528381786f2a6237b061f6e96610a4167b226cb926e2aa2b6b1d78057c576b",
                 "sha256:bf8fd333346d844f616e8d47905ef3a3384edae6b4e9beb0c5101e25e3110907"
             ],
-            "index": "pypi",
+            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3, 3.4'",
             "version": "==3.9.2"
         },
         "importlib-metadata": {
@@ -51,7 +51,7 @@
                 "sha256:0a943902919f65c5684ac4e0154b1ad4fac6dcaa5d9f3426b732f1c8b5419be6",
                 "sha256:2bb1680aad211e3c9944dbce1d4ba09a989f04e238296c87fe2139faa26d655d"
             ],
-            "index": "pypi",
+            "markers": "python_version >= '3.6' and python_version < '4.0'",
             "version": "==5.8.0"
         },
         "lazy-object-proxy": {
@@ -114,7 +114,7 @@
                 "sha256:d65cc1df038ef55a99e617431f0553cd77763869eebdf9042403e16089fe746c",
                 "sha256:d7da2e1d5f558c37d6e8c1246f1aec1e7349e4913d8fb3cb289a35de573fe2eb"
             ],
-            "index": "pypi",
+            "markers": "python_version >= '3.5'",
             "version": "==0.812"
         },
         "mypy-extensions": {
@@ -145,9 +145,13 @@
                 "sha256:586d8fa9b1891f4b725f587ef267abe2a1bad89d6b184520c7f07a253dd6e217",
                 "sha256:f7e2072654a6b6afdf5e2fb38147d3e2d2d43c89f648637baab63e026481279b"
             ],
-            "index": "pypi",
+            "markers": "python_version ~= '3.6'",
             "version": "==2.8.2"
         },
+        "qemu": {
+            "editable": true,
+            "path": "."
+        },
         "toml": {
             "hashes": [
                 "sha256:806143ae5bfb6a3c6e736a764057db0e6a0e05e338b5630894a5f779cabb4f9b",
diff --git a/python/setup.cfg b/python/setup.cfg
index 3f07bd2752d..39dc135e601 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -22,6 +22,15 @@ packages =
     qemu.machine
     qemu.utils
 
+[options.extras_require]
+# Run `pipenv lock --dev` when changing these requirements.
+devel =
+    flake8 >= 3.6.0
+    isort >= 5.1.2
+    mypy >= 0.770
+    pylint >= 2.8.0
+
+
 [flake8]
 extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
 exclude = __pycache__,
-- 
2.31.1


