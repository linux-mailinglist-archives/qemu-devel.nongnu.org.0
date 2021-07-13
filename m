Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC3D3C7905
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 23:34:55 +0200 (CEST)
Received: from localhost ([::1]:36962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Q3K-00047N-AL
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 17:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3Pqx-000440-1q
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:22:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3Pqv-0000ay-Dy
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:22:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626211324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8VEQG7uRmU1E/VwX2Tg7eiPcHjc2JykR0vK+XzqfOgY=;
 b=Kftn5TqXHrGq06/Nqzic7Bn7mlfpnBFlm/Cn3X4Xd1twgEQVCDH5K+4Y6jj8lZouSAoMab
 bejGnYYLFY9DA0AbVYa+EZCx+45gP4mPffpoubGVKIr2f+DE+LJ9BExu1KYjdZvRl9w/BK
 LonbHt/2j4lbz9BxCmGDLyctgjnLTOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-ZnyprlTUMD6sFsIYQmTQYA-1; Tue, 13 Jul 2021 17:22:03 -0400
X-MC-Unique: ZnyprlTUMD6sFsIYQmTQYA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D63D3802C87;
 Tue, 13 Jul 2021 21:22:00 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7578E19C44;
 Tue, 13 Jul 2021 21:21:58 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 20/23] python: Configure tox to skip missing interpreters
Date: Tue, 13 Jul 2021 17:19:20 -0400
Message-Id: <20210713211923.3809241-21-crosa@redhat.com>
In-Reply-To: <20210713211923.3809241-1-crosa@redhat.com>
References: <20210713211923.3809241-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Thomas Huth <thuth@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

Currently tox tests against the installed interpreters, however if any
supported interpreter is absent then it will return fail. It seems not
reasonable to expect developers to have all supported interpreters
installed on their systems. Luckily tox can be configured to skip
missing interpreters.

This changed the tox setup so that missing interpreters are skipped by
default. On the CI, however, we still want to enforce it tests
against all supported. This way on CI the
--skip-missing-interpreters=false option is passed to tox.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210630184546.456582-1-wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 .gitlab-ci.d/static_checks.yml | 1 +
 python/Makefile                | 5 ++++-
 python/setup.cfg               | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
index b01f6ec231..96dbd9e310 100644
--- a/.gitlab-ci.d/static_checks.yml
+++ b/.gitlab-ci.d/static_checks.yml
@@ -43,6 +43,7 @@ check-python-tox:
     - make -C python check-tox
   variables:
     GIT_DEPTH: 1
+    QEMU_TOX_EXTRA_ARGS: --skip-missing-interpreters=false
   needs:
     job: python-container
   allow_failure: true
diff --git a/python/Makefile b/python/Makefile
index ac46ae33e7..fe27a3e12e 100644
--- a/python/Makefile
+++ b/python/Makefile
@@ -1,4 +1,5 @@
 QEMU_VENV_DIR=.dev-venv
+QEMU_TOX_EXTRA_ARGS ?=
 
 .PHONY: help
 help:
@@ -15,6 +16,8 @@ help:
 	@echo "    These tests use the newest dependencies."
 	@echo "    Requires: Python 3.6 - 3.10, and tox."
 	@echo "    Hint (Fedora): 'sudo dnf install python3-tox python3.10'"
+	@echo "    The variable QEMU_TOX_EXTRA_ARGS can be use to pass extra"
+	@echo "    arguments to tox".
 	@echo ""
 	@echo "make check-dev:"
 	@echo "    Run tests in a venv against your default python3 version."
@@ -87,7 +90,7 @@ check:
 
 .PHONY: check-tox
 check-tox:
-	@tox
+	@tox $(QEMU_TOX_EXTRA_ARGS)
 
 .PHONY: clean
 clean:
diff --git a/python/setup.cfg b/python/setup.cfg
index 11f71d5312..14bab90288 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -121,6 +121,7 @@ multi_line_output=3
 
 [tox:tox]
 envlist = py36, py37, py38, py39, py310
+skip_missing_interpreters = true
 
 [testenv]
 allowlist_externals = make
-- 
2.31.1


