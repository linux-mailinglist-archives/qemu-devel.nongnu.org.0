Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BDA4CFB6A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:37:22 +0100 (CET)
Received: from localhost ([::1]:56238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAjx-0003Fr-F4
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:37:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRACq-0002El-Jo
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRACp-0002pn-29
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wqPGtWFCVDPRGhVgRp/c/kDyoLIXiZZqdrhcBaAKsjU=;
 b=bBLMJZQJA/JdPQJfOSpFsaZpAZVsW2DNYQpX4wLltDrOkSNI1EAVhU/DxJRJMThl6B93m8
 /qgVkvvmTVNohw6xO0ce2AbO9YeqlVkr0nJl1rZ5PomMio2B1lH0iFAYQtRpok+87q/tCH
 SLdYFfP5U7/aZ2oa4qJP9pg/3rCzkds=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-CJHyleHVPpKkZh-qbs0pHw-1; Mon, 07 Mar 2022 05:02:27 -0500
X-MC-Unique: CJHyleHVPpKkZh-qbs0pHw-1
Received: by mail-ej1-f69.google.com with SMTP id
 go11-20020a1709070d8b00b006cf0d933739so6746603ejc.5
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:02:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wqPGtWFCVDPRGhVgRp/c/kDyoLIXiZZqdrhcBaAKsjU=;
 b=QeOGZY6w2b/WJtVnrzczfn71IQgazR9mqxvIy9oaWB4EILJQCAv1oyBxLyM8umWXZn
 llUlrM0NFdXjZA7623T7PNfTDOnUPj+h3aI55mXCO7iyabfvp5tgacR1tbJOy+QBSr1K
 uUbILzlbOLYZfzkIsXwY70zrXcBqyNklbw3MhRV9o10sCuM4/rgFlAGhlLisdmLlW/xE
 E2Tdx8iqCtdPl5effk1dg8YRt/nMd2BArIkJ1H81t3Id8TkZ96lq7Y7vEpevE2mdIfZ5
 +LQrM05dMS9hrqcstFOP/d0cbnq9lcZmvtfOGsKcZ/csLwV1K/JkTFG8Q2KUR7aXj0ob
 CMmg==
X-Gm-Message-State: AOAM533g20vblaIY2Z5POzHBUCgMuNGWs0OvmvLNa/eX5ahXeQtyLPK6
 2SZPrHI14B3TZcbdkYYmZhclOQv3jlv4nkUMZMcL2+oCO/ycEJ0L1DPV6/VSuJ4ZwdFqGcnGEwz
 5zvUaWHobgmRWVnQuEaeBOfs5LKudB3shSYLNQPa2AuBr2GOcSDIlM5CLQw6k
X-Received: by 2002:a05:6402:278e:b0:416:5064:b39b with SMTP id
 b14-20020a056402278e00b004165064b39bmr2441142ede.157.1646647345313; 
 Mon, 07 Mar 2022 02:02:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLgxahKK5LBj/t4CFAaNStdt/KB/G2BJhO2apL3GixsFlsnN6+lKJOrxNsnjV1lJaHuvO5Bg==
X-Received: by 2002:a05:6402:278e:b0:416:5064:b39b with SMTP id
 b14-20020a056402278e00b004165064b39bmr2441115ede.157.1646647345107; 
 Mon, 07 Mar 2022 02:02:25 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 z16-20020a05640240d000b004165f6ce23bsm252852edb.24.2022.03.07.02.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:02:24 -0800 (PST)
Date: Mon, 7 Mar 2022 05:02:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 20/47] tests/qtest/virtio-iommu-test: Check bypass config
Message-ID: <20220307100058.449628-21-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
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
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

The bypass config field should be initialized to 1 by default.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Message-Id: <20220214124356.872985-5-jean-philippe@linaro.org>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/virtio-iommu-test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/virtio-iommu-test.c b/tests/qtest/virtio-iommu-test.c
index 47e68388a0..068e7a9e6c 100644
--- a/tests/qtest/virtio-iommu-test.c
+++ b/tests/qtest/virtio-iommu-test.c
@@ -31,11 +31,13 @@ static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
     uint64_t input_range_end = qvirtio_config_readq(dev, 16);
     uint32_t domain_range_start = qvirtio_config_readl(dev, 24);
     uint32_t domain_range_end = qvirtio_config_readl(dev, 28);
+    uint8_t bypass = qvirtio_config_readb(dev, 36);
 
     g_assert_cmpint(input_range_start, ==, 0);
     g_assert_cmphex(input_range_end, ==, UINT64_MAX);
     g_assert_cmpint(domain_range_start, ==, 0);
     g_assert_cmpint(domain_range_end, ==, UINT32_MAX);
+    g_assert_cmpint(bypass, ==, 1);
 }
 
 static int read_tail_status(struct virtio_iommu_req_tail *buffer)
-- 
MST


