Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1EF364AAE
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:38:03 +0200 (CEST)
Received: from localhost ([::1]:44574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZic-0001gc-JR
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZRP-0000An-NF
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:20:15 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:41611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZRN-0001go-VB
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:20:15 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 o21-20020a1c4d150000b029012e52898006so9024496wmh.0
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 12:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uiRGPC8hJpSSu/BlNtbaRgowW+aTxxcCgHW1Tb9Qg8I=;
 b=SyBNtQ/i3AvzeUSxBP45Qkv/h3PE+RqZ2uRSldvZwVSjBYx0Lu3mZMcoTIQ7S1xNCi
 Niz3LYpgAl9Csd9lgIO9kgsN8CwmooVMbVF7wDXN+lRzISGUfKfnDnlR8rzAIY2r7uWP
 qpdBYbr8fdqfufoa4uUdpx79WSl/3eVdEoooFK9q7ZEFvXSz2Dagbse8+Bzjb0sMwgFC
 iyvjAKxALEAQjGdDJTlk2+FEcKrktdUrO1hGxddA1Q8u3Q5KIdo4qClPocd1c0Dxumu+
 wxOV1NkoTRYETFt3D6LTrvn0otEu/PEPwhU70/LRLzVTgHwfOt4pW+mh/fSXL38xxIXZ
 VH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uiRGPC8hJpSSu/BlNtbaRgowW+aTxxcCgHW1Tb9Qg8I=;
 b=UtTnyeB9iswDUhi+XF5aJTkyOKDM+/Fk4eFDJTeQ2iaTvEMVJJaB6P+d/V+wLTT9Dm
 uMs1kv2pRxHf3vr8kBqVymmIzuWR2XUZpGtJP2SqDDul9ELKMwsXtshUh5YOHFJWliTy
 SByedifp/Eg/1rJ7nOymkmABCDBjJ/BL0TrI7Rwcz2DYl/7x+79w+aNJs6Cm2J2W2eNn
 vYU4OZhYVcHhKI8Z7iPEurxIk3pibVoQZ+Sb2O/5TnCIftXQr9dg4T8hcoQIi6wXKF+U
 oFsqB5xfU20GJJCuJupkWrSjHz+9H7xvvAa6cCWfmlw8PLIx2u57TwPcpiBvZpEMW1Rt
 yJuQ==
X-Gm-Message-State: AOAM5333IDuDWH6MmdU9iMHH1jbBK06niAhFvn35P9wWdbH4QZ+aFV0w
 PuiXxf0LBKCjQWBP8BlceeMM1ftxnIEgKQ==
X-Google-Smtp-Source: ABdhPJzgSog+d1Q/wnTHYZH6tLUQIXxps0d7V5Htbd1Jk2+qe9O+oTB0G74unMCg1mad2fvcr+m1+g==
X-Received: by 2002:a1c:e20a:: with SMTP id z10mr570824wmg.158.1618860012408; 
 Mon, 19 Apr 2021 12:20:12 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f6sm23206333wrt.19.2021.04.19.12.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 12:20:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/30] target/mips: Restrict
 CPUMIPSTLBContext::map_address() handlers scope
Date: Mon, 19 Apr 2021 21:18:15 +0200
Message-Id: <20210419191823.1555482-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210419191823.1555482-1-f4bug@amsat.org>
References: <20210419191823.1555482-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
index bf242f5e65a..a45146a2b21 100644
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


