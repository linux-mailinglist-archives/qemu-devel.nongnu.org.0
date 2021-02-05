Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1F5310D00
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:12:11 +0100 (CET)
Received: from localhost ([::1]:54238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82mI-0002w5-DC
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:12:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82eL-0003sj-QT
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:03:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82eJ-0002yH-PW
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:03:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612537435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RQw4PPJyzBWUqKR3ig2k+999cJ/UQSQvrggksmcciUE=;
 b=apagqEsHQiJhQExEgUKNrB9r1mlsiWEzomrX8jyDz7HD+dIMFR87FiqLdcCXApuIRjwMQo
 8xWzTaDIQeeRjB/miEmd7HeYxTx7iFjY8h16HUvRUYJP373NPtHJbBQMQurDbetJbSxyD4
 f1VSosvqDWKoui3mDmzm4kM+8qNnHdk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-BZ8RAwWCPoOupa_7JfaU7w-1; Fri, 05 Feb 2021 10:03:53 -0500
X-MC-Unique: BZ8RAwWCPoOupa_7JfaU7w-1
Received: by mail-ej1-f71.google.com with SMTP id yh28so6907825ejb.11
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 07:03:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RQw4PPJyzBWUqKR3ig2k+999cJ/UQSQvrggksmcciUE=;
 b=D+T/I4ebX3R9ZLl2lHf+sYkV+q4t/nQOTJ/VXwM32hHstbsNOfnVaexi4ABImpV0KX
 nXxCWk3XUYcik5XSspLBI9N/PqRymuKTjbOEGQs6vKIAdvHFBvD6D2qcDs7391BN0Xtn
 nqa4TPKmBuI4yKqGD1jFmCLvq7v+ni0uhrv3UOX6J97/W3T+0CyGHzlBEmn94+0M7Yvy
 JFej/RStRuSrfFUshIPmkAZE4F6QwND+tDwtYxEqkiiPqNo6jHpewLv3CRUwFtgrNED6
 lUUsvEyAL8KEmSfFGI8myQO9L3ReijkTJ8AUBb/GizRlCf0PPq8EJQUYMuN4otNAbYUH
 Y0Ng==
X-Gm-Message-State: AOAM531teJieCyI1d5W4BbsHG4nv4dId8XsdNv0Kx9tn3ycUhnyS4edD
 6gFxKqU6r3ey56A28h/xwb7DOiECN4DTYWWIuyl/B6+uXxxdeXYUzidzfo1Vmw6JYalfSRh6wF7
 77nYulPDTf7287Ngqv8AY7LB5NCiho6XnT7/d2G/OjTpXGXWXSv5ANurXiUYx
X-Received: by 2002:a17:906:3b04:: with SMTP id
 g4mr4431688ejf.369.1612537431899; 
 Fri, 05 Feb 2021 07:03:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzS8oDKSrc+XpyFTOvNYLmAqaUzK15IQfYaXJ0ABli7xM8XeSg5XfRM1mEsZ589t7266zEkSQ==
X-Received: by 2002:a17:906:3b04:: with SMTP id
 g4mr4431662ejf.369.1612537431711; 
 Fri, 05 Feb 2021 07:03:51 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id m22sm4061844edp.63.2021.02.05.07.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 07:03:51 -0800 (PST)
Date: Fri, 5 Feb 2021 10:03:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 07/16] vhost: Unbreak SMMU and virtio-iommu on dev-iotlb
 support
Message-ID: <20210205150135.94643-8-mst@redhat.com>
References: <20210205150135.94643-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210205150135.94643-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

Previous work on dev-iotlb message broke vhost on either SMMU or virtio-iommu
since dev-iotlb (or PCIe ATS) is not yet supported for those archs.

An initial idea is that we can let IOMMU to export this information to vhost so
that vhost would know whether the vIOMMU would support dev-iotlb, then vhost
can conditionally register to dev-iotlb or the old iotlb way.  We can work
based on some previous patch to introduce PCIIOMMUOps as Yi Liu proposed [1].

However it's not as easy as I thought since vhost_iommu_region_add() does not
have a PCIDevice context at all since it's completely a backend.  It seems
non-trivial to pass over a PCI device to the backend during init.  E.g. when
the IOMMU notifier registered hdev->vdev is still NULL.

To make the fix smaller and easier, this patch goes the other way to leverage
the flag_changed() hook of vIOMMUs so that SMMU and virtio-iommu can trap the
dev-iotlb registration and fail it.  Then vhost could try the fallback solution
as using UNMAP invalidation for it's translations.

[1] https://lore.kernel.org/qemu-devel/1599735398-6829-4-git-send-email-yi.l.liu@intel.com/

Reported-by: Eric Auger <eric.auger@redhat.com>
Fixes: b68ba1ca57677acf870d5ab10579e6105c1f5338
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210204191228.187550-1-peterx@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/smmuv3.c          |  5 +++++
 hw/virtio/vhost.c        | 13 +++++++++++--
 hw/virtio/virtio-iommu.c |  5 +++++
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 98b99d4fe8..bd1f97000d 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1497,6 +1497,11 @@ static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
     SMMUv3State *s3 = sdev->smmu;
     SMMUState *s = &(s3->smmu_state);
 
+    if (new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) {
+        error_setg(errp, "SMMUv3 does not support dev-iotlb yet");
+        return -EINVAL;
+    }
+
     if (new & IOMMU_NOTIFIER_MAP) {
         error_setg(errp,
                    "device %02x.%02x.%x requires iommu MAP notifier which is "
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 28c7d78172..6e17d631f7 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -704,6 +704,7 @@ static void vhost_iommu_region_add(MemoryListener *listener,
     Int128 end;
     int iommu_idx;
     IOMMUMemoryRegion *iommu_mr;
+    int ret;
 
     if (!memory_region_is_iommu(section->mr)) {
         return;
@@ -726,8 +727,16 @@ static void vhost_iommu_region_add(MemoryListener *listener,
     iommu->iommu_offset = section->offset_within_address_space -
                           section->offset_within_region;
     iommu->hdev = dev;
-    memory_region_register_iommu_notifier(section->mr, &iommu->n,
-                                          &error_fatal);
+    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, NULL);
+    if (ret) {
+        /*
+         * Some vIOMMUs do not support dev-iotlb yet.  If so, try to use the
+         * UNMAP legacy message
+         */
+        iommu->n.notifier_flags = IOMMU_NOTIFIER_UNMAP;
+        memory_region_register_iommu_notifier(section->mr, &iommu->n,
+                                              &error_fatal);
+    }
     QLIST_INSERT_HEAD(&dev->iommu_list, iommu, iommu_next);
     /* TODO: can replay help performance here? */
 }
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 6b9ef7f6b2..c2883a2f6c 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -893,6 +893,11 @@ static int virtio_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu_mr,
                                             IOMMUNotifierFlag new,
                                             Error **errp)
 {
+    if (new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) {
+        error_setg(errp, "Virtio-iommu does not support dev-iotlb yet");
+        return -EINVAL;
+    }
+
     if (old == IOMMU_NOTIFIER_NONE) {
         trace_virtio_iommu_notify_flag_add(iommu_mr->parent_obj.name);
     } else if (new == IOMMU_NOTIFIER_NONE) {
-- 
MST


