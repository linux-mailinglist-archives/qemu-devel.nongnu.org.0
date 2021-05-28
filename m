Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5707393BC9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 04:59:57 +0200 (CEST)
Received: from localhost ([::1]:33794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmSj6-0002p8-WF
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 22:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSLQ-0006wl-8C
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:35:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSLN-0001At-6o
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:35:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622169324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DNfWm22xJdNCBygPK267bdS7bV4+OGwVqgWp99pdzjk=;
 b=Vp1mwkHS2Lx+ff0WcNKPNvdJNwmYvc1GQ5kjvfaVTEDZg9OKmrzA2aF+MYRqydAjzXYm67
 A3dsZiD3EEUjIY9kDLGmUlrcEg+MOA1+EZIvNnGz+/fwwrJl3qnbn7rjm/jN7DeTwsdoay
 9Y/vM019/b6AlOFjmoOdP3tfbewd0/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-p-9cAhcjPKSmYh-aW3thtQ-1; Thu, 27 May 2021 22:35:20 -0400
X-MC-Unique: p-9cAhcjPKSmYh-aW3thtQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75882180FD61;
 Fri, 28 May 2021 02:35:19 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DDC91F0C0;
 Fri, 28 May 2021 02:35:17 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 39/44] python: add devel package requirements to setuptools
Date: Thu, 27 May 2021 22:32:15 -0400
Message-Id: <20210528023220.417057-40-jsnow@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Message-id: 20210527211715.394144-27-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
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


