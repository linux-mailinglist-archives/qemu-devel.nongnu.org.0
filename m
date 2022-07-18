Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6EC57887D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:31:24 +0200 (CEST)
Received: from localhost ([::1]:45950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUaZ-00039Y-Tj
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSb-00087A-2Q; Mon, 18 Jul 2022 13:23:09 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:34341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSN-0001qw-5I; Mon, 18 Jul 2022 13:22:58 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 g19-20020a9d1293000000b0061c7bfda5dfso9360729otg.1; 
 Mon, 18 Jul 2022 10:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A2ZUp18kHaispg3o+cwDM4BMmMxGy5ZvnLwq0jJFNFA=;
 b=HpgA6T9m5m3dDAKwbiHSWjii8a0AP1/S1lMaXCZKF5+8wuoRGsTE8FMczQlnizTE8b
 +vtMOPj5bvSDQIEbpo+vWxz0gsFXpXqdzOKnd8asDq2uHPXpeRItM9Dk83Gop4WSFPsd
 +AG2GrdEPSVWOjCVYTxYcr+WigQMWAquQiD0KItNE5KHg5Kc/EEDXQLY42gnoywnptlQ
 YHJ+SMRcGFq1wDy69wmhoRgVE3ZDELsazBlsUkEgHho1Qz/7IEw0KlEe6eS/kmJ2R/wD
 7rdloTHnL5lSGrQ+Iw7CfRjq1m6GCQNHBUefbJNjqFAcBOKYX2R5RLtmdlWeLVVo6bbd
 IGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A2ZUp18kHaispg3o+cwDM4BMmMxGy5ZvnLwq0jJFNFA=;
 b=UYez/chvw4wRbbMk7K1nS6ayCvzCxhP7NPxK5zjlPtGtkLXaV62IfQhnjyJ3ASAwzh
 qTWV+NpH7UwSof3Jh/VLz11ftXTKOANINd2DaTIFRnIkntFvs/uo4mFT8g/L23TJsIJJ
 GWuLGmXHz5IRLIGl7cRNfjwL9MtmK1bbYsfAbI4SFV9UhC0IktHm5CfO7DTRhSMqKYBe
 hJmw2g/dolntYEjfUKyTS9GgUtOxN//DtropWRVdgTmXrH/n8CC+t3zGlYoTarmkGNRY
 QfYVX724yS0bqvCO5umX4pDax6zApKl6BUZq+GyHnUCOoOjuSPQEoYlTwIf09A1saJG9
 H9QQ==
X-Gm-Message-State: AJIora+BuqCSInjmwpgKF+9BK6N13V4LnZV1mbCtbgaeNx+qWOkUfyFS
 ANQnDQ94uLSKMRpeTve8c2kfnC83Di8=
X-Google-Smtp-Source: AGRyM1svUFgqaKPJXuXBctWsXuXNctJaE4f0B75xEhPlW3OQkb9sCbcecYbIRTElL+LqyszxzF5o7Q==
X-Received: by 2002:a9d:761a:0:b0:60b:6c4d:414e with SMTP id
 k26-20020a9d761a000000b0060b6c4d414emr11299033otl.25.1658164972926; 
 Mon, 18 Jul 2022 10:22:52 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:22:52 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PULL 16/30] target/ppc: receive DisasContext explicitly in GEN_PRIV
Date: Mon, 18 Jul 2022 14:21:54 -0300
Message-Id: <20220718172208.1247624-17-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718172208.1247624-1-danielhb413@gmail.com>
References: <20220718172208.1247624-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

GEN_PRIV and related CHK_* macros just assumed that variable named
"ctx" would be in scope when they are used, and that it would be a
pointer to DisasContext. Change these macros to receive the pointer
explicitly.

Reviewed-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Signed-off-by: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
Message-Id: <20220701133507.740619-2-lucas.coutinho@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/translate.c             | 299 +++++++++++++++--------------
 target/ppc/translate/fp-impl.c.inc |   4 +-
 2 files changed, 154 insertions(+), 149 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 440ec8a700..8afc2e4691 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -1267,38 +1267,43 @@ typedef struct opcode_t {
     const char *oname;
 } opcode_t;
 
+static void gen_priv_opc(DisasContext *ctx)
+{
+    gen_priv_exception(ctx, POWERPC_EXCP_PRIV_OPC);
+}
+
 /* Helpers for priv. check */
-#define GEN_PRIV                                                \
-    do {                                                        \
-        gen_priv_exception(ctx, POWERPC_EXCP_PRIV_OPC); return; \
+#define GEN_PRIV(CTX)              \
+    do {                           \
+        gen_priv_opc(CTX); return; \
     } while (0)
 
 #if defined(CONFIG_USER_ONLY)
-#define CHK_HV GEN_PRIV
-#define CHK_SV GEN_PRIV
-#define CHK_HVRM GEN_PRIV
+#define CHK_HV(CTX) GEN_PRIV(CTX)
+#define CHK_SV(CTX) GEN_PRIV(CTX)
+#define CHK_HVRM(CTX) GEN_PRIV(CTX)
 #else
-#define CHK_HV                                                          \
-    do {                                                                \
-        if (unlikely(ctx->pr || !ctx->hv)) {                            \
-            GEN_PRIV;                                                   \
-        }                                                               \
+#define CHK_HV(CTX)                         \
+    do {                                    \
+        if (unlikely(ctx->pr || !ctx->hv)) {\
+            GEN_PRIV(CTX);                  \
+        }                                   \
     } while (0)
-#define CHK_SV                   \
+#define CHK_SV(CTX)              \
     do {                         \
         if (unlikely(ctx->pr)) { \
-            GEN_PRIV;            \
+            GEN_PRIV(CTX);       \
         }                        \
     } while (0)
-#define CHK_HVRM                                            \
-    do {                                                    \
-        if (unlikely(ctx->pr || !ctx->hv || ctx->dr)) {     \
-            GEN_PRIV;                                       \
-        }                                                   \
+#define CHK_HVRM(CTX)                                   \
+    do {                                                \
+        if (unlikely(ctx->pr || !ctx->hv || ctx->dr)) { \
+            GEN_PRIV(CTX);                              \
+        }                                               \
     } while (0)
 #endif
 
-#define CHK_NONE
+#define CHK_NONE(CTX)
 
 /*****************************************************************************/
 /* PowerPC instructions table                                                */
@@ -3252,7 +3257,7 @@ GEN_QEMU_STORE_64(st64r, BSWAP_MEMOP(MO_UQ))
 static void glue(gen_, name##x)(DisasContext *ctx)                            \
 {                                                                             \
     TCGv EA;                                                                  \
-    chk;                                                                      \
+    chk(ctx);                                                                 \
     gen_set_access_type(ctx, ACCESS_INT);                                     \
     EA = tcg_temp_new();                                                      \
     gen_addr_reg_index(ctx, EA);                                              \
@@ -3270,7 +3275,7 @@ static void glue(gen_, name##x)(DisasContext *ctx)                            \
 static void glue(gen_, name##epx)(DisasContext *ctx)                          \
 {                                                                             \
     TCGv EA;                                                                  \
-    CHK_SV;                                                                   \
+    CHK_SV(ctx);                                                              \
     gen_set_access_type(ctx, ACCESS_INT);                                     \
     EA = tcg_temp_new();                                                      \
     gen_addr_reg_index(ctx, EA);                                              \
@@ -3298,7 +3303,7 @@ GEN_LDX_HVRM(lbzcix, ld8u, 0x15, 0x1a, PPC_CILDST)
 static void glue(gen_, name##x)(DisasContext *ctx)                            \
 {                                                                             \
     TCGv EA;                                                                  \
-    chk;                                                                      \
+    chk(ctx);                                                                 \
     gen_set_access_type(ctx, ACCESS_INT);                                     \
     EA = tcg_temp_new();                                                      \
     gen_addr_reg_index(ctx, EA);                                              \
@@ -3315,7 +3320,7 @@ static void glue(gen_, name##x)(DisasContext *ctx)                            \
 static void glue(gen_, name##epx)(DisasContext *ctx)                          \
 {                                                                             \
     TCGv EA;                                                                  \
-    CHK_SV;                                                                   \
+    CHK_SV(ctx);                                                              \
     gen_set_access_type(ctx, ACCESS_INT);                                     \
     EA = tcg_temp_new();                                                      \
     gen_addr_reg_index(ctx, EA);                                              \
@@ -4078,11 +4083,11 @@ static void gen_wait(DisasContext *ctx)
 static void gen_doze(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv_i32 t;
 
-    CHK_HV;
+    CHK_HV(ctx);
     t = tcg_const_i32(PPC_PM_DOZE);
     gen_helper_pminsn(cpu_env, t);
     tcg_temp_free_i32(t);
@@ -4094,11 +4099,11 @@ static void gen_doze(DisasContext *ctx)
 static void gen_nap(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv_i32 t;
 
-    CHK_HV;
+    CHK_HV(ctx);
     t = tcg_const_i32(PPC_PM_NAP);
     gen_helper_pminsn(cpu_env, t);
     tcg_temp_free_i32(t);
@@ -4110,11 +4115,11 @@ static void gen_nap(DisasContext *ctx)
 static void gen_stop(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv_i32 t;
 
-    CHK_HV;
+    CHK_HV(ctx);
     t = tcg_const_i32(PPC_PM_STOP);
     gen_helper_pminsn(cpu_env, t);
     tcg_temp_free_i32(t);
@@ -4126,11 +4131,11 @@ static void gen_stop(DisasContext *ctx)
 static void gen_sleep(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv_i32 t;
 
-    CHK_HV;
+    CHK_HV(ctx);
     t = tcg_const_i32(PPC_PM_SLEEP);
     gen_helper_pminsn(cpu_env, t);
     tcg_temp_free_i32(t);
@@ -4142,11 +4147,11 @@ static void gen_sleep(DisasContext *ctx)
 static void gen_rvwinkle(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv_i32 t;
 
-    CHK_HV;
+    CHK_HV(ctx);
     t = tcg_const_i32(PPC_PM_RVWINKLE);
     gen_helper_pminsn(cpu_env, t);
     tcg_temp_free_i32(t);
@@ -4476,7 +4481,7 @@ static void gen_mcrf(DisasContext *ctx)
 static void gen_rfi(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     /*
      * This instruction doesn't exist anymore on 64-bit server
@@ -4487,7 +4492,7 @@ static void gen_rfi(DisasContext *ctx)
         return;
     }
     /* Restore CPU state */
-    CHK_SV;
+    CHK_SV(ctx);
     gen_icount_io_start(ctx);
     gen_update_cfar(ctx, ctx->cia);
     gen_helper_rfi(cpu_env);
@@ -4499,10 +4504,10 @@ static void gen_rfi(DisasContext *ctx)
 static void gen_rfid(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     /* Restore CPU state */
-    CHK_SV;
+    CHK_SV(ctx);
     gen_icount_io_start(ctx);
     gen_update_cfar(ctx, ctx->cia);
     gen_helper_rfid(cpu_env);
@@ -4514,10 +4519,10 @@ static void gen_rfid(DisasContext *ctx)
 static void gen_rfscv(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     /* Restore CPU state */
-    CHK_SV;
+    CHK_SV(ctx);
     gen_icount_io_start(ctx);
     gen_update_cfar(ctx, ctx->cia);
     gen_helper_rfscv(cpu_env);
@@ -4529,10 +4534,10 @@ static void gen_rfscv(DisasContext *ctx)
 static void gen_hrfid(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     /* Restore CPU state */
-    CHK_HV;
+    CHK_HV(ctx);
     gen_helper_hrfid(cpu_env);
     ctx->base.is_jmp = DISAS_EXIT;
 #endif
@@ -4733,7 +4738,7 @@ static void gen_mfcr(DisasContext *ctx)
 /* mfmsr */
 static void gen_mfmsr(DisasContext *ctx)
 {
-    CHK_SV;
+    CHK_SV(ctx);
     tcg_gen_mov_tl(cpu_gpr[rD(ctx->opcode)], cpu_msr);
 }
 
@@ -4847,7 +4852,7 @@ static void gen_mtmsrd(DisasContext *ctx)
         return;
     }
 
-    CHK_SV;
+    CHK_SV(ctx);
 
 #if !defined(CONFIG_USER_ONLY)
     TCGv t0, t1;
@@ -4890,7 +4895,7 @@ static void gen_mtmsrd(DisasContext *ctx)
 
 static void gen_mtmsr(DisasContext *ctx)
 {
-    CHK_SV;
+    CHK_SV(ctx);
 
 #if !defined(CONFIG_USER_ONLY)
     TCGv t0, t1;
@@ -5022,7 +5027,7 @@ static void gen_dcbfep(DisasContext *ctx)
 {
     /* XXX: specification says this is treated as a load by the MMU */
     TCGv t0;
-    CHK_SV;
+    CHK_SV(ctx);
     gen_set_access_type(ctx, ACCESS_CACHE);
     t0 = tcg_temp_new();
     gen_addr_reg_index(ctx, t0);
@@ -5034,11 +5039,11 @@ static void gen_dcbfep(DisasContext *ctx)
 static void gen_dcbi(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv EA, val;
 
-    CHK_SV;
+    CHK_SV(ctx);
     EA = tcg_temp_new();
     gen_set_access_type(ctx, ACCESS_CACHE);
     gen_addr_reg_index(ctx, EA);
@@ -5223,11 +5228,11 @@ static void gen_dcba(DisasContext *ctx)
 static void gen_mfsr(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
 
-    CHK_SV;
+    CHK_SV(ctx);
     t0 = tcg_const_tl(SR(ctx->opcode));
     gen_helper_load_sr(cpu_gpr[rD(ctx->opcode)], cpu_env, t0);
     tcg_temp_free(t0);
@@ -5238,11 +5243,11 @@ static void gen_mfsr(DisasContext *ctx)
 static void gen_mfsrin(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
 
-    CHK_SV;
+    CHK_SV(ctx);
     t0 = tcg_temp_new();
     tcg_gen_extract_tl(t0, cpu_gpr[rB(ctx->opcode)], 28, 4);
     gen_helper_load_sr(cpu_gpr[rD(ctx->opcode)], cpu_env, t0);
@@ -5254,11 +5259,11 @@ static void gen_mfsrin(DisasContext *ctx)
 static void gen_mtsr(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
 
-    CHK_SV;
+    CHK_SV(ctx);
     t0 = tcg_const_tl(SR(ctx->opcode));
     gen_helper_store_sr(cpu_env, t0, cpu_gpr[rS(ctx->opcode)]);
     tcg_temp_free(t0);
@@ -5269,10 +5274,10 @@ static void gen_mtsr(DisasContext *ctx)
 static void gen_mtsrin(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
-    CHK_SV;
+    CHK_SV(ctx);
 
     t0 = tcg_temp_new();
     tcg_gen_extract_tl(t0, cpu_gpr[rB(ctx->opcode)], 28, 4);
@@ -5288,11 +5293,11 @@ static void gen_mtsrin(DisasContext *ctx)
 static void gen_mfsr_64b(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
 
-    CHK_SV;
+    CHK_SV(ctx);
     t0 = tcg_const_tl(SR(ctx->opcode));
     gen_helper_load_sr(cpu_gpr[rD(ctx->opcode)], cpu_env, t0);
     tcg_temp_free(t0);
@@ -5303,11 +5308,11 @@ static void gen_mfsr_64b(DisasContext *ctx)
 static void gen_mfsrin_64b(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
 
-    CHK_SV;
+    CHK_SV(ctx);
     t0 = tcg_temp_new();
     tcg_gen_extract_tl(t0, cpu_gpr[rB(ctx->opcode)], 28, 4);
     gen_helper_load_sr(cpu_gpr[rD(ctx->opcode)], cpu_env, t0);
@@ -5319,11 +5324,11 @@ static void gen_mfsrin_64b(DisasContext *ctx)
 static void gen_mtsr_64b(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
 
-    CHK_SV;
+    CHK_SV(ctx);
     t0 = tcg_const_tl(SR(ctx->opcode));
     gen_helper_store_sr(cpu_env, t0, cpu_gpr[rS(ctx->opcode)]);
     tcg_temp_free(t0);
@@ -5334,11 +5339,11 @@ static void gen_mtsr_64b(DisasContext *ctx)
 static void gen_mtsrin_64b(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
 
-    CHK_SV;
+    CHK_SV(ctx);
     t0 = tcg_temp_new();
     tcg_gen_extract_tl(t0, cpu_gpr[rB(ctx->opcode)], 28, 4);
     gen_helper_store_sr(cpu_env, t0, cpu_gpr[rS(ctx->opcode)]);
@@ -5350,9 +5355,9 @@ static void gen_mtsrin_64b(DisasContext *ctx)
 static void gen_slbmte(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
 
     gen_helper_store_slb(cpu_env, cpu_gpr[rB(ctx->opcode)],
                          cpu_gpr[rS(ctx->opcode)]);
@@ -5362,9 +5367,9 @@ static void gen_slbmte(DisasContext *ctx)
 static void gen_slbmfee(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
 
     gen_helper_load_slb_esid(cpu_gpr[rS(ctx->opcode)], cpu_env,
                              cpu_gpr[rB(ctx->opcode)]);
@@ -5374,9 +5379,9 @@ static void gen_slbmfee(DisasContext *ctx)
 static void gen_slbmfev(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
 
     gen_helper_load_slb_vsid(cpu_gpr[rS(ctx->opcode)], cpu_env,
                              cpu_gpr[rB(ctx->opcode)]);
@@ -5416,9 +5421,9 @@ static void gen_slbfee_(DisasContext *ctx)
 static void gen_tlbia(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_HV;
+    CHK_HV(ctx);
 
     gen_helper_tlbia(cpu_env);
 #endif  /* defined(CONFIG_USER_ONLY) */
@@ -5428,13 +5433,13 @@ static void gen_tlbia(DisasContext *ctx)
 static void gen_tlbsync(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
 
     if (ctx->gtse) {
-        CHK_SV; /* If gtse is set then tlbsync is supervisor privileged */
+        CHK_SV(ctx); /* If gtse is set then tlbsync is supervisor privileged */
     } else {
-        CHK_HV; /* Else hypervisor privileged */
+        CHK_HV(ctx); /* Else hypervisor privileged */
     }
 
     /* BookS does both ptesync and tlbsync make tlbsync a nop for server */
@@ -5449,12 +5454,12 @@ static void gen_tlbsync(DisasContext *ctx)
 static void gen_slbia(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     uint32_t ih = (ctx->opcode >> 21) & 0x7;
     TCGv_i32 t0 = tcg_const_i32(ih);
 
-    CHK_SV;
+    CHK_SV(ctx);
 
     gen_helper_slbia(cpu_env, t0);
     tcg_temp_free_i32(t0);
@@ -5465,9 +5470,9 @@ static void gen_slbia(DisasContext *ctx)
 static void gen_slbie(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
 
     gen_helper_slbie(cpu_env, cpu_gpr[rB(ctx->opcode)]);
 #endif /* defined(CONFIG_USER_ONLY) */
@@ -5477,9 +5482,9 @@ static void gen_slbie(DisasContext *ctx)
 static void gen_slbieg(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
 
     gen_helper_slbieg(cpu_env, cpu_gpr[rB(ctx->opcode)]);
 #endif /* defined(CONFIG_USER_ONLY) */
@@ -5489,9 +5494,9 @@ static void gen_slbieg(DisasContext *ctx)
 static void gen_slbsync(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     gen_check_tlb_flush(ctx, true);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
@@ -5533,9 +5538,9 @@ static void gen_ecowx(DisasContext *ctx)
 static void gen_tlbld_6xx(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     gen_helper_6xx_tlbd(cpu_env, cpu_gpr[rB(ctx->opcode)]);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
@@ -5544,9 +5549,9 @@ static void gen_tlbld_6xx(DisasContext *ctx)
 static void gen_tlbli_6xx(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     gen_helper_6xx_tlbi(cpu_env, cpu_gpr[rB(ctx->opcode)]);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
@@ -5564,11 +5569,11 @@ static void gen_mfapidi(DisasContext *ctx)
 static void gen_tlbiva(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
 
-    CHK_SV;
+    CHK_SV(ctx);
     t0 = tcg_temp_new();
     gen_addr_reg_index(ctx, t0);
     gen_helper_tlbiva(cpu_env, cpu_gpr[rB(ctx->opcode)]);
@@ -5795,11 +5800,11 @@ GEN_MAC_HANDLER(mullhwu, 0x08, 0x0C);
 static void gen_mfdcr(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv dcrn;
 
-    CHK_SV;
+    CHK_SV(ctx);
     dcrn = tcg_const_tl(SPR(ctx->opcode));
     gen_helper_load_dcr(cpu_gpr[rD(ctx->opcode)], cpu_env, dcrn);
     tcg_temp_free(dcrn);
@@ -5810,11 +5815,11 @@ static void gen_mfdcr(DisasContext *ctx)
 static void gen_mtdcr(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv dcrn;
 
-    CHK_SV;
+    CHK_SV(ctx);
     dcrn = tcg_const_tl(SPR(ctx->opcode));
     gen_helper_store_dcr(cpu_env, dcrn, cpu_gpr[rS(ctx->opcode)]);
     tcg_temp_free(dcrn);
@@ -5826,9 +5831,9 @@ static void gen_mtdcr(DisasContext *ctx)
 static void gen_mfdcrx(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     gen_helper_load_dcr(cpu_gpr[rD(ctx->opcode)], cpu_env,
                         cpu_gpr[rA(ctx->opcode)]);
     /* Note: Rc update flag set leads to undefined state of Rc0 */
@@ -5840,9 +5845,9 @@ static void gen_mfdcrx(DisasContext *ctx)
 static void gen_mtdcrx(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     gen_helper_store_dcr(cpu_env, cpu_gpr[rA(ctx->opcode)],
                          cpu_gpr[rS(ctx->opcode)]);
     /* Note: Rc update flag set leads to undefined state of Rc0 */
@@ -5852,7 +5857,7 @@ static void gen_mtdcrx(DisasContext *ctx)
 /* dccci */
 static void gen_dccci(DisasContext *ctx)
 {
-    CHK_SV;
+    CHK_SV(ctx);
     /* interpreted as no-op */
 }
 
@@ -5860,11 +5865,11 @@ static void gen_dccci(DisasContext *ctx)
 static void gen_dcread(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv EA, val;
 
-    CHK_SV;
+    CHK_SV(ctx);
     gen_set_access_type(ctx, ACCESS_CACHE);
     EA = tcg_temp_new();
     gen_addr_reg_index(ctx, EA);
@@ -5889,14 +5894,14 @@ static void gen_icbt_40x(DisasContext *ctx)
 /* iccci */
 static void gen_iccci(DisasContext *ctx)
 {
-    CHK_SV;
+    CHK_SV(ctx);
     /* interpreted as no-op */
 }
 
 /* icread */
 static void gen_icread(DisasContext *ctx)
 {
-    CHK_SV;
+    CHK_SV(ctx);
     /* interpreted as no-op */
 }
 
@@ -5904,9 +5909,9 @@ static void gen_icread(DisasContext *ctx)
 static void gen_rfci_40x(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     /* Restore CPU state */
     gen_helper_40x_rfci(cpu_env);
     ctx->base.is_jmp = DISAS_EXIT;
@@ -5916,9 +5921,9 @@ static void gen_rfci_40x(DisasContext *ctx)
 static void gen_rfci(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     /* Restore CPU state */
     gen_helper_rfci(cpu_env);
     ctx->base.is_jmp = DISAS_EXIT;
@@ -5931,9 +5936,9 @@ static void gen_rfci(DisasContext *ctx)
 static void gen_rfdi(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     /* Restore CPU state */
     gen_helper_rfdi(cpu_env);
     ctx->base.is_jmp = DISAS_EXIT;
@@ -5944,9 +5949,9 @@ static void gen_rfdi(DisasContext *ctx)
 static void gen_rfmci(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     /* Restore CPU state */
     gen_helper_rfmci(cpu_env);
     ctx->base.is_jmp = DISAS_EXIT;
@@ -5959,9 +5964,9 @@ static void gen_rfmci(DisasContext *ctx)
 static void gen_tlbre_40x(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     switch (rB(ctx->opcode)) {
     case 0:
         gen_helper_4xx_tlbre_hi(cpu_gpr[rD(ctx->opcode)], cpu_env,
@@ -5982,11 +5987,11 @@ static void gen_tlbre_40x(DisasContext *ctx)
 static void gen_tlbsx_40x(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
 
-    CHK_SV;
+    CHK_SV(ctx);
     t0 = tcg_temp_new();
     gen_addr_reg_index(ctx, t0);
     gen_helper_4xx_tlbsx(cpu_gpr[rD(ctx->opcode)], cpu_env, t0);
@@ -6005,9 +6010,9 @@ static void gen_tlbsx_40x(DisasContext *ctx)
 static void gen_tlbwe_40x(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
 
     switch (rB(ctx->opcode)) {
     case 0:
@@ -6031,9 +6036,9 @@ static void gen_tlbwe_40x(DisasContext *ctx)
 static void gen_tlbre_440(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
 
     switch (rB(ctx->opcode)) {
     case 0:
@@ -6057,11 +6062,11 @@ static void gen_tlbre_440(DisasContext *ctx)
 static void gen_tlbsx_440(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
 
-    CHK_SV;
+    CHK_SV(ctx);
     t0 = tcg_temp_new();
     gen_addr_reg_index(ctx, t0);
     gen_helper_440_tlbsx(cpu_gpr[rD(ctx->opcode)], cpu_env, t0);
@@ -6080,9 +6085,9 @@ static void gen_tlbsx_440(DisasContext *ctx)
 static void gen_tlbwe_440(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     switch (rB(ctx->opcode)) {
     case 0:
     case 1:
@@ -6107,9 +6112,9 @@ static void gen_tlbwe_440(DisasContext *ctx)
 static void gen_tlbre_booke206(DisasContext *ctx)
 {
  #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-   CHK_SV;
+   CHK_SV(ctx);
     gen_helper_booke206_tlbre(cpu_env);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
@@ -6118,11 +6123,11 @@ static void gen_tlbre_booke206(DisasContext *ctx)
 static void gen_tlbsx_booke206(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
 
-    CHK_SV;
+    CHK_SV(ctx);
     if (rA(ctx->opcode)) {
         t0 = tcg_temp_new();
         tcg_gen_mov_tl(t0, cpu_gpr[rD(ctx->opcode)]);
@@ -6140,9 +6145,9 @@ static void gen_tlbsx_booke206(DisasContext *ctx)
 static void gen_tlbwe_booke206(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     gen_helper_booke206_tlbwe(cpu_env);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
@@ -6150,11 +6155,11 @@ static void gen_tlbwe_booke206(DisasContext *ctx)
 static void gen_tlbivax_booke206(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
 
-    CHK_SV;
+    CHK_SV(ctx);
     t0 = tcg_temp_new();
     gen_addr_reg_index(ctx, t0);
     gen_helper_booke206_tlbivax(cpu_env, t0);
@@ -6165,11 +6170,11 @@ static void gen_tlbivax_booke206(DisasContext *ctx)
 static void gen_tlbilx_booke206(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
 
-    CHK_SV;
+    CHK_SV(ctx);
     t0 = tcg_temp_new();
     gen_addr_reg_index(ctx, t0);
 
@@ -6197,11 +6202,11 @@ static void gen_tlbilx_booke206(DisasContext *ctx)
 static void gen_wrtee(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
 
-    CHK_SV;
+    CHK_SV(ctx);
     t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, cpu_gpr[rD(ctx->opcode)], (1 << MSR_EE));
     tcg_gen_andi_tl(cpu_msr, cpu_msr, ~(1 << MSR_EE));
@@ -6219,9 +6224,9 @@ static void gen_wrtee(DisasContext *ctx)
 static void gen_wrteei(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     if (ctx->opcode & 0x00008000) {
         tcg_gen_ori_tl(cpu_msr, cpu_msr, (1 << MSR_EE));
         /* Stop translation to have a chance to raise an exception */
@@ -6275,9 +6280,9 @@ static void gen_icbt_440(DisasContext *ctx)
 static void gen_msgclr(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_HV;
+    CHK_HV(ctx);
     if (is_book3s_arch2x(ctx)) {
         gen_helper_book3s_msgclr(cpu_env, cpu_gpr[rB(ctx->opcode)]);
     } else {
@@ -6289,9 +6294,9 @@ static void gen_msgclr(DisasContext *ctx)
 static void gen_msgsnd(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_HV;
+    CHK_HV(ctx);
     if (is_book3s_arch2x(ctx)) {
         gen_helper_book3s_msgsnd(cpu_gpr[rB(ctx->opcode)]);
     } else {
@@ -6304,9 +6309,9 @@ static void gen_msgsnd(DisasContext *ctx)
 static void gen_msgclrp(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     gen_helper_book3s_msgclrp(cpu_env, cpu_gpr[rB(ctx->opcode)]);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
@@ -6314,9 +6319,9 @@ static void gen_msgclrp(DisasContext *ctx)
 static void gen_msgsndp(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     gen_helper_book3s_msgsndp(cpu_env, cpu_gpr[rB(ctx->opcode)]);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
@@ -6325,9 +6330,9 @@ static void gen_msgsndp(DisasContext *ctx)
 static void gen_msgsync(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_HV;
+    CHK_HV(ctx);
 #endif /* defined(CONFIG_USER_ONLY) */
     /* interpreted as no-op */
 }
@@ -6438,7 +6443,7 @@ static void gen_tcheck(DisasContext *ctx)
 #define GEN_TM_PRIV_NOOP(name)                                 \
 static inline void gen_##name(DisasContext *ctx)               \
 {                                                              \
-    gen_priv_exception(ctx, POWERPC_EXCP_PRIV_OPC);            \
+    gen_priv_opc(ctx);                                         \
 }
 
 #else
@@ -6446,7 +6451,7 @@ static inline void gen_##name(DisasContext *ctx)               \
 #define GEN_TM_PRIV_NOOP(name)                                 \
 static inline void gen_##name(DisasContext *ctx)               \
 {                                                              \
-    CHK_SV;                                                    \
+    CHK_SV(ctx);                                               \
     if (unlikely(!ctx->tm_enabled)) {                          \
         gen_exception_err(ctx, POWERPC_EXCP_FU, FSCR_IC_TM);   \
         return;                                                \
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index 319513d001..0e893eafa7 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -901,7 +901,7 @@ static void gen_lfdepx(DisasContext *ctx)
 {
     TCGv EA;
     TCGv_i64 t0;
-    CHK_SV;
+    CHK_SV(ctx);
     if (unlikely(!ctx->fpu_enabled)) {
         gen_exception(ctx, POWERPC_EXCP_FPU);
         return;
@@ -1058,7 +1058,7 @@ static void gen_stfdepx(DisasContext *ctx)
 {
     TCGv EA;
     TCGv_i64 t0;
-    CHK_SV;
+    CHK_SV(ctx);
     if (unlikely(!ctx->fpu_enabled)) {
         gen_exception(ctx, POWERPC_EXCP_FPU);
         return;
-- 
2.36.1


