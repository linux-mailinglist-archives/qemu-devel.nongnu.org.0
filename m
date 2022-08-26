Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CE35A2D5F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 19:23:47 +0200 (CEST)
Received: from localhost ([::1]:39882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRd3V-0008OM-Ql
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 13:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRczh-0003lC-KV
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:19:46 -0400
Received: from mout.gmx.net ([212.227.17.21]:59881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRczf-0001pK-7g
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:19:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1661534380;
 bh=JzpBi1HMBCKK75t+bPE+iYjHcUu0ak5+qdq0ItuH/TA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=PPi8XnqrS6KvpOeZQ4q+BRgHRLFVxo8lMnAefZMUHEqzdhonqfcyqo7phHHfeZCFb
 mRpYi759+k5zxgdDm1IWffaM5TyrnFuHtvAsKzzF03hdzECQH4XCcNXzQG+TtewkIp
 2QC9CiZOO2Gud4BN2Bg7SLiRpoj7hM6bGSOai9rA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.171.190]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBUm7-1oZeWx2JjD-00CxXV; Fri, 26
 Aug 2022 19:19:40 +0200
Date: Fri, 26 Aug 2022 19:19:38 +0200
From: Helge Deller <deller@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Subject: Re: [PATCH 01/13] linux-user: Add missing signals in strace output
Message-ID: <YwkAqjzeN4ucDDGY@p100>
References: <20220826141853.419564-1-deller@gmx.de>
 <20220826141853.419564-2-deller@gmx.de>
 <a00df539-3392-0924-0583-495536624e9a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a00df539-3392-0924-0583-495536624e9a@linaro.org>
X-Provags-ID: V03:K1:CSx6R+I3Qx6BaVpdHAirv+XWNlfAWlyw2VMOa/rmLGSecVRPSVL
 EMc269Ys5j0dnE3izNg7RaCPx234jOFr76LUFXEApir+6GTx3Mxv++x6Tfw218hGYibR1m8
 OPubnNrsLDuhxYioQqOSB7sWDC+hbocVwaMhjfCWNB1oJ3zXMNwHk8WD1qOx5pCg/ra5xM5
 bsvFFmaiGtNu8XzDHetHg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2HaHycHieqk=:X4LbsiWL9h8nu41xahAZ1M
 rcaITFBgSCBqDucH8u0RGc0o0U386084nyVH99zdl8iz/DQG/6aCe9YGTHzy1YFGHLrIgQTj7
 X+1iDfoXsY9XmEJJPjRu5RX45OKDhSjm6yZujko15cVN0qreSCzLE8V+czaTsqrNnwDAeo3Vt
 1KyavTpvf/lseZimbjmwsb4GUj20uJMYgeKdSoQ/faU30OSK1aCpfBNSbjUUTSBHmX1adYdIu
 Er3aRY2p9OJzrEaVOCDx3HglFq8iF8npLuaI5EmOqIKbsXTOIBSACiLhdw5ePJC7u1cP4Y/LG
 LQgYOhuf8TsWlMYotfxRC2b981F/cK9zPfQi3Q+4SLiuWsbCtu2trOHpW5NWN31gEOMb2qCRq
 rpNH5TvBMmxPcXpZdU7hImTKCHmVXEbXsjF4xVOHsY/nzn2KgnrXCEvBeEeYKN7irsfJX9vG9
 9p8YY+xQFXiVwT61VfhNypvq9xEdRm3e5xoYIEth5qcRfnZ6MZF4aMHiUUApKnp0VeWahwR3l
 LJTw2BvECm0sRCp8jnOm1dlYAVMx/wuLb3gdiCkbq3wPfayxOyECUSn0R4Q2v1mw541ENq7ia
 aeiEmEFk65M6/HyDoB01tCl5E/s3/zjU3/knt+wJLnLkPu/4zksQKKhHk8LliS0KnNmVIN/iw
 eP2wwuZG86QsTwWaknv7EDIwpX70Q7jJOnoUxGAscxfaSpqPiOXgsobnGcaWdNV3a0yhenCoi
 N8DXnL8IQMu0nC66sc3lBgpC2bUKZQc4nMnQsLgwtYs+WhUeIhuFlVStRE9uqBwdL40r6Lgsi
 ha3hlGLU+ZDONVYkxUkin3SvE5Q+twwITrClcdyk7EmjZCwQwh+86B1NQ0r4rt4UwkolMp+se
 VXuoBoUY/r3GPBnrEdD7WC2OJ/rMh1fGFa4iFWvisp1HwngcUQ18bdSy7ynMfH8eX3ZRz1cHb
 2dDnl9pK4PQn8TGb+z+Wg6izBtCbLKBFOCDMIM8qBlbsCHGuDQYO8ttGFm8WKqpc4xToVK0f1
 w4fq8HnMgQRcEq5IYsMrHajqOpDqrpMsa/0xnG+qB7pJQDaKHQ2JUOt3Clac2qZ24tkxasu/K
 PMwyqQ/50HS+/X0bkJiAeyC6m0CSL2nNK53RwTrIq6uFLUUqHbRl1lI/A==
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

* Richard Henderson <richard.henderson@linaro.org>:
> On 8/26/22 07:18, Helge Deller wrote:
> > +    if (arg < _NSIG)
> > +        signal_name =3D target_signal_to_host_signal_table[arg];

> (1) static const char * const
> (2) target_signal_name -- there's no "host" about this.

> Oh, and _NSIG is a host thing.  Leave the array as [] and then bound the
> lookup with ARRAY_SIZE(target_signal_name).  Also, missing {}.

Thanks for the review!

I've addressed your feedback in the patch below. Additionally I fixed
the indenting in the table.

All patches (including this one) is available in the git repo at:
https://github.com/hdeller/qemu-hppa/tree/publish1

Helge


=46rom ff8e95709d2d6f9a7d8e452671aea16ed60c5114 Mon Sep 17 00:00:00 2001
From: Helge Deller <deller@gmx.de>
Date: Wed, 27 Jul 2022 16:44:05 +0200
Subject: [PATCH] linux-user: Add missing signals in strace output

Some of the guest signal numbers are currently not converted to
their representative names in the strace output, e.g. SIGVTALRM.

This patch introduces a smart way to generate and keep in sync the
host-to-guest and guest-to-host signal conversion tables for usage in
the qemu signal and strace code. This ensures that any signals
will now show up in both tables.

There is no functional change in this patch - with the exception that yet
missing signal names now show up in the strace code too.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index 6a7e4a93fc..0faf533b47 100644
=2D-- a/linux-user/signal-common.h
+++ b/linux-user/signal-common.h
@@ -118,4 +118,50 @@ static inline void finish_sigsuspend_mask(int ret)
     }
 }

+#ifdef SIGSTKFLT
+#define MAKE_SIG_ENTRY_SIGSTKFLT        MAKE_SIG_ENTRY(SIGSTKFLT)
+#else
+#define MAKE_SIG_ENTRY_SIGSTKFLT
+#endif
+
+#ifdef SIGIOT
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
index 7d882526da..ae4444a6ca 100644
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

