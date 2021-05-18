Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB263871A5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 08:13:18 +0200 (CEST)
Received: from localhost ([::1]:60128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisyj-00030J-ME
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 02:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKo-0007bq-Mz
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:02 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:47409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKi-00079A-HY
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:02 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M6lUk-1lq1TU3InG-008Nju; Tue, 18
 May 2021 07:31:50 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 36/59] linux-user/s390x: Remove restore_sigregs return value
Date: Tue, 18 May 2021 07:31:08 +0200
Message-Id: <20210518053131.87212-37-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/FuOqJgIwzA4g56oyGu+1qAr/manHOuUkGjYp810JRHaj5fTiTl
 qq+g0F1boYvb7HbbClLTpqi6wn/GiUcMPOfvJdwGd95Q5oV/JpeXKHoQqc+Fk5PQqJgLXXH
 BRhvN5cDZ5D05+IIhlkJeBMdmqiCYqRF9GrmxvoLjeZvF6KeGgDUFd1dt57tYAQmilEUs4q
 iGr4UUbMck8kbnqcGABbw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oABa5l1xAeU=:0umannad+WmoHiUJkbI9yE
 ddMQNInzF+Pp2e9sWKsbaxUns7sI5ahFvOXM68Rf5+mXV7WI5BFoq+jTy2rXkbt/38cZF5iE6
 +GcGfblhBYF7tdXHaBrX941zPufHjBXwj/OD2eHNhStvs8DCgu51rB+2FvCdtleVAH32kQW+x
 GrdqUn59ZLLIkw/39A9aqVKX3Pj23TnYrqwOvVgrmOEly+viydziIFgZ+4vaI0OVrP+QSln05
 1ci9LUZ2+H+U93KeqxAEXrVeqQTjR/QJj52msjeRKQpfo375pJhIxNmhxIGSGBgdqaw16Xrn0
 lKHqadd3dxmvreC7T13QCgDVgXrtY1TKZz9kPTD42Ncu6sisvdOCROBcAUYID57IbgeB6Uiv0
 CgySdpSRuxP1K9AVGwYzCtv1Ek5Kvk/htoYsoh884v+kzxWMeLwD+l08ytZ05xMxXW//wYiYC
 iipZULSoWm85T7beFd0yBl4R2LI4Sgig6B2zDW1jnvX16hY1osy4/rGBCcDSZIMes7JvpARg9
 hClsCHkzB+bk+9qMeaLg5w=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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


