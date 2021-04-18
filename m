Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A03363871
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 01:07:06 +0200 (CEST)
Received: from localhost ([::1]:39720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYGVN-0003Ac-JQ
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 19:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGHU-00046L-0H
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:52:44 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:33678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGHR-000113-Tv
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:52:43 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 q123-20020a1c43810000b029012c7d852459so7222619wma.0
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 15:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Iu+6LDjF0QAs/zLJz5W09HL+Jkckai0YrVB0wfaf53c=;
 b=XDqiMM1T65Z6hMwGrVA2cPPPiVN4y0x4v4w3afG/QavgXfmclYbHJKOk3uF0oBivPJ
 4mrXIueyHdUaUsXVCsia3s+hZ08fLbzOcPYrhy2d5BvZ2XyqFb/SN4oazhiSENAiUN0p
 X6UlReiqQzJ+5J+EFkzI6HQSmy7WQZ7QyqXQmM3YDL5pOnAG9Kb9a8NIOAKCBRJucy6H
 +gyoKin29BfEN45ddF0zH6C52ybKNjCXmMRdkiDl85s4vlJ0GGgm5GtdK8M+rd8+Wmg0
 Wdv1uwwNW5Urss8Zl46Wl01aGPv55lXgOkgr04NuokKWebLKR4y7HfivW+pqwscTvpZY
 z2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Iu+6LDjF0QAs/zLJz5W09HL+Jkckai0YrVB0wfaf53c=;
 b=pYBZE/zY0IMT1Nh09SsL/ZAWAi3x6FOtVNRPfePsfzeXw8JhYtwr1aUx0q5zSqBMct
 cYy+ZWsd6/iJsljdospPXew2iuiWIqPfhSwazRoz019yXKvl73ZL7p3syn5Zsw0+zPKl
 q+mIK3KJHfreShz3wka4xhCRN+sq0MFF1wliL1LKH3kQumH31oF+hYG8TT3l/Ghq1qIh
 2ybbublWoCdZG2U/TF31L3PnZXVOtti3O+8d3STIGy63C+wen0DTbRRV01oQxzJmxPqO
 +cKa834K7mJzd1Dm8+JcYdZz3HBpPMus2Tdxtv9/hKqueQPY9HxB7ZkMehNU+7vO4EdQ
 egWg==
X-Gm-Message-State: AOAM530jpX2AtZv3EQyu7tZe1sNc/iSKYe/1adTtOirZZ3zwYhIzWCYy
 Uagu2AtFy/8KdpuS+9hinXFH/dJXxmNGfg==
X-Google-Smtp-Source: ABdhPJyzwJyaPEjhYiDmDqOhznBjrAzJM5iB584bIp3vKJNWVotHczd2JDhDjklrf6o4Bw1S36/D3g==
X-Received: by 2002:a1c:2786:: with SMTP id n128mr19022928wmn.82.1618786360415; 
 Sun, 18 Apr 2021 15:52:40 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id m14sm1077463wmq.44.2021.04.18.15.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 15:52:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/29] target/mips: Restrict
 CPUMIPSTLBContext::map_address() handlers scope
Date: Mon, 19 Apr 2021 00:50:50 +0200
Message-Id: <20210418225058.1257014-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418225058.1257014-1-f4bug@amsat.org>
References: <20210418225058.1257014-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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

The 3 map_address() handlers are local to tlb_helper.c,
no need to have their prototype declared publically.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h              |  6 ------
 target/mips/tcg/sysemu/tlb_helper.c | 13 +++++++------
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index df419760df0..a59e2f9007d 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -152,12 +152,6 @@ struct CPUMIPSTLBContext {
     } mmu;
 };
 
-int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                       target_ulong address, MMUAccessType access_type);
-int fixed_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                          target_ulong address, MMUAccessType access_type);
-int r4k_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                    target_ulong address, MMUAccessType access_type);
 void r4k_helper_tlbwi(CPUMIPSState *env);
 void r4k_helper_tlbwr(CPUMIPSState *env);
 void r4k_helper_tlbp(CPUMIPSState *env);
diff --git a/target/mips/tcg/sysemu/tlb_helper.c b/target/mips/tcg/sysemu/tlb_helper.c
index 82cfb0a9135..cbb4ccf0dac 100644
--- a/target/mips/tcg/sysemu/tlb_helper.c
+++ b/target/mips/tcg/sysemu/tlb_helper.c
@@ -26,8 +26,8 @@
 #include "hw/mips/cpudevs.h"
 
 /* no MMU emulation */
-int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                       target_ulong address, MMUAccessType access_type)
+static int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
+                              target_ulong address, MMUAccessType access_type)
 {
     *physical = address;
     *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
@@ -35,8 +35,9 @@ int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
 }
 
 /* fixed mapping MMU emulation */
-int fixed_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                          target_ulong address, MMUAccessType access_type)
+static int fixed_mmu_map_address(CPUMIPSState *env, hwaddr *physical,
+                                 int *prot, target_ulong address,
+                                 MMUAccessType access_type)
 {
     if (address <= (int32_t)0x7FFFFFFFUL) {
         if (!(env->CP0_Status & (1 << CP0St_ERL))) {
@@ -55,8 +56,8 @@ int fixed_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
 }
 
 /* MIPS32/MIPS64 R4000-style MMU emulation */
-int r4k_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                    target_ulong address, MMUAccessType access_type)
+static int r4k_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
+                           target_ulong address, MMUAccessType access_type)
 {
     uint16_t ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
     uint32_t MMID = env->CP0_MemoryMapID;
-- 
2.26.3


