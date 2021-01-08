Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8602EF63E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 18:10:06 +0100 (CET)
Received: from localhost ([::1]:56092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxvH3-0005UO-8A
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 12:10:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kxuyh-0008Nr-OW
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:51:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kxuyf-0005an-E4
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:51:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610124664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/XUy2ySdm9sYgEhOIugK6N1I/xZrlp1axcj8OZ5jZyE=;
 b=dtxXfT+9Ldst+tOoGFpZBX0ICeiiKtP5JUb1mpbM5iQqREAdZU/qxYJkMc39EqViRnlSFo
 KVdnDISHssMMzflTpb8h4uxdstz83nz7kmdPQj5v/yUfp+zAFMCDVixUmWQHOzpz3Gc3xD
 YKN/X7SlBPe/iHQMicdfAfwqB3eysy4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-Ya2luLLQOS-PvmAvJr-yHw-1; Fri, 08 Jan 2021 11:51:02 -0500
X-MC-Unique: Ya2luLLQOS-PvmAvJr-yHw-1
Received: by mail-qt1-f200.google.com with SMTP id c14so8713997qtn.5
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 08:51:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/XUy2ySdm9sYgEhOIugK6N1I/xZrlp1axcj8OZ5jZyE=;
 b=WP7hcYap+8zgenszBPi3tGxOEFNuXfTaSjDU3Rv6t/cu59MJgMGRWd3SnIXJTIyq1t
 ucPWlQyCWryHTqoghY1q4t/4t2D/TfDSwLklAbrDHY6S83l46qbYputqjucOAFhAaHie
 peC9Qqly/uJgPQqJWcNPGbfQYx+VBSp986ftfUmGJWLAPfl1w7b3NK1YQ7scfArMvhbW
 3SRCFo9m5aCDw5WDaH73XjlyuvhnO+VMyOm83g2gtq3tc7ZN8m75iNrMmbBXIpacEzyb
 QzUSopU9BUFFZd8FZin7/VN8VcNj9M/oYw9LZ/9cWcXG3Si8aKBIsf/BZf2GVVwFpA0A
 5EPA==
X-Gm-Message-State: AOAM533fbkqxmxYpctpiQB31J8NB0hrIfPkK3QzSCQwqyEHf3F8rHXsc
 sSxeb4J8iBRmZGTGf123Ct0DbuM92MpFzzCuHQNXPoK6r1HX1Gu0HEszy71Vmakvc3HoH9k7mM0
 5GvYV3GhSmeCvhjK4cTbq7dC2/5d49KF+Rchja1Z9fvfmefVV0558nkKdtlD6P54c
X-Received: by 2002:ac8:45d7:: with SMTP id e23mr4240992qto.149.1610124661614; 
 Fri, 08 Jan 2021 08:51:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhWJmOwY7nZheMZzM5hSeAPXojPODJ6WC6ibjHRfX6M+x6kH0KjQ/7nHxCCbx5mgx8pRoj1g==
X-Received: by 2002:ac8:45d7:: with SMTP id e23mr4240965qto.149.1610124661332; 
 Fri, 08 Jan 2021 08:51:01 -0800 (PST)
Received: from xz-x1.redhat.com ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id n5sm4954064qkh.126.2021.01.08.08.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 08:51:00 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/13] KVM: Add dirty-gfn-count property
Date: Fri,  8 Jan 2021 11:50:48 -0500
Message-Id: <20210108165050.406906-8-peterx@redhat.com>
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

Add a parameter for dirty gfn count for dirty rings.  If zero, dirty ring is
disabled.  Otherwise dirty ring will be enabled with the per-vcpu gfn count as
specified.  If dirty ring cannot be enabled due to unsupported kernel or
illegal parameter, it'll fallback to dirty logging.

By default, dirty ring is not enabled (dirty-gfn-count default to 0).

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c | 72 +++++++++++++++++++++++++++++++++++++++++++++
 qemu-options.hx     | 12 ++++++++
 2 files changed, 84 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 5339de04cf..77b2c4eb0c 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -130,6 +130,9 @@ struct KVMState
         KVMMemoryListener *ml;
         AddressSpace *as;
     } *as;
+    bool kvm_dirty_ring_enabled;    /* Whether KVM dirty ring is enabled */
+    uint64_t kvm_dirty_ring_size;   /* Size of the per-vcpu dirty ring */
+    uint32_t kvm_dirty_gfn_count;   /* Number of dirty GFNs per ring */
 };
 
 KVMState *kvm_state;
@@ -2137,6 +2140,40 @@ static int kvm_init(MachineState *ms)
     s->coalesced_pio = s->coalesced_mmio &&
                        kvm_check_extension(s, KVM_CAP_COALESCED_PIO);
 
+    /*
+     * Enable KVM dirty ring if supported, otherwise fall back to
+     * dirty logging mode
+     */
+    if (s->kvm_dirty_gfn_count > 0) {
+        uint64_t ring_size;
+
+        ring_size = s->kvm_dirty_gfn_count * sizeof(struct kvm_dirty_gfn);
+
+        /* Read the max supported pages */
+        ret = kvm_vm_check_extension(s, KVM_CAP_DIRTY_LOG_RING);
+        if (ret > 0) {
+            if (ring_size > ret) {
+                error_report("KVM dirty GFN count %" PRIu32 " too big "
+                             "(maximum is %ld).  Please use a smaller value.",
+                             s->kvm_dirty_gfn_count,
+                             ret / sizeof(struct kvm_dirty_gfn));
+                ret = -EINVAL;
+                goto err;
+            }
+
+            ret = kvm_vm_enable_cap(s, KVM_CAP_DIRTY_LOG_RING, 0, ring_size);
+            if (ret) {
+                error_report("Enabling of KVM dirty ring failed: %d. "
+                             "Suggested mininum value is 1024. "
+                             "Please also make sure it's a power of two.", ret);
+                goto err;
+            }
+
+            s->kvm_dirty_ring_size = ring_size;
+            s->kvm_dirty_ring_enabled = true;
+        }
+    }
+
     dirty_log_manual_caps =
         kvm_check_extension(s, KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2);
     dirty_log_manual_caps &= (KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE |
@@ -3191,6 +3228,33 @@ bool kvm_kernel_irqchip_split(void)
     return kvm_state->kernel_irqchip_split == ON_OFF_AUTO_ON;
 }
 
+static void kvm_get_dirty_gfn_count(Object *obj, Visitor *v,
+                                    const char *name, void *opaque,
+                                    Error **errp)
+{
+    KVMState *s = KVM_STATE(obj);
+    uint32_t value = s->kvm_dirty_gfn_count;
+
+    visit_type_uint32(v, name, &value, errp);
+}
+
+static void kvm_set_dirty_gfn_count(Object *obj, Visitor *v,
+                                    const char *name, void *opaque,
+                                    Error **errp)
+{
+    KVMState *s = KVM_STATE(obj);
+    Error *error = NULL;
+    uint32_t value;
+
+    visit_type_uint32(v, name, &value, &error);
+    if (error) {
+        error_propagate(errp, error);
+        return;
+    }
+
+    s->kvm_dirty_gfn_count = value;
+}
+
 static void kvm_accel_instance_init(Object *obj)
 {
     KVMState *s = KVM_STATE(obj);
@@ -3198,6 +3262,8 @@ static void kvm_accel_instance_init(Object *obj)
     s->kvm_shadow_mem = -1;
     s->kernel_irqchip_allowed = true;
     s->kernel_irqchip_split = ON_OFF_AUTO_AUTO;
+    /* KVM dirty ring is by default off */
+    s->kvm_dirty_gfn_count = 0;
 }
 
 static void kvm_accel_class_init(ObjectClass *oc, void *data)
@@ -3219,6 +3285,12 @@ static void kvm_accel_class_init(ObjectClass *oc, void *data)
         NULL, NULL);
     object_class_property_set_description(oc, "kvm-shadow-mem",
         "KVM shadow MMU size");
+
+    object_class_property_add(oc, "dirty-gfn-count", "uint32",
+        kvm_get_dirty_gfn_count, kvm_set_dirty_gfn_count,
+        NULL, NULL);
+    object_class_property_set_description(oc, "dirty-gfn-count",
+        "KVM dirty GFN count (=0 to disable dirty ring)");
 }
 
 static const TypeInfo kvm_accel_type = {
diff --git a/qemu-options.hx b/qemu-options.hx
index 459c916d3d..e96e57870c 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -116,6 +116,7 @@ DEF("accel", HAS_ARG, QEMU_OPTION_accel,
     "                kernel-irqchip=on|off|split controls accelerated irqchip support (default=on)\n"
     "                kvm-shadow-mem=size of KVM shadow MMU in bytes\n"
     "                tb-size=n (TCG translation block cache size)\n"
+    "                dirty-gfn-count=n (KVM dirty ring GFN count, default 0)\n"
     "                thread=single|multi (enable multi-threaded TCG)\n", QEMU_ARCH_ALL)
 SRST
 ``-accel name[,prop=value[,...]]``
@@ -150,6 +151,17 @@ SRST
         where both the back-end and front-ends support it and no
         incompatible TCG features have been enabled (e.g.
         icount/replay).
+
+    ``dirty-gfn-count=n``
+        When KVM accelerator is used, it controls the per-vcpu KVM dirty ring
+        size (number of entries one dirty ring contains, per-vcpu). It should
+        be a value that is power of two, and it should be 1024 or bigger (but
+        still less than the maximum value that the kernel supports).  4096
+        could be a good initial value if you have no idea which is the best.
+        Set this value to 0 to disable the feature.  By default, this feature
+        is disabled (dirty-gfn-count=0).  When enabled, it'll automatically
+        replace the kvm get dirty log feature.
+
 ERST
 
 DEF("smp", HAS_ARG, QEMU_OPTION_smp,
-- 
2.26.2


