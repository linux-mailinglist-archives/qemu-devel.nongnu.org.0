Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 240B36A8250
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:35:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi8r-00047u-PE; Thu, 02 Mar 2023 07:34:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6r-0002aU-Il
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6p-0003Jq-Hn
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qaZoORtZamq6HE1TUZYQTRs6Dt1ZRQeGb3Eqwi7fS1k=;
 b=DdW5bjT44Kx4TK+Ci30Oz0NyDsZG48zAGlLC3mm6H5peCu6dJkaovv2tIFhVpn17uwVFso
 A8/Gf46f/1xHEIt84sKSYGKvGy5vnpY8Tt+zR8PBpidS/tdAtfS1JcSPa8tlbwiIIigG0a
 qOx68/S7sQHpONRdgUDOvxGqg+xyAXQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-245-WC9tBMzIPTGJIlcP_47ZmQ-1; Thu, 02 Mar 2023 07:32:29 -0500
X-MC-Unique: WC9tBMzIPTGJIlcP_47ZmQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 x3-20020a5d6503000000b002c8c421fdfaso3189104wru.15
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:32:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qaZoORtZamq6HE1TUZYQTRs6Dt1ZRQeGb3Eqwi7fS1k=;
 b=efIjCmpDii/nD/kY8/MaJi+zp4rPM/iu7n6xPtr/6onhwj/2QWOS6bbdPjCvp+Vvot
 wH5tDYIgbJuHY8AsmuI1zfYzYiR1MOe7civPDNwg6IvQHEx2+nz9xHHjYZYWbL8JlxlV
 9gJWtapEOUjqdbN79Oibm2auM5mo/wVsIr/FB8he+09Ewt6H4rP/h4AgQ3HaSlTA4KQJ
 D+1XJ+FvMq+ON3Jl/gAwyrqr+FLip862FxP6W59k3WURv1aPS8Lbr/0CbK1C4SXllo9S
 WgFdDN7EmhxBvwFxEb2h1iaVpJzworlh1UwZUCnde+L9javD5AaHpBTTKwK5PXAjX62J
 2DpA==
X-Gm-Message-State: AO0yUKWw9hFmCFgqSf37bemuHPU2BHWYfzDSBxf4ylEYN26ijewCGzD6
 1w/LJ+m8xeu7EcnYxjG+d0mpJHhChkgOLcma34W2V8IFrpRfVo1KoxJpQk5V2FzIPTFrZ1zZJGz
 mgxz0qSTJ2OzHWN3eWNjKYCqfR40SzSFh07jsEHR8TnS8/BPAMLQVeeoMJk3hYEoU0bGeD9plXR
 k=
X-Received: by 2002:a05:600c:491d:b0:3e2:6ec:7fb7 with SMTP id
 f29-20020a05600c491d00b003e206ec7fb7mr7199801wmp.0.1677760348062; 
 Thu, 02 Mar 2023 04:32:28 -0800 (PST)
X-Google-Smtp-Source: AK7set9N8eDWJNwxN5h1sUm0hPoOGRDr48DMnyVBe9d1J2cgt/hG2KDA0s5AaQlSxNTnwceXK7wlhw==
X-Received: by 2002:a05:600c:491d:b0:3e2:6ec:7fb7 with SMTP id
 f29-20020a05600c491d00b003e206ec7fb7mr7199784wmp.0.1677760347717; 
 Thu, 02 Mar 2023 04:32:27 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 p21-20020a05600c359500b003e0238d9101sm3024387wmq.31.2023.03.02.04.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:32:27 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Joao Martins <joao.m.martins@oracle.com>,
 David Woodhouse <dwmw@amazon.co.uk>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paul Durrant <paul@xen.org>
Subject: [PULL 39/62] i386/xen: add monitor commands to test event injection
Date: Thu,  2 Mar 2023 13:30:06 +0100
Message-Id: <20230302123029.153265-40-pbonzini@redhat.com>
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

From: Joao Martins <joao.m.martins@oracle.com>

Specifically add listing, injection of event channels.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hmp-commands.hx            |  29 ++++++++
 hw/i386/kvm/meson.build    |   7 ++
 hw/i386/kvm/xen-stubs.c    |  28 ++++++++
 hw/i386/kvm/xen_evtchn.c   | 137 +++++++++++++++++++++++++++++++++++++
 include/monitor/hmp.h      |   2 +
 qapi/misc-target.json      | 116 +++++++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c |   1 +
 7 files changed, 320 insertions(+)
 create mode 100644 hw/i386/kvm/xen-stubs.c

diff --git a/hmp-commands.hx b/hmp-commands.hx
index fbb5daf09bed..b87c250e23b8 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1815,3 +1815,32 @@ SRST
   Dump the FDT in dtb format to *filename*.
 ERST
 #endif
+
+#if defined(CONFIG_XEN_EMU)
+    {
+        .name       = "xen-event-inject",
+        .args_type  = "port:i",
+        .params     = "port",
+        .help       = "inject event channel",
+        .cmd        = hmp_xen_event_inject,
+    },
+
+SRST
+``xen-event-inject`` *port*
+  Notify guest via event channel on port *port*.
+ERST
+
+
+    {
+        .name       = "xen-event-list",
+        .args_type  = "",
+        .params     = "",
+        .help       = "list event channel state",
+        .cmd        = hmp_xen_event_list,
+    },
+
+SRST
+``xen-event-list``
+  List event channels in the guest
+ERST
+#endif
diff --git a/hw/i386/kvm/meson.build b/hw/i386/kvm/meson.build
index cab64df33982..325c9014965b 100644
--- a/hw/i386/kvm/meson.build
+++ b/hw/i386/kvm/meson.build
@@ -10,3 +10,10 @@ i386_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files(
   ))
 
 i386_ss.add_all(when: 'CONFIG_KVM', if_true: i386_kvm_ss)
+
+xen_stubs_ss = ss.source_set()
+xen_stubs_ss.add(when: 'CONFIG_XEN_EMU', if_false: files(
+  'xen-stubs.c',
+))
+
+specific_ss.add_all(when: 'CONFIG_SOFTMMU', if_true: xen_stubs_ss)
diff --git a/hw/i386/kvm/xen-stubs.c b/hw/i386/kvm/xen-stubs.c
new file mode 100644
index 000000000000..720590aedddf
--- /dev/null
+++ b/hw/i386/kvm/xen-stubs.c
@@ -0,0 +1,28 @@
+/*
+ * QEMU Xen emulation: QMP stubs
+ *
+ * Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * Authors: David Woodhouse <dwmw2@infradead.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "qapi/error.h"
+#include "qapi/qapi-commands-misc-target.h"
+
+#ifdef TARGET_I386
+EvtchnInfoList *qmp_xen_event_list(Error **errp)
+{
+    error_setg(errp, "Xen event channel emulation not enabled");
+    return NULL;
+}
+
+void qmp_xen_event_inject(uint32_t port, Error **errp)
+{
+    error_setg(errp, "Xen event channel emulation not enabled");
+}
+#endif
diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index c804a315e046..e937de7a9358 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -15,7 +15,11 @@
 #include "qemu/lockable.h"
 #include "qemu/main-loop.h"
 #include "qemu/log.h"
+#include "monitor/monitor.h"
+#include "monitor/hmp.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-misc-target.h"
+#include "qapi/qmp/qdict.h"
 #include "qom/object.h"
 #include "exec/target_page.h"
 #include "exec/address-spaces.h"
@@ -1069,3 +1073,136 @@ int xen_evtchn_send_op(struct evtchn_send *send)
     return ret;
 }
 
+EvtchnInfoList *qmp_xen_event_list(Error **errp)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    EvtchnInfoList *head = NULL, **tail = &head;
+    void *shinfo, *pending, *mask;
+    int i;
+
+    if (!s) {
+        error_setg(errp, "Xen event channel emulation not enabled");
+        return NULL;
+    }
+
+    shinfo = xen_overlay_get_shinfo_ptr();
+    if (!shinfo) {
+        error_setg(errp, "Xen shared info page not allocated");
+        return NULL;
+    }
+
+    if (xen_is_long_mode()) {
+        pending = shinfo + offsetof(struct shared_info, evtchn_pending);
+        mask = shinfo + offsetof(struct shared_info, evtchn_mask);
+    } else {
+        pending = shinfo + offsetof(struct compat_shared_info, evtchn_pending);
+        mask = shinfo + offsetof(struct compat_shared_info, evtchn_mask);
+    }
+
+    QEMU_LOCK_GUARD(&s->port_lock);
+
+    for (i = 0; i < s->nr_ports; i++) {
+        XenEvtchnPort *p = &s->port_table[i];
+        EvtchnInfo *info;
+
+        if (p->type == EVTCHNSTAT_closed) {
+            continue;
+        }
+
+        info = g_new0(EvtchnInfo, 1);
+
+        info->port = i;
+        qemu_build_assert(EVTCHN_PORT_TYPE_CLOSED == EVTCHNSTAT_closed);
+        qemu_build_assert(EVTCHN_PORT_TYPE_UNBOUND == EVTCHNSTAT_unbound);
+        qemu_build_assert(EVTCHN_PORT_TYPE_INTERDOMAIN == EVTCHNSTAT_interdomain);
+        qemu_build_assert(EVTCHN_PORT_TYPE_PIRQ == EVTCHNSTAT_pirq);
+        qemu_build_assert(EVTCHN_PORT_TYPE_VIRQ == EVTCHNSTAT_virq);
+        qemu_build_assert(EVTCHN_PORT_TYPE_IPI == EVTCHNSTAT_ipi);
+
+        info->type = p->type;
+        if (p->type == EVTCHNSTAT_interdomain) {
+            info->remote_domain = g_strdup((p->type_val & PORT_INFO_TYPEVAL_REMOTE_QEMU) ?
+                                           "qemu" : "loopback");
+            info->target = p->type_val & PORT_INFO_TYPEVAL_REMOTE_PORT_MASK;
+        } else {
+            info->target = p->type_val;
+        }
+        info->vcpu = p->vcpu;
+        info->pending = test_bit(i, pending);
+        info->masked = test_bit(i, mask);
+
+        QAPI_LIST_APPEND(tail, info);
+    }
+
+    return head;
+}
+
+void qmp_xen_event_inject(uint32_t port, Error **errp)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+
+    if (!s) {
+        error_setg(errp, "Xen event channel emulation not enabled");
+        return;
+    }
+
+    if (!valid_port(port)) {
+        error_setg(errp, "Invalid port %u", port);
+    }
+
+    QEMU_LOCK_GUARD(&s->port_lock);
+
+    if (set_port_pending(s, port)) {
+        error_setg(errp, "Failed to set port %u", port);
+        return;
+    }
+}
+
+void hmp_xen_event_list(Monitor *mon, const QDict *qdict)
+{
+    EvtchnInfoList *iter, *info_list;
+    Error *err = NULL;
+
+    info_list = qmp_xen_event_list(&err);
+    if (err) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    for (iter = info_list; iter; iter = iter->next) {
+        EvtchnInfo *info = iter->value;
+
+        monitor_printf(mon, "port %4u: vcpu: %d %s", info->port, info->vcpu,
+                       EvtchnPortType_str(info->type));
+        if (info->type != EVTCHN_PORT_TYPE_IPI) {
+            monitor_printf(mon,  "(");
+            if (info->remote_domain) {
+                monitor_printf(mon, "%s:", info->remote_domain);
+            }
+            monitor_printf(mon, "%d)", info->target);
+        }
+        if (info->pending) {
+            monitor_printf(mon, " PENDING");
+        }
+        if (info->masked) {
+            monitor_printf(mon, " MASKED");
+        }
+        monitor_printf(mon, "\n");
+    }
+
+    qapi_free_EvtchnInfoList(info_list);
+}
+
+void hmp_xen_event_inject(Monitor *mon, const QDict *qdict)
+{
+    int port = qdict_get_int(qdict, "port");
+    Error *err = NULL;
+
+    qmp_xen_event_inject(port, &err);
+    if (err) {
+        hmp_handle_error(mon, err);
+    } else {
+        monitor_printf(mon, "Delivered port %d\n", port);
+    }
+}
+
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 2220f14fc98b..efae6b06bc32 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -114,6 +114,8 @@ void hmp_virtio_status(Monitor *mon, const QDict *qdict);
 void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict);
 void hmp_vhost_queue_status(Monitor *mon, const QDict *qdict);
 void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict);
+void hmp_xen_event_inject(Monitor *mon, const QDict *qdict);
+void hmp_xen_event_list(Monitor *mon, const QDict *qdict);
 void object_add_completion(ReadLineState *rs, int nb_args, const char *str);
 void object_del_completion(ReadLineState *rs, int nb_args, const char *str);
 void device_add_completion(ReadLineState *rs, int nb_args, const char *str);
diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 5b6a8e91850a..de9105452377 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -380,3 +380,119 @@
 #
 ##
 { 'command': 'query-sgx-capabilities', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }
+
+
+##
+# @EvtchnPortType:
+#
+# An enumeration of Xen event channel port types.
+#
+# @closed: The port is unused.
+#
+# @unbound: The port is allocated and ready to be bound.
+#
+# @interdomain: The port is connected as an interdomain interrupt.
+#
+# @pirq: The port is bound to a physical IRQ (PIRQ).
+#
+# @virq: The port is bound to a virtual IRQ (VIRQ).
+#
+# @ipi: The post is an inter-processor interrupt (IPI).
+#
+# Since: 8.0
+##
+{ 'enum': 'EvtchnPortType',
+  'data': ['closed', 'unbound', 'interdomain', 'pirq', 'virq', 'ipi'],
+  'if': 'TARGET_I386' }
+
+##
+# @EvtchnInfo:
+#
+# Information about a Xen event channel port
+#
+# @port: the port number
+#
+# @vcpu: target vCPU for this port
+#
+# @type: the port type
+#
+# @remote-domain: remote domain for interdomain ports
+#
+# @target: remote port ID, or virq/pirq number
+#
+# @pending: port is currently active pending delivery
+#
+# @masked: port is masked
+#
+# Since: 8.0
+##
+{ 'struct': 'EvtchnInfo',
+  'data': {'port': 'uint16',
+           'vcpu': 'uint32',
+           'type': 'EvtchnPortType',
+           'remote-domain': 'str',
+           'target': 'uint16',
+           'pending': 'bool',
+           'masked': 'bool'},
+  'if': 'TARGET_I386' }
+
+
+##
+# @xen-event-list:
+#
+# Query the Xen event channels opened by the guest.
+#
+# Returns: list of open event channel ports.
+#
+# Since: 8.0
+#
+# Example:
+#
+# -> { "execute": "xen-event-list" }
+# <- { "return": [
+#         {
+#             "pending": false,
+#             "port": 1,
+#             "vcpu": 1,
+#             "remote-domain": "qemu",
+#             "masked": false,
+#             "type": "interdomain",
+#             "target": 1
+#         },
+#         {
+#             "pending": false,
+#             "port": 2,
+#             "vcpu": 0,
+#             "remote-domain": "",
+#             "masked": false,
+#             "type": "virq",
+#             "target": 0
+#         }
+#      ]
+#    }
+#
+##
+{ 'command': 'xen-event-list',
+  'returns': ['EvtchnInfo'],
+  'if': 'TARGET_I386' }
+
+##
+# @xen-event-inject:
+#
+# Inject a Xen event channel port (interrupt) to the guest.
+#
+# @port: The port number
+#
+# Returns: - Nothing on success.
+#
+# Since: 8.0
+#
+# Example:
+#
+# -> { "execute": "xen-event-inject", "arguments": { "port": 1 } }
+# <- { "return": { } }
+#
+##
+{ 'command': 'xen-event-inject',
+  'data': { 'port': 'uint32' },
+  'if': 'TARGET_I386' }
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index 98caf6fef6d3..a58de48d2a48 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -54,6 +54,7 @@ static int query_error_class(const char *cmd)
         /* Only valid with accel=tcg */
         { "x-query-jit", ERROR_CLASS_GENERIC_ERROR },
         { "x-query-opcount", ERROR_CLASS_GENERIC_ERROR },
+        { "xen-event-list", ERROR_CLASS_GENERIC_ERROR },
         { NULL, -1 }
     };
     int i;
-- 
2.39.1


