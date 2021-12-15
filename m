Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 465C8476460
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 22:13:26 +0100 (CET)
Received: from localhost ([::1]:36082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxbaX-0008Be-BU
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 16:13:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbWB-0003nk-K9
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:08:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbW9-0006a9-E8
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:08:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639602529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kd/QMZTJRWqNCqZD8J54v9wD0Pnaw+cmCN9DgoVQIFY=;
 b=FK78Drr1Kotts2KamZ0CFeyu20sEoCCCzqQDQ/P2QIFy0pV5l9HtOcp6x0j3OYEtboCj8F
 R7oE9GsOSPMl9cSt7VFteyqrLEoZ9riliz08YppHGkq59On1mObsW4jjxuiZyXudmQvjP4
 04RUOQm3/3ejeqhiGLN5/BFePVuBqfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-YPgXwgkkMKicyKTbWjkLcA-1; Wed, 15 Dec 2021 16:08:47 -0500
X-MC-Unique: YPgXwgkkMKicyKTbWjkLcA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 203371054F90;
 Wed, 15 Dec 2021 21:08:46 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A3975F4E9;
 Wed, 15 Dec 2021 21:08:45 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC qemu.qmp PATCH 06/24] Move README.rst to INDEX.rst and update
Date: Wed, 15 Dec 2021 16:06:16 -0500
Message-Id: <20211215210634.3779791-7-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The intent is to use README.rst as the new package-level readme that
will be bundled with the source; so move the old "git level readme" over
to INDEX.rst instead, and update it accordingly.

This is primarily here to just document and explain what all the little
bits and pieces of files in the root are and what they do. I find this
stuff helpful when I wander over into other projects, so I'd like to
extend the same courtesy.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 README.rst => INDEX.rst | 49 +++++++++++------------------------------
 MANIFEST.in             |  1 -
 2 files changed, 13 insertions(+), 37 deletions(-)
 rename README.rst => INDEX.rst (64%)

diff --git a/README.rst b/INDEX.rst
similarity index 64%
rename from README.rst
rename to INDEX.rst
index 9c1fcea..45b0dbf 100644
--- a/README.rst
+++ b/INDEX.rst
@@ -1,9 +1,14 @@
-QEMU Python Tooling
+qemu.qmp File Index
 ===================
 
-This directory houses Python tooling used by the QEMU project to build,
-configure, and test QEMU. It is organized by namespace (``qemu``), and
-then by package (e.g. ``qemu/machine``, ``qemu/qmp``, etc).
+This file is here to explain the purpose of all the little bits and
+pieces of project files in the root directory and how they are
+used. It's useful info for those contributing to this project, but not
+so much for those who just want to use the library.
+
+
+Much ado about packaging
+------------------------
 
 ``setup.py`` is used by ``pip`` to install this tooling to the current
 environment. ``setup.cfg`` provides the packaging configuration used by
@@ -20,7 +25,7 @@ environment. ``setup.cfg`` provides the packaging configuration used by
 
 If you append the ``--editable`` or ``-e`` argument to either invocation
 above, pip will install in "editable" mode. This installs the package as
-a forwarder ("qemu.egg-link") that points to the source tree. In so
+a forwarder ("qemu.qmp.egg-link") that points to the source tree. In so
 doing, the installed package always reflects the latest version in your
 source tree.
 
@@ -37,34 +42,6 @@ See `Installing packages using pip and virtual environments
 for more information.
 
 
-Using these packages without installing them
---------------------------------------------
-
-These packages may be used without installing them first, by using one
-of two tricks:
-
-1. Set your PYTHONPATH environment variable to include this source
-   directory, e.g. ``~/src/qemu/python``. See
-   https://docs.python.org/3/using/cmdline.html#envvar-PYTHONPATH
-
-2. Inside a Python script, use ``sys.path`` to forcibly include a search
-   path prior to importing the ``qemu`` namespace. See
-   https://docs.python.org/3/library/sys.html#sys.path
-
-A strong downside to both approaches is that they generally interfere
-with static analysis tools being able to locate and analyze the code
-being imported.
-
-Package installation also normally provides executable console scripts,
-so that tools like ``qmp-shell`` are always available via $PATH. To
-invoke them without installation, you can invoke e.g.:
-
-``> PYTHONPATH=~/src/qemu/python python3 -m qemu.qmp.qmp_shell``
-
-The mappings between console script name and python module path can be
-found in ``setup.cfg``.
-
-
 Files in this directory
 -----------------------
 
@@ -72,6 +49,7 @@ Files in this directory
 - ``tests/`` Python package tests directory.
 - ``avocado.cfg`` Configuration for the Avocado test-runner.
   Used by ``make check`` et al.
+- ``INDEX.rst`` you are here!
 - ``Makefile`` provides some common testing/installation invocations.
   Try ``make help`` to see available targets.
 - ``MANIFEST.in`` is read by python setuptools, it specifies additional files
@@ -80,8 +58,7 @@ Files in this directory
 - ``Pipfile`` is used by Pipenv to generate ``Pipfile.lock``.
 - ``Pipfile.lock`` is a set of pinned package dependencies that this package
   is tested under in our CI suite. It is used by ``make check-pipenv``.
-- ``README.rst`` you are here!
-- ``VERSION`` contains the PEP-440 compliant version used to describe
-  this package; it is referenced by ``setup.cfg``.
 - ``setup.cfg`` houses setuptools package configuration.
 - ``setup.py`` is the setuptools installer used by pip; See above.
+- ``VERSION`` contains the PEP-440 compliant version used to describe
+  this package; it is referenced by ``setup.cfg``.
diff --git a/MANIFEST.in b/MANIFEST.in
index 7059ad2..639caae 100644
--- a/MANIFEST.in
+++ b/MANIFEST.in
@@ -1,3 +1,2 @@
 include VERSION
 include PACKAGE.rst
-exclude README.rst
-- 
2.31.1


