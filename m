Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAC8383CA2
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:46:20 +0200 (CEST)
Received: from localhost ([::1]:48612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiFv-00021q-Jd
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlp-0006mK-FP
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:20 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:37219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlV-0004XJ-8Q
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:13 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MY5XR-1lzVhN3mFp-00YVH2; Mon, 17
 May 2021 20:14:49 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 43/59] linux-user/s390x: Add stub sigframe argument for
 last_break
Date: Mon, 17 May 2021 20:14:08 +0200
Message-Id: <20210517181424.8093-44-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:k+YIRMlhgyAXqICz1gseoQpkACOv+tMK2HAlu3aoWAql8gySwA4
 NxGsC/64xw/uP80d025Mdmu1zBcMhRSGCNz1jRhoWTnHh+S6Ohl5AvSXRox0r8s5GZJnD86
 iVYncor9qJ0EzVdk3RZ1DYAxh4OLSd4m8iuC2DWGS6Ov+eBTUE1P2Nm6pgCYSBbMKAJ921U
 ZA2mUGWAapuuAioc7MrXA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gnG4jloMGpQ=:XnZJQc13nht2SpBMeJH+bz
 aEjmQ+ERuaCpP6P8K1E2KUHaYZgn79g8VAmFX4/grMaoaICz8fEMWYGoOm9AWBiyBH1wicUXR
 QpKBhioaMfc6+yJ9voxxK7l2smqLW3+JSEoNuDSCMEsWz1eHWxStDCB9rGCSh/S/5gr1ddzfU
 3I3sj2M47anQBb0TKMW5wFACpWuQ5YsUnwcIL0VmCcSl0RdECm0IWYSVWz8uRLj64JdwoM9Ja
 Qx5hYxvMRYlM6YjNtnsFnIsLrNUKguFFccjUOzdhvLNMaQcb5GN0r/nFUSgEM/KRJvUrGyMjc
 py6cdrDi+XnQbpk3iCQ78ENgfLWNmUTc3ZIbOIAEGVLrXxJKQ7xqiZDLLPanplkMO4MECetCp
 7Jm5QxOZW/+KeuHmlykj4yWcqK/pjTXctZMQYMFe3FEApRvsxn5nmFXQaJsqv9dbOkBz7qnLK
 JTx+s/7UpgEQLE5YQxs6Ta8MqfeiOIZOeE2awUMH3tq8K8stbPvS0D3XUbxPlKMMQ5RVhT7eG
 YgVki65dEZxCrbpXyYuZxs=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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


