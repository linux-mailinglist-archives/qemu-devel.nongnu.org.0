Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077B13480D4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:43:41 +0100 (CET)
Received: from localhost ([::1]:44678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8Tj-0000iv-SH
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lP8QN-0007KV-0E
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:40:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lP8QK-0006ag-UP
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:40:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616611208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AJg3LzsoV0uD8Yhji+O8YBMotRNzJfz+BKtRamGN6Tk=;
 b=XpsRPBKy8GJUD4c8i8wlhXGDpyoafKTrg6xGHwy+pfDNg4bIJ8w5ULrVvr9u3DBmJLRxM6
 gD28psZ2YkyBxSF6DP6a/ZzAWyMOV0xDgPtk4FeaDsPsQeOwXtt+U6QwB7cQuavNGYtSXv
 6V4H2ZdEYMQsaGGFsLY28wJS9G2LoSA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-21qmTyh1Mvac9OMOFkPWyg-1; Wed, 24 Mar 2021 14:40:06 -0400
X-MC-Unique: 21qmTyh1Mvac9OMOFkPWyg-1
Received: by mail-qk1-f200.google.com with SMTP id y9so2264095qki.14
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AJg3LzsoV0uD8Yhji+O8YBMotRNzJfz+BKtRamGN6Tk=;
 b=tSNDuJIocz2dU5BsKl03O16ir3maijpp7k/I8GV8HmwFWFiQpvlEJAiq495ZgxWJWQ
 XF29SzFM77r1nSklQoB0uz8IjXhq+B5+ox4RTtT4MGmzsoJOeutbhM05n+0RsqISOLUC
 AoKo65JXGtZnizrUNBeS+9Nqn/fwfU2QJh6npERsMdGnQZv4JEww4TG8fRUlVdl+bmav
 9p/vk/+S0FZZotLyc/p/FxTx6cUXPohhZvWdqMM/4TQNxrFoElAjpp7784WiWR7ZQcYR
 vyw/TYIKEx/2Lq8dmRYgMTr12Hl7kd7UvuTYt2TRdXdHCNwGeg71iNK+ZNOtRkZkwbMo
 dLfg==
X-Gm-Message-State: AOAM533tS9AKUzaIZ0fYouWlxIWxEg8i8bVsUlOBBnHzwW+I3cA7ekFT
 bKSPQcwSusJ80wUZIDa3OACtLJDcQuxWM16MXIEtT0PCOsdlIllqj1IGpg3VtJUd8bhT/LbCpmF
 i90Y984PrJh5fnVq5wfUbgaBb2MEsNA3g3XDX1f5bU3mtTJMHRK+UL5q0JyX6txz1
X-Received: by 2002:a05:620a:16dc:: with SMTP id
 a28mr4488620qkn.442.1616611204057; 
 Wed, 24 Mar 2021 11:40:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwK9tqFDdw8BYGI11hYwChpwWckrv//tqUo0HyopDIL/feLYjDWmj7WeiFl0eyqCkXz/3Ygqg==
X-Received: by 2002:a05:620a:16dc:: with SMTP id
 a28mr4488585qkn.442.1616611203743; 
 Wed, 24 Mar 2021 11:40:03 -0700 (PDT)
Received: from xz-x1.redhat.com
 (bras-base-toroon474qw-grc-82-174-91-135-175.dsl.bell.ca. [174.91.135.175])
 by smtp.gmail.com with ESMTPSA id t24sm2001083qto.23.2021.03.24.11.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 11:40:02 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 04/10] KVM: Provide helper to get kvm dirty log
Date: Wed, 24 Mar 2021 14:39:48 -0400
Message-Id: <20210324183954.345629-5-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210324183954.345629-1-peterx@redhat.com>
References: <20210324183954.345629-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>,
 Hyman <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide a helper kvm_slot_get_dirty_log() to make the function
kvm_physical_sync_dirty_bitmap() clearer.  We can even cache the as_id
into KVMSlot when it is created, so that we don't even need to pass it
down every time.

Since at it, remove return value of kvm_physical_sync_dirty_bitmap()
because it should never fail.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c      | 52 +++++++++++++++++++++++-----------------
 include/sysemu/kvm_int.h |  2 ++
 2 files changed, 32 insertions(+), 22 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 55ee5f1ad69..27460587a03 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -617,6 +617,30 @@ static void kvm_slot_init_dirty_bitmap(KVMSlot *mem)
     mem->dirty_bmap = g_malloc0(bitmap_size);
 }
 
+/*
+ * Sync dirty bitmap from kernel to KVMSlot.dirty_bmap, return true if
+ * succeeded, false otherwise
+ */
+static bool kvm_slot_get_dirty_log(KVMState *s, KVMSlot *slot)
+{
+    struct kvm_dirty_log d = {};
+    int ret;
+
+    d.dirty_bitmap = slot->dirty_bmap;
+    d.slot = slot->slot | (slot->as_id << 16);
+    ret = kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d);
+
+    if (ret == -ENOENT) {
+        /* kernel does not have dirty bitmap in this slot */
+        ret = 0;
+    }
+    if (ret) {
+        error_report_once("%s: KVM_GET_DIRTY_LOG failed with %d",
+                          __func__, ret);
+    }
+    return ret == 0;
+}
+
 /**
  * kvm_physical_sync_dirty_bitmap - Sync dirty bitmap from kernel space
  *
@@ -628,15 +652,13 @@ static void kvm_slot_init_dirty_bitmap(KVMSlot *mem)
  * @kml: the KVM memory listener object
  * @section: the memory section to sync the dirty bitmap with
  */
-static int kvm_physical_sync_dirty_bitmap(KVMMemoryListener *kml,
-                                          MemoryRegionSection *section)
+static void kvm_physical_sync_dirty_bitmap(KVMMemoryListener *kml,
+                                           MemoryRegionSection *section)
 {
     KVMState *s = kvm_state;
-    struct kvm_dirty_log d = {};
     KVMSlot *mem;
     hwaddr start_addr, size;
     hwaddr slot_size, slot_offset = 0;
-    int ret = 0;
 
     size = kvm_align_section(section, &start_addr);
     while (size) {
@@ -646,19 +668,10 @@ static int kvm_physical_sync_dirty_bitmap(KVMMemoryListener *kml,
         mem = kvm_lookup_matching_slot(kml, start_addr, slot_size);
         if (!mem) {
             /* We don't have a slot if we want to trap every access. */
-            goto out;
+            return;
         }
 
-        d.dirty_bitmap = mem->dirty_bmap;
-        d.slot = mem->slot | (kml->as_id << 16);
-        ret = kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d);
-        if (ret == -ENOENT) {
-            /* kernel does not have dirty bitmap in this slot */
-            ret = 0;
-        } else if (ret < 0) {
-            error_report("ioctl KVM_GET_DIRTY_LOG failed: %d", errno);
-            goto out;
-        } else {
+        if (kvm_slot_get_dirty_log(s, mem)) {
             subsection.offset_within_region += slot_offset;
             subsection.size = int128_make64(slot_size);
             kvm_get_dirty_pages_log_range(&subsection, d.dirty_bitmap);
@@ -668,8 +681,6 @@ static int kvm_physical_sync_dirty_bitmap(KVMMemoryListener *kml,
         start_addr += slot_size;
         size -= slot_size;
     }
-out:
-    return ret;
 }
 
 /* Alignment requirement for KVM_CLEAR_DIRTY_LOG - 64 pages */
@@ -1181,6 +1192,7 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
     do {
         slot_size = MIN(kvm_max_slot_size, size);
         mem = kvm_alloc_slot(kml);
+        mem->as_id = kml->as_id;
         mem->memory_size = slot_size;
         mem->start_addr = start_addr;
         mem->ram = ram;
@@ -1223,14 +1235,10 @@ static void kvm_log_sync(MemoryListener *listener,
                          MemoryRegionSection *section)
 {
     KVMMemoryListener *kml = container_of(listener, KVMMemoryListener, listener);
-    int r;
 
     kvm_slots_lock();
-    r = kvm_physical_sync_dirty_bitmap(kml, section);
+    kvm_physical_sync_dirty_bitmap(kml, section);
     kvm_slots_unlock();
-    if (r < 0) {
-        abort();
-    }
 }
 
 static void kvm_log_clear(MemoryListener *listener,
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index 1da30e18841..e13075f738a 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -23,6 +23,8 @@ typedef struct KVMSlot
     int old_flags;
     /* Dirty bitmap cache for the slot */
     unsigned long *dirty_bmap;
+    /* Cache of the address space ID */
+    int as_id;
 } KVMSlot;
 
 typedef struct KVMMemoryListener {
-- 
2.26.2


