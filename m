Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B66C6AFC13
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:19:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiOe-00065r-Sp; Tue, 07 Mar 2023 20:15:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiOE-0005sU-QX
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:14:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiOD-00026S-6c
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:14:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678238074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xKR+Q7wzkUusg5xffymHbVluJFNxgc89LXOjBTMJesM=;
 b=fhIDvfSBLRa9CQQIGDi3RjfaplbV46CEf/CzgQdiVD26mBBusqeHNpMwCfvHW1Sx7CAWtQ
 UeIlJuySZfEm4T7VEeV0WtbH3baU99ia481xvAMebf6joGGDK6SYvm2a8N7jDyknBEzOvL
 DyBr+L/8NwP4EWN9TdAuwWdBC7W1090=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-RIByHt66NHOnhUlNsNrLxQ-1; Tue, 07 Mar 2023 20:14:33 -0500
X-MC-Unique: RIByHt66NHOnhUlNsNrLxQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 v11-20020a056402348b00b004ce34232666so18105978edc.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:14:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678238072;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xKR+Q7wzkUusg5xffymHbVluJFNxgc89LXOjBTMJesM=;
 b=V7IN85GaH5VOItUin942Qqh8CYai2wVVaRGjKfpH8X/RYPgAy+51jhx0r12ER0sFjS
 ISD0xske8k4wU6COjc8KCm8G8S7jiGdzkC39v3P1apLM1xX+NVpBfZzur9lJcC6a3D+C
 YBGiAqFK/5iBeSRMDkiBum+v4kGRXIrRye6nGprH4nkfMdZkkiE8EPKb8w2mb9rJxIsN
 DFLLwU1JGVcS8vrdBGAysaypm07ETaRs7zBM280wTfJgZf3w4JlYkmVlW+450mk/OEjC
 Z38zAEiPiWHa5dwq0cEBHotNTvvSLn+I5hk2ze+Pza3uoz2m8dDIbHdzr+zBvr9Tj8Fb
 RO7w==
X-Gm-Message-State: AO0yUKVUPl2njitc0fin+t5HjQAGY8LQYbJnm61VXDck1vbomQJWj84H
 pRcVd9oy6RBRkuhYp0tp2zqyXhevA2FZjs6cYUd45t+gAhVq36B4RLCWhEXcV5vCNWal/6lqeKk
 COu/xVxcu+DjFna/g/dQHkcSK0WiWiDuUsdfgEjNHQeZCB3r7Hp/LhGku4C8h20n4D0Sj
X-Received: by 2002:a17:907:728c:b0:8b1:788f:2198 with SMTP id
 dt12-20020a170907728c00b008b1788f2198mr20524302ejc.19.1678238072039; 
 Tue, 07 Mar 2023 17:14:32 -0800 (PST)
X-Google-Smtp-Source: AK7set9uDB2t5mH3joOlL6wV6YlIZFajQIystAnVjDXCzHRKY3uZIdEYP6YDn2VFhaq4hYRua0UFsg==
X-Received: by 2002:a17:907:728c:b0:8b1:788f:2198 with SMTP id
 dt12-20020a170907728c00b008b1788f2198mr20524271ejc.19.1678238071670; 
 Tue, 07 Mar 2023 17:14:31 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 n24-20020a1709062bd800b008b17aa6afc8sm6774590ejg.30.2023.03.07.17.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:14:31 -0800 (PST)
Date: Tue, 7 Mar 2023 20:14:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Carlos =?utf-8?B?TMOzcGV6?= <clopez@suse.de>,
 Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-s390x@nongnu.org
Subject: [PULL 73/73] virtio: refresh vring region cache after updating a
 virtqueue size
Message-ID: <52062b213c13bd7fff966d36b554c04609c925d6.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Carlos López <clopez@suse.de>

When a virtqueue size is changed by the guest via
virtio_queue_set_num(), its region cache is not automatically updated.
If the size was increased, this could lead to accessing the cache out
of bounds. For example, in vring_get_used_event():

    static inline uint16_t vring_get_used_event(VirtQueue *vq)
    {
        return vring_avail_ring(vq, vq->vring.num);
    }

    static inline uint16_t vring_avail_ring(VirtQueue *vq, int i)
    {
        VRingMemoryRegionCaches *caches = vring_get_region_caches(vq);
        hwaddr pa = offsetof(VRingAvail, ring[i]);

        if (!caches) {
            return 0;
        }

        return virtio_lduw_phys_cached(vq->vdev, &caches->avail, pa);
    }

vq->vring.num will be greater than caches->avail.len, which will
trigger a failed assertion down the call path of
virtio_lduw_phys_cached().

Fix this by calling virtio_queue_update_rings() after
virtio_queue_set_num() if we are not already calling
virtio_queue_set_rings().

Signed-off-by: Carlos López <clopez@suse.de>
Message-Id: <20230302101447.4499-1-clopez@suse.de>
Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/s390x/virtio-ccw.c   | 1 +
 hw/virtio/virtio-mmio.c | 5 ++---
 hw/virtio/virtio-pci.c  | 1 +
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index e33e5207ab..89891ac58a 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -237,6 +237,7 @@ static int virtio_ccw_set_vqs(SubchDev *sch, VqInfoBlock *info,
                 return -EINVAL;
             }
             virtio_queue_set_num(vdev, index, num);
+            virtio_queue_update_rings(vdev, index);
         } else if (virtio_queue_get_num(vdev, index) > num) {
             /* Fail if we don't have a big enough queue. */
             return -EINVAL;
diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index 23ba625eb6..c74822308f 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -350,10 +350,9 @@ static void virtio_mmio_write(void *opaque, hwaddr offset, uint64_t value,
     case VIRTIO_MMIO_QUEUE_NUM:
         trace_virtio_mmio_queue_write(value, VIRTQUEUE_MAX_SIZE);
         virtio_queue_set_num(vdev, vdev->queue_sel, value);
+        virtio_queue_update_rings(vdev, vdev->queue_sel);
 
-        if (proxy->legacy) {
-            virtio_queue_update_rings(vdev, vdev->queue_sel);
-        } else {
+        if (!proxy->legacy) {
             proxy->vqs[vdev->queue_sel].num = value;
         }
         break;
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 247325c193..a0a2f2c965 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1554,6 +1554,7 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
         proxy->vqs[vdev->queue_sel].num = val;
         virtio_queue_set_num(vdev, vdev->queue_sel,
                              proxy->vqs[vdev->queue_sel].num);
+        virtio_queue_update_rings(vdev, vdev->queue_sel);
         break;
     case VIRTIO_PCI_COMMON_Q_MSIX:
         vector = virtio_queue_vector(vdev, vdev->queue_sel);
-- 
MST


