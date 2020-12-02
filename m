Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C42F92CBB75
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 12:22:13 +0100 (CET)
Received: from localhost ([::1]:34512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkQD6-00048T-OF
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 06:22:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkPzT-0006lW-0p
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:08:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkPzQ-0004Yc-Kd
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:08:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606907283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LOFadtS8P+HipB+dMXVoHfndgHAL2KBXN7L2k6t4OKo=;
 b=itmuQvkehMAaUGVUrepB0jtpU4MWfm9JKC3cr4xXITdBBRjyED3nO/OY71LqmC6GVmnXw5
 p2Q1/W1sOdBmhdyZaf5+twSPpWs9saTsA92IvZO2xkyyCvVHyC8dSMLU5a1khvyLtSmRWn
 udnzLx7vVfKs96EbGbcUIXtv97UYXuA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-emRIhzgXNkOPA0fxQES1Nw-1; Wed, 02 Dec 2020 06:03:24 -0500
X-MC-Unique: emRIhzgXNkOPA0fxQES1Nw-1
Received: by mail-wr1-f69.google.com with SMTP id w17so3327780wrl.8
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 03:03:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LOFadtS8P+HipB+dMXVoHfndgHAL2KBXN7L2k6t4OKo=;
 b=h7Ayg+tFqzAIJfMkcufzqoskD/vVd9pjtO3Qi18DBxR6SHjiiAPwKLhDvGloM4kQp/
 Kmm1jP5nuzxINU07dOhWqSZ5Pmy0F15GxF8voeyVoi1lnKmJlXbPJ1ewZMe7Ix0G7l5T
 k69Yg06O5Tl3p/nUDqd11xS4N4tLcFzIVydYe4kwHUvbFh3rWz+wPBza8X29LV+DhNA7
 M1PGFRTBZ41n/Kdzf0B713i4n7TiQfx7gilbInuxt2KF2rbCyvf7N8323cehhJpPh6x1
 GXRcewBpsdKSwZ3rmux+Col39qqT2W8o+aXdP4y+Kde7OUmlpQXHO8Gzw2wo5p9zvSBE
 2RYw==
X-Gm-Message-State: AOAM531meN9NuuuFv5oNUuRmIZg+jBzVK9EtNWmmB/Sv1afjC1vYFwmo
 htGw+r6+zXDNoNwTT0XYRrkENXFwoV34flDRyISdvMNQFXfzsY4UCbb4Nqin4JmZvucSVVcrcvk
 46+lhTMdVfPESZLRuxA35Tm/b+Ooz3c1AzoVGLfcW2TnXmGBIl7odLoHYCB6Z
X-Received: by 2002:adf:dd09:: with SMTP id a9mr2736169wrm.128.1606907002926; 
 Wed, 02 Dec 2020 03:03:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZEcw9h18148/+x9Vx8uxRpofgzQNaSfwww6H0KZDfXX4pDEhfZuivS7KGY9UdXBTNKu0C1g==
X-Received: by 2002:adf:dd09:: with SMTP id a9mr2736043wrm.128.1606907001659; 
 Wed, 02 Dec 2020 03:03:21 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id i16sm1667455wru.92.2020.12.02.03.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 03:03:21 -0800 (PST)
Date: Wed, 2 Dec 2020 06:03:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/6] intel_iommu: Skip page walking on device iotlb
 invalidations
Message-ID: <20201202101655.122214-6-mst@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
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
 Eduardo Habkost <ehabkost@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

Although they didn't reach the notifier because of the filtering in
memory_region_notify_iommu_one, the vt-d was still splitting huge
memory invalidations in chunks. Skipping it.

This improves performance in case of netperf with vhost-net:
* TCP_STREAM: From 1923.6Mbit/s to 2175.13Mbit/s (13%)
* TCP_RR: From 8464.73 trans/s to 8932.703333 trans/s (5.5%)
* UDP_RR: From 8562.08 trans/s to 9005.62/s (5.1%)
* UDP_STREAM: No change observed (insignificant 0.1% improvement)

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20201116165506.31315-5-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/intel_iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index edc3090f91..0cc71e4057 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -1478,6 +1478,10 @@ static int vtd_sync_shadow_page_table(VTDAddressSpace *vtd_as)
     VTDContextEntry ce;
     IOMMUNotifier *n;
 
+    if (!(vtd_as->iommu.iommu_notify_flags & IOMMU_NOTIFIER_IOTLB_EVENTS)) {
+        return 0;
+    }
+
     ret = vtd_dev_to_context_entry(vtd_as->iommu_state,
                                    pci_bus_num(vtd_as->bus),
                                    vtd_as->devfn, &ce);
-- 
MST


