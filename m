Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B436AFBF5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:15:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiL6-0000nU-5A; Tue, 07 Mar 2023 20:11:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiL4-0000nI-IT
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiL2-0001Xy-09
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ra4vIkJKM9hi6aLAOIQfbGKBCS5/tNINdUWp+/DWurY=;
 b=RcKh18DG4T4aeY+tKrku3l8xIws/iK27q5LGwWH6+5KBGVBaPrZMbCDWuzBclFRywCEMX7
 xWVWHMVrfKAN7V7ko/OOB7bGxwRYSOobVZT+vupVtn1lgY13WNGgT9Xbvoz9JyvBlRJR8D
 V8T7n8bOHpTxsb1X9PgY4J06w6b666M=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-96T5X7I0NsC7OCQLE8vdFA-1; Tue, 07 Mar 2023 20:11:26 -0500
X-MC-Unique: 96T5X7I0NsC7OCQLE8vdFA-1
Received: by mail-ed1-f72.google.com with SMTP id
 da22-20020a056402177600b004c60694083eso21248622edb.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:11:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237884;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ra4vIkJKM9hi6aLAOIQfbGKBCS5/tNINdUWp+/DWurY=;
 b=Am1E8A/j5VsaMHg3LDi4KS9eBBtPL6Cy342dAHySxlYOzGcRgbJL3Vexw3yK/S+g66
 KzY+550po8DcxBDm/RB4Tbwo3F68tl0JVmGTAU7UPwfgjPVuNeFtwySvhk02nnB4r5V2
 hP0rXXrBko1hPU6hP/dvvQXnTU+aJxJoXGOqFJCQmL+7W+0QhipZTnB2JaTWjja3p8j4
 QZMvccFkQI1Z9zvZx+yUQH/88CS7kpr7QdG9NeJzBRrK27rx/DPsireZljybBSE+z9uf
 09aFUPxyUZMhRq/63IK4RSniNuFyv158RKvQT3Kao/0c4Ej+Kww+2GBl2VLORdHYTi/P
 Zjfw==
X-Gm-Message-State: AO0yUKXtRcQfdREBTqqP2pYNaRHILbLSJeKYW6Q/s1+hCKyNC7/7+Hma
 fEhIcXpKUpMa/GjgEZMc+48yrxUAvH2vjmqChjDthWFi3vver9h0fjpnEubru58BItJCKb5Gswa
 RsdmqdXO08nXrcuzHPpAdQ6CKNfkvogxG/cE+mwBw1VOqo8B0Z0mRL3kXTfk8sylQrJwC
X-Received: by 2002:a17:906:3b4b:b0:85d:dd20:60a4 with SMTP id
 h11-20020a1709063b4b00b0085ddd2060a4mr15328711ejf.40.1678237884570; 
 Tue, 07 Mar 2023 17:11:24 -0800 (PST)
X-Google-Smtp-Source: AK7set8cDelW2YeUMWTXY+oKNayqnFhVD4v28Z9K/gQGMdRqFJrq67IcwJXqQDwY9pdnmPv6bhRsoA==
X-Received: by 2002:a17:906:3b4b:b0:85d:dd20:60a4 with SMTP id
 h11-20020a1709063b4b00b0085ddd2060a4mr15328690ejf.40.1678237884140; 
 Tue, 07 Mar 2023 17:11:24 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 a25-20020a50c319000000b004af62273b66sm7444234edb.18.2023.03.07.17.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:11:23 -0800 (PST)
Date: Tue, 7 Mar 2023 20:11:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 zhenwei pi <pizhenwei@bytedance.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PULL 10/73] cryptodev: support QoS
Message-ID: <2580b452ffccfb2bcba97dbfcb0d6067d06bc453.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: zhenwei pi <pizhenwei@bytedance.com>

Add 'throttle-bps' and 'throttle-ops' limitation to set QoS. The
two arguments work with both QEMU command line and QMP command.

Example of QEMU command line:
-object cryptodev-backend-builtin,id=cryptodev1,throttle-bps=1600,\
throttle-ops=100

Example of QMP command:
virsh qemu-monitor-command buster --hmp qom-set /objects/cryptodev1 \
throttle-ops 100

or cancel limitation:
virsh qemu-monitor-command buster --hmp qom-set /objects/cryptodev1 \
throttle-ops 0

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
Message-Id: <20230301105847.253084-11-pizhenwei@bytedance.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 qapi/qom.json              |   8 ++-
 include/sysemu/cryptodev.h |   7 ++
 backends/cryptodev.c       | 138 +++++++++++++++++++++++++++++++++++++
 3 files changed, 152 insertions(+), 1 deletion(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 30e76653ad..a877b879b9 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -278,10 +278,16 @@
 #          cryptodev-backend and must be 1 for cryptodev-backend-builtin.
 #          (default: 1)
 #
+# @throttle-bps: limit total bytes per second (Since 8.0)
+#
+# @throttle-ops: limit total operations per second (Since 8.0)
+#
 # Since: 2.8
 ##
 { 'struct': 'CryptodevBackendProperties',
-  'data': { '*queues': 'uint32' } }
+  'data': { '*queues': 'uint32',
+            '*throttle-bps': 'uint64',
+            '*throttle-ops': 'uint64' } }
 
 ##
 # @CryptodevVhostUserProperties:
diff --git a/include/sysemu/cryptodev.h b/include/sysemu/cryptodev.h
index c0250c4a2c..bc021ce847 100644
--- a/include/sysemu/cryptodev.h
+++ b/include/sysemu/cryptodev.h
@@ -24,6 +24,7 @@
 #define CRYPTODEV_H
 
 #include "qemu/queue.h"
+#include "qemu/throttle.h"
 #include "qom/object.h"
 #include "qapi/qapi-types-cryptodev.h"
 
@@ -187,6 +188,7 @@ typedef struct CryptoDevBackendOpInfo {
         CryptoDevBackendSymOpInfo *sym_op_info;
         CryptoDevBackendAsymOpInfo *asym_op_info;
     } u;
+    QTAILQ_ENTRY(CryptoDevBackendOpInfo) next;
 } CryptoDevBackendOpInfo;
 
 struct CryptoDevBackendClass {
@@ -273,6 +275,11 @@ struct CryptoDevBackend {
     CryptoDevBackendConf conf;
     CryptodevBackendSymStat *sym_stat;
     CryptodevBackendAsymStat *asym_stat;
+
+    ThrottleState ts;
+    ThrottleTimers tt;
+    ThrottleConfig tc;
+    QTAILQ_HEAD(, CryptoDevBackendOpInfo) opinfos;
 };
 
 #define CryptodevSymStatInc(be, op, bytes) do { \
diff --git a/backends/cryptodev.c b/backends/cryptodev.c
index 5ee7507ca5..7c10a2e1cb 100644
--- a/backends/cryptodev.c
+++ b/backends/cryptodev.c
@@ -28,6 +28,7 @@
 #include "qapi/visitor.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
+#include "qemu/main-loop.h"
 #include "qom/object_interfaces.h"
 #include "hw/virtio/virtio-crypto.h"
 
@@ -203,17 +204,53 @@ static int cryptodev_backend_account(CryptoDevBackend *backend,
     return len;
 }
 
+static void cryptodev_backend_throttle_timer_cb(void *opaque)
+{
+    CryptoDevBackend *backend = (CryptoDevBackend *)opaque;
+    CryptoDevBackendOpInfo *op_info, *tmpop;
+    int ret;
+
+    QTAILQ_FOREACH_SAFE(op_info, &backend->opinfos, next, tmpop) {
+        QTAILQ_REMOVE(&backend->opinfos, op_info, next);
+        ret = cryptodev_backend_account(backend, op_info);
+        if (ret < 0) {
+            op_info->cb(op_info->opaque, ret);
+            continue;
+        }
+
+        throttle_account(&backend->ts, true, ret);
+        cryptodev_backend_operation(backend, op_info);
+        if (throttle_enabled(&backend->tc) &&
+            throttle_schedule_timer(&backend->ts, &backend->tt, true)) {
+            break;
+        }
+    }
+}
+
 int cryptodev_backend_crypto_operation(
                  CryptoDevBackend *backend,
                  CryptoDevBackendOpInfo *op_info)
 {
     int ret;
 
+    if (!throttle_enabled(&backend->tc)) {
+        goto do_account;
+    }
+
+    if (throttle_schedule_timer(&backend->ts, &backend->tt, true) ||
+        !QTAILQ_EMPTY(&backend->opinfos)) {
+        QTAILQ_INSERT_TAIL(&backend->opinfos, op_info, next);
+        return 0;
+    }
+
+do_account:
     ret = cryptodev_backend_account(backend, op_info);
     if (ret < 0) {
         return ret;
     }
 
+    throttle_account(&backend->ts, true, ret);
+
     return cryptodev_backend_operation(backend, op_info);
 }
 
@@ -245,12 +282,98 @@ cryptodev_backend_set_queues(Object *obj, Visitor *v, const char *name,
     backend->conf.peers.queues = value;
 }
 
+static void cryptodev_backend_set_throttle(CryptoDevBackend *backend, int field,
+                                           uint64_t value, Error **errp)
+{
+    uint64_t orig = backend->tc.buckets[field].avg;
+    bool enabled = throttle_enabled(&backend->tc);
+
+    if (orig == value) {
+        return;
+    }
+
+    backend->tc.buckets[field].avg = value;
+    if (!throttle_enabled(&backend->tc)) {
+        throttle_timers_destroy(&backend->tt);
+        cryptodev_backend_throttle_timer_cb(backend); /* drain opinfos */
+        return;
+    }
+
+    if (!throttle_is_valid(&backend->tc, errp)) {
+        backend->tc.buckets[field].avg = orig; /* revert change */
+        return;
+    }
+
+    if (!enabled) {
+        throttle_init(&backend->ts);
+        throttle_timers_init(&backend->tt, qemu_get_aio_context(),
+                             QEMU_CLOCK_REALTIME,
+                             cryptodev_backend_throttle_timer_cb, /* FIXME */
+                             cryptodev_backend_throttle_timer_cb, backend);
+    }
+
+    throttle_config(&backend->ts, QEMU_CLOCK_REALTIME, &backend->tc);
+}
+
+static void cryptodev_backend_get_bps(Object *obj, Visitor *v,
+                                      const char *name, void *opaque,
+                                      Error **errp)
+{
+    CryptoDevBackend *backend = CRYPTODEV_BACKEND(obj);
+    uint64_t value = backend->tc.buckets[THROTTLE_BPS_TOTAL].avg;
+
+    visit_type_uint64(v, name, &value, errp);
+}
+
+static void cryptodev_backend_set_bps(Object *obj, Visitor *v, const char *name,
+                                      void *opaque, Error **errp)
+{
+    CryptoDevBackend *backend = CRYPTODEV_BACKEND(obj);
+    uint64_t value;
+
+    if (!visit_type_uint64(v, name, &value, errp)) {
+        return;
+    }
+
+    cryptodev_backend_set_throttle(backend, THROTTLE_BPS_TOTAL, value, errp);
+}
+
+static void cryptodev_backend_get_ops(Object *obj, Visitor *v, const char *name,
+                                      void *opaque, Error **errp)
+{
+    CryptoDevBackend *backend = CRYPTODEV_BACKEND(obj);
+    uint64_t value = backend->tc.buckets[THROTTLE_OPS_TOTAL].avg;
+
+    visit_type_uint64(v, name, &value, errp);
+}
+
+static void cryptodev_backend_set_ops(Object *obj, Visitor *v,
+                                       const char *name, void *opaque,
+                                       Error **errp)
+{
+    CryptoDevBackend *backend = CRYPTODEV_BACKEND(obj);
+    uint64_t value;
+
+    if (!visit_type_uint64(v, name, &value, errp)) {
+        return;
+    }
+
+    cryptodev_backend_set_throttle(backend, THROTTLE_OPS_TOTAL, value, errp);
+}
+
 static void
 cryptodev_backend_complete(UserCreatable *uc, Error **errp)
 {
     CryptoDevBackend *backend = CRYPTODEV_BACKEND(uc);
     CryptoDevBackendClass *bc = CRYPTODEV_BACKEND_GET_CLASS(uc);
     uint32_t services;
+    uint64_t value;
+
+    QTAILQ_INIT(&backend->opinfos);
+    value = backend->tc.buckets[THROTTLE_OPS_TOTAL].avg;
+    cryptodev_backend_set_throttle(backend, THROTTLE_OPS_TOTAL, value, errp);
+    value = backend->tc.buckets[THROTTLE_BPS_TOTAL].avg;
+    cryptodev_backend_set_throttle(backend, THROTTLE_BPS_TOTAL, value, errp);
 
     if (bc->init) {
         bc->init(backend, errp);
@@ -294,8 +417,12 @@ cryptodev_backend_can_be_deleted(UserCreatable *uc)
 
 static void cryptodev_backend_instance_init(Object *obj)
 {
+    CryptoDevBackend *backend = CRYPTODEV_BACKEND(obj);
+
     /* Initialize devices' queues property to 1 */
     object_property_set_int(obj, "queues", 1, NULL);
+
+    throttle_config_init(&backend->tc);
 }
 
 static void cryptodev_backend_finalize(Object *obj)
@@ -303,6 +430,9 @@ static void cryptodev_backend_finalize(Object *obj)
     CryptoDevBackend *backend = CRYPTODEV_BACKEND(obj);
 
     cryptodev_backend_cleanup(backend, NULL);
+    if (throttle_enabled(&backend->tc)) {
+        throttle_timers_destroy(&backend->tt);
+    }
 }
 
 static void
@@ -318,6 +448,14 @@ cryptodev_backend_class_init(ObjectClass *oc, void *data)
                               cryptodev_backend_get_queues,
                               cryptodev_backend_set_queues,
                               NULL, NULL);
+    object_class_property_add(oc, "throttle-bps", "uint64",
+                              cryptodev_backend_get_bps,
+                              cryptodev_backend_set_bps,
+                              NULL, NULL);
+    object_class_property_add(oc, "throttle-ops", "uint64",
+                              cryptodev_backend_get_ops,
+                              cryptodev_backend_set_ops,
+                              NULL, NULL);
 }
 
 static const TypeInfo cryptodev_backend_info = {
-- 
MST


