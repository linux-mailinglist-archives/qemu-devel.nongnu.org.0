Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D8A3A16B4
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 16:12:19 +0200 (CEST)
Received: from localhost ([::1]:50176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqywM-0006HH-Vx
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 10:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lqyuX-0003k1-8O
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:10:26 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:35438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lqyuV-0006QH-Dm
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:10:25 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 k5-20020a05600c1c85b02901affeec3ef8so4435050wms.0
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 07:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cuhVhtS4uB4qhQc1SbOfv31p5K7UypZDG5J1mCuh5mk=;
 b=PABDiovBdnW5xAST3wfDXOSnd/vSEZPzNTAKz9pih1Gt9HRvcgXaCADnqaYXtT1Mbr
 vas6GtpG1kvFqlrESMr+ZBhSb+qwY09/Q9k9zlaT+zb0Gr9kuShc6AVOPO4DoroWzKWe
 OIw+cZupY6tpyiAYhI5l0ugr7zj9vXTjBv2V/oPwy/lbMq/Q0Krw0qe5PND5GOYUBbuZ
 22IMgYSMyi98R7n9uhHXpG60z4mqK73iGTcM4CPcHJh+hxj5ZM+GiT6OjLaZBJ0hdNPN
 yLO4Z4NdcuyMyiAPTdDw/g5vlqNwe+0+MmTymp/B4qxo8GlxuDzfwPOJ4o+ck4YhHuxM
 HDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cuhVhtS4uB4qhQc1SbOfv31p5K7UypZDG5J1mCuh5mk=;
 b=jg8ObvZBa9wvWkyMkQMv9sco9xfEuPqd4jdd4mkdbFYbA26m9rHzEvme+YZT/dlF9U
 DYw05jwqlpQLkckGdzguzFGjaY3XJEN1q9A96xT1HkeAghKw/zSsKcf3b7OB+Sy0LvVd
 JX0R914CJdBZtc6zHzpkyE5F6tK1TFW+epOVwXZwfUc+4Fd0RzcV5V/A6DXpCKY3urEC
 qzZH6LVEpmcCZ1IkcaUAyEOpZ5gi+Rkt0+2+rhLZqXCm9CMT4fLmxidPQWRUNutD4Ufu
 8eeqyf3n6FjcR+a+vV+vzQv5JknatfFojrXW1qQfEU4eyd444NFYkHqeiBjFTmU3WOk4
 Wy1w==
X-Gm-Message-State: AOAM533zCu+Fr8xkIEa6pf09l80zkDcGYxZtTZnSbCRsHqBhiswD7/kO
 TPqoBpz4znss9EHKA377DDoKpz2vFSZ/Bw==
X-Google-Smtp-Source: ABdhPJwi4ZIsuG2y9uz+H+2a4Le3wnz7iXU5lYDa7AjNoPzF00nG5e14uqIUDFpdcq9VNTTKDkpiMg==
X-Received: by 2002:a1c:f60f:: with SMTP id w15mr10052226wmc.5.1623247821792; 
 Wed, 09 Jun 2021 07:10:21 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id o129sm6840928wmo.22.2021.06.09.07.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 07:10:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 2/2] cputlb: implement load_helper_unaligned() for
 unaligned loads
Date: Wed,  9 Jun 2021 16:10:10 +0200
Message-Id: <20210609141010.1066750-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609141010.1066750-1-f4bug@amsat.org>
References: <20210609141010.1066750-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

[RFC because this is currently only lightly tested and there have been some
discussions about whether this should be handled elsewhere in the memory API]

If an unaligned load is required then the load is split into 2 separate accesses
and combined together within load_helper(). This does not work correctly with
MMIO accesses because the original access size is used for both individual
accesses causing the little and big endian combine to return the wrong result.

There is already a similar solution in place for store_helper() where an unaligned
access is handled by a separate store_helper_unaligned() function which instead
of using the original access size, uses a single-byte access size to shift and
combine the result correctly regardless of the orignal access size or endian.

Implement a similar load_helper_unaligned() function which uses the same approach
for unaligned loads to return the correct result according to the original test
case.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/360
Message-Id: <20210609093528.9616-1-mark.cave-ayland@ilande.co.uk>
[PMD: Extract load_helper_unaligned() in earlier patch]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/cputlb.c | 84 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 68 insertions(+), 16 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 2b5d569412c..f8a790d8b4a 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1856,27 +1856,79 @@ load_helper_unaligned(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
                       uintptr_t retaddr, MemOp op, bool code_read,
                       FullLoadHelper *full_load)
 {
+    uintptr_t mmu_idx = get_mmuidx(oi);
     size_t size = memop_size(op);
-    target_ulong addr1, addr2;
-    uint64_t res;
-    uint64_t r1, r2;
-    unsigned shift;
+    uintptr_t index, index2;
+    CPUTLBEntry *entry, *entry2;
+    const size_t tlb_off = code_read ?
+        offsetof(CPUTLBEntry, addr_code) : offsetof(CPUTLBEntry, addr_read);
+    const MMUAccessType access_type =
+        code_read ? MMU_INST_FETCH : MMU_DATA_LOAD;
+    target_ulong page2, tlb_addr, tlb_addr2;
+    uint64_t val = 0;
+    size_t size2;
+    int i;
 
-    addr1 = addr & ~((target_ulong)size - 1);
-    addr2 = addr1 + size;
-    r1 = full_load(env, addr1, oi, retaddr);
-    r2 = full_load(env, addr2, oi, retaddr);
-    shift = (addr & (size - 1)) * 8;
+    /*
+     * Ensure the second page is in the TLB.  Note that the first page
+     * is already guaranteed to be filled, and that the second page
+     * cannot evict the first.
+     */
+    page2 = (addr + size) & TARGET_PAGE_MASK;
+    size2 = (addr + size) & ~TARGET_PAGE_MASK;
+    index2 = tlb_index(env, mmu_idx, page2);
+    entry2 = tlb_entry(env, mmu_idx, page2);
 
-    if (memop_big_endian(op)) {
-        /* Big-endian combine.  */
-        res = (r1 << shift) | (r2 >> ((size * 8) - shift));
-    } else {
-        /* Little-endian combine.  */
-        res = (r1 >> shift) | (r2 << ((size * 8) - shift));
+    tlb_addr2 = code_read ? entry2->addr_code : entry2->addr_read;
+    if (!tlb_hit_page(tlb_addr2, page2)) {
+        if (!victim_tlb_hit(env, mmu_idx, index2, tlb_off, page2)) {
+            tlb_fill(env_cpu(env), page2, size2, access_type,
+                     mmu_idx, retaddr);
+            index2 = tlb_index(env, mmu_idx, page2);
+            entry2 = tlb_entry(env, mmu_idx, page2);
+        }
+        tlb_addr2 = code_read ? entry2->addr_code : entry2->addr_read;
     }
 
-    return res & MAKE_64BIT_MASK(0, size * 8);
+    index = tlb_index(env, mmu_idx, addr);
+    entry = tlb_entry(env, mmu_idx, addr);
+    tlb_addr = code_read ? entry->addr_code : entry->addr_read;
+
+    /*
+     * Handle watchpoints
+     */
+    if (unlikely(tlb_addr & TLB_WATCHPOINT)) {
+        cpu_check_watchpoint(env_cpu(env), addr, size - size2,
+                             env_tlb(env)->d[mmu_idx].iotlb[index].attrs,
+                             BP_MEM_READ, retaddr);
+    }
+    if (unlikely(tlb_addr2 & TLB_WATCHPOINT)) {
+        cpu_check_watchpoint(env_cpu(env), page2, size2,
+                             env_tlb(env)->d[mmu_idx].iotlb[index2].attrs,
+                             BP_MEM_READ, retaddr);
+    }
+
+    /*
+     * XXX: not efficient, but simple.
+     * This loop must go in the forward direction to avoid issues
+     * with self-modifying code in Windows 64-bit.
+     */
+    oi = make_memop_idx(MO_UB, mmu_idx);
+    if (memop_big_endian(op)) {
+        for (i = 0; i < size; ++i) {
+            /* Big-endian load.  */
+            uint8_t val8 = helper_ret_ldub_mmu(env, addr + i, oi, retaddr);
+            val |= val8 << (((size - 1) * 8) - (i * 8));
+        }
+    } else {
+        for (i = 0; i < size; ++i) {
+            /* Little-endian load.  */
+            uint8_t val8 = helper_ret_ldub_mmu(env, addr + i, oi, retaddr);
+            val |= val8 << (i * 8);
+        }
+    }
+
+    return val & MAKE_64BIT_MASK(0, size * 8);
 }
 
 static inline uint64_t QEMU_ALWAYS_INLINE
-- 
2.31.1


