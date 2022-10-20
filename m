Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D3E6055F1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 05:27:33 +0200 (CEST)
Received: from localhost ([::1]:55034 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olMDU-0005vY-AJ
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 23:27:32 -0400
Received: from [::1] (port=36518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olM0i-0002Jr-PJ
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 23:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLuG-0003Rp-Eu
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 23:07:43 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:44830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLuC-0001qQ-KR
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 23:07:39 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 t10-20020a17090a4e4a00b0020af4bcae10so1777762pjl.3
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 20:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OW7ujGu7vUMxa/AhGP5j8/p+4yGO6PZApuTTGs8ErJc=;
 b=caHIOa5MgtHY8Nq+lULlfIxrDjqXqwm7LhvwekE3JPu/jp5t7Qu1QjD/hYDko673dw
 UM2nN5pdLhEBd/xUhjcHYoEXeW8roR8IHoaTRCyfMTzfZb3YrDdYBnmUoF1bPmTf6Tb4
 fwFW+PJyIYV+yMLHTMLjpncCsXlKPZQDgsrQvP5gkriFeZbFiUmoamt8YY/cFgTyKw//
 G7WLEL5aQOFijIbRdOptKu6x7Oa9D+4jETmz0pyL2VYulf2SoQRgNvUKkfg4BpunxOXp
 in9lhIOHREFEuhw6Z4A76VNRc6TalXR/9h69dDSUxK81V3gB3E+ZvATiR2lmpb+5FXqg
 wW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OW7ujGu7vUMxa/AhGP5j8/p+4yGO6PZApuTTGs8ErJc=;
 b=XRds3T1r/CPXLV8TiYqJhham0bmoowflI6YlOe8YEvySrSe1prHNk6fK/6tPx+/p/E
 s4MYPQ6jKTjkJ07IzpOOeh7d+7pbprms9ktTbP1tQ0B56Spb1+ocsb82KVcjrWblAd7G
 yZMRzhPK0R3XgvWiTKOYm1kfkySlKJUgp4PxVPvZ0ld+14viS7Fr/W9ifR7s+10IWsjM
 pILnKO7zks58ytziO/h76pSEat+rKTDBGu/QLpDeLu26YXTkGMHiEEJeLKTkwF6XqeP6
 Nu0vjtviAiiLMoLhbmgzG3lwdK0JUdjvDk654y79y2qDyJKJlrRMAbSq2MTXHZiX+HCd
 llyw==
X-Gm-Message-State: ACrzQf3vMcZIjzWot4EydGxV8oOTwFoUrInAtRhnqYLGDj31XFUuJ7Q3
 AN5D1UF3Q7lvlY2E9WUDEWG10Xg9k6gEPyeF
X-Google-Smtp-Source: AMsMyM5uFCxNW6Lk/rbGa44BwCFbDn2L7vgl9shrKKh0U6llhSc9uzv88/gr/3MnB2ZqEToemkGY6g==
X-Received: by 2002:a17:90b:3a86:b0:20d:616f:4bb6 with SMTP id
 om6-20020a17090b3a8600b0020d616f4bb6mr49673964pjb.238.1666235253076; 
 Wed, 19 Oct 2022 20:07:33 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a63ed49000000b0043c7996f7f0sm10657647pgk.58.2022.10.19.20.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 20:07:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v8 7/9] target/arm: Introduce gen_pc_plus_diff for aarch64
Date: Thu, 20 Oct 2022 13:06:39 +1000
Message-Id: <20221020030641.2066807-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020030641.2066807-1-richard.henderson@linaro.org>
References: <20221020030641.2066807-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 target/arm/translate-a64.c | 41 +++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 623f7e2e96..f9f8559c01 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -140,9 +140,14 @@ static void reset_btype(DisasContext *s)
     }
 }
 
+static void gen_pc_plus_diff(DisasContext *s, TCGv_i64 dest, target_long diff)
+{
+    tcg_gen_movi_i64(dest, s->pc_curr + diff);
+}
+
 void gen_a64_update_pc(DisasContext *s, target_long diff)
 {
-    tcg_gen_movi_i64(cpu_pc, s->pc_curr + diff);
+    gen_pc_plus_diff(s, cpu_pc, diff);
 }
 
 /*
@@ -1360,7 +1365,7 @@ static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
 
     if (insn & (1U << 31)) {
         /* BL Branch with link */
-        tcg_gen_movi_i64(cpu_reg(s, 30), s->base.pc_next);
+        gen_pc_plus_diff(s, cpu_reg(s, 30), curr_insn_len(s));
     }
 
     /* B Branch / BL Branch with link */
@@ -2301,11 +2306,17 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
         default:
             goto do_unallocated;
         }
-        gen_a64_set_pc(s, dst);
         /* BLR also needs to load return address */
         if (opc == 1) {
-            tcg_gen_movi_i64(cpu_reg(s, 30), s->base.pc_next);
+            TCGv_i64 lr = cpu_reg(s, 30);
+            if (dst == lr) {
+                TCGv_i64 tmp = new_tmp_a64(s);
+                tcg_gen_mov_i64(tmp, dst);
+                dst = tmp;
+            }
+            gen_pc_plus_diff(s, lr, curr_insn_len(s));
         }
+        gen_a64_set_pc(s, dst);
         break;
 
     case 8: /* BRAA */
@@ -2328,11 +2339,17 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
         } else {
             dst = cpu_reg(s, rn);
         }
-        gen_a64_set_pc(s, dst);
         /* BLRAA also needs to load return address */
         if (opc == 9) {
-            tcg_gen_movi_i64(cpu_reg(s, 30), s->base.pc_next);
+            TCGv_i64 lr = cpu_reg(s, 30);
+            if (dst == lr) {
+                TCGv_i64 tmp = new_tmp_a64(s);
+                tcg_gen_mov_i64(tmp, dst);
+                dst = tmp;
+            }
+            gen_pc_plus_diff(s, lr, curr_insn_len(s));
         }
+        gen_a64_set_pc(s, dst);
         break;
 
     case 4: /* ERET */
@@ -2900,7 +2917,8 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
 
     tcg_rt = cpu_reg(s, rt);
 
-    clean_addr = tcg_constant_i64(s->pc_curr + imm);
+    clean_addr = new_tmp_a64(s);
+    gen_pc_plus_diff(s, clean_addr, imm);
     if (is_vector) {
         do_fp_ld(s, rt, clean_addr, size);
     } else {
@@ -4244,23 +4262,22 @@ static void disas_ldst(DisasContext *s, uint32_t insn)
 static void disas_pc_rel_adr(DisasContext *s, uint32_t insn)
 {
     unsigned int page, rd;
-    uint64_t base;
-    uint64_t offset;
+    int64_t offset;
 
     page = extract32(insn, 31, 1);
     /* SignExtend(immhi:immlo) -> offset */
     offset = sextract64(insn, 5, 19);
     offset = offset << 2 | extract32(insn, 29, 2);
     rd = extract32(insn, 0, 5);
-    base = s->pc_curr;
 
     if (page) {
         /* ADRP (page based) */
-        base &= ~0xfff;
         offset <<= 12;
+        /* The page offset is ok for TARGET_TB_PCREL. */
+        offset -= s->pc_curr & 0xfff;
     }
 
-    tcg_gen_movi_i64(cpu_reg(s, rd), base + offset);
+    gen_pc_plus_diff(s, cpu_reg(s, rd), offset);
 }
 
 /*
-- 
2.34.1


