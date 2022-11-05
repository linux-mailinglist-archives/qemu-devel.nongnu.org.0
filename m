Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C64661DCA6
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:45:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMpV-000872-Ut; Sat, 05 Nov 2022 13:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnR-00074D-Vg
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnO-0007TL-N9
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uP43tqF7KIGeiEXLeAHNEumMXPufRETwc61xJpjS6BM=;
 b=DLxMElfM0Ww72Tv5GMS8osA6ad3mHmUisBJRoidDtzTM3pA9hG/KaUVqBLJpI1Qhw2ZWCQ
 jtWeSfH6kBUHr/KgoZd2K9/kEmSDrI24ArRT0bv1QfOs5+QDnk3ecKsFxN5DQYnR7/FUua
 ixweAjESQOZGWnxirUh8+Go5/zUOckI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-218-0tLVT4iuPDmJZdHU0TUtVQ-1; Sat, 05 Nov 2022 13:17:23 -0400
X-MC-Unique: 0tLVT4iuPDmJZdHU0TUtVQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 h8-20020a1c2108000000b003cf550bfc8dso6001448wmh.2
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uP43tqF7KIGeiEXLeAHNEumMXPufRETwc61xJpjS6BM=;
 b=nX9IcyuwJQCAcxenslTV8ujj8MljkX3EsMthtUv8VhdsQOlTL9sLm0NEU3Jdp3vJtw
 1JC67go3Gno+HCSKeIGUvg+63NfbzcvJo4c+JjfgVUR47VaYmsudXgYmBG93vdsDheBm
 SuyVkPNjsuh51iJ2qK8B9SCcnGA4pO0oWO45zp+Z7zg6EtJbTc0cKGH6+i4HOKnqCRjy
 COYP854tE7R8F0d8qm+nyooCvWWgBLny2WhjE2jPyeXd8U2sjZzoXtr1idDszp0Jg3SC
 Sw/ooGCuJDeQKQ9N/bqBBP6WVx3hqhy9cmo2dNMAFsfEDrDkkGUdOd0E1ssbHqRbZIdP
 Hs2w==
X-Gm-Message-State: ACrzQf3YJxCuK0U5wC3Au1d2A0iAI1qSHNVA6KBNwmjVhX3z4QRJrRcG
 Pjo/Kec6Tb+tp4tTCEsEk9DVbqLPi5+r76jUyBBdIMZ8W1SeYxXKcaNDXzbFiqnpB9KSpnpL2yz
 sdFRX1YmVikjxRDL2CIIoIwRs4ie9r8XeCKv7+ChPBiqpmCDll4duLWj7Bq5v
X-Received: by 2002:adf:ef04:0:b0:236:b58b:3166 with SMTP id
 e4-20020adfef04000000b00236b58b3166mr25336620wro.330.1667668641777; 
 Sat, 05 Nov 2022 10:17:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5iF+EgNaRuMdppAdhDD/cabSimK/dOerjpcGMvK56tbFOxvMKTp8IDjBmzorM/bM/ix+qB8A==
X-Received: by 2002:adf:ef04:0:b0:236:b58b:3166 with SMTP id
 e4-20020adfef04000000b00236b58b3166mr25336607wro.330.1667668641537; 
 Sat, 05 Nov 2022 10:17:21 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 m16-20020adfdc50000000b00236695ff94fsm2589339wrj.34.2022.11.05.10.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:17:21 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:17:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v3 38/81] vhost: expose vhost_virtqueue_start()
Message-ID: <20221105171116.432921-39-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Kangjie Xu <kangjie.xu@linux.alibaba.com>

Expose vhost_virtqueue_start(), we need to use it when restarting a
virtqueue.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-8-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost.h | 3 +++
 hw/virtio/vhost.c         | 8 ++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index d7eb557885..0054a695dc 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -297,6 +297,9 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
 
 int vhost_device_iotlb_miss(struct vhost_dev *dev, uint64_t iova, int write);
 
+int vhost_virtqueue_start(struct vhost_dev *dev, struct VirtIODevice *vdev,
+                          struct vhost_virtqueue *vq, unsigned idx);
+
 void vhost_dev_reset_inflight(struct vhost_inflight *inflight);
 void vhost_dev_free_inflight(struct vhost_inflight *inflight);
 void vhost_dev_save_inflight(struct vhost_inflight *inflight, QEMUFile *f);
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 5185c15295..788d0a0679 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1081,10 +1081,10 @@ out:
     return ret;
 }
 
-static int vhost_virtqueue_start(struct vhost_dev *dev,
-                                struct VirtIODevice *vdev,
-                                struct vhost_virtqueue *vq,
-                                unsigned idx)
+int vhost_virtqueue_start(struct vhost_dev *dev,
+                          struct VirtIODevice *vdev,
+                          struct vhost_virtqueue *vq,
+                          unsigned idx)
 {
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
     VirtioBusState *vbus = VIRTIO_BUS(qbus);
-- 
MST


