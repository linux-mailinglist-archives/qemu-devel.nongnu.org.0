Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6516383C85
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:38:49 +0200 (CEST)
Received: from localhost ([::1]:51278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lii8e-0001eT-Td
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihle-0006fR-Ji
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:02 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:58513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlQ-0004UO-O2
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:02 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MLQgv-1m063b0Hvn-00IVxF; Mon, 17
 May 2021 20:14:44 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 35/59] linux-user/s390x: Remove PSW_ADDR_AMODE
Date: Mon, 17 May 2021 20:14:00 +0200
Message-Id: <20210517181424.8093-36-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Wr5S8DKryzW8N/vKmub0WzsI8+MbbgwMxhlhxFS2DK4vwwfN/7B
 MVLm44pCzz5Bu+FD5ptchO7rbZbCU7phSC0Dzfw+q0o6OXXQwqarytaBpNuW+MbCXwUz5w1
 ncdxw+/ynF4XtIaNc6E2XaZ3R7xy5YUcCp6+2xlNDQsvvxpL9x4zf+zHC0cgIj9dP/8nEZg
 Kjbnyl34dCmvk8SVEdh9A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QllEDAhyNFQ=:U/QsBuE8mlh31uCPObN+o1
 o8+K2ZbLu3vcmgbA202t3Bqk6/VwLKq/e41ZKlBaqnfxKycwI70GQ7Y4XgrHBvW5ds94q8p8K
 rUsuRUAXJ3U35QVJ7y/NoznBtJwlfalshgLvTBUut1BRxNay1hySb3xJF2kn0RYpkrXdzb3Z7
 izBdnMraw2ga/Skc8sh8Eudsv9gDd6ZDIARSVcKJ+K27x+jRB09Old7O1r3rGWcvODr6fLeLJ
 ChZ7E3F+BCk53xRL3f6Rz1j2xBv10HbwNAonEwVgCN5envw+pbfEimx/Xt00jZzB/eDMgT0LU
 sH14zfqMh36l+WaJnIrrpDv4ybiTD8BBX+7uf8COuEcMLJ66SdJN+sCBr/0gnXnX3ul8UforC
 dDPSJ0YkMWnH2NZCodoZLj6AV0wpvfdEQZcC6us5jr+Mj2TWfgM43ONQWkAXO1MDS9RdJOsHd
 TJ7qGik1Fy7hUwYSm3nUTh1K2SE6DnvYy7/RNlPUFdHr3LEquAQGrRL0RvO1zzN7l1+/AO2P+
 ao2lbAS8C53nvQetICSxcc=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 Laurent Vivier <laurent@vivier.eu>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This is an unnecessary complication since we only
support 64-bit mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210428193408.233706-4-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/s390x/signal.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index fece8ab97b3c..1dfca71fa9b2 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -31,7 +31,6 @@
 #define _SIGCONTEXT_NSIG_BPW    64 /* FIXME: 31-bit mode -> 32 */
 #define _SIGCONTEXT_NSIG_WORDS  (_SIGCONTEXT_NSIG / _SIGCONTEXT_NSIG_BPW)
 #define _SIGMASK_COPY_SIZE    (sizeof(unsigned long)*_SIGCONTEXT_NSIG_WORDS)
-#define PSW_ADDR_AMODE            0x0000000000000000UL /* 0x80000000UL for 31-bit */
 #define S390_SYSCALL_OPCODE ((uint16_t)0x0a00)
 
 typedef struct {
@@ -148,11 +147,9 @@ void setup_frame(int sig, struct target_sigaction *ka,
     /* Set up to return from userspace.  If provided, use a stub
        already in userspace.  */
     if (ka->sa_flags & TARGET_SA_RESTORER) {
-        env->regs[14] = (unsigned long)
-                ka->sa_restorer | PSW_ADDR_AMODE;
+        env->regs[14] = ka->sa_restorer;
     } else {
-        env->regs[14] = (frame_addr + offsetof(sigframe, retcode))
-                        | PSW_ADDR_AMODE;
+        env->regs[14] = frame_addr + offsetof(sigframe, retcode);
         __put_user(S390_SYSCALL_OPCODE | TARGET_NR_sigreturn,
                    &frame->retcode);
     }
@@ -162,7 +159,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
 
     /* Set up registers for signal handler */
     env->regs[15] = frame_addr;
-    env->psw.addr = (target_ulong) ka->_sa_handler | PSW_ADDR_AMODE;
+    env->psw.addr = ka->_sa_handler;
 
     env->regs[2] = sig; //map_signal(sig);
     env->regs[3] = frame_addr += offsetof(typeof(*frame), sc);
@@ -210,10 +207,9 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     /* Set up to return from userspace.  If provided, use a stub
        already in userspace.  */
     if (ka->sa_flags & TARGET_SA_RESTORER) {
-        env->regs[14] = ka->sa_restorer | PSW_ADDR_AMODE;
+        env->regs[14] = ka->sa_restorer;
     } else {
-        env->regs[14] = (frame_addr + offsetof(typeof(*frame), retcode))
-                        | PSW_ADDR_AMODE;
+        env->regs[14] = frame_addr + offsetof(typeof(*frame), retcode);
         __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn,
                    &frame->retcode);
     }
@@ -223,7 +219,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
     /* Set up registers for signal handler */
     env->regs[15] = frame_addr;
-    env->psw.addr = (target_ulong) ka->_sa_handler | PSW_ADDR_AMODE;
+    env->psw.addr = ka->_sa_handler;
 
     env->regs[2] = sig; //map_signal(sig);
     env->regs[3] = frame_addr + offsetof(typeof(*frame), info);
@@ -248,7 +244,6 @@ restore_sigregs(CPUS390XState *env, target_sigregs *sc)
     trace_user_s390x_restore_sigregs(env, (unsigned long long)sc->regs.psw.addr,
                                      (unsigned long long)env->psw.addr);
     __get_user(env->psw.addr, &sc->regs.psw.addr);
-    /* FIXME: 31-bit -> | PSW_ADDR_AMODE */
 
     for (i = 0; i < 16; i++) {
         __get_user(env->aregs[i], &sc->regs.acrs[i]);
-- 
2.31.1


