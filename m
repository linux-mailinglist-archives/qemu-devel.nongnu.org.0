Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2053B8C0D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 04:19:52 +0200 (CEST)
Received: from localhost ([::1]:34106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lymIx-0004mA-Cx
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 22:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lym9S-0008VX-SV
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 22:10:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lym9M-0006Bj-3v
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 22:10:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625105395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1QsUKrUUXwSxiot0c5blR0BYaGj85ygsHXbkXz42nB4=;
 b=Z1YL+7CTU8s3so/WwbSiSGqf+45AKS0FO+cwcErUZ5OpxD8Df3MIquoyDDjg5Un/eDjWgP
 47rrGseg/6+rnovzM61YeMZv/RvrZ0enW5yBRtW3hb7hzIR4ch2ty/GeQeAARH+9IuOoQZ
 IlO/JzL4y9gIlsp0uRvF0Am1KQiLDnc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-Bt3yk2vHOxmdl8d4jdwGLA-1; Wed, 30 Jun 2021 22:09:54 -0400
X-MC-Unique: Bt3yk2vHOxmdl8d4jdwGLA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA9BD802923;
 Thu,  1 Jul 2021 02:09:52 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3A665FC03;
 Thu,  1 Jul 2021 02:09:51 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/15] python: add 'make check-dev' invocation
Date: Wed, 30 Jun 2021 22:09:17 -0400
Message-Id: <20210701020921.1679468-12-jsnow@redhat.com>
In-Reply-To: <20210701020921.1679468-1-jsnow@redhat.com>
References: <20210701020921.1679468-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a *third* way to run the Python tests. Unlike the first two
(check-pipenv, check-tox), this version does not require any specific
interpreter version -- making it a lot easier to tell people to run it
as a quick smoketest prior to submission to GitLab CI.

Summary:

  Checked via GitLab CI:
    - check-pipenv: tests our oldest python & dependencies
    - check-tox: tests newest dependencies on all non-EOL python versions
  Executed only incidentally:
    - check-dev: tests newest dependencies on whichever python version

('make check' does not set up any environment at all, it just runs the
tests in your current environment. All four invocations perform the
exact same tests, just in different execution environments.)

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-id: 20210629214323.1329806-12-jsnow@redhat.com
[Maintainer edit: added .dev-venv/ to .gitignore. --js]
Acked-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Acked-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/.gitignore |  1 +
 python/Makefile   | 35 +++++++++++++++++++++++++++++++++--
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/python/.gitignore b/python/.gitignore
index 272ed223a8..c8b0e67fe6 100644
--- a/python/.gitignore
+++ b/python/.gitignore
@@ -14,3 +14,4 @@ qemu.egg-info/
 # virtual environments (pipenv et al)
 .venv/
 .tox/
+.dev-venv/
diff --git a/python/Makefile b/python/Makefile
index d34c4e35d9..8f8e1999c0 100644
--- a/python/Makefile
+++ b/python/Makefile
@@ -1,3 +1,5 @@
+QEMU_VENV_DIR=.dev-venv
+
 .PHONY: help
 help:
 	@echo "python packaging help:"
@@ -14,6 +16,11 @@ help:
 	@echo "    Requires: Python 3.6 - 3.10, and tox."
 	@echo "    Hint (Fedora): 'sudo dnf install python3-tox python3.10'"
 	@echo ""
+	@echo "make check-dev:"
+	@echo "    Run tests in a venv against your default python3 version."
+	@echo "    These tests use the newest dependencies."
+	@echo "    Requires: Python 3.x"
+	@echo ""
 	@echo "make develop:    Install deps for 'make check', and"
 	@echo "                 the qemu libs in editable/development mode."
 	@echo ""
@@ -22,6 +29,9 @@ help:
 	@echo "make pipenv"
 	@echo "    Creates pipenv's virtual environment (.venv)"
 	@echo ""
+	@echo "make dev-venv"
+	@echo "    Creates a simple venv for check-dev. ($(QEMU_VENV_DIR))"
+	@echo ""
 	@echo "make clean:      remove package build output."
 	@echo ""
 	@echo "make distclean:  remove venv files, qemu package forwarder,"
@@ -38,9 +48,30 @@ pipenv: .venv
 check-pipenv: pipenv
 	@pipenv run make check
 
+.PHONY: dev-venv
+dev-venv: $(QEMU_VENV_DIR) $(QEMU_VENV_DIR)/bin/activate
+$(QEMU_VENV_DIR) $(QEMU_VENV_DIR)/bin/activate: setup.cfg
+	@echo "VENV $(QEMU_VENV_DIR)"
+	@python3 -m venv $(QEMU_VENV_DIR)
+	@(							\
+		echo "ACTIVATE $(QEMU_VENV_DIR)";		\
+		. $(QEMU_VENV_DIR)/bin/activate;		\
+		echo "INSTALL qemu[devel] $(QEMU_VENV_DIR)";	\
+		make develop 1>/dev/null;			\
+	)
+	@touch $(QEMU_VENV_DIR)
+
+.PHONY: check-dev
+check-dev: dev-venv
+	@(							\
+		echo "ACTIVATE $(QEMU_VENV_DIR)";		\
+		. $(QEMU_VENV_DIR)/bin/activate;		\
+		make check;					\
+	)
+
 .PHONY: develop
 develop:
-	pip3 install -e .[devel]
+	pip3 install --disable-pip-version-check -e .[devel]
 
 .PHONY: check
 check:
@@ -56,4 +87,4 @@ clean:
 
 .PHONY: distclean
 distclean: clean
-	rm -rf qemu.egg-info/ .venv/ .tox/ dist/
+	rm -rf qemu.egg-info/ .venv/ .tox/ $(QEMU_VENV_DIR) dist/
-- 
2.31.1


