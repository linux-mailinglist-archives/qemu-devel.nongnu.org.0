Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E6B43D0E2
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 20:38:48 +0200 (CEST)
Received: from localhost ([::1]:50980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfnox-0000Dx-5Z
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 14:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnMg-00067x-2x
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:09:31 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnMc-0004p5-L8
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:09:29 -0400
Received: by mail-wr1-x432.google.com with SMTP id b12so1164871wrh.4
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UVOoDr7N9SJ2WBkzNmDFojqxRXyM23CZiWmnaqd7S/s=;
 b=hKmCYZf3x31+jhHBxDjRmgrlZGtCFLodOq5GUy5hpuY9q0QtcVfZWUEj+7ZhJQQVAq
 mdK3YbR78qJlM8ep4doYhDMPHErZFyXxhxtAF8awUwGczlVArJiNvYR4CPQJeV7yfy04
 TM1EyVqJ03mZEShTSjpda69PfTQKEOtIHlGXStzFNkGpdOYdn/7N1VVVQXL3DeUqnzy6
 I4KlISf5Fce1LtQMyK9q2ypCa+FQnyez5MNgvlnoQAGy4EKXa3jdEa/KznQ2ruWG3FSH
 79LnPKetlTDDzvoMOBIH7erGJ5qYxHMKpFCaPOkga+PF8imlZG3xs8/QkeYVdG6vulFW
 QfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UVOoDr7N9SJ2WBkzNmDFojqxRXyM23CZiWmnaqd7S/s=;
 b=Vg2e8azGKBxbIJ4IgWPnhWWWOJK+9dc6Sl6uqkpcfnFJ8fxaQ7bSsTJ2vdWK6cNALB
 Sd9u1TmSmYKOAWbhEyjWmF4DQNVpG99q/BMKqpN75ZT8T1Tx5Riht93d7BXdSE//9vi5
 XLANYDXyFOIRdMhoJZ14OB4vdVjmLxmEfd+biWwa9ld4/i+mA80gkuMEPQ8Uh6dhQFKK
 9M1Cq8b1ZpMVM8uoySgxD6T+H1bgLWt5kqoyU5C/VPbP+fQqosAMJnnq5h28LSVUFIUe
 2EZLxQy1wQbpVs3QiXQtYZN+ipCIS1LGxCLlrOUhw/+edYB9xfhNW2cgm0Mc8Pea5O3m
 0fXA==
X-Gm-Message-State: AOAM530szo7iTnvhwtpLGGbv2ETR1tCJT4GDVgSpexcYM46Gp5lWwjJ+
 7TalZXqf/PxUDzxW/4ZCgX6bpJkH48E=
X-Google-Smtp-Source: ABdhPJzgMm9UJPnjC31yuUNPyo3UueiNkHMEAhG1+Vd4JbvV4IAOOZ3LzaVth+rPrIL1kv7bRQcg/Q==
X-Received: by 2002:a5d:47c8:: with SMTP id o8mr24083183wrc.374.1635358165102; 
 Wed, 27 Oct 2021 11:09:25 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id z1sm629981wre.21.2021.10.27.11.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:09:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/32] target/mips: Convert MSA ELM instruction format to
 decodetree
Date: Wed, 27 Oct 2021 20:07:22 +0200
Message-Id: <20211027180730.1551932-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027180730.1551932-1-f4bug@amsat.org>
References: <20211027180730.1551932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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

Convert instructions with an immediate element index
and data format df/n to decodetree.

Since the 'data format' and 'n' fields are constant values,
use tcg_constant_i32() instead of a TCG temporaries.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Return 'false' (not decoded) for invalid DF values (Richard)
---
 target/mips/tcg/msa.decode      |  8 +++++
 target/mips/tcg/msa_translate.c | 53 +++++++++++++++++++++++++--------
 2 files changed, 48 insertions(+), 13 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 985af71889e..e701e507bfc 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -20,7 +20,10 @@
 &msa_i8             df  wd ws    sa
 &msa_ldst           df  wd ws    sa
 &msa_bit            df  wd ws       m
+&msa_elm_df         df  wd ws       n
 
+%dfn_df             16:6 !function=msa_elm_df
+%dfn_n              16:6 !function=msa_elm_n
 %dfm_df             16:7 !function=msa_bit_df
 %dfm_m              16:7 !function=msa_bit_m
 
@@ -28,6 +31,7 @@
 @ldst               ...... sa:s10 ws:5 wd:5 .... df:2       &msa_ldst
 @bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
 @bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
+@elm_df             ...... .... ......    ws:5 wd:5 ......  &msa_elm_df df=%dfn_df n=%dfn_n
 @vec                ...... .....     wt:5 ws:5 wd:5 ......  &msa_r df=0
 @2r                 ...... ........  df:2 ws:5 wd:5 ......  &msa_r wt=0
 @2rf                ...... ......... df:1 ws:5 wd:5 ......  &msa_r wt=0
@@ -159,6 +163,10 @@ BNZ                 010001 111 .. ..... ................    @bz
   HSUB_S            011110 110.. ..... ..... .....  010101  @3r
   HSUB_U            011110 111.. ..... ..... .....  010101  @3r
 
+  SLDI              011110 0000 ...... ..... .....  011001  @elm_df
+  SPLATI            011110 0001 ...... ..... .....  011001  @elm_df
+  INSVE             011110 0101 ...... ..... .....  011001  @elm_df
+
   FCAF              011110 0000 . ..... ..... ..... 011010  @3rf
   FCUN              011110 0001 . ..... ..... ..... 011010  @3rf
   FCEQ              011110 0010 . ..... ..... ..... 011010  @3rf
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index d846f72c72b..fabc7f5538b 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -17,6 +17,8 @@
 #include "fpu_helper.h"
 #include "internal.h"
 
+static int msa_elm_n(DisasContext *ctx, int x);
+static int msa_elm_df(DisasContext *ctx, int x);
 static int msa_bit_m(DisasContext *ctx, int x);
 static int msa_bit_df(DisasContext *ctx, int x);
 
@@ -32,15 +34,12 @@ enum {
 
 enum {
     /* ELM instructions df(bits 21..16) = _b, _h, _w, _d */
-    OPC_SLDI_df     = (0x0 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_CTCMSA      = (0x0 << 22) | (0x3E << 16) | OPC_MSA_ELM,
-    OPC_SPLATI_df   = (0x1 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_CFCMSA      = (0x1 << 22) | (0x3E << 16) | OPC_MSA_ELM,
     OPC_COPY_S_df   = (0x2 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_MOVE_V      = (0x2 << 22) | (0x3E << 16) | OPC_MSA_ELM,
     OPC_COPY_U_df   = (0x3 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_INSERT_df   = (0x4 << 22) | (0x00 << 16) | OPC_MSA_ELM,
-    OPC_INSVE_df    = (0x5 << 22) | (0x00 << 16) | OPC_MSA_ELM,
 };
 
 static const char msaregnames[][6] = {
@@ -97,6 +96,24 @@ static int msa_df_extract_df(DisasContext *ctx, int x, const struct dfe *s)
     return -1;
 }
 
+static const struct dfe df_elm[] = {
+    /* Table 3.26 ELM Instruction Format */
+    [DF_BYTE]   = {4, 2, 0b00},
+    [DF_HALF]   = {3, 3, 0b100},
+    [DF_WORD]   = {2, 4, 0b1100},
+    [DF_DOUBLE] = {1, 5, 0b11100}
+};
+
+static int msa_elm_n(DisasContext *ctx, int x)
+{
+    return msa_df_extract_val(ctx, x, df_elm);
+}
+
+static int msa_elm_df(DisasContext *ctx, int x)
+{
+    return msa_df_extract_df(ctx, x, df_elm);
+}
+
 static const struct dfe df_bit[] = {
     /* Table 3.28 BIT Instruction Format */
     [DF_BYTE]   = {3, 4, 0b1110},
@@ -528,6 +545,26 @@ static void gen_msa_elm_3e(DisasContext *ctx)
     tcg_temp_free_i32(tsr);
 }
 
+static bool trans_msa_elm_df(DisasContext *ctx, arg_msa_elm_df *a,
+                             gen_helper_piiii *gen_msa_elm_df)
+{
+    if (a->df < 0) {
+        return false;
+    }
+
+    gen_msa_elm_df(cpu_env,
+                   tcg_constant_i32(a->df),
+                   tcg_constant_i32(a->wd),
+                   tcg_constant_i32(a->ws),
+                   tcg_constant_i32(a->n));
+
+    return true;
+}
+
+TRANS_MSA(SLDI,     trans_msa_elm_df, gen_helper_msa_sldi_df);
+TRANS_MSA(SPLATI,   trans_msa_elm_df, gen_helper_msa_splati_df);
+TRANS_MSA(INSVE,    trans_msa_elm_df, gen_helper_msa_insve_df);
+
 static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
 {
 #define MASK_MSA_ELM(op)    (MASK_MSA_MINOR(op) | (op & (0xf << 22)))
@@ -537,18 +574,8 @@ static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
     TCGv_i32 tws = tcg_const_i32(ws);
     TCGv_i32 twd = tcg_const_i32(wd);
     TCGv_i32 tn  = tcg_const_i32(n);
-    TCGv_i32 tdf = tcg_constant_i32(df);
 
     switch (MASK_MSA_ELM(ctx->opcode)) {
-    case OPC_SLDI_df:
-        gen_helper_msa_sldi_df(cpu_env, tdf, twd, tws, tn);
-        break;
-    case OPC_SPLATI_df:
-        gen_helper_msa_splati_df(cpu_env, tdf, twd, tws, tn);
-        break;
-    case OPC_INSVE_df:
-        gen_helper_msa_insve_df(cpu_env, tdf, twd, tws, tn);
-        break;
     case OPC_COPY_S_df:
     case OPC_COPY_U_df:
     case OPC_INSERT_df:
-- 
2.31.1


