Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9F8383CAE
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:50:26 +0200 (CEST)
Received: from localhost ([::1]:37074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiJt-0004mt-Pu
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:50:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihle-0006cP-1I
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:02 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:36869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlQ-0004UK-L2
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:01 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mf0yy-1lFPLy2Cte-00gUtY; Mon, 17
 May 2021 20:14:44 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 36/59] linux-user/s390x: Remove restore_sigregs return value
Date: Mon, 17 May 2021 20:14:01 +0200
Message-Id: <20210517181424.8093-37-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Jw3nzBlTDGO0u9kq2S9BtNByXZ/Ce2uG7M1VMYq1OYhykjeU3Cn
 H5QKqSuckVOMGm0kfXmJCW9ibRfcBxaPCQ9MSfjJd4qFwa02Z5jJmGTkdiQSbR3td92sT73
 ihzJxIF12J5QcizDPOei4/jKNUtmrmxg/Nq8Rg2y8oCgVOjLItR7vZzZ3/ow8+QmGEdVVMy
 Ynuu50SLbZKZKqoVOm6Dg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZiU8Zokkm4s=:imDqsFdNdOX4i2aDrDyKTA
 rQENNzOXgAWD2OK24UhOAoAjASE/z71i00Oi9xJBihl0CMdJX3uhL6qh3wK3CLH6VEpcIBUAR
 VCTWTkSOXOshGztZ0KFuqiAIXiPMu9Fj9JqjXDT64fD6lMZONZh6edUmjytweAeNWV3gw5ZOa
 chrz3SebvM7clnIY/WbWPaJJedyTMLq8bFZ27Sc8fzpHmHMlFBPIj+Iqqo0KJ4sSqJqadpXAJ
 yZUSoO4YJae8KHLOlH2Jk8pXdpNjNjVsn7GxKSGbk5YYbxOJTTvVXuDUOvjV6WqVN/FTKNPx6
 Wz/INlr1VjenRRUmBmNmq7Ruck2cBUM4+xKNqEyOXPNnDo9HYKKSjyyU8CtRIwpephNcyomMi
 s+qSbm5GPCUxP/eGSv8+yjuQ4u1QlWAjVW05un5PGJnYoe958UqpH5A/dAZ1MDPfQ9IFlrI2d
 7T4SrTYhp7TmdaIPin4stz8szdR/PUYw2D3ulWuvadJXRXiK+ezouMt2mDJlggkSl6v9AmHMl
 Zv+FHxhMpBv8O2/+A6b6UY=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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

The function cannot fail.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210428193408.233706-5-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/s390x/signal.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 1dfca71fa9b2..e455a9818dea 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -230,10 +230,8 @@ give_sigsegv:
     force_sigsegv(sig);
 }
 
-static int
-restore_sigregs(CPUS390XState *env, target_sigregs *sc)
+static void restore_sigregs(CPUS390XState *env, target_sigregs *sc)
 {
-    int err = 0;
     int i;
 
     for (i = 0; i < 16; i++) {
@@ -251,8 +249,6 @@ restore_sigregs(CPUS390XState *env, target_sigregs *sc)
     for (i = 0; i < 16; i++) {
         __get_user(*get_freg(env, i), &sc->fpregs.fprs[i]);
     }
-
-    return err;
 }
 
 long do_sigreturn(CPUS390XState *env)
@@ -271,9 +267,7 @@ long do_sigreturn(CPUS390XState *env)
     target_to_host_sigset_internal(&set, &target_set);
     set_sigmask(&set); /* ~_BLOCKABLE? */
 
-    if (restore_sigregs(env, &frame->sregs)) {
-        goto badframe;
-    }
+    restore_sigregs(env, &frame->sregs);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
@@ -297,9 +291,7 @@ long do_rt_sigreturn(CPUS390XState *env)
 
     set_sigmask(&set); /* ~_BLOCKABLE? */
 
-    if (restore_sigregs(env, &frame->uc.tuc_mcontext)) {
-        goto badframe;
-    }
+    restore_sigregs(env, &frame->uc.tuc_mcontext);
 
     target_restore_altstack(&frame->uc.tuc_stack, env);
 
-- 
2.31.1


