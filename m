Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B76A3B88DC
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:59:35 +0200 (CEST)
Received: from localhost ([::1]:46382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfQs-0007wJ-KR
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lyfDx-0001yo-0X
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:46:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lyfDr-00011T-V3
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:46:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625078767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xg6N1iMQs8xOrrdLF4oVuO2eK0u2Z2w7U5F1eVNy7AE=;
 b=HrNuY+eCBDtyHNbqg8WYouxaXzTH67FUCvvuHfp0MwjnmwmsrZedMnU68VB0cyQYuw3j6j
 VB9W7yON58sqkc+ZQeiui+Nv/2Vq6MkigisxbpkuVlnGWL2XYij2oB9hQic3Px7Zm58dm+
 dqRd8lgbfqFPiME0tKzuy286SUtzL/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-K5CMvJ6iNFiA70giFVuyUw-1; Wed, 30 Jun 2021 14:46:03 -0400
X-MC-Unique: K5CMvJ6iNFiA70giFVuyUw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60652804142;
 Wed, 30 Jun 2021 18:46:02 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-48.gru2.redhat.com
 [10.97.116.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D07C5C1A3;
 Wed, 30 Jun 2021 18:45:50 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] python: Configure tox to skip missing interpreters
Date: Wed, 30 Jun 2021 15:45:46 -0300
Message-Id: <20210630184546.456582-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
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
Cc: thuth@redhat.com, ehabkost@redhat.com, alex.bennee@linaro.org,
 f4bug@amsat.org, willianr@redhat.com, crosa@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
Tested locally with `make check-tox` and where I only Python 3.6 and 3.9
installed.
Tested on CI: https://gitlab.com/wainersm/qemu/-/jobs/1390010988
Still on CI, but I deliberately removed Python 3.8: https://gitlab.com/wainersm/qemu/-/jobs/1390046531

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


