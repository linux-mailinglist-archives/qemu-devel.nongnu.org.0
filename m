Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A4D3871A1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 08:10:34 +0200 (CEST)
Received: from localhost ([::1]:55594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisw5-0008DU-8r
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 02:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKo-0007cv-SK
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:02 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:45993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKf-000787-WF
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:02 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mzi3l-1lVS5M3aDp-00vfCn; Tue, 18
 May 2021 07:31:50 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 34/59] linux-user/s390x: Use uint16_t for signal retcode
Date: Tue, 18 May 2021 07:31:06 +0200
Message-Id: <20210518053131.87212-35-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:R7I6qJOMJApyo8nuNXT9G6m2GVwjPTLygGlLewcgtioSlHjXbpO
 PuQaQlvMNe4Z0u86JGhwQpvkhHI3O581Ux5COemMxSL4DFAGzNhtqG0BqomzdhW+5urbl1v
 Ubg98jjqiE4hWIkn997b97d0PtUox0+7QSvQWG1LLCf8dyl9hKJTNHjcRlpNX3ifVfHCfbn
 35mNll0MZQzcU+CsUYcPA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y6UJKmLfMgU=:UBTVUmf9F7TNw9TBAOZBAU
 fXkv0mUr7kRCo/ByBhcwXFXAnph5P5mCkYdLTcXsArNt6ruIliKxFDBTS+1of8e2bI6XPlySx
 yaKSOEBOw5KCOEjhlW2V1hI0q9am9xL2eSamC5i8SJHMUIRCDlyXwrY6yDa2nE72KlQT869nf
 2ehW5omF/48E9QNIC2pzfslgfHJjJ9Ux6HPWkrN2lksNqEFWQvqe9AXPXaQQouoC8gpdna/ev
 vFGLz7RfrewKYeSUBv2qdl5bpC/DFDhpScOD9htgua5pYSoHdaivdWeqM3M9CkP5/czdgfBCI
 hHveg0EO0Ot42pj497B/a3SDNwLgDpuItCAfmrbrjqFng5TIrKoaIBUU5lFp+6rSpT6qApnZZ
 V6JKKiOrIl+DXCDF7hiIy7DKHgoTkKmhPtGa7XiCd0yr9XTBLvWbFUXtix9oDTVx4DGBuudUg
 W9LkPulx3DZLatTfanULrW//w+6KidAqqN3iX8gHY4OCT8iaBLcAQb3yT6m+Lneq5rqZPdLR5
 a+rOrYhrEY0B9xrVZnezxo=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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


