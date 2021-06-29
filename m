Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2533B76AB
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 18:49:23 +0200 (CEST)
Received: from localhost ([::1]:59700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyGvK-0004KJ-7r
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 12:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyGpX-0003xO-Ue
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 12:43:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyGpU-0006Dt-Cx
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 12:43:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624984999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=83Ni4ceOLgyH8Mk2QxTTbQdfGXabSBlLRIhO+G07/TE=;
 b=IWLoY6W/MG5Ls9zaJ6BUyHMB0oendjN5VRu3EBMxyGTQfviQCItg2ALh0dutJkVaQYr8Kk
 fXyvXTzO8seIDz+jMsZRJW438gKUH5+Ab9k8vfeiAFPYQdEkOgpmqZUwpbCzSYo26GERv1
 dlo7Vqg0jzOMAVE5Mi+8vc5KIuFiYo4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-28DPQbcSOdW8p-4ncQIh9g-1; Tue, 29 Jun 2021 12:43:17 -0400
X-MC-Unique: 28DPQbcSOdW8p-4ncQIh9g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83E1719057A9;
 Tue, 29 Jun 2021 16:43:15 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3405417A99;
 Tue, 29 Jun 2021 16:43:13 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/12] python: rename 'venv-check' target to 'check-pipenv'
Date: Tue, 29 Jun 2021 12:42:47 -0400
Message-Id: <20210629164253.1272763-7-jsnow@redhat.com>
In-Reply-To: <20210629164253.1272763-1-jsnow@redhat.com>
References: <20210629164253.1272763-1-jsnow@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
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
index c5fa4fce26..b01f6ec231 100644
--- a/.gitlab-ci.d/static_checks.yml
+++ b/.gitlab-ci.d/static_checks.yml
@@ -30,7 +30,7 @@ check-python-pipenv:
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


