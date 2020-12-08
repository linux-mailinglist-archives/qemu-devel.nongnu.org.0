Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2332D32F9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:08:27 +0100 (CET)
Received: from localhost ([::1]:53390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjHe-0005IJ-SV
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:08:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmimX-000703-1G
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:36:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmimU-0005b7-47
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:36:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/6JOcPhUQFqc1kwmdgubQXhnbQ6P3mfE5pWlvANh7JM=;
 b=V9IoESIBFOQnOGjQodRKZMy4w6fdF8V29S5Ez9SGXu6ABf3Bdg2jW+5XzdW6pPIx65uvs1
 qPbgX017p2LuxbpJu0tfhJ1yg2A1UlNwm3yPJBLT+I4mk2hRuZ4jCUqzTWqb7KrnT6OKC3
 m10eGliig1nRXglSYPT+D/wOKqxI9LE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-zevb5agbOSW9Agvg8Fs4Hg-1; Tue, 08 Dec 2020 14:36:11 -0500
X-MC-Unique: zevb5agbOSW9Agvg8Fs4Hg-1
Received: by mail-wr1-f71.google.com with SMTP id q18so1161505wrc.20
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:36:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/6JOcPhUQFqc1kwmdgubQXhnbQ6P3mfE5pWlvANh7JM=;
 b=pxyJ3mvyuzDO9EyDCgiD2nvCut1cBYTnK0KkPmZDACoTzhhqce2QDHBADUe/jFLGbe
 wRLa4FBt8YIW1xBVCtNUqA5enOK5qM6wnaoZI8YnH3cZkKgtAh1lZAHVUorwTV1Tyf8V
 Gdr2i9q9fElBzxFNgj3OidLlBn5qRH0SkqJjWq9fTXtkILNitudFbFyGQeJ5Y5kXRpK1
 WrnWsEE7Dmw60/mrPxZiaxhDgvisqpz+LaePD6oxLehAS59Nxhgd/BOMTaOtjom6xBcv
 P0+THZt+0WlzoGNlfFa6LOvW1KySWezEWscY1QzFt8z2Lp5wBZbhxWZW+WDV4AY8ebKF
 qjMg==
X-Gm-Message-State: AOAM532dRaDIHCysok9VL4hqZs9vt36S/AhDbx0JfB6VKRrIhtKs52n2
 8JPQr6MKfhUxFZWQwdflCxqmDNUgM9CFmk9eiEAPVdKqnkyPJ5dWdcPwhtbGDNvBvlCnCe9RsBu
 IbgpT6CBUFWeb73uDFdCiiJqGnRPkuXCzYi/Sz1VwuhA/FgVAPCPJDMJiqgnl
X-Received: by 2002:adf:dc8d:: with SMTP id r13mr5905726wrj.325.1607456168727; 
 Tue, 08 Dec 2020 11:36:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTAg96c8huD9QsAgUJjDeKLczhkeXLlZaP0qI1VAiddWfnoHFfxULnFgdLDMlg8nBFq9CWFg==
X-Received: by 2002:adf:dc8d:: with SMTP id r13mr5905707wrj.325.1607456168499; 
 Tue, 08 Dec 2020 11:36:08 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id l1sm15998448wrq.64.2020.12.08.11.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:36:07 -0800 (PST)
Date: Tue, 8 Dec 2020 14:36:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 42/66] failover: Remove primary_dev member
Message-ID: <20201208193307.646726-43-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Juan Quintela <quintela@redhat.com>

Only three uses remained, and we can remove them on that case.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-28-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio-net.h |  1 -
 hw/net/virtio-net.c            | 75 +++++++++++++++-------------------
 2 files changed, 34 insertions(+), 42 deletions(-)

diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index efef64e02f..7e96d193aa 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -202,7 +202,6 @@ struct VirtIONet {
     AnnounceTimer announce_timer;
     bool needs_vnet_hdr_swap;
     bool mtu_bypass_backend;
-    DeviceState *primary_dev;
     /* primary failover device is hidden*/
     bool failover_primary_hidden;
     bool failover;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 9203d81780..044ac95f6f 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -832,35 +832,6 @@ static char *failover_find_primary_device_id(VirtIONet *n)
     return fid.id;
 }
 
-static void failover_add_primary(VirtIONet *n, Error **errp)
-{
-    Error *err = NULL;
-    QemuOpts *opts;
-    char *id;
-
-    if (n->primary_dev) {
-        return;
-    }
-
-    id = failover_find_primary_device_id(n);
-    if (!id) {
-        return;
-    }
-    opts = qemu_opts_find(qemu_find_opts("device"), id);
-    if (opts) {
-        n->primary_dev = qdev_device_add(opts, &err);
-        if (err) {
-            qemu_opts_del(opts);
-        }
-    } else {
-        error_setg(errp, "Primary device not found");
-        error_append_hint(errp, "Virtio-net failover will not work. Make "
-                          "sure primary device has parameter"
-                          " failover_pair_id=<virtio-net-id>\n");
-    }
-    error_propagate(errp, err);
-}
-
 /**
  * Find the primary device for this failover virtio-net
  *
@@ -878,6 +849,36 @@ static DeviceState *failover_find_primary_device(VirtIONet *n)
     return qdev_find_recursive(sysbus_get_default(), id);
 }
 
+static void failover_add_primary(VirtIONet *n, Error **errp)
+{
+    Error *err = NULL;
+    QemuOpts *opts;
+    char *id;
+    DeviceState *dev = failover_find_primary_device(n);
+
+    if (dev) {
+        return;
+    }
+
+    id = failover_find_primary_device_id(n);
+    if (!id) {
+        return;
+    }
+    opts = qemu_opts_find(qemu_find_opts("device"), id);
+    if (opts) {
+        dev = qdev_device_add(opts, &err);
+        if (err) {
+            qemu_opts_del(opts);
+        }
+    } else {
+        error_setg(errp, "Primary device not found");
+        error_append_hint(errp, "Virtio-net failover will not work. Make "
+                          "sure primary device has parameter"
+                          " failover_pair_id=<virtio-net-id>\n");
+    }
+    error_propagate(errp, err);
+}
+
 static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
@@ -933,19 +934,9 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
         qatomic_set(&n->failover_primary_hidden, false);
         failover_add_primary(n, &err);
         if (err) {
-            n->primary_dev = failover_find_primary_device(n);
-            failover_add_primary(n, &err);
-            if (err) {
-                goto out_err;
-            }
+            warn_report_err(err);
         }
     }
-    return;
-
-out_err:
-    if (err) {
-        warn_report_err(err);
-    }
 }
 
 static int virtio_net_handle_rx_mode(VirtIONet *n, uint8_t cmd,
@@ -3420,13 +3411,15 @@ static int virtio_net_pre_save(void *opaque)
 static bool primary_unplug_pending(void *opaque)
 {
     DeviceState *dev = opaque;
+    DeviceState *primary;
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIONet *n = VIRTIO_NET(vdev);
 
     if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_STANDBY)) {
         return false;
     }
-    return n->primary_dev ? n->primary_dev->pending_deleted_event : false;
+    primary = failover_find_primary_device(n);
+    return primary ? primary->pending_deleted_event : false;
 }
 
 static bool dev_unplug_pending(void *opaque)
-- 
MST


