Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8546055E4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 05:21:49 +0200 (CEST)
Received: from localhost ([::1]:35984 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olM7w-00015d-Fz
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 23:21:48 -0400
Received: from [::1] (port=60164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olM0g-00026p-H0
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 23:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLu8-0003O1-6x
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 23:07:33 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:33728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLu6-0001na-Fv
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 23:07:31 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 z5-20020a17090a8b8500b00210a3a2364fso1488983pjn.0
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 20:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GijJJFcAlzJoiRg26un1mdsUkYxL5cYNKs3g8HCD2p0=;
 b=ApXmen02pgxxzrjsNc/Lg4IypxMB5MrWGx0O9qRTsTFs7F93L0sEg5j4bDJ1NCNwa5
 BanR2wv0WsGxL5rNF4DhU3KYsFLr/k+M8SezE1f0gt0gylZPUS4jrp+ELlMtuUfimXW/
 M7ehY5EHPA6IlH44cPAYhHPHLQQcmFR3Apijd0CxwgAQC+OgLNIttYDg2jfyELr+FzK3
 IJFUK6Wuniu4ZHkMkNuZb/adikZYuKcF/yFY7VA2C8TmljufSK2PKPBirQzqHKgd6B0h
 FVfJdg5hd/vbSorBeNwwO42wM+bPmUmoa9yBelZwyKiN0fchfdACQFHxftCoxRv+FTnk
 lO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GijJJFcAlzJoiRg26un1mdsUkYxL5cYNKs3g8HCD2p0=;
 b=HQyjcp5Iesj3K5GRlrahn8p9r0Uw8IX53XOOIKRlIxdmTJXEfBc005aivOlvLq27iK
 F6XX+/1N/LLnkAFvLalWEeG/f4CYgH9JawYpnrwcjt+7CboOEllu8o5P/gFbTTjCQLHE
 nFKP/xtZ7slVTejoZvJxpBH01pawRtSARxhnv7adITFZY51N85486TJIBjEOEIXY20wj
 28b12+zF8silK1jAdTO2YOtwmyzkdaOIVm02ME7AHO7y91JqbRYKbrCz69gxWjTJttpY
 wR2NrVBYAttUzlEtSzW5gOvcm6Y/7am/C9vatjfO0mpBOmm/GLNudXYG2atQl4oKK84C
 rqOg==
X-Gm-Message-State: ACrzQf2j7CojtxW0wGRHFZfIRSG3h0Sm2Wb8BZMRzCNY1PVk+GkedGDs
 7hFHqHEt7qQmSZeoJ6FPBBQ6zzS+L1ShiBZR
X-Google-Smtp-Source: AMsMyM4ZMpyXTC84ukOAoU1DKoTzytZWlFkeUHkltR0wYpF3fc67xI9ETljn9H/ReyePr2P9uAFROg==
X-Received: by 2002:a17:902:d2cf:b0:185:4bbd:1970 with SMTP id
 n15-20020a170902d2cf00b001854bbd1970mr11904300plc.88.1666235249573; 
 Wed, 19 Oct 2022 20:07:29 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a63ed49000000b0043c7996f7f0sm10657647pgk.58.2022.10.19.20.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 20:07:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v8 6/9] target/arm: Change gen_jmp* to work on displacements
Date: Thu, 20 Oct 2022 13:06:38 +1000
Message-Id: <20221020030641.2066807-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020030641.2066807-1-richard.henderson@linaro.org>
References: <20221020030641.2066807-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 37 +++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9104ab8232..ca128edab7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -266,6 +266,12 @@ static uint32_t read_pc(DisasContext *s)
     return s->pc_curr + (s->thumb ? 4 : 8);
 }
 
+/* The pc_curr difference for an architectural jump. */
+static target_long jmp_diff(DisasContext *s, target_long diff)
+{
+    return diff + (s->thumb ? 4 : 8);
+}
+
 /* Set a variable to the value of a CPU register.  */
 void load_reg_var(DisasContext *s, TCGv_i32 var, int reg)
 {
@@ -2592,7 +2598,7 @@ static void gen_goto_ptr(void)
  * cpu_loop_exec. Any live exit_requests will be processed as we
  * enter the next TB.
  */
-static void gen_goto_tb(DisasContext *s, int n, int diff)
+static void gen_goto_tb(DisasContext *s, int n, target_long diff)
 {
     target_ulong dest = s->pc_curr + diff;
 
@@ -2608,10 +2614,8 @@ static void gen_goto_tb(DisasContext *s, int n, int diff)
 }
 
 /* Jump, specifying which TB number to use if we gen_goto_tb() */
-static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
+static void gen_jmp_tb(DisasContext *s, target_long diff, int tbno)
 {
-    int diff = dest - s->pc_curr;
-
     if (unlikely(s->ss_active)) {
         /* An indirect jump so that we still trigger the debug exception.  */
         gen_update_pc(s, diff);
@@ -2653,9 +2657,9 @@ static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
     }
 }
 
-static inline void gen_jmp(DisasContext *s, uint32_t dest)
+static inline void gen_jmp(DisasContext *s, target_long diff)
 {
-    gen_jmp_tb(s, dest, 0);
+    gen_jmp_tb(s, diff, 0);
 }
 
 static inline void gen_mulxy(TCGv_i32 t0, TCGv_i32 t1, int x, int y)
@@ -8322,7 +8326,7 @@ static bool trans_CLRM(DisasContext *s, arg_CLRM *a)
 
 static bool trans_B(DisasContext *s, arg_i *a)
 {
-    gen_jmp(s, read_pc(s) + a->imm);
+    gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
 
@@ -8337,14 +8341,14 @@ static bool trans_B_cond_thumb(DisasContext *s, arg_ci *a)
         return true;
     }
     arm_skip_unless(s, a->cond);
-    gen_jmp(s, read_pc(s) + a->imm);
+    gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
 
 static bool trans_BL(DisasContext *s, arg_i *a)
 {
     tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
-    gen_jmp(s, read_pc(s) + a->imm);
+    gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
 
@@ -8364,7 +8368,8 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
     }
     tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
     store_cpu_field_constant(!s->thumb, thumb);
-    gen_jmp(s, (read_pc(s) & ~3) + a->imm);
+    /* This jump is computed from an aligned PC: subtract off the low bits. */
+    gen_jmp(s, jmp_diff(s, a->imm - (s->pc_curr & 3)));
     return true;
 }
 
@@ -8525,10 +8530,10 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
          * when we take this upcoming exit from this TB, so gen_jmp_tb() is OK.
          */
     }
-    gen_jmp_tb(s, s->base.pc_next, 1);
+    gen_jmp_tb(s, curr_insn_len(s), 1);
 
     gen_set_label(nextlabel);
-    gen_jmp(s, read_pc(s) + a->imm);
+    gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
 
@@ -8608,7 +8613,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
 
     if (a->f) {
         /* Loop-forever: just jump back to the loop start */
-        gen_jmp(s, read_pc(s) - a->imm);
+        gen_jmp(s, jmp_diff(s, -a->imm));
         return true;
     }
 
@@ -8639,7 +8644,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
         tcg_temp_free_i32(decr);
     }
     /* Jump back to the loop start */
-    gen_jmp(s, read_pc(s) - a->imm);
+    gen_jmp(s, jmp_diff(s, -a->imm));
 
     gen_set_label(loopend);
     if (a->tp) {
@@ -8647,7 +8652,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
         store_cpu_field(tcg_constant_i32(4), v7m.ltpsize);
     }
     /* End TB, continuing to following insn */
-    gen_jmp_tb(s, s->base.pc_next, 1);
+    gen_jmp_tb(s, curr_insn_len(s), 1);
     return true;
 }
 
@@ -8746,7 +8751,7 @@ static bool trans_CBZ(DisasContext *s, arg_CBZ *a)
     tcg_gen_brcondi_i32(a->nz ? TCG_COND_EQ : TCG_COND_NE,
                         tmp, 0, s->condlabel);
     tcg_temp_free_i32(tmp);
-    gen_jmp(s, read_pc(s) + a->imm);
+    gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
 
-- 
2.34.1


