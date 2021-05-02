Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D19C0370E0D
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:48:29 +0200 (CEST)
Received: from localhost ([::1]:41174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldFGe-0005DZ-SF
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEme-000669-6S
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:17:29 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:45750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEmc-0007oF-K8
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:17:27 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so2116467wmh.4
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/fMkH6Q98B3JkGJr/ySJUTql2HNV5/mMZqqV/6nG+Ag=;
 b=CPS1nV3CNHVwuG1Br3ug1CYOtSfQ1JkVvaNt7Mc+Pazkd/pJQn/t3PqiwyMj5uM5Ot
 nVRS6qhfeWpejwT56I/Dr0Jn51yWh7UUzPnKLPA/AfNPoxyva5ief5kZvd5qNkX2Ir3C
 oqIbXGyNTcACUn/zCU8rXknnL2xQ4oNBSawMJlf6H9BCCPS+dKJm+2PbJSNzrglI9/dm
 4WAEvxwzfNlS53Dur1x0hDDxuBRCeZMd1HEHvY/QoEW5YTWsT3gV4vRBPHRqja5Zl1W+
 3pyKFBYXu1jU/VSIWHVxc5t2TRoY4/fGNiGZmV4njummbS/eokY+bvjdzq3K9hjiWCdw
 K1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/fMkH6Q98B3JkGJr/ySJUTql2HNV5/mMZqqV/6nG+Ag=;
 b=XEJ6UMV081tUps13xnXoEoG+PC4U76+K3z7ySk93weqmFrKN/6+vohD07jMud2ZkUa
 NQx+aoqXkeJDKgtSZy4eZlCe9uQqhoUm7qKJguIHS9y45MwdqosmcFzoB9+PcUxl6JLz
 RQcFrkkctmN3g1LSIHOvPYmpXpfEuKF9qCSTNcaHWVVVlnI+zoy/511JsECDCj6CMhOT
 FWRhFKQqIudPKpWEBpFB6wJ6Gtg3f3s1QcXIhtznmZ7TNV0iS5rWnjxWhPwdJiD9u4Ua
 BPjdnlCyfcv2JySgS1YfXvkyUayfrZhXHNcITcW8U1Tp6ue9xMfnZkzQ+3Bxscw5y0NF
 UiUA==
X-Gm-Message-State: AOAM531KOFhOkALz5b1IZVfvy3GcEdXV8vi1I3O+BF/gOSi8Qbhvm4Y0
 31M2PDMICc42zKpQ5lA6880FhYjGd6h9tIcJ
X-Google-Smtp-Source: ABdhPJymbjOlwS51uImZYhTyzujVaJflRv7l0kfzh4iHMM8eO/7RCoGgJ6I8x4VaNQcRCA4UVX1oPA==
X-Received: by 2002:a1c:4382:: with SMTP id q124mr16900765wma.63.1619972245140; 
 Sun, 02 May 2021 09:17:25 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id 61sm9880095wrm.52.2021.05.02.09.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:17:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/36] target/mips: Add simple user-mode mips_cpu_tlb_fill()
Date: Sun,  2 May 2021 18:15:22 +0200
Message-Id: <20210502161538.534038-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

tlb_helper.c's #ifdef'ry hides a quite simple user-mode
implementation of mips_cpu_tlb_fill().

Copy the user-mode implementation (without #ifdef'ry) to
tcg/user/helper.c and simplify tlb_helper.c's #ifdef'ry.

This will allow us to restrict tlb_helper.c to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210428170410.479308-15-f4bug@amsat.org>
---
 target/mips/tcg/user/tlb_helper.c | 36 +++++++++++++++++++++++++++++++
 target/mips/tlb_helper.c          | 10 ---------
 2 files changed, 36 insertions(+), 10 deletions(-)

diff --git a/target/mips/tcg/user/tlb_helper.c b/target/mips/tcg/user/tlb_helper.c
index 453b9e9b930..b835144b820 100644
--- a/target/mips/tcg/user/tlb_helper.c
+++ b/target/mips/tcg/user/tlb_helper.c
@@ -22,6 +22,42 @@
 #include "exec/exec-all.h"
 #include "internal.h"
 
+static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
+                                MMUAccessType access_type)
+{
+    CPUState *cs = env_cpu(env);
+
+    env->error_code = 0;
+    if (access_type == MMU_INST_FETCH) {
+        env->error_code |= EXCP_INST_NOTAVAIL;
+    }
+
+    /* Reference to kernel address from user mode or supervisor mode */
+    /* Reference to supervisor address from user mode */
+    if (access_type == MMU_DATA_STORE) {
+        cs->exception_index = EXCP_AdES;
+    } else {
+        cs->exception_index = EXCP_AdEL;
+    }
+
+    /* Raise exception */
+    if (!(env->hflags & MIPS_HFLAG_DM)) {
+        env->CP0_BadVAddr = address;
+    }
+}
+
+bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                       MMUAccessType access_type, int mmu_idx,
+                       bool probe, uintptr_t retaddr)
+{
+    MIPSCPU *cpu = MIPS_CPU(cs);
+    CPUMIPSState *env = &cpu->env;
+
+    /* data access */
+    raise_mmu_exception(env, address, access_type);
+    do_raise_exception_err(env, cs->exception_index, env->error_code, retaddr);
+}
+
 void mips_cpu_do_interrupt(CPUState *cs)
 {
     cs->exception_index = EXCP_NONE;
diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index 78720c4d20a..afc019c80dd 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -403,8 +403,6 @@ void cpu_mips_tlb_flush(CPUMIPSState *env)
     env->tlb->tlb_in_use = env->tlb->nb_tlb;
 }
 
-#endif /* !CONFIG_USER_ONLY */
-
 static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
                                 MMUAccessType access_type, int tlb_error)
 {
@@ -484,8 +482,6 @@ static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
     env->error_code = error_code;
 }
 
-#if !defined(CONFIG_USER_ONLY)
-
 hwaddr mips_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
 {
     MIPSCPU *cpu = MIPS_CPU(cs);
@@ -833,7 +829,6 @@ refill:
     return true;
 }
 #endif
-#endif /* !CONFIG_USER_ONLY */
 
 bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
@@ -841,14 +836,11 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 {
     MIPSCPU *cpu = MIPS_CPU(cs);
     CPUMIPSState *env = &cpu->env;
-#if !defined(CONFIG_USER_ONLY)
     hwaddr physical;
     int prot;
-#endif
     int ret = TLBRET_BADADDR;
 
     /* data access */
-#if !defined(CONFIG_USER_ONLY)
     /* XXX: put correct access by using cpu_restore_state() correctly */
     ret = get_physical_address(env, &physical, &prot, address,
                                access_type, mmu_idx);
@@ -896,13 +888,11 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     if (probe) {
         return false;
     }
-#endif
 
     raise_mmu_exception(env, address, access_type, ret);
     do_raise_exception_err(env, cs->exception_index, env->error_code, retaddr);
 }
 
-#ifndef CONFIG_USER_ONLY
 hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
                                   MMUAccessType access_type, uintptr_t retaddr)
 {
-- 
2.26.3


