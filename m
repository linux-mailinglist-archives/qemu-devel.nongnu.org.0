Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 223CE43D0C9
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 20:32:53 +0200 (CEST)
Received: from localhost ([::1]:42428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfnjI-0002qO-8G
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 14:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnMH-0005fg-GE
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:09:05 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnMF-00046p-8U
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:09:05 -0400
Received: by mail-wr1-x42f.google.com with SMTP id v17so5575058wrv.9
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/dzZUtJFR+Qmjf96GGPtCiWNLa6V+UWN3RtjmplVBF0=;
 b=MzKcXrs0qKZ4zfgyw/b2ufcBqWm/ncLqe7shG1dHs1fUF8E5LHXnNkXeGmFmx8uCLU
 Zthn2ALBh+CzRrNr1YQ9AYUB0bORTQeaRwLbR1ZWrNqg1j61pKKIgUVdmu1HXfVNVY04
 Sha4R5BZIQp0PegYA7xWfb1oUuXD2nrqxiiyld5K4FNFt9wr8mAtP/8tjp17ICf8J0f+
 8xyDut3PTm7hkCHIRaBPur8LQweB9WhvFJ9kKB6zuXOqYi+Cg9uOEEpaGjdO/Uw0JYS1
 NJMiyJ37NDXbuuryfXNN8PCKLylHNaFwJWRzQCJh4v0EXl/04ydZMSDGw39HSaM9cI89
 j0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/dzZUtJFR+Qmjf96GGPtCiWNLa6V+UWN3RtjmplVBF0=;
 b=WhFbYek8snrvtEnM/x2xGpB2/PWo9yJNWLMbFeDGarrvVWJJvRk0N+pOSYJnLF18X5
 gNZi83fFPJrVG2rW0OIT35OM6/+j45G5QYK1Tuf8WEOqRCzzKbXaS3i2LhJOtB/l8ife
 EP4v8YDB+AscwmKCQ/qst8fUUo34UmDZC7+p0plLx+q3DVKm77I8aP1h8nrGMaybbF3h
 YQg9awdvAcwyMJjCNBy0uVdY3p/IMETKp3A/ucNMe3QUanz/nDsv8bfA5ErM1X5qCuwZ
 JqvG1KGu68DX9k9CmHmEbGnPU9Pz9/JlU4Vb6EMS7AvYpdeOCPwbd9BFE96Nb2vqRia1
 B4vQ==
X-Gm-Message-State: AOAM532uKvZul67qLBSbKoz/Oiu6KsMojPEavF18iZoBOVkX/AdcjDj+
 w6X94NBAU7GpYO6WOQ03C7vq4/HpBs8=
X-Google-Smtp-Source: ABdhPJw9bh4YWzsy94zBQoPaJCPTp6814dZ9T8elhF4ORJJ+iUH0LyHEkgrBgw/sbTrpU1QK/9FTkA==
X-Received: by 2002:a05:6000:1b8f:: with SMTP id
 r15mr42486036wru.27.1635358141753; 
 Wed, 27 Oct 2021 11:09:01 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id e17sm700188wrx.18.2021.10.27.11.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:09:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/32] target/mips: Convert MSA 3RF instruction format to
 decodetree (DF_WORD)
Date: Wed, 27 Oct 2021 20:07:17 +0200
Message-Id: <20211027180730.1551932-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027180730.1551932-1-f4bug@amsat.org>
References: <20211027180730.1551932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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

Convert 3-register floating-point or fixed-point operations
to decodetree.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  37 ++++++
 target/mips/tcg/msa_translate.c | 213 ++++++--------------------------
 2 files changed, 74 insertions(+), 176 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index ace07f2f298..f88ae234cca 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -86,9 +86,46 @@ BNZ                 010001 111 .. ..... ................    @bz
   SRARI             011110 010 ....... ..... .....  001010  @bit
   SRLRI             011110 011 ....... ..... .....  001010  @bit
 
+  FCAF              011110 0000 . ..... ..... ..... 011010  @3rf
+  FCUN              011110 0001 . ..... ..... ..... 011010  @3rf
+  FCEQ              011110 0010 . ..... ..... ..... 011010  @3rf
+  FCUEQ             011110 0011 . ..... ..... ..... 011010  @3rf
+  FCLT              011110 0100 . ..... ..... ..... 011010  @3rf
+  FCULT             011110 0101 . ..... ..... ..... 011010  @3rf
+  FCLE              011110 0110 . ..... ..... ..... 011010  @3rf
+  FCULE             011110 0111 . ..... ..... ..... 011010  @3rf
+  FSAF              011110 1000 . ..... ..... ..... 011010  @3rf
+  FSUN              011110 1001 . ..... ..... ..... 011010  @3rf
+  FSEQ              011110 1010 . ..... ..... ..... 011010  @3rf
+  FSUEQ             011110 1011 . ..... ..... ..... 011010  @3rf
+  FSLT              011110 1100 . ..... ..... ..... 011010  @3rf
+  FSULT             011110 1101 . ..... ..... ..... 011010  @3rf
+  FSLE              011110 1110 . ..... ..... ..... 011010  @3rf
+  FSULE             011110 1111 . ..... ..... ..... 011010  @3rf
+
+  FADD              011110 0000 . ..... ..... ..... 011011  @3rf
+  FSUB              011110 0001 . ..... ..... ..... 011011  @3rf
+  FMUL              011110 0010 . ..... ..... ..... 011011  @3rf
+  FDIV              011110 0011 . ..... ..... ..... 011011  @3rf
+  FMADD             011110 0100 . ..... ..... ..... 011011  @3rf
+  FMSUB             011110 0101 . ..... ..... ..... 011011  @3rf
+  FEXP2             011110 0111 . ..... ..... ..... 011011  @3rf
+  FEXDO             011110 1000 . ..... ..... ..... 011011  @3rf
+  FTQ               011110 1010 . ..... ..... ..... 011011  @3rf
+  FMIN              011110 1100 . ..... ..... ..... 011011  @3rf
+  FMIN_A            011110 1101 . ..... ..... ..... 011011  @3rf
+  FMAX              011110 1110 . ..... ..... ..... 011011  @3rf
+  FMAX_A            011110 1111 . ..... ..... ..... 011011  @3rf
+
+  FCOR              011110 0001 . ..... ..... ..... 011100  @3rf
+  FCUNE             011110 0010 . ..... ..... ..... 011100  @3rf
+  FCNE              011110 0011 . ..... ..... ..... 011100  @3rf
   MUL_Q             011110 0100 . ..... ..... ..... 011100  @3rf
   MADD_Q            011110 0101 . ..... ..... ..... 011100  @3rf
   MSUB_Q            011110 0110 . ..... ..... ..... 011100  @3rf
+  FSOR              011110 1001 . ..... ..... ..... 011100  @3rf
+  FSUNE             011110 1010 . ..... ..... ..... 011100  @3rf
+  FSNE              011110 1011 . ..... ..... ..... 011100  @3rf
   MULR_Q            011110 1100 . ..... ..... ..... 011100  @3rf
   MADDR_Q           011110 1101 . ..... ..... ..... 011100  @3rf
   MSUBR_Q           011110 1110 . ..... ..... ..... 011100  @3rf
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 4e0ad24543e..f635b49c13c 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -37,9 +37,6 @@ enum {
     OPC_MSA_3R_14   = 0x14 | OPC_MSA,
     OPC_MSA_3R_15   = 0x15 | OPC_MSA,
     OPC_MSA_ELM     = 0x19 | OPC_MSA,
-    OPC_MSA_3RF_1A  = 0x1A | OPC_MSA,
-    OPC_MSA_3RF_1B  = 0x1B | OPC_MSA,
-    OPC_MSA_3RF_1C  = 0x1C | OPC_MSA,
 };
 
 enum {
@@ -118,43 +115,6 @@ enum {
     OPC_COPY_U_df   = (0x3 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_INSERT_df   = (0x4 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_INSVE_df    = (0x5 << 22) | (0x00 << 16) | OPC_MSA_ELM,
-
-    /* 3RF instruction _df(bit 21) = _w, _d */
-    OPC_FCAF_df     = (0x0 << 22) | OPC_MSA_3RF_1A,
-    OPC_FADD_df     = (0x0 << 22) | OPC_MSA_3RF_1B,
-    OPC_FCUN_df     = (0x1 << 22) | OPC_MSA_3RF_1A,
-    OPC_FSUB_df     = (0x1 << 22) | OPC_MSA_3RF_1B,
-    OPC_FCOR_df     = (0x1 << 22) | OPC_MSA_3RF_1C,
-    OPC_FCEQ_df     = (0x2 << 22) | OPC_MSA_3RF_1A,
-    OPC_FMUL_df     = (0x2 << 22) | OPC_MSA_3RF_1B,
-    OPC_FCUNE_df    = (0x2 << 22) | OPC_MSA_3RF_1C,
-    OPC_FCUEQ_df    = (0x3 << 22) | OPC_MSA_3RF_1A,
-    OPC_FDIV_df     = (0x3 << 22) | OPC_MSA_3RF_1B,
-    OPC_FCNE_df     = (0x3 << 22) | OPC_MSA_3RF_1C,
-    OPC_FCLT_df     = (0x4 << 22) | OPC_MSA_3RF_1A,
-    OPC_FMADD_df    = (0x4 << 22) | OPC_MSA_3RF_1B,
-    OPC_FCULT_df    = (0x5 << 22) | OPC_MSA_3RF_1A,
-    OPC_FMSUB_df    = (0x5 << 22) | OPC_MSA_3RF_1B,
-    OPC_FCLE_df     = (0x6 << 22) | OPC_MSA_3RF_1A,
-    OPC_FCULE_df    = (0x7 << 22) | OPC_MSA_3RF_1A,
-    OPC_FEXP2_df    = (0x7 << 22) | OPC_MSA_3RF_1B,
-    OPC_FSAF_df     = (0x8 << 22) | OPC_MSA_3RF_1A,
-    OPC_FEXDO_df    = (0x8 << 22) | OPC_MSA_3RF_1B,
-    OPC_FSUN_df     = (0x9 << 22) | OPC_MSA_3RF_1A,
-    OPC_FSOR_df     = (0x9 << 22) | OPC_MSA_3RF_1C,
-    OPC_FSEQ_df     = (0xA << 22) | OPC_MSA_3RF_1A,
-    OPC_FTQ_df      = (0xA << 22) | OPC_MSA_3RF_1B,
-    OPC_FSUNE_df    = (0xA << 22) | OPC_MSA_3RF_1C,
-    OPC_FSUEQ_df    = (0xB << 22) | OPC_MSA_3RF_1A,
-    OPC_FSNE_df     = (0xB << 22) | OPC_MSA_3RF_1C,
-    OPC_FSLT_df     = (0xC << 22) | OPC_MSA_3RF_1A,
-    OPC_FMIN_df     = (0xC << 22) | OPC_MSA_3RF_1B,
-    OPC_FSULT_df    = (0xD << 22) | OPC_MSA_3RF_1A,
-    OPC_FMIN_A_df   = (0xD << 22) | OPC_MSA_3RF_1B,
-    OPC_FSLE_df     = (0xE << 22) | OPC_MSA_3RF_1A,
-    OPC_FMAX_df     = (0xE << 22) | OPC_MSA_3RF_1B,
-    OPC_FSULE_df    = (0xF << 22) | OPC_MSA_3RF_1A,
-    OPC_FMAX_A_df   = (0xF << 22) | OPC_MSA_3RF_1B,
 };
 
 static const char msaregnames[][6] = {
@@ -1666,144 +1626,50 @@ static bool trans_msa_3rf(DisasContext *ctx, arg_msa_r *a,
     return true;
 }
 
+TRANS(FCAF,     trans_msa_3rf, DF_WORD, gen_helper_msa_fcaf_df);
+TRANS(FCUN,     trans_msa_3rf, DF_WORD, gen_helper_msa_fcun_df);
+TRANS(FCEQ,     trans_msa_3rf, DF_WORD, gen_helper_msa_fceq_df);
+TRANS(FCUEQ,    trans_msa_3rf, DF_WORD, gen_helper_msa_fcueq_df);
+TRANS(FCLT,     trans_msa_3rf, DF_WORD, gen_helper_msa_fclt_df);
+TRANS(FCULT,    trans_msa_3rf, DF_WORD, gen_helper_msa_fcult_df);
+TRANS(FCLE,     trans_msa_3rf, DF_WORD, gen_helper_msa_fcle_df);
+TRANS(FCULE,    trans_msa_3rf, DF_WORD, gen_helper_msa_fcule_df);
+TRANS(FSAF,     trans_msa_3rf, DF_WORD, gen_helper_msa_fsaf_df);
+TRANS(FSUN,     trans_msa_3rf, DF_WORD, gen_helper_msa_fsun_df);
+TRANS(FSEQ,     trans_msa_3rf, DF_WORD, gen_helper_msa_fseq_df);
+TRANS(FSUEQ,    trans_msa_3rf, DF_WORD, gen_helper_msa_fsueq_df);
+TRANS(FSLT,     trans_msa_3rf, DF_WORD, gen_helper_msa_fslt_df);
+TRANS(FSULT,    trans_msa_3rf, DF_WORD, gen_helper_msa_fsult_df);
+TRANS(FSLE,     trans_msa_3rf, DF_WORD, gen_helper_msa_fsle_df);
+TRANS(FSULE,    trans_msa_3rf, DF_WORD, gen_helper_msa_fsule_df);
+
+TRANS(FADD,     trans_msa_3rf, DF_WORD, gen_helper_msa_fadd_df);
+TRANS(FSUB,     trans_msa_3rf, DF_WORD, gen_helper_msa_fsub_df);
+TRANS(FMUL,     trans_msa_3rf, DF_WORD, gen_helper_msa_fmul_df);
+TRANS(FDIV,     trans_msa_3rf, DF_WORD, gen_helper_msa_fdiv_df);
+TRANS(FMADD,    trans_msa_3rf, DF_WORD, gen_helper_msa_fmadd_df);
+TRANS(FMSUB,    trans_msa_3rf, DF_WORD, gen_helper_msa_fmsub_df);
+TRANS(FEXP2,    trans_msa_3rf, DF_WORD, gen_helper_msa_fexp2_df);
+TRANS(FEXDO,    trans_msa_3rf, DF_WORD, gen_helper_msa_fexdo_df);
+TRANS(FTQ,      trans_msa_3rf, DF_WORD, gen_helper_msa_ftq_df);
+TRANS(FMIN,     trans_msa_3rf, DF_WORD, gen_helper_msa_fmin_df);
+TRANS(FMIN_A,   trans_msa_3rf, DF_WORD, gen_helper_msa_fmin_a_df);
+TRANS(FMAX,     trans_msa_3rf, DF_WORD, gen_helper_msa_fmax_df);
+TRANS(FMAX_A,   trans_msa_3rf, DF_WORD, gen_helper_msa_fmax_a_df);
+
+TRANS(FCOR,     trans_msa_3rf, DF_WORD, gen_helper_msa_fcor_df);
+TRANS(FCUNE,    trans_msa_3rf, DF_WORD, gen_helper_msa_fcune_df);
+TRANS(FCNE,     trans_msa_3rf, DF_WORD, gen_helper_msa_fcne_df);
 TRANS(MUL_Q,    trans_msa_3rf, DF_HALF, gen_helper_msa_mul_q_df);
 TRANS(MADD_Q,   trans_msa_3rf, DF_HALF, gen_helper_msa_madd_q_df);
 TRANS(MSUB_Q,   trans_msa_3rf, DF_HALF, gen_helper_msa_msub_q_df);
+TRANS(FSOR,     trans_msa_3rf, DF_WORD, gen_helper_msa_fsor_df);
+TRANS(FSUNE,    trans_msa_3rf, DF_WORD, gen_helper_msa_fsune_df);
+TRANS(FSNE,     trans_msa_3rf, DF_WORD, gen_helper_msa_fsne_df);
 TRANS(MULR_Q,   trans_msa_3rf, DF_HALF, gen_helper_msa_mulr_q_df);
 TRANS(MADDR_Q,  trans_msa_3rf, DF_HALF, gen_helper_msa_maddr_q_df);
 TRANS(MSUBR_Q,  trans_msa_3rf, DF_HALF, gen_helper_msa_msubr_q_df);
 
-static void gen_msa_3rf(DisasContext *ctx)
-{
-#define MASK_MSA_3RF(op)    (MASK_MSA_MINOR(op) | (op & (0xf << 22)))
-    uint8_t df = (ctx->opcode >> 21) & 0x1;
-    uint8_t wt = (ctx->opcode >> 16) & 0x1f;
-    uint8_t ws = (ctx->opcode >> 11) & 0x1f;
-    uint8_t wd = (ctx->opcode >> 6) & 0x1f;
-
-    TCGv_i32 twd = tcg_const_i32(wd);
-    TCGv_i32 tws = tcg_const_i32(ws);
-    TCGv_i32 twt = tcg_const_i32(wt);
-    /* adjust df value for floating-point instruction */
-    TCGv_i32 tdf = tcg_constant_i32(DF_WORD + df);
-
-    switch (MASK_MSA_3RF(ctx->opcode)) {
-    case OPC_FCAF_df:
-        gen_helper_msa_fcaf_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FADD_df:
-        gen_helper_msa_fadd_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCUN_df:
-        gen_helper_msa_fcun_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSUB_df:
-        gen_helper_msa_fsub_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCOR_df:
-        gen_helper_msa_fcor_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCEQ_df:
-        gen_helper_msa_fceq_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FMUL_df:
-        gen_helper_msa_fmul_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCUNE_df:
-        gen_helper_msa_fcune_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCUEQ_df:
-        gen_helper_msa_fcueq_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FDIV_df:
-        gen_helper_msa_fdiv_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCNE_df:
-        gen_helper_msa_fcne_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCLT_df:
-        gen_helper_msa_fclt_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FMADD_df:
-        gen_helper_msa_fmadd_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCULT_df:
-        gen_helper_msa_fcult_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FMSUB_df:
-        gen_helper_msa_fmsub_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCLE_df:
-        gen_helper_msa_fcle_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCULE_df:
-        gen_helper_msa_fcule_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FEXP2_df:
-        gen_helper_msa_fexp2_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSAF_df:
-        gen_helper_msa_fsaf_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FEXDO_df:
-        gen_helper_msa_fexdo_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSUN_df:
-        gen_helper_msa_fsun_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSOR_df:
-        gen_helper_msa_fsor_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSEQ_df:
-        gen_helper_msa_fseq_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FTQ_df:
-        gen_helper_msa_ftq_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSUNE_df:
-        gen_helper_msa_fsune_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSUEQ_df:
-        gen_helper_msa_fsueq_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSNE_df:
-        gen_helper_msa_fsne_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSLT_df:
-        gen_helper_msa_fslt_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FMIN_df:
-        gen_helper_msa_fmin_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSULT_df:
-        gen_helper_msa_fsult_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FMIN_A_df:
-        gen_helper_msa_fmin_a_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSLE_df:
-        gen_helper_msa_fsle_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FMAX_df:
-        gen_helper_msa_fmax_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSULE_df:
-        gen_helper_msa_fsule_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FMAX_A_df:
-        gen_helper_msa_fmax_a_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    default:
-        MIPS_INVAL("MSA instruction");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-
-    tcg_temp_free_i32(twd);
-    tcg_temp_free_i32(tws);
-    tcg_temp_free_i32(twt);
-}
-
 static bool trans_msa_2r(DisasContext *ctx, arg_msa_r *a,
                          gen_helper_pii *gen_msa_2r)
 {
@@ -1906,11 +1772,6 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
     case OPC_MSA_ELM:
         gen_msa_elm(ctx);
         break;
-    case OPC_MSA_3RF_1A:
-    case OPC_MSA_3RF_1B:
-    case OPC_MSA_3RF_1C:
-        gen_msa_3rf(ctx);
-        break;
     default:
         MIPS_INVAL("MSA instruction");
         gen_reserved_instruction(ctx);
-- 
2.31.1


