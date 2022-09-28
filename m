Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 894CB5EDA46
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 12:42:07 +0200 (CEST)
Received: from localhost ([::1]:46990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odUVy-0004Sp-Jx
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 06:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE1-00083g-JB
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:25 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:33613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSDy-000893-FJ
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:24 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MYNS0-1oiWS22F9O-00VRoj; Wed, 28
 Sep 2022 10:15:20 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 03/38] linux-user: Add missing signals in strace output
Date: Wed, 28 Sep 2022 10:14:42 +0200
Message-Id: <20220928081517.734954-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MLnAivncBADC0ZE41ncCBvsFpLYjI1w75tR8VXErhKn4+fs+O5E
 wci898I0JbVSRkk48o4zqRm7xvriIzHAvFUfS3q/I11j6e9jvO6Jr71EpQQ7aXlnR9/ob9Y
 BUN0WEOUlY8x1tbiyrO8Po4Z4qVQTUwZBiA1bZ1l1iPFnLdahD9e6s1iGybdKaUrNDHtmku
 vmbfwNvGpdAdzUmrk4Vew==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EBFbcqmieSY=:U70A1OO0wpDFXJeywX/7Gw
 LxFR2+qmbrLFtVbkXxn6l918czvBHjXjunN0K7vi+czNmnc5tXisBUxESrEz/99w5n/5LZcXI
 wjUHbzeX+NHSheGYhTUe8E9ap6iaIQQiuxAMo/fDslTSB7C8hUGS05PPUowRDa3vHA9DcX4uS
 dgK7d9FXLIYeYgT+5FEZ9mFn43zmXT6zr7uQyLvmRI4BodQCbJmD5146GNPdW8n7aMt5Aaex0
 CVNIzUz5+uaLbvLX8oDUygIF2WzPX8/deP5WBKPofn6bhEF9DaeIS1m1ykB3tRCM9yplHr6lQ
 vGGAMJPnJnoT7AO7EWHrDLvOU+PSNSQ24ZekicEMDZoYGQVUnU1FeTQ8HLmD3WuFmx0cQSbvn
 sIqyZ9EzoGPVb1wMM5np22lqx0tsyQfIx3p8XvZvhHR2h6mruKSeOuEXvCLDCRE1imtCemg5Q
 Eg6dEzbZqBZjMVQKDO2W6aLI00fvcEjdYglsEsINObjeGhweZPk2BTCaBvl7zEqTy2Rymxoh8
 70gGERkweeJQW05LYwMg4LVJ6XTUKo2MxIkUYNm/GiyQkwBM6tkE/I5zqhDWiPCBU49gP7trs
 js8DjOjGS5Q5ijtuK7bBfVObo6NWR59eh3tAm87pBvJuFao/5KxbO941yPvHrz0hJnM5JkYCQ
 QupxgfSt2uzhn2mzBb69pMdl/WHN1io/Nem0C1ceC1Ww53saP+WumVCT2g4eHVfiGmojt6LKu
 6aTDEi7mjT6BZAtAUIC+6KtRGQrAn8paMbqP5jJcQrGwDFfyzA+pFYWRgoPKz7vCVNtZNgnJV
 K38vJmD
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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


