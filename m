Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC4F2D32DE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:00:23 +0100 (CET)
Received: from localhost ([::1]:60824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmj9q-0004v1-9g
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:00:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmilt-0005yv-Nw
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmilo-0005FJ-Ea
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sm4fkmkUZJjXxwX3FPm+Fo5gUyq1PEzc4bBPGNIoRY8=;
 b=JyQ/mvLDjphdwD5bkLhfUREX58XL6RtK81o/Mu8G0f4D8G1mSfUSdNvQbKZweEMbf9EwVR
 Pwe9QNiilYSjhnRIWMtQk+xn71lDl3pDV54ckvXYvVIkmg8G2NLik6xF7+ALOWMjLGSeMO
 g/8L1Yb86AhxLp3ehS5GOAGhzyQvxEk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-8-OUGIs_NXyugnU7_hUZYg-1; Tue, 08 Dec 2020 14:35:26 -0500
X-MC-Unique: 8-OUGIs_NXyugnU7_hUZYg-1
Received: by mail-wm1-f70.google.com with SMTP id v5so1288536wmj.0
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:35:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Sm4fkmkUZJjXxwX3FPm+Fo5gUyq1PEzc4bBPGNIoRY8=;
 b=Waha4Q6uhL7K12UB4+8bo5pEla0M6/0nxjmaTAVMVKsp/0gWhjAEZzLckaGA2dHnPr
 01jXUbgSyf5U8YvS3eX+potgtx0/h5tLh/uA4+zzfyijWoZQAEcVQJV/Y7pklqqgoYwh
 bhtAhwA0qaZt9KAINZ4HmqSCF3d2/ohwdztkY2cgHX/Y8ScaCVfKPzDlxE0WGkGR2brl
 KrlkwWh0KFQ5Xi61ajCFndEYybtEjSuDFSx3lZfo482PfTptvhf7PtaNzn56RdFWcNJM
 /2pn6+MTnXjS7OZZn9HUefGewDG7dhzyoWECMwimHyVvF6VkEZnrt+46SPVc0CZ88C9z
 MyeA==
X-Gm-Message-State: AOAM533WDOI0h91fD8gp9wO+4G/pIYZeZhP4opVX6DZt/ADJkDkFZLF2
 GphfLu1S76GWyQkaYgghSvUtiHn6ZM10wp2p5afgNUoFXWDLgavPHTjHVIJ2JxIf0JlIgN9UZGs
 QAY7zLhNL3h8KJy/b3gmO1+TKRz4p22LHVxB7UBS2C1IzWLscV2WpmF87XdYd
X-Received: by 2002:a5d:55c6:: with SMTP id i6mr10307504wrw.137.1607456125300; 
 Tue, 08 Dec 2020 11:35:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVbPYujTtEBjhu15oJ1VEt4Gqc8D6fzqaDNAiMTaNOHdwZD5om6H6pBFNhxu/DAIqAe+sfqg==
X-Received: by 2002:a5d:55c6:: with SMTP id i6mr10307488wrw.137.1607456125092; 
 Tue, 08 Dec 2020 11:35:25 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id u66sm5040476wmg.2.2020.12.08.11.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:35:24 -0800 (PST)
Date: Tue, 8 Dec 2020 14:35:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 31/66] failover: Rename function to hide_device()
Message-ID: <20201208193307.646726-32-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


