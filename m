Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CB853B8EC
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 14:21:34 +0200 (CEST)
Received: from localhost ([::1]:54576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwjpV-0001zK-U6
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 08:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTU-0000bM-Bb
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:48 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:56375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTS-0001E8-6w
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:48 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MKsf5-1oDZuB1zDx-00LIFh; Thu, 02
 Jun 2022 13:58:42 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 07/19] target/m68k: Remove retaddr in m68k_interrupt_all
Date: Thu,  2 Jun 2022 13:58:25 +0200
Message-Id: <20220602115837.2013918-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220602115837.2013918-1-laurent@vivier.eu>
References: <20220602115837.2013918-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:q1sjSe+GkGOoLn5SpR62FDp5/1rKAfDn74SyKr5evD+4lhcX5Pd
 xZfGAhnr42NLWnRGHF5WU+h30xWpsv5gxUuuh4WdfxyfsI6TRvAo76OMwce1Je3hBRjOExO
 XeLmofY4vyhoiLhHjth7vDKj5pyFRn+5Jx8bILjhicPkNM4Ey2kmJFlk/cIWS7GLUtvyF5S
 NqZu65HZSlLN08pCOuuuQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:evpqtX4b1Nc=:lrr91Yw8qWAJhByZVrs175
 O9n77bFe49d4Q0Ykbl69Hu7XW8tKQYMcTsBJUKZ5RhwJ+uY6kUvPQAy7hdxx1tmRthajZDSLN
 8uOiIEVpzJHiawGJcBt5CzxswKIzJ1Azqsw+mMYlpQcDF2B4G0eB8jIaBfcZAQMNbX8F65cjl
 HwOC8XjN24jFY04SduJl6dRdGy3HDK97YytgQwhOA4xLu2C0LUGzzJPuOTkZBBJezR+NaVUy7
 W8z+4cEMZI0IYhdtOlKYgW8nakGSmj7zm1hlrsPAvX12d2p9aZsea5vuN8myRfeCtD2udIi8n
 LLccoeFCtCq1hEuiGzXYJpGx0OPu3VnNz/lnLLGuPMJJb2QzEu6Q6Gz96GYkkOfqla4hojte6
 xgfQmGZcKRYnyI4iLS837/p2yhdJD4I6KamNxj+r3fq25RHysvTmBGuZ0ZV5iTQkuHk4VHEiN
 +FeYui67uBuNYitO/+yi41CtSzASi2OOohh3aGTmxbcpo4wJV1NB9cTg1PZp95jqcPHzgbZxt
 /mCNdG2DskFIAQ/EtLRgH2dShv5aEjmWaHfuOjRN3m1JcqiWH22e7ph2p245lmsGH86R7Xr5e
 ZpKktggtvOOGV2QceZ9Tmwrz9YydSpCCNv5aHJInp6onGH1WZYSxjZkvglkDRnaHCoiCzPkB4
 hqlYHjKEKj5uEbk1vlU52da68z2ISamK/wxIAH/w7ZLE1onE9HqCNpaOZIxSja06y55m/Ql7r
 Np2OdIOZRTqZaI3w7FZ1LFBW6wKxwmLOpgDgXg==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

From: Richard Henderson <richard.henderson@linaro.org>

The only value this variable holds is now env->pc.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220602013401.303699-6-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/op_helper.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 0f41c2dce3cc..777869790b66 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -287,12 +287,9 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
 {
     CPUState *cs = env_cpu(env);
     uint32_t sp;
-    uint32_t retaddr;
     uint32_t vector;
     uint16_t sr, oldsr;
 
-    retaddr = env->pc;
-
     if (!is_hw) {
         switch (cs->exception_index) {
         case EXCP_RTE:
@@ -385,7 +382,7 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         sp -= 4;
         cpu_stl_mmuidx_ra(env, sp, env->mmu.ar, MMU_KERNEL_IDX, 0);
 
-        do_stack_frame(env, &sp, 7, oldsr, 0, retaddr);
+        do_stack_frame(env, &sp, 7, oldsr, 0, env->pc);
         env->mmu.fault = false;
         if (qemu_loglevel_mask(CPU_LOG_INT)) {
             qemu_log("            "
@@ -395,7 +392,7 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         break;
 
     case EXCP_ADDRESS:
-        do_stack_frame(env, &sp, 2, oldsr, 0, retaddr);
+        do_stack_frame(env, &sp, 2, oldsr, 0, env->pc);
         break;
 
     case EXCP_ILLEGAL:
@@ -404,12 +401,12 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
     case EXCP_TRAPCC:
     case EXCP_TRACE:
         /* FIXME: addr is not only env->pc */
-        do_stack_frame(env, &sp, 2, oldsr, env->pc, retaddr);
+        do_stack_frame(env, &sp, 2, oldsr, env->pc, env->pc);
         break;
 
     case EXCP_SPURIOUS ... EXCP_INT_LEVEL_7:
         if (is_hw && (oldsr & SR_M)) {
-            do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
+            do_stack_frame(env, &sp, 0, oldsr, 0, env->pc);
             oldsr = sr;
             env->aregs[7] = sp;
             cpu_m68k_set_sr(env, sr & ~SR_M);
@@ -417,13 +414,13 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
             if (!m68k_feature(env, M68K_FEATURE_UNALIGNED_DATA)) {
                 sp &= ~1;
             }
-            do_stack_frame(env, &sp, 1, oldsr, 0, retaddr);
+            do_stack_frame(env, &sp, 1, oldsr, 0, env->pc);
             break;
         }
         /* fall through */
 
     default:
-        do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
+        do_stack_frame(env, &sp, 0, oldsr, 0, env->pc);
         break;
     }
 
-- 
2.36.1


