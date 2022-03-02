Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C684CA5BA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:17:42 +0100 (CET)
Received: from localhost ([::1]:43346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPOrN-000537-3V
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:17:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>) id 1nPOek-0003ZM-Ns
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 08:04:39 -0500
Received: from [2607:f8b0:4864:20::52c] (port=33665
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>) id 1nPOei-0004y7-Gf
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 08:04:38 -0500
Received: by mail-pg1-x52c.google.com with SMTP id 12so1616200pgd.0
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 05:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EcGgDc6OGKcQA4p0Ncm8XhFop9pHI02HEIveclFCx2Y=;
 b=jrJQNsv56FLeICTcYIkl+sx4BN3RV+IcfSoo5uSaoSh7e4gs6gie8MrI7/24oyKB4k
 tz/e5hXstds8kBWI88HRdGZ17vvJa1lUBzSLVWMMHz1zgV0iXtUMBC5l+koeXTMy3fef
 EII/uo1X4g2jaIqbJwjc9sh1m57QzuvWT6dv07O9b9E4X1wxgcYRyppOZJ0aUkhoodZw
 97OlBWEhIy/E06G/OWzD3NWjhfbg14GIbBgp91+WFmwxg+AW625EKc9neglCsXcu1JOx
 JfVhtXadKaGBJf+WL6ypXpqdxZZl5fFYPF3hR66PDGKSkeb+U28KTXgqcjWmq0emAJwk
 YPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EcGgDc6OGKcQA4p0Ncm8XhFop9pHI02HEIveclFCx2Y=;
 b=MZHRpmfocA6L+ufnsSKj8pqWPf9JO+An/ZgJUj07oWvOc02YHk+lyybgCT7h3CbMv8
 kuwl3/8sedtj0ViSO3aEG/mr0Qd7i8vDL7VJsgoISz/D50iMibyXHIGc4YrkgB/QpSa6
 qFPukMh7WWh6s7Qoo4tIXuM1ZpRA9Pt+HGgEzXSmDgbDwZYfDacjHdxkU7P01xc+AJei
 u13TxuNv95LXFjDf1jRhd2WiT67/iWm835XAfBfDh2ofj+UTs2k6IlUyWob3/Dj7AmTU
 4mi/x3BJFZRUG0jgHU4qOy5cev3zoqUwxG9bGp3X4p3RAGLlAyKU8MvyozdWUtNwYmcY
 YN/g==
X-Gm-Message-State: AOAM530omJm++OtyST2fMSjm5S1a4RrSSBYYw+EW9nDDl0lNv0dBOsWk
 DA+2SskDAsItQ/C0tV4d7SZEu0Ma1gB99A==
X-Google-Smtp-Source: ABdhPJwx51Ee6nJmFVGdc0uORxU9SLfaJND5jhkSCEdw/o3U/1jFR3dLyiN0xM1rcx1k4v49r5uuyQ==
X-Received: by 2002:a65:6201:0:b0:369:4a47:aff1 with SMTP id
 d1-20020a656201000000b003694a47aff1mr25609954pgv.238.1646226274083; 
 Wed, 02 Mar 2022 05:04:34 -0800 (PST)
Received: from localhost.localdomain
 (2001-b011-e000-59d7-a02b-4f1b-c415-11a0.dynamic-ip6.hinet.net.
 [2001:b011:e000:59d7:a02b:4f1b:c415:11a0])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a056a00140d00b004e13da93eaasm21947964pfu.62.2022.03.02.05.04.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Mar 2022 05:04:33 -0800 (PST)
From: Yan-Jie Wang <ubzeme@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/9] hvf: simplify data structures and codes of memory
 related functions
Date: Wed,  2 Mar 2022 21:04:10 +0800
Message-Id: <20220302130417.18551-3-ubzeme@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220302130417.18551-1-ubzeme@gmail.com>
References: <20220302130417.18551-1-ubzeme@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=ubzeme@gmail.com; helo=mail-pg1-x52c.google.com
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

* Remove mac_slot and use hvf_slot only. The function of the two structures
  are similar.

* Refactor function hvf_set_phys_mem():
 - Remove unnecessary checks because any modified memory sections
   will be removed first (region_del called first) before being added.
   Therefore, new sections do not overlap with existing sections.
 - Try to align memory sections first before giving up sections that are not
   aligned to host page size.

Signed-off-by: Yan-Jie Wang <ubzeme@gmail.com>
---
 accel/hvf/hvf-accel-ops.c |   1 -
 accel/hvf/hvf-mem.c       | 211 +++++++++++++++++++-------------------
 include/sysemu/hvf_int.h  |   8 +-
 3 files changed, 107 insertions(+), 113 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 50a563bfe0..c77f142f2b 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -49,7 +49,6 @@
 
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
-#include "exec/address-spaces.h"
 #include "exec/exec-all.h"
 #include "sysemu/cpus.h"
 #include "sysemu/hvf.h"
diff --git a/accel/hvf/hvf-mem.c b/accel/hvf/hvf-mem.c
index 3712731ed9..32452696b6 100644
--- a/accel/hvf/hvf-mem.c
+++ b/accel/hvf/hvf-mem.c
@@ -28,12 +28,16 @@
 
 /* Memory slots */
 
+#define HVF_NUM_SLOTS 32
+
+static hvf_slot memslots[HVF_NUM_SLOTS];
+
 hvf_slot *hvf_find_overlap_slot(uint64_t start, uint64_t size)
 {
     hvf_slot *slot;
     int x;
-    for (x = 0; x < hvf_state->num_slots; ++x) {
-        slot = &hvf_state->slots[x];
+    for (x = 0; x < HVF_NUM_SLOTS; ++x) {
+        slot = &memslots[x];
         if (slot->size && start < (slot->start + slot->size) &&
             (start + size) > slot->start) {
             return slot;
@@ -42,128 +46,130 @@ hvf_slot *hvf_find_overlap_slot(uint64_t start, uint64_t size)
     return NULL;
 }
 
-struct mac_slot {
-    int present;
-    uint64_t size;
-    uint64_t gpa_start;
-    uint64_t gva;
-};
-
-struct mac_slot mac_slots[32];
-
-static int do_hvf_set_memory(hvf_slot *slot, hv_memory_flags_t flags)
+static hvf_slot *hvf_find_free_slot(void)
 {
-    struct mac_slot *macslot;
-    hv_return_t ret;
-
-    macslot = &mac_slots[slot->slot_id];
-
-    if (macslot->present) {
-        if (macslot->size != slot->size) {
-            macslot->present = 0;
-            ret = hv_vm_unmap(macslot->gpa_start, macslot->size);
-            assert_hvf_ok(ret);
+    hvf_slot *slot;
+    int x;
+    for (x = 0; x < HVF_NUM_SLOTS; x++) {
+        slot = &memslots[x];
+        if (!slot->size) {
+            return slot;
         }
     }
 
-    if (!slot->size) {
-        return 0;
-    }
-
-    macslot->present = 1;
-    macslot->gpa_start = slot->start;
-    macslot->size = slot->size;
-    ret = hv_vm_map(slot->mem, slot->start, slot->size, flags);
-    assert_hvf_ok(ret);
-    return 0;
+    return NULL;
+}
+
+/*
+ * Hypervisor.framework requires that the host virtual address,
+ * the guest physical address and the size of memory regions are aligned
+ * to the host page size.
+ *
+ * The function here tries to align the guest physical address and the size.
+ *
+ * The return value is the aligned size.
+ * The aligned guest physical address will be written to `start'.
+ * The delta between the aligned address and the original address will be
+ * written to `delta'.
+ */
+static hwaddr hvf_align_section(MemoryRegionSection *section,
+                              hwaddr *start, hwaddr *delta)
+{
+    hwaddr unaligned, _start, size, _delta;
+
+    unaligned = section->offset_within_address_space;
+    size = int128_get64(section->size);
+    _start = ROUND_UP(unaligned, qemu_real_host_page_size);
+    _delta = _start - unaligned;
+    size = (size - _delta) & qemu_real_host_page_mask;
+
+    *start = _start;
+    *delta = _delta;
+
+    return size;
 }
 
 static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
 {
-    hvf_slot *mem;
+    hvf_slot *slot;
+    hwaddr start, size, offset, delta;
+    uint8_t *host_addr;
     MemoryRegion *area = section->mr;
-    bool writeable = !area->readonly && !area->rom_device;
+    bool readonly, dirty_tracking;
     hv_memory_flags_t flags;
-    uint64_t page_size = qemu_real_host_page_size;
+    hv_return_t ret;
 
-    if (!memory_region_is_ram(area)) {
-        if (writeable) {
+    if (add && !memory_region_is_ram(area) && !memory_region_is_romd(area)) {
+        /*
+         * If the memory region is not RAM and is in ROMD mode,
+         * do not map it to the guest.
+         */
+        return;
+    }
+
+    size = hvf_align_section(section, &start, &delta);
+
+    if (!size) {
+        /* The size is 0 after aligned. Do not map the region */
+        return;
+    }
+
+    if (add) {
+        /* add memory region */
+        offset = section->offset_within_region + delta;
+        host_addr = memory_region_get_ram_ptr(area) + offset;
+
+        if (!QEMU_PTR_IS_ALIGNED(host_addr, qemu_real_host_page_size)) {
+            /* The host virtual address is not aligned. It cannot be mapped */
             return;
-        } else if (!memory_region_is_romd(area)) {
-            /*
-             * If the memory device is not in romd_mode, then we actually want
-             * to remove the hvf memory slot so all accesses will trap.
-             */
-             add = false;
         }
-    }
 
-    if (!QEMU_IS_ALIGNED(int128_get64(section->size), page_size) ||
-        !QEMU_IS_ALIGNED(section->offset_within_address_space, page_size)) {
-        /* Not page aligned, so we can not map as RAM */
-        add = false;
-    }
+        dirty_tracking = !!memory_region_get_dirty_log_mask(area);
+        readonly = memory_region_is_rom(area) || memory_region_is_romd(area);
 
-    mem = hvf_find_overlap_slot(
-            section->offset_within_address_space,
-            int128_get64(section->size));
-
-    if (mem && add) {
-        if (mem->size == int128_get64(section->size) &&
-            mem->start == section->offset_within_address_space &&
-            mem->mem == (memory_region_get_ram_ptr(area) +
-            section->offset_within_region)) {
-            return; /* Same region was attempted to register, go away. */
-        }
-    }
-
-    /* Region needs to be reset. set the size to 0 and remap it. */
-    if (mem) {
-        mem->size = 0;
-        if (do_hvf_set_memory(mem, 0)) {
-            error_report("Failed to reset overlapping slot");
+        /* setup a slot */
+        slot = hvf_find_free_slot();
+        if (!slot) {
+            error_report("No free slots");
             abort();
         }
-    }
 
-    if (!add) {
-        return;
-    }
+        slot->start = start;
+        slot->size = size;
+        slot->offset = offset;
+        slot->flags = 0;
+        slot->region = area;
 
-    if (area->readonly ||
-        (!memory_region_is_ram(area) && memory_region_is_romd(area))) {
-        flags = HV_MEMORY_READ | HV_MEMORY_EXEC;
+        if (readonly) {
+            slot->flags |= HVF_SLOT_READONLY;
+        }
+
+        if (dirty_tracking) {
+            slot->flags |= HVF_SLOT_LOG;
+        }
+
+        /* set Hypervisor.framework memory mapping flags */
+        if (readonly || dirty_tracking) {
+            flags = HV_MEMORY_READ | HV_MEMORY_EXEC;
+        } else {
+            flags = HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC;
+        }
+
+        ret = hv_vm_map(host_addr, start, size, flags);
+        assert_hvf_ok(ret);
     } else {
-        flags = HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC;
-    }
+        /* remove memory region */
+        slot = hvf_find_overlap_slot(start, size);
 
-    /* Now make a new slot. */
-    int x;
+        if (slot) {
+            ret = hv_vm_unmap(start, size);
+            assert_hvf_ok(ret);
 
-    for (x = 0; x < hvf_state->num_slots; ++x) {
-        mem = &hvf_state->slots[x];
-        if (!mem->size) {
-            break;
+            slot->size = 0;
         }
     }
-
-    if (x == hvf_state->num_slots) {
-        error_report("No free slots");
-        abort();
-    }
-
-    mem->size = int128_get64(section->size);
-    mem->mem = memory_region_get_ram_ptr(area) + section->offset_within_region;
-    mem->start = section->offset_within_address_space;
-    mem->region = area;
-
-    if (do_hvf_set_memory(mem, flags)) {
-        error_report("Error registering new memory slot");
-        abort();
-    }
 }
 
-
 static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
 {
     hvf_slot *slot;
@@ -239,14 +245,5 @@ static MemoryListener hvf_memory_listener = {
 
 void hvf_init_memslots(void)
 {
-    int x;
-    HVFState *s = hvf_state;
-
-    s->num_slots = ARRAY_SIZE(s->slots);
-    for (x = 0; x < s->num_slots; ++x) {
-        s->slots[x].size = 0;
-        s->slots[x].slot_id = x;
-    }
-
     memory_listener_register(&hvf_memory_listener, &address_space_memory);
 }
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index cef20d750d..8ee31a16ac 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -19,12 +19,12 @@
 
 /* hvf_slot flags */
 #define HVF_SLOT_LOG (1 << 0)
+#define HVF_SLOT_READONLY (1 << 1)
 
 typedef struct hvf_slot {
     uint64_t start;
-    uint64_t size;
-    uint8_t *mem;
-    int slot_id;
+    uint64_t size;  /* 0 if the slot is free */
+    uint64_t offset;  /* offset within memory region */
     uint32_t flags;
     MemoryRegion *region;
 } hvf_slot;
@@ -40,8 +40,6 @@ typedef struct hvf_vcpu_caps {
 
 struct HVFState {
     AccelState parent;
-    hvf_slot slots[32];
-    int num_slots;
 
     hvf_vcpu_caps *hvf_caps;
     uint64_t vtimer_offset;
-- 
2.32.0 (Apple Git-132)


