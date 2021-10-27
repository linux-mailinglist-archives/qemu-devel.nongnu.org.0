Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9044143D160
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 21:04:15 +0200 (CEST)
Received: from localhost ([::1]:38260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfoDc-0005pk-Q6
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 15:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnMQ-0005tq-UE
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:09:15 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:39494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnMO-0004MU-Hn
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:09:14 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 y205-20020a1c7dd6000000b0032cc8c2800fso6126327wmc.4
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fc+zO8RCb9xmgH0BG6dLLIRmvK6gpfgqqHtoUcTB7ws=;
 b=JSqLq9LC+Fp398sH5CKLEo+nZJZKF7kre+bUDKaieI78UiIUwec6tkw/MkYDj/Lm/R
 LHDc69lQGsCOFbD47xi+xnItwfG1tLVxz3JB/ElOXkV8HiBXKV6+URWXaRIG+H3N740K
 725aGo3t1mf+mgAu6t+m+Um4qCUeLx2WQAt/NveWya2WLyK9DJkJxOEfmPaL0+cUEZJn
 Vc6aM+tHP38syHGf9Wrkaa7gY/M832AgoiKUBTSsxVzzdGM9YCTTZB51J57SxSZdg99A
 4LBxkKQeS+tqauxA42MvlpOtWeTZU4N1L/8CmwGECiuHpKC6k+4dU1f9KeZNC0HZ4Ydp
 HJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fc+zO8RCb9xmgH0BG6dLLIRmvK6gpfgqqHtoUcTB7ws=;
 b=XSZu2/yOHvq32Oior7rpRarrvRkDxv2REmDQvGWm3TbapF6xPKEBk269gbx+vnwbX1
 jh/MOElukwg4Em+mQ845gmiwnrYPSlAW1xTj73YeNIhp2pGetlCVMGbA55KHiyuajX/Y
 TijRWQa0+QwvRFSO9C7GbCPMc5kE0Td8P0OSJiIMPDWcsAjR8/91qugj2ZYcvwhMmO+R
 x4OiI0Yla7Zl6HHoRGL0dVNgLpag3l8S5FuDHI/gCDdGMAr14qk7grvB2sTnZhtvXzGQ
 x+Gx8u73Pb5RkLZAH64xhJQ4CbU5NQ2Q+woOMR6yhLFCKsFRl3Eu9riPq9R7FJgPrDDM
 bpCg==
X-Gm-Message-State: AOAM532Dfaze9Vdj2sLoh0pcOm49GodN/n2jE6BJTDOWBXY57S24x/TP
 71xxW2CDgSFbwIOfLh8xvHa93oRCaSI=
X-Google-Smtp-Source: ABdhPJxDg/gUaRnWKxX/R0aWJ7Oo5rfRJwdVedh3xwJF+f3PL5oAzlT/tpBtyz0wpInlCj9/AWcGIA==
X-Received: by 2002:a05:600c:3584:: with SMTP id
 p4mr7056071wmq.168.1635358150917; 
 Wed, 27 Oct 2021 11:09:10 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l2sm529786wrx.68.2021.10.27.11.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:09:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/32] target/mips: Convert MSA 3R instruction format to
 decodetree (part 2/4)
Date: Wed, 27 Oct 2021 20:07:19 +0200
Message-Id: <20211027180730.1551932-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027180730.1551932-1-f4bug@amsat.org>
References: <20211027180730.1551932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Convert 3-register operations to decodetree.

Per the Encoding of Operation Field for 3R Instruction Format'
(Table 3.25), these instructions are not defined for the BYTE
format. Therefore the TRANS_DF_iii_b() macro returns 'false'
in that case, because no such instruction is decoded.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: TRANS_DF_iii_b() uses array[4]
---
 target/mips/tcg/msa.decode      |  11 ++
 target/mips/tcg/msa_translate.c | 195 ++++++--------------------------
 2 files changed, 48 insertions(+), 158 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 7201b821ae0..f6471b92fc7 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -87,10 +87,21 @@ BNZ                 010001 111 .. ..... ................    @bz
   SRARI             011110 010 ....... ..... .....  001010  @bit
   SRLRI             011110 011 ....... ..... .....  001010  @bit
 
+  DOTP_S            011110 000.. ..... ..... .....  010011  @3r
+  DOTP_U            011110 001.. ..... ..... .....  010011  @3r
+  DPADD_S           011110 010.. ..... ..... .....  010011  @3r
+  DPADD_U           011110 011.. ..... ..... .....  010011  @3r
+  DPSUB_S           011110 100.. ..... ..... .....  010011  @3r
+  DPSUB_U           011110 101.. ..... ..... .....  010011  @3r
+
   SLD               011110 000 .. ..... ..... ..... 010100  @3r
   SPLAT             011110 001 .. ..... ..... ..... 010100  @3r
 
   VSHF              011110 000 .. ..... ..... ..... 010101  @3r
+  HADD_S            011110 100.. ..... ..... .....  010101  @3r
+  HADD_U            011110 101.. ..... ..... .....  010101  @3r
+  HSUB_S            011110 110.. ..... ..... .....  010101  @3r
+  HSUB_U            011110 111.. ..... ..... .....  010101  @3r
 
   FCAF              011110 0000 . ..... ..... ..... 011010  @3rf
   FCUN              011110 0001 . ..... ..... ..... 011010  @3rf
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index c7ca629d684..5cc704c9ace 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -47,13 +47,11 @@ enum {
     OPC_ADD_A_df    = (0x0 << 23) | OPC_MSA_3R_10,
     OPC_SUBS_S_df   = (0x0 << 23) | OPC_MSA_3R_11,
     OPC_MULV_df     = (0x0 << 23) | OPC_MSA_3R_12,
-    OPC_DOTP_S_df   = (0x0 << 23) | OPC_MSA_3R_13,
     OPC_SRA_df      = (0x1 << 23) | OPC_MSA_3R_0D,
     OPC_SUBV_df     = (0x1 << 23) | OPC_MSA_3R_0E,
     OPC_ADDS_A_df   = (0x1 << 23) | OPC_MSA_3R_10,
     OPC_SUBS_U_df   = (0x1 << 23) | OPC_MSA_3R_11,
     OPC_MADDV_df    = (0x1 << 23) | OPC_MSA_3R_12,
-    OPC_DOTP_U_df   = (0x1 << 23) | OPC_MSA_3R_13,
     OPC_SRAR_df     = (0x1 << 23) | OPC_MSA_3R_15,
     OPC_SRL_df      = (0x2 << 23) | OPC_MSA_3R_0D,
     OPC_MAX_S_df    = (0x2 << 23) | OPC_MSA_3R_0E,
@@ -61,7 +59,6 @@ enum {
     OPC_ADDS_S_df   = (0x2 << 23) | OPC_MSA_3R_10,
     OPC_SUBSUS_U_df = (0x2 << 23) | OPC_MSA_3R_11,
     OPC_MSUBV_df    = (0x2 << 23) | OPC_MSA_3R_12,
-    OPC_DPADD_S_df  = (0x2 << 23) | OPC_MSA_3R_13,
     OPC_PCKEV_df    = (0x2 << 23) | OPC_MSA_3R_14,
     OPC_SRLR_df     = (0x2 << 23) | OPC_MSA_3R_15,
     OPC_BCLR_df     = (0x3 << 23) | OPC_MSA_3R_0D,
@@ -69,7 +66,6 @@ enum {
     OPC_CLT_U_df    = (0x3 << 23) | OPC_MSA_3R_0F,
     OPC_ADDS_U_df   = (0x3 << 23) | OPC_MSA_3R_10,
     OPC_SUBSUU_S_df = (0x3 << 23) | OPC_MSA_3R_11,
-    OPC_DPADD_U_df  = (0x3 << 23) | OPC_MSA_3R_13,
     OPC_PCKOD_df    = (0x3 << 23) | OPC_MSA_3R_14,
     OPC_BSET_df     = (0x4 << 23) | OPC_MSA_3R_0D,
     OPC_MIN_S_df    = (0x4 << 23) | OPC_MSA_3R_0E,
@@ -77,30 +73,24 @@ enum {
     OPC_AVE_S_df    = (0x4 << 23) | OPC_MSA_3R_10,
     OPC_ASUB_S_df   = (0x4 << 23) | OPC_MSA_3R_11,
     OPC_DIV_S_df    = (0x4 << 23) | OPC_MSA_3R_12,
-    OPC_DPSUB_S_df  = (0x4 << 23) | OPC_MSA_3R_13,
     OPC_ILVL_df     = (0x4 << 23) | OPC_MSA_3R_14,
-    OPC_HADD_S_df   = (0x4 << 23) | OPC_MSA_3R_15,
     OPC_BNEG_df     = (0x5 << 23) | OPC_MSA_3R_0D,
     OPC_MIN_U_df    = (0x5 << 23) | OPC_MSA_3R_0E,
     OPC_CLE_U_df    = (0x5 << 23) | OPC_MSA_3R_0F,
     OPC_AVE_U_df    = (0x5 << 23) | OPC_MSA_3R_10,
     OPC_ASUB_U_df   = (0x5 << 23) | OPC_MSA_3R_11,
     OPC_DIV_U_df    = (0x5 << 23) | OPC_MSA_3R_12,
-    OPC_DPSUB_U_df  = (0x5 << 23) | OPC_MSA_3R_13,
     OPC_ILVR_df     = (0x5 << 23) | OPC_MSA_3R_14,
-    OPC_HADD_U_df   = (0x5 << 23) | OPC_MSA_3R_15,
     OPC_BINSL_df    = (0x6 << 23) | OPC_MSA_3R_0D,
     OPC_MAX_A_df    = (0x6 << 23) | OPC_MSA_3R_0E,
     OPC_AVER_S_df   = (0x6 << 23) | OPC_MSA_3R_10,
     OPC_MOD_S_df    = (0x6 << 23) | OPC_MSA_3R_12,
     OPC_ILVEV_df    = (0x6 << 23) | OPC_MSA_3R_14,
-    OPC_HSUB_S_df   = (0x6 << 23) | OPC_MSA_3R_15,
     OPC_BINSR_df    = (0x7 << 23) | OPC_MSA_3R_0D,
     OPC_MIN_A_df    = (0x7 << 23) | OPC_MSA_3R_0E,
     OPC_AVER_U_df   = (0x7 << 23) | OPC_MSA_3R_10,
     OPC_MOD_U_df    = (0x7 << 23) | OPC_MSA_3R_12,
     OPC_ILVOD_df    = (0x7 << 23) | OPC_MSA_3R_14,
-    OPC_HSUB_U_df   = (0x7 << 23) | OPC_MSA_3R_15,
 
     /* ELM instructions df(bits 21..16) = _b, _h, _w, _d */
     OPC_SLDI_df     = (0x0 << 22) | (0x00 << 16) | OPC_MSA_ELM,
@@ -257,6 +247,21 @@ typedef void gen_helper_piiii(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32, TCGv_i32);
 #define TRANS_DF_ii(NAME, trans_func, gen_func) \
     TRANS_DF_x(ii, NAME, trans_func, gen_func)
 
+#define TRANS_DF_iii_b(NAME, trans_func, gen_func) \
+    static gen_helper_piii * const NAME##_tab[4] = { \
+        gen_func##_h, gen_func##_w, gen_func##_d \
+    }; \
+    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
+    { \
+        if (a->df == DF_BYTE) { \
+            return false; \
+        } \
+        if (!check_msa_enabled(ctx)) { \
+            return true; \
+        } \
+        return trans_func(ctx, a, NAME##_tab[a->df - DF_HALF]); \
+    }
+
 static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt,
                                    TCGCond cond)
 {
@@ -466,10 +471,32 @@ static bool trans_msa_3r_df(DisasContext *ctx, arg_msa_r *a,
     return true;
 }
 
+static bool trans_msa_3r(DisasContext *ctx, arg_msa_r *a,
+                         gen_helper_piii *gen_msa_3r)
+{
+    gen_msa_3r(cpu_env,
+               tcg_constant_i32(a->wd),
+               tcg_constant_i32(a->ws),
+               tcg_constant_i32(a->wt));
+
+    return true;
+}
+
+TRANS_DF_iii_b(DOTP_S,  trans_msa_3r,    gen_helper_msa_dotp_s);
+TRANS_DF_iii_b(DOTP_U,  trans_msa_3r,    gen_helper_msa_dotp_u);
+TRANS_DF_iii_b(DPADD_S, trans_msa_3r,    gen_helper_msa_dpadd_s);
+TRANS_DF_iii_b(DPADD_U, trans_msa_3r,    gen_helper_msa_dpadd_u);
+TRANS_DF_iii_b(DPSUB_S, trans_msa_3r,    gen_helper_msa_dpsub_s);
+TRANS_DF_iii_b(DPSUB_U, trans_msa_3r,    gen_helper_msa_dpsub_u);
+
 TRANS_MSA(SLD,          trans_msa_3r_df, gen_helper_msa_sld_df);
 TRANS_MSA(SPLAT,        trans_msa_3r_df, gen_helper_msa_splat_df);
 
 TRANS_MSA(VSHF,         trans_msa_3r_df, gen_helper_msa_vshf_df);
+TRANS_DF_iii_b(HADD_S,  trans_msa_3r,    gen_helper_msa_hadd_s);
+TRANS_DF_iii_b(HADD_U,  trans_msa_3r,    gen_helper_msa_hadd_u);
+TRANS_DF_iii_b(HSUB_S,  trans_msa_3r,    gen_helper_msa_hsub_s);
+TRANS_DF_iii_b(HSUB_U,  trans_msa_3r,    gen_helper_msa_hsub_u);
 
 static void gen_msa_3r(DisasContext *ctx)
 {
@@ -1285,154 +1312,6 @@ static void gen_msa_3r(DisasContext *ctx)
             break;
         }
         break;
-
-    case OPC_DOTP_S_df:
-    case OPC_DOTP_U_df:
-    case OPC_DPADD_S_df:
-    case OPC_DPADD_U_df:
-    case OPC_DPSUB_S_df:
-    case OPC_HADD_S_df:
-    case OPC_DPSUB_U_df:
-    case OPC_HADD_U_df:
-    case OPC_HSUB_S_df:
-    case OPC_HSUB_U_df:
-        if (df == DF_BYTE) {
-            gen_reserved_instruction(ctx);
-            break;
-        }
-        switch (MASK_MSA_3R(ctx->opcode)) {
-        case OPC_HADD_S_df:
-            switch (df) {
-            case DF_HALF:
-                gen_helper_msa_hadd_s_h(cpu_env, twd, tws, twt);
-                break;
-            case DF_WORD:
-                gen_helper_msa_hadd_s_w(cpu_env, twd, tws, twt);
-                break;
-            case DF_DOUBLE:
-                gen_helper_msa_hadd_s_d(cpu_env, twd, tws, twt);
-                break;
-            }
-            break;
-        case OPC_HADD_U_df:
-            switch (df) {
-            case DF_HALF:
-                gen_helper_msa_hadd_u_h(cpu_env, twd, tws, twt);
-                break;
-            case DF_WORD:
-                gen_helper_msa_hadd_u_w(cpu_env, twd, tws, twt);
-                break;
-            case DF_DOUBLE:
-                gen_helper_msa_hadd_u_d(cpu_env, twd, tws, twt);
-                break;
-            }
-            break;
-        case OPC_HSUB_S_df:
-            switch (df) {
-            case DF_HALF:
-                gen_helper_msa_hsub_s_h(cpu_env, twd, tws, twt);
-                break;
-            case DF_WORD:
-                gen_helper_msa_hsub_s_w(cpu_env, twd, tws, twt);
-                break;
-            case DF_DOUBLE:
-                gen_helper_msa_hsub_s_d(cpu_env, twd, tws, twt);
-                break;
-            }
-            break;
-        case OPC_HSUB_U_df:
-            switch (df) {
-            case DF_HALF:
-                gen_helper_msa_hsub_u_h(cpu_env, twd, tws, twt);
-                break;
-            case DF_WORD:
-                gen_helper_msa_hsub_u_w(cpu_env, twd, tws, twt);
-                break;
-            case DF_DOUBLE:
-                gen_helper_msa_hsub_u_d(cpu_env, twd, tws, twt);
-                break;
-            }
-            break;
-        case OPC_DOTP_S_df:
-            switch (df) {
-            case DF_HALF:
-                gen_helper_msa_dotp_s_h(cpu_env, twd, tws, twt);
-                break;
-            case DF_WORD:
-                gen_helper_msa_dotp_s_w(cpu_env, twd, tws, twt);
-                break;
-            case DF_DOUBLE:
-                gen_helper_msa_dotp_s_d(cpu_env, twd, tws, twt);
-                break;
-            }
-            break;
-        case OPC_DOTP_U_df:
-            switch (df) {
-            case DF_HALF:
-                gen_helper_msa_dotp_u_h(cpu_env, twd, tws, twt);
-                break;
-            case DF_WORD:
-                gen_helper_msa_dotp_u_w(cpu_env, twd, tws, twt);
-                break;
-            case DF_DOUBLE:
-                gen_helper_msa_dotp_u_d(cpu_env, twd, tws, twt);
-                break;
-            }
-            break;
-        case OPC_DPADD_S_df:
-            switch (df) {
-            case DF_HALF:
-                gen_helper_msa_dpadd_s_h(cpu_env, twd, tws, twt);
-                break;
-            case DF_WORD:
-                gen_helper_msa_dpadd_s_w(cpu_env, twd, tws, twt);
-                break;
-            case DF_DOUBLE:
-                gen_helper_msa_dpadd_s_d(cpu_env, twd, tws, twt);
-                break;
-            }
-            break;
-        case OPC_DPADD_U_df:
-            switch (df) {
-            case DF_HALF:
-                gen_helper_msa_dpadd_u_h(cpu_env, twd, tws, twt);
-                break;
-            case DF_WORD:
-                gen_helper_msa_dpadd_u_w(cpu_env, twd, tws, twt);
-                break;
-            case DF_DOUBLE:
-                gen_helper_msa_dpadd_u_d(cpu_env, twd, tws, twt);
-                break;
-            }
-            break;
-        case OPC_DPSUB_S_df:
-            switch (df) {
-            case DF_HALF:
-                gen_helper_msa_dpsub_s_h(cpu_env, twd, tws, twt);
-                break;
-            case DF_WORD:
-                gen_helper_msa_dpsub_s_w(cpu_env, twd, tws, twt);
-                break;
-            case DF_DOUBLE:
-                gen_helper_msa_dpsub_s_d(cpu_env, twd, tws, twt);
-                break;
-            }
-            break;
-        case OPC_DPSUB_U_df:
-            switch (df) {
-            case DF_HALF:
-                gen_helper_msa_dpsub_u_h(cpu_env, twd, tws, twt);
-                break;
-            case DF_WORD:
-                gen_helper_msa_dpsub_u_w(cpu_env, twd, tws, twt);
-                break;
-            case DF_DOUBLE:
-                gen_helper_msa_dpsub_u_d(cpu_env, twd, tws, twt);
-                break;
-            }
-            break;
-        }
-        break;
     default:
         MIPS_INVAL("MSA instruction");
         gen_reserved_instruction(ctx);
-- 
2.31.1


