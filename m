Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A234606504
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:49:47 +0200 (CEST)
Received: from localhost ([::1]:33762 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXnl-0001Ri-BP
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:49:45 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXm1-0000ud-Ib
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUZL-0001az-K6
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:23:00 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:33298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUZ1-00017K-Im
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:33 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 n16-20020a05600c4f9000b003c17bf8ddecso2407690wmq.0
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SNpXuTlCytIZ4x6zhjqsI9nwqhrXzHMZLkKSFA4QsU8=;
 b=Wx4WaXG8p/lFedN1n82u9fgV68bX4t4Ln2KU4C/5gQSSrgWWZKuYj86Jwe3sn1lkvt
 VDdeA3W/XyQf6ZmMoa4snK0ViYFC98VuMMh/oV2ox0ls+mCIHL8xDVzy0qdSVvBXTYf2
 pemybc34yWItT7DO1675guqsTHoKB9oNPhNy1KCiQlQTWyXMYTTyiEejaNfrARbqQWv0
 76I00/POcYd5xFxeNbMRvZURNW5UFvjOAC/I2NsO10tRl4oumFVylFMIS5VxMJY+4x/4
 S995xcw2eMk56v4YDTKRO6fJcyGh1aHg89sY+WVdyFCK8RYJPSRr9XyI9w0fs7c3YBvA
 e48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SNpXuTlCytIZ4x6zhjqsI9nwqhrXzHMZLkKSFA4QsU8=;
 b=i6FRPjiv1fFI95/0VpQlVtFxo8WAtPMv6VV1iRU7zOx+Dd/q2ZLJAb+kDXHkSpgO+W
 sn5pV/YIaea9tFbcxKtm8Bw2eS/Co9rrh7r8qknu8O/nKOQiKYG4/0q0iiZyltb6VKI5
 RQIuWi8TR2p4gHr+eHZ1pql9QwS+DCLfLGPxMT1lzhPXIq/2mtV8BSXWiZ2gQ00MOx/L
 JNvmiKrXQ1lvU4f9Kup3KPNykplaaYjlo0kx/L5Bw74wQcv8W5qbJI6MqEaGacbEdeBc
 JppFsfXBIJ/jlgfTflCwKhT4iI1ZUcWwqYAgPau2OaGAk7njqh8Jb1qTSJhZ3on81FmV
 Z8HA==
X-Gm-Message-State: ACrzQf2vR7huD/2F5B3bClX/tAGI+nKIGuTcqFH35z7R9HmcwbXatYLP
 6swbbZYXs2H7jcK+60MHc9SitVKgdtShWQ==
X-Google-Smtp-Source: AMsMyM6NGzP4mJsjRR1DogBuycx5IPW4FGWNh050kf7Rqb7XiQ+z0GU3Ojbfy+nXbl7abe7IcAKmYw==
X-Received: by 2002:a05:600c:468a:b0:3c6:f84a:1fae with SMTP id
 p10-20020a05600c468a00b003c6f84a1faemr13410632wmo.148.1666268536923; 
 Thu, 20 Oct 2022 05:22:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b00230c9d427f9sm16520192wrs.53.2022.10.20.05.22.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:22:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/24] target/arm: Introduce gen_pc_plus_diff for aarch32
Date: Thu, 20 Oct 2022 13:21:44 +0100
Message-Id: <20221020122146.3177980-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020122146.3177980-1-peter.maydell@linaro.org>
References: <20221020122146.3177980-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221020030641.2066807-9-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index ca128edab7e..5f6bd9b5b79 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -260,23 +260,22 @@ static inline int get_a32_user_mem_index(DisasContext *s)
     }
 }
 
-/* The architectural value of PC.  */
-static uint32_t read_pc(DisasContext *s)
-{
-    return s->pc_curr + (s->thumb ? 4 : 8);
-}
-
 /* The pc_curr difference for an architectural jump. */
 static target_long jmp_diff(DisasContext *s, target_long diff)
 {
     return diff + (s->thumb ? 4 : 8);
 }
 
+static void gen_pc_plus_diff(DisasContext *s, TCGv_i32 var, target_long diff)
+{
+    tcg_gen_movi_i32(var, s->pc_curr + diff);
+}
+
 /* Set a variable to the value of a CPU register.  */
 void load_reg_var(DisasContext *s, TCGv_i32 var, int reg)
 {
     if (reg == 15) {
-        tcg_gen_movi_i32(var, read_pc(s));
+        gen_pc_plus_diff(s, var, jmp_diff(s, 0));
     } else {
         tcg_gen_mov_i32(var, cpu_R[reg]);
     }
@@ -292,7 +291,11 @@ TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, int ofs)
     TCGv_i32 tmp = tcg_temp_new_i32();
 
     if (reg == 15) {
-        tcg_gen_movi_i32(tmp, (read_pc(s) & ~3) + ofs);
+        /*
+         * This address is computed from an aligned PC:
+         * subtract off the low bits.
+         */
+        gen_pc_plus_diff(s, tmp, jmp_diff(s, ofs - (s->pc_curr & 3)));
     } else {
         tcg_gen_addi_i32(tmp, cpu_R[reg], ofs);
     }
@@ -1155,7 +1158,7 @@ void unallocated_encoding(DisasContext *s)
 /* Force a TB lookup after an instruction that changes the CPU state.  */
 void gen_lookup_tb(DisasContext *s)
 {
-    tcg_gen_movi_i32(cpu_R[15], s->base.pc_next);
+    gen_pc_plus_diff(s, cpu_R[15], curr_insn_len(s));
     s->base.is_jmp = DISAS_EXIT;
 }
 
@@ -6479,7 +6482,7 @@ static bool trans_BLX_r(DisasContext *s, arg_BLX_r *a)
         return false;
     }
     tmp = load_reg(s, a->rm);
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | s->thumb);
     gen_bx(s, tmp);
     return true;
 }
@@ -8347,7 +8350,7 @@ static bool trans_B_cond_thumb(DisasContext *s, arg_ci *a)
 
 static bool trans_BL(DisasContext *s, arg_i *a)
 {
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | s->thumb);
     gen_jmp(s, jmp_diff(s, a->imm));
     return true;
 }
@@ -8366,7 +8369,7 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
     if (s->thumb && (a->imm & 2)) {
         return false;
     }
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | s->thumb);
     store_cpu_field_constant(!s->thumb, thumb);
     /* This jump is computed from an aligned PC: subtract off the low bits. */
     gen_jmp(s, jmp_diff(s, a->imm - (s->pc_curr & 3)));
@@ -8376,7 +8379,7 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
 static bool trans_BL_BLX_prefix(DisasContext *s, arg_BL_BLX_prefix *a)
 {
     assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
-    tcg_gen_movi_i32(cpu_R[14], read_pc(s) + (a->imm << 12));
+    gen_pc_plus_diff(s, cpu_R[14], jmp_diff(s, a->imm << 12));
     return true;
 }
 
@@ -8386,7 +8389,7 @@ static bool trans_BL_suffix(DisasContext *s, arg_BL_suffix *a)
 
     assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
     tcg_gen_addi_i32(tmp, cpu_R[14], (a->imm << 1) | 1);
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | 1);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | 1);
     gen_bx(s, tmp);
     return true;
 }
@@ -8402,7 +8405,7 @@ static bool trans_BLX_suffix(DisasContext *s, arg_BLX_suffix *a)
     tmp = tcg_temp_new_i32();
     tcg_gen_addi_i32(tmp, cpu_R[14], a->imm << 1);
     tcg_gen_andi_i32(tmp, tmp, 0xfffffffc);
-    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | 1);
+    gen_pc_plus_diff(s, cpu_R[14], curr_insn_len(s) | 1);
     gen_bx(s, tmp);
     return true;
 }
@@ -8725,10 +8728,11 @@ static bool op_tbranch(DisasContext *s, arg_tbranch *a, bool half)
     tcg_gen_add_i32(addr, addr, tmp);
 
     gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), half ? MO_UW : MO_UB);
-    tcg_temp_free_i32(addr);
 
     tcg_gen_add_i32(tmp, tmp, tmp);
-    tcg_gen_addi_i32(tmp, tmp, read_pc(s));
+    gen_pc_plus_diff(s, addr, jmp_diff(s, 0));
+    tcg_gen_add_i32(tmp, tmp, addr);
+    tcg_temp_free_i32(addr);
     store_reg(s, 15, tmp);
     return true;
 }
-- 
2.25.1


