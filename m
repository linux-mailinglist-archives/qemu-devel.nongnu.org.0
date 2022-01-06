Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EBC4865A0
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:56:27 +0100 (CET)
Received: from localhost ([::1]:39144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TFi-0001Ys-44
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:56:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sf3-0005bE-53
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sev-00013c-AA
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0ZXDQGGu0GtQDGXbNWl1ocN1Tqho3+nSq7/StQ09538=;
 b=O8dPLUslE/0unLcPKXkiRxa2qKFE7+mNJ/v/JQbJuYqElJa87gJkpWJxi6EKth/nzh4ZRO
 nyIFHlOkLaeYDdqIf4dqoUAVCmt+PJJl1scVdMgWB1KnWTXThneoOsxh/9XAzhbK13AbmQ
 QpWKZQsMx6NXtqPnWNItvJ7XMSAILbM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-OIYP1ub0MM2Orb9rLEdprg-1; Thu, 06 Jan 2022 08:18:23 -0500
X-MC-Unique: OIYP1ub0MM2Orb9rLEdprg-1
Received: by mail-ed1-f72.google.com with SMTP id
 s7-20020a056402520700b003f841380832so1943185edd.5
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:18:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0ZXDQGGu0GtQDGXbNWl1ocN1Tqho3+nSq7/StQ09538=;
 b=CGagaV6VGBqE6veMeWk5Qk/dt4bXgSaurmr1q5D8K3LgXx9ZpjvqvcHGA1vwjfhA1/
 E+NoRTUKYJW8lrUycGL+X9FsfNsphUnfkAhO1gDvPdGJb2JcrIse1IpX9mT6zFq30WcP
 FZi7BwySjGoA2GwdzVqb6JkIEzPX9NilhHRDnSMGm/eTNZv0h9WBQY5UDLumrGgOMbYr
 C9qSk5l4pcdC/NSSwc49rzDSX3wWsjYo8gQZezf9AfQWBjWydInHBGHOcxH1QUYdQlZ0
 4Y6GaPpHJHbiyUecnGu85Nm/EXGsLCE+DX+bSc2IxZ2iCKfOPqXH9T6B357mVCTZ9qqa
 NKig==
X-Gm-Message-State: AOAM5303U4pUcX638E+ofFMiH+W1BoyJKrQxnKiuS6sQycfqHl3b15+B
 5pKd5RM4Ct/qfjwBbwpsjmPkw50brufVtIgQKnySZsRlqjYjYXuJC89oArXnKa3fgTfyMKHEtvY
 HpWjdBUMer3dT9vxacykR+bH1kbAJNgc7+VI5KYTwKjYjvM3XoQce+uEEMzdf
X-Received: by 2002:a17:906:84f0:: with SMTP id
 zp16mr16694867ejb.477.1641475100940; 
 Thu, 06 Jan 2022 05:18:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPUnwgn65YAkWJ6sYLc03ZLDGB/o1fNqLW+1zfUiFaZP0x2BVP2Ixt0HDamgiO92adHH0tzA==
X-Received: by 2002:a17:906:84f0:: with SMTP id
 zp16mr16694840ejb.477.1641475100607; 
 Thu, 06 Jan 2022 05:18:20 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id hp18sm491497ejc.40.2022.01.06.05.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:18:20 -0800 (PST)
Date: Thu, 6 Jan 2022 08:18:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 42/52] intel-iommu: correctly check passthrough during
 translation
Message-ID: <20220106131534.423671-43-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

When scalable mode is enabled, the passthrough more is not determined
by the context entry but PASID entry, so switch to use the logic of
vtd_dev_pt_enabled() to determine the passthrough mode in
vtd_do_iommu_translate().

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20220105041945.13459-2-jasowang@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/intel_iommu.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 5b865ac08c..4c6c016388 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -1516,11 +1516,29 @@ static int vtd_sync_shadow_page_table(VTDAddressSpace *vtd_as)
  * 1st-level translation or 2nd-level translation, it depends
  * on PGTT setting.
  */
-static bool vtd_dev_pt_enabled(VTDAddressSpace *as)
+static bool vtd_dev_pt_enabled(IntelIOMMUState *s, VTDContextEntry *ce)
+{
+    VTDPASIDEntry pe;
+    int ret;
+
+    if (s->root_scalable) {
+        ret = vtd_ce_get_rid2pasid_entry(s, ce, &pe);
+        if (ret) {
+            error_report_once("%s: vtd_ce_get_rid2pasid_entry error: %"PRId32,
+                              __func__, ret);
+            return false;
+        }
+        return (VTD_PE_GET_TYPE(&pe) == VTD_SM_PASID_ENTRY_PT);
+    }
+
+    return (vtd_ce_get_type(ce) == VTD_CONTEXT_TT_PASS_THROUGH);
+
+}
+
+static bool vtd_as_pt_enabled(VTDAddressSpace *as)
 {
     IntelIOMMUState *s;
     VTDContextEntry ce;
-    VTDPASIDEntry pe;
     int ret;
 
     assert(as);
@@ -1538,17 +1556,7 @@ static bool vtd_dev_pt_enabled(VTDAddressSpace *as)
         return false;
     }
 
-    if (s->root_scalable) {
-        ret = vtd_ce_get_rid2pasid_entry(s, &ce, &pe);
-        if (ret) {
-            error_report_once("%s: vtd_ce_get_rid2pasid_entry error: %"PRId32,
-                              __func__, ret);
-            return false;
-        }
-        return (VTD_PE_GET_TYPE(&pe) == VTD_SM_PASID_ENTRY_PT);
-    }
-
-    return (vtd_ce_get_type(&ce) == VTD_CONTEXT_TT_PASS_THROUGH);
+    return vtd_dev_pt_enabled(s, &ce);
 }
 
 /* Return whether the device is using IOMMU translation. */
@@ -1560,7 +1568,7 @@ static bool vtd_switch_address_space(VTDAddressSpace *as)
 
     assert(as);
 
-    use_iommu = as->iommu_state->dmar_enabled && !vtd_dev_pt_enabled(as);
+    use_iommu = as->iommu_state->dmar_enabled && !vtd_as_pt_enabled(as);
 
     trace_vtd_switch_address_space(pci_bus_num(as->bus),
                                    VTD_PCI_SLOT(as->devfn),
@@ -1753,7 +1761,7 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
      * We don't need to translate for pass-through context entries.
      * Also, let's ignore IOTLB caching as well for PT devices.
      */
-    if (vtd_ce_get_type(&ce) == VTD_CONTEXT_TT_PASS_THROUGH) {
+    if (vtd_dev_pt_enabled(s, &ce)) {
         entry->iova = addr & VTD_PAGE_MASK_4K;
         entry->translated_addr = entry->iova;
         entry->addr_mask = ~VTD_PAGE_MASK_4K;
-- 
MST


