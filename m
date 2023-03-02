Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0866A8284
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:44:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXiAr-0006p5-CL; Thu, 02 Mar 2023 07:36:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6Z-0002U1-Ru
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6Y-0003Gg-7e
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FIKwKWqUOCSiWu2p2gUDsBHJkqpDVFpWc/+2LmVsUoU=;
 b=L0asrbyHresefVOPubiGLeTuqXbNhJIO+fbA1p4iGQzuMCwjICkKxK4WNZtcyanzd2OIXx
 6nSG4pSYeYSeVNrmN+mHx5ENysnuQbS8FHH/5eFNv8W011gIITp/qvOcjGmupJ8A3cTmKj
 4pO9M97lgfIeqCa6WT2gvjwI3lOETec=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-491-9duY3y3RPtqsF7GxA0zzeg-1; Thu, 02 Mar 2023 07:32:12 -0500
X-MC-Unique: 9duY3y3RPtqsF7GxA0zzeg-1
Received: by mail-wr1-f69.google.com with SMTP id
 15-20020a056000156f00b002ca79db6d42so2953226wrz.18
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:32:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FIKwKWqUOCSiWu2p2gUDsBHJkqpDVFpWc/+2LmVsUoU=;
 b=sdoW/x0AfqTxPdTBDi6eTZp1zHGNdIstm5EvE5E+30+uARSKB4m0oWKfdXsZFCaCvo
 u2nCFcKJLYOz76+ywstiW4/sCJsfQc48Uj2AtSLWWgZVGosbaxFygmFGp6MA60QFqYIZ
 /qOes9dhk2gTg2cZaQsF8UZVbpsek0eeasvwgvdiG85bDE4E0BS5SFmqmF+D53xJJdjf
 LD0ccaDUzXxGwkt7epprczj1+RaerkYs6vm4DT1Vl3icXTFsP5uPJbfcuv5jsWRdHsQy
 xIQGuymfMsLFQ28Ch7KxLALpEuQZGm87VMIradAqz+03z6I7NSDjJprWn0J2XkkSGt7y
 mgGw==
X-Gm-Message-State: AO0yUKVw1+2fuNavwAwf8Iwvv/57NxXuLRusWn2N57zxS4cjl6VkkOwu
 63fOtDNQ3VgO4xpYWUEB8jNJIvb7ipC2xlcIwwJTI2ugoVmUIYV4swRydaul3A1ECMTUPZmxppL
 i0gYFodLkkEgkDBdN+b8ukNgqNrKoHshEg9jI1Ivd3sjCq460k1XYBeuV2mlCWatVffOWVtck9d
 A=
X-Received: by 2002:adf:dbc2:0:b0:2cc:5ee8:fee5 with SMTP id
 e2-20020adfdbc2000000b002cc5ee8fee5mr7125481wrj.71.1677760331096; 
 Thu, 02 Mar 2023 04:32:11 -0800 (PST)
X-Google-Smtp-Source: AK7set+9i3d7PNdNTnrXwfc7BomluIwADu8qGoyyWalUo1lj0CFY5T4NIdsfgyIp7zBOXrpZcEm2aw==
X-Received: by 2002:adf:dbc2:0:b0:2cc:5ee8:fee5 with SMTP id
 e2-20020adfdbc2000000b002cc5ee8fee5mr7125459wrj.71.1677760330724; 
 Thu, 02 Mar 2023 04:32:10 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a056000118900b002c794495f6fsm14782569wrx.117.2023.03.02.04.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:32:10 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 33/62] hw/xen: Implement EVTCHNOP_bind_ipi
Date: Thu,  2 Mar 2023 13:30:00 +0100
Message-Id: <20230302123029.153265-34-pbonzini@redhat.com>
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

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_evtchn.c  | 69 +++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |  2 ++
 target/i386/kvm/xen-emu.c | 15 +++++++++
 3 files changed, 86 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index a3202d39abca..eea80dc0f53c 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -13,6 +13,7 @@
 #include "qemu/host-utils.h"
 #include "qemu/module.h"
 #include "qemu/main-loop.h"
+#include "qemu/log.h"
 #include "qapi/error.h"
 #include "qom/object.h"
 #include "exec/target_page.h"
@@ -231,6 +232,43 @@ static void inject_callback(XenEvtchnState *s, uint32_t vcpu)
     kvm_xen_inject_vcpu_callback_vector(vcpu, type);
 }
 
+static void deassign_kernel_port(evtchn_port_t port)
+{
+    struct kvm_xen_hvm_attr ha;
+    int ret;
+
+    ha.type = KVM_XEN_ATTR_TYPE_EVTCHN;
+    ha.u.evtchn.send_port = port;
+    ha.u.evtchn.flags = KVM_XEN_EVTCHN_DEASSIGN;
+
+    ret = kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &ha);
+    if (ret) {
+        qemu_log_mask(LOG_GUEST_ERROR, "Failed to unbind kernel port %d: %s\n",
+                      port, strerror(ret));
+    }
+}
+
+static int assign_kernel_port(uint16_t type, evtchn_port_t port,
+                              uint32_t vcpu_id)
+{
+    CPUState *cpu = qemu_get_cpu(vcpu_id);
+    struct kvm_xen_hvm_attr ha;
+
+    if (!cpu) {
+        return -ENOENT;
+    }
+
+    ha.type = KVM_XEN_ATTR_TYPE_EVTCHN;
+    ha.u.evtchn.send_port = port;
+    ha.u.evtchn.type = type;
+    ha.u.evtchn.flags = 0;
+    ha.u.evtchn.deliver.port.port = port;
+    ha.u.evtchn.deliver.port.vcpu = kvm_arch_vcpu_id(cpu);
+    ha.u.evtchn.deliver.port.priority = KVM_IRQ_ROUTING_XEN_EVTCHN_PRIO_2LEVEL;
+
+    return kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &ha);
+}
+
 static bool valid_port(evtchn_port_t port)
 {
     if (!port) {
@@ -551,6 +589,12 @@ static int close_port(XenEvtchnState *s, evtchn_port_t port)
                               p->type_val, 0);
         break;
 
+    case EVTCHNSTAT_ipi:
+        if (s->evtchn_in_kernel) {
+            deassign_kernel_port(port);
+        }
+        break;
+
     default:
         break;
     }
@@ -640,3 +684,28 @@ int xen_evtchn_bind_virq_op(struct evtchn_bind_virq *virq)
 
     return ret;
 }
+
+int xen_evtchn_bind_ipi_op(struct evtchn_bind_ipi *ipi)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    int ret;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (!valid_vcpu(ipi->vcpu)) {
+        return -ENOENT;
+    }
+
+    qemu_mutex_lock(&s->port_lock);
+
+    ret = allocate_port(s, ipi->vcpu, EVTCHNSTAT_ipi, 0, &ipi->port);
+    if (!ret && s->evtchn_in_kernel) {
+        assign_kernel_port(EVTCHNSTAT_ipi, ipi->port, ipi->vcpu);
+    }
+
+    qemu_mutex_unlock(&s->port_lock);
+
+    return ret;
+}
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index 0ea13dda3a25..107f4208485e 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -19,9 +19,11 @@ struct evtchn_status;
 struct evtchn_close;
 struct evtchn_unmask;
 struct evtchn_bind_virq;
+struct evtchn_bind_ipi;
 int xen_evtchn_status_op(struct evtchn_status *status);
 int xen_evtchn_close_op(struct evtchn_close *close);
 int xen_evtchn_unmask_op(struct evtchn_unmask *unmask);
 int xen_evtchn_bind_virq_op(struct evtchn_bind_virq *virq);
+int xen_evtchn_bind_ipi_op(struct evtchn_bind_ipi *ipi);
 
 #endif /* QEMU_XEN_EVTCHN_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index e0417f3d1359..b8b439dd311a 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -894,6 +894,21 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         }
         break;
     }
+    case EVTCHNOP_bind_ipi: {
+        struct evtchn_bind_ipi ipi;
+
+        qemu_build_assert(sizeof(ipi) == 8);
+        if (kvm_copy_from_gva(cs, arg, &ipi, sizeof(ipi))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_evtchn_bind_ipi_op(&ipi);
+        if (!err && kvm_copy_to_gva(cs, arg, &ipi, sizeof(ipi))) {
+            err = -EFAULT;
+        }
+        break;
+    }
     default:
         return false;
     }
-- 
2.39.1


