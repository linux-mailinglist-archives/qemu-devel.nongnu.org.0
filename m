Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA336A82A3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:51:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXiAG-000621-Ux; Thu, 02 Mar 2023 07:36:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6S-0002HR-GH
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6M-0003ES-Q7
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XqLTIkYoYhWQRiyItM2Zkh56OP3oFj18fIhn6GWDMlA=;
 b=bvXkCylgSprUoz7SPDm3/mlmPi72ImcMfS2Y/ALf5uZTsfG016+mSkkQJj2uOVtyF6q32v
 TIVZ3LUVXcdj7MB0Q/NFltFvqaXEnGxQfIcRl8x+Bst3iRcEOK3kRXvTRJKxBV/cpuBKyq
 XG3G7BpIdvQB/hRgOOooa4VLmuNUFxQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-465-KQ5H39kWPpKlGUeMPKykkA-1; Thu, 02 Mar 2023 07:32:01 -0500
X-MC-Unique: KQ5H39kWPpKlGUeMPKykkA-1
Received: by mail-wm1-f72.google.com with SMTP id
 4-20020a05600c024400b003eb2e295c05so5712675wmj.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:32:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XqLTIkYoYhWQRiyItM2Zkh56OP3oFj18fIhn6GWDMlA=;
 b=EFjkz4B3/bszxke/IsvZ6F5NPG+4y3WuEmGlXn6nZD5NyLIVwLdnNOuot/mP6FxRkS
 HQ+wq2JkaD6ysF5GKp1bMxZTQ1N7GCXi7yDVgmVix6+Lnm0vfEkv5Wr6Fm7bvQTjJvm3
 Uy2zkhlE2R+W77ikG0nRdPLXjyklxx/Me94KK2kVHoMV8fBuNxWYAcM7utOSOgB5+731
 yYuUQtJcLXxiBjo61PX8Duh1x9+xoD4JMM0r+KbD2k9Wzpx+CcSKw4XPlXR2/DsJ72di
 Ep9jdPgWvhAxzd/vHsTL9xsPS/IfSAzXLaf8VoDVlBaOIP0xy2UrJPp6BJUTVGJci9PJ
 3rEw==
X-Gm-Message-State: AO0yUKWZQitn5KJnQN3ghR1vG1zU5JR3udOsZhv8s7vo1deTprHqhu7R
 bcOBymD7dBn7Ts5ksvd1BCMMPsDdfEKoTieWit6isUxwj1+lgSMT13AEX9YjRPsKG8lUh/GE68O
 EKP7cANtxhQPWziRDCS8EeEgvt33digV4Z/kSwuFVnsWQgnBcORSte5WzuBIqQv95yFLgGpwJlb
 Y=
X-Received: by 2002:a5d:4d43:0:b0:2c7:1e43:f46e with SMTP id
 a3-20020a5d4d43000000b002c71e43f46emr7790121wru.37.1677760319306; 
 Thu, 02 Mar 2023 04:31:59 -0800 (PST)
X-Google-Smtp-Source: AK7set9vDwDi0bTrE77lNk5jc879knHYYEtwwoflpUKKlZgaLuJELw5CobvIz2PAzZWH33nviYMm1Q==
X-Received: by 2002:a5d:4d43:0:b0:2c7:1e43:f46e with SMTP id
 a3-20020a5d4d43000000b002c71e43f46emr7790100wru.37.1677760318888; 
 Thu, 02 Mar 2023 04:31:58 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 d16-20020adff850000000b002c55306f6edsm15064822wrq.54.2023.03.02.04.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:31:58 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 29/62] hw/xen: Implement EVTCHNOP_status
Date: Thu,  2 Mar 2023 13:29:56 +0100
Message-Id: <20230302123029.153265-30-pbonzini@redhat.com>
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

This adds the basic structure for maintaining the port table and reporting
the status of ports therein.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_evtchn.c  | 104 ++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |   3 ++
 target/i386/kvm/xen-emu.c |  20 +++++++-
 3 files changed, 125 insertions(+), 2 deletions(-)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 9d6f4076ad44..8bed33890f53 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -22,6 +22,7 @@
 #include "hw/sysbus.h"
 #include "hw/xen/xen.h"
 #include "xen_evtchn.h"
+#include "xen_overlay.h"
 
 #include "sysemu/kvm.h"
 #include "sysemu/kvm_xen.h"
@@ -33,6 +34,22 @@
 #define TYPE_XEN_EVTCHN "xen-evtchn"
 OBJECT_DECLARE_SIMPLE_TYPE(XenEvtchnState, XEN_EVTCHN)
 
+typedef struct XenEvtchnPort {
+    uint32_t vcpu;      /* Xen/ACPI vcpu_id */
+    uint16_t type;      /* EVTCHNSTAT_xxxx */
+    uint16_t type_val;  /* pirq# / virq# / remote port according to type */
+} XenEvtchnPort;
+
+#define COMPAT_EVTCHN_2L_NR_CHANNELS            1024
+
+/*
+ * For unbound/interdomain ports there are only two possible remote
+ * domains; self and QEMU. Use a single high bit in type_val for that,
+ * and the low bits for the remote port number (or 0 for unbound).
+ */
+#define PORT_INFO_TYPEVAL_REMOTE_QEMU           0x8000
+#define PORT_INFO_TYPEVAL_REMOTE_PORT_MASK      0x7FFF
+
 struct XenEvtchnState {
     /*< private >*/
     SysBusDevice busdev;
@@ -42,6 +59,8 @@ struct XenEvtchnState {
     bool evtchn_in_kernel;
 
     QemuMutex port_lock;
+    uint32_t nr_ports;
+    XenEvtchnPort port_table[EVTCHN_2L_NR_CHANNELS];
 };
 
 struct XenEvtchnState *xen_evtchn_singleton;
@@ -65,6 +84,18 @@ static bool xen_evtchn_is_needed(void *opaque)
     return xen_mode == XEN_EMULATE;
 }
 
+static const VMStateDescription xen_evtchn_port_vmstate = {
+    .name = "xen_evtchn_port",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(vcpu, XenEvtchnPort),
+        VMSTATE_UINT16(type, XenEvtchnPort),
+        VMSTATE_UINT16(type_val, XenEvtchnPort),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription xen_evtchn_vmstate = {
     .name = "xen_evtchn",
     .version_id = 1,
@@ -73,6 +104,9 @@ static const VMStateDescription xen_evtchn_vmstate = {
     .post_load = xen_evtchn_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT64(callback_param, XenEvtchnState),
+        VMSTATE_UINT32(nr_ports, XenEvtchnState),
+        VMSTATE_STRUCT_VARRAY_UINT32(port_table, XenEvtchnState, nr_ports, 1,
+                                     xen_evtchn_port_vmstate, XenEvtchnPort),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -153,3 +187,73 @@ int xen_evtchn_set_callback_param(uint64_t param)
 
     return ret;
 }
+
+static bool valid_port(evtchn_port_t port)
+{
+    if (!port) {
+        return false;
+    }
+
+    if (xen_is_long_mode()) {
+        return port < EVTCHN_2L_NR_CHANNELS;
+    } else {
+        return port < COMPAT_EVTCHN_2L_NR_CHANNELS;
+    }
+}
+
+int xen_evtchn_status_op(struct evtchn_status *status)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    XenEvtchnPort *p;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (status->dom != DOMID_SELF && status->dom != xen_domid) {
+        return -ESRCH;
+    }
+
+    if (!valid_port(status->port)) {
+        return -EINVAL;
+    }
+
+    qemu_mutex_lock(&s->port_lock);
+
+    p = &s->port_table[status->port];
+
+    status->status = p->type;
+    status->vcpu = p->vcpu;
+
+    switch (p->type) {
+    case EVTCHNSTAT_unbound:
+        if (p->type_val & PORT_INFO_TYPEVAL_REMOTE_QEMU) {
+            status->u.unbound.dom = DOMID_QEMU;
+        } else {
+            status->u.unbound.dom = xen_domid;
+        }
+        break;
+
+    case EVTCHNSTAT_interdomain:
+        if (p->type_val & PORT_INFO_TYPEVAL_REMOTE_QEMU) {
+            status->u.interdomain.dom = DOMID_QEMU;
+        } else {
+            status->u.interdomain.dom = xen_domid;
+        }
+
+        status->u.interdomain.port = p->type_val &
+            PORT_INFO_TYPEVAL_REMOTE_PORT_MASK;
+        break;
+
+    case EVTCHNSTAT_pirq:
+        status->u.pirq = p->type_val;
+        break;
+
+    case EVTCHNSTAT_virq:
+        status->u.virq = p->type_val;
+        break;
+    }
+
+    qemu_mutex_unlock(&s->port_lock);
+    return 0;
+}
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index c9b7f9d11f10..76467636eed7 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -15,4 +15,7 @@
 void xen_evtchn_create(void);
 int xen_evtchn_set_callback_param(uint64_t param);
 
+struct evtchn_status;
+int xen_evtchn_status_op(struct evtchn_status *status);
+
 #endif /* QEMU_XEN_EVTCHN_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 1b319e8bad69..45fac5ea03bd 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -776,9 +776,10 @@ static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     return true;
 }
 
-static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit,
+static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
                                     int cmd, uint64_t arg)
 {
+    CPUState *cs = CPU(cpu);
     int err = -ENOSYS;
 
     switch (cmd) {
@@ -789,6 +790,21 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit,
         err = -ENOSYS;
         break;
 
+    case EVTCHNOP_status: {
+        struct evtchn_status status;
+
+        qemu_build_assert(sizeof(status) == 24);
+        if (kvm_copy_from_gva(cs, arg, &status, sizeof(status))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_evtchn_status_op(&status);
+        if (!err && kvm_copy_to_gva(cs, arg, &status, sizeof(status))) {
+            err = -EFAULT;
+        }
+        break;
+    }
     default:
         return false;
     }
@@ -914,7 +930,7 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
         return kvm_xen_hcall_sched_op(exit, cpu, exit->u.hcall.params[0],
                                       exit->u.hcall.params[1]);
     case __HYPERVISOR_event_channel_op:
-        return kvm_xen_hcall_evtchn_op(exit, exit->u.hcall.params[0],
+        return kvm_xen_hcall_evtchn_op(exit, cpu, exit->u.hcall.params[0],
                                        exit->u.hcall.params[1]);
     case __HYPERVISOR_vcpu_op:
         return kvm_xen_hcall_vcpu_op(exit, cpu,
-- 
2.39.1


