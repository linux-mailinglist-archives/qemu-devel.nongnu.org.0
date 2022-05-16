Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D7F5292EB
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:34:29 +0200 (CEST)
Received: from localhost ([::1]:49172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiMG-0002qM-IX
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhj1-0000XO-4a
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:53:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhiz-0006gA-KV
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:53:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KkHFCCAQZCxLhXASgQO3md5ERE8E9QGhI2Gkkwoba2E=;
 b=bEAMaqNiKZwfpCpyPsInWxaN2aRc0SMflFhQwLI0deB7Bk53IjxsLcSSFyHfV/BS0+jmi4
 eSd/FCqKDfkjNZqpNErtsJgUMYGgjkN/JnW0qscl+5aSzwDADdKk5Np7cZT+ke1AE8aHiJ
 u+uRFfb+JC+NP2bPUfUoOcgL7G/jKe0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-EilRgT1TNpK4rChvzs2e1Q-1; Mon, 16 May 2022 16:53:50 -0400
X-MC-Unique: EilRgT1TNpK4rChvzs2e1Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 cz24-20020a0564021cb800b00425dfdd7768so10497431edb.2
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KkHFCCAQZCxLhXASgQO3md5ERE8E9QGhI2Gkkwoba2E=;
 b=bazAKppRjEDGWs0RmWTeQLKMgm3CbEN18F2mWkh+bJe3COd1q2TlZok2uTwva+ASI+
 WT4kdSLGmvgHUWgEFGlXB6Nw8VpPuI2/bYnwVEX7LnDNOPYQarFn7Lpmds06hfqZg+P9
 ZkwPzVymc/31E1/xi1P19yzDF0eMZLpMnqRYm8yEWq2TXjdSPMMJQBBrdK9uPuur0cUZ
 4dRd7i4zEeHdxdcAfmggCDnDWwKFXBA09swP4rXIwS3BkaAZQTBGTSzJvsxwll2ave0M
 qAAw8HFWUHRc0Toy/NY37+6j3g4h1Kkl1xfT7CxDWfujbjNExzzMTql/+AGbvEaCS4ro
 28hw==
X-Gm-Message-State: AOAM532Dxz/8l+t3DJ3VvnK0E3oyd3CjowX+Lc4AIg/+JMgBy8P3YOIi
 K9KvgomS4B+15euxNAhbAmtrrGGWw3tEjwl/qMVqJCW1zLBH+uGNrOmFXjewxOnoNj8Tjd+ikyg
 U2eT1ZTMojYBqM/1C/6TigIW2FvBiT6CC79Kaytyuq0JY54MA+zX3X3TSAAH6
X-Received: by 2002:a17:907:3faa:b0:6f4:da62:6729 with SMTP id
 hr42-20020a1709073faa00b006f4da626729mr16239603ejc.747.1652734423128; 
 Mon, 16 May 2022 13:53:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeNLRY/ZRVZUItej4spnUpIF7aBWA0QCqQSZsHwtGVZbnOlcS9KgyH1RDF2qu8v+00cH62tA==
X-Received: by 2002:a17:907:3faa:b0:6f4:da62:6729 with SMTP id
 hr42-20020a1709073faa00b006f4da626729mr16239580ejc.747.1652734422855; 
 Mon, 16 May 2022 13:53:42 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 ia7-20020a170907a06700b006f3ef214df5sm166540ejc.91.2022.05.16.13.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:53:42 -0700 (PDT)
Date: Mon, 16 May 2022 16:53:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL v2 51/86] intel_iommu: Only allow interrupt remapping to be
 enabled if it's supported
Message-ID: <20220516204913.542894-52-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
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

From: David Woodhouse <dwmw@amazon.co.uk>

We should probably check if we were meant to be exposing IR, before
letting the guest turn the IRE bit on.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Peter Xu <peterx@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20220314142544.150555-3-dwmw2@infradead.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/intel_iommu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index b22376a45d..d3361c8313 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -2209,6 +2209,7 @@ static void vtd_handle_gcmd_ire(IntelIOMMUState *s, bool en)
 /* Handle write to Global Command Register */
 static void vtd_handle_gcmd_write(IntelIOMMUState *s)
 {
+    X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(s);
     uint32_t status = vtd_get_long_raw(s, DMAR_GSTS_REG);
     uint32_t val = vtd_get_long_raw(s, DMAR_GCMD_REG);
     uint32_t changed = status ^ val;
@@ -2230,7 +2231,8 @@ static void vtd_handle_gcmd_write(IntelIOMMUState *s)
         /* Set/update the interrupt remapping root-table pointer */
         vtd_handle_gcmd_sirtp(s);
     }
-    if (changed & VTD_GCMD_IRE) {
+    if ((changed & VTD_GCMD_IRE) &&
+        x86_iommu_ir_supported(x86_iommu)) {
         /* Interrupt remap enable/disable */
         vtd_handle_gcmd_ire(s, val & VTD_GCMD_IRE);
     }
-- 
MST


