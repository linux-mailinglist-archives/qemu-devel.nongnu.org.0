Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6FC2DC482
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:44:09 +0100 (CET)
Received: from localhost ([::1]:45024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZuK-0003F0-CA
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:44:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpZf7-00058d-FM
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:28:25 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:35371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpZf5-0007mJ-My
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:28:25 -0500
Received: by mail-wm1-x32f.google.com with SMTP id e25so3057805wme.0
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nnfnPGeSTecm92WN/NMVfeabAYZsekuzz7oGOoZfca0=;
 b=MdBF0PV/G+JX3bs2j8zQ5YG4Fm8/Y4WvLFKGsyvZdLsIhqc5zWP7MX5Qxc6g/Qw+rq
 k5XwejhgdDWwK2JCMYVnbKk6KcOmKtyNoEZJ1RJoi5qYUyxvot6Dhw2MZMarnbNqarua
 MVzxu9LkB/iygz1pUDr1t6CXFGDz6TkL7r3APlXGkE9OuPIhJkLkb1X8g4j6rd/FBlnE
 j6tGM5PJV3Tq10N9gBglC2ebx0eFNQs9ROkFr/mdqaO4CFsyvffhVf1XwHrVjjN0me9A
 IJA4LiRASkxS9ycLyQumR1ZDJW4DY1xzpHJjKEC/ztKmY0HuA1K5hD5aXJ5btWeSVqQX
 Sypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nnfnPGeSTecm92WN/NMVfeabAYZsekuzz7oGOoZfca0=;
 b=FI847+rCscgFlabZc6sSC3J7PDpv7XArYxdqg3qqPdOeZn4Is0lnquPf7/Nu7835rQ
 4Nv0gEzsIvQyfR39tttDe3AscB3n/7GnO9CdhRIyLTXOQMuXqRabp8ID6DRwoLNLOsEU
 61PCJypYpLON3S7MSQamjw7ccqKSEBTk2vprC43zTAvC8jGPVFzlJ2gjU9dl0aUOeHbL
 w+RmAT3cwOARavb8OzmaOL2Q0bsrrkOAnE6luHuO+K4U1yMMBH8vplJQ69GmfOJfLnpz
 VSUeiM+e1vKvHT0dlXsECnP/xI3MLypkmATxcTPmUk9BOJ6kPE2LkhgoxTCh6kKgS12q
 +1wQ==
X-Gm-Message-State: AOAM533BPuFnVs0240CCyOjD9cnj4PbiaZbVq9OCgGWgvPskrXrZoyfa
 rUjkeEWztQCDZNYof3be4944a3HFAW0=
X-Google-Smtp-Source: ABdhPJzP4NYJT5XeWd1Dc4SQyH0MvRfshFo/f6yobW8EX9dj5KXLQY9/jHQ4lNwj0/av9YGkYZCymQ==
X-Received: by 2002:a1c:2605:: with SMTP id m5mr4166103wmm.111.1608136102128; 
 Wed, 16 Dec 2020 08:28:22 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id u66sm3660173wmg.2.2020.12.16.08.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:28:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/12] target/mips/mips-defs: Use ISA_MIPS32R6 definition
 to check Release 6
Date: Wed, 16 Dec 2020 17:27:39 +0100
Message-Id: <20201216162744.895920-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201216162744.895920-1-f4bug@amsat.org>
References: <20201216162744.895920-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
 Paul Burton <paulburton@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the single ISA_MIPS32R6 definition to check if the Release 6
ISA is supported, whether the CPU support 32/64-bit.

For now we keep '32' in the definition name, we will rename it
as ISA_MIPS_R6 in few commits.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h     | 2 +-
 target/mips/mips-defs.h    | 3 +--
 linux-user/elfload.c       | 2 +-
 linux-user/mips/cpu_loop.c | 3 +--
 target/mips/tlb_helper.c   | 6 +++---
 target/mips/translate.c    | 2 +-
 6 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 76269cfc7bb..97899dbd3c8 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -308,7 +308,7 @@ static inline void compute_hflags(CPUMIPSState *env)
     } else if (((env->hflags & MIPS_HFLAG_KSU) == MIPS_HFLAG_UM) &&
                !(env->CP0_Status & (1 << CP0St_UX))) {
         env->hflags |= MIPS_HFLAG_AWRAP;
-    } else if (env->insn_flags & ISA_MIPS64R6) {
+    } else if (env->insn_flags & ISA_MIPS32R6) {
         /* Address wrapping for Supervisor and Kernel is specified in R6 */
         if ((((env->hflags & MIPS_HFLAG_KSU) == MIPS_HFLAG_SM) &&
              !(env->CP0_Status & (1 << CP0St_SX))) ||
diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index ea9dcc7c98e..df2ffae5718 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -27,7 +27,6 @@
 #define ISA_MIPS32R3      0x0000000000000200ULL
 #define ISA_MIPS32R5      0x0000000000000800ULL
 #define ISA_MIPS32R6      0x0000000000002000ULL
-#define ISA_MIPS64R6      0x0000000000004000ULL
 #define ISA_NANOMIPS32    0x0000000000008000ULL
 /*
  *   bits 24-39: MIPS ASEs
@@ -90,7 +89,7 @@
 
 /* MIPS Technologies "Release 6" */
 #define CPU_MIPS32R6    (CPU_MIPS32R5 | ISA_MIPS32R6)
-#define CPU_MIPS64R6    (CPU_MIPS64R5 | CPU_MIPS32R6 | ISA_MIPS64R6)
+#define CPU_MIPS64R6    (CPU_MIPS64R5 | CPU_MIPS32R6)
 
 /* Wave Computing: "nanoMIPS" */
 #define CPU_NANOMIPS32  (CPU_MIPS32R6 | ISA_NANOMIPS32)
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 0b02a926025..e875a5387cc 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -997,7 +997,7 @@ static uint32_t get_elf_hwcap(void)
 #define GET_FEATURE(flag, hwcap) \
     do { if (cpu->env.insn_flags & (flag)) { hwcaps |= hwcap; } } while (0)
 
-    GET_FEATURE(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
+    GET_FEATURE(ISA_MIPS32R6, HWCAP_MIPS_R6);
     GET_FEATURE(ASE_MSA, HWCAP_MIPS_MSA);
 
 #undef GET_FEATURE
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index a2aa8167210..1e4acf3d6e3 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -386,8 +386,7 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
     prog_req.fre &= interp_req.fre;
 
     bool cpu_has_mips_r2_r6 = env->insn_flags & ISA_MIPS32R2 ||
-                              env->insn_flags & ISA_MIPS32R6 ||
-                              env->insn_flags & ISA_MIPS64R6;
+                              env->insn_flags & ISA_MIPS32R6;
 
     if (prog_req.fre && !prog_req.frdefault && !prog_req.fr1) {
         env->CP0_Config5 |= (1 << CP0C5_FRE);
diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index 94a482e3dbe..68d766f90a3 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -1025,7 +1025,7 @@ void mips_cpu_do_interrupt(CPUState *cs)
  enter_debug_mode:
         if (env->insn_flags & ISA_MIPS3) {
             env->hflags |= MIPS_HFLAG_64;
-            if (!(env->insn_flags & ISA_MIPS64R6) ||
+            if (!(env->insn_flags & ISA_MIPS32R6) ||
                 env->CP0_Status & (1 << CP0St_KX)) {
                 env->hflags &= ~MIPS_HFLAG_AWRAP;
             }
@@ -1054,7 +1054,7 @@ void mips_cpu_do_interrupt(CPUState *cs)
         env->CP0_Status |= (1 << CP0St_ERL) | (1 << CP0St_BEV);
         if (env->insn_flags & ISA_MIPS3) {
             env->hflags |= MIPS_HFLAG_64;
-            if (!(env->insn_flags & ISA_MIPS64R6) ||
+            if (!(env->insn_flags & ISA_MIPS32R6) ||
                 env->CP0_Status & (1 << CP0St_KX)) {
                 env->hflags &= ~MIPS_HFLAG_AWRAP;
             }
@@ -1240,7 +1240,7 @@ void mips_cpu_do_interrupt(CPUState *cs)
             env->CP0_Status |= (1 << CP0St_EXL);
             if (env->insn_flags & ISA_MIPS3) {
                 env->hflags |= MIPS_HFLAG_64;
-                if (!(env->insn_flags & ISA_MIPS64R6) ||
+                if (!(env->insn_flags & ISA_MIPS32R6) ||
                     env->CP0_Status & (1 << CP0St_KX)) {
                     env->hflags &= ~MIPS_HFLAG_AWRAP;
                 }
diff --git a/target/mips/translate.c b/target/mips/translate.c
index de3a6b5ed65..f32b5ebdd7e 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -29078,7 +29078,7 @@ static void mips_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 #else
         ctx->mem_idx = hflags_mmu_index(ctx->hflags);
 #endif
-    ctx->default_tcg_memop_mask = (ctx->insn_flags & (ISA_MIPS32R6 | ISA_MIPS64R6 |
+    ctx->default_tcg_memop_mask = (ctx->insn_flags & (ISA_MIPS32R6 |
                                   INSN_LOONGSON3A)) ? MO_UNALN : MO_ALIGN;
 
     LOG_DISAS("\ntb %p idx %d hflags %04x\n", ctx->base.tb, ctx->mem_idx,
-- 
2.26.2


