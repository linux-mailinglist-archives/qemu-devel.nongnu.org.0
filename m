Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A1426B9CB
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 04:17:35 +0200 (CEST)
Received: from localhost ([::1]:50376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIN0o-0000Ta-RG
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 22:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1kIMyB-0006TX-PS
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 22:14:52 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:43174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1kIMy8-0003s4-HJ
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 22:14:51 -0400
Received: by mail-pf1-x433.google.com with SMTP id f18so3041788pfa.10
 for <qemu-devel@nongnu.org>; Tue, 15 Sep 2020 19:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ioMBFV1M1wl2ZDlMSwXddY79Ll6ghlfT/RZ3Q8h1ZT8=;
 b=t6PpKgOIWZEhc2yVwRNofiojgcHdshS4zkGm6v38HfmmzFtUPRov6Qkmv6ZussnJDz
 pJE1ia7YA7ClhL9ysZuJ6Etgfh6p8xV42mPXwqxF2oEYwbJ8/zVWxtQIiK6LZwTkzddm
 7tQAOi62VpWNraT9PrXdsJEFfVj1W3SdRn3YnCs8pf0WLyC5y35+NQUYcoqqpVqqzK6k
 UYXwhhPf/ZBU0RLh/FA5ZZj7x62ZTqzmNVHLJN+NfyQ0OaA6XRQ/ulUwHkLHSgdWC6Nh
 Pp5yqyzcc71RF9JXfC6frEBSvFuvXCq5RfKkpC6yvSlgE+KO1ca9u6q6ekO5s7y2oaiV
 DpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ioMBFV1M1wl2ZDlMSwXddY79Ll6ghlfT/RZ3Q8h1ZT8=;
 b=KNGpSaAGEdl/5ODTv4vUn1nr/Q8PEAiZrne3AdBvvf9UjykMaWhoIRtvc8/HGjRjyU
 sKc1RjPhWdHP6UrI2TBr1iHDyaEChsWC5L1bOpXeU9NW8H8iahFXJkZ81lVYg4g6RM0c
 nfK5bJt1mtrL37yGKD5krsOmMws7qjbVBgG5SvODmeM/7ptsuwwQtf4ZZ7y68unFtyFa
 VhUrywhblyR6jfdYtrdD5ok6u2Nx3TbWr1A8NinUuXtPmoiacGywOh56jTByIQfAoxXC
 B678W2fUwvcFI+JPrkxLtz0C3sUx/n06qut1X3xj8peNRudi96asJt6jCZFLfQP2V+8v
 pwvg==
X-Gm-Message-State: AOAM531W6urzGt4l/E3Rx3SR3VoR9CX62OYcRNuFqQ++L+u882EWHCmp
 EQ6VodQ1jJgEtSBnotCwFeE=
X-Google-Smtp-Source: ABdhPJwXyB6c4xcuiAyG30vbrEAqlkFlBuK9IyFq/X9aCXhWYtmVRC6BKbzhB3Z1N9TrZULz5XbBcg==
X-Received: by 2002:a62:26c1:0:b029:142:2501:35ef with SMTP id
 m184-20020a6226c10000b0290142250135efmr4241501pfm.79.1600222487255; 
 Tue, 15 Sep 2020 19:14:47 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
 by smtp.gmail.com with ESMTPSA id y29sm16149486pfq.207.2020.09.15.19.14.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Sep 2020 19:14:46 -0700 (PDT)
From: Huacai Chen <zltjiangshi@gmail.com>
X-Google-Original-From: Huacai Chen <chenhc@lemote.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Subject: [PATCH V9 4/6] target/mips: Add loongson-ext lswc2 group of
 instructions (Part 2)
Date: Wed, 16 Sep 2020 10:12:22 +0800
Message-Id: <1600222344-16808-5-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1600222344-16808-1-git-send-email-chenhc@lemote.com>
References: <1600222344-16808-1-git-send-email-chenhc@lemote.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=zltjiangshi@gmail.com; helo=mail-pf1-x433.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@gmail.com>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhc@lemote.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

LWC2 & SWC2 have been rewritten by Loongson EXT vendor ASE
as "load/store quad word" and "shifted load/store" groups of
instructions.

This patch add implementation of these instructions:
gslwlc1: similar to lwl but RT is FPR instead of GPR
gslwrc1: similar to lwr but RT is FPR instead of GPR
gsldlc1: similar to ldl but RT is FPR instead of GPR
gsldrc1: similar to ldr but RT is FPR instead of GPR
gsswlc1: similar to swl but RT is FPR instead of GPR
gsswrc1: similar to swr but RT is FPR instead of GPR
gssdlc1: similar to sdl but RT is FPR instead of GPR
gssdrc1: similar to sdr but RT is FPR instead of GPR

Details of Loongson-EXT is here:
https://github.com/FlyGoat/loongson-insn/blob/master/loongson-ext.md

Signed-off-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 target/mips/translate.c | 177 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 177 insertions(+)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 08d51e1..2bcf1ce 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -471,6 +471,19 @@ enum {
     OPC_GSSHFS      = OPC_SWC2,
 };
 
+/* Loongson EXT shifted load/store opcodes */
+#define MASK_LOONGSON_GSSHFLS(op)         (MASK_OP_MAJOR(op) | (op & 0xc03f))
+enum {
+    OPC_GSLWLC1     = 0x4 | OPC_GSSHFL,
+    OPC_GSLWRC1     = 0x5 | OPC_GSSHFL,
+    OPC_GSLDLC1     = 0x6 | OPC_GSSHFL,
+    OPC_GSLDRC1     = 0x7 | OPC_GSSHFL,
+    OPC_GSSWLC1     = 0x4 | OPC_GSSHFS,
+    OPC_GSSWRC1     = 0x5 | OPC_GSSHFS,
+    OPC_GSSDLC1     = 0x6 | OPC_GSSHFS,
+    OPC_GSSDRC1     = 0x7 | OPC_GSSHFS,
+};
+
 /* BSHFL opcodes */
 #define MASK_BSHFL(op)              (MASK_SPECIAL3(op) | (op & (0x1F << 6)))
 
@@ -5981,6 +5994,170 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
         tcg_temp_free(t1);
         break;
 #endif
+    case OPC_GSSHFL:
+        switch (MASK_LOONGSON_GSSHFLS(ctx->opcode)) {
+        case OPC_GSLWLC1:
+            check_cp1_enabled(ctx);
+            gen_base_offset_addr(ctx, t0, rs, shf_offset);
+            t1 = tcg_temp_new();
+            tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_UB);
+            tcg_gen_andi_tl(t1, t0, 3);
+#ifndef TARGET_WORDS_BIGENDIAN
+            tcg_gen_xori_tl(t1, t1, 3);
+#endif
+            tcg_gen_shli_tl(t1, t1, 3);
+            tcg_gen_andi_tl(t0, t0, ~3);
+            tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEUL);
+            tcg_gen_shl_tl(t0, t0, t1);
+            t2 = tcg_const_tl(-1);
+            tcg_gen_shl_tl(t2, t2, t1);
+            fp0 = tcg_temp_new_i32();
+            gen_load_fpr32(ctx, fp0, rt);
+            tcg_gen_ext_i32_tl(t1, fp0);
+            tcg_gen_andc_tl(t1, t1, t2);
+            tcg_temp_free(t2);
+            tcg_gen_or_tl(t0, t0, t1);
+            tcg_temp_free(t1);
+#if defined(TARGET_MIPS64)
+            tcg_gen_extrl_i64_i32(fp0, t0);
+#else
+            tcg_gen_ext32s_tl(fp0, t0);
+#endif
+            gen_store_fpr32(ctx, fp0, rt);
+            tcg_temp_free_i32(fp0);
+            break;
+        case OPC_GSLWRC1:
+            check_cp1_enabled(ctx);
+            gen_base_offset_addr(ctx, t0, rs, shf_offset);
+            t1 = tcg_temp_new();
+            tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_UB);
+            tcg_gen_andi_tl(t1, t0, 3);
+#ifdef TARGET_WORDS_BIGENDIAN
+            tcg_gen_xori_tl(t1, t1, 3);
+#endif
+            tcg_gen_shli_tl(t1, t1, 3);
+            tcg_gen_andi_tl(t0, t0, ~3);
+            tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEUL);
+            tcg_gen_shr_tl(t0, t0, t1);
+            tcg_gen_xori_tl(t1, t1, 31);
+            t2 = tcg_const_tl(0xfffffffeull);
+            tcg_gen_shl_tl(t2, t2, t1);
+            fp0 = tcg_temp_new_i32();
+            gen_load_fpr32(ctx, fp0, rt);
+            tcg_gen_ext_i32_tl(t1, fp0);
+            tcg_gen_and_tl(t1, t1, t2);
+            tcg_temp_free(t2);
+            tcg_gen_or_tl(t0, t0, t1);
+            tcg_temp_free(t1);
+#if defined(TARGET_MIPS64)
+            tcg_gen_extrl_i64_i32(fp0, t0);
+#else
+            tcg_gen_ext32s_tl(fp0, t0);
+#endif
+            gen_store_fpr32(ctx, fp0, rt);
+            tcg_temp_free_i32(fp0);
+            break;
+#if defined(TARGET_MIPS64)
+        case OPC_GSLDLC1:
+            check_cp1_enabled(ctx);
+            gen_base_offset_addr(ctx, t0, rs, shf_offset);
+            t1 = tcg_temp_new();
+            tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_UB);
+            tcg_gen_andi_tl(t1, t0, 7);
+#ifndef TARGET_WORDS_BIGENDIAN
+            tcg_gen_xori_tl(t1, t1, 7);
+#endif
+            tcg_gen_shli_tl(t1, t1, 3);
+            tcg_gen_andi_tl(t0, t0, ~7);
+            tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEQ);
+            tcg_gen_shl_tl(t0, t0, t1);
+            t2 = tcg_const_tl(-1);
+            tcg_gen_shl_tl(t2, t2, t1);
+            gen_load_fpr64(ctx, t1, rt);
+            tcg_gen_andc_tl(t1, t1, t2);
+            tcg_temp_free(t2);
+            tcg_gen_or_tl(t0, t0, t1);
+            tcg_temp_free(t1);
+            gen_store_fpr64(ctx, t0, rt);
+            break;
+        case OPC_GSLDRC1:
+            check_cp1_enabled(ctx);
+            gen_base_offset_addr(ctx, t0, rs, shf_offset);
+            t1 = tcg_temp_new();
+            tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_UB);
+            tcg_gen_andi_tl(t1, t0, 7);
+#ifdef TARGET_WORDS_BIGENDIAN
+            tcg_gen_xori_tl(t1, t1, 7);
+#endif
+            tcg_gen_shli_tl(t1, t1, 3);
+            tcg_gen_andi_tl(t0, t0, ~7);
+            tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEQ);
+            tcg_gen_shr_tl(t0, t0, t1);
+            tcg_gen_xori_tl(t1, t1, 63);
+            t2 = tcg_const_tl(0xfffffffffffffffeull);
+            tcg_gen_shl_tl(t2, t2, t1);
+            gen_load_fpr64(ctx, t1, rt);
+            tcg_gen_and_tl(t1, t1, t2);
+            tcg_temp_free(t2);
+            tcg_gen_or_tl(t0, t0, t1);
+            tcg_temp_free(t1);
+            gen_store_fpr64(ctx, t0, rt);
+            break;
+#endif
+        default:
+            MIPS_INVAL("loongson_gsshfl");
+            generate_exception_end(ctx, EXCP_RI);
+            break;
+        }
+        break;
+    case OPC_GSSHFS:
+        switch (MASK_LOONGSON_GSSHFLS(ctx->opcode)) {
+        case OPC_GSSWLC1:
+            check_cp1_enabled(ctx);
+            t1 = tcg_temp_new();
+            gen_base_offset_addr(ctx, t0, rs, shf_offset);
+            fp0 = tcg_temp_new_i32();
+            gen_load_fpr32(ctx, fp0, rt);
+            tcg_gen_ext_i32_tl(t1, fp0);
+            gen_helper_0e2i(swl, t1, t0, ctx->mem_idx);
+            tcg_temp_free_i32(fp0);
+            tcg_temp_free(t1);
+            break;
+        case OPC_GSSWRC1:
+            check_cp1_enabled(ctx);
+            t1 = tcg_temp_new();
+            gen_base_offset_addr(ctx, t0, rs, shf_offset);
+            fp0 = tcg_temp_new_i32();
+            gen_load_fpr32(ctx, fp0, rt);
+            tcg_gen_ext_i32_tl(t1, fp0);
+            gen_helper_0e2i(swr, t1, t0, ctx->mem_idx);
+            tcg_temp_free_i32(fp0);
+            tcg_temp_free(t1);
+            break;
+#if defined(TARGET_MIPS64)
+        case OPC_GSSDLC1:
+            check_cp1_enabled(ctx);
+            t1 = tcg_temp_new();
+            gen_base_offset_addr(ctx, t0, rs, shf_offset);
+            gen_load_fpr64(ctx, t1, rt);
+            gen_helper_0e2i(sdl, t1, t0, ctx->mem_idx);
+            tcg_temp_free(t1);
+            break;
+        case OPC_GSSDRC1:
+            check_cp1_enabled(ctx);
+            t1 = tcg_temp_new();
+            gen_base_offset_addr(ctx, t0, rs, shf_offset);
+            gen_load_fpr64(ctx, t1, rt);
+            gen_helper_0e2i(sdr, t1, t0, ctx->mem_idx);
+            tcg_temp_free(t1);
+            break;
+#endif
+        default:
+            MIPS_INVAL("loongson_gsshfs");
+            generate_exception_end(ctx, EXCP_RI);
+            break;
+        }
+        break;
     default:
         MIPS_INVAL("loongson_gslsq");
         generate_exception_end(ctx, EXCP_RI);
-- 
2.7.0


