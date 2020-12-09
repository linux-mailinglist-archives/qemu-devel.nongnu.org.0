Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446C22D4973
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:50:42 +0100 (CET)
Received: from localhost ([::1]:49812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4Xx-0005Oo-AZ
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:50:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3uY-0003lC-4P
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3uV-0008VQ-3E
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/6JOcPhUQFqc1kwmdgubQXhnbQ6P3mfE5pWlvANh7JM=;
 b=Or6EFxGj+HJMivz+njq7OhGGH90tz4A6vE9wvYIDWc99kx+jQbZaY89ibt3hq2lk3WEt6X
 nmQC/VfcclEL+y7NY+AUfIpm78nIpYO+3K8K9Rohk2VwzKLOfv/WEfF0iJF0cMX+1hhvzN
 QcqAUVcWiuPB883jyB92uaqzdEMdrtc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-in2xHAOjNsO4bZ8BIS_i6g-1; Wed, 09 Dec 2020 13:09:51 -0500
X-MC-Unique: in2xHAOjNsO4bZ8BIS_i6g-1
Received: by mail-wm1-f71.google.com with SMTP id z12so865700wmf.9
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:09:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/6JOcPhUQFqc1kwmdgubQXhnbQ6P3mfE5pWlvANh7JM=;
 b=olxwPyyF5qIzfvaB0H5r2s2OiVBTPOM9sLoPN8y7+Chsd1eij6gQ2b+A/LOVIzCdWf
 s6UgZpwMzeMhA4gXd/y7EcemiI1Iy+hVhEinbVd7NfrnfKvINoaJWnNh/bYAW7OI1a2L
 lrEeBMAslTN//4ED2xkJUVoQRd7T15Hc9kD3KeyYbckoMdr2+YPaHs03Gl3JDYfo2lRz
 yMI9EHnH2ASIejo6PmWLRMvBh3PS7BU55gcFOV8cw8y5cqAvNY8E8UqBwY5DBABU0/3M
 AYZ4Z/8X1URZmhXORXzrQV5sLTTpHEGLGNB87QUrMiM7Vk8uj+YAwyvPaWFmPztSCKAw
 Wc7g==
X-Gm-Message-State: AOAM533b8bYi5z3T8TjiAp7Iqvbxfs/iKpuV1yHkypZXplUpxLUS/Qjl
 xmAR1/tzDuOhGzfb0apKPEkAQbembrZLGnWbJs5i6pZcbDXcgvXXmCxdF3DKMHSmd0t2BwUglbx
 ZiLLSj9fcTvHlKK9LCCZwrLRjbWQWF3GxsJtmwJDbgKyxjZJXKdmMKjtqnAtT
X-Received: by 2002:a7b:cbd0:: with SMTP id n16mr4106932wmi.162.1607537389665; 
 Wed, 09 Dec 2020 10:09:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxScf2zYuQkKLrtV5IUJ4SRkqZX6zcGR2BPok/n4WpmnJOUG1WUYKpcjezw7y8i3D+4id2tA==
X-Received: by 2002:a7b:cbd0:: with SMTP id n16mr4106910wmi.162.1607537389472; 
 Wed, 09 Dec 2020 10:09:49 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id i18sm1110327wrp.74.2020.12.09.10.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:09:48 -0800 (PST)
Date: Wed, 9 Dec 2020 13:09:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 42/65] failover: Remove primary_dev member
Message-ID: <20201209180546.721296-43-mst@redhat.com>
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


