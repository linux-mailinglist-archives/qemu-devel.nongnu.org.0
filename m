Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCA04CA7D2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 15:19:39 +0100 (CET)
Received: from localhost ([::1]:54012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPPpK-0001xr-HP
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 09:19:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>) id 1nPOer-0003cE-1s
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 08:04:47 -0500
Received: from [2607:f8b0:4864:20::52e] (port=40452
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>) id 1nPOeo-0004z7-VV
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 08:04:44 -0500
Received: by mail-pg1-x52e.google.com with SMTP id w37so1571080pga.7
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 05:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2T+NCiBAVUTU368d4Yz1z1btdsU5CgR5N/ysNvhlN6k=;
 b=jkZ1EMzHaP/MQb9DEg2b8LQzt6zQ9yY1lr5zEDd92xanu/xBFgEpGloNqFL9lOHImF
 crwG5de6mmdq+hF5isI6QpVybv+nAGxcHOwdOrjra9ZuhmPxg+CL38iNcZ9FQlm5DvPg
 HJ2mJkn02Tyy1HvJrTepE9RyGFOJ4hM21nNqtlGGR0nKcG5e3qRkl5UAwh8h1pxk9Ync
 SDfX2EWC9TR0wb2BWPAaKuDUBxoOZr01I9HWKgBYD3vkaawnKALKj7g0RPpR/FiY30R0
 /GXuu3+HmHL3GBSRWmeUC50ba1YtTtZufaNHkwI5CUyBFpb5qu3VskTX35IgTaLyLNbO
 3CSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2T+NCiBAVUTU368d4Yz1z1btdsU5CgR5N/ysNvhlN6k=;
 b=Ayw9IZqKFH7NIDhWRKDLJ0/KL5eQ6T9dpa8M0gSNlMgIGq1UOfd9PRShZbqodBasoh
 erLaniGMDblHxOUj91Qop9rNXVaK1syfCnpIzqM7UuAu4bKiWvsb0x3rtoQcZt192b3X
 +/fAE1vWluAmwEN2nPNW12TVVMJ5inUM6npxgdmPTOEYP4Prat6F5x+I/uwmN88J3yUR
 lO+ONnka1wibqm55Yq8QmF7APQIdqW7GGPjfJDnP1+6vNug4jjbm4YLJGa5Vdu7xhdeu
 Jrtc8HtgP6fnvNxgihhNMv9XiJo2ngSRuWOiPsHjVd+rlPCkih0NZk+lUqQNXrY+4kAu
 59CQ==
X-Gm-Message-State: AOAM533gbd+7WiYGF1af0OnlTLH7KfzVneqCVCG36+No6l6zfHrb9nLw
 /+qPHJRixU657zlVuBD9ZZKDnPOXYjgdMQ==
X-Google-Smtp-Source: ABdhPJytcbqDkaJlYPTVjd+grY7jX64VL37oaCtUHzmN5TrPXl7M3JbE602JAm4Xb/opfTfnMFcMXQ==
X-Received: by 2002:a63:7781:0:b0:372:ba7b:c894 with SMTP id
 s123-20020a637781000000b00372ba7bc894mr25804873pgc.458.1646226280480; 
 Wed, 02 Mar 2022 05:04:40 -0800 (PST)
Received: from localhost.localdomain
 (2001-b011-e000-59d7-a02b-4f1b-c415-11a0.dynamic-ip6.hinet.net.
 [2001:b011:e000:59d7:a02b:4f1b:c415:11a0])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a056a00140d00b004e13da93eaasm21947964pfu.62.2022.03.02.05.04.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Mar 2022 05:04:40 -0800 (PST)
From: Yan-Jie Wang <ubzeme@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/9] hvf: fix memory dirty-tracking
Date: Wed,  2 Mar 2022 21:04:13 +0800
Message-Id: <20220302130417.18551-6-ubzeme@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220302130417.18551-1-ubzeme@gmail.com>
References: <20220302130417.18551-1-ubzeme@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=ubzeme@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Cameron Esfahani <dirty@apple.com>, Yan-Jie Wang <ubzeme@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dirty-tracking in HVF is not properly implemented.

On Intel Macs, Ubuntu ISO boot menu does not show properly.

On Apple Silicon, using bochs-display may cause the guest crashes because
the guest may uses load/store instructions on framebuffer which causes
vmexits and the exception register does not contain enough information
(ESR_EL2.ISV = 0) for QEMU to emulate the memory operation.

The strategy to log the dirty pages is to write-protect the memory regions
that are being dirty-tracked.

When the guest is trapped to the host because of memory write, check whether
the address being written is being dirty-tracked.

If it is being dirty-tracked, restore the write permission of the page and
mark the accessed page dirty, and resume the guest without increasing
program counter, and then the same instruction will be execute again.

This patch fixes the problem and make the dirty-tracking work properly.

Buglink: https://bugs.launchpad.net/qemu/+bug/1827005
Signed-off-by: Yan-Jie Wang <ubzeme@gmail.com>
---
 accel/hvf/hvf-mem.c      | 62 ++++++++++++++++++++++++++++++++++++----
 include/sysemu/hvf_int.h | 14 +--------
 target/arm/hvf/hvf.c     |  5 ++++
 target/i386/hvf/hvf.c    | 25 ++++------------
 4 files changed, 68 insertions(+), 38 deletions(-)

diff --git a/accel/hvf/hvf-mem.c b/accel/hvf/hvf-mem.c
index b8e9f30e4c..896e718374 100644
--- a/accel/hvf/hvf-mem.c
+++ b/accel/hvf/hvf-mem.c
@@ -30,9 +30,21 @@
 
 #define HVF_NUM_SLOTS 32
 
+/* HVFSlot flags */
+#define HVF_SLOT_LOG (1 << 0)
+#define HVF_SLOT_READONLY (1 << 1)
+
+typedef struct HVFSlot {
+    hwaddr start;
+    hwaddr size;  /* 0 if the slot is free */
+    hwaddr offset;  /* offset within memory region */
+    uint32_t flags;
+    MemoryRegion *region;
+} HVFSlot;
+
 static HVFSlot memslots[HVF_NUM_SLOTS];
 
-HVFSlot *hvf_find_overlap_slot(hwaddr start, hwaddr size)
+static HVFSlot *hvf_find_overlap_slot(hwaddr start, hwaddr size)
 {
     HVFSlot *slot;
     int x;
@@ -194,7 +206,7 @@ static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
 static void hvf_log_start(MemoryListener *listener,
                           MemoryRegionSection *section, int old, int new)
 {
-    if (old != 0) {
+    if (old == new) {
         return;
     }
 
@@ -211,12 +223,12 @@ static void hvf_log_stop(MemoryListener *listener,
     hvf_set_dirty_tracking(section, 0);
 }
 
-static void hvf_log_sync(MemoryListener *listener,
+static void hvf_log_clear(MemoryListener *listener,
                          MemoryRegionSection *section)
 {
     /*
-     * sync of dirty pages is handled elsewhere; just make sure we keep
-     * tracking the region.
+     * The dirty bits are being cleared.
+     * Make the section write-protected again.
      */
     hvf_set_dirty_tracking(section, 1);
 }
@@ -240,9 +252,47 @@ static MemoryListener hvf_memory_listener = {
     .region_del = hvf_region_del,
     .log_start = hvf_log_start,
     .log_stop = hvf_log_stop,
-    .log_sync = hvf_log_sync,
+    .log_clear = hvf_log_clear,
 };
 
+
+/*
+ * The function is called when the guest is accessing memory causing vmexit.
+ * Check whether the guest can access the memory directly and
+ * also mark the accessed page being written dirty
+ * if the page is being dirty-tracked.
+ *
+ * Return true if the access is within the mapped region,
+ * otherwise return false.
+ */
+bool hvf_access_memory(hwaddr address, bool write)
+{
+    HVFSlot *slot;
+    hv_return_t ret;
+    hwaddr start, size;
+
+    slot = hvf_find_overlap_slot(address, 1);
+
+    if (!slot || (write && slot->flags & HVF_SLOT_READONLY)) {
+        /* MMIO or unmapped area, return false */
+        return false;
+    }
+
+    if (write && (slot->flags & HVF_SLOT_LOG)) {
+        /* The slot is being dirty-tracked. Mark the accessed page dirty. */
+        start = address & qemu_real_host_page_mask;
+        size = qemu_real_host_page_size;
+
+        memory_region_set_dirty(slot->region,
+                                start - slot->start + slot->offset, size);
+        ret = hv_vm_protect(start, size,
+                    HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC);
+        assert_hvf_ok(ret);
+    }
+
+    return true;
+}
+
 void hvf_init_memslots(void)
 {
     memory_listener_register(&hvf_memory_listener, &address_space_memory);
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 0aafbc9357..16e5faf0ff 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -17,18 +17,6 @@
 #include <Hypervisor/hv.h>
 #endif
 
-/* HVFSlot flags */
-#define HVF_SLOT_LOG (1 << 0)
-#define HVF_SLOT_READONLY (1 << 1)
-
-typedef struct HVFSlot {
-    hwaddr start;
-    hwaddr size;  /* 0 if the slot is free */
-    hwaddr offset;  /* offset within memory region */
-    uint32_t flags;
-    MemoryRegion *region;
-} HVFSlot;
-
 typedef struct hvf_vcpu_caps {
     uint64_t vmx_cap_pinbased;
     uint64_t vmx_cap_procbased;
@@ -58,11 +46,11 @@ int hvf_arch_init(void);
 int hvf_arch_init_vcpu(CPUState *cpu);
 void hvf_arch_vcpu_destroy(CPUState *cpu);
 int hvf_vcpu_exec(CPUState *);
-HVFSlot *hvf_find_overlap_slot(hwaddr, hwaddr);
 int hvf_put_registers(CPUState *);
 int hvf_get_registers(CPUState *);
 void hvf_kick_vcpu_thread(CPUState *cpu);
 
+bool hvf_access_memory(hwaddr address, bool write);
 void hvf_init_memslots(void);
 
 #endif
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 4d4ddab348..398ad50a29 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1202,6 +1202,11 @@ int hvf_vcpu_exec(CPUState *cpu)
             break;
         }
 
+        if (iswrite &&
+            hvf_access_memory(hvf_exit->exception.physical_address, 1)) {
+            break;
+        }
+
         assert(isv);
 
         if (iswrite) {
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 2ddb4fc825..c4c544dc54 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -113,7 +113,7 @@ void hvf_handle_io(CPUArchState *env, uint16_t port, void *buffer,
     }
 }
 
-static bool ept_emulation_fault(HVFSlot *slot, uint64_t gpa, uint64_t ept_qual)
+static bool ept_emulation_fault(uint64_t gpa, uint64_t ept_qual)
 {
     int read, write;
 
@@ -129,14 +129,6 @@ static bool ept_emulation_fault(HVFSlot *slot, uint64_t gpa, uint64_t ept_qual)
         return false;
     }
 
-    if (write && slot) {
-        if (slot->flags & HVF_SLOT_LOG) {
-            memory_region_set_dirty(slot->region, gpa - slot->start, 1);
-            hv_vm_protect((hv_gpaddr_t)slot->start, (size_t)slot->size,
-                          HV_MEMORY_READ | HV_MEMORY_WRITE);
-        }
-    }
-
     /*
      * The EPT violation must have been caused by accessing a
      * guest-physical address that is a translation of a guest-linear
@@ -147,14 +139,11 @@ static bool ept_emulation_fault(HVFSlot *slot, uint64_t gpa, uint64_t ept_qual)
         return false;
     }
 
-    if (!slot) {
-        return true;
+    if (hvf_access_memory(gpa, write)) {
+        return false;
     }
-    if (!memory_region_is_ram(slot->region) &&
-        !(read && memory_region_is_romd(slot->region))) {
-        return true;
-    }
-    return false;
+
+    return true;
 }
 
 void hvf_arch_vcpu_destroy(CPUState *cpu)
@@ -469,7 +458,6 @@ int hvf_vcpu_exec(CPUState *cpu)
         /* Need to check if MMIO or unmapped fault */
         case EXIT_REASON_EPT_FAULT:
         {
-            HVFSlot *slot;
             uint64_t gpa = rvmcs(cpu->hvf->fd, VMCS_GUEST_PHYSICAL_ADDRESS);
 
             if (((idtvec_info & VMCS_IDT_VEC_VALID) == 0) &&
@@ -477,9 +465,8 @@ int hvf_vcpu_exec(CPUState *cpu)
                 vmx_set_nmi_blocking(cpu);
             }
 
-            slot = hvf_find_overlap_slot(gpa, 1);
             /* mmio */
-            if (ept_emulation_fault(slot, gpa, exit_qual)) {
+            if (ept_emulation_fault(gpa, exit_qual)) {
                 struct x86_decode decode;
 
                 load_regs(cpu);
-- 
2.32.0 (Apple Git-132)


