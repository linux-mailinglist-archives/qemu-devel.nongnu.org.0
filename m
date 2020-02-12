Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC7215A99A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 14:01:10 +0100 (CET)
Received: from localhost ([::1]:37196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1rdd-0003KE-Pp
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 08:01:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60899)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j1rai-0007Zq-EU
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 07:58:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j1raO-0003r0-1h
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 07:58:08 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:46449)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1j1raN-0003oq-Bj
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 07:57:47 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N95mR-1jWfpe0IJL-0163yD; Wed, 12 Feb 2020 13:57:05 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/4] linux-user: fix TARGET_NSIG and _NSIG uses
Date: Wed, 12 Feb 2020 13:56:57 +0100
Message-Id: <20200212125658.644558-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200212125658.644558-1-laurent@vivier.eu>
References: <20200212125658.644558-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1K87h0YECN1DOrif4jlPfK1AnLqj9HcewBJexoZAsBxqOzEAoCa
 8wki7Bqt4HO2/YvawsRV8yOP36fb3feib32cdwAiziJQ7OUputj2Coyju7uhut04/7Vwg2N
 gX+ojcj5Io/fzQRxLJSEEjNTr/IeDJcCnEIa6IL9Mr9Mzk+l/0Fw8Mbl7VPmWbi592AzFlK
 W1tbVSL3cKS2WQA9XTPTA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jVLYmX8mgWQ=:qqbYrzwNtKwKUry5T3Gw1W
 /yLtjtgCh1heb0uWM9hJcQnqRSQAnFVi7Iy4DftS3fOjg+m3wJb1xsF6fdv8MvDtTGdEpCT93
 9fu1ua5BVX54SKW9MmvibXt91+PhyWsLgR6rwTeVgFzHZ5wxl34rmf+Kf+9h6KS8yXLSgLSj+
 Yj//qC6HXqxwfAjztGWg1pSw0O+bGsI4V/Za0o6yYqDuow+bJqoQuGTU2EdrbmmLLZd1EqXnA
 fVIjrvZ38xt/sgdq/I+djMEZcorqEfkN92OVW4KaHlLJ+sPXRgObIf/pO9QZDrIPlgB03tEhg
 GMILCgf1BErzqIVg/bvRgevvQtlEEUfgDrJyuzNBAJTnlPELQpd4eFYOhrCKI0Yt7Ov/AW0Da
 qUM4JP/XUrLO4LEDOO89qtdiGM+Wxc03AjpJf3Qd0MM9xs6rPShQH7w7it4bA7F0QaxOQHnsp
 SJkamY+Pyxvwml1tLqaDrpixKXx/4hLUEP3tsetFD2Tq/qPlMDcITBX0hi797CAwhQokL4n78
 8ZgwK87qQWPrwO+h6irkTlYygzp4d4G3xnH7P5KOhIzwKbvzV4pZNVLSO51TFC33Nj0SilS4r
 j586Be6gHR+KpIdGEW3s9nMem10boZBlNFvsdDKzIF8BXfJ7a8d9kteMRNKYhtSRkUeTVPWTj
 X7dSaVhDTSU1xT5uvYH3iJ2pW1Ikp4yaYnohtJlKMY8yGVTw6bXbLIl7SkmCzw/bsrNnMc0Gb
 QbeG3mPbdf/NTDfr043dAaTNFNlvUM2iLIIaBg3IjghcuGfyj2StwM7fm1hcXlRcdet9QcJ/G
 lamRSBp57M0upDx5Su8wy8NFRPJK35aVUKpcBisk/VYHJyrCfkyaiUW1nfd3nBqNaU1djaH
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
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
 Marlies Ruck <marlies.ruck@gmail.com>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>,
 Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
 Josh Kunz <jkz@google.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Matus Kysel <mkysel@tachyum.com>, milos.stojanovic@rt-rk.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Valid signal numbers are between 1 (SIGHUP) and SIGRTMAX.

System includes define _NSIG to SIGRTMAX + 1, but
QEMU (like kernel) defines TARGET_NSIG to TARGET_SIGRTMAX.

Fix all the checks involving the signal range.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---

Notes:
    v2: replace i, j by target_sig, host_sig

 linux-user/signal.c | 52 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 37 insertions(+), 15 deletions(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 246315571c09..c1e664f97a7c 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -30,6 +30,15 @@ static struct target_sigaction sigact_table[TARGET_NSIG];
 static void host_signal_handler(int host_signum, siginfo_t *info,
                                 void *puc);
 
+
+/*
+ * System includes define _NSIG as SIGRTMAX + 1,
+ * but qemu (like the kernel) defines TARGET_NSIG as TARGET_SIGRTMAX
+ * and the first signal is SIGHUP defined as 1
+ * Signal number 0 is reserved for use as kill(pid, 0), to test whether
+ * a process exists without sending it a signal.
+ */
+QEMU_BUILD_BUG_ON(__SIGRTMAX + 1 != _NSIG);
 static uint8_t host_to_target_signal_table[_NSIG] = {
     [SIGHUP] = TARGET_SIGHUP,
     [SIGINT] = TARGET_SIGINT,
@@ -67,19 +76,24 @@ static uint8_t host_to_target_signal_table[_NSIG] = {
     [SIGSYS] = TARGET_SIGSYS,
     /* next signals stay the same */
 };
-static uint8_t target_to_host_signal_table[_NSIG];
 
+static uint8_t target_to_host_signal_table[TARGET_NSIG + 1];
+
+/* valid sig is between 1 and _NSIG - 1 */
 int host_to_target_signal(int sig)
 {
-    if (sig < 0 || sig >= _NSIG)
+    if (sig < 1 || sig >= _NSIG) {
         return sig;
+    }
     return host_to_target_signal_table[sig];
 }
 
+/* valid sig is between 1 and TARGET_NSIG */
 int target_to_host_signal(int sig)
 {
-    if (sig < 0 || sig >= _NSIG)
+    if (sig < 1 || sig > TARGET_NSIG) {
         return sig;
+    }
     return target_to_host_signal_table[sig];
 }
 
@@ -100,11 +114,15 @@ static inline int target_sigismember(const target_sigset_t *set, int signum)
 void host_to_target_sigset_internal(target_sigset_t *d,
                                     const sigset_t *s)
 {
-    int i;
+    int host_sig, target_sig;
     target_sigemptyset(d);
-    for (i = 1; i <= TARGET_NSIG; i++) {
-        if (sigismember(s, i)) {
-            target_sigaddset(d, host_to_target_signal(i));
+    for (host_sig = 1; host_sig < _NSIG; host_sig++) {
+        target_sig = host_to_target_signal(host_sig);
+        if (target_sig < 1 || target_sig > TARGET_NSIG) {
+            continue;
+        }
+        if (sigismember(s, host_sig)) {
+            target_sigaddset(d, target_sig);
         }
     }
 }
@@ -122,11 +140,15 @@ void host_to_target_sigset(target_sigset_t *d, const sigset_t *s)
 void target_to_host_sigset_internal(sigset_t *d,
                                     const target_sigset_t *s)
 {
-    int i;
+    int host_sig, target_sig;
     sigemptyset(d);
-    for (i = 1; i <= TARGET_NSIG; i++) {
-        if (target_sigismember(s, i)) {
-            sigaddset(d, target_to_host_signal(i));
+    for (target_sig = 1; target_sig <= TARGET_NSIG; target_sig++) {
+        host_sig = target_to_host_signal(target_sig);
+        if (host_sig < 1 || host_sig >= _NSIG) {
+            continue;
+        }
+        if (target_sigismember(s, target_sig)) {
+            sigaddset(d, host_sig);
         }
     }
 }
@@ -492,10 +514,10 @@ static void signal_table_init(void)
         if (host_to_target_signal_table[host_sig] == 0) {
             host_to_target_signal_table[host_sig] = host_sig;
         }
-    }
-    for (host_sig = 1; host_sig < _NSIG; host_sig++) {
         target_sig = host_to_target_signal_table[host_sig];
-        target_to_host_signal_table[target_sig] = host_sig;
+        if (target_sig <= TARGET_NSIG) {
+            target_to_host_signal_table[target_sig] = host_sig;
+        }
     }
 }
 
@@ -518,7 +540,7 @@ void signal_init(void)
     act.sa_sigaction = host_signal_handler;
     for(i = 1; i <= TARGET_NSIG; i++) {
 #ifdef TARGET_GPROF
-        if (i == SIGPROF) {
+        if (i == TARGET_SIGPROF) {
             continue;
         }
 #endif
-- 
2.24.1


