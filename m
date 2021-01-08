Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEC62EF623
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 17:59:54 +0100 (CET)
Received: from localhost ([::1]:40124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxv7B-0006R1-Qh
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 11:59:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kxuyd-0008H3-Im
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:51:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kxuyb-0005Vv-An
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:51:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610124660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KVN8EDR1yzv1Ly9rwho3gPFm9pICzuqAABenHkcfGhM=;
 b=RMg4C1bIRpFEMLP+3zvsOtuwa/M2x0uoHYNlGzooN+C0Nxonh7Z+Rl/bHJ1JRu0zJ2DXyV
 vv2JnrCOBtJZi601lrUDkBUMS2YOU2Mpsjd4nYfmZBD65NQnx6gFVqIssZLG2LWAOg0Byh
 FZgAgqE24ElJ6uCJnNsNe6pQUidT6H4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-tQIYI261OrKO2oNkiZjBpg-1; Fri, 08 Jan 2021 11:50:58 -0500
X-MC-Unique: tQIYI261OrKO2oNkiZjBpg-1
Received: by mail-qk1-f200.google.com with SMTP id s66so9723024qkh.10
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 08:50:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KVN8EDR1yzv1Ly9rwho3gPFm9pICzuqAABenHkcfGhM=;
 b=eKoumVlVA02WiybbIoXqmgtuKnAKgNAfNFj5C3dpKCN3yW9LKA2VgGLqHKGKpStqsR
 LffU17u5CSI3ntDLm0TGzJAcL430hRPlMCF+DshiUXn7jGVxKe0n4YfT7vhQiPg6FdcI
 +DH2gIx4HWdl8VozceAK64p1Vk9UY45aTPMlCFSkPkoGADuAK1gf+2LBqDoRq7/6xRXe
 hyWCSTwPD6LfiDh5T+sDDry0xxpwS256FqxTEsNp0BspiuAbOK3c8aCS27VGTbSC6JX5
 H5Q4fo0EdSbhMq4n5/ldvr5h+NBGg3ZbJM3EfmtIayiSaPxzRoHxtpVftHTdSz+ZQVB/
 8SHQ==
X-Gm-Message-State: AOAM5324qyJfzOSO5QLfWIZBZNBFm2aKcnyW6IsxIN5RIC8epDDo8Fa5
 V+BrBBkCidOsKbyLllZI8R2vxgAlUAYoTiPB0ZtpH+WYcb/bynrwBSbs3yWKSN7NLHXdvR25+/x
 AoSr34Y1Wn/+t/0F8aGe2HiqZUbaVWibmByGk35IBN3s66/O7+P9WakjoEv+R+7Fa
X-Received: by 2002:a05:620a:218e:: with SMTP id
 g14mr4916426qka.243.1610124657564; 
 Fri, 08 Jan 2021 08:50:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsEE4IAlsq5r01vbYsy04xJkS8F/Je74mCrGMYGl82+ldSYb7V8VtNLVqyxp9TQUo+VHYncQ==
X-Received: by 2002:a05:620a:218e:: with SMTP id
 g14mr4916405qka.243.1610124657274; 
 Fri, 08 Jan 2021 08:50:57 -0800 (PST)
Received: from xz-x1.redhat.com ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id n5sm4954064qkh.126.2021.01.08.08.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 08:50:56 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/13] KVM: Provide helper to sync dirty bitmap from slot
 to ramblock
Date: Fri,  8 Jan 2021 11:50:45 -0500
Message-Id: <20210108165050.406906-5-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108165050.406906-1-peterx@redhat.com>
References: <20210108164601.406146-1-peterx@redhat.com>
 <20210108165050.406906-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.247,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

kvm_physical_sync_dirty_bitmap() calculates the ramblock offset in an
awkward way from the MemoryRegionSection that passed in from the
caller.  The truth is for each KVMSlot the ramblock offset never
change for the lifecycle.  Cache the ramblock offset for each KVMSlot
into the structure when the KVMSlot is created.

With that, we can further simplify kvm_physical_sync_dirty_bitmap()
with a helper to sync KVMSlot dirty bitmap to the ramblock dirty
bitmap of a specific KVMSlot.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c      | 37 +++++++++++++++++--------------------
 include/sysemu/kvm_int.h |  2 ++
 2 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index aaa2e1acaa..c7c7627c82 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -597,15 +597,12 @@ static void kvm_log_stop(MemoryListener *listener,
 }
 
 /* get kvm's dirty pages bitmap and update qemu's */
-static int kvm_get_dirty_pages_log_range(MemoryRegionSection *section,
-                                         unsigned long *bitmap)
+static void kvm_slot_sync_dirty_pages(KVMSlot *slot)
 {
-    ram_addr_t start = section->offset_within_region +
-                       memory_region_get_ram_addr(section->mr);
-    ram_addr_t pages = int128_get64(section->size) / qemu_real_host_page_size;
+    ram_addr_t start = slot->ram_start_offset;
+    ram_addr_t pages = slot->memory_size / qemu_real_host_page_size;
 
-    cpu_physical_memory_set_dirty_lebitmap(bitmap, start, pages);
-    return 0;
+    cpu_physical_memory_set_dirty_lebitmap(slot->dirty_bmap, start, pages);
 }
 
 #define ALIGN(x, y)  (((x)+(y)-1) & ~((y)-1))
@@ -667,12 +664,10 @@ static void kvm_physical_sync_dirty_bitmap(KVMMemoryListener *kml,
     KVMState *s = kvm_state;
     KVMSlot *mem;
     hwaddr start_addr, size;
-    hwaddr slot_size, slot_offset = 0;
+    hwaddr slot_size;
 
     size = kvm_align_section(section, &start_addr);
     while (size) {
-        MemoryRegionSection subsection = *section;
-
         slot_size = MIN(kvm_max_slot_size, size);
         mem = kvm_lookup_matching_slot(kml, start_addr, slot_size);
         if (!mem) {
@@ -681,12 +676,7 @@ static void kvm_physical_sync_dirty_bitmap(KVMMemoryListener *kml,
         }
 
         kvm_slot_get_dirty_log(s, mem);
-
-        subsection.offset_within_region += slot_offset;
-        subsection.size = int128_make64(slot_size);
-        kvm_get_dirty_pages_log_range(&subsection, mem->dirty_bmap);
-
-        slot_offset += slot_size;
+        kvm_slot_sync_dirty_pages(mem);
         start_addr += slot_size;
         size -= slot_size;
     }
@@ -1144,7 +1134,8 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
     int err;
     MemoryRegion *mr = section->mr;
     bool writeable = !mr->readonly && !mr->rom_device;
-    hwaddr start_addr, size, slot_size;
+    hwaddr start_addr, size, slot_size, mr_offset;
+    ram_addr_t ram_start_offset;
     void *ram;
 
     if (!memory_region_is_ram(mr)) {
@@ -1162,9 +1153,13 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
         return;
     }
 
-    /* use aligned delta to align the ram address */
-    ram = memory_region_get_ram_ptr(mr) + section->offset_within_region +
-          (start_addr - section->offset_within_address_space);
+    /* The offset of the kvmslot within the memory region */
+    mr_offset = section->offset_within_region + start_addr -
+        section->offset_within_address_space;
+
+    /* use aligned delta to align the ram address and offset */
+    ram = memory_region_get_ram_ptr(mr) + mr_offset;
+    ram_start_offset = memory_region_get_ram_addr(mr) + mr_offset;
 
     kvm_slots_lock();
 
@@ -1203,6 +1198,7 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
         mem->as_id = kml->as_id;
         mem->memory_size = slot_size;
         mem->start_addr = start_addr;
+        mem->ram_start_offset = ram_start_offset;
         mem->ram = ram;
         mem->flags = kvm_mem_flags(mr);
         kvm_slot_init_dirty_bitmap(mem);
@@ -1213,6 +1209,7 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
             abort();
         }
         start_addr += slot_size;
+        ram_start_offset += slot_size;
         ram += slot_size;
         size -= slot_size;
     } while (size);
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index a9c327427f..e0afdd02fd 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -25,6 +25,8 @@ typedef struct KVMSlot
     unsigned long *dirty_bmap;
     /* Cache of the address space ID */
     int as_id;
+    /* Cache of the offset in ram address space */
+    ram_addr_t ram_start_offset;
 } KVMSlot;
 
 typedef struct KVMMemoryListener {
-- 
2.26.2


