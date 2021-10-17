Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E071430CD4
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 01:08:18 +0200 (CEST)
Received: from localhost ([::1]:54196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcFGL-0006BB-CV
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 19:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF27-0004KN-Mq
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:53:35 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:38799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF26-0000N0-1d
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:53:35 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 y74-20020a1c7d4d000000b00322f53b9bbfso3094172wmc.3
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 15:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vP1k7G6kYb0ZSEIWtvfL0SOPPZNd2sVy+iXF6U+13xE=;
 b=NkJff89eRufUKp/yPO1QySa0M4DqQH+XB/DYT24lT55dE29ss3f2cla725XlBtRo74
 ESjHcpceKVtueuXUvkBx67QoqIkcicdBcFIHkDrJZCQBTX8CiQtRPYZsByL/RcMy+MIX
 VB5dBcdxc2y4Jhl2laW4zyiXEG6zk7KPdiqYTbH+LbU0u15WFoRzC1JRV7I9mhlZCBH2
 eyK6CLS0bbze+I0Oe556ohsymFiLJS7i00HfmDrV+13bFhMPy6+K0fElWyaqPW8IMEFy
 3UeBHwcaT3Lq6DUTkt9Gy2VnDMJGLwcAZp5bKeaDlTb4nFNubVcUUcn23DoPz19qjoWR
 8hEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vP1k7G6kYb0ZSEIWtvfL0SOPPZNd2sVy+iXF6U+13xE=;
 b=gMKDl0/+vzWbjhwJ9lc6W+z6M+7sORaDmNlfASGTq7TTfL0zqgh7Bn4hVLBRvVnOTw
 TxchinxUZyVWOZRYzr15s4hWbbe0dfeD3k1nYdwzpq67mwTU4GeBrbNrgrmTeXMttYEo
 oR0jCRYdjILoPBdmLE9+bsiayOwOVkqtRuNJiFxSGW5DfZuPR6Sq8JgLDPIuD1hNQY91
 sJzFpWqSRkFWA0dNczN0Yh2Zp/O8DsSsMjQBO/qUMuxdfnb4k4JUwLbm1XNcn+N36+V5
 koRq7lWjLcMQaNtYsLhOPEey8IE+0BPMRDgnsPThp3DUTMlL5AWqPxWVgsh/J1qPdNlZ
 MKkw==
X-Gm-Message-State: AOAM531dHKgePa8n955CGXGCdELqudwJ7nlVFzS3c6Jgmfekg4l97hpk
 6UDcLeKqsUeEAnuCfLB3+di2w1apvYg=
X-Google-Smtp-Source: ABdhPJx8GRp/kZZSmQKWdaQlN6JZlmmKuXUqIhaHCV1QieOPYUIdh9FDPzypJXLqXzM/bxGP+pAyOQ==
X-Received: by 2002:a1c:cc0f:: with SMTP id h15mr26788505wmb.37.1634511212463; 
 Sun, 17 Oct 2021 15:53:32 -0700 (PDT)
Received: from x1w.. (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id o26sm16626125wmc.17.2021.10.17.15.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 15:53:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/17] target/mips: Use tcg_constant_i32() in gen_msa_3rf()
Date: Mon, 18 Oct 2021 00:52:37 +0200
Message-Id: <20211017225245.2618892-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211017225245.2618892-1-f4bug@amsat.org>
References: <20211017225245.2618892-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid using a TCG temporary by moving Data Format to the constant pool.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211003175743.3738710-6-f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index bbe9146513a..e107cad57ee 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -1790,10 +1790,22 @@ static void gen_msa_3rf(DisasContext *ctx)
     TCGv_i32 twd = tcg_const_i32(wd);
     TCGv_i32 tws = tcg_const_i32(ws);
     TCGv_i32 twt = tcg_const_i32(wt);
-    TCGv_i32 tdf = tcg_temp_new_i32();
+    TCGv_i32 tdf;
 
     /* adjust df value for floating-point instruction */
-    tcg_gen_movi_i32(tdf, df + 2);
+    switch (MASK_MSA_3RF(ctx->opcode)) {
+    case OPC_MUL_Q_df:
+    case OPC_MADD_Q_df:
+    case OPC_MSUB_Q_df:
+    case OPC_MULR_Q_df:
+    case OPC_MADDR_Q_df:
+    case OPC_MSUBR_Q_df:
+        tdf = tcg_constant_i32(df + 1);
+        break;
+    default:
+        tdf = tcg_constant_i32(df + 2);
+        break;
+    }
 
     switch (MASK_MSA_3RF(ctx->opcode)) {
     case OPC_FCAF_df:
@@ -1836,7 +1848,6 @@ static void gen_msa_3rf(DisasContext *ctx)
         gen_helper_msa_fmadd_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_MUL_Q_df:
-        tcg_gen_movi_i32(tdf, df + 1);
         gen_helper_msa_mul_q_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_FCULT_df:
@@ -1846,14 +1857,12 @@ static void gen_msa_3rf(DisasContext *ctx)
         gen_helper_msa_fmsub_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_MADD_Q_df:
-        tcg_gen_movi_i32(tdf, df + 1);
         gen_helper_msa_madd_q_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_FCLE_df:
         gen_helper_msa_fcle_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_MSUB_Q_df:
-        tcg_gen_movi_i32(tdf, df + 1);
         gen_helper_msa_msub_q_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_FCULE_df:
@@ -1896,7 +1905,6 @@ static void gen_msa_3rf(DisasContext *ctx)
         gen_helper_msa_fmin_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_MULR_Q_df:
-        tcg_gen_movi_i32(tdf, df + 1);
         gen_helper_msa_mulr_q_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_FSULT_df:
@@ -1906,7 +1914,6 @@ static void gen_msa_3rf(DisasContext *ctx)
         gen_helper_msa_fmin_a_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_MADDR_Q_df:
-        tcg_gen_movi_i32(tdf, df + 1);
         gen_helper_msa_maddr_q_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_FSLE_df:
@@ -1916,7 +1923,6 @@ static void gen_msa_3rf(DisasContext *ctx)
         gen_helper_msa_fmax_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_MSUBR_Q_df:
-        tcg_gen_movi_i32(tdf, df + 1);
         gen_helper_msa_msubr_q_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_FSULE_df:
@@ -1934,7 +1940,6 @@ static void gen_msa_3rf(DisasContext *ctx)
     tcg_temp_free_i32(twd);
     tcg_temp_free_i32(tws);
     tcg_temp_free_i32(twt);
-    tcg_temp_free_i32(tdf);
 }
 
 static void gen_msa_2r(DisasContext *ctx)
-- 
2.31.1


