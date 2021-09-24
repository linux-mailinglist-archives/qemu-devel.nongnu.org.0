Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB99541767F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 16:02:21 +0200 (CEST)
Received: from localhost ([::1]:37778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTlmO-0003fl-HR
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 10:02:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTlgt-000314-UV
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 09:56:39 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:60799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTlgr-00059W-4J
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 09:56:39 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mcp3E-1n3Ngm3ivS-00ZyOz; Fri, 24
 Sep 2021 15:56:35 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] linux-user: Provide new force_sig_fault() function
Date: Fri, 24 Sep 2021 15:56:29 +0200
Message-Id: <20210924135631.2067582-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924135631.2067582-1-laurent@vivier.eu>
References: <20210924135631.2067582-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Aa/W3+/9Dd/FWKEHqQrSMRuBgk3RRcCeVu9Z8Z4ztYIsgzvM0pR
 frAf6FULRJj5hXG6AFG0xeToUdC+jA1IePhgKUikjFKiX/UOq0bPHqKgqEyGBRHKIu69NgK
 j74TlMGV6DkFxddn18xq4wdERh3QbaEMDqV72SCfpTsgxuA7dtS3+Inz5GNfTUg8Js0QCqq
 anyYXLa4dXGDQr3cIkDhw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gNsuaqKw5uw=:BRlI4WXHriuCEU09lruvwV
 MMqojHOBzyWENOd0kNRREKN3cEicKYGlh2LrOH7fufbZXsGP9y4DJf6cJUMUUyxz6Gl2IeWOL
 9zqDdaUc1k9PFf3B/VukKu52EwjK9DCG41+u9WGRjQvCzm80tuy/88HTP9UpBqW52JUhCyN3u
 kwxEZibWcCc4G4KHKefQpwbpDOq48EXx1IvJ/zjLC5NF1xsPtEvtu4BDxiW1Y0+P4EKUyWXdz
 YOq0oVxf55fWXWXKFrbrtv4OCruFYi2cq9rc/8i5m/svnHoRw3bZpK3eTiBgkacb6kyN3WPHh
 A9UUYlVvVKIJdHwayJZN6stzCrlMwS17HxznjNNy6WtOyCoLPl0wYMpZTK+GtqtSFu7ASfBxt
 mbEibhEkQt1cWARPOj7bUloHb34Mhxd/6Ntf8at+/tkjVT80cSHNzjx1Yv7fgJ+9JfLXUwVzc
 tU6WPw3d5HPRqj/M9+j6EnFyipVHKkTikup4QQd+o7HtAWlBNSNK+0ioJcRVrfkyXjXGpnTg0
 AJg9MpGuKjNabDIKExUYKsafsW3nq7ZzbN7wzeVej4wKCIoUrDi2fsY2FEgi+5inuvVtCfrVw
 evyLPeHdfSUnFLTTbEEFW1VgypZeZDSEFSHE1XwdVVVNDoMELOoIW/gJZf70H6782w6vGa2MM
 7Ud4/f4MlfIjn1RduBzA3pDvhe5Zb0ciH0XwlOWMcj4xhLed526+zp126gBdRVLUZfsevO+db
 5wZuOy1dRkKJ7pDgc0Rb8BEiJvTQiGqGckHH2w==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

In many places in the linux-user code we need to queue a signal for
the guest using the QEMU_SI_FAULT si_type.  This requires that the
caller sets up and passes us a target_siginfo, including setting the
appropriate part of the _sifields union for the si_type. In a number
of places the code forgets to set the _sifields union field.

Provide a new force_sig_fault() function, which does the same thing
as the Linux kernel function of that name -- it takes the signal
number, the si_code value and the address to use in
_sifields._sigfault, and assembles the target_siginfo itself.  This
makes the callsites simpler and means it's harder to forget to pass
in an address value.

We follow force_sig() and the kernel's force_sig_fault() in not
requiring the caller to pass in the CPU pointer but always acting
on the CPU of the current thread.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210813131809.28655-6-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/signal-common.h |  1 +
 linux-user/signal.c        | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index 58ea23f6ea94..79511becb4e7 100644
--- a/linux-user/signal-common.h
+++ b/linux-user/signal-common.h
@@ -40,6 +40,7 @@ void tswap_siginfo(target_siginfo_t *tinfo,
 void set_sigmask(const sigset_t *set);
 void force_sig(int sig);
 void force_sigsegv(int oldsig);
+void force_sig_fault(int sig, int code, abi_ulong addr);
 #if defined(TARGET_ARCH_HAS_SETUP_FRAME)
 void setup_frame(int sig, struct target_sigaction *ka,
                  target_sigset_t *set, CPUArchState *env);
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 910b9dc6f7d1..203821645509 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -651,6 +651,23 @@ void force_sig(int sig)
     queue_signal(env, info.si_signo, QEMU_SI_KILL, &info);
 }
 
+/*
+ * Force a synchronously taken QEMU_SI_FAULT signal. For QEMU the
+ * 'force' part is handled in process_pending_signals().
+ */
+void force_sig_fault(int sig, int code, abi_ulong addr)
+{
+    CPUState *cpu = thread_cpu;
+    CPUArchState *env = cpu->env_ptr;
+    target_siginfo_t info = {};
+
+    info.si_signo = sig;
+    info.si_errno = 0;
+    info.si_code = code;
+    info._sifields._sigfault._addr = addr;
+    queue_signal(env, sig, QEMU_SI_FAULT, &info);
+}
+
 /* Force a SIGSEGV if we couldn't write to memory trying to set
  * up the signal frame. oldsig is the signal we were trying to handle
  * at the point of failure.
-- 
2.31.1


