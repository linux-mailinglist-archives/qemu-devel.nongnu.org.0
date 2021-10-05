Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB76422E0C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:34:50 +0200 (CEST)
Received: from localhost ([::1]:58904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnOz-0005FW-Ah
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:34:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmsp-0000B4-EP
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmsl-0004xe-Jf
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d/UhAX8qqzFfBbaE8CkU4RYO+sribXdFP+HxFT6ht6I=;
 b=IqqASnyorCUDzL7BmN1VZuAFdKMd7/8B8GwCFVcC6ad6R2cIgDW3Oj5JbW+hT5qk37lkGB
 fCLqhMzkA3XW4T+0QuSAAYsqPBHqosGzJSa4w9fzR2oob8OpBfoW5qfI46wXeRl6CDtEOL
 4t42E917IKczIisc5DENGAW6pOwk9oA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-BhFGMh-NMJyvX0ngxTh6YA-1; Tue, 05 Oct 2021 12:01:27 -0400
X-MC-Unique: BhFGMh-NMJyvX0ngxTh6YA-1
Received: by mail-wr1-f71.google.com with SMTP id
 d13-20020adfa34d000000b00160aa1cc5f1so2191510wrb.14
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:01:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=d/UhAX8qqzFfBbaE8CkU4RYO+sribXdFP+HxFT6ht6I=;
 b=o/on5erBez5GRyF/nT0oEchdXyTUXyO8niVF5rTYwXnPy8kkNkf0B3Ud5YaSv/j6/0
 QgaGNy1mDDlyQuhxt4LtfrlwhIHAuvUfdlXEkQ4DfWd8JxfidKCnFZ2J7qZ0F9VhV42R
 fZ+FcngdGwM/6Aj7oQyo2noMPlKZrPdQJtRrw4+WfqpKMaYiEX3yCAgBdAq4lO+n1VJ0
 2FFobOvo03KChVjyfe3IoZyQEdRg9YUHquOopd2ylPr7wDDN+hlNuse4pDlKL6mgcrI+
 NznbAAqLzIlfMV+Xda8CzCalcg4So/QmNd9E6nWZG5gZQcTZttxXON5xLTlcS9vZfhGD
 UZVw==
X-Gm-Message-State: AOAM533UnO7iQOVlWYVZ7Y9kWuqeDML+0LTXhPZi0NSvlT6V7PN5pK5Y
 1fQOQfGDHc7y40JxSufvOPRHFmvBUA31L700lsOHihT5xEpEwQ+XI4PaEjW/Fy6DWZYV7Mvfyd+
 VGwZH5o7+jTrPlySoK/YhTkOuBKvcIUex3sRGv4N4q3Ihsbq/yWjBrdolb6eR
X-Received: by 2002:adf:9c02:: with SMTP id f2mr22811452wrc.329.1633449682669; 
 Tue, 05 Oct 2021 09:01:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDzUe2ztA8MzCq8L1earx//op71m8Suoy8MFnQ+ITQ9GbWM4SGUVebmgi9Bxy7iAzb/vLX7A==
X-Received: by 2002:adf:9c02:: with SMTP id f2mr22810906wrc.329.1633449678762; 
 Tue, 05 Oct 2021 09:01:18 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id r9sm18084430wru.2.2021.10.05.09.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:01:18 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:01:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/57] vhost: record the last virtqueue index for the virtio
 device
Message-ID: <20211005155946.513818-11-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

This patch introduces a new field in the vhost_dev structure to record
the last virtqueue index for the virtio device. This will be useful
for the vhost backends with 1:N model to start or stop the device
after all the vhost_dev structures were started or stopped.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20210907090322.1756-9-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost.h |  2 ++
 hw/net/vhost_net.c        | 12 +++++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 1a9fc65089..3fa0b554ef 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -74,6 +74,8 @@ struct vhost_dev {
     unsigned int nvqs;
     /* the first virtqueue which would be used by this vhost dev */
     int vq_index;
+    /* the last vq index for the virtio device (not vhost) */
+    int last_index;
     /* if non-zero, minimum required value for max_queues */
     int num_queues;
     uint64_t features;
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 2b594b4642..3aabab06ea 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -231,9 +231,11 @@ fail:
     return NULL;
 }
 
-static void vhost_net_set_vq_index(struct vhost_net *net, int vq_index)
+static void vhost_net_set_vq_index(struct vhost_net *net, int vq_index,
+                                   int last_index)
 {
     net->dev.vq_index = vq_index;
+    net->dev.last_index = last_index;
 }
 
 static int vhost_net_start_one(struct vhost_net *net,
@@ -324,9 +326,13 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
     VirtIONet *n = VIRTIO_NET(dev);
     int nvhosts = data_queue_pairs + cvq;
     struct vhost_net *net;
-    int r, e, i;
+    int r, e, i, last_index = data_qps * 2;
     NetClientState *peer;
 
+    if (!cvq) {
+        last_index -= 1;
+    }
+
     if (!k->set_guest_notifiers) {
         error_report("binding does not support guest notifiers");
         return -ENOSYS;
@@ -341,7 +347,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
         }
 
         net = get_vhost_net(peer);
-        vhost_net_set_vq_index(net, i * 2);
+        vhost_net_set_vq_index(net, i * 2, last_index);
 
         /* Suppress the masking guest notifiers on vhost user
          * because vhost user doesn't interrupt masking/unmasking
-- 
MST


