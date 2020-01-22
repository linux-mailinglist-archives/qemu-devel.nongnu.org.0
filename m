Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A47144A1F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 03:59:51 +0100 (CET)
Received: from localhost ([::1]:35830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iu6FC-0000kk-8W
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 21:59:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45298)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iu65w-0005xP-B2
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 21:50:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iu65v-0002px-0k
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 21:50:16 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:45038)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iu65u-0002pf-Ra
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 21:50:14 -0500
Received: by mail-pg1-x542.google.com with SMTP id x7so2621335pgl.11
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2020 18:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=soIhy7U60hFR3tjy2P21a+DUoF3Ye/nEhgI5woKnVmY=;
 b=X1DrHwYTrrAguV+foHlRxiW9HpyGDnbnn8U0HJ5fEp9T3zddgFBxMKTRS1wGu6mC8h
 i1VpBjJMOeSv8b+R10mEcUd/74aBUT8labkoD+ufhCzNAx5sX7vJiJBDdOwlZ8x6ZPwR
 Qk7txK3Gy3dIPfrGTmSrPXB/E8nZ1F73D5W2ePxPA0WbR3AsuL8UDFKsPgnz2WMxNDcI
 YV60b+SXxZEq8OUylz3LfClINf1pErqBN/n/GJIfc9iiWZM/E6PzcC4KtevkobBk6O1G
 YA2FIeFzL/pnnxVD6chCmKZSvwIkT20OjEZ+9mUc3DoaO2eQPhlnJgCm9DyKjuzMjhYx
 jZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=soIhy7U60hFR3tjy2P21a+DUoF3Ye/nEhgI5woKnVmY=;
 b=Cn/EwdCdAO6NC/ku9YdGskUx9ar7KSrSZ03h+4DS+iaQot81T1i3W08pXohAHFnJu7
 x9AlJIFWCCVCDLTH4gHQ+ssXEAZhCrsN761WCXtbyiddFdD1N5k+vz8h02OoWnoFRmI0
 YZJ7i8oY0G74s2CYx3sHUrI2Dh9NVLcuGYG+H7S3jGbyoeGKgXoBBvKIc/i1KpBEwTUm
 WGpU7AuXTuarw2Om3JAiTmSofDa+W2ONk50ye//7JxvmZNQJ+z9zNTtk3biRrNqhry03
 vrQB8i/HBrZlI8GCHcIxOUT+gMlqAS7dF6fptJ1jbq3d+VLbBpT+Lhqt4ZrLs0Owqwwn
 67JQ==
X-Gm-Message-State: APjAAAVwDB4UMCKBRESyzlTH4jub6YCmW7SM0KYEQr907PM3MFkghqrH
 Jf10LIo6UEP9RutoAVBtKfZq+FvV40I=
X-Google-Smtp-Source: APXvYqx6yoRRZglRCdel1ROQi224P7rHoQ45dKZ9im+9BJqMmU7F6b0A1Xf4iDzfjkeZXfiR5rz7eg==
X-Received: by 2002:a62:197:: with SMTP id 145mr598467pfb.188.1579661413596;
 Tue, 21 Jan 2020 18:50:13 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-198-77-92.west.biz.rr.com.
 [173.198.77.92])
 by smtp.gmail.com with ESMTPSA id c22sm44149883pfo.50.2020.01.21.18.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 18:50:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/16] cputlb: Partially merge tlb_dyn_init into tlb_init
Date: Tue, 21 Jan 2020 16:49:43 -1000
Message-Id: <20200122024946.28484-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200122024946.28484-1-richard.henderson@linaro.org>
References: <20200122024946.28484-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
Cc: peter.maydell@linaro.org, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Merge into the only caller, but at the same time split
out tlb_mmu_init to initialize a single tlb entry.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 28cfff1556..360495468e 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -97,22 +97,6 @@ static void tlb_window_reset(CPUTLBDesc *desc, int64_t ns,
     desc->window_max_entries = max_entries;
 }
 
-static void tlb_dyn_init(CPUArchState *env)
-{
-    int i;
-
-    for (i = 0; i < NB_MMU_MODES; i++) {
-        CPUTLBDesc *desc = &env_tlb(env)->d[i];
-        size_t n_entries = 1 << CPU_TLB_DYN_DEFAULT_BITS;
-
-        tlb_window_reset(desc, get_clock_realtime(), 0);
-        desc->n_used_entries = 0;
-        env_tlb(env)->f[i].mask = (n_entries - 1) << CPU_TLB_ENTRY_BITS;
-        env_tlb(env)->f[i].table = g_new(CPUTLBEntry, n_entries);
-        env_tlb(env)->d[i].iotlb = g_new(CPUIOTLBEntry, n_entries);
-    }
-}
-
 /**
  * tlb_mmu_resize_locked() - perform TLB resize bookkeeping; resize if necessary
  * @desc: The CPUTLBDesc portion of the TLB
@@ -247,6 +231,17 @@ static void tlb_flush_one_mmuidx_locked(CPUArchState *env, int mmu_idx)
     tlb_mmu_flush_locked(desc, fast);
 }
 
+static void tlb_mmu_init(CPUTLBDesc *desc, CPUTLBDescFast *fast, int64_t now)
+{
+    size_t n_entries = 1 << CPU_TLB_DYN_DEFAULT_BITS;
+
+    tlb_window_reset(desc, now, 0);
+    desc->n_used_entries = 0;
+    fast->mask = (n_entries - 1) << CPU_TLB_ENTRY_BITS;
+    fast->table = g_new(CPUTLBEntry, n_entries);
+    desc->iotlb = g_new(CPUIOTLBEntry, n_entries);
+}
+
 static inline void tlb_n_used_entries_inc(CPUArchState *env, uintptr_t mmu_idx)
 {
     env_tlb(env)->d[mmu_idx].n_used_entries++;
@@ -260,13 +255,17 @@ static inline void tlb_n_used_entries_dec(CPUArchState *env, uintptr_t mmu_idx)
 void tlb_init(CPUState *cpu)
 {
     CPUArchState *env = cpu->env_ptr;
+    int64_t now = get_clock_realtime();
+    int i;
 
     qemu_spin_init(&env_tlb(env)->c.lock);
 
     /* Ensure that cpu_reset performs a full flush.  */
     env_tlb(env)->c.dirty = ALL_MMUIDX_BITS;
 
-    tlb_dyn_init(env);
+    for (i = 0; i < NB_MMU_MODES; i++) {
+        tlb_mmu_init(&env_tlb(env)->d[i], &env_tlb(env)->f[i], now);
+    }
 }
 
 /* flush_all_helper: run fn across all cpus
-- 
2.20.1


