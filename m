Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B9650AAF1
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 23:45:00 +0200 (CEST)
Received: from localhost ([::1]:49814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhebj-0007lW-7g
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 17:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nheWa-0005uH-5T
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:39:40 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:43948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nheWY-00073h-JN
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:39:39 -0400
Received: by mail-pl1-x62a.google.com with SMTP id d15so6588944pll.10
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 14:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GOAh0XZ349iUnYzRrlljpuqmWYAueRiNiXJQDTtsGOo=;
 b=qGcO6W4F6eM0Ur3I45fHHIwH35u+iK+Isg/WpJoUlnKjdrNmrLhI7TgeNFfmCAAMSo
 QxoGWYMpqN0jOq0robokosASe0Zw/WWgTqkeyscpHiFvZf9vyuSKG+pL0y9XFdw6U7b5
 AVtKDIULMoZ8gy4Hd8aIYS8nn6FgtOVRzxczo08qttq5af6aRTZqmrlLWc7BmPwEo8Zx
 nd0h7HuOOJ2RV2d/ZNQg1vDhYn/Dm+Gu9p5K5U9tjBKgSUso6az1DbzfYURpI3DQ/5sW
 7UYr5Ed1seycX7yhJI7egtK+HYaLYHHskEEfpqSgnVud1WCZBAoAew9IwcQswMtoe120
 ZtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GOAh0XZ349iUnYzRrlljpuqmWYAueRiNiXJQDTtsGOo=;
 b=iGnEyfdMWkYwcyg55sgEPDKtlBRTYcsbfRaRbc0BTqHoHLzjODxvTMPetXNWrlj9+S
 V4Et9uT9LzrNK3hhAVsIh31DW4uxBVfGh8mbIRfSGFGiYcCJ+ZPGoFvOxCIf5CyYabyv
 scHaieI7rSpYw5qpOBaRC871pJFWodX0DwdcRSwlDGxmYr8ohvBWEQO4mHRmrGSexyVJ
 WInzn1+qpPw35vYAfJ3T1/bvunT9YXA5Sfem93Lvd8UHPgvQDSay+nV3zHAsZ/vaRLtP
 dm4I7TIq+PLPDwBERAXdNXYrQ9OaJxrVs4Wfs3qRiwxgt/x7OnQSFviQuAJ4tYUXgIzQ
 nhaA==
X-Gm-Message-State: AOAM532UX8lrehLC2mjXRGibakqlVPfmFPZiPSFweGOhf8nFOwpXLyCG
 ZZbnyNCg65gjNqVSVJpgyMN6rANLXm9QxA==
X-Google-Smtp-Source: ABdhPJzIAWJog0UHmyVrx6pmgns+m3VWV3jCH6Si9YRy6sFUgyjyvTQxSjoH+KT9qefTj52Hkw4X/w==
X-Received: by 2002:a17:902:b710:b0:156:47a6:c575 with SMTP id
 d16-20020a170902b71000b0015647a6c575mr1174014pls.37.1650577176453; 
 Thu, 21 Apr 2022 14:39:36 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:df13:3d47:8c92:6576])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a056a00190400b004fac0896e35sm73977pfi.42.2022.04.21.14.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 14:39:35 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] target/xtensa: use tcg_constant_* for remaining opcodes
Date: Thu, 21 Apr 2022 14:39:17 -0700
Message-Id: <20220421213917.368830-7-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421213917.368830-1-jcmvbkbc@gmail.com>
References: <20220421213917.368830-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

- gen_brcondi passes immediate field (less than 32 different possible
  values) to the helper;
- gen_callw_slot uses callinc (1..3);
- translate_entry passes stack register number (0..15) to the helper;
- gen_check_exclusive passes boolean to the helper;
- translate_ssai passes immediate shift amount (0..31) to the helper;
- gen_waiti passes immediate (0..15) to the helper;

use tcg_constant_* for the constants listed above. Fold gen_waiti body
into the translate_waiti as it's the only user.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 target/xtensa/translate.c | 44 ++++++++++++---------------------------
 1 file changed, 13 insertions(+), 31 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index fb4d80669c47..b3f8348dee26 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -406,11 +406,8 @@ static void gen_jumpi(DisasContext *dc, uint32_t dest, int slot)
 static void gen_callw_slot(DisasContext *dc, int callinc, TCGv_i32 dest,
         int slot)
 {
-    TCGv_i32 tcallinc = tcg_const_i32(callinc);
-
     tcg_gen_deposit_i32(cpu_SR[PS], cpu_SR[PS],
-            tcallinc, PS_CALLINC_SHIFT, PS_CALLINC_LEN);
-    tcg_temp_free(tcallinc);
+            tcg_constant_i32(callinc), PS_CALLINC_SHIFT, PS_CALLINC_LEN);
     tcg_gen_movi_i32(cpu_R[callinc << 2],
             (callinc << 30) | (dc->base.pc_next & 0x3fffffff));
     gen_jump_slot(dc, dest, slot);
@@ -456,9 +453,7 @@ static void gen_brcond(DisasContext *dc, TCGCond cond,
 static void gen_brcondi(DisasContext *dc, TCGCond cond,
                         TCGv_i32 t0, uint32_t t1, uint32_t addr)
 {
-    TCGv_i32 tmp = tcg_const_i32(t1);
-    gen_brcond(dc, cond, t0, tmp, addr);
-    tcg_temp_free(tmp);
+    gen_brcond(dc, cond, t0, tcg_constant_i32(t1), addr);
 }
 
 static uint32_t test_exceptions_sr(DisasContext *dc, const OpcodeArg arg[],
@@ -543,21 +538,6 @@ static MemOp gen_load_store_alignment(DisasContext *dc, MemOp mop,
     return mop;
 }
 
-#ifndef CONFIG_USER_ONLY
-static void gen_waiti(DisasContext *dc, uint32_t imm4)
-{
-    TCGv_i32 pc = tcg_const_i32(dc->base.pc_next);
-    TCGv_i32 intlevel = tcg_const_i32(imm4);
-
-    if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
-        gen_io_start();
-    }
-    gen_helper_waiti(cpu_env, pc, intlevel);
-    tcg_temp_free(pc);
-    tcg_temp_free(intlevel);
-}
-#endif
-
 static bool gen_window_check(DisasContext *dc, uint32_t mask)
 {
     unsigned r = 31 - clz32(mask);
@@ -1663,11 +1643,10 @@ static void translate_entry(DisasContext *dc, const OpcodeArg arg[],
                             const uint32_t par[])
 {
     TCGv_i32 pc = tcg_const_i32(dc->pc);
-    TCGv_i32 s = tcg_const_i32(arg[0].imm);
+    TCGv_i32 s = tcg_constant_i32(arg[0].imm);
     TCGv_i32 imm = tcg_const_i32(arg[1].imm);
     gen_helper_entry(cpu_env, pc, s, imm);
     tcg_temp_free(imm);
-    tcg_temp_free(s);
     tcg_temp_free(pc);
 }
 
@@ -1749,11 +1728,10 @@ static void gen_check_exclusive(DisasContext *dc, TCGv_i32 addr, bool is_write)
 {
     if (!option_enabled(dc, XTENSA_OPTION_MPU)) {
         TCGv_i32 tpc = tcg_const_i32(dc->pc);
-        TCGv_i32 write = tcg_const_i32(is_write);
 
-        gen_helper_check_exclusive(cpu_env, tpc, addr, write);
+        gen_helper_check_exclusive(cpu_env, tpc, addr,
+                                   tcg_constant_i32(is_write));
         tcg_temp_free(tpc);
-        tcg_temp_free(write);
     }
 }
 #endif
@@ -2517,9 +2495,7 @@ static void translate_ssa8l(DisasContext *dc, const OpcodeArg arg[],
 static void translate_ssai(DisasContext *dc, const OpcodeArg arg[],
                            const uint32_t par[])
 {
-    TCGv_i32 tmp = tcg_const_i32(arg[0].imm);
-    gen_right_shift_sar(dc, tmp);
-    tcg_temp_free(tmp);
+    gen_right_shift_sar(dc, tcg_constant_i32(arg[0].imm));
 }
 
 static void translate_ssl(DisasContext *dc, const OpcodeArg arg[],
@@ -2553,7 +2529,13 @@ static void translate_waiti(DisasContext *dc, const OpcodeArg arg[],
                             const uint32_t par[])
 {
 #ifndef CONFIG_USER_ONLY
-    gen_waiti(dc, arg[0].imm);
+    TCGv_i32 pc = tcg_const_i32(dc->base.pc_next);
+
+    if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_waiti(cpu_env, pc, tcg_constant_i32(arg[0].imm));
+    tcg_temp_free(pc);
 #endif
 }
 
-- 
2.30.2


