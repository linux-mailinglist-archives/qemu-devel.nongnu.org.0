Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 853574D0B9F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 00:02:29 +0100 (CET)
Received: from localhost ([::1]:41006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMN2-0006R0-8z
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 18:02:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM6Z-0006S0-PM
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:45:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM6W-0005W9-Ex
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:45:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0lVkB02NxWofYSS4as/4ncAO6TZl7kf9saq/7ls1Nww=;
 b=ereKY8MOdjSqaf9UGkm9aT5qgk7E6McvAwG53SjqBdD06YekFym7QjPC3W3dSgjrPferRw
 k4PcoWfSYo1tdIISbZ0t5k+B8ue+FVzMvrtKlJg+2+b3Tjac+tv0M3s856pxnOwHXbaWR2
 k1tpSU1zrZdpXL+XDIXxzTL35cxp5Ko=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-CHabOJGLNK6jTsR-vfxlWQ-1; Mon, 07 Mar 2022 17:45:23 -0500
X-MC-Unique: CHabOJGLNK6jTsR-vfxlWQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 h206-20020a1c21d7000000b003552c13626cso260640wmh.3
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:45:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0lVkB02NxWofYSS4as/4ncAO6TZl7kf9saq/7ls1Nww=;
 b=NJzZ+5714SZJqe6Td0nfFn301cubD6OuwOH81E25lDAsK0CuHJjHZFkaxGCjf/P7SG
 r7qTSbyJckt8FKgz32y3IOLu9j4duOW8LRcjE2GFmyOuWjsxrpNbuot6hrB/uusPzHKt
 Vhjz2ZH4gFsxiPK98IamrQnmREtwPdm/5RR2lWhy7wEMN2jtZ6SEt9QWsIPVihQLnHYM
 K9r3G3oQHsfxzsW1hcGLXlDwOvu2YJWw9DXZ8sWZO8aKEt23R0SCFYbvWdW/7/py4pQ0
 sBgthVstQYNaQ1sls+SpMkrxV5jpAD+q/KTrlXjvQILzVW+BngRsgKaRO12scxv0aYSP
 2xhw==
X-Gm-Message-State: AOAM532RMZ1z+pEoMWw1WB5Q8+35Fm8Nr3U+NTmVc58ud7LDiV9njXuU
 WQ0n9iwoqSh++FFshfjfCfcAmyITz5mf9XcfoYwrJ9Mf7Jne2NxTV2XQDd2Lb/1fJL8J2fmoOV0
 QWwXJiM4UEId3G9j2P/VhaVTNA0zFBXbm8YpFS4z/yODFme6yhnkrCgFgKTiN
X-Received: by 2002:a5d:4811:0:b0:1f1:d736:4862 with SMTP id
 l17-20020a5d4811000000b001f1d7364862mr10068923wrq.147.1646693120591; 
 Mon, 07 Mar 2022 14:45:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGVwr+7njWHLisP5YQUPK4kGd+LIjm4h53XX0RaHJztJoLqENRby9Ni+uCYg6bghrGlBn7SQ==
X-Received: by 2002:a5d:4811:0:b0:1f1:d736:4862 with SMTP id
 l17-20020a5d4811000000b001f1d7364862mr10068901wrq.147.1646693120233; 
 Mon, 07 Mar 2022 14:45:20 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 p16-20020adff210000000b001f062b80091sm11229910wro.34.2022.03.07.14.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:45:19 -0800 (PST)
Date: Mon, 7 Mar 2022 17:45:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 15/47] intel_iommu: support snoop control
Message-ID: <20220307224357.682101-16-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

SC is required for some kernel features like vhost-vDPA. So this patch
implements basic SC feature. The idea is pretty simple, for software
emulated DMA it would be always coherent. In this case we can simple
advertise ECAP_SC bit. For VFIO and vhost, thing will be more much
complicated, so this patch simply fail the IOMMU notifier
registration.

In the future, we may want to have a dedicated notifiers flag or
similar mechanism to demonstrate the coherency so VFIO could advertise
that if it has VFIO_DMA_CC_IOMMU, for vhost kernel backend we don't
need that since it's a software backend.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20220214060346.72455-1-jasowang@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/intel_iommu_internal.h |  1 +
 include/hw/i386/intel_iommu.h  |  1 +
 hw/i386/intel_iommu.c          | 14 +++++++++++++-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/i386/intel_iommu_internal.h b/hw/i386/intel_iommu_internal.h
index a6c788049b..1ff13b40f9 100644
--- a/hw/i386/intel_iommu_internal.h
+++ b/hw/i386/intel_iommu_internal.h
@@ -188,6 +188,7 @@
 #define VTD_ECAP_IR                 (1ULL << 3)
 #define VTD_ECAP_EIM                (1ULL << 4)
 #define VTD_ECAP_PT                 (1ULL << 6)
+#define VTD_ECAP_SC                 (1ULL << 7)
 #define VTD_ECAP_MHMV               (15ULL << 20)
 #define VTD_ECAP_SRS                (1ULL << 31)
 #define VTD_ECAP_SMTS               (1ULL << 43)
diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
index 41783ee46d..3b5ac869db 100644
--- a/include/hw/i386/intel_iommu.h
+++ b/include/hw/i386/intel_iommu.h
@@ -228,6 +228,7 @@ struct IntelIOMMUState {
 
     bool caching_mode;              /* RO - is cap CM enabled? */
     bool scalable_mode;             /* RO - is Scalable Mode supported? */
+    bool snoop_control;             /* RO - is SNP filed supported? */
 
     dma_addr_t root;                /* Current root table pointer */
     bool root_scalable;             /* Type of root table (scalable or not) */
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 4c6c016388..32471a44cb 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3030,6 +3030,13 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
     VTDAddressSpace *vtd_as = container_of(iommu, VTDAddressSpace, iommu);
     IntelIOMMUState *s = vtd_as->iommu_state;
 
+    /* TODO: add support for VFIO and vhost users */
+    if (s->snoop_control) {
+        error_setg_errno(errp, -ENOTSUP,
+                         "Snoop Control with vhost or VFIO is not supported");
+        return -ENOTSUP;
+    }
+
     /* Update per-address-space notifier flags */
     vtd_as->notifier_flags = new;
 
@@ -3113,6 +3120,7 @@ static Property vtd_properties[] = {
                       VTD_HOST_ADDRESS_WIDTH),
     DEFINE_PROP_BOOL("caching-mode", IntelIOMMUState, caching_mode, FALSE),
     DEFINE_PROP_BOOL("x-scalable-mode", IntelIOMMUState, scalable_mode, FALSE),
+    DEFINE_PROP_BOOL("snoop-control", IntelIOMMUState, snoop_control, false),
     DEFINE_PROP_BOOL("dma-drain", IntelIOMMUState, dma_drain, true),
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -3643,7 +3651,7 @@ static void vtd_init(IntelIOMMUState *s)
     vtd_spte_rsvd_large[3] = VTD_SPTE_LPAGE_L3_RSVD_MASK(s->aw_bits,
                                                          x86_iommu->dt_supported);
 
-    if (s->scalable_mode) {
+    if (s->scalable_mode || s->snoop_control) {
         vtd_spte_rsvd[1] &= ~VTD_SPTE_SNP;
         vtd_spte_rsvd_large[2] &= ~VTD_SPTE_SNP;
         vtd_spte_rsvd_large[3] &= ~VTD_SPTE_SNP;
@@ -3674,6 +3682,10 @@ static void vtd_init(IntelIOMMUState *s)
         s->ecap |= VTD_ECAP_SMTS | VTD_ECAP_SRS | VTD_ECAP_SLTS;
     }
 
+    if (s->snoop_control) {
+        s->ecap |= VTD_ECAP_SC;
+    }
+
     vtd_reset_caches(s);
 
     /* Define registers with default values and bit semantics */
-- 
MST


