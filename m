Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70143ACFC
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 04:29:14 +0200 (CEST)
Received: from localhost ([::1]:39784 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haA3d-0006Yz-Sx
	for lists+qemu-devel@lfdr.de; Sun, 09 Jun 2019 22:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53090)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1ha9e0-0006A0-5I
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 22:02:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ha9dy-0001jt-Pz
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 22:02:44 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:46681)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ha9dy-0001jX-JX
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 22:02:42 -0400
Received: by mail-pf1-x443.google.com with SMTP id 81so4300964pfy.13
 for <qemu-devel@nongnu.org>; Sun, 09 Jun 2019 19:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1kOvtkiHCUjgMw+1Z+kL1S4IV3z9pyM77bVL+IO/D5Y=;
 b=ejmNVx0j3YBATsKYkyr8gF7pUdVtrI4/ENAMoUGxFejgCme2/A1Hn1ei69Qg2gRWFk
 OqBdUWAFSw4mh4Oe9sc0ceZc1ABa9Oz6UqfWdNPNsIsIOaB1Hm5UrGWNcuSKrACFpjr4
 YkbsM+pk4hWLdD0jlnFwcJYW5G/RHen6WgJwpEMxKG5fhszuES+gQY2CEpBzihLJASrr
 5vVG2HMbptgacW9mwU6scRiEZPiFpYd18C4w/GIQ3L1AiikgcD6WYbm4ubQuj2extxC2
 xBUceqioJgd2LYkJ5zuzFi7xWbHlij1xcPbhnKxSJ5BsMPWCywVpHIzkyUOJeEDfjH3g
 V3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1kOvtkiHCUjgMw+1Z+kL1S4IV3z9pyM77bVL+IO/D5Y=;
 b=irLPQtNCiQeMyMAhHilqPzBc99Y2MCrsX8sfLaeUAulV728UslTdoFFzLr0XIj/RUn
 bfDzYoSAa92Qve1wltJ8T5WfK1AvcxNhOM9Wg7J+f0NtVzjlUxaoi4rCb2dCwzziFD5g
 C1CTPUfvgp68YbE3V41gBkVzrE/1CECAz52dMrKnQ/iUsQiuNPrmfrXQvuXCN6beQQLQ
 xhPpOo6/vmzhfYYJqP5QSSZcaHlpQ+4yi8crl0Rh20ivrPM39BKMwq5+erx/ST8nx/R2
 YGWwIXjVJlm8QOQ/OiwQBHHEfmchADJUUDA5gvwmt3JmzWgV4xuvGILvpC601HpFxW1w
 agjA==
X-Gm-Message-State: APjAAAVyg5YhUTc43zY7q1pCOU+FvyFmX9eYBr3mv/3RQN8I+czEtV7E
 GchwEyVI0hQbvkeEXSVliGvLho5ooDc=
X-Google-Smtp-Source: APXvYqxoGumDirRsQdCq4LtEtrX8SBX64/GlqKsy6ip9EFMEjETJu0UX8GG8h7pV+LyfMr/FF0t3OQ==
X-Received: by 2002:a63:225b:: with SMTP id t27mr14142446pgm.25.1560132161054; 
 Sun, 09 Jun 2019 19:02:41 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
 [97.113.13.231])
 by smtp.gmail.com with ESMTPSA id l63sm9749013pfl.181.2019.06.09.19.02.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 09 Jun 2019 19:02:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun,  9 Jun 2019 19:01:56 -0700
Message-Id: <20190610020218.9228-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190610020218.9228-1-richard.henderson@linaro.org>
References: <20190610020218.9228-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-devel] [PULL 17/39] target/microblaze: Use env_cpu,
 env_archcpu
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cleanup in the boilerplate that each target must define.
Replace mb_env_get_cpu with env_archcpu.  The combination
CPU(mb_env_get_cpu) should have used ENV_GET_CPU to begin;
use env_cpu now.

Move cpu_mmu_index below the include of "exec/cpu-all.h",
so that the definition of env_archcpu is available.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/cpu.h          | 35 ++++++++++++++------------------
 linux-user/microblaze/cpu_loop.c |  2 +-
 target/microblaze/mmu.c          |  5 ++---
 target/microblaze/op_helper.c    |  2 +-
 target/microblaze/translate.c    |  2 +-
 5 files changed, 20 insertions(+), 26 deletions(-)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index 6e68e00e1f..8402cc81f6 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -310,11 +310,6 @@ struct MicroBlazeCPU {
     CPUMBState env;
 };
 
-static inline MicroBlazeCPU *mb_env_get_cpu(CPUMBState *env)
-{
-    return container_of(env, MicroBlazeCPU, env);
-}
-
 #define ENV_OFFSET offsetof(MicroBlazeCPU, env)
 
 void mb_cpu_do_interrupt(CPUState *cs);
@@ -344,21 +339,6 @@ int cpu_mb_signal_handler(int host_signum, void *pinfo,
 #define MMU_USER_IDX    2
 /* See NB_MMU_MODES further up the file.  */
 
-static inline int cpu_mmu_index (CPUMBState *env, bool ifetch)
-{
-    MicroBlazeCPU *cpu = mb_env_get_cpu(env);
-
-    /* Are we in nommu mode?.  */
-    if (!(env->sregs[SR_MSR] & MSR_VM) || !cpu->cfg.use_mmu) {
-        return MMU_NOMMU_IDX;
-    }
-
-    if (env->sregs[SR_MSR] & MSR_UM) {
-        return MMU_USER_IDX;
-    }
-    return MMU_KERNEL_IDX;
-}
-
 bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                      MMUAccessType access_type, int mmu_idx,
                      bool probe, uintptr_t retaddr);
@@ -384,4 +364,19 @@ void mb_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                MemTxResult response, uintptr_t retaddr);
 #endif
 
+static inline int cpu_mmu_index(CPUMBState *env, bool ifetch)
+{
+    MicroBlazeCPU *cpu = env_archcpu(env);
+
+    /* Are we in nommu mode?.  */
+    if (!(env->sregs[SR_MSR] & MSR_VM) || !cpu->cfg.use_mmu) {
+        return MMU_NOMMU_IDX;
+    }
+
+    if (env->sregs[SR_MSR] & MSR_UM) {
+        return MMU_USER_IDX;
+    }
+    return MMU_KERNEL_IDX;
+}
+
 #endif
diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index 076bdb9a61..a6ea71401d 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -23,7 +23,7 @@
 
 void cpu_loop(CPUMBState *env)
 {
-    CPUState *cs = CPU(mb_env_get_cpu(env));
+    CPUState *cs = env_cpu(env);
     int trapnr, ret;
     target_siginfo_t info;
     
diff --git a/target/microblaze/mmu.c b/target/microblaze/mmu.c
index fcf86b12d5..6763421ba2 100644
--- a/target/microblaze/mmu.c
+++ b/target/microblaze/mmu.c
@@ -34,7 +34,7 @@ static unsigned int tlb_decode_size(unsigned int f)
 
 static void mmu_flush_idx(CPUMBState *env, unsigned int idx)
 {
-    CPUState *cs = CPU(mb_env_get_cpu(env));
+    CPUState *cs = env_cpu(env);
     struct microblaze_mmu *mmu = &env->mmu;
     unsigned int tlb_size;
     uint32_t tlb_tag, end, t;
@@ -228,7 +228,6 @@ uint32_t mmu_read(CPUMBState *env, bool ext, uint32_t rn)
 
 void mmu_write(CPUMBState *env, bool ext, uint32_t rn, uint32_t v)
 {
-    MicroBlazeCPU *cpu = mb_env_get_cpu(env);
     uint64_t tmp64;
     unsigned int i;
     qemu_log_mask(CPU_LOG_MMU,
@@ -269,7 +268,7 @@ void mmu_write(CPUMBState *env, bool ext, uint32_t rn, uint32_t v)
             /* Changes to the zone protection reg flush the QEMU TLB.
                Fortunately, these are very uncommon.  */
             if (v != env->mmu.regs[rn]) {
-                tlb_flush(CPU(cpu));
+                tlb_flush(env_cpu(env));
             }
             env->mmu.regs[rn] = v;
             break;
diff --git a/target/microblaze/op_helper.c b/target/microblaze/op_helper.c
index b5dbb90d05..18677ddfca 100644
--- a/target/microblaze/op_helper.c
+++ b/target/microblaze/op_helper.c
@@ -65,7 +65,7 @@ uint32_t helper_get(uint32_t id, uint32_t ctrl)
 
 void helper_raise_exception(CPUMBState *env, uint32_t index)
 {
-    CPUState *cs = CPU(mb_env_get_cpu(env));
+    CPUState *cs = env_cpu(env);
 
     cs->exception_index = index;
     cpu_loop_exit(cs);
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 885fc44b51..9ce65f3bcf 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -1604,7 +1604,7 @@ static inline void decode(DisasContext *dc, uint32_t ir)
 void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
 {
     CPUMBState *env = cs->env_ptr;
-    MicroBlazeCPU *cpu = mb_env_get_cpu(env);
+    MicroBlazeCPU *cpu = env_archcpu(env);
     uint32_t pc_start;
     struct DisasContext ctx;
     struct DisasContext *dc = &ctx;
-- 
2.17.1


