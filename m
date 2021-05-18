Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D743871C0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 08:20:58 +0200 (CEST)
Received: from localhost ([::1]:45304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lit69-0003jP-I3
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 02:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKw-000877-Oj
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:10 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:51025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKn-0007AR-3U
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:10 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mxpqo-1lYUcf1HJ8-00zHEG; Tue, 18
 May 2021 07:31:55 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 43/59] linux-user/s390x: Add stub sigframe argument for
 last_break
Date: Tue, 18 May 2021 07:31:15 +0200
Message-Id: <20210518053131.87212-44-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:B8zeYb7QC5D25AedDnZGj3hnzb78tZEt7lAbrOmCnRPEQSK9stM
 emmiELAKRCIuyVoBtVEzmc65Jj52ja+a+ghh6CON2agri1UwS0FQa3UTykWE9fjZtXYd83h
 q0btGR5FYNHnIv6rwlGBtYriq/9uNqgH33B9elLL9R7pJpW6PwFq10yTM3YOjbQZmcVdkLK
 2vqJ2XYYjTAqsXVwQE1hw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5/s0C1ENJAA=:7Dx1dVOPKk/tYKzABMX/ii
 Qr1Xxe0FYTKpjY6iEoRm9oBHtgilSuAAFoNBtWis1MxFme5Kd7l46yM9hIhHSev67kT7rvE9V
 r3BXZVF6Jhc2ssG6Smg1YeKxRe49KbtsYTmlRXsVYr2gYoPdKfLYJbo06/wYvOJk3zyAQ0zZa
 zZ38+f7FkJrCE+ZWopLruNtuKU90RmmuIaeo7ep/F3MiQMav95Mn/kL9Vlk55kwSjKsZ/J6O7
 xIrJW1e9X/Mki9HZBAyW8Yq+4rf/aNlc4UwihaWILW9/RRLigK0AdR89SUzeesTtS3PVlZkXJ
 Idjd2QlEU7bfZjqY8bEiR5d93iqSVYkhK7hbmz/s460VCqz6RgCYHId1uf+7Q4nWfeWSRnW7Z
 tkJmFhmEBD3BSGxMX36RQbvGCNPWHhS5M/Ooo07yGyLH3dYlar1lqwGjRnuO3blf8gatBWF1b
 hF9LlkRPUbTGa7/2dXD2dhy7dC7qPXJZjqyO+KzLBelCkb3zzu4N3xH8dhvpNqzRw6rJYLAoi
 f7bJ3qmYQLNoBZTjqTodJc=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

In order to properly present these arguments, we need to add
code to target/s390x to record LowCore parameters for user-only.

But in the meantime, at least zero the missing last_break
argument, and fixup the comment style in the vicinity.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210428193408.233706-12-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/s390x/signal.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 17f617c65581..bc41b01c5deb 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -167,13 +167,16 @@ void setup_frame(int sig, struct target_sigaction *ka,
                   | (env->psw.mask & ~PSW_MASK_ASC);
     env->psw.addr = ka->_sa_handler;
 
-    env->regs[2] = sig; //map_signal(sig);
+    env->regs[2] = sig;
     env->regs[3] = frame_addr += offsetof(typeof(*frame), sc);
 
-    /* We forgot to include these in the sigcontext.
-       To avoid breaking binary compatibility, they are passed as args. */
-    env->regs[4] = 0; // FIXME: no clue... current->thread.trap_no;
-    env->regs[5] = 0; // FIXME: no clue... current->thread.prot_addr;
+    /*
+     * We forgot to include these in the sigcontext.
+     * To avoid breaking binary compatibility, they are passed as args.
+     */
+    env->regs[4] = 0; /* FIXME: regs->int_code & 127 */
+    env->regs[5] = 0; /* FIXME: regs->int_parm_long */
+    env->regs[6] = 0; /* FIXME: current->thread.last_break */
 
     /* Place signal number on stack to allow backtrace from handler.  */
     __put_user(env->regs[2], &frame->signo);
@@ -223,9 +226,10 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
                   | (env->psw.mask & ~PSW_MASK_ASC);
     env->psw.addr = ka->_sa_handler;
 
-    env->regs[2] = sig; //map_signal(sig);
+    env->regs[2] = sig;
     env->regs[3] = frame_addr + offsetof(typeof(*frame), info);
     env->regs[4] = frame_addr + offsetof(typeof(*frame), uc);
+    env->regs[5] = 0; /* FIXME: current->thread.last_break */
 }
 
 static void restore_sigregs(CPUS390XState *env, target_sigregs *sc)
-- 
2.31.1


