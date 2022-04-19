Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA934506791
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 11:18:39 +0200 (CEST)
Received: from localhost ([::1]:35302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngk0M-00042j-FH
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 05:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1ngjr6-00048h-Qx
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:09:06 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:34721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1ngjr4-0007sC-MY
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:09:04 -0400
Received: by mail-pl1-x62b.google.com with SMTP id n8so14965624plh.1
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 02:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HpG9gHGoIKKz4ztjK9P8jzG7Wl8gju78O5dVxAjPwBI=;
 b=lsjsoldcnZmGyHX7JKhwX/DJEAgocbDSyvE/VexFcWpByUEIEvwP/lMhS7tM0/IVL4
 4ymeOITy3CNOcwoF5cOfXbZJV9++tu3Pk0o43PQvQGkk5WEhgv5LCgy8CqM8yyQP175A
 y+iVYbNg1ljbD4b9JaxRRK316l+7WWPl6hHEyt1XmV8sSZyRkiPOrJFjHwdwqcCmgm8v
 TkUzJyXJfg1Teq+4B+UZmhL4wJyQpWoHlWoKloB5DrPEC2URcTXttSzqSDerXw26mPzQ
 XQvbIi9PRXQ9Z70OhfCVOhRDJ6RaPaxcei2AMQ2tNxWqAgI2mbGBQBL46UyvoUT7mGhc
 fVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HpG9gHGoIKKz4ztjK9P8jzG7Wl8gju78O5dVxAjPwBI=;
 b=OHYl0Kr4/Di2nQnAJNx5nHWJd4PSSJVcI4saqLcyyvfc+SJsko2hmc+aFhgS3c5BzU
 BFRdgRU1whle1nqOcTyV9bgVhvhOVVnJ+ejHSi4yXb3fNyZ3oCNpFFK2AJrfcNXQ6LPq
 5thRB72zRevowohNiWyKkEVVO0VhEFw78PAum0jgo4eNueCpdCYWnOuoJg74oFRqzjIE
 laBpgXCbD18EPdju2zlfJNLDUN97cZIc+qyxfJyAsfL3ZHFUOzVeA0eqWYhDoGUs3fTF
 tygK8H53HF2Qr5TsE469XaYuOcx7J7YaxE/oLMwYdrscsN5C2XVPfly7PSIlM2UcN2pR
 PcDA==
X-Gm-Message-State: AOAM532WKw0tBQNBb12MtedNSAYlALh2M6JOE+JV+UljdrCbWvyPWVMn
 kuPeJmnWaSU5tDZJ4V2HVtiHckOgMnU/AobX
X-Google-Smtp-Source: ABdhPJyky4Kn7C08IGsn01+N46+8VkIEDsKoXdNCwV6U3xMK+Q/QqL7OdlqxE4P4XWokRJ17UPOmbA==
X-Received: by 2002:a17:90b:2241:b0:1d2:54b2:64b2 with SMTP id
 hk1-20020a17090b224100b001d254b264b2mr16077315pjb.225.1650359340512; 
 Tue, 19 Apr 2022 02:09:00 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 fv7-20020a17090b0e8700b001ce18c551dcsm14963381pjb.19.2022.04.19.02.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:09:00 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/4] hw/intc: Support 32/64-bit mtimecmp and mtime accesses
 in RISC-V ACLINT
Date: Tue, 19 Apr 2022 17:08:43 +0800
Message-Id: <20220419090848.9018-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419090848.9018-1-frank.chang@sifive.com>
References: <20220419090848.9018-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Anup Patel <anup.patel@wdc.com>, Jim Shu <jim.shu@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

RISC-V privilege spec defines that:

* In RV32, memory-mapped writes to mtimecmp modify only one 32-bit part
  of the register.
* For RV64, naturally aligned 64-bit memory accesses to the mtime and
  mtimecmp registers are additionally supported and are atomic.

It's possible to perform both 32/64-bit read/write accesses to both
mtimecmp and mtime registers.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 hw/intc/riscv_aclint.c | 42 +++++++++++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index 37e9ace801..ad3c49706f 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -126,9 +126,9 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
             qemu_log_mask(LOG_GUEST_ERROR,
                           "aclint-mtimer: invalid hartid: %zu", hartid);
         } else if ((addr & 0x7) == 0) {
-            /* timecmp_lo */
+            /* timecmp_lo for RV32/RV64 or timecmp for RV64 */
             uint64_t timecmp = env->timecmp;
-            return timecmp & 0xFFFFFFFF;
+            return (size == 4) ? (timecmp & 0xFFFFFFFF) : timecmp;
         } else if ((addr & 0x7) == 4) {
             /* timecmp_hi */
             uint64_t timecmp = env->timecmp;
@@ -139,8 +139,9 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
             return 0;
         }
     } else if (addr == mtimer->time_base) {
-        /* time_lo */
-        return cpu_riscv_read_rtc(mtimer->timebase_freq) & 0xFFFFFFFF;
+        /* time_lo for RV32/RV64 or timecmp for RV64 */
+        uint64_t rtc = cpu_riscv_read_rtc(mtimer->timebase_freq);
+        return (size == 4) ? (rtc & 0xFFFFFFFF) : rtc;
     } else if (addr == mtimer->time_base + 4) {
         /* time_hi */
         return (cpu_riscv_read_rtc(mtimer->timebase_freq) >> 32) & 0xFFFFFFFF;
@@ -167,18 +168,29 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
             qemu_log_mask(LOG_GUEST_ERROR,
                           "aclint-mtimer: invalid hartid: %zu", hartid);
         } else if ((addr & 0x7) == 0) {
-            /* timecmp_lo */
-            uint64_t timecmp_hi = env->timecmp >> 32;
-            riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
-                timecmp_hi << 32 | (value & 0xFFFFFFFF),
-                mtimer->timebase_freq);
-            return;
+            if (size == 4) {
+                /* timecmp_lo for RV32/RV64 */
+                uint64_t timecmp_hi = env->timecmp >> 32;
+                riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
+                    timecmp_hi << 32 | (value & 0xFFFFFFFF),
+                    mtimer->timebase_freq);
+            } else {
+                /* timecmp for RV64 */
+                riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
+                                                  value, mtimer->timebase_freq);
+            }
         } else if ((addr & 0x7) == 4) {
-            /* timecmp_hi */
-            uint64_t timecmp_lo = env->timecmp;
-            riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
-                value << 32 | (timecmp_lo & 0xFFFFFFFF),
-                mtimer->timebase_freq);
+            if (size == 4) {
+                /* timecmp_hi for RV32/RV64 */
+                uint64_t timecmp_lo = env->timecmp;
+                riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
+                    value << 32 | (timecmp_lo & 0xFFFFFFFF),
+                    mtimer->timebase_freq);
+            } else {
+                qemu_log_mask(LOG_UNIMP,
+                              "aclint-mtimer: invalid timecmp_hi write: %08x",
+                              (uint32_t)addr);
+            }
         } else {
             qemu_log_mask(LOG_UNIMP,
                           "aclint-mtimer: invalid timecmp write: %08x",
-- 
2.35.1


