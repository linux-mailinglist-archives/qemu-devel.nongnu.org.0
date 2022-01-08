Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 299EF488057
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:13:16 +0100 (CET)
Received: from localhost ([::1]:54658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60IF-0003Jo-80
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:13:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6093-0002o4-J7
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:03:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6092-0002Fz-2b
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:03:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZDYUVmJkHemLI5KByv30OJoOAnuNT00GDgLmkQC7+Is=;
 b=JewXpT7CoWsQ7mHMtasly977IRhqV70RJTv/RyEOw+V6cdWpybbZoTOcVSwMffFDOTJknE
 PiczLI2N8a2HXeEc3hHy8chtDOisRbwz/J6j9NkjjkuURnZ+ioBbOKKr5YC81vxFoFCNMG
 QmKK7Httnca7r8x8s0HHlc/dAs2VR6c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-Tt3WQuYvOc6Ph_J5qIjH4w-1; Fri, 07 Jan 2022 20:03:37 -0500
X-MC-Unique: Tt3WQuYvOc6Ph_J5qIjH4w-1
Received: by mail-wm1-f72.google.com with SMTP id
 r65-20020a1c4444000000b003478a458f01so2178732wma.4
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:03:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZDYUVmJkHemLI5KByv30OJoOAnuNT00GDgLmkQC7+Is=;
 b=IAs0CwAPLfjRLn4FaqJ92myTzEnWU0LFQkvryRBG4n+mIV3H0nql5Au8DOsR7wGVRQ
 mgcROhTY7rqpTFeHE6CPRw60V776z9S2lG51PBEsjMutpWbLp2P0qo7K/aQyxdwGyrLa
 4HStzqLOMHQEFl8u5AkNOvpXmfpGtbZe8NNu79yS+c2uiMqyhK3+4ilGioa8gVVCEim8
 4+2v26sVH9tdWtB7fwXNS7a/BQzLofp/ar4A2xB5sBMdmYK2KxGBJkWDgiQeRlPbfNtI
 4T+0oIO2/yWhWmXaCFFYzCjGuT2J0LJaJsVr4U7agJptsg2TQjWF5D9KzUr3hp8nYmDy
 ttPA==
X-Gm-Message-State: AOAM531c9M1FlYbOFLvF80fDvHYpJ/Nxbo7JOh9t3axOCugNoHLpd/Oc
 MY5uM8jBteTKVL5en+OsHOx8zTnB32Kbol9JncKJsh6GbjbkwSadPkkco68zM/7mEDx9vyND6RK
 ROZJJwQ40uFxYq/bu4K5DRUdOoTUZFIiipSTeJkQ9MxFPangbpMhB9mP9w8Qx
X-Received: by 2002:a05:6000:24b:: with SMTP id
 m11mr11143547wrz.122.1641603816015; 
 Fri, 07 Jan 2022 17:03:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzdynUJPea8NzqNgyQrTaNfNd+PbxGHHuN3LM++iU63Ftx9NcGQf1gRUhok7IT+5dkbQHnHg==
X-Received: by 2002:a05:6000:24b:: with SMTP id
 m11mr11143537wrz.122.1641603815791; 
 Fri, 07 Jan 2022 17:03:35 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id b10sm70800wmj.42.2022.01.07.17.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:03:35 -0800 (PST)
Date: Fri, 7 Jan 2022 20:03:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 01/55] virtio-mem: Don't skip alignment checks when warning
 about block size
Message-ID: <20220108003423.15830-2-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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


