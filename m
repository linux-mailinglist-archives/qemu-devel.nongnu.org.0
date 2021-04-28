Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF3C36DDF7
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:13:44 +0200 (CEST)
Received: from localhost ([::1]:53808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnkt-0007dt-PQ
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbncT-0007kc-9K
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:05:01 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:45639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbncR-0005tE-7S
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:05:00 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 n4-20020a05600c4f84b029013151278decso9223526wmq.4
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4PMaVU/rULsBIbK+fWQHt+kTaSUIcMpx29k+kaC3g04=;
 b=O3dgw1aR8HXd6W6F5fRMptSZNZgzpUxAu62q6JxIGlKuwVPfn1O668in3swXJk1kLa
 ciuU2FshXphykD9nyzZ7qsl4Pi7sk5EeMZPfYjZIWJ16hL6xVdm8T1zCaIptyGMhcg00
 Ghbtu0LfR3zN7xeg8aq1FKC1NF8aTNYII7PWbFdnXgr3paSsN9BETIunLbt8QfmvLHKu
 6J+plrTLnzuws58azKLKEBxcjs3L2QgqqGBKhMaJx+AsbGrxA1rwYO07LGb/tI24vbqZ
 j2gX+vgBJnRiz403f80Gvov2T0PkS5u9HaIj/FMDJrWYLKkJ2VQ1Vl2Xpr6ryAnCKav8
 UR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4PMaVU/rULsBIbK+fWQHt+kTaSUIcMpx29k+kaC3g04=;
 b=X6vhzQZR6/Yn9L5fVlwGq3nuwv55hyzWBOnxrXcCYL1qWkPS4ToaZV3O4knHSrTXuh
 1UVBK1n4tTESeNyc/7ysWFTthjRRYnoXi0DQPIKlTYhD6C3Dhxhuu5YLNGKwBXME/2Y6
 pQSa8LXR3TEKH0IXe9WxAqBYE/Q6/CuliT+4gr9G4+Q6ot+Df9U0eCriTkzOSFDr+/dg
 dnqBpMoIjKhXgCeWuKVH4dvky/vuDrsmEhjfslY7EGIAPghs/ytJC9rthlSPZX3k66D6
 3z6Ses3Zgrk7dOQPmOqV1PUrQ7kc0rTVm4dyiSqRE+T0WkuXHv+hv3FY6FnVzPY97Cin
 oSsw==
X-Gm-Message-State: AOAM532SOQZCcSn+1YzD3yIWNkz3rjmT9g7rJKteVz0cb/EHsi2rzoOI
 V6OKPSqazv6QTc9Rq1qEL37lO8dINmRjrg==
X-Google-Smtp-Source: ABdhPJxN5yuYAcgBvdug6jZoIdwisnqxMtW5FZv34PLH+8/idfRIrGQBmtUnrxgSoSQ6eaLltpjXrQ==
X-Received: by 2002:a05:600c:19d1:: with SMTP id
 u17mr31365086wmq.111.1619629497536; 
 Wed, 28 Apr 2021 10:04:57 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id k15sm353527wro.87.2021.04.28.10.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:04:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/30] target/mips: Restrict mips_cpu_dump_state() to cpu.c
Date: Wed, 28 Apr 2021 19:03:46 +0200
Message-Id: <20210428170410.479308-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428170410.479308-1-f4bug@amsat.org>
References: <20210428170410.479308-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As mips_cpu_dump_state() is only used once to initialize the
CPUClass::dump_state handler, we can move it to cpu.c to keep
it symbol local.
Beside, this handler is used by all accelerators, while the
translate.c file targets TCG.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h  |  1 -
 target/mips/cpu.c       | 77 +++++++++++++++++++++++++++++++++++++++++
 target/mips/translate.c | 77 -----------------------------------------
 3 files changed, 77 insertions(+), 78 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 37f54a8b3fc..57072a941e7 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -79,7 +79,6 @@ extern const int mips_defs_number;
 
 void mips_cpu_do_interrupt(CPUState *cpu);
 bool mips_cpu_exec_interrupt(CPUState *cpu, int int_req);
-void mips_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr mips_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int mips_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int mips_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index ed9552ebeb7..232f701b836 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -145,6 +145,83 @@ void cpu_mips_store_cause(CPUMIPSState *env, target_ulong val)
 
 #endif /* !CONFIG_USER_ONLY */
 
+static void fpu_dump_state(CPUMIPSState *env, FILE *f, int flags)
+{
+    int i;
+    int is_fpu64 = !!(env->hflags & MIPS_HFLAG_F64);
+
+#define printfpr(fp)                                                    \
+    do {                                                                \
+        if (is_fpu64)                                                   \
+            qemu_fprintf(f, "w:%08x d:%016" PRIx64                      \
+                         " fd:%13g fs:%13g psu: %13g\n",                \
+                         (fp)->w[FP_ENDIAN_IDX], (fp)->d,               \
+                         (double)(fp)->fd,                              \
+                         (double)(fp)->fs[FP_ENDIAN_IDX],               \
+                         (double)(fp)->fs[!FP_ENDIAN_IDX]);             \
+        else {                                                          \
+            fpr_t tmp;                                                  \
+            tmp.w[FP_ENDIAN_IDX] = (fp)->w[FP_ENDIAN_IDX];              \
+            tmp.w[!FP_ENDIAN_IDX] = ((fp) + 1)->w[FP_ENDIAN_IDX];       \
+            qemu_fprintf(f, "w:%08x d:%016" PRIx64                      \
+                         " fd:%13g fs:%13g psu:%13g\n",                 \
+                         tmp.w[FP_ENDIAN_IDX], tmp.d,                   \
+                         (double)tmp.fd,                                \
+                         (double)tmp.fs[FP_ENDIAN_IDX],                 \
+                         (double)tmp.fs[!FP_ENDIAN_IDX]);               \
+        }                                                               \
+    } while (0)
+
+
+    qemu_fprintf(f,
+                 "CP1 FCR0 0x%08x  FCR31 0x%08x  SR.FR %d  fp_status 0x%02x\n",
+                 env->active_fpu.fcr0, env->active_fpu.fcr31, is_fpu64,
+                 get_float_exception_flags(&env->active_fpu.fp_status));
+    for (i = 0; i < 32; (is_fpu64) ? i++ : (i += 2)) {
+        qemu_fprintf(f, "%3s: ", fregnames[i]);
+        printfpr(&env->active_fpu.fpr[i]);
+    }
+
+#undef printfpr
+}
+
+static void mips_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+{
+    MIPSCPU *cpu = MIPS_CPU(cs);
+    CPUMIPSState *env = &cpu->env;
+    int i;
+
+    qemu_fprintf(f, "pc=0x" TARGET_FMT_lx " HI=0x" TARGET_FMT_lx
+                 " LO=0x" TARGET_FMT_lx " ds %04x "
+                 TARGET_FMT_lx " " TARGET_FMT_ld "\n",
+                 env->active_tc.PC, env->active_tc.HI[0], env->active_tc.LO[0],
+                 env->hflags, env->btarget, env->bcond);
+    for (i = 0; i < 32; i++) {
+        if ((i & 3) == 0) {
+            qemu_fprintf(f, "GPR%02d:", i);
+        }
+        qemu_fprintf(f, " %s " TARGET_FMT_lx,
+                     regnames[i], env->active_tc.gpr[i]);
+        if ((i & 3) == 3) {
+            qemu_fprintf(f, "\n");
+        }
+    }
+
+    qemu_fprintf(f, "CP0 Status  0x%08x Cause   0x%08x EPC    0x"
+                 TARGET_FMT_lx "\n",
+                 env->CP0_Status, env->CP0_Cause, env->CP0_EPC);
+    qemu_fprintf(f, "    Config0 0x%08x Config1 0x%08x LLAddr 0x%016"
+                 PRIx64 "\n",
+                 env->CP0_Config0, env->CP0_Config1, env->CP0_LLAddr);
+    qemu_fprintf(f, "    Config2 0x%08x Config3 0x%08x\n",
+                 env->CP0_Config2, env->CP0_Config3);
+    qemu_fprintf(f, "    Config4 0x%08x Config5 0x%08x\n",
+                 env->CP0_Config4, env->CP0_Config5);
+    if ((flags & CPU_DUMP_FPU) && (env->hflags & MIPS_HFLAG_FPU)) {
+        fpu_dump_state(env, f, flags);
+    }
+}
+
 static const char * const excp_names[EXCP_LAST + 1] = {
     [EXCP_RESET] = "reset",
     [EXCP_SRESET] = "soft reset",
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 8d686e90954..f0ae3716022 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -25586,83 +25586,6 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
     translator_loop(&mips_tr_ops, &ctx.base, cs, tb, max_insns);
 }
 
-static void fpu_dump_state(CPUMIPSState *env, FILE * f, int flags)
-{
-    int i;
-    int is_fpu64 = !!(env->hflags & MIPS_HFLAG_F64);
-
-#define printfpr(fp)                                                    \
-    do {                                                                \
-        if (is_fpu64)                                                   \
-            qemu_fprintf(f, "w:%08x d:%016" PRIx64                      \
-                         " fd:%13g fs:%13g psu: %13g\n",                \
-                         (fp)->w[FP_ENDIAN_IDX], (fp)->d,               \
-                         (double)(fp)->fd,                              \
-                         (double)(fp)->fs[FP_ENDIAN_IDX],               \
-                         (double)(fp)->fs[!FP_ENDIAN_IDX]);             \
-        else {                                                          \
-            fpr_t tmp;                                                  \
-            tmp.w[FP_ENDIAN_IDX] = (fp)->w[FP_ENDIAN_IDX];              \
-            tmp.w[!FP_ENDIAN_IDX] = ((fp) + 1)->w[FP_ENDIAN_IDX];       \
-            qemu_fprintf(f, "w:%08x d:%016" PRIx64                      \
-                         " fd:%13g fs:%13g psu:%13g\n",                 \
-                         tmp.w[FP_ENDIAN_IDX], tmp.d,                   \
-                         (double)tmp.fd,                                \
-                         (double)tmp.fs[FP_ENDIAN_IDX],                 \
-                         (double)tmp.fs[!FP_ENDIAN_IDX]);               \
-        }                                                               \
-    } while (0)
-
-
-    qemu_fprintf(f,
-                 "CP1 FCR0 0x%08x  FCR31 0x%08x  SR.FR %d  fp_status 0x%02x\n",
-                 env->active_fpu.fcr0, env->active_fpu.fcr31, is_fpu64,
-                 get_float_exception_flags(&env->active_fpu.fp_status));
-    for (i = 0; i < 32; (is_fpu64) ? i++ : (i += 2)) {
-        qemu_fprintf(f, "%3s: ", fregnames[i]);
-        printfpr(&env->active_fpu.fpr[i]);
-    }
-
-#undef printfpr
-}
-
-void mips_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-{
-    MIPSCPU *cpu = MIPS_CPU(cs);
-    CPUMIPSState *env = &cpu->env;
-    int i;
-
-    qemu_fprintf(f, "pc=0x" TARGET_FMT_lx " HI=0x" TARGET_FMT_lx
-                 " LO=0x" TARGET_FMT_lx " ds %04x "
-                 TARGET_FMT_lx " " TARGET_FMT_ld "\n",
-                 env->active_tc.PC, env->active_tc.HI[0], env->active_tc.LO[0],
-                 env->hflags, env->btarget, env->bcond);
-    for (i = 0; i < 32; i++) {
-        if ((i & 3) == 0) {
-            qemu_fprintf(f, "GPR%02d:", i);
-        }
-        qemu_fprintf(f, " %s " TARGET_FMT_lx,
-                     regnames[i], env->active_tc.gpr[i]);
-        if ((i & 3) == 3) {
-            qemu_fprintf(f, "\n");
-        }
-    }
-
-    qemu_fprintf(f, "CP0 Status  0x%08x Cause   0x%08x EPC    0x"
-                 TARGET_FMT_lx "\n",
-                 env->CP0_Status, env->CP0_Cause, env->CP0_EPC);
-    qemu_fprintf(f, "    Config0 0x%08x Config1 0x%08x LLAddr 0x%016"
-                 PRIx64 "\n",
-                 env->CP0_Config0, env->CP0_Config1, env->CP0_LLAddr);
-    qemu_fprintf(f, "    Config2 0x%08x Config3 0x%08x\n",
-                 env->CP0_Config2, env->CP0_Config3);
-    qemu_fprintf(f, "    Config4 0x%08x Config5 0x%08x\n",
-                 env->CP0_Config4, env->CP0_Config5);
-    if ((flags & CPU_DUMP_FPU) && (env->hflags & MIPS_HFLAG_FPU)) {
-        fpu_dump_state(env, f, flags);
-    }
-}
-
 void mips_tcg_init(void)
 {
     int i;
-- 
2.26.3


