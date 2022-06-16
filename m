Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE50B54E84A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 19:02:57 +0200 (CEST)
Received: from localhost ([::1]:49256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1stU-0000Rg-OX
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 13:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o1soV-0004rA-0v
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:57:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o1soT-0001wo-AW
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:57:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655398664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mc7uv2VLQf2ThfBIf/ri1GWCRBUvhztw2qK875wgdME=;
 b=QWNpDzpZrxhmIFTIA/yMn2O6i3LeR6svFa5SkkiJHzZ4iDrlqEdxvs6Gd7dFGJnDOrES0h
 rXbiTKcN40DMhITR56AtbkjvEWcDF1I2Q2tl4HyydUdffQvMe4/Rm2yV7BYH7bAZbf5P2t
 Xkc8wgs/9z22VffJOxeXhYdxlFdlhBw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-lDNO-jUzPTWrt3qp0sE24A-1; Thu, 16 Jun 2022 12:57:43 -0400
X-MC-Unique: lDNO-jUzPTWrt3qp0sE24A-1
Received: by mail-wm1-f72.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so1162779wmj.0
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 09:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Mc7uv2VLQf2ThfBIf/ri1GWCRBUvhztw2qK875wgdME=;
 b=UToWtyM5sSg5m3YkptVdywCiGlXCfkByx3QmS4QbNHWdRSll5FiprG7X4pIvZIdk6j
 BhrNW3ychJPT6VzTOMBd3hJEmTWE2DhKLqN4gF7B9idmVL9E+3+QvikhUVyBtXmCdgAm
 nYa7XBMNd5DMdQFnh9MBbToBoPWVFx3qfItKfiWXfzxXNkLJ/IeCs/q8LRYJIijfBwuc
 pFU5rZm2kDNsMSBv+X1JaVai1S9MKAG1X4WAbvNP0Q0U9zQ7eRx6LuoLlbXr3Unes6vD
 1+jcyskbcwI6TvD5j1uAMfTCIPNOIDpei4WPEKwrw4vMYZmf0BQfWH6OMZPqp/8NmkIf
 oLXg==
X-Gm-Message-State: AJIora8khB/RwrCt0xK3plBsbxEw0LwSKEAiBmWhy8roBsJhrfFot2ae
 OCWT6JdClx/M5X8D2h7ytxTBTf/qBN+qU/BZ9wDiV8Ja1yXW8Vnfk921EtdBDcU9pQC6xO7Wyvr
 PDQ4ztRWJR6cLypR6JANq9LwUNiljp6OK4PCjJh5sr6mfrZyZPt4e+tXgeCFb
X-Received: by 2002:a05:6000:1c02:b0:218:42ab:281f with SMTP id
 ba2-20020a0560001c0200b0021842ab281fmr5534973wrb.607.1655398662301; 
 Thu, 16 Jun 2022 09:57:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1udAv3KNlA/tQTQ4I4dSHIRegRvAYHTuCRt2n9vG86D42R5cL5i7gk3JT6OsDSE2O5/9m1raA==
X-Received: by 2002:a05:6000:1c02:b0:218:42ab:281f with SMTP id
 ba2-20020a0560001c0200b0021842ab281fmr5534950wrb.607.1655398662066; 
 Thu, 16 Jun 2022 09:57:42 -0700 (PDT)
Received: from redhat.com ([2.53.13.204]) by smtp.gmail.com with ESMTPSA id
 g9-20020a5d6989000000b0020c5253d8dcsm2307998wru.40.2022.06.16.09.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 09:57:41 -0700 (PDT)
Date: Thu, 16 Jun 2022 12:57:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Eric Auger <eric.auger@redhat.com>
Subject: [PULL 06/10] virtio-iommu: Use recursive lock to avoid deadlock
Message-ID: <20220616165703.42226-7-mst@redhat.com>
References: <20220616165703.42226-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616165703.42226-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhenzhong Duan <zhenzhong.duan@intel.com>

When switching address space with mutex lock hold, mapping will be
replayed for assigned device. This will trigger relock deadlock.

Also release the mutex resource in unrealize routine.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Message-Id: <20220613061010.2674054-3-zhenzhong.duan@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio-iommu.h |  2 +-
 hw/virtio/virtio-iommu.c         | 20 +++++++++++---------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index 102eeefa73..2ad5ee320b 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -58,7 +58,7 @@ struct VirtIOIOMMU {
     ReservedRegion *reserved_regions;
     uint32_t nb_reserved_regions;
     GTree *domains;
-    QemuMutex mutex;
+    QemuRecMutex mutex;
     GTree *endpoints;
     bool boot_bypass;
 };
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index ff718107ee..73d5bde9d1 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -78,7 +78,7 @@ static bool virtio_iommu_device_bypassed(IOMMUDevice *sdev)
 
     sid = virtio_iommu_get_bdf(sdev);
 
-    qemu_mutex_lock(&s->mutex);
+    qemu_rec_mutex_lock(&s->mutex);
     /* need to check bypass before system reset */
     if (!s->endpoints) {
         bypassed = s->config.bypass;
@@ -93,7 +93,7 @@ static bool virtio_iommu_device_bypassed(IOMMUDevice *sdev)
     }
 
 unlock:
-    qemu_mutex_unlock(&s->mutex);
+    qemu_rec_mutex_unlock(&s->mutex);
     return bypassed;
 }
 
@@ -745,7 +745,7 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
             tail.status = VIRTIO_IOMMU_S_DEVERR;
             goto out;
         }
-        qemu_mutex_lock(&s->mutex);
+        qemu_rec_mutex_lock(&s->mutex);
         switch (head.type) {
         case VIRTIO_IOMMU_T_ATTACH:
             tail.status = virtio_iommu_handle_attach(s, iov, iov_cnt);
@@ -774,7 +774,7 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
         default:
             tail.status = VIRTIO_IOMMU_S_UNSUPP;
         }
-        qemu_mutex_unlock(&s->mutex);
+        qemu_rec_mutex_unlock(&s->mutex);
 
 out:
         sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
@@ -862,7 +862,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     sid = virtio_iommu_get_bdf(sdev);
 
     trace_virtio_iommu_translate(mr->parent_obj.name, sid, addr, flag);
-    qemu_mutex_lock(&s->mutex);
+    qemu_rec_mutex_lock(&s->mutex);
 
     ep = g_tree_lookup(s->endpoints, GUINT_TO_POINTER(sid));
     if (!ep) {
@@ -946,7 +946,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     trace_virtio_iommu_translate_out(addr, entry.translated_addr, sid);
 
 unlock:
-    qemu_mutex_unlock(&s->mutex);
+    qemu_rec_mutex_unlock(&s->mutex);
     return entry;
 }
 
@@ -1035,7 +1035,7 @@ static void virtio_iommu_replay(IOMMUMemoryRegion *mr, IOMMUNotifier *n)
 
     sid = virtio_iommu_get_bdf(sdev);
 
-    qemu_mutex_lock(&s->mutex);
+    qemu_rec_mutex_lock(&s->mutex);
 
     if (!s->endpoints) {
         goto unlock;
@@ -1049,7 +1049,7 @@ static void virtio_iommu_replay(IOMMUMemoryRegion *mr, IOMMUNotifier *n)
     g_tree_foreach(ep->domain->mappings, virtio_iommu_remap, mr);
 
 unlock:
-    qemu_mutex_unlock(&s->mutex);
+    qemu_rec_mutex_unlock(&s->mutex);
 }
 
 static int virtio_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu_mr,
@@ -1167,7 +1167,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
     virtio_add_feature(&s->features, VIRTIO_IOMMU_F_PROBE);
     virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS_CONFIG);
 
-    qemu_mutex_init(&s->mutex);
+    qemu_rec_mutex_init(&s->mutex);
 
     s->as_by_busptr = g_hash_table_new_full(NULL, NULL, NULL, g_free);
 
@@ -1195,6 +1195,8 @@ static void virtio_iommu_device_unrealize(DeviceState *dev)
         g_tree_destroy(s->endpoints);
     }
 
+    qemu_rec_mutex_destroy(&s->mutex);
+
     virtio_delete_queue(s->req_vq);
     virtio_delete_queue(s->event_vq);
     virtio_cleanup(vdev);
-- 
MST


