Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF8B2D32FB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:09:47 +0100 (CET)
Received: from localhost ([::1]:57962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjIw-0007DK-CY
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:09:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmilP-0005SK-C4
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmilN-00050g-Ct
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fWdn60YXLAPyXZe/D6icm9/1W6OTKOnwy4q/Y4bmQPM=;
 b=dBD6y+7qTb1kAZYiaYAf/zLP1PXKNBgiz3tkq5/B1JVurEGefZ3EPdBUgSiY/uq56x9Ajy
 uThdrGC4nVkypRI/+ePiJk5kMG+J5xMaCwnmC32LScj/Cm3AO0Ql3GmpdkVqJGlbuJFiUT
 mQqOV4extSbdqfyfzv+A/0/cE2rWK7A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-YYG6PVNHOQqpJXneYtZPmw-1; Tue, 08 Dec 2020 14:35:01 -0500
X-MC-Unique: YYG6PVNHOQqpJXneYtZPmw-1
Received: by mail-wr1-f69.google.com with SMTP id y5so2616742wrs.15
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:35:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fWdn60YXLAPyXZe/D6icm9/1W6OTKOnwy4q/Y4bmQPM=;
 b=GEoKNjrPqMvzV2FkSY9ehNhlPOJik3xuhEackqvpbTXhxvEhmR29Jio1To7EQFp9au
 v7kgpHHBR8sMQoN4LjvVkoJBov+nzz3RfRumJUaQVCLpwl3kDqZMqHgqbvXkfKytQkfm
 ZXKjK3DwYQmi8L1Yqyyeqm05570wYJo9asjNWX290JB0C3ohq1hxCrxMyp3pElFxIgvG
 ISgcWvrC3D2FXkFchgeNZn4pYPkBTApzlfN/H1YZZpxyVUonsTuKLNC1O4B4Ekn5PIXP
 DFpJ/Dv/SY7V3mukmLryGnRMTD6KmGyOwvJcK3OZL8U6U0mjFZCkoJgJbud6VxpOXeZc
 cVJQ==
X-Gm-Message-State: AOAM532jy5BqYBv6X2FHW2q+cw+Yjg+IiKyu56vBu0N+q2veSJjo5iQw
 XzJzwqvHZcV4/HDJg0ldwkR1AE636bxd0ahlpDAgUqB1zwM04Q36rBWnQTr5mckNQsX1OS2kgz3
 yGwld1UzomPAVWHgkkDfjOhMtgkQ4mQD07EAnNdiRerXYHT8HoWd3ll2ndy9A
X-Received: by 2002:adf:f881:: with SMTP id u1mr26209721wrp.103.1607456099311; 
 Tue, 08 Dec 2020 11:34:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXTi4Ogak4jeMvmhpuAGueB7TJtWnR4qxkVGh7qO62haI8E3x5iSp1syxMVOZTpmTXtYUFbw==
X-Received: by 2002:adf:f881:: with SMTP id u1mr26209699wrp.103.1607456099087; 
 Tue, 08 Dec 2020 11:34:59 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id c190sm5120608wme.19.2020.12.08.11.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:34:58 -0800 (PST)
Date: Tue, 8 Dec 2020 14:34:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/66] failover: Remove primary_device_opts
Message-ID: <20201208193307.646726-26-mst@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

It was really only used once, in failover_add_primary().  Just search
for it on global opts when it is needed.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-11-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio-net.h |  1 -
 hw/net/virtio-net.c            | 21 +++++----------------
 2 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index ca68be759f..7159e6c0a0 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -202,7 +202,6 @@ struct VirtIONet {
     AnnounceTimer announce_timer;
     bool needs_vnet_hdr_swap;
     bool mtu_bypass_backend;
-    QemuOpts *primary_device_opts;
     QDict *primary_device_dict;
     DeviceState *primary_dev;
     char *primary_device_id;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index e334f05352..2a99b0e0f6 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -791,17 +791,17 @@ static inline uint64_t virtio_net_supported_guest_offloads(VirtIONet *n)
 static void failover_add_primary(VirtIONet *n, Error **errp)
 {
     Error *err = NULL;
+    QemuOpts *opts;
 
     if (n->primary_dev) {
         return;
     }
 
-    n->primary_device_opts = qemu_opts_find(qemu_find_opts("device"),
-                                            n->primary_device_id);
-    if (n->primary_device_opts) {
-        n->primary_dev = qdev_device_add(n->primary_device_opts, &err);
+    opts = qemu_opts_find(qemu_find_opts("device"), n->primary_device_id);
+    if (opts) {
+        n->primary_dev = qdev_device_add(opts, &err);
         if (err) {
-            qemu_opts_del(n->primary_device_opts);
+            qemu_opts_del(opts);
         }
     } else {
         error_setg(errp, "Primary device not found");
@@ -856,7 +856,6 @@ static DeviceState *virtio_connect_failover_devices(VirtIONet *n, Error **errp)
     prim_dev = virtio_net_find_primary(n, &err);
     if (prim_dev) {
         n->primary_device_id = g_strdup(prim_dev->id);
-        n->primary_device_opts = prim_dev->opts;
     } else {
         error_propagate(errp, err);
     }
@@ -3113,14 +3112,6 @@ static bool failover_replug_primary(VirtIONet *n, Error **errp)
     if (!pdev->partially_hotplugged) {
         return true;
     }
-    if (!n->primary_device_opts) {
-        n->primary_device_opts = qemu_opts_from_qdict(qemu_find_opts("device"),
-                                                      n->primary_device_dict,
-                                                      errp);
-        if (!n->primary_device_opts) {
-            return false;
-        }
-    }
     primary_bus = n->primary_dev->parent_bus;
     if (!primary_bus) {
         error_setg(errp, "virtio_net: couldn't find primary bus");
@@ -3211,8 +3202,6 @@ static int virtio_net_primary_should_be_hidden(DeviceListener *listener,
         goto out;
     }
 
-    n->primary_device_opts = device_opts;
-
     /* failover_primary_hidden is set during feature negotiation */
     hide = qatomic_read(&n->failover_primary_hidden);
 
-- 
MST


