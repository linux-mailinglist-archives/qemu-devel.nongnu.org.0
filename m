Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2604048763D
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:08:00 +0100 (CET)
Received: from localhost ([::1]:35556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5n6F-0002T2-6D
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:07:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n1h-00062c-Th
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:03:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n1e-0001gp-HK
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:03:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZDYUVmJkHemLI5KByv30OJoOAnuNT00GDgLmkQC7+Is=;
 b=BrGWvxQegRnvTmamb3wxz0wu/igfM1epoTmfH7D3z8dTP+bSnEUsrULJLB/m/oYYlmMsf9
 ZXTQ8VagvZXjOOm4JcmwNiZCQ6DOZVww5IHFRxI0sI8bFGZ/OEE/HoM3zq3+q9JxKR0dZl
 MNJYJI9+GGYKsi0Gvxn+L9zYDQuQnnU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-kfVXy5ffOsW2EZUmGLWLbg-1; Fri, 07 Jan 2022 06:03:13 -0500
X-MC-Unique: kfVXy5ffOsW2EZUmGLWLbg-1
Received: by mail-wr1-f70.google.com with SMTP id
 g6-20020adfbc86000000b001a2d62be244so2087054wrh.23
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:03:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZDYUVmJkHemLI5KByv30OJoOAnuNT00GDgLmkQC7+Is=;
 b=XN7YpoBDkU8lCuy2Dpw9gWJsIODUgNm7GxUxc2rv3YxbXpdo/Ak6O0AlqMxYruCA4g
 S6tFPeOsso2rpilv2ZDsxYOCSfRnZGKtwKWYiBUuXwa/5lbaTImg8KNd27uBCRi1sB9m
 zKQmn50IaEQtCPMRSYwKLOb7Nhtp3WIbQFCxdBjQUCrF1+8NqEjx/4B5tUIx1OUvGKgk
 a2tTfuBSMLVmF2AehIIJynf/i5Cp0O295RQM76NwkwNDvfEo5Zh/LbN92BxP7RkdR/3K
 GeCknr9FuFopuKD72ZT4BDCoRvrzvxHrdzwg1CHb+grh1Uq7GuftVpbbU7IMGL80/6w8
 CraQ==
X-Gm-Message-State: AOAM5326PpWbQ7/ihGvtWGiyabc9h0FMDozGbRU0AtyM3otDHrtX4oxU
 TsAc8sWTCI+zkn6C7blhaGyNFXFuKIxzvQnplM/3Sz3NFNgClrwAFwOif+hMTI9em4iXY3I+pBx
 OQFnEEOx6glOkBFgmrvzj/8mNY5FvVa2/zAoDIHWffEgMDawlC8yu/a32O7Os
X-Received: by 2002:a05:6000:1048:: with SMTP id
 c8mr55719120wrx.508.1641553391402; 
 Fri, 07 Jan 2022 03:03:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFc9WD93lq+eefOIuAYubneC1d9o+bk5vQO59LhPdPg+ud/HFeAmltB0aejxJbV+EIDZQECA==
X-Received: by 2002:a05:6000:1048:: with SMTP id
 c8mr55719101wrx.508.1641553391124; 
 Fri, 07 Jan 2022 03:03:11 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id u11sm4324946wmq.2.2022.01.07.03.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:03:10 -0800 (PST)
Date: Fri, 7 Jan 2022 06:03:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 01/55] virtio-mem: Don't skip alignment checks when warning
 about block size
Message-ID: <20220107102526.39238-2-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

If we warn about the block size being smaller than the default, we skip
some alignment checks.

This can currently only fail on x86-64, when specifying a block size of
1 MiB, however, we detect the THP size of 2 MiB.

Fixes: 228957fea3a9 ("virtio-mem: Probe THP size to determine default block size")
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20211011173305.13778-1-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-mem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index d5a578142b..341c3fa2c1 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -733,7 +733,8 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
         warn_report("'%s' property is smaller than the default block size (%"
                     PRIx64 " MiB)", VIRTIO_MEM_BLOCK_SIZE_PROP,
                     virtio_mem_default_block_size(rb) / MiB);
-    } else if (!QEMU_IS_ALIGNED(vmem->requested_size, vmem->block_size)) {
+    }
+    if (!QEMU_IS_ALIGNED(vmem->requested_size, vmem->block_size)) {
         error_setg(errp, "'%s' property has to be multiples of '%s' (0x%" PRIx64
                    ")", VIRTIO_MEM_REQUESTED_SIZE_PROP,
                    VIRTIO_MEM_BLOCK_SIZE_PROP, vmem->block_size);
-- 
MST


