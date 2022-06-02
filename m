Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6FE53B8EE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 14:23:04 +0200 (CEST)
Received: from localhost ([::1]:59074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwjqx-0005Cf-MY
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 08:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTW-0000i5-IB
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:50 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:48373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTU-0001FD-Kf
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:50 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MvJwN-1nfL0x2Tp3-00rLHN; Thu, 02
 Jun 2022 13:58:46 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 16/19] tests/tcg/m68k: Add trap.c
Date: Thu,  2 Jun 2022 13:58:34 +0200
Message-Id: <20220602115837.2013918-17-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220602115837.2013918-1-laurent@vivier.eu>
References: <20220602115837.2013918-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JQGQGKNSJpDygUX0DhsidVlCLXwU9dfSRO4lGFdhve62gsmWVgI
 Xw4aEH+tDG7KsFEru7MB7osN9JqM+/1+cLQaUaH3Xrk8ThFISRLTaohnHJllF4EfvC655Ig
 XPqPpFelIcthCfRwHTfqWwPZAevEw/qmEV/s9D5VL0wDF/Ru0Tr2xeIC/4a1rbnM1Jo8/P2
 oKJH0kzyCnD5x8Ock8k4g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NjKuHP496LU=:ugkM1EBLlHazMscCgvy+6j
 5wYtdNtdPqYowHS24B/1C5yapdNY1EZdiMSSzhoGkcgV6nzzSDWtKppPNjBWu4nc9z7aYE/Ay
 0Qaj29IN0Wt98gFsrJo5/ojPWRT3NmJs3wSiKwnq4olmSyRQbcGHzxc87iVJ4Xlx8oLVBz4L+
 gJsfKcsrkl1dJHAJitrrIH75jAKp+D8JMU3iwLzWAlqGwVD1hLpn7cMRM6Eo/dkMr69KD4e5I
 Led17IeIhf/Dr4XNAsNfgjm0wC4QGA+zjz/cyrZtHjs7m9WfAzfMpu5ojspYfJm1VYv5/BmHh
 uoSfLxdF+XPLYYVUROOGEHt1iJqBuJSess44ZbzjW2LyPvOQsfoFm037qEOj9cC33/zfDQb8F
 91+UK2piZTNV0iEq2lW/5jBqom6X33ANSD0aGEFZVlav2cdnPOu17Qv+0wEyHUR+Bmd8RmDK5
 dPXdcQYaNocsAb0od+Kbi+NVWTU4QbDiWUBzqPcQ/tt6utd13NMI5WK9mtCZZRHlw8xjr/wYO
 ZcJnu/lJCXlnBtsrtqGRGhjCljCgNMM7nliYZeMjEEdnskhWG3FEGPhgcCupkzhScnoMBbecZ
 QT4PMGvd7Co+Y3UiUbhkHPRjhde80IACYfoPPSsVALtuqAIgyll0wb/a2t90WeN/NbD/G48uO
 5hZVTBPwm1rxnu4eRkpyDVDZD9B7Nt41/hSse/cwjBjK2o1ZQJyufMomesr2MjAWBFpcWjv91
 1hN7EdytKBx124BcdF8RvNwHm2W51wvY+fpkSA==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Test various trap instructions: chk, div, trap, trapv, trapcc, ftrapcc,
and the signals and addresses that we expect from them.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220602013401.303699-15-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/tcg/m68k/trap.c          | 129 +++++++++++++++++++++++++++++++++
 tests/tcg/m68k/Makefile.target |   3 +
 2 files changed, 132 insertions(+)
 create mode 100644 tests/tcg/m68k/trap.c

diff --git a/tests/tcg/m68k/trap.c b/tests/tcg/m68k/trap.c
new file mode 100644
index 000000000000..96cac18d4d5a
--- /dev/null
+++ b/tests/tcg/m68k/trap.c
@@ -0,0 +1,129 @@
+/*
+ * Test m68k trap addresses.
+ */
+
+#define _GNU_SOURCE 1
+#include <signal.h>
+#include <assert.h>
+#include <limits.h>
+
+static int expect_sig;
+static int expect_si_code;
+static void *expect_si_addr;
+static greg_t expect_mc_pc;
+static volatile int got_signal;
+
+static void sig_handler(int sig, siginfo_t *si, void *puc)
+{
+    ucontext_t *uc = puc;
+    mcontext_t *mc = &uc->uc_mcontext;
+
+    assert(sig == expect_sig);
+    assert(si->si_code == expect_si_code);
+    assert(si->si_addr == expect_si_addr);
+    assert(mc->gregs[R_PC] == expect_mc_pc);
+
+    got_signal = 1;
+}
+
+#define FMT_INS     [ad] "a"(&expect_si_addr), [pc] "a"(&expect_mc_pc)
+#define FMT0_STR(S) \
+    "move.l #1f, (%[ad])\n\tmove.l #1f, (%[pc])\n" S "\n1:\n"
+#define FMT2_STR(S) \
+    "move.l #0f, (%[ad])\n\tmove.l #1f, (%[pc])\n" S "\n1:\n"
+
+#define CHECK_SIG   do { assert(got_signal); got_signal = 0; } while (0)
+
+int main(int argc, char **argv)
+{
+    struct sigaction act = {
+        .sa_sigaction = sig_handler,
+        .sa_flags = SA_SIGINFO
+    };
+    int t0, t1;
+
+    sigaction(SIGILL, &act, NULL);
+    sigaction(SIGTRAP, &act, NULL);
+    sigaction(SIGFPE, &act, NULL);
+
+    expect_sig = SIGFPE;
+    expect_si_code = FPE_INTOVF;
+    asm volatile(FMT2_STR("0:\tchk %0, %1") : : "d"(0), "d"(-1), FMT_INS);
+    CHECK_SIG;
+
+#if 0
+    /* FIXME: chk2 not correctly translated. */
+    int bounds[2] = { 0, 1 };
+    asm volatile(FMT2_STR("0:\tchk2.l %0, %1")
+                 : : "m"(bounds), "d"(2), FMT_INS);
+    CHECK_SIG;
+#endif
+
+    asm volatile(FMT2_STR("cmp.l %0, %1\n0:\ttrapv")
+                 : : "d"(INT_MIN), "d"(1), FMT_INS);
+    CHECK_SIG;
+
+    asm volatile(FMT2_STR("cmp.l %0, %0\n0:\ttrapeq")
+                 : : "d"(0), FMT_INS);
+    CHECK_SIG;
+
+    asm volatile(FMT2_STR("cmp.l %0, %0\n0:\ttrapeq.w #0x1234")
+                 : : "d"(0), FMT_INS);
+    CHECK_SIG;
+
+    asm volatile(FMT2_STR("cmp.l %0, %0\n0:\ttrapeq.l #0x12345678")
+                 : : "d"(0), FMT_INS);
+    CHECK_SIG;
+
+    asm volatile(FMT2_STR("fcmp.x %0, %0\n0:\tftrapeq")
+                 : : "f"(0.0L), FMT_INS);
+    CHECK_SIG;
+
+    expect_si_code = FPE_INTDIV;
+
+    asm volatile(FMT2_STR("0:\tdivs.w %1, %0")
+                 : "=d"(t0) : "d"(0), "0"(1), FMT_INS);
+    CHECK_SIG;
+
+    asm volatile(FMT2_STR("0:\tdivsl.l %2, %1:%0")
+                 : "=d"(t0), "=d"(t1) : "d"(0), "0"(1), FMT_INS);
+    CHECK_SIG;
+
+    expect_sig = SIGILL;
+    expect_si_code = ILL_ILLTRP;
+    asm volatile(FMT0_STR("trap #1") : : FMT_INS);
+    CHECK_SIG;
+    asm volatile(FMT0_STR("trap #2") : : FMT_INS);
+    CHECK_SIG;
+    asm volatile(FMT0_STR("trap #3") : : FMT_INS);
+    CHECK_SIG;
+    asm volatile(FMT0_STR("trap #4") : : FMT_INS);
+    CHECK_SIG;
+    asm volatile(FMT0_STR("trap #5") : : FMT_INS);
+    CHECK_SIG;
+    asm volatile(FMT0_STR("trap #6") : : FMT_INS);
+    CHECK_SIG;
+    asm volatile(FMT0_STR("trap #7") : : FMT_INS);
+    CHECK_SIG;
+    asm volatile(FMT0_STR("trap #8") : : FMT_INS);
+    CHECK_SIG;
+    asm volatile(FMT0_STR("trap #9") : : FMT_INS);
+    CHECK_SIG;
+    asm volatile(FMT0_STR("trap #10") : : FMT_INS);
+    CHECK_SIG;
+    asm volatile(FMT0_STR("trap #11") : : FMT_INS);
+    CHECK_SIG;
+    asm volatile(FMT0_STR("trap #12") : : FMT_INS);
+    CHECK_SIG;
+    asm volatile(FMT0_STR("trap #13") : : FMT_INS);
+    CHECK_SIG;
+    asm volatile(FMT0_STR("trap #14") : : FMT_INS);
+    CHECK_SIG;
+
+    expect_sig = SIGTRAP;
+    expect_si_code = TRAP_BRKPT;
+    asm volatile(FMT0_STR("trap #15") : : FMT_INS);
+    CHECK_SIG;
+
+    return 0;
+}
diff --git a/tests/tcg/m68k/Makefile.target b/tests/tcg/m68k/Makefile.target
index 62f109eef46b..1163c7ef034d 100644
--- a/tests/tcg/m68k/Makefile.target
+++ b/tests/tcg/m68k/Makefile.target
@@ -3,5 +3,8 @@
 # m68k specific tweaks - specifically masking out broken tests
 #
 
+VPATH += $(SRC_PATH)/tests/tcg/m68k
+TESTS += trap
+
 # On m68k Linux supports 4k and 8k pages (but 8k is currently broken)
 EXTRA_RUNS+=run-test-mmap-4096 # run-test-mmap-8192
-- 
2.36.1


