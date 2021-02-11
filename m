Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDF33192D6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 20:11:23 +0100 (CET)
Received: from localhost ([::1]:36414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAHN4-0003oH-Hg
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 14:11:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHCR-0004Vn-Fs
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:00:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHC8-0005Zp-Q6
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:00:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613070001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B8FWENgVuebHzIBDl7tQsVVg9D1E9aQ7m6/SmLOdfVc=;
 b=PFi7cxWNIEeEHlGrhmuO4MZAsw18wS8PXxopmxiBS1U8/Uj5js8EcszttWaQRFAYWTrMn6
 Dxo/NJu8EhL/tWu7DShh78cHdNCzAvyCnubroJAfYHxKmO8Hj2uwpccchRTvfJ1Qy0xy4T
 WKj25mLcitMCBf2mLdK2sOiAFZAlcTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-Rgx14UHZNlOtMT2bDVb_qw-1; Thu, 11 Feb 2021 13:59:58 -0500
X-MC-Unique: Rgx14UHZNlOtMT2bDVb_qw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B10C21005263;
 Thu, 11 Feb 2021 18:59:38 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C5737A5C4;
 Thu, 11 Feb 2021 18:59:37 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/24] python: add directory structure README.rst files
Date: Thu, 11 Feb 2021 13:58:39 -0500
Message-Id: <20210211185856.3975616-8-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 python/qemu/utils/README.rst   |  9 ++++++++
 5 files changed, 76 insertions(+)
 create mode 100644 python/README.rst
 create mode 100644 python/qemu/README.rst
 create mode 100644 python/qemu/machine/README.rst
 create mode 100644 python/qemu/qmp/README.rst
 create mode 100644 python/qemu/utils/README.rst

diff --git a/python/README.rst b/python/README.rst
new file mode 100644
index 00000000000..6a14b99e104
--- /dev/null
+++ b/python/README.rst
@@ -0,0 +1,41 @@
+QEMU Python Tooling
+===================
+
+This directory houses Python tooling used by the QEMU project to build,
+configure, and test QEMU. It is organized by namespace (``qemu``), and
+then by package (``qemu/machine``, ``qemu/qmp``).
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
+If you amend the ``-e`` argument, pip will install in "editable" mode;
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
index 00000000000..4b33c1f27e1
--- /dev/null
+++ b/python/qemu/utils/README.rst
@@ -0,0 +1,9 @@
+qemu.utils package
+==================
+
+This package provides misc utilities used for testing and debugging
+QEMU. It is used most directly by the qemu.machine package, but has some
+uses by the vm and acceptance tests for determining accelerator support.
+
+See the documentation in ``__init__.py`` and ``accel.py`` for more
+information.
-- 
2.29.2


