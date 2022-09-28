Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BDC5EE6A2
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:30:57 +0200 (CEST)
Received: from localhost ([::1]:48310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oddho-0005JG-LW
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddek-0007ww-Ea
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:46 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:46731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddei-0006Mt-Ab
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:46 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MK3a4-1owwQE1ZiY-00LYD0; Wed, 28
 Sep 2022 22:27:40 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 03/37] linux-user: Add missing signals in strace output
Date: Wed, 28 Sep 2022 22:27:03 +0200
Message-Id: <20220928202737.793171-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:n5+Z0huhsflpMEKFzJAv42WA7f+6fMAqUi4MQ5Usr7PvWT93wZG
 By/RWi6xaul+7WmJCUR/5wSvxUqOauBxpUDdtX2b87rv1LsJTAaPVFeI8U838PU3SaGyhX2
 zbzh7hce9NYN0ALn/2eivfKDbA5M1+lgk/i9OLUNslRNPtn6hDGXkwgAkBEOLEk1TW/fy25
 Va0f7bmk4yP2tJrjZ7c8w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Swb5jqbKdQs=:mgKqPtVG40HLKBw2d3fAHz
 ZPKjCChbygY6BUv6vgt3wI9zhxRmcbIYoXzzgodrZu7rx8YPPX2DfPxg+Pe6qrEELHbmmn54e
 qs1ZhXS8mxdrmvYPwRX9wSVQYDuDWoQ+hy8lR7ijYvKNqDmNypysSJFHuFHpAq21CdLMwuqOd
 Vv3ouktxW/04TDWNWNX3eF8GAj7Kd3ZvPvhH6jcu7Ru0Y0qVefNysCW/I0dptcsuZOpPcN6y4
 BlNEHDNaIJuJHjjH+ATn+ny9nnyTp2qu+JE0rH94tUFaUkNikeFuve6buwCHOZa9340FaFnrT
 LJcdbyuBgpTCYOenfMFPBDtJAhXxjFF9fznpjrSqiFoZLSVkD4oi/0UeQo7hGvU2C+iEd59kW
 b7w8AWZboNipAf46JldqBY3m6bdwnrtfb3hEBVPAgSZcwVCWTIqaE19TO+2Buud8+4rE0o36z
 n/rg3Tza+IbjYwrccFa9BnjThgxdtRlHTO8kyFGY5mE7R29PR3iJWceygoM6elVDUoXOf/oVS
 LoLXk5okPunJY/aT2a/MBZSVKW0Pd69O/DcglB7XkizVYglZYD8icKo5YRAz0qgCaeCY524bU
 1dQsvIN2RxF1FD+HDk8m4QoZRU9lwZvlJB5H3ktejH2iA9glI5+d32gOIZ6qLheiwZkTbm+F7
 YMxUx5V/C4bnaq61ummxnCUHL57yALDhhEGmS0Q681oLt6trTOTJjUA4UV0WDHRW/tTYn+UPX
 rw8CPUejf3NkCMKYV4/pmcOpsv3S8H/DAcb3r9YWnrM+Dux41eDjCEIaQ15FGGq5dfT9sdIOT
 TfCV6Ce
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Helge Deller <deller@gmx.de>

Some of the guest signal numbers are currently not converted to
their representative names in the strace output, e.g. SIGVTALRM.

This patch introduces a smart way to generate and keep in sync the
host-to-guest and guest-to-host signal conversion tables for usage in
the qemu signal and strace code. This ensures that any signals
will now show up in both tables.

There is no functional change in this patch - with the exception that yet
missing signal names now show up in the strace code too.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220918194555.83535-2-deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/signal-common.h | 46 ++++++++++++++++++++++++++++++++++++++
 linux-user/signal.c        | 37 +++---------------------------
 linux-user/strace.c        | 30 +++++++++----------------
 3 files changed, 60 insertions(+), 53 deletions(-)

diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index 6a7e4a93fc13..3e2dc604c2fb 100644
--- a/linux-user/signal-common.h
+++ b/linux-user/signal-common.h
@@ -118,4 +118,50 @@ static inline void finish_sigsuspend_mask(int ret)
     }
 }
 
+#if defined(SIGSTKFLT) && defined(TARGET_SIGSTKFLT)
+#define MAKE_SIG_ENTRY_SIGSTKFLT        MAKE_SIG_ENTRY(SIGSTKFLT)
+#else
+#define MAKE_SIG_ENTRY_SIGSTKFLT
+#endif
+
+#if defined(SIGIOT) && defined(TARGET_SIGIOT)
+#define MAKE_SIG_ENTRY_SIGIOT           MAKE_SIG_ENTRY(SIGIOT)
+#else
+#define MAKE_SIG_ENTRY_SIGIOT
+#endif
+
+#define MAKE_SIGNAL_LIST \
+        MAKE_SIG_ENTRY(SIGHUP) \
+        MAKE_SIG_ENTRY(SIGINT) \
+        MAKE_SIG_ENTRY(SIGQUIT) \
+        MAKE_SIG_ENTRY(SIGILL) \
+        MAKE_SIG_ENTRY(SIGTRAP) \
+        MAKE_SIG_ENTRY(SIGABRT) \
+        MAKE_SIG_ENTRY(SIGBUS) \
+        MAKE_SIG_ENTRY(SIGFPE) \
+        MAKE_SIG_ENTRY(SIGKILL) \
+        MAKE_SIG_ENTRY(SIGUSR1) \
+        MAKE_SIG_ENTRY(SIGSEGV) \
+        MAKE_SIG_ENTRY(SIGUSR2) \
+        MAKE_SIG_ENTRY(SIGPIPE) \
+        MAKE_SIG_ENTRY(SIGALRM) \
+        MAKE_SIG_ENTRY(SIGTERM) \
+        MAKE_SIG_ENTRY(SIGCHLD) \
+        MAKE_SIG_ENTRY(SIGCONT) \
+        MAKE_SIG_ENTRY(SIGSTOP) \
+        MAKE_SIG_ENTRY(SIGTSTP) \
+        MAKE_SIG_ENTRY(SIGTTIN) \
+        MAKE_SIG_ENTRY(SIGTTOU) \
+        MAKE_SIG_ENTRY(SIGURG) \
+        MAKE_SIG_ENTRY(SIGXCPU) \
+        MAKE_SIG_ENTRY(SIGXFSZ) \
+        MAKE_SIG_ENTRY(SIGVTALRM) \
+        MAKE_SIG_ENTRY(SIGPROF) \
+        MAKE_SIG_ENTRY(SIGWINCH) \
+        MAKE_SIG_ENTRY(SIGIO) \
+        MAKE_SIG_ENTRY(SIGPWR) \
+        MAKE_SIG_ENTRY(SIGSYS) \
+        MAKE_SIG_ENTRY_SIGSTKFLT \
+        MAKE_SIG_ENTRY_SIGIOT
+
 #endif
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 8d29bfaa6b5c..61c6fa3fcf12 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -53,40 +53,9 @@ abi_ulong default_rt_sigreturn;
 QEMU_BUILD_BUG_ON(__SIGRTMAX + 1 != _NSIG);
 #endif
 static uint8_t host_to_target_signal_table[_NSIG] = {
-    [SIGHUP] = TARGET_SIGHUP,
-    [SIGINT] = TARGET_SIGINT,
-    [SIGQUIT] = TARGET_SIGQUIT,
-    [SIGILL] = TARGET_SIGILL,
-    [SIGTRAP] = TARGET_SIGTRAP,
-    [SIGABRT] = TARGET_SIGABRT,
-/*    [SIGIOT] = TARGET_SIGIOT,*/
-    [SIGBUS] = TARGET_SIGBUS,
-    [SIGFPE] = TARGET_SIGFPE,
-    [SIGKILL] = TARGET_SIGKILL,
-    [SIGUSR1] = TARGET_SIGUSR1,
-    [SIGSEGV] = TARGET_SIGSEGV,
-    [SIGUSR2] = TARGET_SIGUSR2,
-    [SIGPIPE] = TARGET_SIGPIPE,
-    [SIGALRM] = TARGET_SIGALRM,
-    [SIGTERM] = TARGET_SIGTERM,
-#ifdef SIGSTKFLT
-    [SIGSTKFLT] = TARGET_SIGSTKFLT,
-#endif
-    [SIGCHLD] = TARGET_SIGCHLD,
-    [SIGCONT] = TARGET_SIGCONT,
-    [SIGSTOP] = TARGET_SIGSTOP,
-    [SIGTSTP] = TARGET_SIGTSTP,
-    [SIGTTIN] = TARGET_SIGTTIN,
-    [SIGTTOU] = TARGET_SIGTTOU,
-    [SIGURG] = TARGET_SIGURG,
-    [SIGXCPU] = TARGET_SIGXCPU,
-    [SIGXFSZ] = TARGET_SIGXFSZ,
-    [SIGVTALRM] = TARGET_SIGVTALRM,
-    [SIGPROF] = TARGET_SIGPROF,
-    [SIGWINCH] = TARGET_SIGWINCH,
-    [SIGIO] = TARGET_SIGIO,
-    [SIGPWR] = TARGET_SIGPWR,
-    [SIGSYS] = TARGET_SIGSYS,
+#define MAKE_SIG_ENTRY(sig)     [sig] = TARGET_##sig,
+        MAKE_SIGNAL_LIST
+#undef MAKE_SIG_ENTRY
     /* next signals stay the same */
 };
 
diff --git a/linux-user/strace.c b/linux-user/strace.c
index 7d882526da03..a4eeef7ae1ca 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -17,6 +17,7 @@
 #include "qemu.h"
 #include "user-internals.h"
 #include "strace.h"
+#include "signal-common.h"
 
 struct syscallname {
     int nr;
@@ -141,30 +142,21 @@ if( cmd == val ) { \
     qemu_log("%d", cmd);
 }
 
+static const char * const target_signal_name[] = {
+#define MAKE_SIG_ENTRY(sig)     [TARGET_##sig] = #sig,
+        MAKE_SIGNAL_LIST
+#undef MAKE_SIG_ENTRY
+};
+
 static void
 print_signal(abi_ulong arg, int last)
 {
     const char *signal_name = NULL;
-    switch(arg) {
-    case TARGET_SIGHUP: signal_name = "SIGHUP"; break;
-    case TARGET_SIGINT: signal_name = "SIGINT"; break;
-    case TARGET_SIGQUIT: signal_name = "SIGQUIT"; break;
-    case TARGET_SIGILL: signal_name = "SIGILL"; break;
-    case TARGET_SIGABRT: signal_name = "SIGABRT"; break;
-    case TARGET_SIGFPE: signal_name = "SIGFPE"; break;
-    case TARGET_SIGKILL: signal_name = "SIGKILL"; break;
-    case TARGET_SIGSEGV: signal_name = "SIGSEGV"; break;
-    case TARGET_SIGPIPE: signal_name = "SIGPIPE"; break;
-    case TARGET_SIGALRM: signal_name = "SIGALRM"; break;
-    case TARGET_SIGTERM: signal_name = "SIGTERM"; break;
-    case TARGET_SIGUSR1: signal_name = "SIGUSR1"; break;
-    case TARGET_SIGUSR2: signal_name = "SIGUSR2"; break;
-    case TARGET_SIGCHLD: signal_name = "SIGCHLD"; break;
-    case TARGET_SIGCONT: signal_name = "SIGCONT"; break;
-    case TARGET_SIGSTOP: signal_name = "SIGSTOP"; break;
-    case TARGET_SIGTTIN: signal_name = "SIGTTIN"; break;
-    case TARGET_SIGTTOU: signal_name = "SIGTTOU"; break;
+
+    if (arg < ARRAY_SIZE(target_signal_name)) {
+        signal_name = target_signal_name[arg];
     }
+
     if (signal_name == NULL) {
         print_raw_param("%ld", arg, last);
         return;
-- 
2.37.3


