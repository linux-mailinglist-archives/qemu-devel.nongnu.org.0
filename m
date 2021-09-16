Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2894640DDD3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:19:06 +0200 (CEST)
Received: from localhost ([::1]:39938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtAH-0002fC-7x
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mQt4C-0002nO-68
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:12:48 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:59557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mQt49-00049b-KI
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:12:47 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N3bCH-1mqYsl0OMl-010Yw0; Thu, 16
 Sep 2021 17:12:40 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 03/10] linux-user: Split signal-related prototypes into
 signal-common.h
Date: Thu, 16 Sep 2021 17:12:30 +0200
Message-Id: <20210916151237.1188301-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916151237.1188301-1-laurent@vivier.eu>
References: <20210916151237.1188301-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:gl6U6ZqkX/YkcNiivHc5N974e/TkhW08d+De8vKoDUcVLaiHpKi
 7V+4A8Tl0ZoFC5O7UYng0kqCGIbBUZlVUDtc6Tt5rV9qQySVJbeyZzrf5WpZj1LPhwzjLdV
 DSFM16CgmEVNdhDvqmUXmtX3CYlZMXTsxKrTOchisRRDVOewCsgsbmUriZYRhY4zKZM2Ywa
 sT8pJ9jb7U3Bjnpb+zW5A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:t84rETSWops=:yW1vv60k+Dkt592O65CJSi
 y5LqVGs7pCyt/738DGokbrfMtJLw5Khi63agm+aS1/a5HvOnh1+FGnUuHV2HK4XCFxoCiyD68
 jY7TVevrPT6HqsMyKoXHsKWGCTwY4bnYVYTl/kFm6RpxAMiH6fMAdEXTBOWxHIpk2RKCIXY+8
 k+NOBfEUSqWBF3jRHJ8Hi7bQLaB4pEzGTlpP4ucsP8kHsVlnB8Oc03h5SfiF+qVdb2UJ0F17W
 QCuDBpu/8CYr8gnoA8zV3hMmtv/E/D+085hj3/J6htwrJfwk5R3FejcPkwbELCeWvH0LinkrA
 SN/+NgiearqxFYgV+jzeUwCA12joZDDqp8o1Ur74Pms63o05HJcNKAx8yHTq/RYcxwjae3tIl
 ShGUjSlNrfgkqkwkBawklmEHQV9Vx82hveoqcGmVNUfxuCCuHZEHGokQfv2BmoKWcLFjaEoY+
 B0MsaAjS6HPwRUgBZxkdw8eS5QjyPpJsZMhZaNcO+3AVW2OHzslc4O3lpDqIfY9YPZi/Pjdik
 jY6be7S1gdajv24BLjhfqx2au2+XBOf3VeRWkNFovmqgmP5IXkwr1ofDnmV+cMXTLJYc2QZWh
 fl/6rOiYP4DX0Xs/Z/5hjl470z6rZNInzMC71Yy8t4L72JdFWQiro64xoZhk51iGRBc9ACY8O
 s4yKEoTO3pJpARgq3QGKfRN+2XiDyH1d968vLjK4moISz03EWUYtfjGenAErmKf/Nep/cnSGD
 3Qx7Dk8rJu4ucI6vczTN83XVKpbttjA4wj6DMQ==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Split the signal related prototypes into the existing header file
signal-common.h, and include it in those places that now require it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210908154405.15417-4-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/aarch64/cpu_loop.c    |  1 +
 linux-user/alpha/cpu_loop.c      |  1 +
 linux-user/arm/cpu_loop.c        |  1 +
 linux-user/cris/cpu_loop.c       |  1 +
 linux-user/fd-trans.c            |  1 +
 linux-user/hexagon/cpu_loop.c    |  1 +
 linux-user/hppa/cpu_loop.c       |  1 +
 linux-user/i386/cpu_loop.c       |  1 +
 linux-user/m68k/cpu_loop.c       |  1 +
 linux-user/main.c                |  1 +
 linux-user/microblaze/cpu_loop.c |  1 +
 linux-user/mips/cpu_loop.c       |  1 +
 linux-user/nios2/cpu_loop.c      |  1 +
 linux-user/openrisc/cpu_loop.c   |  1 +
 linux-user/ppc/cpu_loop.c        |  1 +
 linux-user/qemu.h                | 36 --------------------------------
 linux-user/riscv/cpu_loop.c      |  1 +
 linux-user/s390x/cpu_loop.c      |  1 +
 linux-user/sh4/cpu_loop.c        |  1 +
 linux-user/signal-common.h       | 36 ++++++++++++++++++++++++++++++++
 linux-user/sparc/cpu_loop.c      |  1 +
 linux-user/syscall.c             |  1 +
 linux-user/xtensa/cpu_loop.c     |  1 +
 23 files changed, 57 insertions(+), 36 deletions(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index ee72a1c20f06..5cac76f67b09 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 #include "qemu/guest-random.h"
 #include "semihosting/common-semi.h"
 #include "target/arm/syndrome.h"
diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index 7ce2461a0288..8464047368a3 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 void cpu_loop(CPUAlphaState *env)
 {
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 69632d15be18..5556d381463b 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -22,6 +22,7 @@
 #include "qemu.h"
 #include "elf.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 #include "semihosting/common-semi.h"
 
 #define get_user_code_u32(x, gaddr, env)                \
diff --git a/linux-user/cris/cpu_loop.c b/linux-user/cris/cpu_loop.c
index 334edddd1e29..8c9fc3127ec3 100644
--- a/linux-user/cris/cpu_loop.c
+++ b/linux-user/cris/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 void cpu_loop(CPUCRISState *env)
 {
diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
index 86b6f484d30b..48203c1af9d6 100644
--- a/linux-user/fd-trans.c
+++ b/linux-user/fd-trans.c
@@ -28,6 +28,7 @@
 #endif
 #include "qemu.h"
 #include "fd-trans.h"
+#include "signal-common.h"
 
 enum {
     QEMU_IFLA_BR_UNSPEC,
diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c
index bc34f5d7c300..348d2dc34130 100644
--- a/linux-user/hexagon/cpu_loop.c
+++ b/linux-user/hexagon/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 #include "internal.h"
 
 void cpu_loop(CPUHexagonState *env)
diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 82d8183821ad..c3661994a570 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 static abi_ulong hppa_lws(CPUHPPAState *env)
 {
diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index f813e87294af..ee2e139a0634 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 /***********************************************************/
 /* CPUX86 core interface */
diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index c7a500b58c48..3a330401bf2d 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 void cpu_loop(CPUM68KState *env)
 {
diff --git a/linux-user/main.c b/linux-user/main.c
index a6094563b6bf..4f5167073574 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -49,6 +49,7 @@
 #include "cpu_loop-common.h"
 #include "crypto/init.h"
 #include "fd-trans.h"
+#include "signal-common.h"
 
 #ifndef AT_FLAGS_PRESERVE_ARGV0
 #define AT_FLAGS_PRESERVE_ARGV0_BIT 0
diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index c3396a6e09bd..0d2c8f8dea8a 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 void cpu_loop(CPUMBState *env)
 {
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 9d813ece4e75..7dfaa0cb1e11 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 #include "elf.h"
 #include "internal.h"
 #include "fpu_helper.h"
diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 9869083fa192..68f95d7ad7b2 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 void cpu_loop(CPUNios2State *env)
 {
diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
index b33fa7771875..f6c67859887b 100644
--- a/linux-user/openrisc/cpu_loop.c
+++ b/linux-user/openrisc/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 void cpu_loop(CPUOpenRISCState *env)
 {
diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index fa91ea0eed99..ace431238c27 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 static inline uint64_t cpu_ppc_get_tb(CPUPPCState *env)
 {
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index ad2d49fed9fb..76d3f5e7eb98 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -415,42 +415,6 @@ extern long safe_syscall_base(int *pending, long number, ...);
 /* syscall.c */
 int host_to_target_waitstatus(int status);
 
-/* signal.c */
-void process_pending_signals(CPUArchState *cpu_env);
-void signal_init(void);
-int queue_signal(CPUArchState *env, int sig, int si_type,
-                 target_siginfo_t *info);
-void host_to_target_siginfo(target_siginfo_t *tinfo, const siginfo_t *info);
-void target_to_host_siginfo(siginfo_t *info, const target_siginfo_t *tinfo);
-int target_to_host_signal(int sig);
-int host_to_target_signal(int sig);
-long do_sigreturn(CPUArchState *env);
-long do_rt_sigreturn(CPUArchState *env);
-abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr,
-                        CPUArchState *env);
-int do_sigprocmask(int how, const sigset_t *set, sigset_t *oldset);
-abi_long do_swapcontext(CPUArchState *env, abi_ulong uold_ctx,
-                        abi_ulong unew_ctx, abi_long ctx_size);
-/**
- * block_signals: block all signals while handling this guest syscall
- *
- * Block all signals, and arrange that the signal mask is returned to
- * its correct value for the guest before we resume execution of guest code.
- * If this function returns non-zero, then the caller should immediately
- * return -TARGET_ERESTARTSYS to the main loop, which will take the pending
- * signal and restart execution of the syscall.
- * If block_signals() returns zero, then the caller can continue with
- * emulation of the system call knowing that no signals can be taken
- * (and therefore that no race conditions will result).
- * This should only be called once, because if it is called a second time
- * it will always return non-zero. (Think of it like a mutex that can't
- * be recursively locked.)
- * Signals will be unblocked again by process_pending_signals().
- *
- * Return value: non-zero if there was a pending signal, zero if not.
- */
-int block_signals(void); /* Returns non zero if signal pending */
-
 #ifdef TARGET_I386
 /* vm86.c */
 void save_v86_state(CPUX86State *env);
diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 74a9628dc9b5..47978c4e3543 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -22,6 +22,7 @@
 #include "qemu/error-report.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 #include "elf.h"
 #include "semihosting/common-semi.h"
 
diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
index 6a69a6dd2609..ae70f630532d 100644
--- a/linux-user/s390x/cpu_loop.c
+++ b/linux-user/s390x/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 /* s390x masks the fault address it reports in si_addr for SIGSEGV and SIGBUS */
 #define S390X_FAIL_ADDR_MASK -4096LL
diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
index 222ed1c670c4..06e4a4d00751 100644
--- a/linux-user/sh4/cpu_loop.c
+++ b/linux-user/sh4/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 void cpu_loop(CPUSH4State *env)
 {
diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index ea86328b289a..58ea23f6ea94 100644
--- a/linux-user/signal-common.h
+++ b/linux-user/signal-common.h
@@ -47,4 +47,40 @@ void setup_frame(int sig, struct target_sigaction *ka,
 void setup_rt_frame(int sig, struct target_sigaction *ka,
                     target_siginfo_t *info,
                     target_sigset_t *set, CPUArchState *env);
+
+void process_pending_signals(CPUArchState *cpu_env);
+void signal_init(void);
+int queue_signal(CPUArchState *env, int sig, int si_type,
+                 target_siginfo_t *info);
+void host_to_target_siginfo(target_siginfo_t *tinfo, const siginfo_t *info);
+void target_to_host_siginfo(siginfo_t *info, const target_siginfo_t *tinfo);
+int target_to_host_signal(int sig);
+int host_to_target_signal(int sig);
+long do_sigreturn(CPUArchState *env);
+long do_rt_sigreturn(CPUArchState *env);
+abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr,
+                        CPUArchState *env);
+int do_sigprocmask(int how, const sigset_t *set, sigset_t *oldset);
+abi_long do_swapcontext(CPUArchState *env, abi_ulong uold_ctx,
+                        abi_ulong unew_ctx, abi_long ctx_size);
+/**
+ * block_signals: block all signals while handling this guest syscall
+ *
+ * Block all signals, and arrange that the signal mask is returned to
+ * its correct value for the guest before we resume execution of guest code.
+ * If this function returns non-zero, then the caller should immediately
+ * return -TARGET_ERESTARTSYS to the main loop, which will take the pending
+ * signal and restart execution of the syscall.
+ * If block_signals() returns zero, then the caller can continue with
+ * emulation of the system call knowing that no signals can be taken
+ * (and therefore that no race conditions will result).
+ * This should only be called once, because if it is called a second time
+ * it will always return non-zero. (Think of it like a mutex that can't
+ * be recursively locked.)
+ * Signals will be unblocked again by process_pending_signals().
+ *
+ * Return value: non-zero if there was a pending signal, zero if not.
+ */
+int block_signals(void); /* Returns non zero if signal pending */
+
 #endif
diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 02532f198df8..b2c061119430 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 #define SPARC64_STACK_BIAS 2047
 
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 4ac2801e495a..ad635ed3a5fd 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -128,6 +128,7 @@
 
 #include "qemu.h"
 #include "strace.h"
+#include "signal-common.h"
 #include "qemu/guest-random.h"
 #include "qemu/selfmap.h"
 #include "user/syscall-trace.h"
diff --git a/linux-user/xtensa/cpu_loop.c b/linux-user/xtensa/cpu_loop.c
index 64831c91996a..bb5335e2b6cb 100644
--- a/linux-user/xtensa/cpu_loop.c
+++ b/linux-user/xtensa/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 
 static void xtensa_rfw(CPUXtensaState *env)
 {
-- 
2.31.1


