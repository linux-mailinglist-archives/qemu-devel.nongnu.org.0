Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 011E161DCD6
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:55:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMr8-0001DB-KG; Sat, 05 Nov 2022 13:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMp9-0007od-OG
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:19:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMp8-0007q0-6W
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:19:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OfVKZLKpfkjYRt7QQ5s2jmkYW3qMCFNgmh3cfyEVChE=;
 b=IteeO6KErkYpzgQwSrP/gVgmowD6i/fjMxQLXFATra6USI07qYkOyhNBakAFBDsywuCulT
 BTb6sXza74XBAyuvvtt0gI08A0um8p719Plg0L4uvkrCUNEy/uJvXfqrbClid0sMeCaQ4f
 Tb6LFv+OtP/72PsmEXLiwmaXM1MUG3g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-251-qJo0ywzyOtKAR9KZq3fsDA-1; Sat, 05 Nov 2022 13:19:12 -0400
X-MC-Unique: qJo0ywzyOtKAR9KZq3fsDA-1
Received: by mail-wm1-f71.google.com with SMTP id
 l42-20020a05600c1d2a00b003cf8e70c1ecso2470327wms.4
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OfVKZLKpfkjYRt7QQ5s2jmkYW3qMCFNgmh3cfyEVChE=;
 b=797/MtkumFJBu7fgWc/HgaG92VBYzYwfo2H67Tw45xgRRtfMG0PvjId0y5OXon2sM2
 d4kNtUR5XxKsupuipGWpZAXqdV9zupKe77y46eHRxP5uRETWH6Xj2MmkCx2jJSV47aFC
 0okRkWRHFtdKtGlpF8FyarooNTik0/FthFpJJKHa5FIRtbVCqpaMusZylk8o9Rf3rEIs
 FGJJd5v2bgtSy0rnH8SY1KlltXXJ61GBXUWr6toqwVVtBivQR+HUbuhyX2UHe98OM719
 Q4/1Di7DCf/piA9tQcIoDggBpslqjMB62N1O+BXTuQ3bfL1yrUOCHedDNMPxKFhSoOtK
 zqTA==
X-Gm-Message-State: ACrzQf3mI5+MV3RBuMpxb9ASWsomATE3yPIPicn2rxXZtLSkdRS8HBdn
 UgyMZyNDOi+Y+2qBRPUq/ffY7E//LmF+9Q0wWNw+XL/uLU6H4OUKE3NNereS8CfiqYLRtj5KS6w
 8d96k2ptqbEzWwhZQcP1ZtbpM5nbtEfF587eoeBhjb4mUVsuzyFeQE9ZW6fnj
X-Received: by 2002:adf:e64e:0:b0:236:76a9:446 with SMTP id
 b14-20020adfe64e000000b0023676a90446mr26892876wrn.696.1667668750930; 
 Sat, 05 Nov 2022 10:19:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5eM06V8hZymK9cvobN5fT8dRdeKKh6a7Hk2ccippALhtMRqFE7AkRdumaev/9dM6RJxHhN8w==
X-Received: by 2002:adf:e64e:0:b0:236:76a9:446 with SMTP id
 b14-20020adfe64e000000b0023676a90446mr26892855wrn.696.1667668750607; 
 Sat, 05 Nov 2022 10:19:10 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 ck17-20020a5d5e91000000b002383e977920sm2594430wrb.110.2022.11.05.10.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:19:10 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:19:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 Yi Liu <yi.l.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL v3 76/81] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
Message-ID: <20221105171116.432921-77-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Jason Wang <jasowang@redhat.com>

We use to warn on wrong rid2pasid entry. But this error could be
triggered by the guest and could happens during initialization. So
let's don't warn in this case.

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221028061436.30093-2-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Yi Liu <yi.l.liu@intel.com>
---
 hw/i386/intel_iommu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 6524c2ee32..271de995be 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -1554,8 +1554,10 @@ static bool vtd_dev_pt_enabled(IntelIOMMUState *s, VTDContextEntry *ce)
     if (s->root_scalable) {
         ret = vtd_ce_get_rid2pasid_entry(s, ce, &pe);
         if (ret) {
-            error_report_once("%s: vtd_ce_get_rid2pasid_entry error: %"PRId32,
-                              __func__, ret);
+            /*
+             * This error is guest triggerable. We should assumt PT
+             * not enabled for safety.
+             */
             return false;
         }
         return (VTD_PE_GET_TYPE(&pe) == VTD_SM_PASID_ENTRY_PT);
@@ -1569,14 +1571,12 @@ static bool vtd_as_pt_enabled(VTDAddressSpace *as)
 {
     IntelIOMMUState *s;
     VTDContextEntry ce;
-    int ret;
 
     assert(as);
 
     s = as->iommu_state;
-    ret = vtd_dev_to_context_entry(s, pci_bus_num(as->bus),
-                                   as->devfn, &ce);
-    if (ret) {
+    if (vtd_dev_to_context_entry(s, pci_bus_num(as->bus), as->devfn,
+                                 &ce)) {
         /*
          * Possibly failed to parse the context entry for some reason
          * (e.g., during init, or any guest configuration errors on
-- 
MST


