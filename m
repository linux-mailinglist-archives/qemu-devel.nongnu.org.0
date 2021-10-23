Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CA84385BE
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 00:12:11 +0200 (CEST)
Received: from localhost ([::1]:50034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mePFK-0002Xf-QH
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 18:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOuK-0007nG-C7
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:50:31 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:38739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOuI-00067n-01
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:50:27 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 a20-20020a1c7f14000000b003231d13ee3cso8255418wmd.3
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ibIGTNc/VyjFjQlNiFJLRqQgcFwCs2aG6VjX1PSyJdM=;
 b=oEL4MThd0vAK56jT7P2Pmwfi75LD2av/x0C3hJDbrZHSIeqHt5WcX3v26cMlaNnWQk
 CZ23XH1tAVmCZhiHkpG1/dMj3YSEapTVqWE7JnHu06epi5ckpprTsRmc5+5kOmvZWUOH
 op+ummDH3RzzT4qEVIQPEo4QSGtvPUvitrds0FvpcTTCUsWUJf4MzMzg/FpGh+aanI5W
 UYmoHozM7ebjkbSY4oCWrY+v1jPMrJbHRQjQDpz2xHLK1bhZxbUTun0B4q32kO57773S
 ZtQ1uABGmWz4SepJR22I9b6gsZM4q9Z11G+SyOz+bgwJIlWbtU4YgNNU48TsLkoUxCq1
 17lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ibIGTNc/VyjFjQlNiFJLRqQgcFwCs2aG6VjX1PSyJdM=;
 b=C/C1l3S5tgmeHbBDOCNF1BNIycOD784Kben9xmOi6zt41NvuG0EMpk2yfRZ3FmtKsO
 KciB0asUOC8luyicbxyVUtmixz4IGSgFYioszmndbwfpjy4NXODqscru5ylULePWXHpE
 0AEXOpDHXQsPzD6wD0gRgLl2ctjVrFPBMMWEgjtLU3athP0kNAz52cW4/5YwlVIZWfSG
 5sOPKTMNPKhk89t5deYygIAi3gIafvI2Yehf+AwTrv46cMPbxIWioKl9ujKlEG8deKUq
 1KsBuQLLuIBe/XBkrtXHgi0tJ2BjZNx/n9vTrcNMfEycmLCbg2I48e2uid7a8M1E+NZj
 6Lxg==
X-Gm-Message-State: AOAM533AJfQCY37GtPjtbERdVeYzGD9LQF/aK+Q9yS6Why85E0HxDBkg
 Fcua/hedJAYQm4HSLQLfk3W7YC+6MGc=
X-Google-Smtp-Source: ABdhPJxgUXFxc5RpGen/H2VaXAkUChYpT+FLv6tte1oicEfb6xlom4pCdyQA0H6hrx9uf1vwz6ptsA==
X-Received: by 2002:a05:600c:4ece:: with SMTP id
 g14mr9283107wmq.95.1635025824519; 
 Sat, 23 Oct 2021 14:50:24 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 p21sm939656wmc.11.2021.10.23.14.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:50:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 28/33] target/mips: Convert MSA COPY_S and INSERT opcodes to
 decodetree
Date: Sat, 23 Oct 2021 23:47:58 +0200
Message-Id: <20211023214803.522078-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
 Luis Pires <luis.pires@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the COPY_S (Element Copy to GPR Signed) opcode
and INSERT (GPR Insert Element) opcode to decodetree.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  2 +
 target/mips/tcg/msa_translate.c | 92 ++++-----------------------------
 2 files changed, 12 insertions(+), 82 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 80a06d12746..dc5e561b9dc 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -156,7 +156,9 @@ BNZ                 010001 111 .. ..... ................    @bz
 
   SLDI              011110 0000 ...... ..... .....  011001  @elm_df
   SPLATI            011110 0001 ...... ..... .....  011001  @elm_df
+  COPY_S            011110 0010 ...... ..... .....  011001  @elm_df
   COPY_U            011110 0011 ...... ..... .....  011001  @elm_df
+  INSERT            011110 0100 ...... ..... .....  011001  @elm_df
   INSVE             011110 0101 ...... ..... .....  011001  @elm_df
 
   FCAF              011110 0000 . ..... ..... ..... 011010  @3rf
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index e033b365fdd..ff5dbd99f84 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -31,9 +31,7 @@ enum {
     /* ELM instructions df(bits 21..16) = _b, _h, _w, _d */
     OPC_CTCMSA      = (0x0 << 22) | (0x3E << 16) | OPC_MSA_ELM,
     OPC_CFCMSA      = (0x1 << 22) | (0x3E << 16) | OPC_MSA_ELM,
-    OPC_COPY_S_df   = (0x2 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_MOVE_V      = (0x2 << 22) | (0x3E << 16) | OPC_MSA_ELM,
-    OPC_INSERT_df   = (0x4 << 22) | (0x00 << 16) | OPC_MSA_ELM,
 };
 
 static const char msaregnames[][6] = {
@@ -138,6 +136,11 @@ static inline bool check_msa_access(DisasContext *ctx)
         TRANS_CHECK(NAME, check_msa_access(ctx), trans_func, \
                     NULL, gen_func##_h, gen_func##_w, gen_func##_d)
 
+#define TRANS_DF_D64(NAME, trans_func, gen_func) \
+        TRANS_CHECK(NAME, check_msa_access(ctx), trans_func, \
+                    DF_WORD, DF_DOUBLE, \
+                    gen_func##_b, gen_func##_h, gen_func##_w, gen_func##_d)
+
 #define TRANS_DF_W64(NAME, trans_func, gen_func) \
         TRANS_CHECK(NAME, check_msa_access(ctx), trans_func, \
                     DF_HALF, DF_WORD, \
@@ -642,7 +645,8 @@ static bool trans_msa_elm_d64(DisasContext *ctx, arg_msa_elm *a,
         gen_msa_elm_w(cpu_env, twd, tws, tn);
         break;
     case DF_DOUBLE:
-        g_assert_not_reached();
+        assert(gen_msa_elm_d != NULL);
+        gen_msa_elm_d(cpu_env, twd, tws, tn);
         break;
     }
 
@@ -652,97 +656,21 @@ static bool trans_msa_elm_d64(DisasContext *ctx, arg_msa_elm *a,
     return true;
 }
 
+TRANS_DF_D64(COPY_S,    trans_msa_elm_d64, gen_helper_msa_copy_s);
 TRANS_DF_W64(COPY_U,    trans_msa_elm_d64, gen_helper_msa_copy_u);
-
-static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
-{
-#define MASK_MSA_ELM(op)    (MASK_MSA_MINOR(op) | (op & (0xf << 22)))
-    uint8_t ws = (ctx->opcode >> 11) & 0x1f;
-    uint8_t wd = (ctx->opcode >> 6) & 0x1f;
-
-    TCGv_i32 tws = tcg_const_i32(ws);
-    TCGv_i32 twd = tcg_const_i32(wd);
-    TCGv_i32 tn  = tcg_const_i32(n);
-
-    switch (MASK_MSA_ELM(ctx->opcode)) {
-    case OPC_COPY_S_df:
-    case OPC_INSERT_df:
-#if !defined(TARGET_MIPS64)
-        /* Double format valid only for MIPS64 */
-        if (df == DF_DOUBLE) {
-            gen_reserved_instruction(ctx);
-            break;
-        }
-#endif
-        switch (MASK_MSA_ELM(ctx->opcode)) {
-        case OPC_COPY_S_df:
-            if (likely(wd != 0)) {
-                switch (df) {
-                case DF_BYTE:
-                    gen_helper_msa_copy_s_b(cpu_env, twd, tws, tn);
-                    break;
-                case DF_HALF:
-                    gen_helper_msa_copy_s_h(cpu_env, twd, tws, tn);
-                    break;
-                case DF_WORD:
-                    gen_helper_msa_copy_s_w(cpu_env, twd, tws, tn);
-                    break;
-#if defined(TARGET_MIPS64)
-                case DF_DOUBLE:
-                    gen_helper_msa_copy_s_d(cpu_env, twd, tws, tn);
-                    break;
-#endif
-                default:
-                    assert(0);
-                }
-            }
-            break;
-        case OPC_INSERT_df:
-            switch (df) {
-            case DF_BYTE:
-                gen_helper_msa_insert_b(cpu_env, twd, tws, tn);
-                break;
-            case DF_HALF:
-                gen_helper_msa_insert_h(cpu_env, twd, tws, tn);
-                break;
-            case DF_WORD:
-                gen_helper_msa_insert_w(cpu_env, twd, tws, tn);
-                break;
-#if defined(TARGET_MIPS64)
-            case DF_DOUBLE:
-                gen_helper_msa_insert_d(cpu_env, twd, tws, tn);
-                break;
-#endif
-            default:
-                assert(0);
-            }
-            break;
-        }
-        break;
-    default:
-        MIPS_INVAL("MSA instruction");
-        gen_reserved_instruction(ctx);
-    }
-    tcg_temp_free_i32(twd);
-    tcg_temp_free_i32(tws);
-    tcg_temp_free_i32(tn);
-}
+TRANS_DF_D64(INSERT,    trans_msa_elm_d64, gen_helper_msa_insert);
 
 static void gen_msa_elm(DisasContext *ctx)
 {
     uint8_t dfn = (ctx->opcode >> 16) & 0x3f;
-    uint32_t df, n;
 
     if (dfn == 0x3E) {
         /* CTCMSA, CFCMSA, MOVE.V */
         gen_msa_elm_3e(ctx);
         return;
-    } else if (!df_extract(df_elm, dfn, &df, &n)) {
-        gen_reserved_instruction(ctx);
-        return;
     }
 
-    gen_msa_elm_df(ctx, df, n);
+    gen_reserved_instruction(ctx);
 }
 
 static bool trans_msa_3rf(DisasContext *ctx, arg_msa_r *a,
-- 
2.31.1


