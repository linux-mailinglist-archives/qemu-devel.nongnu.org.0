Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BEB53B913
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 14:42:41 +0200 (CEST)
Received: from localhost ([::1]:59950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwk9u-00088F-IO
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 08:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTZ-0000or-61
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:53 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:51931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTX-0001GW-Ja
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:52 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MC2wN-1o4fxE2OSL-00COGj; Thu, 02
 Jun 2022 13:58:41 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 05/19] target/m68k: Fix coding style in m68k_interrupt_all
Date: Thu,  2 Jun 2022 13:58:23 +0200
Message-Id: <20220602115837.2013918-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220602115837.2013918-1-laurent@vivier.eu>
References: <20220602115837.2013918-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:S55jd4+FUU0Vu9TAGkeOUB3CV1u0XwpWiXYOfZy19ai6P5wpb/P
 MMJiq2Nj0Tl5E6JUMAmBo4CKNxZRLUqTXA23fJ5ZwWKtESsT5PJVxLhlvHWTEh8Lb5Vx50W
 vhszdFW+seo9bnYmTAejVGvOCkWyRWZOng6663MQQDqnDBmD6csGDpvHYDySVGaRxxsCbYa
 XM+92adDTGzr71F+0eSmA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Gjdxg35eqg0=:bsLqbKjB79LAKo5EXwgCmH
 xeovS/c19ZxfIO9tcyz7SlSs4a5v4ldj8QnVcM8KKqTw8+7IVFR2P4u9wJQvErZudQtzbL4zo
 TupvDjCa2VfSKqHoExvwOWiKQDX68opFxbAiAnP148gcurOA8NZvhMUZZPfcqgrTUxe0PTXqq
 cbv/LJZal9b9S1NUndXfAsitJ0m1/YcL2PiOHYnhZtTu+n4Slr4vb7YaqnFCI1YDF9+/PmLpJ
 fu/PkrZOPYbAzlry8zillZXGC22RXEVsro5wCJE2Aeem9MP+JSikZRl6VwO4mXor/cp/KaBlT
 Drpw8w+I0NUWvbwfpSHs4dKmc0SGSjVKn3Ju0gt1qGOpDA1+nMm9hOAnc88yFjEEr2wg79vne
 xogyUbIHjCg1GfSfq4fdCKo3haJyEh9aqOKcQ47qU9kqfkBTocMEx7pTYUqE4Dcjg7k1JOoc5
 twfBhUujH2lE+2TdeuHpiXTVgsZccmRZV93w9mj7GcAHJlyTqKqp4IHvNT7sMCwQyN4HtEkig
 LaW9poppH7jr1EbFUqLZvO9+9xAkY/Pgm41ZI85wjg40Xb3xdEKfvlz8hrTeNLcd67VAvuKne
 7HatHPig6QZsdn0L/y9CmTkbnnrGB9oxffrJl9GjEh+dhEB4xgHfU8uK5PDNtyPunpC/3iq0x
 Rjn2xovpQ1sKS8VFy0eEgpSag8IZ4ONdGnk+NMrPiKJRtVN2HCQPR9TkHoGpw5pDSXv34mlsd
 SohIsdJi0AjNcd+hHPOKs8Wxab1u/ldJowYOqw==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Add parenthesis around & vs &&.

Remove assignment to sr in function call argument -- note that
sr is unused after the call, so the assignment was never needed,
only the result of the & expression.

Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220602013401.303699-4-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/op_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 2b94a6ec84de..0f41c2dce3cc 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -408,11 +408,11 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         break;
 
     case EXCP_SPURIOUS ... EXCP_INT_LEVEL_7:
-        if (is_hw && oldsr & SR_M) {
+        if (is_hw && (oldsr & SR_M)) {
             do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
             oldsr = sr;
             env->aregs[7] = sp;
-            cpu_m68k_set_sr(env, sr &= ~SR_M);
+            cpu_m68k_set_sr(env, sr & ~SR_M);
             sp = env->aregs[7];
             if (!m68k_feature(env, M68K_FEATURE_UNALIGNED_DATA)) {
                 sp &= ~1;
-- 
2.36.1


