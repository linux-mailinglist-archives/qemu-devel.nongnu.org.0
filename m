Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B42C02D4978
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:51:39 +0100 (CET)
Received: from localhost ([::1]:50994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4Ys-0005ro-Oe
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:51:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3tt-00031u-Lc
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3tr-0008JI-Kr
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sm4fkmkUZJjXxwX3FPm+Fo5gUyq1PEzc4bBPGNIoRY8=;
 b=GBjR8Z5QvvdvsYSzbWoiTi8YwxofslPJeToXXEEIklnbtYDErvmIQlAZL7kKBeOvW5bB0C
 MXUyyJpjO1FgcJX1K1LTuxR9Nz/PwDce31bJ/Nr8Azx7y+80ULK04Bu0CFrdyV7L31MU9x
 oNlZdLWspS4Ic1RetimOvqnwmKfX+6w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-w0UZRN4vNVGNTcdquxbAbg-1; Wed, 09 Dec 2020 13:09:11 -0500
X-MC-Unique: w0UZRN4vNVGNTcdquxbAbg-1
Received: by mail-wr1-f69.google.com with SMTP id b5so952547wrp.3
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:09:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Sm4fkmkUZJjXxwX3FPm+Fo5gUyq1PEzc4bBPGNIoRY8=;
 b=h/krl0RmL5mNQK8qDWkRPrBq6ZXpoas5w4wkyA4Jlx6Lck4h9AIdqfhfPaWhbadBUS
 0A/AV3QMCxyl5CQUS/VSjw424vB30HQ5Qn4vUUzRS/wiV644XKYT1wnYRPygwvzquaJK
 z4DJ7wrG96smYAxJCuW5mKzhytoFyiUodTpqRg05ax6AvQ6OGS72Fl1PRYb5lGNM5q1Z
 Q76rWhaTvQav2Y66KHuMRlQUvdns20Va79BbB2ne6G0MjMwQbHBaocB1PZ2I7kWUvMwp
 /LOksllswGnKHLqZpN8Sbwvk4rHzyU0kAaZRH63HpFXOMBagvoTfXEv2LgpR9pbZmh1Q
 obxg==
X-Gm-Message-State: AOAM530K2+aHW8p9OiI5aBlPUYnF1soQkxVDbuYysb/IQr/UQXUkNmHO
 EXI6d6f5W8uHXhXaMooyT30dDs9SENpilRpQU5AyHZRjkTdbTMxVA4pSiMg/L0huWIbpKMcJzWs
 PQicBW07rgrBibN6NLWVmnS9rC110amtyxeqTO6gLR2rKDPzh/TiZ+9hLi4to
X-Received: by 2002:a1c:220b:: with SMTP id i11mr4126031wmi.8.1607537349743;
 Wed, 09 Dec 2020 10:09:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8oz0DYYwR6QHadlUevqTpDsRZ+J3gyS+XwoZN3yOhqwKOIymzyCAJ5E0sI6hbqqufvM7blw==
X-Received: by 2002:a1c:220b:: with SMTP id i11mr4126012wmi.8.1607537349550;
 Wed, 09 Dec 2020 10:09:09 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id c2sm4844068wrv.41.2020.12.09.10.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:09:08 -0800 (PST)
Date: Wed, 9 Dec 2020 13:09:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 31/65] failover: Rename function to hide_device()
Message-ID: <20201209180546.721296-32-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Juan Quintela <quintela@redhat.com>

You should not use pasive.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-17-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/qdev-core.h | 28 +++++++++++++++-------------
 hw/core/qdev.c         |  4 ++--
 hw/net/virtio-net.c    |  7 +++----
 3 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 250f4edef6..6ac86db44e 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -81,16 +81,17 @@ typedef void (*BusUnrealize)(BusState *bus);
  * </note>
  *
  * # Hiding a device #
- * To hide a device, a DeviceListener function should_be_hidden() needs to
+ * To hide a device, a DeviceListener function hide_device() needs to
  * be registered.
- * It can be used to defer adding a device and therefore hide it from the
- * guest. The handler registering to this DeviceListener can save the QOpts
- * passed to it for re-using it later and must return that it wants the device
- * to be/remain hidden or not. When the handler function decides the device
- * shall not be hidden it will be added in qdev_device_add() and
- * realized as any other device. Otherwise qdev_device_add() will return early
- * without adding the device. The guest will not see a "hidden" device
- * until it was marked don't hide and qdev_device_add called again.
+ * It can be used to defer adding a device and therefore hide it from
+ * the guest. The handler registering to this DeviceListener can save
+ * the QOpts passed to it for re-using it later. It must return if it
+ * wants the device to be hidden or visible. When the handler function
+ * decides the device shall be visible it will be added with
+ * qdev_device_add() and realized as any other device. Otherwise
+ * qdev_device_add() will return early without adding the device. The
+ * guest will not see a "hidden" device until it was marked visible
+ * and qdev_device_add called again.
  *
  */
 struct DeviceClass {
@@ -196,11 +197,12 @@ struct DeviceListener {
     void (*realize)(DeviceListener *listener, DeviceState *dev);
     void (*unrealize)(DeviceListener *listener, DeviceState *dev);
     /*
-     * This callback is called upon init of the DeviceState and allows to
-     * inform qdev that a device should be hidden, depending on the device
-     * opts, for example, to hide a standby device.
+     * This callback is called upon init of the DeviceState and
+     * informs qdev if a device should be visible or hidden.  We can
+     * hide a failover device depending for example on the device
+     * opts.
      */
-    bool (*should_be_hidden)(DeviceListener *listener, QemuOpts *device_opts);
+    bool (*hide_device)(DeviceListener *listener, QemuOpts *device_opts);
     QTAILQ_ENTRY(DeviceListener) link;
 };
 
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 8f4b8f3cc1..cbdff0b6c6 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -217,8 +217,8 @@ bool qdev_should_hide_device(QemuOpts *opts)
     DeviceListener *listener;
 
     QTAILQ_FOREACH(listener, &device_listeners, link) {
-        if (listener->should_be_hidden) {
-            if (listener->should_be_hidden(listener, opts)) {
+        if (listener->hide_device) {
+            if (listener->hide_device(listener, opts)) {
                 return true;
             }
         }
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 9f12d33da0..747614ff2a 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3161,8 +3161,8 @@ static void virtio_net_migration_state_notifier(Notifier *notifier, void *data)
     virtio_net_handle_migration_primary(n, s);
 }
 
-static bool virtio_net_primary_should_be_hidden(DeviceListener *listener,
-                                                QemuOpts *device_opts)
+static bool failover_hide_primary_device(DeviceListener *listener,
+                                         QemuOpts *device_opts)
 {
     VirtIONet *n = container_of(listener, VirtIONet, primary_listener);
     bool hide;
@@ -3220,8 +3220,7 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
     }
 
     if (n->failover) {
-        n->primary_listener.should_be_hidden =
-            virtio_net_primary_should_be_hidden;
+        n->primary_listener.hide_device = failover_hide_primary_device;
         qatomic_set(&n->failover_primary_hidden, true);
         device_listener_register(&n->primary_listener);
         n->migration_state.notify = virtio_net_migration_state_notifier;
-- 
MST


