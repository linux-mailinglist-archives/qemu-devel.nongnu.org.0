Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74A143496F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:53:39 +0200 (CEST)
Received: from localhost ([::1]:53348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md9E3-00007N-1v
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8i0-0004iX-OG
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8hy-0003aY-S3
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8WUvKS8fdXJA9x2sA/adDQPr/E4an91R5a8EOdVOfhc=;
 b=Z31Vm85cxNRPHLPShT24YP1PIRHQf6tdPtHdpI0PSj3Auxh8V2odEHbirBhohXS/PX5Nnm
 zW9HK3c0h+K153y05NFovigEgaYIPJ19xIcSwdFazngs+QJL2I8Jpqr3cgJn9t2lEde/vu
 XL1PWd1we4UzYehH0G4mwGQZ5a8Od/Y=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-_Xpn6GiFP6CBHU-jvGrnVw-1; Wed, 20 Oct 2021 06:20:27 -0400
X-MC-Unique: _Xpn6GiFP6CBHU-jvGrnVw-1
Received: by mail-ed1-f71.google.com with SMTP id
 v2-20020a50f082000000b003db24e28d59so20507132edl.5
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8WUvKS8fdXJA9x2sA/adDQPr/E4an91R5a8EOdVOfhc=;
 b=ZabIqBCeeLV6RD/gMdmcXphJ7dH6PVGszZj89hNL1A8xGgqAOs15UdNfkbp1QwZMm5
 CEEmYDdwTkgU012lICamaav0oGVnM9BYtBY4Yd07LzoQrxU8tjzLLWcdHRkGBYw8TGIf
 fDyAFIFQLl+JTsx/GVTBuFCpWp145m3di4jgybnOqaOEo1W9aC6f/uLWzjCi/0wGwOH3
 i/7YRo7HUkj7+n13pwkqEeOLSZ84SQpLRWSjULDdgBX9MBGwr++bG7h71WrfApLJCdxn
 eLWLGb5z/otkW9j7fNVPfLj7Y7W14WJnYvK2Dy8vOUJWF2x8aQJYoYifvBlQbk0GIrv6
 iE/A==
X-Gm-Message-State: AOAM531uX8pzeABgHV5EX4MhbNWg7T1ZlskR1NDHZpY8aPC2uMsthF0M
 0E4VtHtEI8vfQTk+YDShrtGWrN1/buqZHam2Q51ipMrFfTeVrIT/Ced6PMVmNoQW6c6jDL2fuud
 6iy1Bi8t2zA8FH6n4FIKuPvZX9azAn3G8jYu3hXpDc8qNnHYoX2wS7dZZlDzj
X-Received: by 2002:a50:e60a:: with SMTP id y10mr61655440edm.233.1634725226328; 
 Wed, 20 Oct 2021 03:20:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxa/kpu0UT7+u4BdJxxMGuLAEw+T0HuE+EVqn0IfquQRqKFCF2ox1HHyrz+KfCjfM34NRygA==
X-Received: by 2002:a50:e60a:: with SMTP id y10mr61655403edm.233.1634725226031; 
 Wed, 20 Oct 2021 03:20:26 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id w7sm970886ede.8.2021.10.20.03.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:20:25 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:20:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 25/44] vhost-user: fix duplicated notifier MR init
Message-ID: <20211020101844.988480-26-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>,
 Peter Maydell <peter.maydell@linaro.org>, tiwei.bie@intel.com,
 Xueming Li <xuemingl@nvidia.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xueming Li <xuemingl@nvidia.com>

In case of device resume after suspend, VQ notifier MR still valid.
Duplicated registrations explode memory block list and slow down device
resume.

Fixes: 44866521bd6e ("vhost-user: support registering external host notifiers")
Cc: tiwei.bie@intel.com
Cc: qemu-stable@nongnu.org
Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>

Signed-off-by: Xueming Li <xuemingl@nvidia.com>
Message-Id: <20211008080215.590292-1-xuemingl@nvidia.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-user.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 2c8556237f..bf6e50223c 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1526,8 +1526,9 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
 
     name = g_strdup_printf("vhost-user/host-notifier@%p mmaps[%d]",
                            user, queue_idx);
-    memory_region_init_ram_device_ptr(&n->mr, OBJECT(vdev), name,
-                                      page_size, addr);
+    if (!n->mr.ram) /* Don't init again after suspend. */
+        memory_region_init_ram_device_ptr(&n->mr, OBJECT(vdev), name,
+                                          page_size, addr);
     g_free(name);
 
     if (virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, true)) {
-- 
MST


