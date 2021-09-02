Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45213FF1DF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 18:55:45 +0200 (CEST)
Received: from localhost ([::1]:40072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLq09-0001V4-0v
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 12:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLpvi-0002D5-MQ
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 12:51:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLpve-0000Zk-Iv
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 12:51:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630601465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hnQjUJf863/+mR0eVjMS2XLf+nf0liaJ3GnxfaQW96o=;
 b=HieHzo+91sdOlE7OXlNiF6si3EkEnPB03giDPOjO49LtjYhKPas3mVn07TeO80PuwT7v0S
 642+0N4ICd6JIBqzZUJv3ujsv0yUNaFA1qWXgD/wxnxDubhn232/ZisKfB82XFVDVl1pCy
 lsNlkVHq7o+605/lOnpPb3NX7A7I1qQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-RrmMJfjTOH2D2dWzNzLrMg-1; Thu, 02 Sep 2021 12:51:05 -0400
X-MC-Unique: RrmMJfjTOH2D2dWzNzLrMg-1
Received: by mail-wr1-f69.google.com with SMTP id
 z15-20020adff74f000000b001577d70c98dso750573wrp.12
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 09:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hnQjUJf863/+mR0eVjMS2XLf+nf0liaJ3GnxfaQW96o=;
 b=qUTsE2TH2f3ytzUL+g2DXOO+DNY11J92J+7IFHaipMmSPsNYmQLk0xH0bRpAvahtbF
 C+rnHujJ73XNFAan4xsIhw5Is2qShzIlerbvyVg04ULHS0rodKRh8apWa0/eE05Za7YE
 QIzveKP9wTI/sU2V6G4WBCzu8myhJB/1KKc0L01kUpbC92CE4TKjSlj77m2RGbBPc4mx
 EzHSTxmKcSGBDVLkU+ebROEh36C2iisB15snyB9F7Ojv9PUXdb4PUk3TNsJFwFltJgBf
 JHNAsYD1VCVG87CUemcJKFWxorzXs5OsVHMLMmeHjzZJnPfzYmaW2+NJLnOooegVatsk
 TEhw==
X-Gm-Message-State: AOAM531SvmSdni67Ej6tk1t3ywLJs0PeumNsRDTXLAKmBOHriTFoxBEx
 trajCvClUzPCt7K1tHj/m8dG4XFZV5hxHZC9y3IckxXB4kb41+UqGN+1vK6WcyJy1ZUnDnfv8HJ
 XhAEBEHdIMhkO5gw5HEZr3fGgUV/IyAQTtiGI4jYu+wZPpa/z3IOw28GjWsMWRBr7
X-Received: by 2002:a05:600c:2186:: with SMTP id
 e6mr4061401wme.71.1630601463556; 
 Thu, 02 Sep 2021 09:51:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzv883Bvgb+qGXKSmCFdDdyubVsEgDw9NLGLvTI0wvsT8O4RJLHjIHboVbrto2GgSQTbifupg==
X-Received: by 2002:a05:600c:2186:: with SMTP id
 e6mr4061382wme.71.1630601463349; 
 Thu, 02 Sep 2021 09:51:03 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 f20sm2031259wmb.32.2021.09.02.09.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:51:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] hw/virtio: Have virtqueue_get_avail_bytes() pass
 caches arg to callees
Date: Thu,  2 Sep 2021 18:50:39 +0200
Message-Id: <20210902165039.432786-6-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902165039.432786-1-philmd@redhat.com>
References: <20210902165039.432786-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both virtqueue_packed_get_avail_bytes() and
virtqueue_split_get_avail_bytes() access the region cache, but
their caller also does. Simplify by having virtqueue_get_avail_bytes
calling both with RCU lock held, and passing the caches as argument.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/virtio/virtio.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 7d3bf9091ee..0dbfb53e51b 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -985,28 +985,23 @@ static int virtqueue_split_read_next_desc(VirtIODevice *vdev, VRingDesc *desc,
     return VIRTQUEUE_READ_DESC_MORE;
 }
 
+/* Called within rcu_read_lock().  */
 static void virtqueue_split_get_avail_bytes(VirtQueue *vq,
                             unsigned int *in_bytes, unsigned int *out_bytes,
-                            unsigned max_in_bytes, unsigned max_out_bytes)
+                            unsigned max_in_bytes, unsigned max_out_bytes,
+                            VRingMemoryRegionCaches *caches)
 {
     VirtIODevice *vdev = vq->vdev;
     unsigned int max, idx;
     unsigned int total_bufs, in_total, out_total;
-    VRingMemoryRegionCaches *caches;
     MemoryRegionCache indirect_desc_cache = MEMORY_REGION_CACHE_INVALID;
     int64_t len = 0;
     int rc;
 
-    RCU_READ_LOCK_GUARD();
-
     idx = vq->last_avail_idx;
     total_bufs = in_total = out_total = 0;
 
     max = vq->vring.num;
-    caches = vring_get_region_caches(vq);
-    if (!caches) {
-        goto err;
-    }
 
     while ((rc = virtqueue_num_heads(vq, idx)) > 0) {
         MemoryRegionCache *desc_cache = &caches->desc;
@@ -1125,32 +1120,28 @@ static int virtqueue_packed_read_next_desc(VirtQueue *vq,
     return VIRTQUEUE_READ_DESC_MORE;
 }
 
+/* Called within rcu_read_lock().  */
 static void virtqueue_packed_get_avail_bytes(VirtQueue *vq,
                                              unsigned int *in_bytes,
                                              unsigned int *out_bytes,
                                              unsigned max_in_bytes,
-                                             unsigned max_out_bytes)
+                                             unsigned max_out_bytes,
+                                             VRingMemoryRegionCaches *caches)
 {
     VirtIODevice *vdev = vq->vdev;
     unsigned int max, idx;
     unsigned int total_bufs, in_total, out_total;
     MemoryRegionCache *desc_cache;
-    VRingMemoryRegionCaches *caches;
     MemoryRegionCache indirect_desc_cache = MEMORY_REGION_CACHE_INVALID;
     int64_t len = 0;
     VRingPackedDesc desc;
     bool wrap_counter;
 
-    RCU_READ_LOCK_GUARD();
     idx = vq->last_avail_idx;
     wrap_counter = vq->last_avail_wrap_counter;
     total_bufs = in_total = out_total = 0;
 
     max = vq->vring.num;
-    caches = vring_get_region_caches(vq);
-    if (!caches) {
-        goto err;
-    }
 
     for (;;) {
         unsigned int num_bufs = total_bufs;
@@ -1251,6 +1242,8 @@ void virtqueue_get_avail_bytes(VirtQueue *vq, unsigned int *in_bytes,
     uint16_t desc_size;
     VRingMemoryRegionCaches *caches;
 
+    RCU_READ_LOCK_GUARD();
+
     if (unlikely(!vq->vring.desc)) {
         goto err;
     }
@@ -1269,10 +1262,12 @@ void virtqueue_get_avail_bytes(VirtQueue *vq, unsigned int *in_bytes,
 
     if (virtio_vdev_has_feature(vq->vdev, VIRTIO_F_RING_PACKED)) {
         virtqueue_packed_get_avail_bytes(vq, in_bytes, out_bytes,
-                                         max_in_bytes, max_out_bytes);
+                                         max_in_bytes, max_out_bytes,
+                                         caches);
     } else {
         virtqueue_split_get_avail_bytes(vq, in_bytes, out_bytes,
-                                        max_in_bytes, max_out_bytes);
+                                        max_in_bytes, max_out_bytes,
+                                        caches);
     }
 
     return;
-- 
2.31.1


