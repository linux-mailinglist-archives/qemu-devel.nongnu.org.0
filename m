Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A964D2D32C6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 20:45:00 +0100 (CET)
Received: from localhost ([::1]:48906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmiux-0004zV-Nx
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 14:44:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmikY-0004y1-6P
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:34:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmikU-0004kH-Q9
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:34:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LOFadtS8P+HipB+dMXVoHfndgHAL2KBXN7L2k6t4OKo=;
 b=Ar6tci71d3O6yGdGrHtsfVDTHrsRi0brpNqcd85kXxzV4ign+F+1bdz8woeb0DeXewULPG
 BuSUz/j5fZZKx8WtTdTx9d7LEjYiDZuw2pVrisNmQwIlg8KtkKubE/1r89tSO7qd6X8lKI
 AxdObh+ZkHjN4P+CRsQxYe+rmL8n08o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-R5egqmnJPcSpQ2z1rGWw8A-1; Tue, 08 Dec 2020 14:33:58 -0500
X-MC-Unique: R5egqmnJPcSpQ2z1rGWw8A-1
Received: by mail-wr1-f71.google.com with SMTP id o12so1747559wrq.13
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:33:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LOFadtS8P+HipB+dMXVoHfndgHAL2KBXN7L2k6t4OKo=;
 b=dr/AJFFDxQ3eWYKIUoBNuB6WDcikaQx5nglMhXkgKrCuEME+A/XDiBi8X779tj/iGL
 aExScgbVazDazL3SrnWqlZyD2gsLmzAG4mtPgWYgFaJACiS2eiL201qVxlVWcOdJUqTY
 mtCbtIByusqBuBD5w34rxugHFWZ07xx/ms/GCCVimq4WFE62qSZ5hYPUo92z039tlzSW
 JLHc8jr5Hwv+vZCteQ/H/yVuOO/iPtMNL35itGEpH8Y4qx9GwxPai7YiqNOxJArlAmbk
 ubZaSjki4Q2pGCMHy7Ckgv0Dq+l3nZiEKgFr/jIQLiXuAKgr0IrtCxNKFvaiGbxhRyDq
 DZNQ==
X-Gm-Message-State: AOAM532YC2TCKSkw9snEGU+R38Z+Pmc6FQRGC2WKDJMqS3pjpNLkRyCG
 jUtlmC6wa7Hkpwwxm2TIQff5hFFY8Lz7SzVAs2TODHGCpdhqjupySruUfVD7kukPoIrIPM33ymm
 CcSbx4jOluu0pqCucAQhg3SRzuHifZ2LWWrivD1DZIsYBYGCcXgZC1DrFOqEH
X-Received: by 2002:a1c:b788:: with SMTP id h130mr5155515wmf.94.1607456037060; 
 Tue, 08 Dec 2020 11:33:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjMCBUSrDaS+HzTauveJ5TLVopsjHsT/6m2PkTHiUGB1xAGgJUPrAjB2hxJhU0EjKxS8Yljw==
X-Received: by 2002:a1c:b788:: with SMTP id h130mr5155497wmf.94.1607456036768; 
 Tue, 08 Dec 2020 11:33:56 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id g78sm5055382wme.33.2020.12.08.11.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:33:56 -0800 (PST)
Date: Tue, 8 Dec 2020 14:33:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/66] intel_iommu: Skip page walking on device iotlb
 invalidations
Message-ID: <20201208193307.646726-6-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


