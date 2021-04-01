Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF52351BAA
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 20:11:37 +0200 (CEST)
Received: from localhost ([::1]:54384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS1n5-0008Gt-Ud
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 14:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lS1ey-0003DQ-LH
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 14:03:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lS1et-0005vQ-TT
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 14:03:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617300185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FSnptZrRbQSuaqOya/Yrl1bJW+NQWsKSQuzTI2/BKT0=;
 b=DNPyYaUaqucFrFHgbCbNj3dZTU0fZMtXhn4EdeDwNhsnCbfUOwJtyZ59LPiqb3A2tBS1pe
 GmJdLa9AbQaMB77ZYl3toIpb6kzwxKrkst4UY+MEYU5cL+FKCutXhKNmHrs9hxPZ+u7Ne0
 BxOm1zidpbsXWiI8Wkog//6NPHcQH/c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-6cNtEhoeNuS8bxtHXROB7w-1; Thu, 01 Apr 2021 14:03:03 -0400
X-MC-Unique: 6cNtEhoeNuS8bxtHXROB7w-1
Received: by mail-wr1-f72.google.com with SMTP id x9so3098884wro.9
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 11:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FSnptZrRbQSuaqOya/Yrl1bJW+NQWsKSQuzTI2/BKT0=;
 b=gvfNFuERgkALq/2i7IteqKHaxd8lTTfvow1f0Gt4rPYqawWLKVjad5k0sbRtLC3G6U
 PYmRnxOac0YfW42P/z8baPM1qc2zLipYmf+2VIJOVBz/jNNqECxKkhyY9/ULQMzK2l8j
 /wBkMkxFOD3QWsnN9gngI4a76I/ximQamsHf6ZsRpFdZ0V4rVSdajJkyVoOUmSrGogd0
 VbNg1eggP4vkn0FEDZTotuxvlhRzrXaFUzn6gYVHENOAU+fz1eIGToUA8Tl2UsCsaVA4
 t3S4ggRl28F7tvIOmTnl4GDMRj+MpjynLTNg3Zyyq2HYTppU6IJworw3zTNJMYS9nHQG
 hMOw==
X-Gm-Message-State: AOAM531P8x+6SEi4WhzCrx3smekjzVNlIjhX+xwPJWovHX59flG5ta5c
 q85/DSX0/7fE+PALEGKjwlBLn1vvnv9HckgQm9RA5YnrcYfYBvFEAgzgMmr6hgQ0ktvGxdj8taY
 qexY70VXrvb6cv32wIYDTqZEcd3Mr/19eHsvA7/4KecD4Ef7UtA98OWKC4V5b
X-Received: by 2002:adf:fd48:: with SMTP id h8mr11283892wrs.229.1617300182322; 
 Thu, 01 Apr 2021 11:03:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6XFfyOhC9K3KkvbT7mpNGSqnm4SJuwQizz08NIEYTrlTG6/ypcvuDzybvkFaxnVE7pRLJRw==
X-Received: by 2002:adf:fd48:: with SMTP id h8mr11283870wrs.229.1617300182157; 
 Thu, 01 Apr 2021 11:03:02 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id g5sm10872896wrq.30.2021.04.01.11.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 11:03:01 -0700 (PDT)
Date: Thu, 1 Apr 2021 14:03:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/9] virtio-pci: add check for vdev in virtio_pci_isr_read
Message-ID: <20210401180235.226321-5-mst@redhat.com>
References: <20210401180235.226321-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210401180235.226321-1-mst@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Yuri Benditovich <yuri.benditovich@daynix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yuri Benditovich <yuri.benditovich@daynix.com>

https://bugzilla.redhat.com/show_bug.cgi?id=1743098
This commit completes the solution of segfault in hot unplug flow
(by commit ccec7e9603f446fe75c6c563ba335c00cfda6a06).
Added missing check for vdev in virtio_pci_isr_read.
Typical stack of crash:
virtio_pci_isr_read ../hw/virtio/virtio-pci.c:1365 with proxy-vdev = 0
memory_region_read_accessor at ../softmmu/memory.c:442
access_with_adjusted_size at ../softmmu/memory.c:552
memory_region_dispatch_read1 at ../softmmu/memory.c:1420
memory_region_dispatch_read  at ../softmmu/memory.c:1449
flatview_read_continue at ../softmmu/physmem.c:2822
flatview_read at ../softmmu/physmem.c:2862
address_space_read_full at ../softmmu/physmem.c:2875

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
Message-Id: <20210315115937.14286-2-yuri.benditovich@daynix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 883045a223..4a3dcee771 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1364,9 +1364,14 @@ static uint64_t virtio_pci_isr_read(void *opaque, hwaddr addr,
 {
     VirtIOPCIProxy *proxy = opaque;
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
-    uint64_t val = qatomic_xchg(&vdev->isr, 0);
-    pci_irq_deassert(&proxy->pci_dev);
+    uint64_t val;
 
+    if (vdev == NULL) {
+        return 0;
+    }
+
+    val = qatomic_xchg(&vdev->isr, 0);
+    pci_irq_deassert(&proxy->pci_dev);
     return val;
 }
 
-- 
MST


