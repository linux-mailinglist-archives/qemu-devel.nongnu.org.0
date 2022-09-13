Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3030B5B7ABB
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 21:28:07 +0200 (CEST)
Received: from localhost ([::1]:60420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYBZm-0000x5-Dc
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 15:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oYBLp-0008S4-13
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 15:13:41 -0400
Received: from mout.gmx.net ([212.227.17.20]:43307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oYBLf-0007ea-UD
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 15:13:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663096404;
 bh=iZy4oWlz4gLRtGY1piJ1Up9ec0SQer8EDDaNHLcum+s=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=EGXJxFgctTPXyGGv05DWqK+C4HEGU+6uEbF12Gvwn+omfgYdn1J+FUyA82hNyzmCO
 HFcIYcT/EeLOpHs/OpZFoZYymaPY0TCyHQmhbrpkt2fOY3VzpvEzTF6DEouhHBYhOV
 nfucE8emPFyc1tQlxwpv+efJtgVDtglPxmgD7oG4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.190.164]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MqJqN-1p3gU30hGd-00nMNG; Tue, 13
 Sep 2022 21:13:24 +0200
From: Helge Deller <deller@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: deller@gmx.de
Subject: [PULL 01/12] linux-user: Add missing signals in strace output
Date: Tue, 13 Sep 2022 21:13:10 +0200
Message-Id: <20220913191321.96747-2-deller@gmx.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220913191321.96747-1-deller@gmx.de>
References: <20220913191321.96747-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0y6MOUtEM81PotWcZup72e6ipCQdPHy8oAukko5CEcRggvyGoVM
 Nxp4myf83H5w4/7v4sVeurgJd1gd3ZUNiWPWJ4wzP+4jPCxchGMhNWUGu1eakqVAx+sLRp/
 1ylTzmr9t2925AwmD7Wd6XR4jPOSxisu18RWuttQQHa+rowEht6VTyFvtNh8+sFoy/4MGU5
 PI3c6AWwuQEoBh+TM/OYQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CsM1wbk+SqA=:8uH9rMC2SCcYJoWvltLvqo
 UF3uIcID1biKJn3rk5IAgAFoVn8a0Rm5Rh0DfTVrHESn2F8RiWUV9xBzDg3eXRtdhTAjlyo+2
 saXEmLkJfZuHLXuqJC1/b2y4XzFnWzmVPnLQ93dq9xshIywyA+9Vlc4KuKwkrYLdR8hI3e8/H
 DAPSW/hnhwqkMmNb4g8flHh6BIbOj/owk0K02YylkCnYJpG8ZOIAVHyoAdevc2Lj96ZWgZqe/
 Ve72UXez5XWvIwIacHOksEuCPBBtaoZXXSt4wfvLFGz3WFJaFkh1eNMtthNIwlPldBhIsceDZ
 v2pmt0YkS3Znak8TRw3OAiU9i/uMFO7HzcJAy8E7S3cGWcZafh94POZl2XK9JQEikEmVqBDc+
 QYbluN76qixhk8Fm4BVNg7PFxwtsYHGGyBHtsKR/FrpGejeMyu2NEFPIAbD+V21RJp0SbrkxD
 kjvnBluZlHqOucTJSRGF8qikf/wNLBETKXNSrfEWuMcvmvvbNY++y31z/f+J8h62itVLh0qwS
 76ddKRPl5SASF0boqF5kMEo59+2zLeXjHk/TXL42LNewyPXZgAC0FZHygrewhWYQYUo455edD
 xdUnEV3CfJjmODpcgCYv7AK9KNl7Y0gY733TC/fDA82phS7D+3qMW6q1fTk7gIKIpxdOUb/KV
 UWuS8NWFkdp9yQSiTz7+6ne3ebGz/0cKlfUWxGxOaqXNUOGa1cZZhZbcK26OCBeaUDR2epIMG
 kn3yqYYG4zZkoUNlwd0Ei1eQ+lcjtLzIEOw4W2vVwC1KlNnWwmzDhbxjZpHi7NzdmYYk16xg7
 PIu2wzzDOlxxpRFDx/iCVPdFAAjH2FRnd9wIRhNnvpZONVktmgSnUgBHG/lwjD41RlUYHQVw/
 LkpcdkGRmfCv3exuzpzVvHxa0UIrHbGko3kfT+zCv+xjjNqu0SeVAfd1oMB0jDRupjf8Yx67u
 QIjABRuFcciIFIXDPEI5iLAkxsDDFqIM1dI2d9Nu37+5fhdJs/uhfg7o7v738jdLnmXs3CZ/8
 pGsCDJT0Xbk0P1dOzCJsYX/CDjo1SWS332juZGUtlceawnMMQjg+/8KNF5E0vMTPXktV1nS9k
 I1s7CSj707JXX12FWBJ13dNMy0o4NBx0jLlQZbRoweTUchV4pc9NLYJsPXj5ClzMuHaFmhtDo
 rHGN6BA5iOPyG3SNIwoGRNan4x
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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

Some of the guest signal numbers are currently not converted to
their representative names in the strace output, e.g. SIGVTALRM.

This patch introduces a smart way to generate and keep in sync the
host-to-guest and guest-to-host signal conversion tables for usage in
the qemu signal and strace code. This ensures that any signals
will now show up in both tables.

There is no functional change in this patch - with the exception that yet
missing signal names now show up in the strace code too.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/signal-common.h | 46 ++++++++++++++++++++++++++++++++++++++
 linux-user/signal.c        | 37 +++---------------------------
 linux-user/strace.c        | 30 +++++++++----------------
 3 files changed, 60 insertions(+), 53 deletions(-)

diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index 6a7e4a93fc..3e2dc604c2 100644
=2D-- a/linux-user/signal-common.h
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
index 8d29bfaa6b..61c6fa3fcf 100644
=2D-- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -53,40 +53,9 @@ abi_ulong default_rt_sigreturn;
 QEMU_BUILD_BUG_ON(__SIGRTMAX + 1 !=3D _NSIG);
 #endif
 static uint8_t host_to_target_signal_table[_NSIG] =3D {
-    [SIGHUP] =3D TARGET_SIGHUP,
-    [SIGINT] =3D TARGET_SIGINT,
-    [SIGQUIT] =3D TARGET_SIGQUIT,
-    [SIGILL] =3D TARGET_SIGILL,
-    [SIGTRAP] =3D TARGET_SIGTRAP,
-    [SIGABRT] =3D TARGET_SIGABRT,
-/*    [SIGIOT] =3D TARGET_SIGIOT,*/
-    [SIGBUS] =3D TARGET_SIGBUS,
-    [SIGFPE] =3D TARGET_SIGFPE,
-    [SIGKILL] =3D TARGET_SIGKILL,
-    [SIGUSR1] =3D TARGET_SIGUSR1,
-    [SIGSEGV] =3D TARGET_SIGSEGV,
-    [SIGUSR2] =3D TARGET_SIGUSR2,
-    [SIGPIPE] =3D TARGET_SIGPIPE,
-    [SIGALRM] =3D TARGET_SIGALRM,
-    [SIGTERM] =3D TARGET_SIGTERM,
-#ifdef SIGSTKFLT
-    [SIGSTKFLT] =3D TARGET_SIGSTKFLT,
-#endif
-    [SIGCHLD] =3D TARGET_SIGCHLD,
-    [SIGCONT] =3D TARGET_SIGCONT,
-    [SIGSTOP] =3D TARGET_SIGSTOP,
-    [SIGTSTP] =3D TARGET_SIGTSTP,
-    [SIGTTIN] =3D TARGET_SIGTTIN,
-    [SIGTTOU] =3D TARGET_SIGTTOU,
-    [SIGURG] =3D TARGET_SIGURG,
-    [SIGXCPU] =3D TARGET_SIGXCPU,
-    [SIGXFSZ] =3D TARGET_SIGXFSZ,
-    [SIGVTALRM] =3D TARGET_SIGVTALRM,
-    [SIGPROF] =3D TARGET_SIGPROF,
-    [SIGWINCH] =3D TARGET_SIGWINCH,
-    [SIGIO] =3D TARGET_SIGIO,
-    [SIGPWR] =3D TARGET_SIGPWR,
-    [SIGSYS] =3D TARGET_SIGSYS,
+#define MAKE_SIG_ENTRY(sig)     [sig] =3D TARGET_##sig,
+        MAKE_SIGNAL_LIST
+#undef MAKE_SIG_ENTRY
     /* next signals stay the same */
 };

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 7d882526da..a4eeef7ae1 100644
=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -17,6 +17,7 @@
 #include "qemu.h"
 #include "user-internals.h"
 #include "strace.h"
+#include "signal-common.h"

 struct syscallname {
     int nr;
@@ -141,30 +142,21 @@ if( cmd =3D=3D val ) { \
     qemu_log("%d", cmd);
 }

+static const char * const target_signal_name[] =3D {
+#define MAKE_SIG_ENTRY(sig)     [TARGET_##sig] =3D #sig,
+        MAKE_SIGNAL_LIST
+#undef MAKE_SIG_ENTRY
+};
+
 static void
 print_signal(abi_ulong arg, int last)
 {
     const char *signal_name =3D NULL;
-    switch(arg) {
-    case TARGET_SIGHUP: signal_name =3D "SIGHUP"; break;
-    case TARGET_SIGINT: signal_name =3D "SIGINT"; break;
-    case TARGET_SIGQUIT: signal_name =3D "SIGQUIT"; break;
-    case TARGET_SIGILL: signal_name =3D "SIGILL"; break;
-    case TARGET_SIGABRT: signal_name =3D "SIGABRT"; break;
-    case TARGET_SIGFPE: signal_name =3D "SIGFPE"; break;
-    case TARGET_SIGKILL: signal_name =3D "SIGKILL"; break;
-    case TARGET_SIGSEGV: signal_name =3D "SIGSEGV"; break;
-    case TARGET_SIGPIPE: signal_name =3D "SIGPIPE"; break;
-    case TARGET_SIGALRM: signal_name =3D "SIGALRM"; break;
-    case TARGET_SIGTERM: signal_name =3D "SIGTERM"; break;
-    case TARGET_SIGUSR1: signal_name =3D "SIGUSR1"; break;
-    case TARGET_SIGUSR2: signal_name =3D "SIGUSR2"; break;
-    case TARGET_SIGCHLD: signal_name =3D "SIGCHLD"; break;
-    case TARGET_SIGCONT: signal_name =3D "SIGCONT"; break;
-    case TARGET_SIGSTOP: signal_name =3D "SIGSTOP"; break;
-    case TARGET_SIGTTIN: signal_name =3D "SIGTTIN"; break;
-    case TARGET_SIGTTOU: signal_name =3D "SIGTTOU"; break;
+
+    if (arg < ARRAY_SIZE(target_signal_name)) {
+        signal_name =3D target_signal_name[arg];
     }
+
     if (signal_name =3D=3D NULL) {
         print_raw_param("%ld", arg, last);
         return;
=2D-
2.37.2


