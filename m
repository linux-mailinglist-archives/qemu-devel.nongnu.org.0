Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5084450B7
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 09:58:20 +0100 (CET)
Received: from localhost ([::1]:46914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miYZf-0001WD-Hs
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 04:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1miYY1-0007iq-Dw
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 04:56:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1miYXy-0000mH-Tj
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 04:56:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636016193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PI2ts8aoXAn7uiB2ZKdC79AUPJ9pt39aCljcKr0Qupw=;
 b=ht9b5Mnel0vENnFiNY3h0uGM26yCn/5e+J5dGDh30CAeQ3SAXR70zVbGg869lIq7KmOl19
 Q/9dnT19rUfX19KR6nntPpRVRAuNIHkMuLLgCuM6P2mq1tdba5T0C1HCUXkYHaAVuHYkav
 lAjrvHbtGoQm4CVElC5hxLmkzHcr1QM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-bqZ2xQa9OFiuWJR9xIJR7g-1; Thu, 04 Nov 2021 04:56:32 -0400
X-MC-Unique: bqZ2xQa9OFiuWJR9xIJR7g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3B67CC621
 for <qemu-devel@nongnu.org>; Thu,  4 Nov 2021 08:56:31 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6E5C100239F;
 Thu,  4 Nov 2021 08:56:30 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/2] vhost: Rename last_index to vq_index_end
Date: Thu,  4 Nov 2021 09:56:24 +0100
Message-Id: <20211104085625.2054959-2-eperezma@redhat.com>
In-Reply-To: <20211104085625.2054959-1-eperezma@redhat.com>
References: <20211104085625.2054959-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The doc of this field pointed out that last_index is the last vq index.
This is misleading, since it's actually one past the end of the vqs.

Renaming and modifying comment.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 include/hw/virtio/vhost.h | 4 ++--
 hw/net/vhost_net.c        | 4 ++--
 hw/virtio/vhost-vdpa.c    | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 3fa0b554ef..58a73e7b7a 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -74,8 +74,8 @@ struct vhost_dev {
     unsigned int nvqs;
     /* the first virtqueue which would be used by this vhost dev */
     int vq_index;
-    /* the last vq index for the virtio device (not vhost) */
-    int last_index;
+    /* one past the last vq index for the virtio device (not vhost) */
+    int vq_index_end;
     /* if non-zero, minimum required value for max_queues */
     int num_queues;
     uint64_t features;
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 0d888f29a6..29f2c4212f 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -232,10 +232,10 @@ fail:
 }
 
 static void vhost_net_set_vq_index(struct vhost_net *net, int vq_index,
-                                   int last_index)
+                                   int vq_index_end)
 {
     net->dev.vq_index = vq_index;
-    net->dev.last_index = last_index;
+    net->dev.vq_index_end = vq_index_end;
 }
 
 static int vhost_net_start_one(struct vhost_net *net,
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 0d8051426c..bcaf00e09f 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -645,7 +645,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
         vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
     }
 
-    if (dev->vq_index + dev->nvqs != dev->last_index) {
+    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
         return 0;
     }
 
-- 
2.27.0


