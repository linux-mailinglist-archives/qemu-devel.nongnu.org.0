Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24588383CDB
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:03:00 +0200 (CEST)
Received: from localhost ([::1]:49558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiW3-0006nl-4u
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihm6-00075I-HI
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:30 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:38539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlZ-0004ZG-CS
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:30 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MQgtC-1m5J7L0wA2-00Njdv; Mon, 17
 May 2021 20:14:53 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 52/59] linux-user/alpha: Rename the sigaction restorer field
Date: Mon, 17 May 2021 20:14:17 +0200
Message-Id: <20210517181424.8093-53-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NP6yylL70NuXkOy5Nv5OEZ/Gv8VXtFibyGr6DK5bfs628kFBpwQ
 fZI/os3F00E0ZjFfpNoxe7VmkRaDImrbNqNL5K40P1TX3iMaYQsq+H4uRuvNKctrw/ov73S
 hSQsQOtdaGvtJaZCIFN4nsP7bndcsPAawjRSgfK/pBKMDV39tvBwp6jaCpv+TbWqyKH4tlW
 Lfy2YBf5NEIWQdm0mtu5g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:V3ySZRcyrng=:g0h+yZJes7maFtDWlL2oEy
 8fLcdPH4lZME0YUVsg2jJ89INhIyAtzEoIwdI463TgN6NeBM+yqScL9M0GwPgjV2Dv6jTLn4S
 njAv9Cj+YtF745m7kGaQvWQKwmi19zC8Y+rZ4aVm7tZ+X9GjMS7h8a3HlCAtS3f8FPYrw1NeD
 ou2YANGhJEJ178kvCQaPe626r9YgsJb2qjTgdVrrA+kJDq0+ZVQVevhlDaHk99C/hW09VBYfz
 3NujW1ennkQTcPrIB0mVmbf9otnhiU967oUTYkRkJqqSpBeJYDY+gp2C+Ut8pfBsZAxNuP6PN
 BCC1NoCwoPEacIsIPrGrVeSjzyMiqB9CIo8SSz1LO7q6HklQ+0sQVhl84RqZlAkmKBUr0KwPs
 TZPHeC5vLwTAjwM3I69DhW75LJzdE+q8ChY+nG8jn1kYx05aCkSYxknyTttRykyH385+sxf7K
 3PvpOg3tA2R6w9l0bGhNjGjpLZDqbnkqgg+M2USmSzCWdU2GqenhZF8wiUcG5n7GTFgZGwzN6
 RXjGq2kIdVzxVSGFmXxYr8=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Use ka_restorer, in line with TARGET_ARCH_HAS_KA_RESTORER
vs TARGET_ARCH_HAS_SA_RESTORER, since Alpha passes this
field as a syscall argument.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210422230227.314751-3-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/alpha/signal.c | 8 ++++----
 linux-user/syscall.c      | 4 ++--
 linux-user/syscall_defs.h | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux-user/alpha/signal.c b/linux-user/alpha/signal.c
index 0eec9ba3fd82..1129ffeea1d8 100644
--- a/linux-user/alpha/signal.c
+++ b/linux-user/alpha/signal.c
@@ -138,8 +138,8 @@ void setup_frame(int sig, struct target_sigaction *ka,
 
     setup_sigcontext(&frame->sc, env, frame_addr, set);
 
-    if (ka->sa_restorer) {
-        r26 = ka->sa_restorer;
+    if (ka->ka_restorer) {
+        r26 = ka->ka_restorer;
     } else {
         __put_user(INSN_MOV_R30_R16, &frame->retcode[0]);
         __put_user(INSN_LDI_R0 + TARGET_NR_sigreturn,
@@ -192,8 +192,8 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
         __put_user(set->sig[i], &frame->uc.tuc_sigmask.sig[i]);
     }
 
-    if (ka->sa_restorer) {
-        r26 = ka->sa_restorer;
+    if (ka->ka_restorer) {
+        r26 = ka->ka_restorer;
     } else {
         __put_user(INSN_MOV_R30_R16, &frame->retcode[0]);
         __put_user(INSN_LDI_R0 + TARGET_NR_rt_sigreturn,
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index e05870c33884..82736540ebcc 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8989,7 +8989,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 act._sa_handler = old_act->_sa_handler;
                 target_siginitset(&act.sa_mask, old_act->sa_mask);
                 act.sa_flags = old_act->sa_flags;
-                act.sa_restorer = 0;
+                act.ka_restorer = 0;
                 unlock_user_struct(old_act, arg2, 0);
                 pact = &act;
             }
@@ -9085,7 +9085,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 act._sa_handler = rt_act->_sa_handler;
                 act.sa_mask = rt_act->sa_mask;
                 act.sa_flags = rt_act->sa_flags;
-                act.sa_restorer = arg5;
+                act.ka_restorer = arg5;
                 unlock_user_struct(rt_act, arg2, 0);
                 pact = &act;
             }
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 25be414727f5..693d4f3788d4 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -519,7 +519,7 @@ struct target_sigaction {
     abi_ulong _sa_handler;
     abi_ulong sa_flags;
     target_sigset_t sa_mask;
-    abi_ulong sa_restorer;
+    abi_ulong ka_restorer;
 };
 #elif defined(TARGET_MIPS)
 struct target_sigaction {
-- 
2.31.1


