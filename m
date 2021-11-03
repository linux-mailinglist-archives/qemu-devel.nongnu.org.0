Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01158443FD6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 11:06:04 +0100 (CET)
Received: from localhost ([::1]:44376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miD9f-0005gi-5M
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 06:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1miD5f-0007uL-1b
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 06:01:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1miD5Z-0005vp-E6
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 06:01:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635933707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zdn8h+Lyaws9/stSltRBuoMx84Im6nUPH5OEi4FOOE0=;
 b=GtEdNT3RgaGAMdEknDjQFn4h+/Vlot+Zm+iYssxS9JXXGmKOknnq1GvRgmQ+Ufe26qtjb4
 +wzOuiTO1Pb+3Uz8jKScj9+F+WQCHewo37z/IniV+yjYORlXy/B12oqG1jOzODTEYPtNVC
 YjMkRAgI2Ncg6LDPOz1X3KA25jgB7PM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-pjRVTiTiOeaBSJzDI5XAWA-1; Wed, 03 Nov 2021 06:01:45 -0400
X-MC-Unique: pjRVTiTiOeaBSJzDI5XAWA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0884D100A640
 for <qemu-devel@nongnu.org>; Wed,  3 Nov 2021 10:01:45 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA9305D9DE;
 Wed,  3 Nov 2021 10:01:42 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] vhost: Rename last_index to last_vq_index
Date: Wed,  3 Nov 2021 11:01:30 +0100
Message-Id: <20211103100131.1983272-2-eperezma@redhat.com>
In-Reply-To: <20211103100131.1983272-1-eperezma@redhat.com>
References: <20211103100131.1983272-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

The doc of this field points out that last_index is the last vq index.
Since last_index can cause confusion if seen out of context, renaming
to last_vq_index, aligning with vq_index.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost.h | 2 +-
 hw/net/vhost_net.c        | 4 ++--
 hw/virtio/vhost-vdpa.c    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 3fa0b554ef..8a79833b54 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -75,7 +75,7 @@ struct vhost_dev {
     /* the first virtqueue which would be used by this vhost dev */
     int vq_index;
     /* the last vq index for the virtio device (not vhost) */
-    int last_index;
+    int last_vq_index;
     /* if non-zero, minimum required value for max_queues */
     int num_queues;
     uint64_t features;
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 0d888f29a6..081946dc93 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -232,10 +232,10 @@ fail:
 }
 
 static void vhost_net_set_vq_index(struct vhost_net *net, int vq_index,
-                                   int last_index)
+                                   int last_vq_index)
 {
     net->dev.vq_index = vq_index;
-    net->dev.last_index = last_index;
+    net->dev.last_vq_index = last_vq_index;
 }
 
 static int vhost_net_start_one(struct vhost_net *net,
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 12661fd5b1..a1831b27ca 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -632,7 +632,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
         vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
     }
 
-    if (dev->vq_index + dev->nvqs != dev->last_index) {
+    if (dev->vq_index + dev->nvqs != dev->last_vq_index) {
         return 0;
     }
 
-- 
2.27.0


