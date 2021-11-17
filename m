Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD26F454DED
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 20:33:49 +0100 (CET)
Received: from localhost ([::1]:56548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnQgm-0006B3-Vp
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 14:33:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mnQce-0001lf-ES
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 14:29:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mnQcb-0006oC-Ko
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 14:29:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637177369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4RFJqzNNMG2W6DZd4z/geQTKqwv5HOQI87D+g3aOqMw=;
 b=hWBwnM+/mbc6xpkkvdD6wRJrmLq1dx0Cu9STpUL4X5h2tujZ67ObdESpJw7o5oZiIF1Xcc
 1GRKIMwxtEiD39i3YokxEUCGWHycHH0u6F28yGfFz3/Xt7MoV0cpdlQ5RMSU6/vuyO7kK2
 1OTcZC8lUfNONzUA3+VYNUT5NtW3QbU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-BJIxSBKqON6JPSoUy-Lx5g-1; Wed, 17 Nov 2021 14:29:27 -0500
X-MC-Unique: BJIxSBKqON6JPSoUy-Lx5g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 116A21018722
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 19:29:27 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C77E60BF1;
 Wed, 17 Nov 2021 19:29:25 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] virtio-net: Fix log message
Date: Wed, 17 Nov 2021 20:28:51 +0100
Message-Id: <20211117192851.65529-4-eperezma@redhat.com>
In-Reply-To: <20211117192851.65529-1-eperezma@redhat.com>
References: <20211117192851.65529-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The message has never been true in the case of non tap networking, so
only tell that userland networking will be used if possible.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/net/virtio-net.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 8c5c4e5a9d..5933c0961c 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -245,6 +245,7 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
     NetClientState *nc = qemu_get_queue(n->nic);
     int queue_pairs = n->multiqueue ? n->max_queue_pairs : 1;
     int cvq = n->max_ncs - n->max_queue_pairs;
+    bool tap_backend = nc->peer->info->type == NET_CLIENT_DRIVER_TAP;
 
     if (!get_vhost_net(nc->peer)) {
         return;
@@ -258,9 +259,9 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
         int r, i;
 
         if (n->needs_vnet_hdr_swap) {
-            error_report("backend does not support %s vnet headers; "
-                         "falling back on userspace virtio",
-                         virtio_is_big_endian(vdev) ? "BE" : "LE");
+            error_report("backend does not support %s vnet headers%s",
+                    virtio_is_big_endian(vdev) ? "BE" : "LE",
+                    tap_backend ? "; falling back on userspace virtio" : "");
             return;
         }
 
@@ -288,8 +289,8 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
         n->vhost_started = 1;
         r = vhost_net_start(vdev, n->nic->ncs, queue_pairs, cvq);
         if (r < 0) {
-            error_report("unable to start vhost net: %d: "
-                         "falling back on userspace virtio", -r);
+            error_report("unable to start vhost net: %d%s", -r,
+                       tap_backend ? " falling back on userspace virtio" : "");
             n->vhost_started = 0;
         }
     } else {
-- 
2.27.0


