Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 550112EF616
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 17:56:26 +0100 (CET)
Received: from localhost ([::1]:59816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxv3n-0002hx-NZ
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 11:56:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kxuyd-0008Gr-85
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:51:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kxuya-0005TC-0b
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:51:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610124659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DPi+d1XqVd+CjlStCrdNo1ZBhL5tTHGRRSkr6Dc1gz0=;
 b=X5WNwxmZddbl3xtOnkcPuloRyKzRCY6wQfhJbqKUK/XlkNf4Y1dPoTEf3pdP3QuHxr4hou
 +gc1LwKVW6No97J7wVDaEG0mMBKCvrIpTJrCj+DCbwcNBlwj9avdV3JO9YXepEQveLbOPq
 dt9qIbrplh7Eh4qLEPNRYrn0oToOLvI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-XAxUC7zJMBq8fYg6zAGkXw-1; Fri, 08 Jan 2021 11:50:57 -0500
X-MC-Unique: XAxUC7zJMBq8fYg6zAGkXw-1
Received: by mail-qk1-f200.google.com with SMTP id f27so9752445qkh.0
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 08:50:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DPi+d1XqVd+CjlStCrdNo1ZBhL5tTHGRRSkr6Dc1gz0=;
 b=Ol4XfGYKziyQ/I6e+g5SoAjMVFGGmnh5ckwVwdDZsi9dlxdSI916Eu5uJxhZQk5AKF
 qu3a++caqSkLfyewoWJjRbHICGLoPvCaoKGqn02S6knXHbCbGWkTM09ND/qhjZ92uN7B
 JMr24AmmsxgXiMXFrPxNig7BBu3uUpZGVAQFyhN543o9qPJZIFmknvt92SL+g33yJCPW
 7Dhc/JPacL0rzCgntecNPKnXc/vUV1UlHdbW/ytgNuEV2nXWytyhRBZ7Ni1QaKJOOlmv
 TxzbXflxMqaH0ndGDi6hJemyh1BJYQ7nSie0aBpvEL5HawYtV81by88IFHHWx0g8xE/B
 WJLA==
X-Gm-Message-State: AOAM530zl7MTj9efW3f63d/wFokFCTt8jhJZKOh3d+2aI9aoHJh+EdqN
 F45Gmp4YzvYMvj0pDmo9z2Z0M/MR0tOS2uNo/6VFnqZXv/3GQ4HnIJkqwCProjyMOmrakVrPfSW
 Oa6Pf74vj1Ap7jyJP4N+G5BhE/7OIpoPtsz9qgAUh0zCO1jKWuvy+FBWPM76JCIdA
X-Received: by 2002:a37:9fc6:: with SMTP id i189mr4595338qke.41.1610124656301; 
 Fri, 08 Jan 2021 08:50:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOhqSzEDkNERgr/nlQVVxUV2Mo6D5puD3vqjetC7BTmpZcw+XnKpqHLDqpW0zINXQdoAj0Cw==
X-Received: by 2002:a37:9fc6:: with SMTP id i189mr4595306qke.41.1610124655987; 
 Fri, 08 Jan 2021 08:50:55 -0800 (PST)
Received: from xz-x1.redhat.com ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id n5sm4954064qkh.126.2021.01.08.08.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 08:50:55 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/13] KVM: Provide helper to get kvm dirty log
Date: Fri,  8 Jan 2021 11:50:44 -0500
Message-Id: <20210108165050.406906-4-peterx@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.247,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Provide a helper kvm_slot_get_dirty_log() to make the function
kvm_physical_sync_dirty_bitmap() clearer.  We can even cache the as_id
into KVMSlot when it is created, so that we don't even need to pass it
down every time.

Since at it, remove return value of kvm_physical_sync_dirty_bitmap()
because it should never fail.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c      | 42 +++++++++++++++++++++-------------------
 include/sysemu/kvm_int.h |  2 ++
 2 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 445ce1b177..aaa2e1acaa 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -635,6 +635,21 @@ static void kvm_slot_init_dirty_bitmap(KVMSlot *mem)
     mem->dirty_bmap = g_malloc0(bitmap_size);
 }
 
+/* Sync dirty bitmap from kernel to KVMSlot.dirty_bmap */
+static void kvm_slot_get_dirty_log(KVMState *s, KVMSlot *slot)
+{
+    struct kvm_dirty_log d = {};
+    int ret;
+
+    d.dirty_bitmap = slot->dirty_bmap;
+    d.slot = slot->slot | (slot->as_id << 16);
+    ret = kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d);
+    if (ret) {
+        error_report_once("%s: KVM_GET_DIRTY_LOG failed with %d",
+                          __func__, ret);
+    }
+}
+
 /**
  * kvm_physical_sync_dirty_bitmap - Sync dirty bitmap from kernel space
  *
@@ -646,15 +661,13 @@ static void kvm_slot_init_dirty_bitmap(KVMSlot *mem)
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
@@ -664,27 +677,19 @@ static int kvm_physical_sync_dirty_bitmap(KVMMemoryListener *kml,
         mem = kvm_lookup_matching_slot(kml, start_addr, slot_size);
         if (!mem) {
             /* We don't have a slot if we want to trap every access. */
-            goto out;
+            return;
         }
 
-        d.dirty_bitmap = mem->dirty_bmap;
-        d.slot = mem->slot | (kml->as_id << 16);
-        if (kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d) == -1) {
-            DPRINTF("ioctl failed %d\n", errno);
-            ret = -1;
-            goto out;
-        }
+        kvm_slot_get_dirty_log(s, mem);
 
         subsection.offset_within_region += slot_offset;
         subsection.size = int128_make64(slot_size);
-        kvm_get_dirty_pages_log_range(&subsection, d.dirty_bitmap);
+        kvm_get_dirty_pages_log_range(&subsection, mem->dirty_bmap);
 
         slot_offset += slot_size;
         start_addr += slot_size;
         size -= slot_size;
     }
-out:
-    return ret;
 }
 
 /* Alignment requirement for KVM_CLEAR_DIRTY_LOG - 64 pages */
@@ -1195,6 +1200,7 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
     do {
         slot_size = MIN(kvm_max_slot_size, size);
         mem = kvm_alloc_slot(kml);
+        mem->as_id = kml->as_id;
         mem->memory_size = slot_size;
         mem->start_addr = start_addr;
         mem->ram = ram;
@@ -1237,14 +1243,10 @@ static void kvm_log_sync(MemoryListener *listener,
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
index f3d9eed750..a9c327427f 100644
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


