Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67202417B7A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 21:08:58 +0200 (CEST)
Received: from localhost ([::1]:41358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTqZ7-0001hs-BS
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 15:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1mTqNn-00033u-Kg
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:57:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1mTqNi-0004pw-21
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:57:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632509828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mUrjjmEOrJUouhYIn7Ll+NN6o8uj0JCunn1j0XlKM4s=;
 b=BtAcJZV7ZCKVtWLYQJPoI7bFKGezFuwfm+9byFk5K7Aje/unna9wmAGsS3vgMQp9Wk8yO3
 GmkfrdF4kjJnGim9YSs8OjoVQBcOKOsyzv9R+BASxENGHj+v713F07ThRQPSOYuYjLcWXF
 rvi3An9sWaGtEecMp2NmcZEafiQPeSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-HSYATuiSNmiR8icLZjNyLQ-1; Fri, 24 Sep 2021 14:57:05 -0400
X-MC-Unique: HSYATuiSNmiR8icLZjNyLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A206E1007258;
 Fri, 24 Sep 2021 18:57:03 +0000 (UTC)
Received: from p50.net (unknown [10.22.33.186])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4646776606;
 Fri, 24 Sep 2021 18:56:24 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/16] Acceptance Tests: bump Avocado requirement to 91.0
Date: Fri, 24 Sep 2021 14:54:51 -0400
Message-Id: <20210924185506.2542588-2-crosa@redhat.com>
In-Reply-To: <20210924185506.2542588-1-crosa@redhat.com>
References: <20210924185506.2542588-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Greg Kurz <groug@kaod.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avocado 91.0, brings, among other changes, a switch to a new runner
implementation, known as "nrunner".  While my personal testing shows
that it's suitable for running the QEMU tests, there are some
considerations that should be addressed before the change.

For instance, the "nrunner" implementation will run tests in parallel
by default.  With more tests running, and resources shared, some tests
may fail with timeouts on some environments.

So, for now, let's bump the Avocado version to allow for the other
features to be used.  And the "nrunner" implementation to be used by
those that choose to do so.

More information can be found at the release notes at:
   https://avocado-framework.readthedocs.io/en/latest/releases/91_0.html

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 docs/devel/testing.rst | 12 ++++++++++++
 tests/Makefile.include |  2 ++
 tests/requirements.txt |  2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 4a0abbf23d..2818c58ff8 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -740,6 +740,18 @@ may be invoked by running:
 
   tests/venv/bin/avocado run $OPTION1 $OPTION2 tests/acceptance/
 
+Running tests in parallel
+-------------------------
+
+The current ``make check-acceptance`` target continues to use the
+Avocado runner implementation simply known as "runner".  But, it's now
+possible to opt-in and choose the "nrunner" implementation, which,
+among other things, allows for parallel execution of tests:
+
+.. code::
+
+  make AVOCADO_RUNNER=nrunner check-acceptance
+
 Manual Installation
 -------------------
 
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 6e16c05f10..ac289a2e41 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -92,6 +92,7 @@ TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
 # Any number of command separated loggers are accepted.  For more
 # information please refer to "avocado --help".
 AVOCADO_SHOW=app
+AVOCADO_RUNNER=runner
 AVOCADO_TAGS=$(patsubst %-softmmu,-t arch:%, $(filter %-softmmu,$(TARGETS)))
 
 $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
@@ -128,6 +129,7 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
 	$(call quiet-command, \
             $(TESTS_VENV_DIR)/bin/python -m avocado \
             --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
+            --test-runner=$(AVOCADO_RUNNER) \
             --filter-by-tags-include-empty --filter-by-tags-include-empty-key \
             $(AVOCADO_TAGS) \
             $(if $(GITLAB_CI),,--failfast) tests/acceptance, \
diff --git a/tests/requirements.txt b/tests/requirements.txt
index a21b59b443..40af24c664 100644
--- a/tests/requirements.txt
+++ b/tests/requirements.txt
@@ -1,5 +1,5 @@
 # Add Python module requirements, one per line, to be installed
 # in the tests/venv Python virtual environment. For more info,
 # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
-avocado-framework==88.1
+avocado-framework==91.0
 pycdlib==1.11.0
-- 
2.31.1


