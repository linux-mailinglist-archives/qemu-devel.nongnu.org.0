Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 402C32CBB3A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 12:08:46 +0100 (CET)
Received: from localhost ([::1]:60666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkQ05-000758-9B
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 06:08:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkPuv-0002rj-Th
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:03:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkPut-0002sj-Iy
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:03:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606907002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DDpDvWnDXn0+AbenIHpi5XjLObz83cMo1H8va2rlpRI=;
 b=F7V14atITgh3bRASO5841cvLjXnVximhYwvdyDY7yk80nsbKTfzOn9cDH5yPbEcYJO2Ll0
 5hriPv8jBpd9wtBFH4diWAdL9XKVFja2HWjgcdAD0wLxXQdNA2uXR65YpZ4FDS4DwitFdn
 PFNU0/roUM8lby8V67CMXYXmO6y2P3g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-JEbTa4ITODC1D-dVv69jgw-1; Wed, 02 Dec 2020 06:03:21 -0500
X-MC-Unique: JEbTa4ITODC1D-dVv69jgw-1
Received: by mail-wr1-f71.google.com with SMTP id b5so3359950wrp.3
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 03:03:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DDpDvWnDXn0+AbenIHpi5XjLObz83cMo1H8va2rlpRI=;
 b=jFSADVEw+NGp2Dm9HcvdYGC6kEgBAS9t2+1hz0NI1L0IWIds3nfBTI9oRxWCmdEOFg
 uPzhXUsvuVjKC/lUmqizELccleHhccoTfEm49FbGzy1pHLpIZy+40pKWjQrMFdz+nSVQ
 AamHXox9+e2crQvBhd24L3kxSZspA2C8v+kssADrHRfBHi6P2GGMSpRP5IcSuRtb2nrF
 lLQghK5h1vUqqo3MvWl5SzhZHIvhaanmSw1oNdArQziAWyv05QrQGl10u48wABUVe6pw
 uUk2LnrYYnYsdsgQ6YKlCxp16U+DE0USxb/Jj86AAjCVaSuKloOD6Adu2x1Q1xtlmQgA
 9pNA==
X-Gm-Message-State: AOAM5333wK8ZjAZiQ3LYY1dwIqdoCLiId2+O/wauNTHhxoZOEDYv9+NY
 +z2Z5GQ6yyyU8JoeDU9KWrcrUu/53p5VeUul9Ef9eZ0u/osJt2PsXu4O2f67XQJF0wf2DYVx+3N
 2gzjYaYBUaURYoklZTeAm/jwf4AP7YqyD+Rvez0mLZ958wqnH2GX6MqrdgYp5
X-Received: by 2002:a5d:4a84:: with SMTP id o4mr2732243wrq.57.1606906999537;
 Wed, 02 Dec 2020 03:03:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwOY8XQ6Mv+l68v/d5uYNgN/5+/W2qBz+beV9kR70g+pVMQA8oe3rYmuwXrl4R3LFY+qInoAA==
X-Received: by 2002:a5d:4a84:: with SMTP id o4mr2732204wrq.57.1606906999238;
 Wed, 02 Dec 2020 03:03:19 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id g18sm1838702wrp.63.2020.12.02.03.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 03:03:18 -0800 (PST)
Date: Wed, 2 Dec 2020 06:03:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/6] memory: Add IOMMU_NOTIFIER_DEVIOTLB_UNMAP
 IOMMUTLBNotificationType
Message-ID: <20201202101655.122214-5-mst@redhat.com>
References: <20201202101655.122214-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201202101655.122214-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


