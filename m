Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 805D741510B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 22:06:56 +0200 (CEST)
Received: from localhost ([::1]:38406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT8W7-0006CH-5h
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 16:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mT8TJ-0004XF-Ud
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 16:04:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mT8TI-0002fr-9S
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 16:04:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632341039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z7eUxZMWqOun4Q8F6UnI4Akbp+ROQcsXpU69uwoV17c=;
 b=VRUbBi0j3OjRPWZhrH4FzAqFWYdo8niNAvrtgJ36OQCBQQsvs6JgTBIbGI2NaOuKO8TRRK
 wHYNSZl/FkT1zGpkFG9E45AsvL4HosiyF8r69yNhI4vwx6lv81sD11sEWJwJdxrU9ZB97y
 7TSl4YxJjdfqfvvsrslYpkRvB4B4ULU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-D7DZQpH-P82nw-kqkNTCkg-1; Wed, 22 Sep 2021 16:03:58 -0400
X-MC-Unique: D7DZQpH-P82nw-kqkNTCkg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 924DB1084683;
 Wed, 22 Sep 2021 20:03:57 +0000 (UTC)
Received: from wrampazz.redhat.com (unknown [10.22.32.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF4D25FC13;
 Wed, 22 Sep 2021 20:03:54 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] tests/Makefile: add AVOCADO_TEST_FILES option to make
 check-acceptance
Date: Wed, 22 Sep 2021 17:03:40 -0300
Message-Id: <20210922200340.196329-3-willianr@redhat.com>
In-Reply-To: <20210922200340.196329-1-willianr@redhat.com>
References: <20210922200340.196329-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the possibility of running all the tests from a single file, or
multiple files, running a single test within a file or multiple tests
within multiple files using `make check-acceptance` and the
AVOCADO_TEST_FILES environment variable.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Willian Rampazzo <willianr@redhat.com>
---
 docs/devel/testing.rst | 27 +++++++++++++++++++++++++++
 tests/Makefile.include |  5 ++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index b03df34f7b..785f82fc65 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -732,6 +732,33 @@ available.  On Debian and Ubuntu based systems, depending on the
 specific version, they may be on packages named ``python3-venv`` and
 ``python3-pip``.
 
+To run a single test file, a couple of them, or a test within a file
+using the ``make check-acceptance`` command, set the ``AVOCADO_TEST_FILES``
+environment variable with the test files or test names. To run all
+tests from a single file, use:
+
+ .. code::
+
+  make check-acceptance AVOCADO_TEST_FILES=$FILEPATH
+
+The same is valid to run tests from multiple test files:
+
+ .. code::
+
+  make check-acceptance AVOCADO_TEST_FILES='$FILEPATH1 $FILEPATH2'
+
+To run a single test within a file, use:
+
+ .. code::
+
+  make check-acceptance AVOCADO_TEST_FILES=$FILEPATH:$TESTCLASS.$TESTNAME
+
+The same is valid to run single tests from multiple test files:
+
+ .. code::
+
+  make check-acceptance AVOCADO_TEST_FILES='$FILEPATH1:$TESTCLASS1.$TESTNAME1 $FILEPATH2:$TESTCLASS2.$TESTNAME2'
+
 The scripts installed inside the virtual environment may be used
 without an "activation".  For instance, the Avocado test runner
 may be invoked by running:
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 6e16c05f10..1f1b4aa089 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -88,6 +88,9 @@ clean-tcg: $(CLEAN_TCG_TARGET_RULES)
 TESTS_VENV_DIR=$(BUILD_DIR)/tests/venv
 TESTS_VENV_REQ=$(SRC_PATH)/tests/requirements.txt
 TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
+ifndef AVOCADO_TEST_FILES
+	AVOCADO_TEST_FILES=tests/acceptance
+endif
 # Controls the output generated by Avocado when running tests.
 # Any number of command separated loggers are accepted.  For more
 # information please refer to "avocado --help".
@@ -130,7 +133,7 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
             --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
             --filter-by-tags-include-empty --filter-by-tags-include-empty-key \
             $(AVOCADO_TAGS) \
-            $(if $(GITLAB_CI),,--failfast) tests/acceptance, \
+            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TEST_FILES), \
             "AVOCADO", "tests/acceptance")
 
 # Consolidated targets
-- 
2.31.1


