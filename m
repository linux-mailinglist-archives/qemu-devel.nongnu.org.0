Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC8B43D105
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 20:45:44 +0200 (CEST)
Received: from localhost ([::1]:38126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfnvj-0002Fl-Va
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 14:45:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnMn-00069i-Jr
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:09:39 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:39493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnMh-0004pU-Lm
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:09:34 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 y205-20020a1c7dd6000000b0032cc8c2800fso6127004wmc.4
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fUU6kj3/MNVjhNoRDca0LWMfLXwMBccF/5RZxkxk4kk=;
 b=oNkEM9Q2UIZhkCvlLcsy3RyqAekcrReCFBhBuOZ5OkLHLjwCZse78Rlph3292wFrlN
 6AJXB60xrTvSWT65q8aSNgKGMZ6mCb0ZItIsO9ppeSqdfoS/tZk2YhUf5k2Z9CE7CVgg
 yFc8l5dDWIwAod0r0LH0nyFTdGqNCrkrK8LAV+iKy2+0Q0EhvhEy6ky1GLmKhb/8871O
 CKOp4jknRnolUdbJzCN6DMcXvIw4t+aQZqgPehpiMYBntp/qHRSZBftHQ1ET4Rb1LLXH
 qzY5FrUtqTZqxAlcqrSlNikavrZk25WdrnTPT1RIqnau/U2NQGRYJyUM0yOiLNuEmfsY
 Xu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fUU6kj3/MNVjhNoRDca0LWMfLXwMBccF/5RZxkxk4kk=;
 b=25v1jL9WZnHar7u6SH9xUFUz2/aA4qzLkXh3JcTsiIdNQmekm557tl2itX4URDTxuR
 kCtu61+qZfIOs/eetCJsWQ3lpWXGYJ+NEUJxX4YfSjUIXJAPIJ/PbReVRmKXi4KtfuZX
 M6qz/cPQRCbVng5lfK6tVYeucfGqt7oKvEccXakNBpxIuEjdRm1WJIWqsdg4l9PshFBS
 y4ECkyPJpawBSQ9kJRqJXmGwbKgT6TbF8/HzfwLUbAIXM73Eqcm9SgGQe0Y/9eudKR4L
 yeH6IRMygXxMs/BdftG7aDgjnZsctTJVAMvBBgu8O+dywCx/YSr2TMh9CR+NCeULIXlD
 o00Q==
X-Gm-Message-State: AOAM532QzfA7WZPkQc4clyDm+x9fG3Cccj2iC2lz9TDio0pQAsch96p5
 Wb9Qo59Jdp8/o+abM9b4GbK//CKh8iU=
X-Google-Smtp-Source: ABdhPJwwzGNydugCT6ZbTuqasrdst4dRYGcLgjy4ziD0MxzWgRWM3Var6QEEsPrah0Zt5s1HiMf47Q==
X-Received: by 2002:a7b:cb99:: with SMTP id m25mr7337112wmi.87.1635358169707; 
 Wed, 27 Oct 2021 11:09:29 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id v6sm730285wrx.17.2021.10.27.11.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:09:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/32] target/mips: Convert MSA COPY_U opcode to decodetree
Date: Wed, 27 Oct 2021 20:07:23 +0200
Message-Id: <20211027180730.1551932-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027180730.1551932-1-f4bug@amsat.org>
References: <20211027180730.1551932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the COPY_U opcode (Element Copy to GPR Unsigned) to
decodetree.

Since the 'n' field is a constant value, use tcg_constant_i32()
instead of a TCG temporary.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Add NULL_IF_TARGET_MIPS32() macro, use array of 4 functions
---
 target/mips/tcg/msa.decode      |  1 +
 target/mips/tcg/msa_translate.c | 66 ++++++++++++++++++++-------------
 2 files changed, 41 insertions(+), 26 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index e701e507bfc..4e1d3caadc5 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -165,6 +165,7 @@ BNZ                 010001 111 .. ..... ................    @bz
 
   SLDI              011110 0000 ...... ..... .....  011001  @elm_df
   SPLATI            011110 0001 ...... ..... .....  011001  @elm_df
+  COPY_U            011110 0011 ...... ..... .....  011001  @elm_df
   INSVE             011110 0101 ...... ..... .....  011001  @elm_df
 
   FCAF              011110 0000 . ..... ..... ..... 011010  @3rf
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index fabc7f5538b..a2d7bbe912f 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -38,7 +38,6 @@ enum {
     OPC_CFCMSA      = (0x1 << 22) | (0x3E << 16) | OPC_MSA_ELM,
     OPC_COPY_S_df   = (0x2 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_MOVE_V      = (0x2 << 22) | (0x3E << 16) | OPC_MSA_ELM,
-    OPC_COPY_U_df   = (0x3 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_INSERT_df   = (0x4 << 22) | (0x00 << 16) | OPC_MSA_ELM,
 };
 
@@ -565,6 +564,46 @@ TRANS_MSA(SLDI,     trans_msa_elm_df, gen_helper_msa_sldi_df);
 TRANS_MSA(SPLATI,   trans_msa_elm_df, gen_helper_msa_splati_df);
 TRANS_MSA(INSVE,    trans_msa_elm_df, gen_helper_msa_insve_df);
 
+static bool trans_msa_elm_d64(DisasContext *ctx, arg_msa_elm_df *a,
+                              gen_helper_piii * const gen_msa[4])
+{
+    if (a->df < 0 || !gen_msa[a->df]) {
+        return false;
+    }
+
+    if (check_msa_enabled(ctx)) {
+        return true;
+    }
+
+    if (a->wd == 0) {
+        /* Treat as NOP. */
+        return true;
+    }
+
+    gen_msa[a->df](cpu_env,
+                   tcg_constant_i32(a->wd),
+                   tcg_constant_i32(a->ws),
+                   tcg_constant_i32(a->n));
+
+    return true;
+}
+
+#if defined(TARGET_MIPS64)
+#define NULL_IF_TARGET_MIPS32(function) function
+#else
+#define NULL_IF_TARGET_MIPS32(function) NULL
+#endif
+
+static bool trans_COPY_U(DisasContext *ctx, arg_msa_elm_df *a)
+{
+    static gen_helper_piii * const gen_msa_copy_u[4] = {
+        gen_helper_msa_copy_u_b, gen_helper_msa_copy_u_h,
+        NULL_IF_TARGET_MIPS32(gen_helper_msa_copy_u_w), NULL
+    };
+
+    return trans_msa_elm_d64(ctx, a, gen_msa_copy_u);
+}
+
 static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
 {
 #define MASK_MSA_ELM(op)    (MASK_MSA_MINOR(op) | (op & (0xf << 22)))
@@ -577,7 +616,6 @@ static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
 
     switch (MASK_MSA_ELM(ctx->opcode)) {
     case OPC_COPY_S_df:
-    case OPC_COPY_U_df:
     case OPC_INSERT_df:
 #if !defined(TARGET_MIPS64)
         /* Double format valid only for MIPS64 */
@@ -585,11 +623,6 @@ static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
             gen_reserved_instruction(ctx);
             break;
         }
-        if ((MASK_MSA_ELM(ctx->opcode) == OPC_COPY_U_df) &&
-              (df == DF_WORD)) {
-            gen_reserved_instruction(ctx);
-            break;
-        }
 #endif
         switch (MASK_MSA_ELM(ctx->opcode)) {
         case OPC_COPY_S_df:
@@ -608,25 +641,6 @@ static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
                 case DF_DOUBLE:
                     gen_helper_msa_copy_s_d(cpu_env, twd, tws, tn);
                     break;
-#endif
-                default:
-                    assert(0);
-                }
-            }
-            break;
-        case OPC_COPY_U_df:
-            if (likely(wd != 0)) {
-                switch (df) {
-                case DF_BYTE:
-                    gen_helper_msa_copy_u_b(cpu_env, twd, tws, tn);
-                    break;
-                case DF_HALF:
-                    gen_helper_msa_copy_u_h(cpu_env, twd, tws, tn);
-                    break;
-#if defined(TARGET_MIPS64)
-                case DF_WORD:
-                    gen_helper_msa_copy_u_w(cpu_env, twd, tws, tn);
-                    break;
 #endif
                 default:
                     assert(0);
-- 
2.31.1


