Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AE952839B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:57:31 +0200 (CEST)
Received: from localhost ([::1]:57066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZLu-0001Fe-Nw
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY7r-0000fA-6L
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:38:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY7p-0005XC-Fr
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:38:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VTVq5T8b7EGxCTH+Nf30xApsBAleE4GqyWpyK43o+XY=;
 b=dhgDJTHjBRxBDLYTFOTGL5/5O3cljzJSrgdMg6elRC49GdZTJb91B7Fs02VXHmhISp8N3m
 yWuyu9O+fJFBUktkrO8VoSpanWB6S9EZ33y7RlZqz+bTNAajnIXmlIjcgyCZkRtdoI1Vrw
 LVhENg91pmWbjnIlcHARZ8pPZI1Oe/c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-3EU-P7z-PH6b8XH_RB5_wA-1; Mon, 16 May 2022 06:38:51 -0400
X-MC-Unique: 3EU-P7z-PH6b8XH_RB5_wA-1
Received: by mail-wm1-f72.google.com with SMTP id
 k35-20020a05600c1ca300b003946a9764baso10156067wms.1
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VTVq5T8b7EGxCTH+Nf30xApsBAleE4GqyWpyK43o+XY=;
 b=qQkFAOSns0V9SU5gMJQiDg/gzpte4T4ZIlr8sBVqDiZdNaU4FXD4x5h7LghMEEw5gK
 zG9BPfOQqjfttrxsCQtvWmuoaW97qrv18oYwOGlzVfoyzF3Lgq0BM7qXTFfDpzijAR1T
 kbIGKVCS9tn1MYnRsXHGOk/k752P/rOKj3GtR65+542MSKBMPwytJ/bBJpW3l5oCJh+t
 jCSpMehC9QI7Loc02L+v6punJaqKTYfRaYR90XkJf839DE6qB86MFhUGiCkXdhG7CDg9
 AFB6uATTriacPxp2mzLprhoZ1g8XO45IR8CnJZwtuNenOYZF9AGXtnW2IhiDpAndzFqy
 SyRw==
X-Gm-Message-State: AOAM533DtTbzNKoY577DEOA3nkYixfM4fTpVof4raWmobFIbJdvhu0Yr
 aMEIIADumWDcukxcatVQ3or1gKI89D4egqWdC6m6ufj9i1GR8mLppBraTq1yQbS+SOdmV4l1jHD
 INqjD6GVlCG2m/yg9sIjxxZkjJh6PVWP6K+kzzlcYOk6a0GRqTxYzhSDRzdH8
X-Received: by 2002:a7b:ce0a:0:b0:394:41e:2517 with SMTP id
 m10-20020a7bce0a000000b00394041e2517mr26837407wmc.135.1652697530350; 
 Mon, 16 May 2022 03:38:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfRpVt+SPg5hJpufshItFlkSz9VucAnhCyPtrVNO9ylVUzbk5JlfBsXX5Nn4g0Okgv78cDmw==
X-Received: by 2002:a7b:ce0a:0:b0:394:41e:2517 with SMTP id
 m10-20020a7bce0a000000b00394041e2517mr26837380wmc.135.1652697529997; 
 Mon, 16 May 2022 03:38:49 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 r21-20020adfa155000000b0020d0840d2ecsm3052932wrr.93.2022.05.16.03.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:38:49 -0700 (PDT)
Date: Mon, 16 May 2022 06:38:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 54/91] intel-iommu: block output address in interrupt address
 range
Message-ID: <20220516095448.507876-55-mst@redhat.com>
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

According to vtd spec v3.3 3.14:

"""
Software must not program paging-structure entries to remap any
address to the interrupt address range. Untranslated requests and
translation requests that result in an address in the interrupt range
will be blocked with condition code LGN.4 or SGN.8.
"""

This patch blocks the request that result in interrupt address range.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20220210092815.45174-2-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 hw/i386/intel_iommu_internal.h |  4 ++++
 hw/i386/intel_iommu.c          | 27 ++++++++++++++++++++++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/hw/i386/intel_iommu_internal.h b/hw/i386/intel_iommu_internal.h
index b6a2da8e83..930ce61feb 100644
--- a/hw/i386/intel_iommu_internal.h
+++ b/hw/i386/intel_iommu_internal.h
@@ -289,6 +289,8 @@ typedef enum VTDFaultReason {
      * context-entry.
      */
     VTD_FR_CONTEXT_ENTRY_TT,
+    /* Output address in the interrupt address range */
+    VTD_FR_INTERRUPT_ADDR = 0xE,
 
     /* Interrupt remapping transition faults */
     VTD_FR_IR_REQ_RSVD = 0x20, /* One or more IR request reserved
@@ -304,6 +306,8 @@ typedef enum VTDFaultReason {
 
     VTD_FR_PASID_TABLE_INV = 0x58,  /*Invalid PASID table entry */
 
+    /* Output address in the interrupt address range for scalable mode */
+    VTD_FR_SM_INTERRUPT_ADDR = 0x87,
     VTD_FR_MAX,                 /* Guard */
 } VTDFaultReason;
 
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 8af2e39151..695dd51dc3 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -1020,6 +1020,7 @@ static int vtd_iova_to_slpte(IntelIOMMUState *s, VTDContextEntry *ce,
     uint32_t offset;
     uint64_t slpte;
     uint64_t access_right_check;
+    uint64_t xlat, size;
 
     if (!vtd_iova_range_check(s, iova, ce, aw_bits)) {
         error_report_once("%s: detected IOVA overflow (iova=0x%" PRIx64 ")",
@@ -1064,11 +1065,33 @@ static int vtd_iova_to_slpte(IntelIOMMUState *s, VTDContextEntry *ce,
         if (vtd_is_last_slpte(slpte, level)) {
             *slptep = slpte;
             *slpte_level = level;
-            return 0;
+            break;
         }
         addr = vtd_get_slpte_addr(slpte, aw_bits);
         level--;
     }
+
+    xlat = vtd_get_slpte_addr(*slptep, aw_bits);
+    size = ~vtd_slpt_level_page_mask(level) + 1;
+
+    /*
+     * From VT-d spec 3.14: Untranslated requests and translation
+     * requests that result in an address in the interrupt range will be
+     * blocked with condition code LGN.4 or SGN.8.
+     */
+    if ((xlat > VTD_INTERRUPT_ADDR_LAST ||
+         xlat + size - 1 < VTD_INTERRUPT_ADDR_FIRST)) {
+        return 0;
+    } else {
+        error_report_once("%s: xlat address is in interrupt range "
+                          "(iova=0x%" PRIx64 ", level=0x%" PRIx32 ", "
+                          "slpte=0x%" PRIx64 ", write=%d, "
+                          "xlat=0x%" PRIx64 ", size=0x%" PRIx64 ")",
+                          __func__, iova, level, slpte, is_write,
+                          xlat, size);
+        return s->scalable_mode ? -VTD_FR_SM_INTERRUPT_ADDR :
+                                  -VTD_FR_INTERRUPT_ADDR;
+    }
 }
 
 typedef int (*vtd_page_walk_hook)(IOMMUTLBEvent *event, void *private);
@@ -1628,10 +1651,12 @@ static const bool vtd_qualified_faults[] = {
     [VTD_FR_PAGING_ENTRY_INV] = true,
     [VTD_FR_ROOT_TABLE_INV] = false,
     [VTD_FR_CONTEXT_TABLE_INV] = false,
+    [VTD_FR_INTERRUPT_ADDR] = true,
     [VTD_FR_ROOT_ENTRY_RSVD] = false,
     [VTD_FR_PAGING_ENTRY_RSVD] = true,
     [VTD_FR_CONTEXT_ENTRY_TT] = true,
     [VTD_FR_PASID_TABLE_INV] = false,
+    [VTD_FR_SM_INTERRUPT_ADDR] = true,
     [VTD_FR_MAX] = false,
 };
 
-- 
MST


