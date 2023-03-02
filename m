Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ADF6A82BF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:53:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXiB2-0007Ej-C0; Thu, 02 Mar 2023 07:36:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi7f-0002vn-8p
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:33:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi7K-0003tx-GG
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:33:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y4Tlvg3rK6mT0166OHb9x5zfjgmr59hdpstrV6aiVpQ=;
 b=SXidqsSw1KS0X8tUm5kDw1nCDbR8uuMn0FSNfO+gO6OJRayUJ/UKbs4YltUqL3FReZlXeS
 cSFDoI1TMjjIj9YBpL6KQKUCgrw+CWhTyrDf1ecGp2ZbjQeqwMKLUE0wo+1dZplPn7TnoU
 AM0T+f2zhxcO4aczV7Kw0aemxpq3GWo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-XgVNUjbMOQW2wPYluLIJ9Q-1; Thu, 02 Mar 2023 07:33:00 -0500
X-MC-Unique: XgVNUjbMOQW2wPYluLIJ9Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 z6-20020a7bc7c6000000b003e0107732f4so5700787wmk.1
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:33:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y4Tlvg3rK6mT0166OHb9x5zfjgmr59hdpstrV6aiVpQ=;
 b=BC+3UqYBqAunwGhnTdlJUQcM2cXob1IZd+6QxEmR9WSmNREWNqZ/TqOgo7r2B5JTIP
 5QRc1uC7PRKcU8HylhAvqiKvW5j69BEYhPDEDVxFxVI+oRqtsObt/vLZIlh5eeMUSE4Z
 lZmAGsnpfV8e/RgDxWtR7A48Jp8dVdSWeIgB0q7sVW8EX0e1pWzC8uSuKoebMYFatNyL
 Iv871KFg7xw0F3kfy2to/+j7oPzYMrBLYhtL4remONwwHXnzWvNPH9pQ3Lar3iMOIvIT
 rwp1n4QiNGzwRWN1aJ9Bk9BVXBL6DA0RecnNhTfVraOn/iApu6DyMPlrzohkVgDzSnZS
 jBSg==
X-Gm-Message-State: AO0yUKVEidKiYRWsYjqmKyo2JZaanM9pIPJYkMb/JirW04MnVpvplRDm
 yw4Oz/4lQluVWtMETee9RrYVHXZPTPez19yYZLJs8meOqNmajebFUfU8/rfhLcTmLikNH1lElc1
 QZnn+rdqClOK6YGHgaZzqsxRSooD39MKRLWpxdjfPUUXVmgndpIVpFCNcUxKapZhcchG1CgdB7b
 Q=
X-Received: by 2002:adf:edc7:0:b0:2c7:a3c:5bd6 with SMTP id
 v7-20020adfedc7000000b002c70a3c5bd6mr7637293wro.52.1677760379108; 
 Thu, 02 Mar 2023 04:32:59 -0800 (PST)
X-Google-Smtp-Source: AK7set8VWzVy7jXdr6mA+dVlXwq+RbW0Y5mm6mb4l/IyoYCPsZXolk97JwJTbfWEMJ3S+WDTV1GDnw==
X-Received: by 2002:adf:edc7:0:b0:2c7:a3c:5bd6 with SMTP id
 v7-20020adfedc7000000b002c70a3c5bd6mr7637278wro.52.1677760378777; 
 Thu, 02 Mar 2023 04:32:58 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 iz2-20020a05600c554200b003e11ad0750csm2846377wmb.47.2023.03.02.04.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:32:58 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 50/62] hw/xen: Add backend implementation of interdomain event
 channel support
Date: Thu,  2 Mar 2023 13:30:17 +0100
Message-Id: <20230302123029.153265-51-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

The provides the QEMU side of interdomain event channels, allowing events
to be sent to/from the guest.

The API mirrors libxenevtchn, and in time both this and the real Xen one
will be available through ops structures so that the PV backend drivers
can use the correct one as appropriate.

For now, this implementation can be used directly by our XenStore which
will be for emulated mode only.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_evtchn.c | 340 ++++++++++++++++++++++++++++++++++++++-
 hw/i386/kvm/xen_evtchn.h |  19 +++
 2 files changed, 352 insertions(+), 7 deletions(-)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 71ed48018942..601fbeee725a 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -38,6 +38,7 @@
 #include "sysemu/kvm.h"
 #include "sysemu/kvm_xen.h"
 #include <linux/kvm.h>
+#include <sys/eventfd.h>
 
 #include "hw/xen/interface/memory.h"
 #include "hw/xen/interface/hvm/params.h"
@@ -88,6 +89,13 @@ struct compat_shared_info {
 
 #define COMPAT_EVTCHN_2L_NR_CHANNELS            1024
 
+/* Local private implementation of struct xenevtchn_handle */
+struct xenevtchn_handle {
+    evtchn_port_t be_port;
+    evtchn_port_t guest_port; /* Or zero for unbound */
+    int fd;
+};
+
 /*
  * For unbound/interdomain ports there are only two possible remote
  * domains; self and QEMU. Use a single high bit in type_val for that,
@@ -111,6 +119,8 @@ struct XenEvtchnState {
     uint32_t nr_ports;
     XenEvtchnPort port_table[EVTCHN_2L_NR_CHANNELS];
     qemu_irq gsis[IOAPIC_NUM_PINS];
+
+    struct xenevtchn_handle *be_handles[EVTCHN_2L_NR_CHANNELS];
 };
 
 struct XenEvtchnState *xen_evtchn_singleton;
@@ -118,6 +128,18 @@ struct XenEvtchnState *xen_evtchn_singleton;
 /* Top bits of callback_param are the type (HVM_PARAM_CALLBACK_TYPE_xxx) */
 #define CALLBACK_VIA_TYPE_SHIFT 56
 
+static void unbind_backend_ports(XenEvtchnState *s);
+
+static int xen_evtchn_pre_load(void *opaque)
+{
+    XenEvtchnState *s = opaque;
+
+    /* Unbind all the backend-side ports; they need to rebind */
+    unbind_backend_ports(s);
+
+    return 0;
+}
+
 static int xen_evtchn_post_load(void *opaque, int version_id)
 {
     XenEvtchnState *s = opaque;
@@ -151,6 +173,7 @@ static const VMStateDescription xen_evtchn_vmstate = {
     .version_id = 1,
     .minimum_version_id = 1,
     .needed = xen_evtchn_is_needed,
+    .pre_load = xen_evtchn_pre_load,
     .post_load = xen_evtchn_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT64(callback_param, XenEvtchnState),
@@ -423,6 +446,20 @@ static int assign_kernel_port(uint16_t type, evtchn_port_t port,
     return kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &ha);
 }
 
+static int assign_kernel_eventfd(uint16_t type, evtchn_port_t port, int fd)
+{
+    struct kvm_xen_hvm_attr ha;
+
+    ha.type = KVM_XEN_ATTR_TYPE_EVTCHN;
+    ha.u.evtchn.send_port = port;
+    ha.u.evtchn.type = type;
+    ha.u.evtchn.flags = 0;
+    ha.u.evtchn.deliver.eventfd.port = 0;
+    ha.u.evtchn.deliver.eventfd.fd = fd;
+
+    return kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &ha);
+}
+
 static bool valid_port(evtchn_port_t port)
 {
     if (!port) {
@@ -441,6 +478,32 @@ static bool valid_vcpu(uint32_t vcpu)
     return !!qemu_get_cpu(vcpu);
 }
 
+static void unbind_backend_ports(XenEvtchnState *s)
+{
+    XenEvtchnPort *p;
+    int i;
+
+    for (i = 1; i < s->nr_ports; i++) {
+        p = &s->port_table[i];
+        if (p->type == EVTCHNSTAT_interdomain &&
+            (p->type_val & PORT_INFO_TYPEVAL_REMOTE_QEMU)) {
+            evtchn_port_t be_port = p->type_val & PORT_INFO_TYPEVAL_REMOTE_PORT_MASK;
+
+            if (s->be_handles[be_port]) {
+                /* This part will be overwritten on the load anyway. */
+                p->type = EVTCHNSTAT_unbound;
+                p->type_val = PORT_INFO_TYPEVAL_REMOTE_QEMU;
+
+                /* Leave the backend port open and unbound too. */
+                if (kvm_xen_has_cap(EVTCHN_SEND)) {
+                    deassign_kernel_port(i);
+                }
+                s->be_handles[be_port]->guest_port = 0;
+            }
+        }
+    }
+}
+
 int xen_evtchn_status_op(struct evtchn_status *status)
 {
     XenEvtchnState *s = xen_evtchn_singleton;
@@ -878,7 +941,14 @@ static int close_port(XenEvtchnState *s, evtchn_port_t port)
 
     case EVTCHNSTAT_interdomain:
         if (p->type_val & PORT_INFO_TYPEVAL_REMOTE_QEMU) {
-            /* Not yet implemented. This can't happen! */
+            uint16_t be_port = p->type_val & ~PORT_INFO_TYPEVAL_REMOTE_QEMU;
+            struct xenevtchn_handle *xc = s->be_handles[be_port];
+            if (xc) {
+                if (kvm_xen_has_cap(EVTCHN_SEND)) {
+                    deassign_kernel_port(port);
+                }
+                xc->guest_port = 0;
+            }
         } else {
             /* Loopback interdomain */
             XenEvtchnPort *rp = &s->port_table[p->type_val];
@@ -1110,8 +1180,27 @@ int xen_evtchn_bind_interdomain_op(struct evtchn_bind_interdomain *interdomain)
     }
 
     if (interdomain->remote_dom == DOMID_QEMU) {
-        /* We haven't hooked up QEMU's PV drivers to this yet */
-        ret = -ENOSYS;
+        struct xenevtchn_handle *xc = s->be_handles[interdomain->remote_port];
+        XenEvtchnPort *lp = &s->port_table[interdomain->local_port];
+
+        if (!xc) {
+            ret = -ENOENT;
+            goto out_free_port;
+        }
+
+        if (xc->guest_port) {
+            ret = -EBUSY;
+            goto out_free_port;
+        }
+
+        assert(xc->be_port == interdomain->remote_port);
+        xc->guest_port = interdomain->local_port;
+        if (kvm_xen_has_cap(EVTCHN_SEND)) {
+            assign_kernel_eventfd(lp->type, xc->guest_port, xc->fd);
+        }
+        lp->type = EVTCHNSTAT_interdomain;
+        lp->type_val = PORT_INFO_TYPEVAL_REMOTE_QEMU | interdomain->remote_port;
+        ret = 0;
     } else {
         /* Loopback */
         XenEvtchnPort *rp = &s->port_table[interdomain->remote_port];
@@ -1129,6 +1218,7 @@ int xen_evtchn_bind_interdomain_op(struct evtchn_bind_interdomain *interdomain)
         }
     }
 
+ out_free_port:
     if (ret) {
         free_port(s, interdomain->local_port);
     }
@@ -1193,11 +1283,16 @@ int xen_evtchn_send_op(struct evtchn_send *send)
         if (p->type_val & PORT_INFO_TYPEVAL_REMOTE_QEMU) {
             /*
              * This is an event from the guest to qemu itself, which is
-             * serving as the driver domain. Not yet implemented; it will
-             * be hooked up to the qemu implementation of xenstore,
-             * console, PV net/block drivers etc.
+             * serving as the driver domain.
              */
-            ret = -ENOSYS;
+            uint16_t be_port = p->type_val & ~PORT_INFO_TYPEVAL_REMOTE_QEMU;
+            struct xenevtchn_handle *xc = s->be_handles[be_port];
+            if (xc) {
+                eventfd_write(xc->fd, 1);
+                ret = 0;
+            } else {
+                ret = -ENOENT;
+            }
         } else {
             /* Loopback interdomain ports; just a complex IPI */
             set_port_pending(s, p->type_val);
@@ -1253,6 +1348,237 @@ int xen_evtchn_set_port(uint16_t port)
     return ret;
 }
 
+struct xenevtchn_handle *xen_be_evtchn_open(void)
+{
+    struct xenevtchn_handle *xc = g_new0(struct xenevtchn_handle, 1);
+
+    xc->fd = eventfd(0, EFD_CLOEXEC);
+    if (xc->fd < 0) {
+        free(xc);
+        return NULL;
+    }
+
+    return xc;
+}
+
+static int find_be_port(XenEvtchnState *s, struct xenevtchn_handle *xc)
+{
+    int i;
+
+    for (i = 1; i < EVTCHN_2L_NR_CHANNELS; i++) {
+        if (!s->be_handles[i]) {
+            s->be_handles[i] = xc;
+            xc->be_port = i;
+            return i;
+        }
+    }
+    return 0;
+}
+
+int xen_be_evtchn_bind_interdomain(struct xenevtchn_handle *xc, uint32_t domid,
+                                   evtchn_port_t guest_port)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    XenEvtchnPort *gp;
+    uint16_t be_port = 0;
+    int ret;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (!xc) {
+        return -EFAULT;
+    }
+
+    if (domid != xen_domid) {
+        return -ESRCH;
+    }
+
+    if (!valid_port(guest_port)) {
+        return -EINVAL;
+    }
+
+    qemu_mutex_lock(&s->port_lock);
+
+    /* The guest has to have an unbound port waiting for us to bind */
+    gp = &s->port_table[guest_port];
+
+    switch (gp->type) {
+    case EVTCHNSTAT_interdomain:
+        /* Allow rebinding after migration, preserve port # if possible */
+        be_port = gp->type_val & ~PORT_INFO_TYPEVAL_REMOTE_QEMU;
+        assert(be_port != 0);
+        if (!s->be_handles[be_port]) {
+            s->be_handles[be_port] = xc;
+            xc->guest_port = guest_port;
+            ret = xc->be_port = be_port;
+            if (kvm_xen_has_cap(EVTCHN_SEND)) {
+                assign_kernel_eventfd(gp->type, guest_port, xc->fd);
+            }
+            break;
+        }
+        /* fall through */
+
+    case EVTCHNSTAT_unbound:
+        be_port = find_be_port(s, xc);
+        if (!be_port) {
+            ret = -ENOSPC;
+            goto out;
+        }
+
+        gp->type = EVTCHNSTAT_interdomain;
+        gp->type_val = be_port | PORT_INFO_TYPEVAL_REMOTE_QEMU;
+        xc->guest_port = guest_port;
+        if (kvm_xen_has_cap(EVTCHN_SEND)) {
+            assign_kernel_eventfd(gp->type, guest_port, xc->fd);
+        }
+        ret = be_port;
+        break;
+
+    default:
+        ret = -EINVAL;
+        break;
+    }
+
+ out:
+    qemu_mutex_unlock(&s->port_lock);
+
+    return ret;
+}
+
+int xen_be_evtchn_unbind(struct xenevtchn_handle *xc, evtchn_port_t port)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    int ret;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (!xc) {
+        return -EFAULT;
+    }
+
+    qemu_mutex_lock(&s->port_lock);
+
+    if (port && port != xc->be_port) {
+        ret = -EINVAL;
+        goto out;
+    }
+
+    if (xc->guest_port) {
+        XenEvtchnPort *gp = &s->port_table[xc->guest_port];
+
+        /* This should never *not* be true */
+        if (gp->type == EVTCHNSTAT_interdomain) {
+            gp->type = EVTCHNSTAT_unbound;
+            gp->type_val = PORT_INFO_TYPEVAL_REMOTE_QEMU;
+        }
+
+        if (kvm_xen_has_cap(EVTCHN_SEND)) {
+            deassign_kernel_port(xc->guest_port);
+        }
+        xc->guest_port = 0;
+    }
+
+    s->be_handles[xc->be_port] = NULL;
+    xc->be_port = 0;
+    ret = 0;
+ out:
+    qemu_mutex_unlock(&s->port_lock);
+    return ret;
+}
+
+int xen_be_evtchn_close(struct xenevtchn_handle *xc)
+{
+    if (!xc) {
+        return -EFAULT;
+    }
+
+    xen_be_evtchn_unbind(xc, 0);
+
+    close(xc->fd);
+    free(xc);
+    return 0;
+}
+
+int xen_be_evtchn_fd(struct xenevtchn_handle *xc)
+{
+    if (!xc) {
+        return -1;
+    }
+    return xc->fd;
+}
+
+int xen_be_evtchn_notify(struct xenevtchn_handle *xc, evtchn_port_t port)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    int ret;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (!xc) {
+        return -EFAULT;
+    }
+
+    qemu_mutex_lock(&s->port_lock);
+
+    if (xc->guest_port) {
+        set_port_pending(s, xc->guest_port);
+        ret = 0;
+    } else {
+        ret = -ENOTCONN;
+    }
+
+    qemu_mutex_unlock(&s->port_lock);
+
+    return ret;
+}
+
+int xen_be_evtchn_pending(struct xenevtchn_handle *xc)
+{
+    uint64_t val;
+
+    if (!xc) {
+        return -EFAULT;
+    }
+
+    if (!xc->be_port) {
+        return 0;
+    }
+
+    if (eventfd_read(xc->fd, &val)) {
+        return -errno;
+    }
+
+    return val ? xc->be_port : 0;
+}
+
+int xen_be_evtchn_unmask(struct xenevtchn_handle *xc, evtchn_port_t port)
+{
+    if (!xc) {
+        return -EFAULT;
+    }
+
+    if (xc->be_port != port) {
+        return -EINVAL;
+    }
+
+    /*
+     * We don't actually do anything to unmask it; the event was already
+     * consumed in xen_be_evtchn_pending().
+     */
+    return 0;
+}
+
+int xen_be_evtchn_get_guest_port(struct xenevtchn_handle *xc)
+{
+    return xc->guest_port;
+}
+
 EvtchnInfoList *qmp_xen_event_list(Error **errp)
 {
     XenEvtchnState *s = xen_evtchn_singleton;
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index 24611478b87a..5a71ffb75311 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -14,6 +14,8 @@
 
 #include "hw/sysbus.h"
 
+typedef uint32_t evtchn_port_t;
+
 void xen_evtchn_create(void);
 int xen_evtchn_soft_reset(void);
 int xen_evtchn_set_callback_param(uint64_t param);
@@ -22,6 +24,23 @@ void xen_evtchn_set_callback_level(int level);
 
 int xen_evtchn_set_port(uint16_t port);
 
+/*
+ * These functions mirror the libxenevtchn library API, providing the QEMU
+ * backend side of "interdomain" event channels.
+ */
+struct xenevtchn_handle;
+struct xenevtchn_handle *xen_be_evtchn_open(void);
+int xen_be_evtchn_bind_interdomain(struct xenevtchn_handle *xc, uint32_t domid,
+                                   evtchn_port_t guest_port);
+int xen_be_evtchn_unbind(struct xenevtchn_handle *xc, evtchn_port_t port);
+int xen_be_evtchn_close(struct xenevtchn_handle *xc);
+int xen_be_evtchn_fd(struct xenevtchn_handle *xc);
+int xen_be_evtchn_notify(struct xenevtchn_handle *xc, evtchn_port_t port);
+int xen_be_evtchn_unmask(struct xenevtchn_handle *xc, evtchn_port_t port);
+int xen_be_evtchn_pending(struct xenevtchn_handle *xc);
+/* Apart from this which is a local addition */
+int xen_be_evtchn_get_guest_port(struct xenevtchn_handle *xc);
+
 struct evtchn_status;
 struct evtchn_close;
 struct evtchn_unmask;
-- 
2.39.1


