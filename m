Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7C75FB0A8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 12:44:37 +0200 (CEST)
Received: from localhost ([::1]:49946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiCkU-0006UK-8H
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 06:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCTr-0001mO-C9
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCTn-0004Jf-Ak
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xZusI1znOLcmgbAOaPKJgjMoffzX/bBvt01BsInxDwo=;
 b=KdbCOaiekAW1EP4bqRXH4gHZGSoRntXHF8Iax8O+RZrcEn9R8TL83w/Kcq0anbpoYRAxA6
 jUYKHLHr4aUdrUNam2w67iU80BnSUadoh1kzIWzsfOeCJHR3QbZ1S8zWlSEnfmLdVU+31t
 NLUkGQDn6bfXizUOsFc4sxxQq84+Sgw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-499-4jnRSv5eNVWGp2F6t9CkUQ-1; Tue, 11 Oct 2022 06:27:17 -0400
X-MC-Unique: 4jnRSv5eNVWGp2F6t9CkUQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 b19-20020a056402351300b0045c129ed62cso4013503edd.6
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xZusI1znOLcmgbAOaPKJgjMoffzX/bBvt01BsInxDwo=;
 b=QPqGfGOMqb0LE+XcBt/ktZGbB2HYkvytnozM/LDsYeWKwLJq7f1hdwiEd8mo59lsCR
 BMTIum6PJaaLmgIewO5TyxPT6wqv3TjBJDNWS+GPMx04QtqMwOE5rSzZ6HwGSdLnI628
 bgvwJGy2YWMCXdcr+xQCvtifjKBNwNKHVUK58RZrSw5hBfaN5MGw0VgYUz/hqwfDgFHB
 XgKc3vKFnXUInozmXyyTsgwbGGUbRPmdR9AstcMbkeoMh1vDFLdBV+ph4NsDr8ta6wb5
 9FebRZjvIivlIO4qJSqjvHJsjhNNbBtLHArzNMzQF97d3eOB3+M8B3QRVmwR3hxsDUKy
 7qfQ==
X-Gm-Message-State: ACrzQf3fzzfwnPhZUss6XPkSAZXXMm80Ya+UAzMIAm3KubFZbxdC5Dr+
 QZu6OWVBJYqUnjOeosSTST2x0B5+FCq0vDzwg0gAljKk0vZ9tBXHtTMYnq5M8yB/TW7VBKQjIIC
 XcPhNWP409JsUiTCy067AKwpRBqfWfda4DQT2IuvdrSAG9+bDuUm1HY1jwntTCe/QBMk=
X-Received: by 2002:a17:907:e87:b0:783:98dd:4221 with SMTP id
 ho7-20020a1709070e8700b0078398dd4221mr19573768ejc.22.1665484035844; 
 Tue, 11 Oct 2022 03:27:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Xuh75GsExw5Zy2ascM3vwZTMeWGK6VtUG32rlxElMXioB5cUhlW1qQ7e0kNfwTljM6hD5eA==
X-Received: by 2002:a17:907:e87:b0:783:98dd:4221 with SMTP id
 ho7-20020a1709070e8700b0078398dd4221mr19573752ejc.22.1665484035570; 
 Tue, 11 Oct 2022 03:27:15 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 kw17-20020a170907771100b0077e6be40e4asm6799060ejc.175.2022.10.11.03.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:27:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Chenyi Qiang <chenyi.qiang@intel.com>
Subject: [PULL 04/37] kvm: expose struct KVMState
Date: Tue, 11 Oct 2022 12:26:27 +0200
Message-Id: <20221011102700.319178-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011102700.319178-1-pbonzini@redhat.com>
References: <20221011102700.319178-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chenyi Qiang <chenyi.qiang@intel.com>

Expose struct KVMState out of kvm-all.c so that the field of struct
KVMState can be accessed when defining target-specific accelerator
properties.

Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
Message-Id: <20220929072014.20705-4-chenyi.qiang@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c      | 74 --------------------------------------
 include/sysemu/kvm_int.h | 76 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+), 74 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 03a69cf053..fbfe948398 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -77,86 +77,12 @@
     do { } while (0)
 #endif
 
-#define KVM_MSI_HASHTAB_SIZE    256
-
 struct KVMParkedVcpu {
     unsigned long vcpu_id;
     int kvm_fd;
     QLIST_ENTRY(KVMParkedVcpu) node;
 };
 
-enum KVMDirtyRingReaperState {
-    KVM_DIRTY_RING_REAPER_NONE = 0,
-    /* The reaper is sleeping */
-    KVM_DIRTY_RING_REAPER_WAIT,
-    /* The reaper is reaping for dirty pages */
-    KVM_DIRTY_RING_REAPER_REAPING,
-};
-
-/*
- * KVM reaper instance, responsible for collecting the KVM dirty bits
- * via the dirty ring.
- */
-struct KVMDirtyRingReaper {
-    /* The reaper thread */
-    QemuThread reaper_thr;
-    volatile uint64_t reaper_iteration; /* iteration number of reaper thr */
-    volatile enum KVMDirtyRingReaperState reaper_state; /* reap thr state */
-};
-
-struct KVMState
-{
-    AccelState parent_obj;
-
-    int nr_slots;
-    int fd;
-    int vmfd;
-    int coalesced_mmio;
-    int coalesced_pio;
-    struct kvm_coalesced_mmio_ring *coalesced_mmio_ring;
-    bool coalesced_flush_in_progress;
-    int vcpu_events;
-    int robust_singlestep;
-    int debugregs;
-#ifdef KVM_CAP_SET_GUEST_DEBUG
-    QTAILQ_HEAD(, kvm_sw_breakpoint) kvm_sw_breakpoints;
-#endif
-    int max_nested_state_len;
-    int many_ioeventfds;
-    int intx_set_mask;
-    int kvm_shadow_mem;
-    bool kernel_irqchip_allowed;
-    bool kernel_irqchip_required;
-    OnOffAuto kernel_irqchip_split;
-    bool sync_mmu;
-    uint64_t manual_dirty_log_protect;
-    /* The man page (and posix) say ioctl numbers are signed int, but
-     * they're not.  Linux, glibc and *BSD all treat ioctl numbers as
-     * unsigned, and treating them as signed here can break things */
-    unsigned irq_set_ioctl;
-    unsigned int sigmask_len;
-    GHashTable *gsimap;
-#ifdef KVM_CAP_IRQ_ROUTING
-    struct kvm_irq_routing *irq_routes;
-    int nr_allocated_irq_routes;
-    unsigned long *used_gsi_bitmap;
-    unsigned int gsi_count;
-    QTAILQ_HEAD(, KVMMSIRoute) msi_hashtab[KVM_MSI_HASHTAB_SIZE];
-#endif
-    KVMMemoryListener memory_listener;
-    QLIST_HEAD(, KVMParkedVcpu) kvm_parked_vcpus;
-
-    /* For "info mtree -f" to tell if an MR is registered in KVM */
-    int nr_as;
-    struct KVMAs {
-        KVMMemoryListener *ml;
-        AddressSpace *as;
-    } *as;
-    uint64_t kvm_dirty_ring_bytes;  /* Size of the per-vcpu dirty ring */
-    uint32_t kvm_dirty_ring_size;   /* Number of dirty GFNs per ring */
-    struct KVMDirtyRingReaper reaper;
-};
-
 KVMState *kvm_state;
 bool kvm_kernel_irqchip;
 bool kvm_split_irqchip;
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index 1f5487d9b7..3b4adcdc10 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -10,6 +10,7 @@
 #define QEMU_KVM_INT_H
 
 #include "exec/memory.h"
+#include "qapi/qapi-types-common.h"
 #include "qemu/accel.h"
 #include "sysemu/kvm.h"
 
@@ -36,6 +37,81 @@ typedef struct KVMMemoryListener {
     int as_id;
 } KVMMemoryListener;
 
+#define KVM_MSI_HASHTAB_SIZE    256
+
+enum KVMDirtyRingReaperState {
+    KVM_DIRTY_RING_REAPER_NONE = 0,
+    /* The reaper is sleeping */
+    KVM_DIRTY_RING_REAPER_WAIT,
+    /* The reaper is reaping for dirty pages */
+    KVM_DIRTY_RING_REAPER_REAPING,
+};
+
+/*
+ * KVM reaper instance, responsible for collecting the KVM dirty bits
+ * via the dirty ring.
+ */
+struct KVMDirtyRingReaper {
+    /* The reaper thread */
+    QemuThread reaper_thr;
+    volatile uint64_t reaper_iteration; /* iteration number of reaper thr */
+    volatile enum KVMDirtyRingReaperState reaper_state; /* reap thr state */
+};
+struct KVMState
+{
+    AccelState parent_obj;
+
+    int nr_slots;
+    int fd;
+    int vmfd;
+    int coalesced_mmio;
+    int coalesced_pio;
+    struct kvm_coalesced_mmio_ring *coalesced_mmio_ring;
+    bool coalesced_flush_in_progress;
+    int vcpu_events;
+    int robust_singlestep;
+    int debugregs;
+#ifdef KVM_CAP_SET_GUEST_DEBUG
+    QTAILQ_HEAD(, kvm_sw_breakpoint) kvm_sw_breakpoints;
+#endif
+    int max_nested_state_len;
+    int many_ioeventfds;
+    int intx_set_mask;
+    int kvm_shadow_mem;
+    bool kernel_irqchip_allowed;
+    bool kernel_irqchip_required;
+    OnOffAuto kernel_irqchip_split;
+    bool sync_mmu;
+    uint64_t manual_dirty_log_protect;
+    /* The man page (and posix) say ioctl numbers are signed int, but
+     * they're not.  Linux, glibc and *BSD all treat ioctl numbers as
+     * unsigned, and treating them as signed here can break things */
+    unsigned irq_set_ioctl;
+    unsigned int sigmask_len;
+    GHashTable *gsimap;
+#ifdef KVM_CAP_IRQ_ROUTING
+    struct kvm_irq_routing *irq_routes;
+    int nr_allocated_irq_routes;
+    unsigned long *used_gsi_bitmap;
+    unsigned int gsi_count;
+    QTAILQ_HEAD(, KVMMSIRoute) msi_hashtab[KVM_MSI_HASHTAB_SIZE];
+#endif
+    KVMMemoryListener memory_listener;
+    QLIST_HEAD(, KVMParkedVcpu) kvm_parked_vcpus;
+
+    /* For "info mtree -f" to tell if an MR is registered in KVM */
+    int nr_as;
+    struct KVMAs {
+        KVMMemoryListener *ml;
+        AddressSpace *as;
+    } *as;
+    uint64_t kvm_dirty_ring_bytes;  /* Size of the per-vcpu dirty ring */
+    uint32_t kvm_dirty_ring_size;   /* Number of dirty GFNs per ring */
+    struct KVMDirtyRingReaper reaper;
+    NotifyVmexitOption notify_vmexit;
+    uint32_t notify_window;
+};
+
 void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
                                   AddressSpace *as, int as_id, const char *name);
 
-- 
2.37.3


