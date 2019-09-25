Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD8CBDE9D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 15:11:44 +0200 (CEST)
Received: from localhost ([::1]:49758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iD754-00005o-Oa
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 09:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58000)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iD6gq-0001Tg-Qd
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 08:46:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iD6gp-0002ME-5q
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 08:46:40 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:56142 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iD6go-0002Gn-N0
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 08:46:39 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 537DA1A23A9;
 Wed, 25 Sep 2019 14:46:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 1F4DF1A23E2;
 Wed, 25 Sep 2019 14:46:22 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/20] target/mips: msa: Move helpers for <AND|NOR|OR|XOR>.V
Date: Wed, 25 Sep 2019 14:46:12 +0200
Message-Id: <1569415572-19635-21-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569415572-19635-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1569415572-19635-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
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
Cc: arikalo@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Cosmetic reorganization.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/helper.h     |  9 +++---
 target/mips/msa_helper.c | 81 ++++++++++++++++++++++++------------------------
 2 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/target/mips/helper.h b/target/mips/helper.h
index 3b1a965..d615c83 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -887,6 +887,11 @@ DEF_HELPER_4(msa_mod_s_h, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_mod_s_w, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_mod_s_d, void, env, i32, i32, i32)
 
+DEF_HELPER_4(msa_and_v, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_nor_v, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_or_v, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_xor_v, void, env, i32, i32, i32)
+
 DEF_HELPER_3(msa_move_v, void, env, i32, i32)
 
 DEF_HELPER_4(msa_andi_b, void, env, i32, i32, i32)
@@ -1021,10 +1026,6 @@ DEF_HELPER_5(msa_mulr_q_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_maddr_q_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_msubr_q_df, void, env, i32, i32, i32, i32)
 
-DEF_HELPER_4(msa_and_v, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_or_v, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_nor_v, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_xor_v, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_fill_df, void, env, i32, i32, i32)
 
 DEF_HELPER_4(msa_copy_s_b, void, env, i32, i32, i32)
diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index cece69b..e52d74f 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -1962,7 +1962,46 @@ void helper_msa_mod_u_d(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt
  * +---------------+----------------------------------------------------------+
  */
 
-/* TODO: insert Logic group helpers here */
+
+void helper_msa_and_v(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->d[0] = pws->d[0] & pwt->d[0];
+    pwd->d[1] = pws->d[1] & pwt->d[1];
+}
+
+void helper_msa_nor_v(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->d[0] = ~(pws->d[0] | pwt->d[0]);
+    pwd->d[1] = ~(pws->d[1] | pwt->d[1]);
+}
+
+void helper_msa_or_v(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->d[0] = pws->d[0] | pwt->d[0];
+    pwd->d[1] = pws->d[1] | pwt->d[1];
+}
+
+void helper_msa_xor_v(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->d[0] = pws->d[0] ^ pwt->d[0];
+    pwd->d[1] = pws->d[1] ^ pwt->d[1];
+}
 
 
 /*
@@ -2112,46 +2151,6 @@ void helper_msa_shf_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
     msa_move_v(pwd, pwx);
 }
 
-void helper_msa_and_v(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
-{
-    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
-    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
-    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
-
-    pwd->d[0] = pws->d[0] & pwt->d[0];
-    pwd->d[1] = pws->d[1] & pwt->d[1];
-}
-
-void helper_msa_or_v(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
-{
-    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
-    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
-    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
-
-    pwd->d[0] = pws->d[0] | pwt->d[0];
-    pwd->d[1] = pws->d[1] | pwt->d[1];
-}
-
-void helper_msa_nor_v(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
-{
-    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
-    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
-    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
-
-    pwd->d[0] = ~(pws->d[0] | pwt->d[0]);
-    pwd->d[1] = ~(pws->d[1] | pwt->d[1]);
-}
-
-void helper_msa_xor_v(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
-{
-    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
-    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
-    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
-
-    pwd->d[0] = pws->d[0] ^ pwt->d[0];
-    pwd->d[1] = pws->d[1] ^ pwt->d[1];
-}
-
 static inline int64_t msa_addv_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     return arg1 + arg2;
-- 
2.7.4


