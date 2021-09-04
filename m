Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5700C400D46
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 00:00:31 +0200 (CEST)
Received: from localhost ([::1]:56270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdiA-0000BW-F4
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 18:00:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdOO-0006a2-KX
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:40:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdOM-0003G1-VI
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:40:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4oSJitA/lzrTpzddQXggI9ORdHqMXT3PxB8e6htKSV8=;
 b=gveVe6xsDdnxPAjCvyJPgiq4zndyWjpq3KxAGwHjZCXleC7Yai5sAiCq5jjWemddAGG1Sx
 Pfk4xLPKY2sT4yc4WEvAYJV1ooKkjx/D6evPgFX7e8FwPxSmDiejCnNJmCBj68rrpbsKcK
 nBh8cG/77giVozWOTkh+Kwww/5cT4S0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-R6RgGJtvNVC5zzTlFk2V_Q-1; Sat, 04 Sep 2021 17:36:45 -0400
X-MC-Unique: R6RgGJtvNVC5zzTlFk2V_Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 g4-20020a056402180400b003c2e8da869bso1497477edy.13
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4oSJitA/lzrTpzddQXggI9ORdHqMXT3PxB8e6htKSV8=;
 b=MmCbg1QN2je9aMg5UfXSd4iVgdLA5nBgDAQ/enc6sCWN8WgxQjJpzRqVGt8+XViXKI
 vJJRLK6q7kNyMRfBlm+lqIYMceZAytbmxlbvYwpASLfVbNs34xTwqYF4mjLwzXa1xQ8C
 lWAXJhRzS2EqpN8cQ+iml6cW0ieiewAV4Ck6/+FcgUVstH0AGtisGXgVbyFcNFatfsiD
 0cgI10DdxL7tNC1uvQR19cULWIiUHr/R2pmpjOquAUwKD2I5CIBTeucHcuJZeJGPP8Km
 m5Vt/XVQc99RrRlCm2kypOZmTUKBI+UmmtnlNj2FAb5qFcoktNpzcofCs/yk2Kstc5Fa
 lWOw==
X-Gm-Message-State: AOAM5313u+egQZAwQQWvQLuJ8bjErVFGiJ/QXA31kv/uT8BmtaTlwz7y
 5C36bPdbMtB/zXSy0vXi0MfBX5dYBvDCBRhWemMnhsxGnGddJcR0ap0TN0hP6O49A/fd1G6Kj93
 hfG8dem0SJArBiJaXC8l9E9OL1CheiAKa33bO8w3uA4VQw63X/Sh26CkXSAfw
X-Received: by 2002:aa7:d487:: with SMTP id b7mr5739758edr.61.1630791403479;
 Sat, 04 Sep 2021 14:36:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9ZfZtnmb0VC+4WSd5HRHyAYKuLXwN7noNlfRx6S9Wfl20x77y11Qr4ukoThHVt3u9UaIapg==
X-Received: by 2002:aa7:d487:: with SMTP id b7mr5739748edr.61.1630791403283;
 Sat, 04 Sep 2021 14:36:43 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id 4sm1926243edw.45.2021.09.04.14.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:36:42 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:36:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/35] vhost: correctly detect the enabling IOMMU
Message-ID: <20210904213506.486886-16-mst@redhat.com>
References: <20210904213506.486886-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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

Vhost used to compare the dma_as against the address_space_memory to
detect whether the IOMMU is enabled or not. This might not work well
since the virito-bus may call get_dma_as if VIRTIO_F_IOMMU_PLATFORM is
set without an actual IOMMU enabled when device is plugged. In the
case of PCI where pci_get_address_space() is used, the bus master as
is returned. So vhost actually tries to enable device IOTLB even if
the IOMMU is not enabled. This will lead a lots of unnecessary
transactions between vhost and Qemu and will introduce a huge drop of
the performance.

For PCI, an ideal approach is to use pci_device_iommu_address_space()
just for get_dma_as. But Qemu may choose to initialize the IOMMU after
the virtio-pci which lead a wrong address space is returned during
device plugged. So this patch switch to use transport specific way via
iommu_enabled() to detect the IOMMU during vhost start. In this case,
we are fine since we know the IOMMU is initialized correctly.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20210804034803.1644-4-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index e21e144510..b4b29413e6 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -315,7 +315,7 @@ static int vhost_dev_has_iommu(struct vhost_dev *dev)
      * does not have IOMMU, there's no need to enable this feature
      * which may cause unnecessary IOTLB miss/update trnasactions.
      */
-    return vdev->dma_as != &address_space_memory &&
+    return virtio_bus_device_iommu_enabled(vdev) &&
            virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
 }
 
-- 
MST


