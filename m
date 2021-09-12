Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C81AE407F0A
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:47:22 +0200 (CEST)
Received: from localhost ([::1]:49288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTZZ-0006Nx-Sn
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTI6-0000Q5-Bb
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:29:18 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:33397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTI4-0005Ez-L4
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:29:18 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 192-20020a1c04c9000000b002f7a4ab0a49so3929135wme.0
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+aIhc+q7UsH/ZSd/qrpccF2QVRHNufiq35HZT6vh3Q8=;
 b=jIZO3+k1iLR3ggKxCIHIklmYIwJ2/MZdPLZbDTbGD4gsyYjzAT6sbOM4QHkDUEPfQ3
 AQ8W61LQkT2xbfkQelarsEiHSmNy6oAsxDNJndjhHFGUBUtbRFdJJuDJvVxqsS0AMquK
 MenzeUUYZUZnJuiE5CcSZmfw313U2jXfFas5o1NM9dzMGfNS/TnLgWai3eCWj6E++teR
 NyXFOU7ii/rMtHp5dAEAJOKZNdOOyyxRozG68zH/uyofJBXw9czO1QXjzDAlQsjEnnx9
 nWEQyFxvSHsqnQdGIVYgxzLl7FG6hhcFamxC0EZon0TQFaJ6RmpUxufQhR1DBc8DoBQe
 gyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+aIhc+q7UsH/ZSd/qrpccF2QVRHNufiq35HZT6vh3Q8=;
 b=OMYeOJX6JT4w/GvE5F7UcREt/xqSmhzwR6y9mw+88EUZLYsEyjEjHudWYYc+ZSIiCe
 YyTD16IKgoJWQLbJ1FfP/K1mMAtVIgJZTJN9mQAhRWspm42VadmCQ+6NaW3fuHDJwv7P
 GaxoNpqW0fZU+D+SealsdrnV2EO2+hJ9oYp//ZoqsZkNEFkOJkF3Qw4XBpBsqtI4l6eH
 sLgVoF6SP9cbQtb96zi/ToZtHadW8KJYtqDwxks3IP3U00kBrNavDSzVgtRk8tasuxb0
 VQm/GGYf6k3bLTOXPge+uHJQLHd4wz3ZbBNHDd1C0n8kxz0ptxBGcAqUJ04hToeKhlBh
 /C5Q==
X-Gm-Message-State: AOAM531v203c6tbOl/7nOPOx1HEqJfHJzYaBo6xSN59EBROAK79Y/+H1
 6iY+YyDF2kVcSmH7RVGjqdW8/rPmW1w=
X-Google-Smtp-Source: ABdhPJzXaLeBI0h0QrqdChZfXdbJ1S1qhRTnzMYkOHEwjVSmKy3XV6KLV+/YwDUg1iLJcbUzYPJODw==
X-Received: by 2002:a1c:f31a:: with SMTP id q26mr7430796wmq.159.1631467755180; 
 Sun, 12 Sep 2021 10:29:15 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id m184sm4726696wmm.3.2021.09.12.10.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:29:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 21/30] target/ppc: Restrict has_work() handlers to sysemu
 and TCG
Date: Sun, 12 Sep 2021 19:27:22 +0200
Message-Id: <20210912172731.789788-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
References: <20210912172731.789788-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict PowerPCCPUClass::has_work() and ppc_cpu_has_work()
- SysemuCPUOps::has_work() implementation - to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/ppc/cpu-qom.h  |  4 +++-
 target/ppc/cpu_init.c | 24 ++++++++++++++++++------
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 36110112506..ff2bafcde6f 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -188,8 +188,10 @@ struct PowerPCCPUClass {
     uint32_t flags;
     int bfd_mach;
     uint32_t l1_dcache_size, l1_icache_size;
-    bool (*has_work)(CPUState *cpu);
 #ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_TCG
+    bool (*has_work)(CPUState *cpu);
+#endif /* CONFIG_TCG */
     unsigned int gdb_num_sprs;
     const char *gdb_spr_xml;
 #endif
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 2f7d262b176..5c134adeea9 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7583,6 +7583,7 @@ static bool ppc_pvr_match_power7(PowerPCCPUClass *pcc, uint32_t pvr)
     return false;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool cpu_has_work_POWER7(CPUState *cs)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
@@ -7616,6 +7617,7 @@ static bool cpu_has_work_POWER7(CPUState *cs)
         return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
     }
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
 {
@@ -7629,7 +7631,6 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
     pcc->pcr_supported = PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER7;
     pcc->check_pow = check_pow_nocheck;
-    pcc->has_work = cpu_has_work_POWER7;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -7672,6 +7673,7 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
     pcc->lpcr_pm = LPCR_P7_PECE0 | LPCR_P7_PECE1 | LPCR_P7_PECE2;
     pcc->mmu_model = POWERPC_MMU_2_06;
 #if defined(CONFIG_SOFTMMU)
+    pcc->has_work = cpu_has_work_POWER7;
     pcc->hash64_opts = &ppc_hash64_opts_POWER7;
     pcc->lrg_decr_bits = 32;
 #endif
@@ -7742,6 +7744,7 @@ static bool ppc_pvr_match_power8(PowerPCCPUClass *pcc, uint32_t pvr)
     return false;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool cpu_has_work_POWER8(CPUState *cs)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
@@ -7783,6 +7786,7 @@ static bool cpu_has_work_POWER8(CPUState *cs)
         return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
     }
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
 {
@@ -7796,7 +7800,6 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
     pcc->pcr_supported = PCR_COMPAT_2_07 | PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER8;
     pcc->check_pow = check_pow_nocheck;
-    pcc->has_work = cpu_has_work_POWER8;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -7846,6 +7849,7 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
                    LPCR_P8_PECE3 | LPCR_P8_PECE4;
     pcc->mmu_model = POWERPC_MMU_2_07;
 #if defined(CONFIG_SOFTMMU)
+    pcc->has_work = cpu_has_work_POWER8;
     pcc->hash64_opts = &ppc_hash64_opts_POWER7;
     pcc->lrg_decr_bits = 32;
     pcc->n_host_threads = 8;
@@ -7939,6 +7943,7 @@ static bool ppc_pvr_match_power9(PowerPCCPUClass *pcc, uint32_t pvr)
     return false;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool cpu_has_work_POWER9(CPUState *cs)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
@@ -7996,6 +8001,7 @@ static bool cpu_has_work_POWER9(CPUState *cs)
         return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
     }
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
 {
@@ -8010,7 +8016,6 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
                          PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER9;
     pcc->check_pow = check_pow_nocheck;
-    pcc->has_work = cpu_has_work_POWER9;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -8059,6 +8064,7 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
     pcc->lpcr_pm = LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_OEE;
     pcc->mmu_model = POWERPC_MMU_3_00;
 #if defined(CONFIG_SOFTMMU)
+    pcc->has_work = cpu_has_work_POWER9;
     /* segment page size remain the same */
     pcc->hash64_opts = &ppc_hash64_opts_POWER7;
     pcc->radix_page_info = &POWER9_radix_page_info;
@@ -8147,6 +8153,7 @@ static bool ppc_pvr_match_power10(PowerPCCPUClass *pcc, uint32_t pvr)
     return false;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool cpu_has_work_POWER10(CPUState *cs)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
@@ -8204,6 +8211,7 @@ static bool cpu_has_work_POWER10(CPUState *cs)
         return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
     }
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
 {
@@ -8219,7 +8227,6 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
                          PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER10;
     pcc->check_pow = check_pow_nocheck;
-    pcc->has_work = cpu_has_work_POWER10;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -8271,6 +8278,7 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
     pcc->lpcr_pm = LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_OEE;
     pcc->mmu_model = POWERPC_MMU_3_00;
 #if defined(CONFIG_SOFTMMU)
+    pcc->has_work = cpu_has_work_POWER10;
     /* segment page size remain the same */
     pcc->hash64_opts = &ppc_hash64_opts_POWER7;
     pcc->radix_page_info = &POWER10_radix_page_info;
@@ -8786,6 +8794,7 @@ static void ppc_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.nip = value;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool cpu_has_work_default(CPUState *cs)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
@@ -8801,6 +8810,7 @@ static bool ppc_cpu_has_work(CPUState *cs)
 
     return pcc->has_work(cs);
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 static void ppc_cpu_reset(DeviceState *dev)
 {
@@ -9021,6 +9031,7 @@ static const struct TCGCPUOps ppc_tcg_ops = {
   .tlb_fill = ppc_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+  .has_work = ppc_cpu_has_work,
   .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
   .do_interrupt = ppc_cpu_do_interrupt,
   .cpu_exec_enter = ppc_cpu_exec_enter,
@@ -9041,13 +9052,11 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_unrealize(dc, ppc_cpu_unrealize,
                                       &pcc->parent_unrealize);
     pcc->pvr_match = ppc_pvr_match_default;
-    pcc->has_work = cpu_has_work_default;
     device_class_set_props(dc, ppc_cpu_properties);
 
     device_class_set_parent_reset(dc, ppc_cpu_reset, &pcc->parent_reset);
 
     cc->class_by_name = ppc_cpu_class_by_name;
-    cc->has_work = ppc_cpu_has_work;
     cc->dump_state = ppc_cpu_dump_state;
     cc->set_pc = ppc_cpu_set_pc;
     cc->gdb_read_register = ppc_cpu_gdb_read_register;
@@ -9078,6 +9087,9 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
 
 #ifdef CONFIG_TCG
     cc->tcg_ops = &ppc_tcg_ops;
+#ifndef CONFIG_USER_ONLY
+    pcc->has_work = cpu_has_work_default;
+#endif
 #endif /* CONFIG_TCG */
 }
 
-- 
2.31.1


