Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E763514F7
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 15:01:12 +0200 (CEST)
Received: from localhost ([::1]:37542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRwwh-0006pH-Fi
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 09:01:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <admin@C02CQ3PXMD6P.localdomain>)
 id 1lRwu2-0005LO-U0
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:58:26 -0400
Received: from [139.177.225.236] (port=57457 helo=C02CQ3PXMD6P.localdomain)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <admin@C02CQ3PXMD6P.localdomain>) id 1lRwu0-0004Sj-Ed
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:58:26 -0400
Received: by C02CQ3PXMD6P.localdomain (Postfix, from userid 501)
 id 021078009F4; Thu,  1 Apr 2021 17:26:18 +0800 (CST)
From: Wentao Fan <fanwentao.0130@bytedance.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/virtio: remove redundant code
Date: Thu,  1 Apr 2021 17:23:41 +0800
Message-Id: <20210401092340.84447-1-fanwentao.0130@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 139.177.225.236 (failed)
Received-SPF: none client-ip=139.177.225.236;
 envelope-from=admin@C02CQ3PXMD6P.localdomain; helo=C02CQ3PXMD6P.localdomain
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NO_DNS_FOR_FROM=0.001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: jasowang@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Fan Wentao <fanwentao.0130@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fan Wentao <fanwentao.0130@bytedance.com>

Signed-off-by: Wentao Fan <fanwentao.0130@bytedance.com>
---
 hw/virtio/virtio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 07f4e60b30..aa5c283102 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -173,8 +173,7 @@ static void virtio_init_region_cache(VirtIODevice *vdev, int n)
     }
     new = g_new0(VRingMemoryRegionCaches, 1);
     size = virtio_queue_get_desc_size(vdev, n);
-    packed = virtio_vdev_has_feature(vq->vdev, VIRTIO_F_RING_PACKED) ?
-                                   true : false;
+    packed = virtio_vdev_has_feature(vq->vdev, VIRTIO_F_RING_PACKED);
     len = address_space_cache_init(&new->desc, vdev->dma_as,
                                    addr, size, packed);
     if (len < size) {
-- 
2.24.3 (Apple Git-128)


