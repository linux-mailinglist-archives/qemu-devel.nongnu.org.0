Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 658886A82C3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:53:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi8Q-0003Jd-Ag; Thu, 02 Mar 2023 07:34:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6p-0002aK-Lu
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6m-0003JC-Nn
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w2Lkd43zRTJy6RHJewz2yutPwRBKk/prXz6vda9RNlM=;
 b=fv7b38zSIxV8mCgkJFpZ0p402Fqr2yi+/AQYV/1sKS60+BQ7o9cuaaw9sUwHozURl4iDON
 f/GuuJTnaK9Vr3cOHn2uy6jKjtxgHifEh+4X2v/0OrCTw2epZrbi+/PfcqD1fLE7tuLXFC
 D23/Izmxqk3hJoZAjgCSKSpDWlXn+Zs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-393-22jN_2gIODaNxprPUoGBrg-1; Thu, 02 Mar 2023 07:32:27 -0500
X-MC-Unique: 22jN_2gIODaNxprPUoGBrg-1
Received: by mail-wr1-f70.google.com with SMTP id
 bx25-20020a5d5b19000000b002c7ce4ce3c3so3197989wrb.13
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:32:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w2Lkd43zRTJy6RHJewz2yutPwRBKk/prXz6vda9RNlM=;
 b=uHQ0FNGvRGLc4up8CVeyfLRKZ/FVcFU6RzKRlAGaW0j8lUPvYrX1XZ6Soy8U6FcvQS
 aPRgQ8dHuGtT1JFUbxX9lgCP7BnWoNpQK2zKOHtSMkRM6/jrFdINteLlTUnqsSDqLefM
 9hlkdL0Ij6ojI7ckyO6D3XjiKZYSYQDWzdFcgbhIz7AdGXBWArsYF9qyMPOYEspwJpFr
 jvZlO08UYkdshkzU9bLFKvu+KuQAVuSpnZYMp769R/fLGClQETDCzS4PwTJf6MuTLN29
 b44JmyhWNi1B5hTarpqGx0KmXsxvsl2DbmPqwgCOx2zCv5BRqOZUR/PvTgBrnGfUj/In
 OV9Q==
X-Gm-Message-State: AO0yUKXdwC8UZMNuBUyoIcHQML9aF75R0wFs3GShDV9ujyYSlLiYHCF3
 nW4ByDvSpC5a1c1F+SZvwVt3+Yl/vWYteXzoXTcOwvi5H1RO8QegQlzdFA0TyKucmxih/O0/Vj5
 WOQDnfnbZMFXoB+PGBMFL9ZDYxjGoLJapY9zKQbwluEc89glFjUHJi8pPzsJhFcL277Ux5v2Y8m
 Y=
X-Received: by 2002:adf:efd0:0:b0:2c7:1c36:3c67 with SMTP id
 i16-20020adfefd0000000b002c71c363c67mr7787533wrp.23.1677760345197; 
 Thu, 02 Mar 2023 04:32:25 -0800 (PST)
X-Google-Smtp-Source: AK7set+c5wPKlJscVJdESlmGbYk3ZGHbhK5U4bZyVABLAhhOp97QtfjDdDvl6Fc/NTNAx6h+nfBOeA==
X-Received: by 2002:adf:efd0:0:b0:2c7:1c36:3c67 with SMTP id
 i16-20020adfefd0000000b002c71c363c67mr7787509wrp.23.1677760344786; 
 Thu, 02 Mar 2023 04:32:24 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d424b000000b002c55521903bsm15013482wrr.51.2023.03.02.04.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:32:24 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 38/62] hw/xen: Implement EVTCHNOP_reset
Date: Thu,  2 Mar 2023 13:30:05 +0100
Message-Id: <20230302123029.153265-39-pbonzini@redhat.com>
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
 hw/i386/kvm/xen_evtchn.c  | 30 ++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |  3 +++
 target/i386/kvm/xen-emu.c | 17 +++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index cbaf4f535aaf..c804a315e046 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -12,6 +12,7 @@
 #include "qemu/osdep.h"
 #include "qemu/host-utils.h"
 #include "qemu/module.h"
+#include "qemu/lockable.h"
 #include "qemu/main-loop.h"
 #include "qemu/log.h"
 #include "qapi/error.h"
@@ -747,6 +748,35 @@ static int close_port(XenEvtchnState *s, evtchn_port_t port)
     return 0;
 }
 
+int xen_evtchn_soft_reset(void)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    int i;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    assert(qemu_mutex_iothread_locked());
+
+    QEMU_LOCK_GUARD(&s->port_lock);
+
+    for (i = 0; i < s->nr_ports; i++) {
+        close_port(s, i);
+    }
+
+    return 0;
+}
+
+int xen_evtchn_reset_op(struct evtchn_reset *reset)
+{
+    if (reset->dom != DOMID_SELF && reset->dom != xen_domid) {
+        return -ESRCH;
+    }
+
+    return xen_evtchn_soft_reset();
+}
+
 int xen_evtchn_close_op(struct evtchn_close *close)
 {
     XenEvtchnState *s = xen_evtchn_singleton;
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index 486b031c8292..5d3e03553f34 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -13,6 +13,7 @@
 #define QEMU_XEN_EVTCHN_H
 
 void xen_evtchn_create(void);
+int xen_evtchn_soft_reset(void);
 int xen_evtchn_set_callback_param(uint64_t param);
 
 struct evtchn_status;
@@ -24,6 +25,7 @@ struct evtchn_send;
 struct evtchn_alloc_unbound;
 struct evtchn_bind_interdomain;
 struct evtchn_bind_vcpu;
+struct evtchn_reset;
 int xen_evtchn_status_op(struct evtchn_status *status);
 int xen_evtchn_close_op(struct evtchn_close *close);
 int xen_evtchn_unmask_op(struct evtchn_unmask *unmask);
@@ -33,5 +35,6 @@ int xen_evtchn_send_op(struct evtchn_send *send);
 int xen_evtchn_alloc_unbound_op(struct evtchn_alloc_unbound *alloc);
 int xen_evtchn_bind_interdomain_op(struct evtchn_bind_interdomain *interdomain);
 int xen_evtchn_bind_vcpu_op(struct evtchn_bind_vcpu *vcpu);
+int xen_evtchn_reset_op(struct evtchn_reset *reset);
 
 #endif /* QEMU_XEN_EVTCHN_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 8dc0d320f5ea..821629f07765 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -964,6 +964,18 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         err = xen_evtchn_bind_vcpu_op(&vcpu);
         break;
     }
+    case EVTCHNOP_reset: {
+        struct evtchn_reset reset;
+
+        qemu_build_assert(sizeof(reset) == 2);
+        if (kvm_copy_from_gva(cs, arg, &reset, sizeof(reset))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_evtchn_reset_op(&reset);
+        break;
+    }
     default:
         return false;
     }
@@ -981,6 +993,11 @@ int kvm_xen_soft_reset(void)
 
     trace_kvm_xen_soft_reset();
 
+    err = xen_evtchn_soft_reset();
+    if (err) {
+        return err;
+    }
+
     /*
      * Zero is the reset/startup state for HVM_PARAM_CALLBACK_IRQ. Strictly,
      * it maps to HVM_PARAM_CALLBACK_TYPE_GSI with GSI#0, but Xen refuses to
-- 
2.39.1


