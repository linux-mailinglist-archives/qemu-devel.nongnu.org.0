Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD1E105CF0
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Nov 2019 00:00:03 +0100 (CET)
Received: from localhost ([::1]:46342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXvQg-0007i4-KG
	for lists+qemu-devel@lfdr.de; Thu, 21 Nov 2019 18:00:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59414)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty@apple.com>) id 1iXvLq-00048T-9c
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 17:55:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty@apple.com>) id 1iXvLo-0004Zf-Jq
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 17:55:02 -0500
Received: from ma1-aaemail-dr-lapp03.apple.com ([17.171.2.72]:57352)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dirty@apple.com>) id 1iXvLo-0004ZD-EU
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 17:55:00 -0500
Received: from pps.filterd (ma1-aaemail-dr-lapp03.apple.com [127.0.0.1])
 by ma1-aaemail-dr-lapp03.apple.com (8.16.0.27/8.16.0.27) with SMTP id
 xALMppVR004638; Thu, 21 Nov 2019 14:54:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=sender : from : to :
 cc : subject : date : message-id : in-reply-to : references : mime-version
 : content-transfer-encoding; s=20180706;
 bh=2qThhwyxCZ77cwgj7A+n+ur8Py044+rESl/hXOIuVlg=;
 b=RtoyS+N2ES9k8fO+UIpp8qqlq9mnHL9/BSnQiIg67s/a11e6IW0X2l7R4et8VgvoCMvn
 ftwk8nfhPoayf4kjhzVfePp5DeXRmOfeE3XchjX9KfeHf3PdsOQBJvTz+KHxG2727EzR
 j8gFmGkIK6tn9RW4A2pQeFlQ/V7kIMbyG2QmIMIF/c8GB/HML20mE8JUEDLXFJ/moaej
 EeTxv43XqVyxZv/q+Lyyx2/p/Udr1/xJFDTM5e1GeWUcTZ0BspsvRNTnzgNUrLFEdrq0
 TWlcmfmYdOw6Su9sX/COWuHHhAiWM3hX6aytV+9io7wUd76V9g96djQhqEoOjiTCkXyc uw== 
Received: from ma1-mtap-s02.corp.apple.com (ma1-mtap-s02.corp.apple.com
 [17.40.76.6])
 by ma1-aaemail-dr-lapp03.apple.com with ESMTP id 2wah00wd8y-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Thu, 21 Nov 2019 14:54:56 -0800
Received: from nwk-mmpp-sz11.apple.com
 (nwk-mmpp-sz11.apple.com [17.128.115.155]) by ma1-mtap-s02.corp.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) with ESMTPS id <0Q1C00F8GCZFA3G0@ma1-mtap-s02.corp.apple.com>; Thu,
 21 Nov 2019 14:54:56 -0800 (PST)
Received: from process_milters-daemon.nwk-mmpp-sz11.apple.com by
 nwk-mmpp-sz11.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) id <0Q1C00200CPUWV00@nwk-mmpp-sz11.apple.com>; Thu,
 21 Nov 2019 14:54:55 -0800 (PST)
X-Va-A: 
X-Va-T-CD: c56cc4374afe9162bf6a337f3d661529
X-Va-E-CD: 87366070aa9e35b8c79e4456cbc0bf12
X-Va-R-CD: 6256ed87b6638903a4baf353cb96ca9d
X-Va-CD: 0
X-Va-ID: bd0c5e00-bf44-44e0-91d6-a1be8b61aad7
X-V-A: 
X-V-T-CD: c56cc4374afe9162bf6a337f3d661529
X-V-E-CD: 87366070aa9e35b8c79e4456cbc0bf12
X-V-R-CD: 6256ed87b6638903a4baf353cb96ca9d
X-V-CD: 0
X-V-ID: 52af1016-2a8d-4ac4-97f3-aa5f76cdf6b0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,,
 definitions=2019-11-21_06:,, signatures=0
Received: from pontoon.com (unknown [17.193.42.199]) by nwk-mmpp-sz11.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) with ESMTPSA id <0Q1C00JWACZIHUA0@nwk-mmpp-sz11.apple.com>; Thu,
 21 Nov 2019 14:54:54 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH 1/5] hvf: non-RAM, non-ROMD memory ranges are now correctly
 mapped in
Date: Thu, 21 Nov 2019 14:54:50 -0800
Message-id: <42681c31813a94c0f184eb1d270f5d0b9989c0f4.1574375668.git.dirty@apple.com>
X-Mailer: git-send-email 2.24.0
In-reply-to: <cover.1574375668.git.dirty@apple.com>
References: <cover.1574375668.git.dirty@apple.com>
MIME-version: 1.0
Content-transfer-encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-21_06:, , signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 17.171.2.72
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Cameron Esfahani <dirty@apple.com>
From: Cameron Esfahani via <qemu-devel@nongnu.org>

If an area is non-RAM and non-ROMD, then remove mappings so accesses
will trap and can be emulated.  Change hvf_find_overlap_slot() to take
a size instead of an end address: it wouldn't return a slot because
callers would pass the same address for start and end.  Don't always
map area as read/write/execute, respect area flags.

Signed-off-by: Cameron Esfahani <dirty@apple.com>
---
 target/i386/hvf/hvf.c | 47 +++++++++++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 231732aaf7..60c995470b 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -107,14 +107,14 @@ static void assert_hvf_ok(hv_return_t ret)
 }
 
 /* Memory slots */
-hvf_slot *hvf_find_overlap_slot(uint64_t start, uint64_t end)
+hvf_slot *hvf_find_overlap_slot(uint64_t start, uint64_t size)
 {
     hvf_slot *slot;
     int x;
     for (x = 0; x < hvf_state->num_slots; ++x) {
         slot = &hvf_state->slots[x];
         if (slot->size && start < (slot->start + slot->size) &&
-            end > slot->start) {
+            (start + size) > slot->start) {
             return slot;
         }
     }
@@ -129,12 +129,10 @@ struct mac_slot {
 };
 
 struct mac_slot mac_slots[32];
-#define ALIGN(x, y)  (((x) + (y) - 1) & ~((y) - 1))
 
-static int do_hvf_set_memory(hvf_slot *slot)
+static int do_hvf_set_memory(hvf_slot *slot, hv_memory_flags_t flags)
 {
     struct mac_slot *macslot;
-    hv_memory_flags_t flags;
     hv_return_t ret;
 
     macslot = &mac_slots[slot->slot_id];
@@ -151,8 +149,6 @@ static int do_hvf_set_memory(hvf_slot *slot)
         return 0;
     }
 
-    flags = HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC;
-
     macslot->present = 1;
     macslot->gpa_start = slot->start;
     macslot->size = slot->size;
@@ -165,14 +161,22 @@ void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
 {
     hvf_slot *mem;
     MemoryRegion *area = section->mr;
+    bool writeable = !area->readonly && !area->rom_device;
+    hv_memory_flags_t flags;
 
     if (!memory_region_is_ram(area)) {
-        return;
+        if (writeable) {
+            return;
+        } else if (!memory_region_is_romd(area)) {
+            /* If the memory device is not in romd_mode, then we actually want
+             * to remove the hvf memory slot so all accesses will trap. */
+             add = false;
+        }
     }
 
     mem = hvf_find_overlap_slot(
             section->offset_within_address_space,
-            section->offset_within_address_space + int128_get64(section->size));
+            int128_get64(section->size));
 
     if (mem && add) {
         if (mem->size == int128_get64(section->size) &&
@@ -186,8 +190,8 @@ void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
     /* Region needs to be reset. set the size to 0 and remap it. */
     if (mem) {
         mem->size = 0;
-        if (do_hvf_set_memory(mem)) {
-            error_report("Failed to reset overlapping slot");
+        if (do_hvf_set_memory(mem, 0)) {
+            error_report("Failed to reset overlapping slot\n");
             abort();
         }
     }
@@ -196,6 +200,11 @@ void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
         return;
     }
 
+    if (area->readonly || (!memory_region_is_ram(area) && memory_region_is_romd(area)))
+        flags = HV_MEMORY_READ | HV_MEMORY_EXEC;
+    else
+        flags = HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC;
+
     /* Now make a new slot. */
     int x;
 
@@ -216,8 +225,8 @@ void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
     mem->start = section->offset_within_address_space;
     mem->region = area;
 
-    if (do_hvf_set_memory(mem)) {
-        error_report("Error registering new memory slot");
+    if (do_hvf_set_memory(mem, flags)) {
+        error_report("Error registering new memory slot\n");
         abort();
     }
 }
@@ -345,7 +354,11 @@ static bool ept_emulation_fault(hvf_slot *slot, uint64_t gpa, uint64_t ept_qual)
         return false;
     }
 
-    return !slot;
+    if (!slot)
+        return true;
+    if (!memory_region_is_ram(slot->region) && !(read && memory_region_is_romd(slot->region)))
+        return true;
+    return false;
 }
 
 static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
@@ -354,7 +367,7 @@ static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
 
     slot = hvf_find_overlap_slot(
             section->offset_within_address_space,
-            section->offset_within_address_space + int128_get64(section->size));
+            int128_get64(section->size));
 
     /* protect region against writes; begin tracking it */
     if (on) {
@@ -720,7 +733,7 @@ int hvf_vcpu_exec(CPUState *cpu)
             ret = EXCP_INTERRUPT;
             break;
         }
-            /* Need to check if MMIO or unmmaped fault */
+        /* Need to check if MMIO or unmapped fault */
         case EXIT_REASON_EPT_FAULT:
         {
             hvf_slot *slot;
@@ -731,7 +744,7 @@ int hvf_vcpu_exec(CPUState *cpu)
                 vmx_set_nmi_blocking(cpu);
             }
 
-            slot = hvf_find_overlap_slot(gpa, gpa);
+            slot = hvf_find_overlap_slot(gpa, 1);
             /* mmio */
             if (ept_emulation_fault(slot, gpa, exit_qual)) {
                 struct x86_decode decode;
-- 
2.24.0


