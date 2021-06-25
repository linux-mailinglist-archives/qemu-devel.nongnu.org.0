Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39133B46FE
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 17:52:19 +0200 (CEST)
Received: from localhost ([::1]:34894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwo7u-0004jM-WC
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 11:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwo28-0000vV-Lo
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 11:46:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwo26-0007cz-Gf
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 11:46:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624635978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RQzKmHNM6ckkkGj5OBnmoYolksrFNTOh+bokivLpvGk=;
 b=OuTmTHKDD2dPewbS1wtJQ1CN9xUVjJ5Lt5yRPOvp7gMsMc1GKGBYMotUeiNoGd0lB7O6FE
 p60g52PZFsSoljZZfdBWYyHe3+pP6X/GQoIvAtw9oXu687J12nhHtcQ3Ls8+bs1HS6enSX
 8epmJWpBN4wkSnvNnZXX4f4xdWJMOh8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-ljEqMyYkPAWDmnhKxbr1_A-1; Fri, 25 Jun 2021 11:46:16 -0400
X-MC-Unique: ljEqMyYkPAWDmnhKxbr1_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 413CE1084F59;
 Fri, 25 Jun 2021 15:46:15 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12ABB1A872;
 Fri, 25 Jun 2021 15:46:06 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/11] python: rename 'venv-check' target to 'check-pipenv'
Date: Fri, 25 Jun 2021 11:45:35 -0400
Message-Id: <20210625154540.783306-7-jsnow@redhat.com>
In-Reply-To: <20210625154540.783306-1-jsnow@redhat.com>
References: <20210625154540.783306-1-jsnow@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Well, Cleber was right, this is a better name.

In preparation for adding a different kind of virtual environment check
(One that simply uses whichever version of Python you happen to have),
rename this test 'check-pipenv' so that it matches the CI job
'check-python-pipenv'.

Remove the "If you don't know which test to run" hint, because it's not
actually likely you have Python 3.6 installed to be able to run the
test. It's still the test I'd most prefer you to run, but it's not the
test you are most likely to be able to run.

Rename the 'venv' target to 'pipenv' as well, and move the more
pertinent help text under the 'check-pipenv' target.
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/README.rst              |  2 +-
 .gitlab-ci.d/static_checks.yml |  2 +-
 python/Makefile                | 21 +++++++++++----------
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/python/README.rst b/python/README.rst
index d4502fdb60..9c1fceaee7 100644
--- a/python/README.rst
+++ b/python/README.rst
@@ -79,7 +79,7 @@ Files in this directory
 - ``PACKAGE.rst`` is used as the README file that is visible on PyPI.org.
 - ``Pipfile`` is used by Pipenv to generate ``Pipfile.lock``.
 - ``Pipfile.lock`` is a set of pinned package dependencies that this package
-  is tested under in our CI suite. It is used by ``make venv-check``.
+  is tested under in our CI suite. It is used by ``make check-pipenv``.
 - ``README.rst`` you are here!
 - ``VERSION`` contains the PEP-440 compliant version used to describe
   this package; it is referenced by ``setup.cfg``.
diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
index 7e685c6a65..8c7dc41abd 100644
--- a/.gitlab-ci.d/static_checks.yml
+++ b/.gitlab-ci.d/static_checks.yml
@@ -33,7 +33,7 @@ check-python-pipenv:
   stage: test
   image: $CI_REGISTRY_IMAGE/qemu/python:latest
   script:
-    - make -C python venv-check
+    - make -C python check-pipenv
   variables:
     GIT_DEPTH: 1
   needs:
diff --git a/python/Makefile b/python/Makefile
index b5621b0d54..07ad73ccd0 100644
--- a/python/Makefile
+++ b/python/Makefile
@@ -1,15 +1,13 @@
-.PHONY: help venv venv-check check clean distclean develop
+.PHONY: help pipenv check-pipenv check clean distclean develop
 
 help:
 	@echo "python packaging help:"
 	@echo ""
-	@echo "make venv:       Create pipenv's virtual environment."
-	@echo "    NOTE: Requires Python 3.6 and pipenv."
-	@echo "          Will download packages from PyPI."
-	@echo "    Hint: (On Fedora): 'sudo dnf install python36 pipenv'"
-	@echo ""
-	@echo "make venv-check: run linters using pipenv's virtual environment."
-	@echo "    Hint: If you don't know which test to run, run this one!"
+	@echo "make check-pipenv:"
+	@echo "    Run tests in pipenv's virtual environment."
+	@echo "    These tests use the oldest dependencies."
+	@echo "    Requires: Python 3.6 and pipenv."
+	@echo "    Hint (Fedora): 'sudo dnf install python3.6 pipenv'"
 	@echo ""
 	@echo "make develop:    Install deps for 'make check', and"
 	@echo "                 the qemu libs in editable/development mode."
@@ -18,18 +16,21 @@ help:
 	@echo ""
 	@echo "make check-tox:  run linters using multiple python versions."
 	@echo ""
+	@echo "make pipenv"
+	@echo "    Creates pipenv's virtual environment (.venv)"
+	@echo ""
 	@echo "make clean:      remove package build output."
 	@echo ""
 	@echo "make distclean:  remove venv files, qemu package forwarder,"
 	@echo "                 built distribution files, and everything"
 	@echo "                 from 'make clean'."
 
-venv: .venv
+pipenv: .venv
 .venv: Pipfile.lock
 	@PIPENV_VENV_IN_PROJECT=1 pipenv sync --dev --keep-outdated
 	@touch .venv
 
-venv-check: venv
+check-pipenv: pipenv
 	@pipenv run make check
 
 develop:
-- 
2.31.1


