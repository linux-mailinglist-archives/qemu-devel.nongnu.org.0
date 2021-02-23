Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 099A5322E65
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 17:09:57 +0100 (CET)
Received: from localhost ([::1]:40056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEaG3-0003AE-M8
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 11:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaBv-0006AE-Jc
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:05:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaBs-0004TA-IW
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:05:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614096335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=slEkeZRS7F5sRp+gw4b6tu0+vbYrmEHO5ckjkPv8F4Y=;
 b=VBAYJ0sovbYKmCurE2ey1KYT7685pqesY7JaYhEa2VrI6DEQgnj7xQpF4BpB1zQf5s1nIj
 5tDeh5hatVQ2VWT8VUYFGXPbQ9ooXrZeMhm2OVtnhZ8W6XM4KzPSZPlRzzS1wYX/Ac5GYX
 j89mimwIIu97AfgZlMvW7/+Rq2fw7hg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-oHvJ4ivXO8es22og9A2eUQ-1; Tue, 23 Feb 2021 11:03:51 -0500
X-MC-Unique: oHvJ4ivXO8es22og9A2eUQ-1
Received: by mail-wm1-f71.google.com with SMTP id 13so826754wmk.0
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 08:03:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=slEkeZRS7F5sRp+gw4b6tu0+vbYrmEHO5ckjkPv8F4Y=;
 b=ZNJimraJc1oUBLcYvtHBxtQa76gcogq5jqYUZGU9O/zZJE4WftcnksAbDYXeLNelpo
 7n5sgpc/WxPWtHGl10OeYuw42YYZtv0/CMgEv0l1xyckw4ScZdHOWzh0ccZ/OFNvu7O6
 xue3UC4SsaJc4+6WvGlbAbLfD8rIDxHSkGvaZLkyMY2+IBkPTF2nb/1tWOfeovTe3qPK
 NoPkNtasRTDpp8zf7UpjAyW0CPdYvrFpRVOHcwc2Fcc8rqUa3NvBfxKJiHz7IAvyfPE0
 /2GJP9tc3TL5GOZ0t3GaHujcrcoPkVw3xjhWJJmk59lJVKVF25r+1q9r3iLtfEVKDZzC
 Ztjg==
X-Gm-Message-State: AOAM531BsThQXQropQIY4eVPXO45m/dxsyTdx2FRxRYH2cU/ABtT4MH7
 IY0xuX9dXg1KAlKrQwBRQHYFnr+IwpoPM6Vv384SHhHRt+pYYWA7LsP3+1D88aPaLGxM/lqNQ7P
 yKrMjsmLpuRcL4K4m3MceKWftvPCZU2XQrwSx2VvhYpJA4ubtTjLJzT2qrQtX
X-Received: by 2002:adf:d850:: with SMTP id k16mr24790364wrl.10.1614096229707; 
 Tue, 23 Feb 2021 08:03:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzv5Mprdz3UKRXPg8EmaUyLayotM+6BA3eFwYdRHy6ApfLQtXOv/oYNkLovwV3FkCJMVj1eMA==
X-Received: by 2002:adf:d850:: with SMTP id k16mr24790331wrl.10.1614096229440; 
 Tue, 23 Feb 2021 08:03:49 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id h12sm39734446wru.18.2021.02.23.08.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 08:03:48 -0800 (PST)
Date: Tue, 23 Feb 2021 11:03:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/17] failover: really display a warning when the primary
 device is not found
Message-ID: <20210223160144.1507082-4-mst@redhat.com>
References: <20210223160144.1507082-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210223160144.1507082-1-mst@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

In failover_add_primary(), we search the id of the failover device by
scanning the list of the devices in the opts list to find a device with
a failover_pair_id equals to the id of the virtio-net device.

If the failover_pair_id is not found, QEMU ignores the primary
device silently (which also means it will not be hidden and
it will be enabled directly at boot).

After that, we search the id in the opts list to do a qdev_device_add()
with it. The device will be always found as otherwise we had exited
before, and thus the warning is never displayed.

Fix that by moving the error report to the first exit condition.
Also add a g_assert() to be sure the compiler will not complain
about a possibly NULL pointer.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Message-Id: <20210212135250.2738750-4-lvivier@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 1c5af08dc5..439f823b19 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -855,21 +855,19 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
 
     id = failover_find_primary_device_id(n);
     if (!id) {
-        return;
-    }
-    opts = qemu_opts_find(qemu_find_opts("device"), id);
-    if (opts) {
-        dev = qdev_device_add(opts, &err);
-        if (err) {
-            qemu_opts_del(opts);
-        } else {
-            object_unref(OBJECT(dev));
-        }
-    } else {
         error_setg(errp, "Primary device not found");
         error_append_hint(errp, "Virtio-net failover will not work. Make "
                           "sure primary device has parameter"
-                          " failover_pair_id=<virtio-net-id>\n");
+                          " failover_pair_id=%s\n", n->netclient_name);
+        return;
+    }
+    opts = qemu_opts_find(qemu_find_opts("device"), id);
+    g_assert(opts); /* cannot be NULL because id was found using opts list */
+    dev = qdev_device_add(opts, &err);
+    if (err) {
+        qemu_opts_del(opts);
+    } else {
+        object_unref(OBJECT(dev));
     }
     error_propagate(errp, err);
 }
-- 
MST


