Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7837143D0F1
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 20:42:09 +0200 (CEST)
Received: from localhost ([::1]:58554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfnsG-0005OR-Im
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 14:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnN1-0006He-Up
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:09:56 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:35575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnN0-0004sT-9s
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:09:51 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 131-20020a1c0489000000b0032cca9883b5so5729726wme.0
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Aw01qurvZgVJm3hzFcpb7GCT541369XMRKPF+7337Yg=;
 b=Mxkm09txG8ll7mFi9bmRcKWa3cvAFQkq/S3mB5WdmIMnRRDNvPbWEU1TEzLXpqkJqa
 zA48dp9vpZMgv5720n/JQ/jMyU1p1vzPcGtzjRLBw7avnTNl3VUWePuWDRQJoTO/msbK
 XIEs+lXAtyVXeiETPEbyqfuQIOqp2aKvjo/QqLmTWSAWM+YIRY3EwIKPpsGGlopFJ30g
 Y5rqAcvKqeCmX5sLEMwADBNlbOk2TvE5Y89m9diIwtXIEO6VqiIspqLp2QRBF8rOxOZ4
 A3xNeXsHKI+4Zo0gziANkVrM65xZWSV1hdq88ET0mJdBJx7OBedMgLxLwo8UhXkPyxgw
 h6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Aw01qurvZgVJm3hzFcpb7GCT541369XMRKPF+7337Yg=;
 b=X4hbRx0QSEByb9Q4tZ9TpxriNJHgp7Fv4uvvTyo/lGW4FPxuwrRtck/7dWA7/yG/AU
 yANUoRrybqhXZfbJEIV7tkarPEmr36ymdgS2/FwZKFNQuQ0O4i6QhvkZSGTfzFkoPCzK
 1yb9sOTkJ5OsATS+FEXSN7/jbhY08WvOr0phiRL9fC4SkN5eFiZ3Ol8AeTn1Tt0qSjJa
 ytHDrWI21hBmKal5EtGL5zcEK2opj13y/SB9fl2orhgk5xY8DeBBEG1CAOlc4Grl6L2/
 Np8Nq74YyTcLY9yZ41GWL9xekZtffKhY8fLXG8+m0dMrcsmP6XTs/pCJfKS2Kf1QlALW
 FKPQ==
X-Gm-Message-State: AOAM531oJBcvybae2wyfXznWEpDukM6ebIUMjrkDP5muLoFb695qhivb
 MqYxvsTfkoR7nr5t8r4woPb7Wi0ydCs=
X-Google-Smtp-Source: ABdhPJyqyL11aqZ+2V3J3jsjv4Fo2ADMTbSU9fx6yhyBGR+dSfAQn2s97pKoJqx9EIwPA3blQjiEDw==
X-Received: by 2002:a05:600c:2205:: with SMTP id
 z5mr7546142wml.133.1635358188325; 
 Wed, 27 Oct 2021 11:09:48 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id e17sm702280wrx.18.2021.10.27.11.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:09:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 29/32] target/mips: Convert CTCMSA opcode to decodetree
Date: Wed, 27 Oct 2021 20:07:27 +0200
Message-Id: <20211027180730.1551932-30-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027180730.1551932-1-f4bug@amsat.org>
References: <20211027180730.1551932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the CTCMSA (Copy To Control MSA register) opcode
to decodetree. Since it overlaps with the SLDI opcode,
use a decodetree overlap group.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  5 ++-
 target/mips/tcg/msa_translate.c | 69 ++++++---------------------------
 2 files changed, 16 insertions(+), 58 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 12358e7a6ba..f3ec195bac0 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -165,7 +165,10 @@ BNZ                 010001 111 .. ..... ................    @bz
   HSUB_S            011110 110.. ..... ..... .....  010101  @3r
   HSUB_U            011110 111.. ..... ..... .....  010101  @3r
 
-  SLDI              011110 0000 ...... ..... .....  011001  @elm_df
+  {
+    CTCMSA          011110 0000111110  ..... .....  011001  @elm
+    SLDI            011110 0000 ...... ..... .....  011001  @elm_df
+  }
   {
     CFCMSA          011110 0001111110  ..... .....  011001  @elm
     SPLATI          011110 0001 ...... ..... .....  011001  @elm_df
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 56db02f73e7..4a2a02bd6d2 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -25,18 +25,6 @@ static int msa_bit_df(DisasContext *ctx, int x);
 /* Include the auto-generated decoder.  */
 #include "decode-msa.c.inc"
 
-#define OPC_MSA (0x1E << 26)
-
-#define MASK_MSA_MINOR(op)          (MASK_OP_MAJOR(op) | (op & 0x3F))
-enum {
-    OPC_MSA_ELM     = 0x19 | OPC_MSA,
-};
-
-enum {
-    /* ELM instructions df(bits 21..16) = _b, _h, _w, _d */
-    OPC_CTCMSA      = (0x0 << 22) | (0x3E << 16) | OPC_MSA_ELM,
-};
-
 static const char msaregnames[][6] = {
     "w0.d0",  "w0.d1",  "w1.d0",  "w1.d1",
     "w2.d0",  "w2.d1",  "w3.d0",  "w3.d1",
@@ -521,27 +509,22 @@ static bool trans_MOVE_V(DisasContext *ctx, arg_msa_elm *a)
     return true;
 }
 
-static void gen_msa_elm_3e(DisasContext *ctx)
+static bool trans_CTCMSA(DisasContext *ctx, arg_msa_elm *a)
 {
-#define MASK_MSA_ELM_DF3E(op)   (MASK_MSA_MINOR(op) | (op & (0x3FF << 16)))
-    uint8_t source = (ctx->opcode >> 11) & 0x1f;
-    uint8_t dest = (ctx->opcode >> 6) & 0x1f;
-    TCGv telm = tcg_temp_new();
-    TCGv_i32 tdt = tcg_const_i32(dest);
+    TCGv telm;
 
-    switch (MASK_MSA_ELM_DF3E(ctx->opcode)) {
-    case OPC_CTCMSA:
-        gen_load_gpr(telm, source);
-        gen_helper_msa_ctcmsa(cpu_env, telm, tdt);
-        break;
-    default:
-        MIPS_INVAL("MSA instruction");
-        gen_reserved_instruction(ctx);
-        break;
+    if (!check_msa_enabled(ctx)) {
+        return true;
     }
 
+    telm = tcg_temp_new();
+
+    gen_load_gpr(telm, a->ws);
+    gen_helper_msa_ctcmsa(cpu_env, telm, tcg_constant_i32(a->wd));
+
     tcg_temp_free(telm);
-    tcg_temp_free_i32(tdt);
+
+    return true;
 }
 
 static bool trans_CFCMSA(DisasContext *ctx, arg_msa_elm *a)
@@ -642,20 +625,6 @@ static bool trans_INSERT(DisasContext *ctx, arg_msa_elm_df *a)
     return trans_msa_elm_d64(ctx, a, gen_msa_insert);
 }
 
-static void gen_msa_elm(DisasContext *ctx)
-{
-    uint8_t dfn = (ctx->opcode >> 16) & 0x3f;
-
-    if (dfn == 0x3E) {
-        /* CTCMSA */
-        gen_msa_elm_3e(ctx);
-        return;
-    } else {
-        gen_reserved_instruction(ctx);
-        return;
-    }
-}
-
 static bool trans_msa_3rf(DisasContext *ctx, arg_msa_r *a,
                           enum CPUMIPSMSADataFormat df_base,
                           gen_helper_piiii *gen_msa_3rf)
@@ -798,21 +767,7 @@ TRANS_MSA(BSEL_V,   trans_msa_vec, gen_helper_msa_bsel_v);
 
 static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
 {
-    uint32_t opcode = ctx->opcode;
-
-    if (!check_msa_enabled(ctx)) {
-        return true;
-    }
-
-    switch (MASK_MSA_MINOR(opcode)) {
-    case OPC_MSA_ELM:
-        gen_msa_elm(ctx);
-        break;
-    default:
-        MIPS_INVAL("MSA instruction");
-        gen_reserved_instruction(ctx);
-        break;
-    }
+    gen_reserved_instruction(ctx);
 
     return true;
 }
-- 
2.31.1


