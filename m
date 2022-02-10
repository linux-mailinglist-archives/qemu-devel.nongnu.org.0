Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B774B0C7E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 12:39:10 +0100 (CET)
Received: from localhost ([::1]:40130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI7n3-0002bx-6b
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 06:39:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nI7ee-0003hr-4T
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:30:28 -0500
Received: from [2a00:1450:4864:20::62f] (port=33735
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nI7eb-0002VP-L2
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:30:27 -0500
Received: by mail-ej1-x62f.google.com with SMTP id fy20so14507929ejc.0
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 03:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A473qbjGyhHnN0ZQyd0Yg8rCuTL/rArhdYtN54HK9fc=;
 b=gAaJXt9+Pcc1amrW6/4raCME0JCmTtXkvfAoifDAYnAAfJImvW83uWbgKA3lXjYwIv
 7Azi9V/6J0StO/FmWDwqer49IjhmSaCtVLxZhHomVetfjKlRJs/b8TXUzHL/dSs3UTs3
 V7Qqnjw8Q8GiTuuqVEiOfsyN2LSR+pxAHZ7aa4oKzTi4tmY7GtDUzg2bb+5ZHOX4Xxrm
 1V40GlO6N09cfOO+QqDCp1/uCRsYL+pj8bwzIMHA07xMALlpp84cyjeKW0KMzFufzG8i
 Zw5KjAjAtDoXbEG1v3obWaDzc0ecUkg1qCRw5kDJXh2FXFfsfD1WtPjzc4oS7XKNyCEy
 pvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A473qbjGyhHnN0ZQyd0Yg8rCuTL/rArhdYtN54HK9fc=;
 b=BWQEBUhPUz+n7tyA4CcZPZMj4DglIdwRuk2R8rcw7+uOGoTApr0KkmUdv3k3+YNEE+
 xS6CCOjF0RY2tjKMMj80U/Yab9TVUaXb3bx9ZKgKSTf7oYYrD1s13dd1YQ6yornD9me/
 E/JeXIEnQRCHW9j+Q0AMmlaQiJHwAaRI+uq/ijofD9oNM83PyPt/EZbpzfQbJ1ju/eBP
 5yQLVrTeCQo9WpG+cpN0DnLPOXrzb/yij2VReZC+E0o8b0c8XX2Sss4FVHyf/fA9Pays
 aOSLYNIADnt0n/d+ukDaBFZjY3/EZE6xpu/EPpiQWVsJS/f5pLNqd1J7Gzv7Au7RKuaS
 sdJg==
X-Gm-Message-State: AOAM5304Ocn8ASmOU7wPb6wwQ8uURB2FiyHZR3JaeFXMVkUojZb6eqn6
 MtU/U9BKv4cglFweNVUfJYx0/Q==
X-Google-Smtp-Source: ABdhPJzDOjY7y7h0fPlLMMgZeBC7mNLN02/8RXcMgSIaEkQNLK88SWzoiPrHl8UFRVCGbVK6XavVcg==
X-Received: by 2002:a17:907:3da1:: with SMTP id
 he33mr5997248ejc.207.1644492624027; 
 Thu, 10 Feb 2022 03:30:24 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m4sm1910267ejl.45.2022.02.10.03.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 03:30:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A04971FFB8;
 Thu, 10 Feb 2022 11:30:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v5 1/2] semihosting/arm-compat: replace heuristic for softmmu
 SYS_HEAPINFO
Date: Thu, 10 Feb 2022 11:30:20 +0000
Message-Id: <20220210113021.3799514-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220210113021.3799514-1-alex.bennee@linaro.org>
References: <20220210113021.3799514-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Strauss <astrauss11@gmail.com>, Keith Packard <keithp@keithp.com>,
 qemu-arm@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The previous numbers were a guess at best and rather arbitrary without
taking into account anything that might be loaded. Instead of using
guesses based on the state of registers implement a new function that:

 a) scans the MemoryRegions for the largest RAM block
 b) iterates through all "ROM" blobs looking for the biggest gap

The "ROM" blobs include all code loaded via -kernel and the various
-device loader techniques.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Andrew Strauss <astrauss11@gmail.com>
Cc: Keith Packard <keithp@keithp.com>
Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>

---
v2
  - report some known information (limits)
  - reword the commit message
v3
  - rework to use the ROM blob scanning suggested by Peter
  - drop arch specific wrappers
  - dropped rb/tb tags as it's a rework
v4
  - search for the largest RAM which should be the main RAM
  - implement the biggest gap algorithm
  - make stackbase the inverse of heap info
v5
  - move rom_find_largest_gap description to above fn and reword
  - add documentation of sort behaviour
  - handle matching se flags (- -1 -1) and (- 1 1) == 0
  - add helper function and sentinal
  - fix off-by-ones in comparisons
  - allow a rambase at 0

squash! semihosting/arm-compat: replace heuristic for softmmu SYS_HEAPINFO
---
 include/hw/loader.h           |  14 ++++
 hw/core/loader.c              |  86 +++++++++++++++++++++++
 semihosting/arm-compat-semi.c | 129 ++++++++++++++++++----------------
 3 files changed, 168 insertions(+), 61 deletions(-)

diff --git a/include/hw/loader.h b/include/hw/loader.h
index 4fa485bd61..5572108ba5 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -343,4 +343,18 @@ int rom_add_option(const char *file, int32_t bootindex);
  * overflow on real hardware too. */
 #define UBOOT_MAX_GUNZIP_BYTES (64 << 20)
 
+typedef struct RomGap {
+    hwaddr base;
+    size_t size;
+} RomGap;
+
+/**
+ * rom_find_largest_gap_between: return largest gap between ROMs in given range
+ *
+ * Given a range of addresses, this function finds the largest
+ * contiguous subrange which has no ROMs loaded to it. That is,
+ * it finds the biggest gap which is free for use for other things.
+ */
+RomGap rom_find_largest_gap_between(hwaddr base, size_t size);
+
 #endif
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 19edb928e9..ca2f2431fb 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1333,6 +1333,92 @@ static Rom *find_rom(hwaddr addr, size_t size)
     return NULL;
 }
 
+typedef struct RomSec {
+    hwaddr base;
+    int se; /* start/end flag */
+} RomSec;
+
+
+/*
+ * Sort into address order. We break ties between rom-startpoints
+ * and rom-endpoints in favour of the startpoint, by sorting the 0->1
+ * transition before the 1->0 transition. Either way round would
+ * work, but this way saves a little work later by avoiding
+ * dealing with "gaps" of 0 length.
+ */
+static gint sort_secs(gconstpointer a, gconstpointer b)
+{
+    RomSec *ra = (RomSec *) a;
+    RomSec *rb = (RomSec *) b;
+
+    if (ra->base == rb->base) {
+        return ra->se - rb->se;
+    }
+    return ra->base > rb->base ? 1 : -1;
+}
+
+static GList *add_romsec_to_list(GList *secs, hwaddr base, int se)
+{
+   RomSec *cand = g_new(RomSec, 1);
+   cand->base = base;
+   cand->se = se;
+   return g_list_prepend(secs, cand);
+}
+
+RomGap rom_find_largest_gap_between(hwaddr base, size_t size)
+{
+    Rom *rom;
+    RomSec *cand;
+    RomGap res = {0, 0};
+    hwaddr gapstart = base;
+    GList *it, *secs = NULL;
+    int count = 0;
+
+    QTAILQ_FOREACH(rom, &roms, next) {
+        /* Ignore blobs being loaded to special places */
+        if (rom->mr || rom->fw_file) {
+            continue;
+        }
+        /* ignore anything finishing bellow base */
+        if (rom->addr + rom->romsize <= base) {
+            continue;
+        }
+        /* ignore anything starting above the region */
+        if (rom->addr >= base + size) {
+            continue;
+        }
+
+        /* Save the start and end of each relevant ROM */
+        secs = add_romsec_to_list(secs, rom->addr, 1);
+
+        if (rom->addr + rom->romsize < base + size) {
+            secs = add_romsec_to_list(secs, rom->addr + rom->romsize, -1);
+        }
+    }
+
+    /* sentinel */
+    secs = add_romsec_to_list(secs, base + size, 1);
+
+    secs = g_list_sort(secs, sort_secs);
+
+    for (it = g_list_first(secs); it; it = g_list_next(it)) {
+        cand = (RomSec *) it->data;
+        if (count == 0 && count + cand->se == 1) {
+            size_t gap = cand->base - gapstart;
+            if (gap > res.size) {
+                res.base = gapstart;
+                res.size = gap;
+            }
+        } else if (count == 1 && count + cand->se == 0) {
+            gapstart = cand->base;
+        }
+        count += cand->se;
+    }
+
+    g_list_free_full(secs, g_free);
+    return res;
+}
+
 /*
  * Copies memory from registered ROMs to dest. Any memory that is contained in
  * a ROM between addr and addr + size is copied. Note that this can involve
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 37963becae..3704b250b2 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -44,6 +44,7 @@
 #define COMMON_SEMI_HEAP_SIZE (128 * 1024 * 1024)
 #else
 #include "qemu/cutils.h"
+#include "hw/loader.h"
 #ifdef TARGET_ARM
 #include "hw/arm/boot.h"
 #endif
@@ -144,33 +145,69 @@ typedef struct GuestFD {
 static GArray *guestfd_array;
 
 #ifndef CONFIG_USER_ONLY
-#include "exec/address-spaces.h"
-/*
- * Find the base of a RAM region containing the specified address
+
+/**
+ * common_semi_find_bases: find information about ram and heap base
+ *
+ * This function attempts to provide meaningful numbers for RAM and
+ * HEAP base addresses. The rambase is simply the lowest addressable
+ * RAM position. For the heapbase we ask the loader to scan the
+ * address space and the largest available gap by querying the "ROM"
+ * regions.
+ *
+ * Returns: a structure with the numbers we need.
  */
-static inline hwaddr
-common_semi_find_region_base(hwaddr addr)
+
+typedef struct LayoutInfo {
+    target_ulong rambase;
+    size_t ramsize;
+    hwaddr heapbase;
+    hwaddr heaplimit;
+} LayoutInfo;
+
+static bool find_ram_cb(Int128 start, Int128 len, const MemoryRegion *mr,
+                        hwaddr offset_in_region, void *opaque)
+{
+    LayoutInfo *info = (LayoutInfo *) opaque;
+    uint64_t size = int128_get64(len);
+
+    if (!mr->ram || mr->readonly) {
+        return false;
+    }
+
+    if (size > info->ramsize) {
+        info->rambase = int128_get64(start);
+        info->ramsize = size;
+    }
+
+    /* search exhaustively for largest RAM */
+    return false;
+}
+
+static LayoutInfo common_semi_find_bases(CPUState *cs)
 {
-    MemoryRegion *subregion;
+    FlatView *fv;
+    LayoutInfo info = { 0, 0, 0, 0 };
+
+    RCU_READ_LOCK_GUARD();
+
+    fv = address_space_to_flatview(cs->as);
+    flatview_for_each_range(fv, find_ram_cb, &info);
 
     /*
-     * Find the chunk of R/W memory containing the address.  This is
-     * used for the SYS_HEAPINFO semihosting call, which should
-     * probably be using information from the loaded application.
+     * If we have found the RAM lets iterate through the ROM blobs to
+     * workout the best place for the remainder of RAM and split it
+     * equally between stack and heap.
      */
-    QTAILQ_FOREACH(subregion, &get_system_memory()->subregions,
-                   subregions_link) {
-        if (subregion->ram && !subregion->readonly) {
-            Int128 top128 = int128_add(int128_make64(subregion->addr),
-                                       subregion->size);
-            Int128 addr128 = int128_make64(addr);
-            if (subregion->addr <= addr && int128_lt(addr128, top128)) {
-                return subregion->addr;
-            }
-        }
+    if (info.rambase || info.ramsize > 0) {
+        RomGap gap = rom_find_largest_gap_between(info.rambase, info.ramsize);
+        info.heapbase = gap.base;
+        info.heaplimit = gap.base + gap.size;
     }
-    return 0;
+
+    return info;
 }
+
 #endif
 
 #ifdef TARGET_ARM
@@ -204,28 +241,6 @@ common_semi_sys_exit_extended(CPUState *cs, int nr)
     return (nr == TARGET_SYS_EXIT_EXTENDED || is_a64(cs->env_ptr));
 }
 
-#ifndef CONFIG_USER_ONLY
-#include "hw/arm/boot.h"
-static inline target_ulong
-common_semi_rambase(CPUState *cs)
-{
-    CPUArchState *env = cs->env_ptr;
-    const struct arm_boot_info *info = env->boot_info;
-    target_ulong sp;
-
-    if (info) {
-        return info->loader_start;
-    }
-
-    if (is_a64(env)) {
-        sp = env->xregs[31];
-    } else {
-        sp = env->regs[13];
-    }
-    return common_semi_find_region_base(sp);
-}
-#endif
-
 #endif /* TARGET_ARM */
 
 #ifdef TARGET_RISCV
@@ -251,17 +266,6 @@ common_semi_sys_exit_extended(CPUState *cs, int nr)
     return (nr == TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) == 8);
 }
 
-#ifndef CONFIG_USER_ONLY
-
-static inline target_ulong
-common_semi_rambase(CPUState *cs)
-{
-    RISCVCPU *cpu = RISCV_CPU(cs);
-    CPURISCVState *env = &cpu->env;
-    return common_semi_find_region_base(env->gpr[xSP]);
-}
-#endif
-
 #endif
 
 /*
@@ -1165,12 +1169,12 @@ target_ulong do_common_semihosting(CPUState *cs)
     case TARGET_SYS_HEAPINFO:
         {
             target_ulong retvals[4];
-            target_ulong limit;
             int i;
 #ifdef CONFIG_USER_ONLY
             TaskState *ts = cs->opaque;
+            target_ulong limit;
 #else
-            target_ulong rambase = common_semi_rambase(cs);
+            LayoutInfo info = common_semi_find_bases(cs);
 #endif
 
             GET_ARG(0);
@@ -1201,12 +1205,15 @@ target_ulong do_common_semihosting(CPUState *cs)
             retvals[2] = ts->stack_base;
             retvals[3] = 0; /* Stack limit.  */
 #else
-            limit = current_machine->ram_size;
-            /* TODO: Make this use the limit of the loaded application.  */
-            retvals[0] = rambase + limit / 2;
-            retvals[1] = rambase + limit;
-            retvals[2] = rambase + limit; /* Stack base */
-            retvals[3] = rambase; /* Stack limit.  */
+            /*
+             * Reporting 0 indicates we couldn't calculate the real
+             * values which should force most software to fall back to
+             * using information it has.
+             */
+            retvals[0] = info.heapbase;  /* Heap Base */
+            retvals[1] = info.heaplimit; /* Heap Limit */
+            retvals[2] = info.heaplimit; /* Stack base */
+            retvals[3] = info.heapbase;  /* Stack limit.  */
 #endif
 
             for (i = 0; i < ARRAY_SIZE(retvals); i++) {
-- 
2.30.2


