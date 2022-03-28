Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9884E9939
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 16:19:39 +0200 (CEST)
Received: from localhost ([::1]:58256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYqDa-0005Ch-GU
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 10:19:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nYpxL-0001iI-SW
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:02:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nYpxF-0004jj-T4
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:02:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648476165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BiuPOcC9L2prnG/HfGbgCg95shOxGTKPxvzZmrIjN+o=;
 b=SG1Ijtgtk63U/Y1gCEjgIao31y4xKaa14MwLr1aogb8ZVGuxaAzviiIeW85nt0l719gOhq
 aelvsesFX5xWZVMY8jGb5vTdUahcIcgeV2AGtdP49QxZhNel6uIIIGo8cIl7GAiVTlTYQU
 Aa7NxbnsyhRQDq/T8hi8DNbKiPvdms0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-q4Ant7AfMJeaYMW861lvxw-1; Mon, 28 Mar 2022 10:02:42 -0400
X-MC-Unique: q4Ant7AfMJeaYMW861lvxw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FC2038008A1;
 Mon, 28 Mar 2022 14:02:42 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 571E11121321;
 Mon, 28 Mar 2022 14:02:42 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/15] tests/tcg: list test targets in Makefile.prereqs
Date: Mon, 28 Mar 2022 10:02:37 -0400
Message-Id: <20220328140240.40798-13-pbonzini@redhat.com>
In-Reply-To: <20220328140240.40798-1-pbonzini@redhat.com>
References: <20220328140240.40798-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Omit the rules altogether for targets that do not have a compiler.
Makefile.qemu now is only invoked if the tests are actually built/run.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/Makefile.include  | 14 +++++++-------
 tests/tcg/Makefile.qemu | 11 -----------
 tests/tcg/configure.sh  | 14 ++++++++++----
 3 files changed, 17 insertions(+), 22 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index b5d0d6bc98..091ca8513f 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -36,19 +36,16 @@ export SRC_PATH
 
 SPEED = quick
 
-# Build up our target list from the filtered list of ninja targets
-TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa, $(ninja-targets)))
-
 -include tests/tcg/Makefile.prereqs
 config-host.mak: $(SRC_PATH)/tests/tcg/configure.sh
 tests/tcg/Makefile.prereqs: config-host.mak
 
 # Per guest TCG tests
-BUILD_TCG_TARGET_RULES=$(patsubst %,build-tcg-tests-%, $(TARGETS))
-CLEAN_TCG_TARGET_RULES=$(patsubst %,clean-tcg-tests-%, $(TARGETS))
-RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TARGETS))
+BUILD_TCG_TARGET_RULES=$(patsubst %,build-tcg-tests-%, $(TCG_TESTS_TARGETS))
+CLEAN_TCG_TARGET_RULES=$(patsubst %,clean-tcg-tests-%, $(TCG_TESTS_TARGETS))
+RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TCG_TESTS_TARGETS))
 
-$(foreach TARGET,$(TARGETS), \
+$(foreach TARGET,$(TCG_TESTS_TARGETS), \
         $(eval $(BUILD_DIR)/tests/tcg/config-$(TARGET).mak: config-host.mak))
 
 $(BUILD_TCG_TARGET_RULES): build-tcg-tests-%: $(if $(CONFIG_PLUGIN),test-plugins)
@@ -84,6 +81,9 @@ clean-tcg: $(CLEAN_TCG_TARGET_RULES)
 
 .PHONY: check-venv check-avocado check-acceptance check-acceptance-deprecated-warning
 
+# Build up our target list from the filtered list of ninja targets
+TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa, $(ninja-targets)))
+
 TESTS_VENV_DIR=$(BUILD_DIR)/tests/venv
 TESTS_VENV_REQ=$(SRC_PATH)/tests/requirements.txt
 TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
diff --git a/tests/tcg/Makefile.qemu b/tests/tcg/Makefile.qemu
index 84c8543878..cda5e5a33e 100644
--- a/tests/tcg/Makefile.qemu
+++ b/tests/tcg/Makefile.qemu
@@ -95,7 +95,6 @@ all:
 
 .PHONY: guest-tests
 
-ifneq ($(GUEST_BUILD),)
 guest-tests: $(GUEST_BUILD)
 
 run-guest-tests: guest-tests
@@ -105,16 +104,6 @@ run-guest-tests: guest-tests
 	 		SRC_PATH="$(SRC_PATH)" SPEED=$(SPEED) run), \
 	"RUN", "tests for $(TARGET_NAME)")
 
-else
-guest-tests:
-	$(call quiet-command, true, "BUILD", \
-		"$(TARGET) guest-tests SKIPPED")
-
-run-guest-tests:
-	$(call quiet-command, true, "RUN", \
-		"tests for $(TARGET) SKIPPED")
-endif
-
 # It doesn't matter if these don't exits
 .PHONY: clean-guest-tests
 clean-guest-tests:
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 991b905354..05e1ac507b 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -82,6 +82,8 @@ fi
 
 makefile=tests/tcg/Makefile.prereqs
 : > $makefile
+
+tcg_tests_targets=
 for target in $target_list; do
   arch=${target%%-*}
 
@@ -228,6 +230,7 @@ for target in $target_list; do
   echo "target=$target" >> $config_target_mak
   case $target in
     *-softmmu)
+      test -f $source_path/tests/tcg/$arch/Makefile.softmmu-target || continue
       qemu="qemu-system-$arch"
       ;;
     *)
@@ -235,11 +238,7 @@ for target in $target_list; do
       ;;
   esac
 
-  echo "run-tcg-tests-$target: $qemu\$(EXESUF)" >> $makefile
-
   eval "target_compiler_cflags=\${cross_cc_cflags_$arch}"
-  echo "QEMU=$PWD/$qemu" >> $config_target_mak
-  echo "CROSS_CC_GUEST_CFLAGS=$target_compiler_cflags" >> $config_target_mak
 
   got_cross_cc=no
 
@@ -365,5 +364,12 @@ for target in $target_list; do
               echo "CROSS_CC_HAS_I386_NOPIE=y" >> $config_target_mak
               ;;
       esac
+  else
+      continue
   fi
+  echo "QEMU=$PWD/$qemu" >> $config_target_mak
+  echo "CROSS_CC_GUEST_CFLAGS=$target_compiler_cflags" >> $config_target_mak
+  echo "run-tcg-tests-$target: $qemu\$(EXESUF)" >> $makefile
+  tcg_tests_targets="$tcg_tests_targets $target"
 done
+echo "TCG_TESTS_TARGETS=$tcg_tests_targets" >> $makefile
-- 
2.31.1



