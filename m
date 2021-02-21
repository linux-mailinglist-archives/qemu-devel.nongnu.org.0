Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2F8320B2E
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:59:16 +0100 (CET)
Received: from localhost ([::1]:39740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDqCZ-0003Xu-3J
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:59:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpr8-0007zl-7q
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:07 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:34868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpqd-0003C2-2m
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:05 -0500
Received: by mail-wm1-x32c.google.com with SMTP id n10so12074142wmq.0
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rOF5MQDxPLOXQx0ibeRXNei5jJwKer3lL4/zvBaW5Vo=;
 b=Q1qWELqS7EuSV2vdbdH29F6ehgYhPKKzxcZP65ymUWpGYNJkYBD748SQwqGtEa7iNk
 dzSgATeHxwGwopK0VhAX+0p8A1ExJcl0K7LlzFM1/bZeHWuuFRyLynVzXshztBnJMhVX
 JH4F6UD6UfK2YHnED7nMJKiAxK4sYEuIXUlR9/TlmUxb3WGrVOhvMbMJZhaPAZ3lKQLN
 YQtOLGy/YRvQTGzXdsqU/0Th7SBzVjHL0faiiOx3X7gsPZJJVPFiH9znun86CRoxiduS
 WI+yq2/7S5M+CxedB62fprLLEVGcajJEWhTIbw8csDjryFA+4L5larpDr7lpNsbXMbTQ
 n9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rOF5MQDxPLOXQx0ibeRXNei5jJwKer3lL4/zvBaW5Vo=;
 b=o8NWpBL8MreKQr63pLitB6iYQYOQnYeweM0DNqtLhYqWOq3vLoo36pmT5XZEBG8Z63
 nnO9yb9TOT3v8VvvHbyDIy14XvqWQM7/WjpDtmrqYdorVO3ZlKA22MF3RnI/bSQd1RvC
 fGcBvt0HcVaukSDwCd5uEX74Pi+yylrawOMXvXfyh+pF7BM3W0cKHN7YYuKHw0Z1lI0i
 DGVT0blZWHl5L1508OdW4EpGTNYJ7r96g7pYvgoSrMK7PjCfpxMUe4miWpd4Vf7hDC7u
 tsa2Jzc48je217v8wrnUlGVw6G9ADigAQMLshTAg/QIXWvswbAGTgjChmNBYZAjHNJAD
 p6Rg==
X-Gm-Message-State: AOAM530BKqA4ftAjy0P8R/Xz95Xv+jCxwXIrduCySm01iR3fiWVIcaWg
 cTpmtejRsLL4m83DHxneEPXGjUDd2TA=
X-Google-Smtp-Source: ABdhPJwF0+ZRc92TM7zriN+Khz8uWxvUscOcRar7pRTnuJxgiOgfTBx2KSdYbyQxe8CvOEpbStT3gw==
X-Received: by 2002:a1c:7705:: with SMTP id t5mr9808915wmi.148.1613918193527; 
 Sun, 21 Feb 2021 06:36:33 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t2sm8283842wrx.23.2021.02.21.06.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:36:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/43] target/mips: Promote 128-bit multimedia registers as
 global ones
Date: Sun, 21 Feb 2021 15:34:13 +0100
Message-Id: <20210221143432.2468220-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The cpu::mmr[] array contains the upper halves of 128-bit GPR
registers. While they are only used by the R5900 CPU, the
concept is generic and could be used by another MIPS implementation.

Rename 'cpu::mmr' as 'cpu::gpr_hi' and make them global.

When the code is similar to the GPR lower halves, move it
close by.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210214175912.732946-5-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.h       | 10 ++++++---
 target/mips/translate.h |  3 +++
 target/mips/translate.c | 48 ++++++++++++++++++++---------------------
 3 files changed, 34 insertions(+), 27 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 9e6028f8e63..075c24abdad 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -460,6 +460,13 @@ typedef struct mips_def_t mips_def_t;
 typedef struct TCState TCState;
 struct TCState {
     target_ulong gpr[32];
+#if defined(TARGET_MIPS64)
+    /*
+     * For CPUs using 128-bit GPR registers, we put the lower halves in gpr[])
+     * and the upper halves in gpr_hi[].
+     */
+    uint64_t gpr_hi[32];
+#endif /* TARGET_MIPS64 */
     target_ulong PC;
     target_ulong HI[MIPS_DSP_ACC];
     target_ulong LO[MIPS_DSP_ACC];
@@ -505,9 +512,6 @@ struct TCState {
 
     float_status msa_fp_status;
 
-    /* Upper 64-bit MMRs (multimedia registers); the lower 64-bit are GPRs */
-    uint64_t mmr[32];
-
 #define NUMBER_OF_MXU_REGISTERS 16
     target_ulong mxu_gpr[NUMBER_OF_MXU_REGISTERS - 1];
     target_ulong mxu_cr;
diff --git a/target/mips/translate.h b/target/mips/translate.h
index 2a1d8f570bb..3014c20cadb 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -145,6 +145,9 @@ bool gen_lsa(DisasContext *ctx, int rd, int rt, int rs, int sa);
 bool gen_dlsa(DisasContext *ctx, int rd, int rt, int rs, int sa);
 
 extern TCGv cpu_gpr[32], cpu_PC;
+#if defined(TARGET_MIPS64)
+extern TCGv_i64 cpu_gpr_hi[32];
+#endif
 extern TCGv cpu_HI[MIPS_DSP_ACC], cpu_LO[MIPS_DSP_ACC];
 extern TCGv_i32 fpu_fcr0, fpu_fcr31;
 extern TCGv_i64 fpu_f64[32];
diff --git a/target/mips/translate.c b/target/mips/translate.c
index c20f630b7e7..2df76592470 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -2179,6 +2179,11 @@ enum {
 
 /* global register indices */
 TCGv cpu_gpr[32], cpu_PC;
+/*
+ * For CPUs using 128-bit GPR registers, we put the lower halves in cpu_gpr[])
+ * and the upper halves in cpu_gpr_hi[].
+ */
+TCGv_i64 cpu_gpr_hi[32];
 TCGv cpu_HI[MIPS_DSP_ACC], cpu_LO[MIPS_DSP_ACC];
 static TCGv cpu_dspctrl, btarget;
 TCGv bcond;
@@ -2187,11 +2192,6 @@ static TCGv_i32 hflags;
 TCGv_i32 fpu_fcr0, fpu_fcr31;
 TCGv_i64 fpu_f64[32];
 
-#if defined(TARGET_MIPS64)
-/* Upper halves of R5900's 128-bit registers: MMRs (multimedia registers) */
-static TCGv_i64 cpu_mmr[32];
-#endif
-
 #if !defined(TARGET_MIPS64)
 /* MXU registers */
 static TCGv mxu_gpr[NUMBER_OF_MXU_REGISTERS - 1];
@@ -24784,7 +24784,7 @@ static void gen_mmi_pcpyh(DisasContext *ctx)
         /* nop */
     } else if (rt == 0) {
         tcg_gen_movi_i64(cpu_gpr[rd], 0);
-        tcg_gen_movi_i64(cpu_mmr[rd], 0);
+        tcg_gen_movi_i64(cpu_gpr_hi[rd], 0);
     } else {
         TCGv_i64 t0 = tcg_temp_new();
         TCGv_i64 t1 = tcg_temp_new();
@@ -24802,7 +24802,7 @@ static void gen_mmi_pcpyh(DisasContext *ctx)
 
         tcg_gen_mov_i64(cpu_gpr[rd], t1);
 
-        tcg_gen_andi_i64(t0, cpu_mmr[rt], mask);
+        tcg_gen_andi_i64(t0, cpu_gpr_hi[rt], mask);
         tcg_gen_movi_i64(t1, 0);
         tcg_gen_or_i64(t1, t0, t1);
         tcg_gen_shli_i64(t0, t0, 16);
@@ -24812,7 +24812,7 @@ static void gen_mmi_pcpyh(DisasContext *ctx)
         tcg_gen_shli_i64(t0, t0, 16);
         tcg_gen_or_i64(t1, t0, t1);
 
-        tcg_gen_mov_i64(cpu_mmr[rd], t1);
+        tcg_gen_mov_i64(cpu_gpr_hi[rd], t1);
 
         tcg_temp_free(t0);
         tcg_temp_free(t1);
@@ -24844,9 +24844,9 @@ static void gen_mmi_pcpyld(DisasContext *ctx)
         /* nop */
     } else {
         if (rs == 0) {
-            tcg_gen_movi_i64(cpu_mmr[rd], 0);
+            tcg_gen_movi_i64(cpu_gpr_hi[rd], 0);
         } else {
-            tcg_gen_mov_i64(cpu_mmr[rd], cpu_gpr[rs]);
+            tcg_gen_mov_i64(cpu_gpr_hi[rd], cpu_gpr[rs]);
         }
         if (rt == 0) {
             tcg_gen_movi_i64(cpu_gpr[rd], 0);
@@ -24885,13 +24885,13 @@ static void gen_mmi_pcpyud(DisasContext *ctx)
         if (rs == 0) {
             tcg_gen_movi_i64(cpu_gpr[rd], 0);
         } else {
-            tcg_gen_mov_i64(cpu_gpr[rd], cpu_mmr[rs]);
+            tcg_gen_mov_i64(cpu_gpr[rd], cpu_gpr_hi[rs]);
         }
         if (rt == 0) {
-            tcg_gen_movi_i64(cpu_mmr[rd], 0);
+            tcg_gen_movi_i64(cpu_gpr_hi[rd], 0);
         } else {
             if (rd != rt) {
-                tcg_gen_mov_i64(cpu_mmr[rd], cpu_mmr[rt]);
+                tcg_gen_mov_i64(cpu_gpr_hi[rd], cpu_gpr_hi[rt]);
             }
         }
     }
@@ -29285,6 +29285,16 @@ void mips_tcg_init(void)
                                         offsetof(CPUMIPSState,
                                                  active_tc.gpr[i]),
                                         regnames[i]);
+#if defined(TARGET_MIPS64)
+    cpu_gpr_hi[0] = NULL;
+
+    for (unsigned i = 1; i < 32; i++) {
+        cpu_gpr_hi[i] = tcg_global_mem_new_i64(cpu_env,
+                                               offsetof(CPUMIPSState,
+                                                        active_tc.gpr_hi[i]),
+                                               regnames[i]);
+    }
+#endif /* !TARGET_MIPS64 */
     for (i = 0; i < 32; i++) {
         int off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[0]);
 
@@ -29323,16 +29333,6 @@ void mips_tcg_init(void)
     cpu_llval = tcg_global_mem_new(cpu_env, offsetof(CPUMIPSState, llval),
                                    "llval");
 
-#if defined(TARGET_MIPS64)
-    cpu_mmr[0] = NULL;
-    for (i = 1; i < 32; i++) {
-        cpu_mmr[i] = tcg_global_mem_new_i64(cpu_env,
-                                            offsetof(CPUMIPSState,
-                                                     active_tc.mmr[i]),
-                                            regnames[i]);
-    }
-#endif
-
 #if !defined(TARGET_MIPS64)
     for (i = 0; i < NUMBER_OF_MXU_REGISTERS - 1; i++) {
         mxu_gpr[i] = tcg_global_mem_new(cpu_env,
@@ -29344,7 +29344,7 @@ void mips_tcg_init(void)
     mxu_CR = tcg_global_mem_new(cpu_env,
                                 offsetof(CPUMIPSState, active_tc.mxu_cr),
                                 mxuregnames[NUMBER_OF_MXU_REGISTERS - 1]);
-#endif
+#endif /* !TARGET_MIPS64 */
 }
 
 void restore_state_to_opc(CPUMIPSState *env, TranslationBlock *tb,
-- 
2.26.2


