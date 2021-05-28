Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37117393BAD
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 04:51:34 +0200 (CEST)
Received: from localhost ([::1]:33018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmSaz-0008LQ-9B
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 22:51:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSKh-0004WY-Oc
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:34:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSKe-0000X9-LG
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:34:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622169280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fm7BpSmEdxlTGUZ0vKP6Tqy/jvFnPPi4h5hlmKCydrY=;
 b=X576/xeAnME9wdvN1Km+vCqdYqzfO/eEOaHDc3o+jxF3P2Lzrn+Isx2gcL4EwYwnc0dsXT
 PQDQWOuCYOtc+8x0Pzz7Ab+Fpf7UdEKgMKCYFMjVhZXeAID80U865P80HpQJyiCrrc8Dio
 q8lK94pl0Ipu/dBHM98s/K6MiobNB4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460--gVSF9d2OlS76Onfgi0W_A-1; Thu, 27 May 2021 22:34:36 -0400
X-MC-Unique: -gVSF9d2OlS76Onfgi0W_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C303D501E1;
 Fri, 28 May 2021 02:34:35 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36C31E17B;
 Fri, 28 May 2021 02:34:34 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/44] python: add directory structure README.rst files
Date: Thu, 27 May 2021 22:32:01 -0400
Message-Id: <20210528023220.417057-26-jsnow@redhat.com>
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

Add short readmes to python/, python/qemu/, python/qemu/machine,
python/qemu/qmp, and python/qemu/utils that explain the directory
hierarchy. These readmes are visible when browsing the source on
e.g. gitlab/github and are designed to help new developers/users quickly
make sense of the source tree.

They are not designed for inclusion in a published manual.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Message-id: 20210527211715.394144-13-jsnow@redhat.com
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
index 00000000000..38b0c83f321
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
+``setup.py`` in a setuptools specific format. You will generally invoke
+it by doing one of the following:
+
+1. ``pip3 install .`` will install these packages to your current
+   environment. If you are inside a virtual environment, they will
+   install there. If you are not, it will attempt to install to the
+   global environment, which is **not recommended**.
+
+2. ``pip3 install --user .`` will install these packages to your user's
+   local python packages. If you are inside of a virtual environment,
+   this will fail; you likely want the first invocation above.
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
2.31.1


