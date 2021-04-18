Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5BC3636B4
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 18:43:27 +0200 (CEST)
Received: from localhost ([::1]:40492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYAW6-0003rs-9J
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 12:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYALT-0003Ga-Lz
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:32:29 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:33549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYALR-0004cE-Vf
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:32:27 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 q123-20020a1c43810000b029012c7d852459so7052837wma.0
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 09:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JUUEmf5SlbaTemzMWy5ADTcmG/EE1+NtSG+aWRZw2E0=;
 b=IrR5Ar+OhqWIkUc7vvqHloLE62Tyc9VlOBma5scdROewW5t2Ss/T7nXdzkmv2QRRYp
 XKSAx1wdmxnmjUl0knuUGjStUAsUNWb90z8LyE5JqAsF0ZquwPk8PMU4ze6u2yjbd/Cg
 paAAqot7iZm6WeyiMJC2XJtK9UEV6gJ713nXb/3Y7+GbvWweGmtKOANuec2vvj3+Y1sh
 FclAvFsetqsOTdbuR1kqgGFCokGIa/K7SSbstjx6HPoAV+2kH56QuLocjdWc1O1vq6yS
 HiaRkiDKzT1SwzWhcsLNS0KOrUpxzdg69lzfmIEFBEBro5VljuvnYCkTzDES+B2yxMdm
 CIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JUUEmf5SlbaTemzMWy5ADTcmG/EE1+NtSG+aWRZw2E0=;
 b=LLkrvQm8G6GY1TzCV5oSE3vPaRutj/X4nOHVjTjw2AfPdelmGTU3G+vkJEanfSEv4o
 hCVrOJyZewvn2R9r1vaJ4Pv4MXV7jM6KltIHxC4AChMnMUHGhJfQUX7OffVhKIO6O2O5
 twKHT0Lr7sVJLM9TjKpBZzBxMnM08cE1dIqPWzvHGB4xt5H01s557Vl96PW6cbqtYQ9t
 YrBfy/DB5Tbo0nhWy2/wBHokj6JonBSJCG1K1/MO5mAylv0CHaVcBgM8EDrL5aGl4OwT
 OFhFuMIVgjSCZctPB5cZNzwM05fCbNF/VNMXKs8lDpICgFob493YVDj/9Q4jkWionSYj
 8Nrw==
X-Gm-Message-State: AOAM531XA77VxZwzlpwiJgnyOMfqeBIzDYuUPtldySxX13bhukYu2P3k
 wBB8WzPiiWMGbSBPNNO7Yk/k6kNbwWNg7w==
X-Google-Smtp-Source: ABdhPJxAo5dkox6ArdkNMvW7IstmIsdCOVZXvzoxwez2XJh+V9CMR/ar9YqMEZ/0kYKVSvd+LxGJ2A==
X-Received: by 2002:a1c:f402:: with SMTP id z2mr13099959wma.21.1618763544518; 
 Sun, 18 Apr 2021 09:32:24 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id z66sm17464700wmc.4.2021.04.18.09.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 09:32:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/26] target/mips: Add simple user-mode mips_cpu_tlb_fill()
Date: Sun, 18 Apr 2021 18:31:18 +0200
Message-Id: <20210418163134.1133100-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418163134.1133100-1-f4bug@amsat.org>
References: <20210418163134.1133100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/user/helper.c | 36 +++++++++++++++++++++++++++++++++++
 target/mips/tlb_helper.c      | 10 ----------
 2 files changed, 36 insertions(+), 10 deletions(-)

diff --git a/target/mips/tcg/user/helper.c b/target/mips/tcg/user/helper.c
index 453b9e9b930..b835144b820 100644
--- a/target/mips/tcg/user/helper.c
+++ b/target/mips/tcg/user/helper.c
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
index 46e9555c9ab..bb4b503ff72 100644
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
                                   MMUAccessType access_type)
 {
-- 
2.26.3


