Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E80615292D8
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:27:29 +0200 (CEST)
Received: from localhost ([::1]:60900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiFV-0007pg-1J
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhir-0000B3-Cb
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:53:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhip-0006fV-Ii
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:53:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8OlH2GLBbAl/C+yvBw7JgW0DdlcImx+GvEu27J9RNL0=;
 b=C6KlwTOvRx7gwXwQGSR63mU2vgT/4vvXyNd3pbnz7g24HH3tmt3Sk/GBeKwXWWnz7Mrzi/
 6TIeuqKmzoJm60uRbzdrOhe+4CY7NiSYCRS2m/5gfpwBmzxaClODlh7onM00xddskps6IU
 rhJo3LQhBD5VsU4OG4XVRB28EsaWiWk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-Ydf8I5UiMwaznEGlt1S7kw-1; Mon, 16 May 2022 16:53:40 -0400
X-MC-Unique: Ydf8I5UiMwaznEGlt1S7kw-1
Received: by mail-ed1-f71.google.com with SMTP id
 r8-20020a056402018800b00428b43999feso10516899edv.5
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8OlH2GLBbAl/C+yvBw7JgW0DdlcImx+GvEu27J9RNL0=;
 b=tH9nfHJdDqYchSyvHmO9Iv1Hh+85w0eTq8wLcden0owUS470eVNANrJjOKjhDyonWL
 nqrDi3/9HkrMs82rE7Q8EHC5ky00fEKLKGlcwS5pYr/go3qoz9WBxaVnlSOoB4MfiAGr
 501QyINJhxrAFMX68MsDxMLxP3xVWxUpXRMNFjU+lmdAUScTMiu7mfCUuXSHKZtFney3
 3EBeBixm6yNX4lEtGrYLhQAUVJn6RBnDDmAhuHaUG1+bt/S69UPyVQzvLkcqkaxxFcea
 OJ2c4WhRho3VRzSiwHyfBW3K3qXnwlRTKko+OPf+FU/IboU/WAbf1qHqZ8CCysJTXbDa
 GDlQ==
X-Gm-Message-State: AOAM5315NyCukUqWsVXSYfCJxkyuVJ6CHuF8yHv21YKy1IhV64UphtwJ
 QVXG+sLjoo5FdwcL8OG8dMWEN2vUubrL1hUwAbiV9j2QzEtxuSxwoFepd36Y5bDgn4uZBNIJTQ2
 WVHfFYUDy1hHJ98EfnpVWpolrTRYYyIpyLcWwAn6uQGcguZ0Y7rUU3Bc52xw9
X-Received: by 2002:a17:906:c142:b0:6f5:2632:adb7 with SMTP id
 dp2-20020a170906c14200b006f52632adb7mr16817137ejc.637.1652734418582; 
 Mon, 16 May 2022 13:53:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRyTwL5/q4loqJegBPMdTvDvhPOFewO31WYVkUzBBKZyNt6WsImN8sPSDs9lQM4/kM31umKA==
X-Received: by 2002:a17:906:c142:b0:6f5:2632:adb7 with SMTP id
 dp2-20020a170906c14200b006f52632adb7mr16817116ejc.637.1652734418327; 
 Mon, 16 May 2022 13:53:38 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 jx1-20020a170907760100b006f3ef214d9fsm186790ejc.5.2022.05.16.13.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:53:37 -0700 (PDT)
Date: Mon, 16 May 2022 16:53:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL v2 50/86] intel_iommu: Support IR-only mode without DMA
 translation
Message-ID: <20220516204913.542894-51-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
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


