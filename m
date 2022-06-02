Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9D353B8F2
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 14:24:03 +0200 (CEST)
Received: from localhost ([::1]:34694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwjru-0007mV-Gg
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 08:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTh-0001Bh-Jv
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:59:01 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:55455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTf-0001Ho-SD
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:59:01 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MsYzD-1ndhNy1SMF-00typ9; Thu, 02
 Jun 2022 13:58:49 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 19/19] target/m68k: Mark helper_raise_exception as noreturn
Date: Thu,  2 Jun 2022 13:58:37 +0200
Message-Id: <20220602115837.2013918-20-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220602115837.2013918-1-laurent@vivier.eu>
References: <20220602115837.2013918-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:r8vNTj3IrYU1gL5zTDko+2/VbcHj2MLpeigxtozZJCcK6LnL7q+
 8sfb0xuzFJPNIbh/3fLluUp3J8UyT6jZgf0+FBQmLopayYtjGp2UKLuq+TpOeIwsbhpgu1C
 iX8jII82E788YIR/mXh3t+6eTEPX//QffdbkAbIz7bB2pALR75ALtU50tOnqpm/k4JLuAaG
 rwzqi7PpnDW7T70Om7UVQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:s9/8px6N+I8=:MqSSY3y7ibhDqoEi5mX7Vy
 +kmQy+0vqER70rO8nKBv7bas0iDzGYW6l2sJfV6igqofpgIMzqw4eeDb9UBEQMA8i3jkx++4t
 w9EPqwn4kHDTbaFaeGdgi7l5CvP97iBb/wtlxXWACr0At2g9I7TLTEh7adAEjMfoIQM1GzlO0
 /M1+uwjE0cLBd7KGUTcQ0f/5EoAEmjiyLTtyR/8g3zl82qj8CkfMenCoazqibAfTAsHy8i3Nl
 8hNriLTQncwPTKhthnafDqiCXQXXtuNQezY1W85B1EgITnHCIaGsizQpQGI8kYzteKLHrcRF6
 0wOPpO7/9AfPCGFqbWBboiJnp22waJhiF0qq/S+U6ip081eexmcvhEOzBWhV/KphupZwwT+2X
 33sFs0MuRGHeJTvAFhUR/ymSEgWRpAUgD/89b7eSMK96K1PAvJcFmGYPjU9uRSHDJ9whV3bmj
 x1PRBd/mjfwIIr5O3vMSgrHh8uMau4pwsxTZJIrH0r+SQykiXZy1UDfwbZvEllBZFazmXYDl2
 bxwDydgUAqnLfel8VSlDo0lYm9Uak9KzvVzKI5tKkKNXgnlsVjGKe3cgSkg6y1UEc6BdQJTOX
 I52ZD2PFYgNAFmishZ1nYkUT7a9qnW1FF7xHGfShnbPUrTK6TvuQsTlYqcKuepLBpPw3BmqlL
 IRs/b/QbFElVsApEdftrRkxzodnEP3vLKHCt2sGUo5PuY1mQCxWOcYaOHn5RxckOqOblBcSL/
 v+jmzuVstpukt/CJsR+gX+XvgEvNL/Llo/r6Pg==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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

Also mark raise_exception_ra and raise_exception, lest we
generate a warning about helper_raise_exception returning.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220602013401.303699-18-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/helper.h    | 2 +-
 target/m68k/op_helper.c | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/m68k/helper.h b/target/m68k/helper.h
index f016c4c1c226..c9bed2b88456 100644
--- a/target/m68k/helper.h
+++ b/target/m68k/helper.h
@@ -109,7 +109,7 @@ DEF_HELPER_3(set_mac_extu, void, env, i32, i32)
 DEF_HELPER_2(flush_flags, void, env, i32)
 DEF_HELPER_2(set_ccr, void, env, i32)
 DEF_HELPER_FLAGS_1(get_ccr, TCG_CALL_NO_WG_SE, i32, env)
-DEF_HELPER_2(raise_exception, void, env, i32)
+DEF_HELPER_2(raise_exception, noreturn, env, i32)
 
 DEF_HELPER_FLAGS_3(bfffo_reg, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
 
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 61948d92bb25..d9937ca8dc5a 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -532,7 +532,8 @@ bool m68k_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 
 #endif /* !CONFIG_USER_ONLY */
 
-static void raise_exception_ra(CPUM68KState *env, int tt, uintptr_t raddr)
+G_NORETURN static void
+raise_exception_ra(CPUM68KState *env, int tt, uintptr_t raddr)
 {
     CPUState *cs = env_cpu(env);
 
@@ -540,7 +541,7 @@ static void raise_exception_ra(CPUM68KState *env, int tt, uintptr_t raddr)
     cpu_loop_exit_restore(cs, raddr);
 }
 
-static void raise_exception(CPUM68KState *env, int tt)
+G_NORETURN static void raise_exception(CPUM68KState *env, int tt)
 {
     raise_exception_ra(env, tt, 0);
 }
-- 
2.36.1


