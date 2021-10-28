Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B190F43F1A3
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:26:30 +0200 (CEST)
Received: from localhost ([::1]:45048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgCur-0003fk-Eq
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCfN-0000mA-NT
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:10:31 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCfJ-0006Zg-TT
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:10:27 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d13so12448110wrf.11
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 14:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1xn7Ee1I1S7zoHY+Q3w3OrYbcFCdA3R4ZWgaMjmJFk8=;
 b=iLmf9vVNoPjk6zL6ASWh2s4f7/X5SSSdU/qHhTJiL9C3aGjLEosSK3mOlaRCvnZm/m
 2dqHbATNNoRP8KdHKfFaNSgJM0+vN+mM3mol2e8Xa0HF6qfkPi/D7/Li9qy/ZmKP8W2a
 fC70JyTUj0MZKFNwpTF4vGxlwmRwc8cDt5benqjqgEAJkxF91I+q0uEKvOFbi6/SApS9
 4K9bE3eMS8EBKyZYxrQ31RMagd3aXh+9cFl89voSq6RVw91LqMzhzOoUxoENVk86aRLq
 MRgOVSuKfdQZPUkWsOxLZaKqeO6jTmlK6GYg9QL0IvNC9D7th/W3MlHY5sK1mWg6tEJG
 ys6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1xn7Ee1I1S7zoHY+Q3w3OrYbcFCdA3R4ZWgaMjmJFk8=;
 b=q/tFFoaM2UyZ6DT/B7AiRgeGk/Tcon/gih0Kxq9a2SHWbiW34xAG3BkXX/S/JH6PDu
 VnRW3UNWJ8y42TRSi2GJbE1SjMfo4P5JlDZIiKSmyThb9OU/axMfbq/Ur+y5RbKzQGLX
 yOE1b/kI2Dq+3A+wd0+l4XFs23//LG+9hDpXXIrsk25z0SmsqyN8m8P3CMCWeikLrOj7
 mnEdLCqAmPY4/tzhCu9zhrkAnjJpGbYvnXU+h7H+Oz9alw2svIlc/HaZlcqZGyncFTcV
 UW9Dn9OckVlzWfY0cWLLFf3nOcibDWmR3Nlw26Tssdjp4yaZSRourl+XofPyJ7dKjA1l
 ggLg==
X-Gm-Message-State: AOAM533k7eEO16tBdN6ETB9ZFekFm+3nqRu79xgZoaqvcsTk+xZcP7uc
 q5/EaPZL17m1aB+VSME/aZZivsknrWw=
X-Google-Smtp-Source: ABdhPJz5/K0s8x/vt5iZRQigpZrX0Tz0S+q6YDMWKvfCkVjj16vqP+biMxgNPPnO/Mi7xhxGgpEIhQ==
X-Received: by 2002:a5d:4a12:: with SMTP id m18mr8746938wrq.203.1635455423296; 
 Thu, 28 Oct 2021 14:10:23 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o2sm4130780wrg.1.2021.10.28.14.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:10:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/32] target/mips: Convert MSA 3R instruction format to
 decodetree (part 1/4)
Date: Thu, 28 Oct 2021 23:08:31 +0200
Message-Id: <20211028210843.2120802-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028210843.2120802-1-f4bug@amsat.org>
References: <20211028210843.2120802-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert 3-register operations to decodetree.

Since the 'data format' field is a constant value, use
tcg_constant_i32() instead of a TCG temporary.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3:
- Remove TRANS_MSA(), call check_msa_enabled in trans_X()
---
 target/mips/tcg/msa.decode      |  6 ++++++
 target/mips/tcg/msa_translate.c | 17 +++++------------
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 1d6ada4c142..4b14acce26f 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -32,6 +32,7 @@
 @vec                ...... .....     wt:5 ws:5 wd:5 ......  &msa_r df=0
 @2r                 ...... ........  df:2 ws:5 wd:5 ......  &msa_r wt=0
 @2rf                ...... ......... .    ws:5 wd:5 ......  &msa_r wt=0 df=%2r_df_w
+@3r                 ...... ...  df:2 wt:5 ws:5 wd:5 ......  &msa_r
 @3rf_h              ...... .... .    wt:5 ws:5 wd:5 ......  &msa_r df=%3r_df_h
 @3rf_w              ...... .... .    wt:5 ws:5 wd:5 ......  &msa_r df=%3r_df_w
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_i
@@ -88,6 +89,11 @@ BNZ                 010001 111 .. ..... ................    @bz
   SRARI             011110 010 ....... ..... .....  001010  @bit
   SRLRI             011110 011 ....... ..... .....  001010  @bit
 
+  SLD               011110 000 .. ..... ..... ..... 010100  @3r
+  SPLAT             011110 001 .. ..... ..... ..... 010100  @3r
+
+  VSHF              011110 000 .. ..... ..... ..... 010101  @3r
+
   FCAF              011110 0000 . ..... ..... ..... 011010  @3rf_w
   FCUN              011110 0001 . ..... ..... ..... 011010  @3rf_w
   FCEQ              011110 0010 . ..... ..... ..... 011010  @3rf_w
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index fbaf9f622f3..6738a2b8cd7 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -58,15 +58,12 @@ enum {
     OPC_SUBS_S_df   = (0x0 << 23) | OPC_MSA_3R_11,
     OPC_MULV_df     = (0x0 << 23) | OPC_MSA_3R_12,
     OPC_DOTP_S_df   = (0x0 << 23) | OPC_MSA_3R_13,
-    OPC_SLD_df      = (0x0 << 23) | OPC_MSA_3R_14,
-    OPC_VSHF_df     = (0x0 << 23) | OPC_MSA_3R_15,
     OPC_SRA_df      = (0x1 << 23) | OPC_MSA_3R_0D,
     OPC_SUBV_df     = (0x1 << 23) | OPC_MSA_3R_0E,
     OPC_ADDS_A_df   = (0x1 << 23) | OPC_MSA_3R_10,
     OPC_SUBS_U_df   = (0x1 << 23) | OPC_MSA_3R_11,
     OPC_MADDV_df    = (0x1 << 23) | OPC_MSA_3R_12,
     OPC_DOTP_U_df   = (0x1 << 23) | OPC_MSA_3R_13,
-    OPC_SPLAT_df    = (0x1 << 23) | OPC_MSA_3R_14,
     OPC_SRAR_df     = (0x1 << 23) | OPC_MSA_3R_15,
     OPC_SRL_df      = (0x2 << 23) | OPC_MSA_3R_0D,
     OPC_MAX_S_df    = (0x2 << 23) | OPC_MSA_3R_0E,
@@ -503,6 +500,11 @@ TRANS(BMNZ_V,           trans_msa_3r,   gen_helper_msa_bmnz_v);
 TRANS(BMZ_V,            trans_msa_3r,   gen_helper_msa_bmz_v);
 TRANS(BSEL_V,           trans_msa_3r,   gen_helper_msa_bsel_v);
 
+TRANS(SLD,              trans_msa_3rf,  gen_helper_msa_sld_df);
+TRANS(SPLAT,            trans_msa_3rf,  gen_helper_msa_splat_df);
+
+TRANS(VSHF,             trans_msa_3rf,  gen_helper_msa_vshf_df);
+
 static void gen_msa_3r(DisasContext *ctx)
 {
 #define MASK_MSA_3R(op)    (MASK_MSA_MINOR(op) | (op & (0x7 << 23)))
@@ -1253,12 +1255,6 @@ static void gen_msa_3r(DisasContext *ctx)
             break;
         }
         break;
-    case OPC_SLD_df:
-        gen_helper_msa_sld_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_VSHF_df:
-        gen_helper_msa_vshf_df(cpu_env, tdf, twd, tws, twt);
-        break;
     case OPC_SUBV_df:
         switch (df) {
         case DF_BYTE:
@@ -1291,9 +1287,6 @@ static void gen_msa_3r(DisasContext *ctx)
             break;
         }
         break;
-    case OPC_SPLAT_df:
-        gen_helper_msa_splat_df(cpu_env, tdf, twd, tws, twt);
-        break;
     case OPC_SUBSUS_U_df:
         switch (df) {
         case DF_BYTE:
-- 
2.31.1


