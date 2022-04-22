Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668BB50B76F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 14:34:50 +0200 (CEST)
Received: from localhost ([::1]:51694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhsUr-0005an-Hp
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 08:34:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nhrhb-0004l7-Lf
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:43:56 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:39848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nhrha-0003ea-3e
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:43:55 -0400
Received: by mail-pl1-x630.google.com with SMTP id c12so10278581plr.6
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 04:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=szXuTjbI6ruOG61z6eyHDfHfQXgsXjWjd2ILrlbqQGc=;
 b=Zj8DMIT6BhfjE7Iu7G49i+jBdpEZbb+UE5vJcjh0uOwvnxkpOlwLHB2Tnu8SW34qbu
 QBraxhJSsCiP03yB01NmbzRyrgq0nM7E0stB8EvWCz6/NqfK966ypTbBLgFIDIlWOhqm
 n4QI0pY4HxnPbYsHcZ49XG/sE2Uu7ucz8589PhXBEjJA4aT1cOWtBW/hqsr/QeOsQ0ht
 SexUo66ujFxVPZR5uqJrHHinyMatkV9/KWBmQbUfy5jNe00Miied8ErJgT3711/nnwgh
 ZVdJK6HqHqKDC9viqxJETePCzwQawpAW8LSUI5jX9tMrvcC/2slUPd/7Vd61GNfirKMZ
 yBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=szXuTjbI6ruOG61z6eyHDfHfQXgsXjWjd2ILrlbqQGc=;
 b=3aWwu5SliLKlLemXCvh2POJbL6UbVAKuEFlkD9mDxVpznbcM1NqTdyi+8QA+6U2BFh
 vWvwgIZT2RBlNPCKBMg1tibfLlEMSWGXM58nM4s4gHKgDm83O4tYeN8+QXB7QuyNn86q
 5dZ+c8tsfRtdb9QtZbPzbgujSa0UImM1IAeNk55RkoLgsRVrIcj5jv9kZcm/cVLGQ4Zc
 WzMl34v80DaiR8ZfQ61L2plOqs+MF1trVvoMiYP3aoZAL8HoeXeoWV/ycddnyqFNH4cj
 FBS+wlDUqwMYffEzN5foEBUZdMUNHErPoJl8/13OnOeaXERbfMYWHL/CtZkc2lwugdpA
 2Y5g==
X-Gm-Message-State: AOAM533FA1g4uOXlmq2RxEt8SBIOk63CsIN1kTXT2WfYYCIqaFZFMOUZ
 2HoMOzoQXRednkQ8QhlaF0eVLKW9eXA=
X-Google-Smtp-Source: ABdhPJxZHF22ar18tIJ1NVIOYqpiDIexkIUTXdC2dvQqWKMMmCqDBdyajeICAy+CtE28Ge2dlMD75A==
X-Received: by 2002:a17:902:8504:b0:158:914f:ca3 with SMTP id
 bj4-20020a170902850400b00158914f0ca3mr3898376plb.67.1650627832590; 
 Fri, 22 Apr 2022 04:43:52 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:4c40:4238:b597:4c1a])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a056a00245000b004f7728a4346sm2706519pfj.79.2022.04.22.04.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 04:43:52 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/7] target/xtensa: use tcg_constant_* for FPU conversion
 opcodes
Date: Fri, 22 Apr 2022 04:43:31 -0700
Message-Id: <20220422114332.374472-7-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220422114332.374472-1-jcmvbkbc@gmail.com>
References: <20220422114332.374472-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pl1-x630.google.com
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FPU conversion opcodes pass scale (range 0..15) and rounding mode to
their helpers. Use tcg_constant_* for them.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 target/xtensa/translate.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index c51aea460160..09fb3df40934 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -6512,20 +6512,19 @@ static void translate_const_s(DisasContext *dc, const OpcodeArg arg[],
 static void translate_float_d(DisasContext *dc, const OpcodeArg arg[],
                               const uint32_t par[])
 {
-    TCGv_i32 scale = tcg_const_i32(-arg[2].imm);
+    TCGv_i32 scale = tcg_constant_i32(-arg[2].imm);
 
     if (par[0]) {
         gen_helper_uitof_d(arg[0].out, cpu_env, arg[1].in, scale);
     } else {
         gen_helper_itof_d(arg[0].out, cpu_env, arg[1].in, scale);
     }
-    tcg_temp_free(scale);
 }
 
 static void translate_float_s(DisasContext *dc, const OpcodeArg arg[],
                               const uint32_t par[])
 {
-    TCGv_i32 scale = tcg_const_i32(-arg[2].imm);
+    TCGv_i32 scale = tcg_constant_i32(-arg[2].imm);
     OpcodeArg arg32[1];
 
     get_f32_o1(arg, arg32, 0);
@@ -6535,14 +6534,13 @@ static void translate_float_s(DisasContext *dc, const OpcodeArg arg[],
         gen_helper_itof_s(arg32[0].out, cpu_env, arg[1].in, scale);
     }
     put_f32_o1(arg, arg32, 0);
-    tcg_temp_free(scale);
 }
 
 static void translate_ftoi_d(DisasContext *dc, const OpcodeArg arg[],
                              const uint32_t par[])
 {
-    TCGv_i32 rounding_mode = tcg_const_i32(par[0]);
-    TCGv_i32 scale = tcg_const_i32(arg[2].imm);
+    TCGv_i32 rounding_mode = tcg_constant_i32(par[0]);
+    TCGv_i32 scale = tcg_constant_i32(arg[2].imm);
 
     if (par[1]) {
         gen_helper_ftoui_d(arg[0].out, cpu_env, arg[1].in,
@@ -6551,15 +6549,13 @@ static void translate_ftoi_d(DisasContext *dc, const OpcodeArg arg[],
         gen_helper_ftoi_d(arg[0].out, cpu_env, arg[1].in,
                           rounding_mode, scale);
     }
-    tcg_temp_free(rounding_mode);
-    tcg_temp_free(scale);
 }
 
 static void translate_ftoi_s(DisasContext *dc, const OpcodeArg arg[],
                              const uint32_t par[])
 {
-    TCGv_i32 rounding_mode = tcg_const_i32(par[0]);
-    TCGv_i32 scale = tcg_const_i32(arg[2].imm);
+    TCGv_i32 rounding_mode = tcg_constant_i32(par[0]);
+    TCGv_i32 scale = tcg_constant_i32(arg[2].imm);
     OpcodeArg arg32[2];
 
     get_f32_i1(arg, arg32, 1);
@@ -6571,8 +6567,6 @@ static void translate_ftoi_s(DisasContext *dc, const OpcodeArg arg[],
                           rounding_mode, scale);
     }
     put_f32_i1(arg, arg32, 1);
-    tcg_temp_free(rounding_mode);
-    tcg_temp_free(scale);
 }
 
 static void translate_ldsti(DisasContext *dc, const OpcodeArg arg[],
-- 
2.30.2


