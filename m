Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0B72D48D6
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:24:21 +0100 (CET)
Received: from localhost ([::1]:48972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn48S-0006Lf-9K
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:24:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3rr-0001NK-EL
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:07:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3rn-0007hL-3j
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:07:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LOFadtS8P+HipB+dMXVoHfndgHAL2KBXN7L2k6t4OKo=;
 b=K4EIRLe5Gdrr0/j1zxdJwQNFu2lWuOmBL6QyVBS1C9wNKicYvCNIkVwY+TxHwkpu1UTuAd
 EUfIRO/vlSN4b2fl8ENb7ggjTClblFjN2yPiCcnuzDIDwqNGSsrQBchKDJrV3jPxMD3iIe
 MIeQVFHRQWxr4QrZa94M6e9IZXTrCsY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-vvfGoUx7OyKa56WUaK2Mzw-1; Wed, 09 Dec 2020 13:07:04 -0500
X-MC-Unique: vvfGoUx7OyKa56WUaK2Mzw-1
Received: by mail-wm1-f71.google.com with SMTP id w204so67879wmb.1
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:07:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LOFadtS8P+HipB+dMXVoHfndgHAL2KBXN7L2k6t4OKo=;
 b=OfabGsF2yFT0yB1ABV0v/4NcWVKxjY7aozCweLSJERjKJCK5ijqH7nc0dlMulZyv0o
 VCID7lVqwhrJ3ZsQiV2xd1l6NUxkaqgUs02+cxSSXv+kjsuik3p0QL5nhfagB7S3nmtE
 qqNPS1kwZBBKO3gRuxV3Dw/lnY35SE8QA0MqNpM3mhI5hr3OTAmPBd6j8qH3TYlQXY1C
 T8qzVP6GD4lEylpbjj5mIfUUnFKY8JkwNW87Gsz3ztFnNufD0b/ON/aLRctmDWnK7oJ8
 f+1EKnr68OtLgNDze8wM/VwGShz+uyPceRbbRai5GhlkogsG05JVTHLlXQGNYi+O2gVT
 CbJw==
X-Gm-Message-State: AOAM533qyqYLcjYo8q/A6fbX/oBCUe2I+ftYJ945wpNSPUeklOLcd383
 TAK2MWDzNEJSLsyct6Eq3WfZEwd2yzf3iK7x9T37ptzDcinVKtqdlQmg1KmsbIKZg4gswOeHGBw
 uPIxweicfwwkaLyMAcAf7lZXI3bybPkfOcWAcVs2L/Ovpdra77H6xoStNWnzD
X-Received: by 2002:a1c:8d:: with SMTP id 135mr4029082wma.177.1607537223007;
 Wed, 09 Dec 2020 10:07:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHfJ7MYa1kXzjTDN8xixjgO33PvTWzOMDZCOtTV7HAKadoDFi5VvVkzoiZYJK9d6Rin5N9IA==
X-Received: by 2002:a1c:8d:: with SMTP id 135mr4029048wma.177.1607537222732;
 Wed, 09 Dec 2020 10:07:02 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id c81sm5207541wmd.6.2020.12.09.10.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:07:02 -0800 (PST)
Date: Wed, 9 Dec 2020 13:06:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 05/65] intel_iommu: Skip page walking on device iotlb
 invalidations
Message-ID: <20201209180546.721296-6-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


