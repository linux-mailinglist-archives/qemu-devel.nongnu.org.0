Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C11B1506
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 22:04:39 +0200 (CEST)
Received: from localhost ([::1]:38658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8VKY-0004jN-3g
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 16:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46142)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i8VFo-00016t-EI
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 15:59:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i8VFm-0005Jj-J6
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 15:59:44 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:40667)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i8VFm-0005Je-DY
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 15:59:42 -0400
Received: by mail-qk1-x743.google.com with SMTP id y144so17722774qkb.7
 for <qemu-devel@nongnu.org>; Thu, 12 Sep 2019 12:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MeiDoldNRDTDe/ONw2aHiXEaBsl1OBQ2+CgBlsXUesg=;
 b=WmUglH4gA5ukgBWxwQInZr+o45jdG7H2sk6Z4r3bCIqplTFcj+FTLOKWGpmHfJ+xgS
 DmCsBqG+jovfaxGqveYGx8OUFgJOn6H67UTttBahJwQF/14dt0qVm3a7943p+MpVRE02
 9zXDMexrBF67xARaZkBxkM5xRlcHtWeG6+T7hlkS97PIZ18QScElbn+EbU8na7p7PjY8
 5dmcavVNncJzNmCOFOjBxWErW2ofgqo+1GlJVJPy6Ah9mos1PfKgxmlQ/yVeDZCNPX8u
 9t0gI39I8qo9yIKkzIdDlmr4rLTVErylp0K++vcOTVrnPhqFNDekf1QktojuZ58ye2rf
 ITyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MeiDoldNRDTDe/ONw2aHiXEaBsl1OBQ2+CgBlsXUesg=;
 b=dYVNFxEiP1ZF1J/HPQF8VtChJ8FT6w5L3e8FZM0u65moBzauU61/HKlhoKyD5Rv6to
 HCIt56bGiQlq+dsnzGdHMMUNhxj3Ntn37DRBU+eIX2+0NZTQyW7Bt2dC3rQg1SDU07MM
 uLTvqGQ8jkfUzrjFdBuOPzEgkylGUHVjJ2z/st02XxjFQhePcd6TqrggVGDOfogo7un5
 0zBa8x8B97jlel0KptsCPYMtpLqmS0kAgBojZ1Eab9oOfKVc2tKd44bQ2LbG98Bbswje
 86wGA1asmvRBfaQ9JAVqNzyoEHX+NKyLskCbeaj50xQ9+Jb9LqYmOyxndygpyAKfEP/N
 n/EQ==
X-Gm-Message-State: APjAAAXTVZxiL3H6sGPBcjpJRoOgqvqV9XVbE8rp8ACwkiyc9PBIrCW+
 Ay+MyoyHTBQdyQK2+dUSVoOUvuYrFLpokQ==
X-Google-Smtp-Source: APXvYqy/l2wMSRG/fXSNxLrjqMAK671T7N6DTPgKB2ksqBVrI1KICrKYiv9AeJe9WKIlfBcp8q+s3w==
X-Received: by 2002:a05:620a:15c5:: with SMTP id
 o5mr41404009qkm.16.1568318381261; 
 Thu, 12 Sep 2019 12:59:41 -0700 (PDT)
Received: from localhost.localdomain ([67.69.50.154])
 by smtp.gmail.com with ESMTPSA id k11sm11140897qtp.26.2019.09.12.12.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2019 12:59:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 12 Sep 2019 15:59:34 -0400
Message-Id: <20190912195934.13502-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190912195934.13502-1-richard.henderson@linaro.org>
References: <20190912195934.13502-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::743
Subject: [Qemu-devel] [PATCH v2 3/3] cputlb: Introduce TLB_BSWAP
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
Cc: tony.nguyen@bt.com, mark.cave-ayland@ilande.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Handle bswap on ram directly in load/store_helper.  This fixes a
bug with the previous implementation in that one cannot use the
I/O path for RAM.

Fixes: a26fc6f5152b47f1
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h |   2 +
 accel/tcg/cputlb.c     | 118 ++++++++++++++++++++---------------------
 2 files changed, 59 insertions(+), 61 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index d2d443c4f9..3928edab9a 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -331,6 +331,8 @@ CPUArchState *cpu_copy(CPUArchState *env);
 #define TLB_MMIO            (1 << (TARGET_PAGE_BITS - 3))
 /* Set if TLB entry contains a watchpoint.  */
 #define TLB_WATCHPOINT      (1 << (TARGET_PAGE_BITS - 4))
+/* Set if TLB entry requires byte swap.  */
+#define TLB_BSWAP           (1 << (TARGET_PAGE_BITS - 5))
 
 /* Use this mask to check interception with an alignment mask
  * in a TCG backend.
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b4a63d3928..354a75927a 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -737,8 +737,7 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
         address |= TLB_INVALID_MASK;
     }
     if (attrs.byte_swap) {
-        /* Force the access through the I/O slow path.  */
-        address |= TLB_MMIO;
+        address |= TLB_BSWAP;
     }
     if (!memory_region_is_ram(section->mr) &&
         !memory_region_is_romd(section->mr)) {
@@ -901,10 +900,6 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
     bool locked = false;
     MemTxResult r;
 
-    if (iotlbentry->attrs.byte_swap) {
-        op ^= MO_BSWAP;
-    }
-
     section = iotlb_to_section(cpu, iotlbentry->addr, iotlbentry->attrs);
     mr = section->mr;
     mr_offset = (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
@@ -947,10 +942,6 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
     bool locked = false;
     MemTxResult r;
 
-    if (iotlbentry->attrs.byte_swap) {
-        op ^= MO_BSWAP;
-    }
-
     section = iotlb_to_section(cpu, iotlbentry->addr, iotlbentry->attrs);
     mr = section->mr;
     mr_offset = (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
@@ -1311,7 +1302,8 @@ static inline uint64_t wrap_ldul_le(const void *haddr)
 static inline uint64_t QEMU_ALWAYS_INLINE
 load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
             uintptr_t retaddr, MemOp op, bool code_read,
-            FullLoadHelper *full_load, LoadHelper *direct)
+            FullLoadHelper *full_load, LoadHelper *direct,
+            LoadHelper *direct_swap)
 {
     uintptr_t mmu_idx = get_mmuidx(oi);
     uintptr_t index = tlb_index(env, mmu_idx, addr);
@@ -1361,26 +1353,27 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
             /* On watchpoint hit, this will longjmp out.  */
             cpu_check_watchpoint(env_cpu(env), addr, size,
                                  iotlbentry->attrs, BP_MEM_READ, retaddr);
-
-            /* The backing page may or may not require I/O.  */
-            tlb_addr &= ~TLB_WATCHPOINT;
-            if ((tlb_addr & ~TARGET_PAGE_MASK) == 0) {
-                goto do_aligned_access;
-            }
         }
 
         /* Handle I/O access.  */
-        return io_readx(env, iotlbentry, mmu_idx, addr,
-                        retaddr, access_type, op);
-    }
+        if (likely(tlb_addr & TLB_MMIO)) {
+            return io_readx(env, iotlbentry, mmu_idx, addr,
+                            retaddr, access_type,
+                            op ^ (tlb_addr & TLB_BSWAP ? MO_BSWAP : 0));
+        }
 
-    /* Handle slow unaligned access (it spans two pages or IO).  */
-    if (size > 1
-        && unlikely((addr & ~TARGET_PAGE_MASK) + size - 1
-                    >= TARGET_PAGE_SIZE)) {
+        if (unlikely(tlb_addr & TLB_BSWAP)) {
+            haddr = (void *)((uintptr_t)addr + entry->addend);
+            return direct_swap(haddr);
+        }
+    } else if (size > 1
+               && unlikely((addr & ~TARGET_PAGE_MASK) + size - 1
+                           >= TARGET_PAGE_SIZE)) {
+        /* Handle slow unaligned access (it spans two pages or IO).  */
         target_ulong addr1, addr2;
         uint64_t r1, r2;
         unsigned shift;
+
     do_unaligned_access:
         addr1 = addr & ~((target_ulong)size - 1);
         addr2 = addr1 + size;
@@ -1398,7 +1391,6 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
         return res & MAKE_64BIT_MASK(0, size * 8);
     }
 
- do_aligned_access:
     haddr = (void *)((uintptr_t)addr + entry->addend);
     return direct(haddr);
 }
@@ -1417,7 +1409,7 @@ static uint64_t full_ldub_mmu(CPUArchState *env, target_ulong addr,
                               TCGMemOpIdx oi, uintptr_t retaddr)
 {
     return load_helper(env, addr, oi, retaddr, MO_UB, false,
-                       full_ldub_mmu, wrap_ldub);
+                       full_ldub_mmu, wrap_ldub, wrap_ldub);
 }
 
 tcg_target_ulong helper_ret_ldub_mmu(CPUArchState *env, target_ulong addr,
@@ -1430,7 +1422,7 @@ static uint64_t full_le_lduw_mmu(CPUArchState *env, target_ulong addr,
                                  TCGMemOpIdx oi, uintptr_t retaddr)
 {
     return load_helper(env, addr, oi, retaddr, MO_LEUW, false,
-                       full_le_lduw_mmu, wrap_lduw_le);
+                       full_le_lduw_mmu, wrap_lduw_le, wrap_lduw_be);
 }
 
 tcg_target_ulong helper_le_lduw_mmu(CPUArchState *env, target_ulong addr,
@@ -1443,7 +1435,7 @@ static uint64_t full_be_lduw_mmu(CPUArchState *env, target_ulong addr,
                                  TCGMemOpIdx oi, uintptr_t retaddr)
 {
     return load_helper(env, addr, oi, retaddr, MO_BEUW, false,
-                       full_be_lduw_mmu, wrap_lduw_be);
+                       full_be_lduw_mmu, wrap_lduw_be, wrap_lduw_le);
 }
 
 tcg_target_ulong helper_be_lduw_mmu(CPUArchState *env, target_ulong addr,
@@ -1456,7 +1448,7 @@ static uint64_t full_le_ldul_mmu(CPUArchState *env, target_ulong addr,
                                  TCGMemOpIdx oi, uintptr_t retaddr)
 {
     return load_helper(env, addr, oi, retaddr, MO_LEUL, false,
-                       full_le_ldul_mmu, wrap_ldul_le);
+                       full_le_ldul_mmu, wrap_ldul_le, wrap_ldul_be);
 }
 
 tcg_target_ulong helper_le_ldul_mmu(CPUArchState *env, target_ulong addr,
@@ -1469,7 +1461,7 @@ static uint64_t full_be_ldul_mmu(CPUArchState *env, target_ulong addr,
                                  TCGMemOpIdx oi, uintptr_t retaddr)
 {
     return load_helper(env, addr, oi, retaddr, MO_BEUL, false,
-                       full_be_ldul_mmu, wrap_ldul_be);
+                       full_be_ldul_mmu, wrap_ldul_be, wrap_ldul_le);
 }
 
 tcg_target_ulong helper_be_ldul_mmu(CPUArchState *env, target_ulong addr,
@@ -1482,14 +1474,14 @@ uint64_t helper_le_ldq_mmu(CPUArchState *env, target_ulong addr,
                            TCGMemOpIdx oi, uintptr_t retaddr)
 {
     return load_helper(env, addr, oi, retaddr, MO_LEQ, false,
-                       helper_le_ldq_mmu, ldq_le_p);
+                       helper_le_ldq_mmu, ldq_le_p, ldq_be_p);
 }
 
 uint64_t helper_be_ldq_mmu(CPUArchState *env, target_ulong addr,
                            TCGMemOpIdx oi, uintptr_t retaddr)
 {
     return load_helper(env, addr, oi, retaddr, MO_BEQ, false,
-                       helper_be_ldq_mmu, ldq_be_p);
+                       helper_be_ldq_mmu, ldq_be_p, ldq_le_p);
 }
 
 /*
@@ -1563,7 +1555,7 @@ static inline void wrap_stl_le(void *haddr, uint64_t val)
 static inline void QEMU_ALWAYS_INLINE
 store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
              TCGMemOpIdx oi, uintptr_t retaddr, MemOp op,
-             StoreHelper *direct)
+             StoreHelper *direct, StoreHelper *direct_swap)
 {
     uintptr_t mmu_idx = get_mmuidx(oi);
     uintptr_t index = tlb_index(env, mmu_idx, addr);
@@ -1608,23 +1600,24 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
             /* On watchpoint hit, this will longjmp out.  */
             cpu_check_watchpoint(env_cpu(env), addr, size,
                                  iotlbentry->attrs, BP_MEM_WRITE, retaddr);
-
-            /* The backing page may or may not require I/O.  */
-            tlb_addr &= ~TLB_WATCHPOINT;
-            if ((tlb_addr & ~TARGET_PAGE_MASK) == 0) {
-                goto do_aligned_access;
-            }
         }
 
         /* Handle I/O access.  */
-        io_writex(env, iotlbentry, mmu_idx, val, addr, retaddr, op);
-        return;
-    }
+        if (likely(tlb_addr & (TLB_MMIO | TLB_NOTDIRTY))) {
+            io_writex(env, iotlbentry, mmu_idx, val, addr, retaddr,
+                      op ^ (tlb_addr & TLB_BSWAP ? MO_BSWAP : 0));
+            return;
+        }
 
-    /* Handle slow unaligned access (it spans two pages or IO).  */
-    if (size > 1
-        && unlikely((addr & ~TARGET_PAGE_MASK) + size - 1
-                     >= TARGET_PAGE_SIZE)) {
+        if (unlikely(tlb_addr & TLB_BSWAP)) {
+            haddr = (void *)((uintptr_t)addr + entry->addend);
+            direct_swap(haddr, val);
+            return;
+        }
+    } else if (size > 1
+               && unlikely((addr & ~TARGET_PAGE_MASK) + size - 1
+                            >= TARGET_PAGE_SIZE)) {
+        /* Handle slow unaligned access (it spans two pages or IO).  */
         int i;
         uintptr_t index2;
         CPUTLBEntry *entry2;
@@ -1686,7 +1679,6 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
         return;
     }
 
- do_aligned_access:
     haddr = (void *)((uintptr_t)addr + entry->addend);
     direct(haddr, val);
 }
@@ -1694,43 +1686,47 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
 void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
                         TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    store_helper(env, addr, val, oi, retaddr, MO_UB, wrap_stb);
+    store_helper(env, addr, val, oi, retaddr, MO_UB, wrap_stb, wrap_stb);
 }
 
 void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
                        TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    store_helper(env, addr, val, oi, retaddr, MO_LEUW, wrap_stw_le);
+    store_helper(env, addr, val, oi, retaddr, MO_LEUW,
+                 wrap_stw_le, wrap_stw_be);
 }
 
 void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
                        TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    store_helper(env, addr, val, oi, retaddr, MO_BEUW, wrap_stw_be);
+    store_helper(env, addr, val, oi, retaddr, MO_BEUW,
+                 wrap_stw_be, wrap_stw_le);
 }
 
 void helper_le_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    store_helper(env, addr, val, oi, retaddr, MO_LEUL, wrap_stl_le);
+    store_helper(env, addr, val, oi, retaddr, MO_LEUL,
+                 wrap_stl_le, wrap_stl_be);
 }
 
 void helper_be_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    store_helper(env, addr, val, oi, retaddr, MO_BEUL, wrap_stl_be);
+    store_helper(env, addr, val, oi, retaddr, MO_BEUL,
+                 wrap_stl_be, wrap_stl_le);
 }
 
 void helper_le_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                        TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    store_helper(env, addr, val, oi, retaddr, MO_LEQ, stq_le_p);
+    store_helper(env, addr, val, oi, retaddr, MO_LEQ, stq_le_p, stq_be_p);
 }
 
 void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                        TCGMemOpIdx oi, uintptr_t retaddr)
 {
-    store_helper(env, addr, val, oi, retaddr, MO_BEQ, stq_be_p);
+    store_helper(env, addr, val, oi, retaddr, MO_BEQ, stq_be_p, stq_le_p);
 }
 
 /* First set of helpers allows passing in of OI and RETADDR.  This makes
@@ -1796,7 +1792,7 @@ static uint64_t full_ldub_cmmu(CPUArchState *env, target_ulong addr,
                                TCGMemOpIdx oi, uintptr_t retaddr)
 {
     return load_helper(env, addr, oi, retaddr, MO_8, true,
-                       full_ldub_cmmu, wrap_ldub);
+                       full_ldub_cmmu, wrap_ldub, wrap_ldub);
 }
 
 uint8_t helper_ret_ldb_cmmu(CPUArchState *env, target_ulong addr,
@@ -1809,7 +1805,7 @@ static uint64_t full_le_lduw_cmmu(CPUArchState *env, target_ulong addr,
                                   TCGMemOpIdx oi, uintptr_t retaddr)
 {
     return load_helper(env, addr, oi, retaddr, MO_LEUW, true,
-                       full_le_lduw_cmmu, wrap_lduw_le);
+                       full_le_lduw_cmmu, wrap_lduw_le, wrap_lduw_be);
 }
 
 uint16_t helper_le_ldw_cmmu(CPUArchState *env, target_ulong addr,
@@ -1822,7 +1818,7 @@ static uint64_t full_be_lduw_cmmu(CPUArchState *env, target_ulong addr,
                                   TCGMemOpIdx oi, uintptr_t retaddr)
 {
     return load_helper(env, addr, oi, retaddr, MO_BEUW, true,
-                       full_be_lduw_cmmu, wrap_lduw_be);
+                       full_be_lduw_cmmu, wrap_lduw_be, wrap_lduw_le);
 }
 
 uint16_t helper_be_ldw_cmmu(CPUArchState *env, target_ulong addr,
@@ -1835,7 +1831,7 @@ static uint64_t full_le_ldul_cmmu(CPUArchState *env, target_ulong addr,
                                   TCGMemOpIdx oi, uintptr_t retaddr)
 {
     return load_helper(env, addr, oi, retaddr, MO_LEUL, true,
-                       full_le_ldul_cmmu, wrap_ldul_le);
+                       full_le_ldul_cmmu, wrap_ldul_le, wrap_ldul_be);
 }
 
 uint32_t helper_le_ldl_cmmu(CPUArchState *env, target_ulong addr,
@@ -1848,7 +1844,7 @@ static uint64_t full_be_ldul_cmmu(CPUArchState *env, target_ulong addr,
                                   TCGMemOpIdx oi, uintptr_t retaddr)
 {
     return load_helper(env, addr, oi, retaddr, MO_BEUL, true,
-                       full_be_ldul_cmmu, wrap_ldul_be);
+                       full_be_ldul_cmmu, wrap_ldul_be, wrap_ldul_le);
 }
 
 uint32_t helper_be_ldl_cmmu(CPUArchState *env, target_ulong addr,
@@ -1861,12 +1857,12 @@ uint64_t helper_le_ldq_cmmu(CPUArchState *env, target_ulong addr,
                             TCGMemOpIdx oi, uintptr_t retaddr)
 {
     return load_helper(env, addr, oi, retaddr, MO_LEQ, true,
-                       helper_le_ldq_cmmu, ldq_le_p);
+                       helper_le_ldq_cmmu, ldq_le_p, ldq_be_p);
 }
 
 uint64_t helper_be_ldq_cmmu(CPUArchState *env, target_ulong addr,
                             TCGMemOpIdx oi, uintptr_t retaddr)
 {
     return load_helper(env, addr, oi, retaddr, MO_BEQ, true,
-                       helper_be_ldq_cmmu, ldq_be_p);
+                       helper_be_ldq_cmmu, ldq_be_p, ldq_le_p);
 }
-- 
2.17.1


