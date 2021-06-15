Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2723A870F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:05:44 +0200 (CEST)
Received: from localhost ([::1]:46040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCVT-0001JL-9O
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltCOB-00016G-SB
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:58:11 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:52796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltCO8-00016Q-HR
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:58:11 -0400
Received: by mail-wm1-x336.google.com with SMTP id f17so14557272wmf.2
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 09:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U+RIbu8aPQRZm4f0hGGtHAk23KeDn4Q5HkC3wPCLbvo=;
 b=R8htJXSwqLvj6cPOnKu8PgddpUHucya+VEcbmBt9uBJYuLZT0fSk8FpWF28wh3A7Fu
 yRnncdc5K+Eb4POT3oVg9A8ElemS4MWqPNbtzmz7158iIxU3JpB+49+NsImRdt4BqB1t
 UJmrKVj7ZiPcX+npw9/Ms0yeITR2a+fyzfRGfiUSxQOjqu3sisVuXYZasi4v+ydV4vss
 HLSO+90EEbwjhsR4sUkkt0RNnNc1BjHe/yie3J0qGARHoOUJk/AhHhP57Dt7AE31RMg6
 2yu9tcRKfcUKTZHCNcrCQMfpCy68KT4l+E5v2cAIi3Le7dNGi/T/CK2BBuJ2NyG88PRR
 H6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U+RIbu8aPQRZm4f0hGGtHAk23KeDn4Q5HkC3wPCLbvo=;
 b=K17MIsGyHOG0D4gQqq/y/cQaeBMWwmAuTdkL5jDocDQE+qEcI3QP7jSnZnfMKaCbLu
 vE84wVzmHapLwhz7cTdzZ5tM6gvCNEY4shdslMkda71k8kLdZAhCWbdbT5okkGKz6NmL
 BjyKisd8UTIjnnK8dqVAhMTEqr3UylvEDBNiqF1wX6avcLdwdqXpgHTTX/008wm4kEzc
 9BFQM1o1tMrOFXa4X97D7+heYBpHys3tKEiCvZRR2xDDwdAHlWEbAQNblcN3qFsWH8gS
 15xOwtNN3XBAzQn4DLJMixE+mLPjCZ0+Mt7qhFWApx0T0emFE2HK2tmzXBr7UP3dujxy
 +6WQ==
X-Gm-Message-State: AOAM530duQbOjJ9EO8Ph15nJ4C1cqpG3i+26Rtl4dBK1h3piuzIu3jKc
 wD6rerrWfQbevaMEefAv6FE9lrblY1e6pQ==
X-Google-Smtp-Source: ABdhPJzjWf9PU74J4fE3Aolyv6LnCVFdqiOTS85P8w9FTMAZa7Rqla4auRmEpouV5jdstTyC4wXuZw==
X-Received: by 2002:a05:600c:4f10:: with SMTP id
 l16mr280233wmq.5.1623776284847; 
 Tue, 15 Jun 2021 09:58:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o26sm15449963wms.27.2021.06.15.09.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 09:58:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 98DEC1FF87;
 Tue, 15 Jun 2021 17:58:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] semihosting/arm-compat: replace heuristic for softmmu
 SYS_HEAPINFO
Date: Tue, 15 Jun 2021 17:57:59 +0100
Message-Id: <20210615165800.23265-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615165800.23265-1-alex.bennee@linaro.org>
References: <20210615165800.23265-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Andrew Strauss <astrauss11@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The previous numbers were a guess at best and rather arbitrary without
taking into account anything that might be loaded. Instead of using
guesses based on the state of registers implement a new function that
scans MemoryRegions for the RAM of the current address space and then
looks for the lowest address above any ROM blobs (which include
-kernel loaded code).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Andrew Strauss <astrauss11@gmail.com>
Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>

---
v2
  - report some known information (limits)
  - reword the commit message
v3
  - rework to use the ROM blob scanning suggested by Peter
  - drop arch specific wrappers
  - dropped rb/tb tags as it's a rework
---
 include/hw/loader.h           |  10 +++
 hw/core/loader.c              |  19 +++++
 semihosting/arm-compat-semi.c | 131 ++++++++++++++++++----------------
 3 files changed, 99 insertions(+), 61 deletions(-)

diff --git a/include/hw/loader.h b/include/hw/loader.h
index cbfc184873..037828e94d 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -349,4 +349,14 @@ int rom_add_option(const char *file, int32_t bootindex);
  * overflow on real hardware too. */
 #define UBOOT_MAX_GUNZIP_BYTES (64 << 20)
 
+/**
+ * rom_find_highest_addr: return highest address of ROM in region
+ *
+ * This function is used to find the highest ROM address (or loaded
+ * blob) so we can advise where true heap memory may be.
+ *
+ * Returns: highest found address in region
+ */
+hwaddr rom_find_highest_addr(hwaddr base, size_t size);
+
 #endif
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 5b34869a54..05003556ee 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1310,6 +1310,25 @@ static Rom *find_rom(hwaddr addr, size_t size)
     return NULL;
 }
 
+hwaddr rom_find_highest_addr(hwaddr base, size_t size)
+{
+    Rom *rom;
+    hwaddr lowest = base;
+
+    QTAILQ_FOREACH(rom, &roms, next) {
+        if (rom->addr < base) {
+            continue;
+        }
+        if (rom->addr + rom->romsize > base + size) {
+            continue;
+        }
+        if (rom->addr + rom->romsize > lowest) {
+            lowest = rom->addr + rom->romsize;
+        }
+    }
+    return lowest;
+}
+
 /*
  * Copies memory from registered ROMs to dest. Any memory that is contained in
  * a ROM between addr and addr + size is copied. Note that this can involve
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 1c29146dcf..a276161181 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -44,6 +44,7 @@
 #else
 #include "exec/gdbstub.h"
 #include "qemu/cutils.h"
+#include "hw/loader.h"
 #ifdef TARGET_ARM
 #include "hw/arm/boot.h"
 #endif
@@ -144,33 +145,71 @@ typedef struct GuestFD {
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
+ * RAM position. For the heapbase we scan though the address space and
+ * return the first available address above any ROM regions created by
+ * the loaders.
+ *
+ * Returns: a structure with the numbers we need.
  */
-static inline hwaddr
-common_semi_find_region_base(hwaddr addr)
+
+typedef struct LayoutInfo {
+    target_ulong rambase;
+    size_t ramsize;
+    target_ulong heapbase;
+    target_ulong heaplimit;
+    target_ulong stackbase;
+    target_ulong stacklimit;
+} LayoutInfo;
+
+static bool find_ram_cb(Int128 start, Int128 len, const MemoryRegion *mr,
+                        hwaddr offset_in_region, void *opaque)
 {
-    MemoryRegion *subregion;
+    LayoutInfo *info = (LayoutInfo *) opaque;
+
+    if (!mr->ram || mr->readonly) {
+        return false;
+    }
+
+    info->rambase = mr->addr;
+    info->ramsize = int128_get64(len);
+
+    return true;
+}
+
+static LayoutInfo common_semi_find_bases(CPUState *cs)
+{
+    FlatView *fv;
+    LayoutInfo info = { 0, 0, 0, 0, 0, 0 };
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
+    if (info.rambase && info.ramsize) {
+        hwaddr limit = info.rambase + info.ramsize;
+        size_t space;
+        info.heapbase = rom_find_highest_addr(info.rambase, info.ramsize);
+        space = QEMU_ALIGN_DOWN((limit - info.heapbase) / 2, TARGET_PAGE_SIZE);
+        info.heaplimit = info.heapbase + space;
+        info.stackbase = info.rambase + info.ramsize;
+        info.stacklimit = info.stackbase - space;
     }
-    return 0;
+
+    return info;
 }
+
 #endif
 
 #ifdef TARGET_ARM
@@ -204,28 +243,6 @@ common_semi_sys_exit_extended(CPUState *cs, int nr)
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
@@ -251,17 +268,6 @@ common_semi_sys_exit_extended(CPUState *cs, int nr)
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
@@ -1165,12 +1171,12 @@ target_ulong do_common_semihosting(CPUState *cs)
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
@@ -1201,12 +1207,15 @@ target_ulong do_common_semihosting(CPUState *cs)
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
+            retvals[0] = info.heapbase; /* Heap Base */
+            retvals[1] = info.heaplimit; /* Heap Limit */
+            retvals[2] = info.stackbase; /* Stack base */
+            retvals[3] = info.stacklimit; /* Stack limit.  */
 #endif
 
             for (i = 0; i < ARRAY_SIZE(retvals); i++) {
-- 
2.20.1


