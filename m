Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E94A416335
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 18:26:58 +0200 (CEST)
Received: from localhost ([::1]:54708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTRYn-00008i-NY
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 12:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mTRKS-0008KU-HG
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 12:12:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mTRKK-00061K-Ns
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 12:12:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632413518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FFUlyABSCWAcLkLWJZG7INM6Gv9ZK7SPuQ797vHRGbk=;
 b=g5WXLJWRs13PwKQKLA3uIDdhDIUuscUN5QoPS+qJPCJTJ65CC/kyiqDWcThs9AwABpe4a+
 CBZilJ8qtsOhrHhvt4ee0Hqa2qArvfa2V9PIDHrQ9S0NamlcX/PCSonP1xVF0xWyuds5va
 LXqIGU+WXagYi1HTqQj007r43c6KkGk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-3vlpXcJmMuGRzRrypCGmfQ-1; Thu, 23 Sep 2021 12:11:55 -0400
X-MC-Unique: 3vlpXcJmMuGRzRrypCGmfQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EA52835DE5;
 Thu, 23 Sep 2021 16:11:54 +0000 (UTC)
Received: from wrampazz.redhat.com (unknown [10.22.32.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E99A1002EF0;
 Thu, 23 Sep 2021 16:11:52 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] tests/Makefile: allow control over tags during
 check-acceptance
Date: Thu, 23 Sep 2021 13:11:39 -0300
Message-Id: <20210923161141.232208-2-willianr@redhat.com>
In-Reply-To: <20210923161141.232208-1-willianr@redhat.com>
References: <20210923161141.232208-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=willianr@redhat.com;
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

Although it is possible to run a specific test using the avocado
command-line, a user may want to use a specific tag while running the
``make check-acceptance`` during the development or debugging.

This allows using the AVOCADO_TAGS environment variable where the user
takes total control of which tests should run based on the tags defined.

This also makes the check-acceptance command flexible to restrict tests
based on tags while running on CI.

e.g.:

AVOCADO_TAGS="foo bar baz" make check-acceptance

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 docs/devel/testing.rst | 14 ++++++++++++++
 tests/Makefile.include | 12 +++++++++---
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 4a0abbf23d..d1841e35d5 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -732,6 +732,20 @@ available.  On Debian and Ubuntu based systems, depending on the
 specific version, they may be on packages named ``python3-venv`` and
 ``python3-pip``.
 
+It is also possible to run tests based on tags using the
+``make check-acceptance`` command and the ``AVOCADO_TAGS`` environment
+variable:
+
+.. code::
+
+   make check-acceptance AVOCADO_TAGS=quick
+
+Note that tags separated with commas have an AND behavior, while tags
+separated by spaces have an OR behavior. For more information on Avocado
+tags, see:
+
+ https://avocado-framework.readthedocs.io/en/latest/guides/user/chapters/tags.html
+
 The scripts installed inside the virtual environment may be used
 without an "activation".  For instance, the Avocado test runner
 may be invoked by running:
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 6e16c05f10..f6484e5b31 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -92,7 +92,12 @@ TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
 # Any number of command separated loggers are accepted.  For more
 # information please refer to "avocado --help".
 AVOCADO_SHOW=app
-AVOCADO_TAGS=$(patsubst %-softmmu,-t arch:%, $(filter %-softmmu,$(TARGETS)))
+ifndef AVOCADO_TAGS
+	AVOCADO_CMDLINE_TAGS=$(patsubst %-softmmu,-t arch:%, \
+						 $(filter %-softmmu,$(TARGETS)))
+else
+	AVOCADO_CMDLINE_TAGS=$(addprefix -t , $(AVOCADO_TAGS))
+endif
 
 $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
 	$(call quiet-command, \
@@ -128,8 +133,9 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
 	$(call quiet-command, \
             $(TESTS_VENV_DIR)/bin/python -m avocado \
             --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
-            --filter-by-tags-include-empty --filter-by-tags-include-empty-key \
-            $(AVOCADO_TAGS) \
+            $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
+			--filter-by-tags-include-empty-key) \
+            $(AVOCADO_CMDLINE_TAGS) \
             $(if $(GITLAB_CI),,--failfast) tests/acceptance, \
             "AVOCADO", "tests/acceptance")
 
-- 
2.31.1


