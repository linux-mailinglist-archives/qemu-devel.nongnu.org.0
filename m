Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFC237EF77
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 01:20:03 +0200 (CEST)
Received: from localhost ([::1]:33128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgy94-0007y4-4e
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 19:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy2i-0001jF-En
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:13:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy2W-00064T-5S
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:13:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620861195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/tX3sZAPAQXfGBaHNALo/QRnRZb5ACjTsPglp2CwzuU=;
 b=HVVwnkbNKK0d6ZkQ/etx3MD+w9EU5371MEfZhpooX6IEFdDbSVJCJq/Wxc740MLB+u1NIH
 YvAgt6yYZmbPm119BMt0DckrdEfA4EbuAcvfhKuL0IyRoTG9S9+Hx2zZ3xYtQDV6p42LHK
 zx7EzUqfyU1WCZOUj1B2MugUAsE/ig8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-OzLz1e11Nx6DY4QKGHY5DQ-1; Wed, 12 May 2021 19:13:13 -0400
X-MC-Unique: OzLz1e11Nx6DY4QKGHY5DQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 116C664149;
 Wed, 12 May 2021 23:13:12 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 213DC62A02;
 Wed, 12 May 2021 23:13:03 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 06/25] python: add directory structure README.rst files
Date: Wed, 12 May 2021 19:12:22 -0400
Message-Id: <20210512231241.2816122-7-jsnow@redhat.com>
In-Reply-To: <20210512231241.2816122-1-jsnow@redhat.com>
References: <20210512231241.2816122-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add short readmes to python/, python/qemu/, python/qemu/machine,
python/qemu/qmp, and python/qemu/utils that explain the directory
hierarchy. These readmes are visible when browsing the source on
e.g. gitlab/github and are designed to help new developers/users quickly
make sense of the source tree.

They are not designed for inclusion in a published manual.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/README.rst              | 41 ++++++++++++++++++++++++++++++++++
 python/qemu/README.rst         |  8 +++++++
 python/qemu/machine/README.rst |  9 ++++++++
 python/qemu/qmp/README.rst     |  9 ++++++++
 python/qemu/utils/README.rst   |  7 ++++++
 5 files changed, 74 insertions(+)
 create mode 100644 python/README.rst
 create mode 100644 python/qemu/README.rst
 create mode 100644 python/qemu/machine/README.rst
 create mode 100644 python/qemu/qmp/README.rst
 create mode 100644 python/qemu/utils/README.rst

diff --git a/python/README.rst b/python/README.rst
new file mode 100644
index 00000000000..7a0dc5dff4a
--- /dev/null
+++ b/python/README.rst
@@ -0,0 +1,41 @@
+QEMU Python Tooling
+===================
+
+This directory houses Python tooling used by the QEMU project to build,
+configure, and test QEMU. It is organized by namespace (``qemu``), and
+then by package (e.g. ``qemu/machine``, ``qemu/qmp``, etc).
+
+``setup.py`` is used by ``pip`` to install this tooling to the current
+environment. ``setup.cfg`` provides the packaging configuration used by
+setup.py in a setuptools specific format. You will generally invoke it
+by doing one of the following:
+
+1. ``pip3 install .`` will install these packages to your current
+   environment. If you are inside a virtual environment, they will
+   install there. If you are not, it will attempt to install to the
+   global environment, which is not recommended.
+
+2. ``pip3 install --user .`` will install these packages to your user's
+   local python packages. If you are inside of a virtual environment,
+   this will fail.
+
+If you append the ``-e`` argument, pip will install in "editable" mode;
+which installs a version of the package that installs a forwarder
+pointing to these files, such that the package always reflects the
+latest version in your git tree.
+
+See `Installing packages using pip and virtual environments
+<https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/>`_
+for more information.
+
+
+Files in this directory
+-----------------------
+
+- ``qemu/`` Python package source directory.
+- ``PACKAGE.rst`` is used as the README file that is visible on PyPI.org.
+- ``README.rst`` you are here!
+- ``VERSION`` contains the PEP-440 compliant version used to describe
+  this package; it is referenced by ``setup.cfg``.
+- ``setup.cfg`` houses setuptools package configuration.
+- ``setup.py`` is the setuptools installer used by pip; See above.
diff --git a/python/qemu/README.rst b/python/qemu/README.rst
new file mode 100644
index 00000000000..d04943f526c
--- /dev/null
+++ b/python/qemu/README.rst
@@ -0,0 +1,8 @@
+QEMU Python Namespace
+=====================
+
+This directory serves as the root of a `Python PEP 420 implicit
+namespace package <https://www.python.org/dev/peps/pep-0420/>`_.
+
+Each directory below is assumed to be an installable Python package that
+is available under the ``qemu.<package>`` namespace.
diff --git a/python/qemu/machine/README.rst b/python/qemu/machine/README.rst
new file mode 100644
index 00000000000..ac2b4fffb42
--- /dev/null
+++ b/python/qemu/machine/README.rst
@@ -0,0 +1,9 @@
+qemu.machine package
+====================
+
+This package provides core utilities used for testing and debugging
+QEMU. It is used by the iotests, vm tests, acceptance tests, and several
+other utilities in the ./scripts directory. It is not a fully-fledged
+SDK and it is subject to change at any time.
+
+See the documentation in ``__init__.py`` for more information.
diff --git a/python/qemu/qmp/README.rst b/python/qemu/qmp/README.rst
new file mode 100644
index 00000000000..c21951491cf
--- /dev/null
+++ b/python/qemu/qmp/README.rst
@@ -0,0 +1,9 @@
+qemu.qmp package
+================
+
+This package provides a library used for connecting to and communicating
+with QMP servers. It is used extensively by iotests, vm tests,
+acceptance tests, and other utilities in the ./scripts directory. It is
+not a fully-fledged SDK and is subject to change at any time.
+
+See the documentation in ``__init__.py`` for more information.
diff --git a/python/qemu/utils/README.rst b/python/qemu/utils/README.rst
new file mode 100644
index 00000000000..975fbf4d7de
--- /dev/null
+++ b/python/qemu/utils/README.rst
@@ -0,0 +1,7 @@
+qemu.utils package
+==================
+
+This package provides miscellaneous utilities used for testing and
+debugging QEMU. It is used primarily by the vm and acceptance tests.
+
+See the documentation in ``__init__.py`` for more information.
-- 
2.30.2


