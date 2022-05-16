Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326D7528385
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:49:54 +0200 (CEST)
Received: from localhost ([::1]:37606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZEX-0004bM-9a
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY7m-0000Sd-VH
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:38:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY7l-0005Ww-BY
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:38:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O8wI52pqlMCFB1khh+cTnO6p9uc6A9BWzkp+MixRkFA=;
 b=Fh/wUDc4CCwnxEsCg6gkjHmr52Dtxqu07+5EWRFf7av4KXibeJJE2c4oUQ5sB+Ihh5YQbI
 NO38wOwf7aI59ZKGjeTa5GfW+pHarF/3DPgpAmR0Od1nw+u5BbMpCndqeMTiiaIP4DVgUK
 +WG+k7rT03Jc+IZePxBxm/6eebAiF2s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-e8muR_S0McKgLyRNZRb_xg-1; Mon, 16 May 2022 06:38:47 -0400
X-MC-Unique: e8muR_S0McKgLyRNZRb_xg-1
Received: by mail-wm1-f70.google.com with SMTP id
 e9-20020a05600c4e4900b00394779649b1so10152477wmq.3
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O8wI52pqlMCFB1khh+cTnO6p9uc6A9BWzkp+MixRkFA=;
 b=a4c0S9khmMPvye5JQdFsYMgZuo8v17JDWTHGos2OvxLvmj7slO/UcYqGXBuDDLHTCW
 dNTpbc6FqCAaTw25FS9ElafhCJwryUBhf7YKPpCT55qM1Cd6zkghRiK0498uC/X6or35
 MjuLCneM0yltSj5c/nRTeuZQBQfpxP+7yYWFN6PA6TZHsw8T2ySY+ycVBmRgWmhI2FLF
 wNoFMzYk8WSxi4UYUbgk2jE5Ryie0CfCf3kqrhLutEr/JUafhors+5sU5u4x+tFW37Oy
 +vUqCVt66LP1+d1b4dLbqFnkNHi8QSVJ7I0ERly4w+VheNz26nvA1kSRZMLQAYT3t0HO
 GLjQ==
X-Gm-Message-State: AOAM531NvB/LwiRrQixsrSExxS4Jpfxcsy/KFh/+GwwHdzGcFbugcXjC
 Y6Z1Fm/D5fM9lpc2jL1VVFqBxX/1nhyjMQ9ANx7E+CZJPsyxJA/CwuucnXaz+4BxEPiPzM8kOAN
 0VauA9GVUJg/B5upaKJ/IVO9QXusS3W3OzoyRuBHJYOH4YMsqs2ECpJuBaKyV
X-Received: by 2002:adf:e584:0:b0:20d:841:4929 with SMTP id
 l4-20020adfe584000000b0020d08414929mr3957769wrm.284.1652697526277; 
 Mon, 16 May 2022 03:38:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuLkAEfUL89HA70zztNjrXms9qXLAY7oPF3Ju3QgBvgejHPjzeD06CArpunRYgNdBIMrDK9A==
X-Received: by 2002:adf:e584:0:b0:20d:841:4929 with SMTP id
 l4-20020adfe584000000b0020d08414929mr3957751wrm.284.1652697525980; 
 Mon, 16 May 2022 03:38:45 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 v2-20020a05600c15c200b00395f15d993fsm4468582wmf.5.2022.05.16.03.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:38:45 -0700 (PDT)
Date: Mon, 16 May 2022 06:38:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 53/91] intel-iommu: remove VTD_FR_RESERVED_ERR
Message-ID: <20220516095448.507876-54-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Jason Wang <jasowang@redhat.com>

This fault reason is not used and is duplicated with SPT.2 condition
code. So let's remove it.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20220210092815.45174-1-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 hw/i386/intel_iommu_internal.h | 5 -----
 hw/i386/intel_iommu.c          | 6 ------
 2 files changed, 11 deletions(-)

diff --git a/hw/i386/intel_iommu_internal.h b/hw/i386/intel_iommu_internal.h
index 1ff13b40f9..b6a2da8e83 100644
--- a/hw/i386/intel_iommu_internal.h
+++ b/hw/i386/intel_iommu_internal.h
@@ -304,11 +304,6 @@ typedef enum VTDFaultReason {
 
     VTD_FR_PASID_TABLE_INV = 0x58,  /*Invalid PASID table entry */
 
-    /* This is not a normal fault reason. We use this to indicate some faults
-     * that are not referenced by the VT-d specification.
-     * Fault event with such reason should not be recorded.
-     */
-    VTD_FR_RESERVED_ERR,
     VTD_FR_MAX,                 /* Guard */
 } VTDFaultReason;
 
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index d310532108..8af2e39151 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -469,11 +469,6 @@ static void vtd_report_dmar_fault(IntelIOMMUState *s, uint16_t source_id,
 
     assert(fault < VTD_FR_MAX);
 
-    if (fault == VTD_FR_RESERVED_ERR) {
-        /* This is not a normal fault reason case. Drop it. */
-        return;
-    }
-
     trace_vtd_dmar_fault(source_id, fault, addr, is_write);
 
     if (fsts_reg & VTD_FSTS_PFO) {
@@ -1637,7 +1632,6 @@ static const bool vtd_qualified_faults[] = {
     [VTD_FR_PAGING_ENTRY_RSVD] = true,
     [VTD_FR_CONTEXT_ENTRY_TT] = true,
     [VTD_FR_PASID_TABLE_INV] = false,
-    [VTD_FR_RESERVED_ERR] = false,
     [VTD_FR_MAX] = false,
 };
 
-- 
MST


