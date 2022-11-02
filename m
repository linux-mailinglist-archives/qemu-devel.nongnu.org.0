Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A9C6168AC
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:24:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGJv-0007GM-Fa; Wed, 02 Nov 2022 12:10:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJq-00077P-6l
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJi-0002w7-Ke
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X2sP/TSK1XCsdD9F2S14hcxXjNio5ZBGNNU6Wjh7pYE=;
 b=IGEFs+dp75TMuhcUu23n5HGmd8ftGMSO2Ec0piirmA/MnxOMtLcpup/ZY8rzATcWb5zL0v
 GVBgpvQBaJxyus8s2nqMZUkXxFvJ0HoptFGwsjxcy4gjhAbR9gaQ/gycbIIgZcfHO3hccm
 0gjOLTDyJBp5SCyUL17EMerDxYyFfxo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-45-KpNs7zjMMkK-NNiM7WwcAQ-1; Wed, 02 Nov 2022 12:10:11 -0400
X-MC-Unique: KpNs7zjMMkK-NNiM7WwcAQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 c18-20020adfa312000000b002364fabf2ceso4978149wrb.2
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:10:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X2sP/TSK1XCsdD9F2S14hcxXjNio5ZBGNNU6Wjh7pYE=;
 b=yDdj5/uVi6FfhTD80436mT8RtOg7dh2Qhy/6yh6b09HZ8whdsJWvBoS0Bh0tL0T5A2
 JOdq8HrvWBUoiE7KcmSCx43F+q3yFnYcG3lNiMQooS+zulb0T8tZjwe6Wy9XDbJWMWa4
 RF3ThD+Zg2dYw4GgdHIWamOpYwgUhtILl1F7az+hK8jflGr27+x8qmG29hSohnck+pR6
 IfLM7Y6grCo9or/5FIQ/xMSN3ePUsGxhs252+kKnoHgDXN2GDEA4O78PA7iA9srNCbKm
 cxlvE3jt2pZZ43fUIb1nrBqhjDdXbB+uBvHyUZ70iEzmr5gLfNvNcQz5SUqgsgAIehi/
 oRZQ==
X-Gm-Message-State: ACrzQf2C8BXTHykXV+BBWw0G3oOpXH0HlwsbzCPFt3zUOX9HgMG+N9FY
 dsJ8SCGJ9Yjqo2Hbp2nLzmC8k/sW5XhJtjSjCZUYlhs5y2NlIwL1DZRpnpHHxfvodrIc3Pxb6zr
 R7bvy5p9X8NoEUnSxdoxDsnXZnW2+C7xUvQx6SQnHrLr8VGMWifPpp5QfJBOC
X-Received: by 2002:adf:f743:0:b0:236:7309:1209 with SMTP id
 z3-20020adff743000000b0023673091209mr15585213wrp.14.1667405410082; 
 Wed, 02 Nov 2022 09:10:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5oYQx8u6wEH21idEeZlWtQJRGICVr2RiHO8tEiNlK/kfYgFCxBtLAW5bWTTjk6N6hTssVNxA==
X-Received: by 2002:adf:f743:0:b0:236:7309:1209 with SMTP id
 z3-20020adff743000000b0023673091209mr15585172wrp.14.1667405409715; 
 Wed, 02 Nov 2022 09:10:09 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 w12-20020a5d404c000000b002365254ea42sm13379614wrp.1.2022.11.02.09.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:10:09 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:10:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL v2 38/82] virtio: core: vq reset feature negotation support
Message-ID: <20221102160336.616599-39-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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

A a new command line parameter "queue_reset" is added.

Meanwhile, the vq reset feature is disabled for pre-7.2 machines.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-5-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio.h | 4 +++-
 hw/core/machine.c          | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 5cd7861aeb..18a8920cc0 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -313,7 +313,9 @@ typedef struct VirtIORNGConf VirtIORNGConf;
     DEFINE_PROP_BIT64("iommu_platform", _state, _field, \
                       VIRTIO_F_IOMMU_PLATFORM, false), \
     DEFINE_PROP_BIT64("packed", _state, _field, \
-                      VIRTIO_F_RING_PACKED, false)
+                      VIRTIO_F_RING_PACKED, false), \
+    DEFINE_PROP_BIT64("queue_reset", _state, _field, \
+                      VIRTIO_F_RING_RESET, true)
 
 hwaddr virtio_queue_get_desc_addr(VirtIODevice *vdev, int n);
 bool virtio_queue_enabled_legacy(VirtIODevice *vdev, int n);
diff --git a/hw/core/machine.c b/hw/core/machine.c
index aa520e74a8..907fa78ff0 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -40,7 +40,9 @@
 #include "hw/virtio/virtio-pci.h"
 #include "qom/object_interfaces.h"
 
-GlobalProperty hw_compat_7_1[] = {};
+GlobalProperty hw_compat_7_1[] = {
+    { "virtio-device", "queue_reset", "false" },
+};
 const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
 
 GlobalProperty hw_compat_7_0[] = {
-- 
MST


