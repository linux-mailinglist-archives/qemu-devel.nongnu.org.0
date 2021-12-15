Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A19AE476489
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 22:26:10 +0100 (CET)
Received: from localhost ([::1]:45166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxbmr-000827-MO
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 16:26:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbXP-00051w-Lo
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:10:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbXM-0006kV-L2
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:10:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639602604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GWcQol1Jk92w9tKgGrrWMCOPqyPm+ZesMM8bjRETBnY=;
 b=g/r++U/4O5wsIWsqjFGWNGv7yNBABTtMX/babTPKlxGq6HkE7bJWHkTSr/0xxoUjjT48pj
 qU3s9zDDCwDBYP9V4tSOGLe+o1N4Ho/EQaqfIVC+KKl4qly5Gja/52EmuMWNxZozWRTfLC
 OBpw98fEdOAyMlfZjISinWzGJBQBcH0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-hRl_q9mqOiaFcuIb5cbxuA-1; Wed, 15 Dec 2021 16:09:58 -0500
X-MC-Unique: hRl_q9mqOiaFcuIb5cbxuA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 358381808337;
 Wed, 15 Dec 2021 21:09:57 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A1DF47367;
 Wed, 15 Dec 2021 21:09:56 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC qemu.qmp PATCH 16/24] Add setuptools_scm package versioning
Date: Wed, 15 Dec 2021 16:06:26 -0500
Message-Id: <20211215210634.3779791-17-jsnow@redhat.com>
In-Reply-To: <20211215210634.3779791-1-jsnow@redhat.com>
References: <20211215210634.3779791-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The version number will now be generated using the setuptools_scm
package, which pulls the version number from git tags.

As PEP660 is not yet usable with pyproject.toml style packages, we will
be sticking to setup.py style installation for now.

"version = 0.0.0" exists as a fallback in the event that the
build/installation environment does not have setuptools_scm
installed. Further, if setuptools_scm *is* installed but we are trying
to install directly from a source tarball (instead of from a python
source distribution), 'fallback_version': '0.0.0' will be utilized as
the fallback.

Lastly, tag this release as v0.0.0 to give setuptools_scm something to
work with and establish precedent for future releases.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 .gitlab-ci.d/build.yml         |  2 +-
 .gitlab-ci.d/python.Dockerfile |  1 +
 INDEX.rst                      |  2 --
 MANIFEST.in                    |  1 -
 VERSION                        |  1 -
 setup.cfg                      |  3 ++-
 setup.py                       | 11 ++++++++++-
 7 files changed, 14 insertions(+), 7 deletions(-)
 delete mode 100644 VERSION

diff --git a/.gitlab-ci.d/build.yml b/.gitlab-ci.d/build.yml
index 6a68408..bf2d487 100644
--- a/.gitlab-ci.d/build.yml
+++ b/.gitlab-ci.d/build.yml
@@ -10,4 +10,4 @@ build-package:
     paths:
       - dist/*
   variables:
-    GIT_DEPTH: 1
+    GIT_DEPTH: 0
\ No newline at end of file
diff --git a/.gitlab-ci.d/python.Dockerfile b/.gitlab-ci.d/python.Dockerfile
index 35d84f3..93661b2 100644
--- a/.gitlab-ci.d/python.Dockerfile
+++ b/.gitlab-ci.d/python.Dockerfile
@@ -25,6 +25,7 @@ RUN dnf --setopt=install_weak_deps=False install -y \
     && python3 -m pip install --upgrade \
         build \
         pip \
+        setuptools_scm \
         twine \
     && dnf clean all \
     && rm -rf ~/.cache/pip \
diff --git a/INDEX.rst b/INDEX.rst
index 8b7a56a..dddfcde 100644
--- a/INDEX.rst
+++ b/INDEX.rst
@@ -62,5 +62,3 @@ Files in this directory
 - ``README.rst`` is used as the README file that is visible on PyPI.org.
 - ``setup.cfg`` houses setuptools package configuration.
 - ``setup.py`` is the setuptools installer used by pip; See above.
-- ``VERSION`` contains the PEP-440 compliant version used to describe
-  this package; it is referenced by ``setup.cfg``.
diff --git a/MANIFEST.in b/MANIFEST.in
index 2a3fc58..9561fb1 100644
--- a/MANIFEST.in
+++ b/MANIFEST.in
@@ -1,2 +1 @@
-include VERSION
 include README.rst
diff --git a/VERSION b/VERSION
deleted file mode 100644
index 7741e1a..0000000
--- a/VERSION
+++ /dev/null
@@ -1 +0,0 @@
-0.0.0a1
diff --git a/setup.cfg b/setup.cfg
index f4a02d6..03dd4f0 100644
--- a/setup.cfg
+++ b/setup.cfg
@@ -1,6 +1,6 @@
 [metadata]
 name = qemu.qmp
-version = file:VERSION
+version = 0.0.0
 author = John Snow
 author_email = jsnow@redhat.com
 maintainer = QEMU Project
@@ -26,6 +26,7 @@ classifiers =
     Typing :: Typed
 
 [options]
+setup_requires = setuptools_scm
 python_requires = >= 3.6
 packages =
     qemu.qmp
diff --git a/setup.py b/setup.py
index cb9b9b6..5904d07 100755
--- a/setup.py
+++ b/setup.py
@@ -7,6 +7,12 @@ Copyright (c) 2020-2021 John Snow for Red Hat, Inc.
 import setuptools
 import pkg_resources
 
+try:
+    import setuptools_scm
+    _HAVE_SCM = True
+except ModuleNotFoundError:
+    _HAVE_SCM = False
+
 
 def main():
     """
@@ -16,7 +22,10 @@ def main():
     # https://medium.com/@daveshawley/safely-using-setup-cfg-for-metadata-1babbe54c108
     pkg_resources.require('setuptools>=39.2')
 
-    setuptools.setup()
+    if _HAVE_SCM:
+        setuptools.setup(use_scm_version={'fallback_version': '0.0.0'})
+    else:
+        setuptools.setup()
 
 
 if __name__ == '__main__':
-- 
2.31.1


