Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7FE2D48CF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:20:23 +0100 (CET)
Received: from localhost ([::1]:41058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn44c-0002x2-Ln
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:20:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3rp-0001Lo-Cz
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:07:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3rk-0007fg-4i
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:07:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DDpDvWnDXn0+AbenIHpi5XjLObz83cMo1H8va2rlpRI=;
 b=T+QsY33rBoqf5QMXdrqjbOok191sclSQi0eDL1R5ew+5OFt6z23cCYcI05B1FWbLVxv2cX
 rOk/mTB5Ar2LQsYRQeWqezsUZa7n61njnC7FGeSP3SqL5P84bzaV/wMUTe27SmNlYA1fQg
 hAckrt81SQ8z6Wc+lOWl8C3X6bpUGAU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-Kvlzj8aCNp682Dk-g3F_KA-1; Wed, 09 Dec 2020 13:06:59 -0500
X-MC-Unique: Kvlzj8aCNp682Dk-g3F_KA-1
Received: by mail-wm1-f71.google.com with SMTP id r5so876979wma.2
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:06:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DDpDvWnDXn0+AbenIHpi5XjLObz83cMo1H8va2rlpRI=;
 b=IjajC8PGf+J6Oo38kf721pAp5/ghQaP1DgJ91KGjP0FrQ9JpewvmZbjYMz+rMM3/oH
 8tzLt1MylIDs01txP5F48Oor6OwBmYMb3mui+QPXhMOHukjmA4Xk5dDJWfhESjoJdhIG
 NkthKN6+pfm4P7yJFs8ucP4YWBuCnpXBraAEmD68Wr6xRaBSvMdkcExFCN1DmzneQSuT
 EbPQuv1wbrp6RLMZjUo+WWjsUsMHs26YnpGwXaSZsY9KlBhLI1zAgZnn6F5TN1/4GGj8
 yWmRI/h4uPc1GZLur5RC7VadlB7HYjwSaVNVczQFkm3OJcms3neqQwTpLRwZGQXOIuo4
 1EtA==
X-Gm-Message-State: AOAM533a3QYz2n4OGMvMuEgSDDFjbPS6/bvH3aLzPPXbG9fW7XTKAqtl
 ef3ZoTuN8uF2IHFD6gQw6M7UVoBHfNGjC3fvtnTd7vAG68fpEUV+1Ms4JzmdJ5c7AHESX1FAhF1
 N75/gyOZLVP9Fhr4LfC27PgiYHGKVLE8JeMwxTtsXMdJfUnDFXTARyWa2uNLk
X-Received: by 2002:adf:e541:: with SMTP id z1mr4003011wrm.143.1607537217824; 
 Wed, 09 Dec 2020 10:06:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyeF8Ce/xcAQ6yzW6v3yRzgAodvZ01Akup6YvmPJ9+7r2RKMgqw+NxOHBhkVizxfua5E9jpkA==
X-Received: by 2002:adf:e541:: with SMTP id z1mr4002982wrm.143.1607537217655; 
 Wed, 09 Dec 2020 10:06:57 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id m21sm4781355wml.13.2020.12.09.10.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:06:57 -0800 (PST)
Date: Wed, 9 Dec 2020 13:06:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 04/65] memory: Add IOMMU_NOTIFIER_DEVIOTLB_UNMAP
 IOMMUTLBNotificationType
Message-ID: <20201209180546.721296-5-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

This allows us to differentiate between regular IOMMU map/unmap events
and DEVIOTLB unmap. Doing so, notifiers that only need device IOTLB
invalidations will not receive regular IOMMU unmappings.

Adapt intel and vhost to use it.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20201116165506.31315-4-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/exec/memory.h | 7 ++++++-
 hw/i386/intel_iommu.c | 2 +-
 hw/virtio/vhost.c     | 2 +-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index e86b5e92da..521d9901d7 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -97,9 +97,14 @@ typedef enum {
     IOMMU_NOTIFIER_UNMAP = 0x1,
     /* Notify entry changes (newly created entries) */
     IOMMU_NOTIFIER_MAP = 0x2,
+    /* Notify changes on device IOTLB entries */
+    IOMMU_NOTIFIER_DEVIOTLB_UNMAP = 0x04,
 } IOMMUNotifierFlag;
 
-#define IOMMU_NOTIFIER_ALL (IOMMU_NOTIFIER_MAP | IOMMU_NOTIFIER_UNMAP)
+#define IOMMU_NOTIFIER_IOTLB_EVENTS (IOMMU_NOTIFIER_MAP | IOMMU_NOTIFIER_UNMAP)
+#define IOMMU_NOTIFIER_DEVIOTLB_EVENTS IOMMU_NOTIFIER_DEVIOTLB_UNMAP
+#define IOMMU_NOTIFIER_ALL (IOMMU_NOTIFIER_IOTLB_EVENTS | \
+                            IOMMU_NOTIFIER_DEVIOTLB_EVENTS)
 
 struct IOMMUNotifier;
 typedef void (*IOMMUNotify)(struct IOMMUNotifier *notifier,
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 56180b1c43..edc3090f91 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -2468,7 +2468,7 @@ static bool vtd_process_device_iotlb_desc(IntelIOMMUState *s,
         sz = VTD_PAGE_SIZE;
     }
 
-    event.type = IOMMU_NOTIFIER_UNMAP;
+    event.type = IOMMU_NOTIFIER_DEVIOTLB_UNMAP;
     event.entry.target_as = &vtd_dev_as->as;
     event.entry.addr_mask = sz - 1;
     event.entry.iova = addr;
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 614ccc2bcb..28c7d78172 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -718,7 +718,7 @@ static void vhost_iommu_region_add(MemoryListener *listener,
     iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
                                                    MEMTXATTRS_UNSPECIFIED);
     iommu_notifier_init(&iommu->n, vhost_iommu_unmap_notify,
-                        IOMMU_NOTIFIER_UNMAP,
+                        IOMMU_NOTIFIER_DEVIOTLB_UNMAP,
                         section->offset_within_region,
                         int128_get64(end),
                         iommu_idx);
-- 
MST


