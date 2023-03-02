Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFD96A8282
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:43:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXiBu-0008N8-8p; Thu, 02 Mar 2023 07:37:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi7g-0002xi-5a
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:33:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi7X-0003w8-EJ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:33:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=97YjIcslPQrTGyRAk5C6su9F+2NWjsG0y279xJqV374=;
 b=SdTVb2c9QPFiVwjvseSCrvRPoHPiAKuf0Ab9PdY+hcDXN3vqqA3wrMtqIzgH0cK635v1+0
 HefJk86FHJhfJhQ3K3YNuY5Wu9w7nv5O6ibAjSA48Oq7R4WjbXzKKpRCtQUd1cZJvhPUPM
 JsaFNDH+ctFIxPOscmYfkvHi1o2J8dU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-471-bQUnT8d0OI2Qbu4xUP8O-w-1; Thu, 02 Mar 2023 07:33:12 -0500
X-MC-Unique: bQUnT8d0OI2Qbu4xUP8O-w-1
Received: by mail-wm1-f72.google.com with SMTP id
 l16-20020a05600c1d1000b003e77552705cso1014883wms.7
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:33:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=97YjIcslPQrTGyRAk5C6su9F+2NWjsG0y279xJqV374=;
 b=kjKy0NNDxA/zpnflqfI5tjs5PGfwBTPRooLoXwAdFPF8C9FPlWgMzkuBRhJhFXh8OO
 O+ehoqdQo94rrP1wj+PfQiovpoiLDk1f2lZDo1LgV4z9VhBf1fNDqDgXxFxmHSmRAEoX
 BjY8KMUF0PQ8rEjqv9Ye22EoJsTyfU8jL3HVDXi1BS8CYVhU0fdl7qfvlC735SfmW7ki
 ffO8ix6sf/eAdKgVPrFOzCTY1QjLj8dXA0cowHxNB6maiBnK8jTLrd7AFvFwfV+wttsW
 XCyGHC3eT4MYL5o4xFePSs+pQ9hswd7nOx0UiN/ifwYI+2joXuE8qfnCh20iLBY/HWsf
 ng2Q==
X-Gm-Message-State: AO0yUKXWYoRJjnQdUx2cF6UuFaa9ahjM6hjI0zJPM7LZWNN0OoioUaD+
 DYNMyWO+4avoqI4KwRDPZnSi0lsfs6j1q26y7VYFmp6vLpxivB5CencWtcqbTR9OVbeRiIweRHO
 86Pdvxyj4WQGfiL8JLNqxcbCW3GpQQ4zZZsiCqZa3runtv/QHOfl+OMeKtse1cYOAexpZyomHOk
 g=
X-Received: by 2002:a05:600c:492f:b0:3e2:589:2502 with SMTP id
 f47-20020a05600c492f00b003e205892502mr7148106wmp.28.1677760390744; 
 Thu, 02 Mar 2023 04:33:10 -0800 (PST)
X-Google-Smtp-Source: AK7set+qMouDJnNI83eYtfOt6BVy/UIX/bObDzSGDASEZARMz/JzOXYP8dBDyTfn0/uQZ0CCvvRz0A==
X-Received: by 2002:a05:600c:492f:b0:3e2:589:2502 with SMTP id
 f47-20020a05600c492f00b003e205892502mr7148091wmp.28.1677760390445; 
 Thu, 02 Mar 2023 04:33:10 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 iz16-20020a05600c555000b003e21638c0edsm2834132wmb.45.2023.03.02.04.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:33:10 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 54/62] i386/xen: Implement HYPERVISOR_physdev_op
Date: Thu,  2 Mar 2023 13:30:21 +0100
Message-Id: <20230302123029.153265-55-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: David Woodhouse <dwmw@amazon.co.uk>

Just hook up the basic hypercalls to stubs in xen_evtchn.c for now.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_evtchn.c     |  25 ++++++++
 hw/i386/kvm/xen_evtchn.h     |  11 ++++
 target/i386/kvm/xen-compat.h |  19 ++++++
 target/i386/kvm/xen-emu.c    | 118 +++++++++++++++++++++++++++++++++++
 4 files changed, 173 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 6c396270b75d..b95ee9ba913e 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -1349,6 +1349,31 @@ int xen_evtchn_set_port(uint16_t port)
     return ret;
 }
 
+int xen_physdev_map_pirq(struct physdev_map_pirq *map)
+{
+    return -ENOTSUP;
+}
+
+int xen_physdev_unmap_pirq(struct physdev_unmap_pirq *unmap)
+{
+    return -ENOTSUP;
+}
+
+int xen_physdev_eoi_pirq(struct physdev_eoi *eoi)
+{
+    return -ENOTSUP;
+}
+
+int xen_physdev_query_pirq(struct physdev_irq_status_query *query)
+{
+    return -ENOTSUP;
+}
+
+int xen_physdev_get_free_pirq(struct physdev_get_free_pirq *get)
+{
+    return -ENOTSUP;
+}
+
 struct xenevtchn_handle *xen_be_evtchn_open(void)
 {
     struct xenevtchn_handle *xc = g_new0(struct xenevtchn_handle, 1);
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index 5a71ffb75311..352c87597643 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -62,4 +62,15 @@ int xen_evtchn_bind_interdomain_op(struct evtchn_bind_interdomain *interdomain);
 int xen_evtchn_bind_vcpu_op(struct evtchn_bind_vcpu *vcpu);
 int xen_evtchn_reset_op(struct evtchn_reset *reset);
 
+struct physdev_map_pirq;
+struct physdev_unmap_pirq;
+struct physdev_eoi;
+struct physdev_irq_status_query;
+struct physdev_get_free_pirq;
+int xen_physdev_map_pirq(struct physdev_map_pirq *map);
+int xen_physdev_unmap_pirq(struct physdev_unmap_pirq *unmap);
+int xen_physdev_eoi_pirq(struct physdev_eoi *eoi);
+int xen_physdev_query_pirq(struct physdev_irq_status_query *query);
+int xen_physdev_get_free_pirq(struct physdev_get_free_pirq *get);
+
 #endif /* QEMU_XEN_EVTCHN_H */
diff --git a/target/i386/kvm/xen-compat.h b/target/i386/kvm/xen-compat.h
index 448336de9236..7f30180cc2c5 100644
--- a/target/i386/kvm/xen-compat.h
+++ b/target/i386/kvm/xen-compat.h
@@ -48,4 +48,23 @@ struct compat_xen_add_to_physmap_batch {
     COMPAT_HANDLE(int) errs;
 };
 
+struct compat_physdev_map_pirq {
+    domid_t domid;
+    uint16_t pad;
+    /* IN */
+    int type;
+    /* IN (ignored for ..._MULTI_MSI) */
+    int index;
+    /* IN or OUT */
+    int pirq;
+    /* IN - high 16 bits hold segment for ..._MSI_SEG and ..._MULTI_MSI */
+    int bus;
+    /* IN */
+    int devfn;
+    /* IN (also OUT for ..._MULTI_MSI) */
+    int entry_nr;
+    /* IN */
+    uint64_t table_base;
+} __attribute__((packed));
+
 #endif /* QEMU_I386_XEN_COMPAT_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 50965b56f3c9..fe15696cc9a9 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -1539,6 +1539,121 @@ static bool kvm_xen_hcall_gnttab_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     return true;
 }
 
+static bool kvm_xen_hcall_physdev_op(struct kvm_xen_exit *exit, X86CPU *cpu,
+                                     int cmd, uint64_t arg)
+{
+    CPUState *cs = CPU(cpu);
+    int err;
+
+    switch (cmd) {
+    case PHYSDEVOP_map_pirq: {
+        struct physdev_map_pirq map;
+
+        if (hypercall_compat32(exit->u.hcall.longmode)) {
+            struct compat_physdev_map_pirq *map32 = (void *)&map;
+
+            if (kvm_copy_from_gva(cs, arg, map32, sizeof(*map32))) {
+                return -EFAULT;
+            }
+
+            /*
+             * The only thing that's different is the alignment of the
+             * uint64_t table_base at the end, which gets padding to make
+             * it 64-bit aligned in the 64-bit version.
+             */
+            qemu_build_assert(sizeof(*map32) == 36);
+            qemu_build_assert(offsetof(struct physdev_map_pirq, entry_nr) ==
+                              offsetof(struct compat_physdev_map_pirq, entry_nr));
+            memmove(&map.table_base, &map32->table_base, sizeof(map.table_base));
+        } else {
+            if (kvm_copy_from_gva(cs, arg, &map, sizeof(map))) {
+                err = -EFAULT;
+                break;
+            }
+        }
+        err = xen_physdev_map_pirq(&map);
+        /*
+         * Since table_base is an IN parameter and won't be changed, just
+         * copy the size of the compat structure back to the guest.
+         */
+        if (!err && kvm_copy_to_gva(cs, arg, &map,
+                                    sizeof(struct compat_physdev_map_pirq))) {
+            err = -EFAULT;
+        }
+        break;
+    }
+    case PHYSDEVOP_unmap_pirq: {
+        struct physdev_unmap_pirq unmap;
+
+        qemu_build_assert(sizeof(unmap) == 8);
+        if (kvm_copy_from_gva(cs, arg, &unmap, sizeof(unmap))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_physdev_unmap_pirq(&unmap);
+        if (!err && kvm_copy_to_gva(cs, arg, &unmap, sizeof(unmap))) {
+            err = -EFAULT;
+        }
+        break;
+    }
+    case PHYSDEVOP_eoi: {
+        struct physdev_eoi eoi;
+
+        qemu_build_assert(sizeof(eoi) == 4);
+        if (kvm_copy_from_gva(cs, arg, &eoi, sizeof(eoi))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_physdev_eoi_pirq(&eoi);
+        if (!err && kvm_copy_to_gva(cs, arg, &eoi, sizeof(eoi))) {
+            err = -EFAULT;
+        }
+        break;
+    }
+    case PHYSDEVOP_irq_status_query: {
+        struct physdev_irq_status_query query;
+
+        qemu_build_assert(sizeof(query) == 8);
+        if (kvm_copy_from_gva(cs, arg, &query, sizeof(query))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_physdev_query_pirq(&query);
+        if (!err && kvm_copy_to_gva(cs, arg, &query, sizeof(query))) {
+            err = -EFAULT;
+        }
+        break;
+    }
+    case PHYSDEVOP_get_free_pirq: {
+        struct physdev_get_free_pirq get;
+
+        qemu_build_assert(sizeof(get) == 8);
+        if (kvm_copy_from_gva(cs, arg, &get, sizeof(get))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_physdev_get_free_pirq(&get);
+        if (!err && kvm_copy_to_gva(cs, arg, &get, sizeof(get))) {
+            err = -EFAULT;
+        }
+        break;
+    }
+    case PHYSDEVOP_pirq_eoi_gmfn_v2: /* FreeBSD 13 makes this hypercall */
+        err = -ENOSYS;
+        break;
+
+    default:
+        return false;
+    }
+
+    exit->u.hcall.result = err;
+    return true;
+}
+
 static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
 {
     uint16_t code = exit->u.hcall.input;
@@ -1580,6 +1695,9 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     case __HYPERVISOR_memory_op:
         return kvm_xen_hcall_memory_op(exit, cpu, exit->u.hcall.params[0],
                                        exit->u.hcall.params[1]);
+    case __HYPERVISOR_physdev_op:
+        return kvm_xen_hcall_physdev_op(exit, cpu, exit->u.hcall.params[0],
+                                        exit->u.hcall.params[1]);
     case __HYPERVISOR_xen_version:
         return kvm_xen_hcall_xen_version(exit, cpu, exit->u.hcall.params[0],
                                          exit->u.hcall.params[1]);
-- 
2.39.1


