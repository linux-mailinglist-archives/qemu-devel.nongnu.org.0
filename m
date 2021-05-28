Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE36393B8F
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 04:46:58 +0200 (CEST)
Received: from localhost ([::1]:41456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmSWX-00038F-C1
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 22:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSLb-0007K3-3W
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:35:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSLY-0001Lp-Rq
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:35:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622169336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9NiaQQRSh7KJm/gDNbndLoc1H2YQwCH2KUeaelu6OhI=;
 b=eYF5iWIrf66MW/6+gcLZEm7gh2lDPBWEA4QxlpYcEwhiJKmxs0/izMQpBdZAGOuDkNmO80
 iBN1TmaQlJDridD3AVFXGhC0G+09sNFk9jawTW6xPUdmYdNkiAGZDU7O3Bk8bF9u80RMVN
 K+UqPdBEkGQKp4C22/+ry5d/pWuyGls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-btVKf_YYPPuIcwH_JIpW0Q-1; Thu, 27 May 2021 22:35:25 -0400
X-MC-Unique: btVKf_YYPPuIcwH_JIpW0Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 358351005D56;
 Fri, 28 May 2021 02:35:24 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BF00E2C7;
 Fri, 28 May 2021 02:35:21 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 41/44] python: add Makefile for some common tasks
Date: Thu, 27 May 2021 22:32:17 -0400
Message-Id: <20210528023220.417057-42-jsnow@redhat.com>
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

Add "make venv" to create the pipenv-managed virtual environment that
contains our explicitly pinned dependencies.

Add "make check" to run the python linters [in the host execution
environment].

Add "make venv-check" which combines the above two: create/update the
venv, then run the linters in that explicitly managed environment.

Add "make develop" which canonizes the runes needed to get both the
linting pre-requisites (the "[devel]" part), and the editable
live-install (the "-e" part) of these python libraries.

make clean: delete miscellaneous python packaging output possibly
created by pipenv, pip, or other python packaging utilities

make distclean: delete the above, the .venv, and the editable "qemu"
package forwarder (qemu.egg-info) if there is one.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
Message-id: 20210527211715.394144-29-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/PACKAGE.rst |  6 ++++++
 python/README.rst  |  6 ++++++
 python/Makefile    | 43 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+)
 create mode 100644 python/Makefile

diff --git a/python/PACKAGE.rst b/python/PACKAGE.rst
index 05ea7789fc1..b0b86cc4c31 100644
--- a/python/PACKAGE.rst
+++ b/python/PACKAGE.rst
@@ -35,3 +35,9 @@ the report.
 Optional packages necessary for running code quality analysis for this
 package can be installed with the optional dependency group "devel":
 ``pip install qemu[devel]``.
+
+``make develop`` can be used to install this package in editable mode
+(to the current environment) *and* bring in testing dependencies in one
+command.
+
+``make check`` can be used to run the available tests.
diff --git a/python/README.rst b/python/README.rst
index 6bd2c6b3547..dcf993819db 100644
--- a/python/README.rst
+++ b/python/README.rst
@@ -28,6 +28,9 @@ Installing ".[devel]" instead of "." will additionally pull in required
 packages for testing this package. They are not runtime requirements,
 and are not needed to simply use these libraries.
 
+Running ``make develop`` will pull in all testing dependencies and
+install QEMU in editable mode to the current environment.
+
 See `Installing packages using pip and virtual environments
 <https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/>`_
 for more information.
@@ -39,6 +42,9 @@ Files in this directory
 - ``qemu/`` Python package source directory.
 - ``tests/`` Python package tests directory.
 - ``avocado.cfg`` Configuration for the Avocado test-runner.
+  Used by ``make check`` et al.
+- ``Makefile`` provides some common testing/installation invocations.
+  Try ``make help`` to see available targets.
 - ``MANIFEST.in`` is read by python setuptools, it specifies additional files
   that should be included by a source distribution.
 - ``PACKAGE.rst`` is used as the README file that is visible on PyPI.org.
diff --git a/python/Makefile b/python/Makefile
new file mode 100644
index 00000000000..a9da1689558
--- /dev/null
+++ b/python/Makefile
@@ -0,0 +1,43 @@
+.PHONY: help venv venv-check check clean distclean develop
+
+help:
+	@echo "python packaging help:"
+	@echo ""
+	@echo "make venv:       Create pipenv's virtual environment."
+	@echo "    NOTE: Requires Python 3.6 and pipenv."
+	@echo "          Will download packages from PyPI."
+	@echo "    Hint: (On Fedora): 'sudo dnf install python36 pipenv'"
+	@echo ""
+	@echo "make venv-check: run linters using pipenv's virtual environment."
+	@echo "    Hint: If you don't know which test to run, run this one!"
+	@echo ""
+	@echo "make develop:    Install deps for 'make check', and"
+	@echo "                 the qemu libs in editable/development mode."
+	@echo ""
+	@echo "make check:      run linters using the current environment."
+	@echo ""
+	@echo "make clean:      remove package build output."
+	@echo ""
+	@echo "make distclean:  remove venv files, qemu package forwarder,"
+	@echo "                 built distribution files, and everything"
+	@echo "                 from 'make clean'."
+
+venv: .venv
+.venv: Pipfile.lock
+	@PIPENV_VENV_IN_PROJECT=1 pipenv sync --dev --keep-outdated
+	@touch .venv
+
+venv-check: venv
+	@pipenv run make check
+
+develop:
+	pip3 install -e .[devel]
+
+check:
+	@avocado --config avocado.cfg run tests/
+
+clean:
+	python3 setup.py clean --all
+
+distclean: clean
+	rm -rf qemu.egg-info/ .venv/ dist/
-- 
2.31.1


