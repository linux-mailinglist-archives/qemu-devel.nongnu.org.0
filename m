Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DED2EF615
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 17:56:18 +0100 (CET)
Received: from localhost ([::1]:59798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxv3g-0002hJ-4z
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 11:56:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kxuyZ-00089L-2J
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:50:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kxuyW-0005Ru-Ve
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:50:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610124656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dNNUkgCHDqnn4h+zLY4Ywf90DjPhnZqB9vTnYirewJM=;
 b=FFj4VMT3GOijda5YWlZr1YZFQL7gtnsnMP4trF4nD0n4kT395aVr4q7miDaA55IYGwfoNv
 E9YKim/scoIYNjgK0VDNTae4B5giNhP7lDZlfGPeGod2oWKAm/3fLS/3SZtm/2L3vvSojJ
 b1n703VE6z9HR1YsWuRF5+NXjJMIOBY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-Jp_IRJFlNzSh9UJoGqT4nw-1; Fri, 08 Jan 2021 11:50:54 -0500
X-MC-Unique: Jp_IRJFlNzSh9UJoGqT4nw-1
Received: by mail-qv1-f69.google.com with SMTP id x17so285014qvo.23
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 08:50:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dNNUkgCHDqnn4h+zLY4Ywf90DjPhnZqB9vTnYirewJM=;
 b=qjKc+cFRRuI6uHqV26xZrP9EGQbcoQKo00bwiOadgBJ2dtc/Cfi/MwN3UKAj9Uaojq
 03HH/vPhwWjcMXa8qG+6OCGOUVYwLJuJlmVwDyREDV7QvOviWX9MZ4qY+8qCEJVtO9Pn
 dQmw6gdXWMiuhc8Iu7OeO5nJP4mV0Zt4dOVkGTb6vp/SciIAIKzHN9ed8SOqNvBK+3aL
 auwr27A4SaloPCgoI1l7pBJqcg+2rg3tzYM1umXjLTRFdt3FySmPz35S1RcvInUdfUc9
 VtokpxSPWYHuuj/tG5yh4WNJGMr4oTJ/DqK4IrHlc4RWtxnNDCRkKcVSySQfMrPOVDcm
 wXSQ==
X-Gm-Message-State: AOAM533nZYNKP4DRxk5wda4fGEK3ZokP6pf5nZcClXtaxtN8H3+HReKT
 rW+SHw1YkyEooOi1FmPoe7DRPJUImFQeL5gUldfQqAHtaxxEQ/6AQYgExzcQ1dc46+doFMXd9oF
 2Ppn3aclUJDqsfD9tWIvym8E/EvqCdAgA0eR9fkdpp3DUAoUZXR5/i5hnQqA6TBqf
X-Received: by 2002:a05:620a:2104:: with SMTP id
 l4mr4553764qkl.35.1610124653685; 
 Fri, 08 Jan 2021 08:50:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4w1MHyBEMqd7FSrVWQcgVmIgieMmLk7edhfAwuIK5INpfFevdLeQXdjMC4nzrAuaPZnJF/Q==
X-Received: by 2002:a05:620a:2104:: with SMTP id
 l4mr4553740qkl.35.1610124653416; 
 Fri, 08 Jan 2021 08:50:53 -0800 (PST)
Received: from xz-x1.redhat.com ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id n5sm4954064qkh.126.2021.01.08.08.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 08:50:52 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/13] KVM: Use a big lock to replace per-kml slots_lock
Date: Fri,  8 Jan 2021 11:50:42 -0500
Message-Id: <20210108165050.406906-2-peterx@redhat.com>
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

Per-kml slots_lock will bring some trouble if we want to take all slots_lock of
all the KMLs, especially when we're in a context that we could have taken some
of the KML slots_lock, then we even need to figure out what we've taken and
what we need to take.

Make this simple by merging all KML slots_lock into a single slots lock.

Per-kml slots_lock isn't anything that helpful anyway - so far only x86 has two
address spaces (so, two slots_locks).  All the rest archs will be having one
address space always, which means there's actually one slots_lock so it will be
the same as before.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c      | 32 +++++++++++++++++---------------
 include/sysemu/kvm_int.h |  2 --
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 9f779b56ae..d891a22a3b 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -176,8 +176,10 @@ typedef struct KVMResampleFd KVMResampleFd;
 static QLIST_HEAD(, KVMResampleFd) kvm_resample_fd_list =
     QLIST_HEAD_INITIALIZER(kvm_resample_fd_list);
 
-#define kvm_slots_lock(kml)      qemu_mutex_lock(&(kml)->slots_lock)
-#define kvm_slots_unlock(kml)    qemu_mutex_unlock(&(kml)->slots_lock)
+static QemuMutex kml_slots_lock;
+
+#define kvm_slots_lock()  qemu_mutex_lock(&kml_slots_lock)
+#define kvm_slots_unlock()  qemu_mutex_unlock(&kml_slots_lock)
 
 static inline void kvm_resample_fd_remove(int gsi)
 {
@@ -263,9 +265,9 @@ bool kvm_has_free_slot(MachineState *ms)
     bool result;
     KVMMemoryListener *kml = &s->memory_listener;
 
-    kvm_slots_lock(kml);
+    kvm_slots_lock();
     result = !!kvm_get_free_slot(kml);
-    kvm_slots_unlock(kml);
+    kvm_slots_unlock();
 
     return result;
 }
@@ -331,7 +333,7 @@ int kvm_physical_memory_addr_from_host(KVMState *s, void *ram,
     KVMMemoryListener *kml = &s->memory_listener;
     int i, ret = 0;
 
-    kvm_slots_lock(kml);
+    kvm_slots_lock();
     for (i = 0; i < s->nr_slots; i++) {
         KVMSlot *mem = &kml->slots[i];
 
@@ -341,7 +343,7 @@ int kvm_physical_memory_addr_from_host(KVMState *s, void *ram,
             break;
         }
     }
-    kvm_slots_unlock(kml);
+    kvm_slots_unlock();
 
     return ret;
 }
@@ -537,7 +539,7 @@ static int kvm_section_update_flags(KVMMemoryListener *kml,
         return 0;
     }
 
-    kvm_slots_lock(kml);
+    kvm_slots_lock();
 
     while (size && !ret) {
         slot_size = MIN(kvm_max_slot_size, size);
@@ -553,7 +555,7 @@ static int kvm_section_update_flags(KVMMemoryListener *kml,
     }
 
 out:
-    kvm_slots_unlock(kml);
+    kvm_slots_unlock();
     return ret;
 }
 
@@ -826,7 +828,7 @@ static int kvm_physical_log_clear(KVMMemoryListener *kml,
         return ret;
     }
 
-    kvm_slots_lock(kml);
+    kvm_slots_lock();
 
     for (i = 0; i < s->nr_slots; i++) {
         mem = &kml->slots[i];
@@ -852,7 +854,7 @@ static int kvm_physical_log_clear(KVMMemoryListener *kml,
         }
     }
 
-    kvm_slots_unlock(kml);
+    kvm_slots_unlock();
 
     return ret;
 }
@@ -1157,7 +1159,7 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
     ram = memory_region_get_ram_ptr(mr) + section->offset_within_region +
           (start_addr - section->offset_within_address_space);
 
-    kvm_slots_lock(kml);
+    kvm_slots_lock();
 
     if (!add) {
         do {
@@ -1215,7 +1217,7 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
     } while (size);
 
 out:
-    kvm_slots_unlock(kml);
+    kvm_slots_unlock();
 }
 
 static void kvm_region_add(MemoryListener *listener,
@@ -1242,9 +1244,9 @@ static void kvm_log_sync(MemoryListener *listener,
     KVMMemoryListener *kml = container_of(listener, KVMMemoryListener, listener);
     int r;
 
-    kvm_slots_lock(kml);
+    kvm_slots_lock();
     r = kvm_physical_sync_dirty_bitmap(kml, section);
-    kvm_slots_unlock(kml);
+    kvm_slots_unlock();
     if (r < 0) {
         abort();
     }
@@ -1344,7 +1346,7 @@ void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
 {
     int i;
 
-    qemu_mutex_init(&kml->slots_lock);
+    qemu_mutex_init(&kml_slots_lock);
     kml->slots = g_malloc0(s->nr_slots * sizeof(KVMSlot));
     kml->as_id = as_id;
 
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index 65740806da..f3d9eed750 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -27,8 +27,6 @@ typedef struct KVMSlot
 
 typedef struct KVMMemoryListener {
     MemoryListener listener;
-    /* Protects the slots and all inside them */
-    QemuMutex slots_lock;
     KVMSlot *slots;
     int as_id;
 } KVMMemoryListener;
-- 
2.26.2


