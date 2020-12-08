Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A38A92D32F0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:02:05 +0100 (CET)
Received: from localhost ([::1]:35760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjBU-0006ET-Ik
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:02:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmilp-0005pr-PE
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmilh-0005D2-QY
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bYpqC60JxB3XDC5/IdZ1zt95y2s9bZdWYAE0X430Ko0=;
 b=Whm6t1rypBVIJc1GRbSYVoDGtP0QgjYmpM76C1wUr+IvSlsAJ+4o2EUxq7ZQv7D8D0gy2H
 KP4R5Sh2a5B/eZ3NZbvSikF3/MxM/P1AT3C2yp2VI8c5g0vMhUWLYUQ7yWJbXqqNHG8cZf
 SA4WW+Wc33G9TLvEJ1WqDK+p9hp5VYk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-cqrHxCq9NSKvuGFfJElaKQ-1; Tue, 08 Dec 2020 14:35:22 -0500
X-MC-Unique: cqrHxCq9NSKvuGFfJElaKQ-1
Received: by mail-wm1-f69.google.com with SMTP id b124so567443wmh.0
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:35:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bYpqC60JxB3XDC5/IdZ1zt95y2s9bZdWYAE0X430Ko0=;
 b=j5nFQzIbS0IYDMU5ZQAXbMWzSBmq9562733R0dNu6aa+/ntaHJAakmaQZz1OR42sw8
 eS2AeBThTRI38YV2RNyuX406X5pDFKGC7pJ28xsiAUmy1dFLoLctGRaIrgH5mvC391sb
 QtxYdCtUr+Rb6V9LchjVEgjl2yJVGVyyq0rR++zTe3DpZKenhpculV0MwTAg3rsU+lyn
 CF3OaB5lhLvqFirGOlTo5kibCbjWQCpkoOeG5NE6xLzWbkKMvhSXdidh8MtrlKMe/tNe
 xbCYDJ0Oayd7lTVnZskLhEuIu5hR3kGAiqVl5qOe/keCXeF4AXARAmzN7uIcuh4AhlER
 SUJw==
X-Gm-Message-State: AOAM530uFnMS4RxThlH9k5cltZbIT0Y9uEz/2nwxbzICEv0XumLbm/VD
 gdOQ0G0A2fqD9yZ1qyFuoI6uVANFACHYFe94WCoa38KogZijPiA/k+GMrNTRLcN8MBXy5qZIX8E
 DudvTD3MC7WLcQvDm9vY/7SteyUhbhtD7TSO8zK92BTU2c2V4p7EtdfeZaP5L
X-Received: by 2002:a1c:b788:: with SMTP id h130mr5160057wmf.94.1607456120681; 
 Tue, 08 Dec 2020 11:35:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtKuhGNCV43go+agEEV1FW8nbh0MuvKtGb2XZEl+mEx4AVhQf5NVwzpdQFug+SA+Cp89qzPQ==
X-Received: by 2002:a1c:b788:: with SMTP id h130mr5160036wmf.94.1607456120481; 
 Tue, 08 Dec 2020 11:35:20 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id c1sm4924048wml.8.2020.12.08.11.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:35:19 -0800 (PST)
Date: Tue, 8 Dec 2020 14:35:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/66] failover: should_be_hidden() should take a bool
Message-ID: <20201208193307.646726-31-mst@redhat.com>
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

We didn't use at all the -1 value, and we don't really care.  It was
only used for the cases when this is not the device that we are
searching for.  And in that case we should not hide the device.

Once there, simplify virtio-Snet_primary_should_be_hidden.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-16-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/qdev-core.h |  2 +-
 hw/core/qdev.c         | 19 +++++--------------
 hw/net/virtio-net.c    | 27 +++++++--------------------
 3 files changed, 13 insertions(+), 35 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 5e737195b5..250f4edef6 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -200,7 +200,7 @@ struct DeviceListener {
      * inform qdev that a device should be hidden, depending on the device
      * opts, for example, to hide a standby device.
      */
-    int (*should_be_hidden)(DeviceListener *listener, QemuOpts *device_opts);
+    bool (*should_be_hidden)(DeviceListener *listener, QemuOpts *device_opts);
     QTAILQ_ENTRY(DeviceListener) link;
 };
 
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 262bca716f..8f4b8f3cc1 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -214,26 +214,17 @@ void device_listener_unregister(DeviceListener *listener)
 
 bool qdev_should_hide_device(QemuOpts *opts)
 {
-    int rc = -1;
     DeviceListener *listener;
 
     QTAILQ_FOREACH(listener, &device_listeners, link) {
-       if (listener->should_be_hidden) {
-            /*
-             * should_be_hidden_will return
-             *  1 if device matches opts and it should be hidden
-             *  0 if device matches opts and should not be hidden
-             *  -1 if device doesn't match ops
-             */
-            rc = listener->should_be_hidden(listener, opts);
-        }
-
-        if (rc > 0) {
-            break;
+        if (listener->should_be_hidden) {
+            if (listener->should_be_hidden(listener, opts)) {
+                return true;
+            }
         }
     }
 
-    return rc > 0;
+    return false;
 }
 
 void qdev_set_legacy_instance_id(DeviceState *dev, int alias_id,
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 881907d1bd..9f12d33da0 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3161,24 +3161,19 @@ static void virtio_net_migration_state_notifier(Notifier *notifier, void *data)
     virtio_net_handle_migration_primary(n, s);
 }
 
-static int virtio_net_primary_should_be_hidden(DeviceListener *listener,
-                                               QemuOpts *device_opts)
+static bool virtio_net_primary_should_be_hidden(DeviceListener *listener,
+                                                QemuOpts *device_opts)
 {
     VirtIONet *n = container_of(listener, VirtIONet, primary_listener);
-    bool match_found = false;
-    bool hide = false;
+    bool hide;
     const char *standby_id;
 
     if (!device_opts) {
-        return -1;
+        return false;
     }
     standby_id = qemu_opt_get(device_opts, "failover_pair_id");
-    if (g_strcmp0(standby_id, n->netclient_name) == 0) {
-        match_found = true;
-    } else {
-        match_found = false;
-        hide = false;
-        goto out;
+    if (g_strcmp0(standby_id, n->netclient_name) != 0) {
+        return false;
     }
 
     /* failover_primary_hidden is set during feature negotiation */
@@ -3188,15 +3183,7 @@ static int virtio_net_primary_should_be_hidden(DeviceListener *listener,
     if (!n->primary_device_id) {
         warn_report("primary_device_id not set");
     }
-
-out:
-    if (match_found && hide) {
-        return 1;
-    } else if (match_found && !hide) {
-        return 0;
-    } else {
-        return -1;
-    }
+    return hide;
 }
 
 static void virtio_net_device_realize(DeviceState *dev, Error **errp)
-- 
MST


