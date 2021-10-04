Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E854206E3
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 09:58:58 +0200 (CEST)
Received: from localhost ([::1]:35434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXIsD-0005pS-CL
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 03:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeT-0004LH-Oi
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:45 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:51831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeP-0004vW-D9
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:44 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MV5rK-1mP5gf0ztW-00S7ie; Mon, 04
 Oct 2021 09:44:39 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 26/26] tests/tcg/multiarch: Re-enable signals test for most
 guests
Date: Mon,  4 Oct 2021 09:44:21 +0200
Message-Id: <20211004074421.3141222-27-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004074421.3141222-1-laurent@vivier.eu>
References: <20211004074421.3141222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Tcu0udpoESPKie4FDxActY0GmyegS0o83Lu4WhRX0+qwW8ZPWZd
 3oybT9Qa4LHuaG8q8Y7RjNKHafaPpq7MliasJUGmox9r2lOKP2/06+eU9LqtcT2YbU6A/q9
 I7+RopQaXWrTeZBzeOCRcX7oHwaXxNw6D/TXoVfCeEtH36wX+q/6nuE3Ae6xQZn3pKw7cXm
 Yp8zYQ4G8OqWHy9/VoqLQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fyGM0cK832M=:rcibrdgDs3LF5Zzhpy8oMR
 Bam7Dk1PdCTnAWsoXsooeXhCvl2+mCkyAUoHVotAZAY2ttcxQpe4h4WWQ0GmrXiX7W6aj0UyT
 qCrXJBUXw8TiDPySLiZlyPxmi5+XoBpMlsOJ9dFNtZ/K0tD7EIVdM8Dzn1v5bxtgUT1kkU9vT
 YnU47zpXs5Re5Uw1/ZTxclfb5+GfS6Ue8xYr98hltzTTeKlXtoHfh1YCLLF8UVs2TQxHmIKOo
 lGD+9X8fgXvSo7kUPJahr0zx0pzUTcMt0XoGZ6m7EX9+YpOw8LBCE4ZqdymKN20X7i0La/cKi
 P8ZkUmYKBdXM/anxMCi1hOFch4C86k0QYfvhsdZ+e8BEouW25MYAjrIdU4avJ8ivVazQfDrI7
 G02O3NHqNUH2ILrgwKX9cXV6+hCw/8jUlCHqF8yyFU0NO1fHuTCC60IFM6imJv83pF4lvKAxC
 8J1maaCXwYXnxKV/DKTutGGsp7j6sweAHDzscM3H4i3Hcj39B/dy4efXvhxbJT4PU/mYnTOYJ
 aEpJnj1bGEIDKQW17sI/Pq7/HXIloLdSm1Vx4vDdUwZUArCr9NbFvxW571LE8rOqd2EfURQui
 A3iX15Ykf+ysHRcLAducfFesubwWICsKc2pjhePseTzjxv7Ph8XuxyNg0wBxfOytj3S2sCjVD
 3M3VxkP6gjn13qXXMFIJpeH7WJGkns+lbKokm3QHl/WamMCz7Iedhy5T6sPcxiA/gZVxUNPxM
 C3xxFK5n0BqrC5npDCmwM8J60+1R146d0fvxFw==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

With signal trampolines safely off the stack for all
guests besides hppa, we can re-enable this test.

It does show up a problem with sh4 (unrelated?),
so leave that test disabled for now.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210929130553.121567-27-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/tcg/hppa/Makefile.target      | 7 +++++++
 tests/tcg/i386/Makefile.target      | 3 ---
 tests/tcg/multiarch/Makefile.target | 8 --------
 tests/tcg/sh4/Makefile.target       | 7 +++++++
 4 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/tests/tcg/hppa/Makefile.target b/tests/tcg/hppa/Makefile.target
index 473864d1d468..d0d5e0e25761 100644
--- a/tests/tcg/hppa/Makefile.target
+++ b/tests/tcg/hppa/Makefile.target
@@ -5,3 +5,10 @@
 # On parisc Linux supports 4K/16K/64K (but currently only 4k works)
 EXTRA_RUNS+=run-test-mmap-4096 # run-test-mmap-16384 run-test-mmap-65536
 
+# This triggers failures for hppa-linux about 1% of the time
+# HPPA is the odd target that can't use the sigtramp page;
+# it requires the full vdso with dwarf2 unwind info.
+run-signals: signals
+	$(call skip-test, $<, "BROKEN awaiting vdso support")
+run-plugin-signals-with-%:
+	$(call skip-test, $<, "BROKEN awaiting vdso support")
diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index a053ca3f1532..38c10379af0f 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -65,9 +65,6 @@ run-plugin-%-with-libinsn.so:
 	       -d plugin -D $*-with-libinsn.so.pout $*, \
 		"$* (inline) on $(TARGET_NAME)")
 
-run-plugin-signals-with-libinsn.so:
-	$(call skip-test, $<, "BROKEN awaiting sigframe clean-ups and vdso support")
-
 # Update TESTS
 I386_TESTS:=$(filter-out $(SKIP_I386_TESTS), $(ALL_X86_TESTS))
 TESTS=$(MULTIARCH_TESTS) $(I386_TESTS)
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 85a6fb7a2ea0..3f283eabe6da 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -32,14 +32,6 @@ threadcount: LDFLAGS+=-lpthread
 
 signals: LDFLAGS+=-lrt -lpthread
 
-# This triggers failures on s390x hosts about 4% of the time
-# This triggers failures for hppa-linux about 1% of the time
-run-signals: signals
-	$(call skip-test, $<, "BROKEN awaiting sigframe clean-ups and vdso support")
-
-run-plugin-signals-with-%:
-	$(call skip-test, $<, "BROKEN awaiting sigframe clean-ups and vdso support")
-
 # We define the runner for test-mmap after the individual
 # architectures have defined their supported pages sizes. If no
 # additional page sizes are defined we only run the default test.
diff --git a/tests/tcg/sh4/Makefile.target b/tests/tcg/sh4/Makefile.target
index 9d18d44612e1..47c39a44b690 100644
--- a/tests/tcg/sh4/Makefile.target
+++ b/tests/tcg/sh4/Makefile.target
@@ -5,3 +5,10 @@
 
 # On sh Linux supports 4k, 8k, 16k and 64k pages (but only 4k currently works)
 EXTRA_RUNS+=run-test-mmap-4096 # run-test-mmap-8192 run-test-mmap-16384 run-test-mmap-65536
+
+# This triggers failures for sh4-linux about 10% of the time.
+# Random SIGSEGV at unpredictable guest address, cause unknown.
+run-signals: signals
+	$(call skip-test, $<, "BROKEN")
+run-plugin-signals-with-%:
+	$(call skip-test, $<, "BROKEN")
-- 
2.31.1


