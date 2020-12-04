Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 988E02CF6C9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 23:34:22 +0100 (CET)
Received: from localhost ([::1]:38662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klJef-0008G3-Mm
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 17:34:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1klJXD-0002Yd-Nx
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 17:26:39 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:37587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1klJXB-0007x2-37
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 17:26:38 -0500
Received: by mail-ej1-x644.google.com with SMTP id ga15so10921109ejb.4
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 14:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F/yHM9sV3U4iOKbuGdiODvNyEhg16gBWDYuuHF5veyA=;
 b=PhGBhwcg3ofPOv6DTFo2X+ZUN0ufMzPe4hKyEclqi/chkjlMar0QpjeRMQO+hOTMXQ
 t2DsLBWcGNvJP+sbbUDKgXdDepAyHVBIt3aY7FYJmMSdeJLUhWSVj2OOkGfKYbAD5JLR
 eRFkSOrCu+vrLK671n7qsyIpbyAG9CZ3eSq+/Vwq0v6EI8h20VVZaN49UJS/Je+E38dT
 WokKLGcHFC4Cpqx6I8w6G/2eIM+uno9srmvMogmrFkaf8wh8yMvy1n0DgkknrN2ZzZyv
 VpPmxqOboLRa9+iuxyoNNLxBsm2WUyyZLF8iIZyEZb8Mzj1+6yEeP1NQaqdUmmS5nKKI
 wgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=F/yHM9sV3U4iOKbuGdiODvNyEhg16gBWDYuuHF5veyA=;
 b=XPLIgn3Jq5JXSl80dLj5lclhYAkAAvsHg3sNZEs5vkFtv/SLZhtWFoIyH5J4E896W0
 5jgZCwByxnAbmlmJKBE6b9IlVEys4UGruGclzr2H6gfgDbJ/VWK7+6eP9mcxR7aiQGQ7
 7SEdtj3cTd77J+6DFr22plMh3daiFhZMXNRR8kSA6pstuN0QUdL5alvet4xJJuZ0fKfq
 4/JNKApm7V2lePuraKg3u1arNaT3y3DR9hmeeoYoxLW331+n9wnHPgnivkhAW7IfFr6J
 /OmgtzemhuGh+T3l1d1NcJNHINPWilY+AvKMtbFecqamS7Ue//fM2/40qQIipWzcNmKP
 hFhA==
X-Gm-Message-State: AOAM533IiT3m5SfqwQr++5/60izecWE6yyAenqLX2x9cgCfGwHjUegzF
 xWyL3jDZbtqs1w/R63jwxTQ=
X-Google-Smtp-Source: ABdhPJy/1Dr9Q3mUc80fvxJoOQA59NnPMM6x7RqcK7vXA2G2GjPSSEPh4qIthtl1EockkCuvvmqvDw==
X-Received: by 2002:a17:907:6e9:: with SMTP id
 yh9mr9135349ejb.131.1607120795708; 
 Fri, 04 Dec 2020 14:26:35 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id ng1sm3123587ejb.112.2020.12.04.14.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 14:26:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhc@lemote.com>,
 qemu-devel@nongnu.org
Subject: [PATCH 2/5] target/mips: Introduce ase_mt_available() helper
Date: Fri,  4 Dec 2020 23:26:19 +0100
Message-Id: <20201204222622.2743175-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201204222622.2743175-1-f4bug@amsat.org>
References: <20201204222622.2743175-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x644.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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

Instead of accessing CP0_Config3 directly and checking
the 'Multi-Threading Present' bit, introduce an helper
to simplify code review.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.h        | 7 +++++++
 hw/mips/cps.c            | 3 +--
 target/mips/cp0_helper.c | 2 +-
 target/mips/cpu.c        | 2 +-
 target/mips/helper.c     | 2 +-
 target/mips/translate.c  | 2 +-
 6 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 2639b0ea06c..82c60a34751 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1289,6 +1289,13 @@ int cpu_mips_signal_handler(int host_signum, void *pinfo, void *puc);
 
 bool cpu_supports_cps_smp(const char *cpu_type);
 bool cpu_supports_isa(const char *cpu_type, uint64_t isa);
+
+/* Check presence of multi-threading ASE implementation */
+static inline bool ase_mt_available(CPUMIPSState *env)
+{
+    return env->CP0_Config3 & (1 << CP0C3_MT);
+}
+
 void cpu_set_exception_base(int vp_index, target_ulong address);
 
 /* mips_int.c */
diff --git a/hw/mips/cps.c b/hw/mips/cps.c
index 962b1b0b87c..7a0d289efaf 100644
--- a/hw/mips/cps.c
+++ b/hw/mips/cps.c
@@ -58,8 +58,7 @@ static void main_cpu_reset(void *opaque)
 
 static bool cpu_mips_itu_supported(CPUMIPSState *env)
 {
-    bool is_mt = (env->CP0_Config5 & (1 << CP0C5_VP)) ||
-                 (env->CP0_Config3 & (1 << CP0C3_MT));
+    bool is_mt = (env->CP0_Config5 & (1 << CP0C5_VP)) || ase_mt_available(env);
 
     return is_mt && !kvm_enabled();
 }
diff --git a/target/mips/cp0_helper.c b/target/mips/cp0_helper.c
index caaaefcc8ad..9718c93d18c 100644
--- a/target/mips/cp0_helper.c
+++ b/target/mips/cp0_helper.c
@@ -1166,7 +1166,7 @@ void helper_mtc0_entryhi(CPUMIPSState *env, target_ulong arg1)
     old = env->CP0_EntryHi;
     val = (arg1 & mask) | (old & ~mask);
     env->CP0_EntryHi = val;
-    if (env->CP0_Config3 & (1 << CP0C3_MT)) {
+    if (ase_mt_available(env)) {
         sync_c0_entryhi(env, env->current_tc);
     }
     /* If the ASID changes, flush qemu's TLB.  */
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 76d50b00b42..c03e5acf5bc 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -74,7 +74,7 @@ static bool mips_cpu_has_work(CPUState *cs)
     }
 
     /* MIPS-MT has the ability to halt the CPU.  */
-    if (env->CP0_Config3 & (1 << CP0C3_MT)) {
+    if (ase_mt_available(env)) {
         /*
          * The QEMU model will issue an _WAKE request whenever the CPUs
          * should be woken up.
diff --git a/target/mips/helper.c b/target/mips/helper.c
index cc46ea887e5..608fe1512a3 100644
--- a/target/mips/helper.c
+++ b/target/mips/helper.c
@@ -419,7 +419,7 @@ void cpu_mips_store_status(CPUMIPSState *env, target_ulong val)
         tlb_flush(env_cpu(env));
     }
 #endif
-    if (env->CP0_Config3 & (1 << CP0C3_MT)) {
+    if (ase_mt_available(env)) {
         sync_c0_status(env, env, env->current_tc);
     } else {
         compute_hflags(env);
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 0db032fc5fb..ee45dce9a50 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -31921,7 +31921,7 @@ void cpu_state_reset(CPUMIPSState *env)
 
     cpu_mips_store_count(env, 1);
 
-    if (env->CP0_Config3 & (1 << CP0C3_MT)) {
+    if (ase_mt_available(env)) {
         int i;
 
         /* Only TC0 on VPE 0 starts as active.  */
-- 
2.26.2


