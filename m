Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2519B416326
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 18:24:54 +0200 (CEST)
Received: from localhost ([::1]:52576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTRWn-00076w-7D
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 12:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mTRKQ-0008Fd-Tm
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 12:12:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mTRKO-000670-8w
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 12:12:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632413523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rqvAI2/YQRuRf3sfE2dlQ+fu+PbcL2r7DmceI790m4Y=;
 b=Vtb8Y26iAniQFWTa58tMxu/PJ6PlJWe/lQCHyLM1qNnNRvVjNGw07opWFjh59VKPVJrMl2
 IgT3B1eYBzX8bOAGQUhmZBpGGvLJgPCReGQ2DzGBqb10Am0iKtzBDscDqIkeNlZaMy42mc
 sy3rB+xm0YKW+I3RefJCy+SG35bZcSw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-V56St038NAmbP1-Vfwyi2A-1; Thu, 23 Sep 2021 12:12:01 -0400
X-MC-Unique: V56St038NAmbP1-Vfwyi2A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6FA9835DE6;
 Thu, 23 Sep 2021 16:12:00 +0000 (UTC)
Received: from wrampazz.redhat.com (unknown [10.22.32.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1BE9102482F;
 Thu, 23 Sep 2021 16:11:57 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] tests/Makefile: add AVOCADO_TESTS option to make
 check-acceptance
Date: Thu, 23 Sep 2021 13:11:41 -0300
Message-Id: <20210923161141.232208-4-willianr@redhat.com>
In-Reply-To: <20210923161141.232208-1-willianr@redhat.com>
References: <20210923161141.232208-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
within multiple files using `make check-acceptance` and the
AVOCADO_TESTS environment variable.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Willian Rampazzo <willianr@redhat.com>
---
 docs/devel/testing.rst | 27 +++++++++++++++++++++++++++
 tests/Makefile.include |  5 ++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index c9f6b97f87..64c9744795 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -746,6 +746,33 @@ tags, see:
 
  https://avocado-framework.readthedocs.io/en/latest/guides/user/chapters/tags.html
 
+To run a single test file, a couple of them, or a test within a file
+using the ``make check-acceptance`` command, set the ``AVOCADO_TESTS``
+environment variable with the test files or test names. To run all
+tests from a single file, use:
+
+ .. code::
+
+  make check-acceptance AVOCADO_TESTS=$FILEPATH
+
+The same is valid to run tests from multiple test files:
+
+ .. code::
+
+  make check-acceptance AVOCADO_TESTS='$FILEPATH1 $FILEPATH2'
+
+To run a single test within a file, use:
+
+ .. code::
+
+  make check-acceptance AVOCADO_TESTS=$FILEPATH:$TESTCLASS.$TESTNAME
+
+The same is valid to run single tests from multiple test files:
+
+ .. code::
+
+  make check-acceptance AVOCADO_TESTS='$FILEPATH1:$TESTCLASS1.$TESTNAME1 $FILEPATH2:$TESTCLASS2.$TESTNAME2'
+
 The scripts installed inside the virtual environment may be used
 without an "activation".  For instance, the Avocado test runner
 may be invoked by running:
diff --git a/tests/Makefile.include b/tests/Makefile.include
index f6484e5b31..e69c4fae53 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -88,6 +88,9 @@ clean-tcg: $(CLEAN_TCG_TARGET_RULES)
 TESTS_VENV_DIR=$(BUILD_DIR)/tests/venv
 TESTS_VENV_REQ=$(SRC_PATH)/tests/requirements.txt
 TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
+ifndef AVOCADO_TESTS
+	AVOCADO_TESTS=tests/acceptance
+endif
 # Controls the output generated by Avocado when running tests.
 # Any number of command separated loggers are accepted.  For more
 # information please refer to "avocado --help".
@@ -136,7 +139,7 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
             $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
 			--filter-by-tags-include-empty-key) \
             $(AVOCADO_CMDLINE_TAGS) \
-            $(if $(GITLAB_CI),,--failfast) tests/acceptance, \
+            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
             "AVOCADO", "tests/acceptance")
 
 # Consolidated targets
-- 
2.31.1


