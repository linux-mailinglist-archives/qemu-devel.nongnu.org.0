Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CD460C6A4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:39:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFMa-0005C3-SF; Tue, 25 Oct 2022 04:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1onEUD-0001MZ-NC
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 03:36:42 -0400
Received: from mout.kundenserver.de ([212.227.126.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1onETw-0003Gs-Oc
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 03:36:33 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N3KkM-1pD31S2MRG-010IeO; Tue, 25
 Oct 2022 09:36:12 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 8/8] linux-user: Add guest memory layout to exception dump
Date: Tue, 25 Oct 2022 09:36:06 +0200
Message-Id: <20221025073606.3114355-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025073606.3114355-1-laurent@vivier.eu>
References: <20221025073606.3114355-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:G9jKMuYoVWoWt2jJqSAba3APw0eXrshayjM7liBGYlBiviBAsGI
 iIFayHDaL0QZydRe+Apu0mApCHQ+FaLUEQ/JA2hC4am6ifU5TZAx9JBZO2eDdqT5uyty1Zn
 cxshEtw38hT/II6D1TFBkQ0m0lPaNj0T4cFWt6CMG+/7LF62jcT37SjmdItL4pKF9WJnZc2
 jUM/hzkNXoS3p+3xR+HHg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RoO/3xaegsE=:He8PWj8xmEHc7qp8b2Qmt2
 fznUKl4DtxyHd+lbh+VtFUXLz+5Ym1X6xOdUn0VtlQKjCHI0Of7d9madRKP8ceHCe4IkcUgg2
 Qy4Ma+/rfJmzvNNPA6KgFlYTEnUoKNFvXfAVjRbq9O32VFpEuZoh67N3NSqKtisO6mFmLC/L9
 owJnFLqIrVbF1HokKwKFLS1RwTg7uJLmqQI9bRqDkMJfhkAsfrIKx3DScZt+S2R73tmv5wwoL
 rgOBjslhwcoxREC8Zn7/Q9dZWsUCyZtnNuJagb7O6xg5wb/cm2Gk67KsSDN11O2jLvjAhuNuw
 n2s1ShkDLArHj9eZtYel0+6LQhabAsyZDPjotbdrr6sDJwVfCn1Y+4Ry31Jvyn0bqFbSvUp1A
 /ufKBrGYa86Jjs/FkCx55rUjEOMgXlU0KKQsEH3PvzziiQn+K14PAAIwD8+rhmPoyUQRa2kdF
 PKs4iifidVdUUO2m26ZhJF3lkE8z9mrg3moH6cjPlTZPQ7an+151eldQMWcsY74cbYQ1MesER
 mJfGgIK0rPhXysRZm2TT+fHKaxc5qvv0VzkEs2t+eRT1KtsF4uMQ551/CBofby1OSKDT2y2mF
 Hzj5eBvtznPbjPnVnb03TDwCArp6RHto3JnxU13LBFPxGGPGP4JI4+i6UEu1T3RbQs8tpW1cG
 jMJPEnL4XRcdWGxUyQxDJV0bNn0JCppr+k1b//UqRyiVcPfMh+F4PpKnbsOUCpUHF8O3BzmJc
 //3eqxP4UE0iKsvoLM+btY+w9qVKGzuywAUa+9lgSzfpISvrE/VF1WZYqTPJOzX/QSlrYk01E
 zAYELWA
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Helge Deller <deller@gmx.de>

When the emulation stops with a hard exception it's very useful for
debugging purposes to dump the current guest memory layout (for an
example see /proc/self/maps) beside the CPU registers.

The open_self_maps() function provides such a memory dump, but since
it's located in the syscall.c file, various changes (add #includes, make
this function externally visible, ...) are needed to be able to call it
from the existing EXCP_DUMP() macro.

This patch takes another approach by re-defining EXCP_DUMP() to call
target_exception_dump(), which is in syscall.c, consolidates the log
print functions and allows to add the call to dump the memory layout.

Beside a reduced code footprint, this approach keeps the changes across
the various callers minimal, and keeps EXCP_DUMP() highlighted as
important macro/function.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <Y1bzAWbw07WBKPxw@p100>
[lv: remove pc declaration and setting]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/cpu_loop-common.h | 15 +++------------
 linux-user/i386/cpu_loop.c   |  6 ++----
 linux-user/syscall.c         | 28 ++++++++++++++++++++++++++++
 3 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/linux-user/cpu_loop-common.h b/linux-user/cpu_loop-common.h
index 36ff5b14f2a7..e644d2ef9096 100644
--- a/linux-user/cpu_loop-common.h
+++ b/linux-user/cpu_loop-common.h
@@ -23,18 +23,9 @@
 #include "exec/log.h"
 #include "special-errno.h"
 
-#define EXCP_DUMP(env, fmt, ...)                                        \
-do {                                                                    \
-    CPUState *cs = env_cpu(env);                                        \
-    fprintf(stderr, fmt , ## __VA_ARGS__);                              \
-    fprintf(stderr, "Failing executable: %s\n", exec_path);             \
-    cpu_dump_state(cs, stderr, 0);                                      \
-    if (qemu_log_separate()) {                                          \
-        qemu_log(fmt, ## __VA_ARGS__);                                  \
-        qemu_log("Failing executable: %s\n", exec_path);                \
-        log_cpu_state(cs, 0);                                           \
-    }                                                                   \
-} while (0)
+void target_exception_dump(CPUArchState *env, const char *fmt, int code);
+#define EXCP_DUMP(env, fmt, code) \
+    target_exception_dump(env, fmt, code)
 
 void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs);
 #endif
diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index 42837399bcae..865413c08f07 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -201,7 +201,6 @@ void cpu_loop(CPUX86State *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr;
-    abi_ulong pc;
     abi_ulong ret;
 
     for(;;) {
@@ -307,9 +306,8 @@ void cpu_loop(CPUX86State *env)
             cpu_exec_step_atomic(cs);
             break;
         default:
-            pc = env->segs[R_CS].base + env->eip;
-            EXCP_DUMP(env, "qemu: 0x%08lx: unhandled CPU exception 0x%x - aborting\n",
-                      (long)pc, trapnr);
+            EXCP_DUMP(env, "qemu: unhandled CPU exception 0x%x - aborting\n",
+                      trapnr);
             abort();
         }
         process_pending_signals(env);
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index e985ad167f21..8402c1399d3c 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -183,6 +183,7 @@ struct file_clone_range {
 #include "qapi/error.h"
 #include "fd-trans.h"
 #include "tcg/tcg.h"
+#include "cpu_loop-common.h"
 
 #ifndef CLONE_IO
 #define CLONE_IO                0x80000000      /* Clone io context */
@@ -8169,6 +8170,33 @@ static int is_proc_myself(const char *filename, const char *entry)
     return 0;
 }
 
+static void excp_dump_file(FILE *logfile, CPUArchState *env,
+                      const char *fmt, int code)
+{
+    if (logfile) {
+        CPUState *cs = env_cpu(env);
+
+        fprintf(logfile, fmt, code);
+        fprintf(logfile, "Failing executable: %s\n", exec_path);
+        cpu_dump_state(cs, logfile, 0);
+        open_self_maps(env, fileno(logfile));
+    }
+}
+
+void target_exception_dump(CPUArchState *env, const char *fmt, int code)
+{
+    /* dump to console */
+    excp_dump_file(stderr, env, fmt, code);
+
+    /* dump to log file */
+    if (qemu_log_separate()) {
+        FILE *logfile = qemu_log_trylock();
+
+        excp_dump_file(logfile, env, fmt, code);
+        qemu_log_unlock(logfile);
+    }
+}
+
 #if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN || \
     defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA)
 static int is_proc(const char *filename, const char *entry)
-- 
2.37.3


