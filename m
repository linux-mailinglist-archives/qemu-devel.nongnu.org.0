Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABA7415084
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 21:36:06 +0200 (CEST)
Received: from localhost ([::1]:46592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT82G-0004fC-Tc
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 15:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mT7XQ-0007nm-S3
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 15:04:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mT7XK-0001O2-JD
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 15:04:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632337445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mmxoXwyzLt2fjGdQjT7Sct651d94pXp25vKmdQ4/J74=;
 b=T+6xOjm0rK4zMs7zyQ+lJJ/Rghr+1UWmp7HE1eaBWoeoC2WQdCnZtFqppo3gDbqoc2TiJ8
 jOPT3d5vztzR8MuoKydUlPk0hIeh/m37k7tmP+yP1bv6XeHPb9fSlaUGL2YA8Wo4i7PH6i
 BddXtPZVcwN6HOP1u1okdjHPoLAxzjY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-UD3xJFq6NFWypc0364FCiw-1; Wed, 22 Sep 2021 15:04:04 -0400
X-MC-Unique: UD3xJFq6NFWypc0364FCiw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A40B718D6A2C;
 Wed, 22 Sep 2021 19:04:03 +0000 (UTC)
Received: from wrampazz.redhat.com (unknown [10.22.32.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9C6E5D9CA;
 Wed, 22 Sep 2021 19:04:00 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] tests/Makefile: add TESTFILES option to make
 check-acceptance
Date: Wed, 22 Sep 2021 16:03:24 -0300
Message-Id: <20210922190324.190227-3-willianr@redhat.com>
In-Reply-To: <20210922190324.190227-1-willianr@redhat.com>
References: <20210922190324.190227-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=willianr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the possibility of running all the tests from a single file, or
multiple files, running a single test within a file or multiple tests
within multiple files using `make check-acceptance` and the TESTFILES
environment variable.

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
---
 docs/devel/testing.rst | 27 +++++++++++++++++++++++++++
 tests/Makefile.include |  5 ++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index b03df34f7b..f887463f2e 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -732,6 +732,33 @@ available.  On Debian and Ubuntu based systems, depending on the
 specific version, they may be on packages named ``python3-venv`` and
 ``python3-pip``.
 
+To run a single test file, a couple of them, or a test within a file
+using the ``make check-acceptance`` command, set the ``TESTFILES``
+environment variable with the test files or test names. To run all
+tests from a single file, use:
+
+ .. code::
+
+  make check-acceptance TESTFILES=$FILEPATH
+
+The same is valid to run tests from multiple test files:
+
+ .. code::
+
+  make check-acceptance TESTFILES='$FILEPATH1 $FILEPATH2'
+
+To run a single test within a file, use:
+
+ .. code::
+
+  make check-acceptance TESTFILES=$FILEPATH:$TESTCLASS.$TESTNAME
+
+The same is valid to run single tests from multiple test files:
+
+ .. code::
+
+  make check-acceptance TESTFILES='$FILEPATH1:$TESTCLASS1.$TESTNAME1 $FILEPATH2:$TESTCLASS2.$TESTNAME2'
+
 The scripts installed inside the virtual environment may be used
 without an "activation".  For instance, the Avocado test runner
 may be invoked by running:
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 6e16c05f10..82d7ef7a20 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -88,6 +88,9 @@ clean-tcg: $(CLEAN_TCG_TARGET_RULES)
 TESTS_VENV_DIR=$(BUILD_DIR)/tests/venv
 TESTS_VENV_REQ=$(SRC_PATH)/tests/requirements.txt
 TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
+ifndef TESTFILES
+	TESTFILES=tests/acceptance
+endif
 # Controls the output generated by Avocado when running tests.
 # Any number of command separated loggers are accepted.  For more
 # information please refer to "avocado --help".
@@ -130,7 +133,7 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
             --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
             --filter-by-tags-include-empty --filter-by-tags-include-empty-key \
             $(AVOCADO_TAGS) \
-            $(if $(GITLAB_CI),,--failfast) tests/acceptance, \
+            $(if $(GITLAB_CI),,--failfast) $(TESTFILES), \
             "AVOCADO", "tests/acceptance")
 
 # Consolidated targets
-- 
2.31.1


