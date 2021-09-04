Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E71400D98
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 01:58:36 +0200 (CEST)
Received: from localhost ([::1]:53066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMfYR-0000wr-BV
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 19:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfWT-0006OV-7q
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:56:33 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfWR-0007oy-JX
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:56:32 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 u26-20020a05600c441a00b002f66b2d8603so2190349wmn.4
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 16:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TN+Zrhaefhs3QjxEX21PjGTtA8lFVaKomYkrzGxUkf0=;
 b=I7M3mepbjiSkIG0BIQcp/6w/8u0+quQ6gbgdrFnu6LkLzkkpIBWm5QUJYfvsSOGMfJ
 QAUFAGM2Z4jitnrbO4wAWbcXKiMhTzSw+XQLVUdIT+v5B19AixylKxhSXNtjzHM3b0gC
 dAPiNRhPPnRvqWNs+MDm6B5WleHiPTEy+McREc4sVqo9beMN7mKe5wAhT8JWa5Bgfzao
 95QF7RYmOnhPSjCCJed2hc9m0Ip3kLEe2syG96qBe+0+lJs11ofrv5j8RPYagLuHM52b
 kMwoUPY8eVWtv9rwLI8gIJVRkJLB3iiSvulPLwwYposqVB6pr/nLenXk2pxJ9IA/dW42
 DXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TN+Zrhaefhs3QjxEX21PjGTtA8lFVaKomYkrzGxUkf0=;
 b=a6vXI5Gkffd3UMJulAiwIj06Qwo/cX00yxFA/cPoV7+E1fam9Jjz6OmT0vsXaz9zxb
 ptg/jWuAIe80u3BlhIvT0UkfbRAgXBYuBvv7fB2NJhnMyKtRJgutTAB0hR9hzms09qoQ
 RLw763QL276JD6riYQ65y/7xX5P28ofBFt7eWRGEuzl6bXvzR8grRsJMiRdq5FYl+eQe
 4UzPz3uJ9qnjxSIXbsiuDXLu2KrW0dvDEIqu9AkfozKDsmMmMZwvWQZEa84qmm1R1dfq
 56s8td58YHiMNczvpm31lyZWmBCYrnyc1z9NdQEUZbite8ObUtNOTIX1/88fs08XAEtQ
 3THw==
X-Gm-Message-State: AOAM532IvKp0TG6hRXgD7H3WE+XjTq3T8+JhxkJ06f4QgQg4DPtCOxAM
 YLeIRpm7yNUaJAKMC7MRWDHL3wkX0YE=
X-Google-Smtp-Source: ABdhPJzJCg/4VPH5vk5m8WfUjdWWc4RjiN/HoFZaDI3OFfUIA0EA6OkGcVq4297lEkUMvUpiSkgFEA==
X-Received: by 2002:a1c:ed13:: with SMTP id l19mr4941636wmh.48.1630799790026; 
 Sat, 04 Sep 2021 16:56:30 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id w20sm764545wrg.1.2021.09.04.16.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 16:56:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/24] target/hppa: Restrict cpu_exec_interrupt() handler
 to sysemu
Date: Sun,  5 Sep 2021 01:55:27 +0200
Message-Id: <20210904235542.1092641-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210904235542.1092641-1-f4bug@amsat.org>
References: <20210904235542.1092641-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/hppa/cpu.h        | 4 ++--
 target/hppa/cpu.c        | 2 +-
 target/hppa/int_helper.c | 7 ++-----
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 748270bfa31..7854675b903 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -325,13 +325,13 @@ int cpu_hppa_signal_handler(int host_signum, void *pinfo, void *puc);
 hwaddr hppa_cpu_get_phys_page_debug(CPUState *cs, vaddr addr);
 int hppa_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int hppa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-void hppa_cpu_do_interrupt(CPUState *cpu);
-bool hppa_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void hppa_cpu_dump_state(CPUState *cs, FILE *f, int);
 bool hppa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
 #ifndef CONFIG_USER_ONLY
+void hppa_cpu_do_interrupt(CPUState *cpu);
+bool hppa_cpu_exec_interrupt(CPUState *cpu, int int_req);
 int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
                               int type, hwaddr *pphys, int *pprot);
 extern const MemoryRegionOps hppa_io_eir_ops;
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 2eace4ee124..e8edd189bfc 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -144,10 +144,10 @@ static const struct SysemuCPUOps hppa_sysemu_ops = {
 static const struct TCGCPUOps hppa_tcg_ops = {
     .initialize = hppa_translate_init,
     .synchronize_from_tb = hppa_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
     .tlb_fill = hppa_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
     .do_interrupt = hppa_cpu_do_interrupt,
     .do_unaligned_access = hppa_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/hppa/int_helper.c b/target/hppa/int_helper.c
index 349495d3610..13073ae2bda 100644
--- a/target/hppa/int_helper.c
+++ b/target/hppa/int_helper.c
@@ -88,7 +88,6 @@ void HELPER(write_eiem)(CPUHPPAState *env, target_ureg val)
     eval_interrupt(env_archcpu(env));
     qemu_mutex_unlock_iothread();
 }
-#endif /* !CONFIG_USER_ONLY */
 
 void hppa_cpu_do_interrupt(CPUState *cs)
 {
@@ -100,7 +99,6 @@ void hppa_cpu_do_interrupt(CPUState *cs)
     uint64_t iasq_f = env->iasq_f;
     uint64_t iasq_b = env->iasq_b;
 
-#ifndef CONFIG_USER_ONLY
     target_ureg old_psw;
 
     /* As documented in pa2.0 -- interruption handling.  */
@@ -187,7 +185,6 @@ void hppa_cpu_do_interrupt(CPUState *cs)
     env->iaoq_b = env->iaoq_f + 4;
     env->iasq_f = 0;
     env->iasq_b = 0;
-#endif
 
     if (qemu_loglevel_mask(CPU_LOG_INT)) {
         static const char * const names[] = {
@@ -248,7 +245,6 @@ void hppa_cpu_do_interrupt(CPUState *cs)
 
 bool hppa_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
-#ifndef CONFIG_USER_ONLY
     HPPACPU *cpu = HPPA_CPU(cs);
     CPUHPPAState *env = &cpu->env;
 
@@ -258,6 +254,7 @@ bool hppa_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
         hppa_cpu_do_interrupt(cs);
         return true;
     }
-#endif
     return false;
 }
+
+#endif /* !CONFIG_USER_ONLY */
-- 
2.31.1


