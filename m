Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48FA528374
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:45:24 +0200 (CEST)
Received: from localhost ([::1]:57102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZAB-0006ke-Ua
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY7b-0008MC-Sf
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:38:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY7a-0005Vu-4S
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:38:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8OlH2GLBbAl/C+yvBw7JgW0DdlcImx+GvEu27J9RNL0=;
 b=UH9FrYtow7XLe0VGB3PqNcNJfIMX9diOrnaS+8cUD/CHJ7bvR6TiBmTE7S4Id1YPmmmaWT
 RTfzRJ/G1ZvD2NSqr6pgHZx2Hv9SWL3pL5pW78XDNvBHOK4HEAy/bk19zSSlRLcahheFYS
 cYoTj4VKeJSPop0JH5yjqzaJs7FkAvs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-SN77qxyNOgevQyms_mp_sg-1; Mon, 16 May 2022 06:38:35 -0400
X-MC-Unique: SN77qxyNOgevQyms_mp_sg-1
Received: by mail-wm1-f69.google.com with SMTP id
 k35-20020a05600c1ca300b003946a9764baso10155713wms.1
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:38:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8OlH2GLBbAl/C+yvBw7JgW0DdlcImx+GvEu27J9RNL0=;
 b=74TBPbgrKfRnBZQH8Csq6WGiMYkELpWxIuLNJmhiyiG0rCNx+fcHUGY6qMyH/64LHn
 C0+OlQ+OOja4LynqsDQVWWJJEFW/VtVaAFUx5nm4kc/3HcPzYI82ZN20uDXlPwSzQKcD
 svqJEQyvcNVtht6FWbtLyOZDFZ1iyc4TzcJvdhPPWegFAD8po79iw1aSR+yi92z73lM9
 KHQ9UvaWgNhMXSTAfQ8SwR/QY4i1b0UrzJZIuk8SxAQ2Tg43AZv5CchqSnvWHA8OSTTX
 8QCA1w2dbkQIgH6/EWTexfaA08x35OlovLfhg6WV5s8LBrhx+0+ISSr0hnwLEI5+mi55
 wABw==
X-Gm-Message-State: AOAM533aCmN5qOHsS8fdUQqQVKxipoDTglVMzlrQPpXlxE8/Una6j3Rs
 pedgljl/5pKlb/rlHBEs59VAvnD8dzWUbTlPNtx7U+w276o+D6vTWBeSYATSInS8LvlrUAfbMVH
 Hsh9kCIEI8Rnhz1ryJrrcGTet2KaAaNp+jUsE8xPTMRBBw6SHkn/m8qFJB8Bn
X-Received: by 2002:a05:600c:3584:b0:394:5870:2c44 with SMTP id
 p4-20020a05600c358400b0039458702c44mr16285233wmq.4.1652697514217; 
 Mon, 16 May 2022 03:38:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGmy7mDXA5XY8JG6/TlKrpHIxexDz703dTLNUAMsZvAiOZZueEFy+y/n2qBQTOj1hPhBn9Ag==
X-Received: by 2002:a05:600c:3584:b0:394:5870:2c44 with SMTP id
 p4-20020a05600c358400b0039458702c44mr16285205wmq.4.1652697513977; 
 Mon, 16 May 2022 03:38:33 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 i12-20020adfb64c000000b0020d07e7895csm3080209wre.59.2022.05.16.03.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:38:33 -0700 (PDT)
Date: Mon, 16 May 2022 06:38:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 50/91] intel_iommu: Support IR-only mode without DMA translation
Message-ID: <20220516095448.507876-51-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: David Woodhouse <dwmw@amazon.co.uk>

By setting none of the SAGAW bits we can indicate to a guest that DMA
translation isn't supported. Tested by booting Windows 10, as well as
Linux guests with the fix at https://git.kernel.org/torvalds/c/c40aaaac10

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Peter Xu <peterx@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20220314142544.150555-2-dwmw2@infradead.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/i386/intel_iommu.h |  1 +
 hw/i386/intel_iommu.c         | 14 ++++++++++----
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
index bfa982a419..67653b0f9b 100644
--- a/include/hw/i386/intel_iommu.h
+++ b/include/hw/i386/intel_iommu.h
@@ -267,6 +267,7 @@ struct IntelIOMMUState {
     bool buggy_eim;                 /* Force buggy EIM unless eim=off */
     uint8_t aw_bits;                /* Host/IOVA address width (in bits) */
     bool dma_drain;                 /* Whether DMA r/w draining enabled */
+    bool dma_translation;           /* Whether DMA translation supported */
 
     /*
      * Protects IOMMU states in general.  Currently it protects the
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index e05d69a2c0..b22376a45d 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -2214,7 +2214,7 @@ static void vtd_handle_gcmd_write(IntelIOMMUState *s)
     uint32_t changed = status ^ val;
 
     trace_vtd_reg_write_gcmd(status, val);
-    if (changed & VTD_GCMD_TE) {
+    if ((changed & VTD_GCMD_TE) && s->dma_translation) {
         /* Translation enable/disable */
         vtd_handle_gcmd_te(s, val & VTD_GCMD_TE);
     }
@@ -3122,6 +3122,7 @@ static Property vtd_properties[] = {
     DEFINE_PROP_BOOL("x-scalable-mode", IntelIOMMUState, scalable_mode, FALSE),
     DEFINE_PROP_BOOL("snoop-control", IntelIOMMUState, snoop_control, false),
     DEFINE_PROP_BOOL("dma-drain", IntelIOMMUState, dma_drain, true),
+    DEFINE_PROP_BOOL("dma-translation", IntelIOMMUState, dma_translation, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -3627,12 +3628,17 @@ static void vtd_init(IntelIOMMUState *s)
     s->next_frcd_reg = 0;
     s->cap = VTD_CAP_FRO | VTD_CAP_NFR | VTD_CAP_ND |
              VTD_CAP_MAMV | VTD_CAP_PSI | VTD_CAP_SLLPS |
-             VTD_CAP_SAGAW_39bit | VTD_CAP_MGAW(s->aw_bits);
+             VTD_CAP_MGAW(s->aw_bits);
     if (s->dma_drain) {
         s->cap |= VTD_CAP_DRAIN;
     }
-    if (s->aw_bits == VTD_HOST_AW_48BIT) {
-        s->cap |= VTD_CAP_SAGAW_48bit;
+    if (s->dma_translation) {
+            if (s->aw_bits >= VTD_HOST_AW_39BIT) {
+                    s->cap |= VTD_CAP_SAGAW_39bit;
+            }
+            if (s->aw_bits >= VTD_HOST_AW_48BIT) {
+                    s->cap |= VTD_CAP_SAGAW_48bit;
+            }
     }
     s->ecap = VTD_ECAP_QI | VTD_ECAP_IRO;
 
-- 
MST


