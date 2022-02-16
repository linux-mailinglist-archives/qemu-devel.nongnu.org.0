Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B494B857C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:28:19 +0100 (CET)
Received: from localhost ([::1]:33504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHXm-0001hB-QR
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:28:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1nKHV2-0007EA-T2
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:25:29 -0500
Received: from [2a00:1450:4864:20::32b] (port=33551
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1nKHUz-0005CQ-6h
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:25:28 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 y6-20020a7bc186000000b0037bdc5a531eso2502201wmi.0
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 02:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s5DmOdfh+PlWIp7NrJJqp5ZHFzKdX/kGaXSb/Ww1JXA=;
 b=byge2ugxub7fgzF8/aRAt13yg5TRx7haxuiv9BjzMRilj7+dqeeypmKYqOXMxgUR+p
 IC/Q/unMg6mRBnynVK++ZWZhTos0QtpcEYsEzp4mcjKliIn0XgdRyw0j0T+2j9py9GJl
 lyaEc/E9hT+gPEpuh1f9+S1ouomygfWIux1mLFMWqr2zLcFc8nJuXqIaIHfU7cJG2eoT
 jZzxWldjx7dFDtEOE+iZLczAQhLERRkgwH8OrJJNWmNcj9jppqmk8zJxAl3indVKGqC4
 UYbh+uuwAUV9rPmAvoz84/lBvFvlW5V4xh/gAWKipMWbLqvOEpzDWtyGSCzVi5qPKEMZ
 jPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s5DmOdfh+PlWIp7NrJJqp5ZHFzKdX/kGaXSb/Ww1JXA=;
 b=Sy+KeTrPGN7SL8iKyn92c7UQTRxL3thZXdKORaQVvSgn8XWeNnMkMwlprMMvwAClFu
 U/vKWCJ/TCsXHMuscFs8K7wjn9rvHvsIo45Lj5C0+WjjBcxP0UrhgeEVuYQGsKte6FRL
 0FqWDJTZqb5964wKIcai4vMss8oOaHtZHUnr2sfXYXyH5cKDX9mx6V5uHaXeTnVulcnv
 A+D7+HMFxoYsOV16DvPweiqiDIY4bpVJ7ZjeaJMB3/rtNAOYmsFMZInvsGOXmHDL2tGH
 YPRGFgV8LaNt8XtnQCqXWE3mDq5KOhGzKYYfy/NUPTeZ1u549+mRJDpVuQc/aVUWjDZw
 msLw==
X-Gm-Message-State: AOAM531OJgCuTo3q+0vX9MQ7HvbAdmM+y2gZ6Ym1FrBhMQV6ci2s+0lO
 DV6AZncELtJ/mRWmLXa4mpAjsaxWsu4=
X-Google-Smtp-Source: ABdhPJxLy8oXmQoQD58cspF7kR5Rm1AkOCKoV8DXMK7o6sLrnefUL/TT5PlFO6D8GKym0p9V0cC7WQ==
X-Received: by 2002:a05:600c:4ed0:b0:37b:e983:287b with SMTP id
 g16-20020a05600c4ed000b0037be983287bmr918978wmq.156.1645007121683; 
 Wed, 16 Feb 2022 02:25:21 -0800 (PST)
Received: from localhost.localdomain
 ([2a0d:6fc2:4af1:7d00:5e41:a6ea:ffaa:548c])
 by smtp.gmail.com with ESMTPSA id y10sm17212967wmi.47.2022.02.16.02.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 02:25:21 -0800 (PST)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] hyperv: SControl is optional to enable SynIc
Date: Wed, 16 Feb 2022 12:24:57 +0200
Message-Id: <20220216102500.692781-2-arilou@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220216102500.692781-1-arilou@gmail.com>
References: <20220216102500.692781-1-arilou@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=arilou@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, vkuznets@redhat.com, Jon Doron <arilou@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SynIc can be enabled regardless of the SControl mechanisim which can
register a GSI for a given SintRoute.

This behaviour can achived by setting enabling SIMP and then the guest
will poll on the message slot.

Once there is another message pending the host will set the message slot
with the pending flag.
When the guest polls from the message slot, in case the pending flag is
set it will write to the HV_X64_MSR_EOM indicating it has cleared the
slot and we can try and push our message again.

Signed-off-by: Jon Doron <arilou@gmail.com>
---
 hw/hyperv/hyperv.c | 109 +++++++++++++++++++++++++++++++--------------
 1 file changed, 76 insertions(+), 33 deletions(-)

diff --git a/hw/hyperv/hyperv.c b/hw/hyperv/hyperv.c
index cb1074f234..aaba6b4901 100644
--- a/hw/hyperv/hyperv.c
+++ b/hw/hyperv/hyperv.c
@@ -27,13 +27,16 @@ struct SynICState {
 
     CPUState *cs;
 
-    bool enabled;
+    bool sctl_enabled;
     hwaddr msg_page_addr;
     hwaddr event_page_addr;
     MemoryRegion msg_page_mr;
     MemoryRegion event_page_mr;
     struct hyperv_message_page *msg_page;
     struct hyperv_event_flags_page *event_page;
+
+    QemuMutex sint_routes_mutex;
+    QLIST_HEAD(, HvSintRoute) sint_routes;
 };
 
 #define TYPE_SYNIC "hyperv-synic"
@@ -51,11 +54,11 @@ static SynICState *get_synic(CPUState *cs)
     return SYNIC(object_resolve_path_component(OBJECT(cs), "synic"));
 }
 
-static void synic_update(SynICState *synic, bool enable,
+static void synic_update(SynICState *synic, bool sctl_enable,
                          hwaddr msg_page_addr, hwaddr event_page_addr)
 {
 
-    synic->enabled = enable;
+    synic->sctl_enabled = sctl_enable;
     if (synic->msg_page_addr != msg_page_addr) {
         if (synic->msg_page_addr) {
             memory_region_del_subregion(get_system_memory(),
@@ -80,7 +83,7 @@ static void synic_update(SynICState *synic, bool enable,
     }
 }
 
-void hyperv_synic_update(CPUState *cs, bool enable,
+void hyperv_synic_update(CPUState *cs, bool sctl_enable,
                          hwaddr msg_page_addr, hwaddr event_page_addr)
 {
     SynICState *synic = get_synic(cs);
@@ -89,7 +92,7 @@ void hyperv_synic_update(CPUState *cs, bool enable,
         return;
     }
 
-    synic_update(synic, enable, msg_page_addr, event_page_addr);
+    synic_update(synic, sctl_enable, msg_page_addr, event_page_addr);
 }
 
 static void synic_realize(DeviceState *dev, Error **errp)
@@ -110,16 +113,20 @@ static void synic_realize(DeviceState *dev, Error **errp)
                            sizeof(*synic->event_page), &error_abort);
     synic->msg_page = memory_region_get_ram_ptr(&synic->msg_page_mr);
     synic->event_page = memory_region_get_ram_ptr(&synic->event_page_mr);
+    qemu_mutex_init(&synic->sint_routes_mutex);
+    QLIST_INIT(&synic->sint_routes);
 
     g_free(msgp_name);
     g_free(eventp_name);
 }
+
 static void synic_reset(DeviceState *dev)
 {
     SynICState *synic = SYNIC(dev);
     memset(synic->msg_page, 0, sizeof(*synic->msg_page));
     memset(synic->event_page, 0, sizeof(*synic->event_page));
     synic_update(synic, false, 0, 0);
+    assert(QLIST_EMPTY(&synic->sint_routes));
 }
 
 static void synic_class_init(ObjectClass *klass, void *data)
@@ -214,6 +221,7 @@ struct HvSintRoute {
     HvSintStagedMessage *staged_msg;
 
     unsigned refcount;
+    QLIST_ENTRY(HvSintRoute) link;
 };
 
 static CPUState *hyperv_find_vcpu(uint32_t vp_index)
@@ -259,7 +267,7 @@ static void cpu_post_msg(CPUState *cs, run_on_cpu_data data)
 
     assert(staged_msg->state == HV_STAGED_MSG_BUSY);
 
-    if (!synic->enabled || !synic->msg_page_addr) {
+    if (!synic->msg_page_addr) {
         staged_msg->status = -ENXIO;
         goto posted;
     }
@@ -343,7 +351,7 @@ int hyperv_set_event_flag(HvSintRoute *sint_route, unsigned eventno)
     if (eventno > HV_EVENT_FLAGS_COUNT) {
         return -EINVAL;
     }
-    if (!synic->enabled || !synic->event_page_addr) {
+    if (!synic->sctl_enabled || !synic->event_page_addr) {
         return -ENXIO;
     }
 
@@ -364,11 +372,12 @@ int hyperv_set_event_flag(HvSintRoute *sint_route, unsigned eventno)
 HvSintRoute *hyperv_sint_route_new(uint32_t vp_index, uint32_t sint,
                                    HvSintMsgCb cb, void *cb_data)
 {
-    HvSintRoute *sint_route;
-    EventNotifier *ack_notifier;
+    HvSintRoute *sint_route = NULL;
+    EventNotifier *ack_notifier = NULL;
     int r, gsi;
     CPUState *cs;
     SynICState *synic;
+    bool ack_event_initialized = false;
 
     cs = hyperv_find_vcpu(vp_index);
     if (!cs) {
@@ -381,57 +390,77 @@ HvSintRoute *hyperv_sint_route_new(uint32_t vp_index, uint32_t sint,
     }
 
     sint_route = g_new0(HvSintRoute, 1);
-    r = event_notifier_init(&sint_route->sint_set_notifier, false);
-    if (r) {
-        goto err;
+    if (!sint_route) {
+        return NULL;
     }
 
+    sint_route->synic = synic;
+    sint_route->sint = sint;
+    sint_route->refcount = 1;
 
     ack_notifier = cb ? &sint_route->sint_ack_notifier : NULL;
     if (ack_notifier) {
         sint_route->staged_msg = g_new0(HvSintStagedMessage, 1);
+        if (!sint_route->staged_msg) {
+            goto cleanup_err_sint;
+        }
         sint_route->staged_msg->cb = cb;
         sint_route->staged_msg->cb_data = cb_data;
 
         r = event_notifier_init(ack_notifier, false);
         if (r) {
-            goto err_sint_set_notifier;
+            goto cleanup_err_sint;
         }
-
         event_notifier_set_handler(ack_notifier, sint_ack_handler);
+        ack_event_initialized = true;
+    }
+
+    /* See if we are done or we need to setup a GSI for this SintRoute */
+    if (!synic->sctl_enabled) {
+        goto cleanup;
+    }
+
+    /* We need to setup a GSI for this SintRoute */
+    r = event_notifier_init(&sint_route->sint_set_notifier, false);
+    if (r) {
+        goto cleanup_err_sint;
     }
 
     gsi = kvm_irqchip_add_hv_sint_route(kvm_state, vp_index, sint);
     if (gsi < 0) {
-        goto err_gsi;
+        goto cleanup_err_sint_notifier;
     }
 
     r = kvm_irqchip_add_irqfd_notifier_gsi(kvm_state,
                                            &sint_route->sint_set_notifier,
                                            ack_notifier, gsi);
     if (r) {
-        goto err_irqfd;
+        goto cleanup_err_irqfd;
     }
     sint_route->gsi = gsi;
-    sint_route->synic = synic;
-    sint_route->sint = sint;
-    sint_route->refcount = 1;
-
+cleanup:
+    qemu_mutex_lock(&synic->sint_routes_mutex);
+    QLIST_INSERT_HEAD_RCU(&synic->sint_routes, sint_route, link);
+    qemu_mutex_unlock(&synic->sint_routes_mutex);
     return sint_route;
 
-err_irqfd:
+cleanup_err_irqfd:
     kvm_irqchip_release_virq(kvm_state, gsi);
-err_gsi:
+
+cleanup_err_sint_notifier:
+    event_notifier_cleanup(&sint_route->sint_set_notifier);
+
+cleanup_err_sint:
     if (ack_notifier) {
-        event_notifier_set_handler(ack_notifier, NULL);
-        event_notifier_cleanup(ack_notifier);
+        if (ack_event_initialized) {
+            event_notifier_set_handler(ack_notifier, NULL);
+            event_notifier_cleanup(ack_notifier);
+        }
+
         g_free(sint_route->staged_msg);
     }
-err_sint_set_notifier:
-    event_notifier_cleanup(&sint_route->sint_set_notifier);
-err:
-    g_free(sint_route);
 
+    g_free(sint_route);
     return NULL;
 }
 
@@ -442,6 +471,8 @@ void hyperv_sint_route_ref(HvSintRoute *sint_route)
 
 void hyperv_sint_route_unref(HvSintRoute *sint_route)
 {
+    SynICState *synic;
+
     if (!sint_route) {
         return;
     }
@@ -452,21 +483,33 @@ void hyperv_sint_route_unref(HvSintRoute *sint_route)
         return;
     }
 
-    kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state,
-                                          &sint_route->sint_set_notifier,
-                                          sint_route->gsi);
-    kvm_irqchip_release_virq(kvm_state, sint_route->gsi);
+    synic = sint_route->synic;
+    qemu_mutex_lock(&synic->sint_routes_mutex);
+    QLIST_REMOVE_RCU(sint_route, link);
+    qemu_mutex_unlock(&synic->sint_routes_mutex);
+
+    if (sint_route->gsi) {
+        kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state,
+                                              &sint_route->sint_set_notifier,
+                                              sint_route->gsi);
+        kvm_irqchip_release_virq(kvm_state, sint_route->gsi);
+        event_notifier_cleanup(&sint_route->sint_set_notifier);
+    }
+
     if (sint_route->staged_msg) {
         event_notifier_set_handler(&sint_route->sint_ack_notifier, NULL);
         event_notifier_cleanup(&sint_route->sint_ack_notifier);
         g_free(sint_route->staged_msg);
     }
-    event_notifier_cleanup(&sint_route->sint_set_notifier);
     g_free(sint_route);
 }
 
 int hyperv_sint_route_set_sint(HvSintRoute *sint_route)
 {
+    if (!sint_route->gsi) {
+        return 0;
+    }
+
     return event_notifier_set(&sint_route->sint_set_notifier);
 }
 
-- 
2.35.1


