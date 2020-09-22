Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F7A2738EF
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 04:54:06 +0200 (CEST)
Received: from localhost ([::1]:58518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKYRR-00082o-VL
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 22:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1kKYO5-0003uD-1Z
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 22:50:38 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1kKYO2-00021J-4j
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 22:50:36 -0400
Received: by mail-pg1-x541.google.com with SMTP id l71so10736391pge.4
 for <qemu-devel@nongnu.org>; Mon, 21 Sep 2020 19:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Jr0NvGeHlbaGHjiW6QJqlJx6IjQPnyFFaPekqH9KcpA=;
 b=TsqQMFddP/7BByBtGLR4t0Zlw/QtrMR1JONRYj78L+nwzzAZIqVOoBcW2vZvKBrLWe
 nHsvRrwondR7ZdJqE125tdUvmN8+zVJyFz7zpj9ZuH3p8nFcIPg7n/pa1Iq7LydrIQqo
 QcbSNyZLJ44Z1vHoJ0iHJjjCUEONjR4eIeb+dP162T2ZyvT2vZDro/9qXYSGtzKoCE8k
 kDunQSGiAWs2pQWmdQLliQKwixo/yy2kgNng1B2uBYT65GC9gVbJClZGQaUl8zjPYQ1t
 gu6wmIwftybrZy2wJfuzgVFpEioIp9+kmg2+gni+vIT6Z20JJLy/cCb3tSDxogeS4zt7
 5JYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Jr0NvGeHlbaGHjiW6QJqlJx6IjQPnyFFaPekqH9KcpA=;
 b=oy7zps3CLv/nNHtuCil22AIwl3YdX0+j3j69QImZ5zDQsgA+IHoijun0aknGbT/2oO
 DzcjYuJQpYAkY7PVrqSGTpZ85tQRw05AtYXzWkJj/ZZfVBfGOUTs3jZYe/BskMLKZy/S
 NnCTIg/j9yhQXlHBXkYZQgBWw/hyedOqYU5dwyAbQE982GeBJX68vDxvRYsXaY05zFHf
 LGg2su+UsMk02QAffiAw5mSdNysUEkuo/8lHC9h0OVfNV0Z6L9a0t8InuBMCPCz+7dDJ
 tiHPewrRi5onlQ0t3ju7SvNQ/4iBjL2Ko9WIOK8hKCLopABvnJlQevpDK1x/zH58zeCw
 /BNg==
X-Gm-Message-State: AOAM531Rej94AYcz6c7MmpPUPNEbeVoZ7iYrCqOOTtZ4Rq/uo23jYwDH
 0byLJbfI1URqCd8HyLNTvTU=
X-Google-Smtp-Source: ABdhPJxZDin/PVNCOO9UXCPmITh8MqudAWxO7gQci00ynPWdpBX9aFJi2KVkQpTqovo+GPzy9DsG1g==
X-Received: by 2002:a62:d40d:0:b029:150:959d:5136 with SMTP id
 a13-20020a62d40d0000b0290150959d5136mr2488836pfh.20.1600743032544; 
 Mon, 21 Sep 2020 19:50:32 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
 by smtp.gmail.com with ESMTPSA id q4sm13263677pfs.193.2020.09.21.19.50.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Sep 2020 19:50:31 -0700 (PDT)
From: Huacai Chen <zltjiangshi@gmail.com>
X-Google-Original-From: Huacai Chen <chenhc@lemote.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Subject: [PATCH V10 2/8] target/mips: Fix PageMask with variable page size
Date: Tue, 22 Sep 2020 10:49:21 +0800
Message-Id: <1600742967-12933-3-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1600742967-12933-1-git-send-email-chenhc@lemote.com>
References: <1600742967-12933-1-git-send-email-chenhc@lemote.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=zltjiangshi@gmail.com; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Huacai Chen <chenhuacai@gmail.com>, qemu-devel@nongnu.org,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

Our current code assumed the target page size is always 4k
when handling PageMask and VPN2, however, variable page size
was just added to mips target and that's nolonger true.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 target/mips/cp0_helper.c | 36 +++++++++++++++++++++++++++++-------
 target/mips/cpu.h        |  1 +
 2 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/target/mips/cp0_helper.c b/target/mips/cp0_helper.c
index de64add038..62bcb9707e 100644
--- a/target/mips/cp0_helper.c
+++ b/target/mips/cp0_helper.c
@@ -867,13 +867,35 @@ void helper_mtc0_memorymapid(CPUMIPSState *env, target_ulong arg1)
 
 void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask)
 {
-    uint64_t mask = arg1 >> (TARGET_PAGE_BITS + 1);
-    if (!(env->insn_flags & ISA_MIPS32R6) || (arg1 == ~0) ||
-        (mask == 0x0000 || mask == 0x0003 || mask == 0x000F ||
-         mask == 0x003F || mask == 0x00FF || mask == 0x03FF ||
-         mask == 0x0FFF || mask == 0x3FFF || mask == 0xFFFF)) {
-        env->CP0_PageMask = arg1 & (0x1FFFFFFF & (TARGET_PAGE_MASK << 1));
+    unsigned long mask;
+    int maskbits;
+
+    if (env->insn_flags & ISA_MIPS32R6) {
+        return;
+    }
+    /* Don't care MASKX as we don't support 1KB page */
+    mask = extract32((uint32_t)arg1, CP0PM_MASK, 16);
+    maskbits = find_first_zero_bit(&mask, 32);
+
+    /* Ensure no more set bit after first zero */
+    if (mask >> maskbits) {
+        goto invalid;
+    }
+    /* We don't support VTLB entry smaller than target page */
+    if ((maskbits + 12) < TARGET_PAGE_BITS) {
+        goto invalid;
     }
+    env->CP0_PageMask = mask << CP0PM_MASK;
+
+    return;
+
+invalid:
+    /*
+     * When invalid, ensure the value is bigger tan or equel to
+     * the minimal but smaller than or equel to the maxium.
+     */
+    maskbits = MIN(16, MAX(maskbits, TARGET_PAGE_BITS - 12));
+    env->CP0_PageMask = ((1 << (16 + 1)) - 1) << CP0PM_MASK;
 }
 
 void helper_mtc0_pagemask(CPUMIPSState *env, target_ulong arg1)
@@ -1104,7 +1126,7 @@ void helper_mthc0_saar(CPUMIPSState *env, target_ulong arg1)
 void helper_mtc0_entryhi(CPUMIPSState *env, target_ulong arg1)
 {
     target_ulong old, val, mask;
-    mask = (TARGET_PAGE_MASK << 1) | env->CP0_EntryHi_ASID_mask;
+    mask = ~((1 << 14) - 1) | env->CP0_EntryHi_ASID_mask;
     if (((env->CP0_Config4 >> CP0C4_IE) & 0x3) >= 2) {
         mask |= 1 << CP0EnHi_EHINV;
     }
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 7cf7f5239f..9c8bb23807 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -618,6 +618,7 @@ struct CPUMIPSState {
  * CP0 Register 5
  */
     int32_t CP0_PageMask;
+#define CP0PM_MASK 13
     int32_t CP0_PageGrain_rw_bitmask;
     int32_t CP0_PageGrain;
 #define CP0PG_RIE 31
-- 
2.17.2


