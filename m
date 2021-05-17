Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21368383C98
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:44:26 +0200 (CEST)
Received: from localhost ([::1]:40128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiE5-0004pR-5I
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlf-0006iM-CR
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:03 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:36535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlP-0004Sx-Oy
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:02 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MfZDK-1lFxaF2OLo-00fwvm; Mon, 17
 May 2021 20:14:43 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 34/59] linux-user/s390x: Use uint16_t for signal retcode
Date: Mon, 17 May 2021 20:13:59 +0200
Message-Id: <20210517181424.8093-35-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:saUIS/JUgEHcFxd7F61bY8GcQSMpxPeW5wJd3MjqdesNbpHTUu5
 sI1VsDUHQVJ2wzfCYhbsUYUWGa5Jw/OEaeGHVpyum9TvoHO/dN4prWt+TfRIiGPCiPKyssb
 rGRnPq0XuFuW/SO6DEq0WuIEBFwqaApg5wzs3XC5uH33ELd0CJeA7D99JPRapDsyD9l/+Vc
 yFL8kx4TjQc3+/15Kgsqw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:V5tGAiR2vBU=:MiaCXCbqWhcPESQBMH+/uA
 BRa7JR2CIpIDK4g6RdCIZX6YxZIJi6t2kmvOHI0etmNhbi1LWoEiYlGkfEiGAQlPJwodbXP0Q
 ZK8jlufYvv+MxYwUKeHLbFyzw/hUBmFIrOM3SCZO0lyCW2nhobaBKnrf7ejCd1Q6Cg6C5on/B
 ApoLQvW6UIRpBLCdSFilRqzSHQLHlnBowCpUqgtMha0FjVoPKpW+XtTpyacDmrw/o2K8+K/Ev
 G7b70+esBbfNuCxNbipkj5W8jlF6FbEdKMoHL4gXhMWDsK9J/9XeM69aPiB21nuDUQiQ6jSq3
 +siq88z4gcYFjACMa6DjLR4Ceqgc1h43l+pq5zjUgr9BN/DAGHoSBLT+E9YCtGyNJd/CVG6yb
 n6MPnpceqCfUhuYK54b0tdG/ZYCBemef6yMZfq9sYxbsED/ZHlAMQ533WCuT7ezBy2+Jwhqer
 XajyKGJ7W627jCp/UZ7C4+ObMRKfCi0K7nBB4FaNR3lwAtOZi/RGCLqmv487DkM/cDYD4kYlE
 beprcoQ4IftLprwPMflKK0=
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

Using the right type simplifies the frame setup.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210428193408.233706-3-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/s390x/signal.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 707fb603d72e..fece8ab97b3c 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -25,7 +25,6 @@
 #define __NUM_FPRS 16
 #define __NUM_ACRS 16
 
-#define S390_SYSCALL_SIZE   2
 #define __SIGNAL_FRAMESIZE      160 /* FIXME: 31-bit mode -> 96 */
 
 #define _SIGCONTEXT_NSIG        64
@@ -62,7 +61,7 @@ typedef struct {
     target_sigcontext sc;
     target_sigregs sregs;
     int signo;
-    uint8_t retcode[S390_SYSCALL_SIZE];
+    uint16_t retcode;
 } sigframe;
 
 struct target_ucontext {
@@ -75,7 +74,7 @@ struct target_ucontext {
 
 typedef struct {
     uint8_t callee_used_stack[__SIGNAL_FRAMESIZE];
-    uint8_t retcode[S390_SYSCALL_SIZE];
+    uint16_t retcode;
     struct target_siginfo info;
     struct target_ucontext uc;
 } rt_sigframe;
@@ -155,7 +154,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
         env->regs[14] = (frame_addr + offsetof(sigframe, retcode))
                         | PSW_ADDR_AMODE;
         __put_user(S390_SYSCALL_OPCODE | TARGET_NR_sigreturn,
-                   (uint16_t *)(frame->retcode));
+                   &frame->retcode);
     }
 
     /* Set up backchain. */
@@ -216,7 +215,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
         env->regs[14] = (frame_addr + offsetof(typeof(*frame), retcode))
                         | PSW_ADDR_AMODE;
         __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn,
-                   (uint16_t *)(frame->retcode));
+                   &frame->retcode);
     }
 
     /* Set up backchain. */
-- 
2.31.1


