Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66324CD67A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:34:10 +0100 (CET)
Received: from localhost ([::1]:50716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ90T-0004Vk-Ox
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:34:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8Ct-0006FQ-3E
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:42:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8Cr-0001LZ-KC
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:42:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/ZxXlOj3fAgvkjAX4A6KwV8H+KbKN1xHiKgMxaMfuzk=;
 b=XAst3OhQQXSru0Vqw3i80jxF0HchAn9jiqyevtli2TYk83YsSfBTGMKRiuourjLVEYFZZD
 Zt4ny9sk5RR/m8P5hsr8+DHdPEgyOOz+iBTuIr6r830iFfPxE5XsORk+6LFI4aIpR95RV7
 7cbprtCXgsatcdtl/q9gTvlk8J5GCVU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-hPCkZOPAOVq7p44FdrQr2A-1; Fri, 04 Mar 2022 08:42:52 -0500
X-MC-Unique: hPCkZOPAOVq7p44FdrQr2A-1
Received: by mail-wm1-f71.google.com with SMTP id
 f189-20020a1c38c6000000b0037d1bee4847so4143634wma.9
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:42:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/ZxXlOj3fAgvkjAX4A6KwV8H+KbKN1xHiKgMxaMfuzk=;
 b=RHXrwMMkmnTvjMt7oS/Th2smAyW3RjgFtlTDv9NQ40uipPiw6dWGDDCUcF7OaIcRft
 +O7LlFaCFJjd7WN/7s2NArnenRF/Wg/vPbpHSYKzgHgrxMIZWFVtjosc4PJ9iZZrcM5W
 DuViNZqWJD+Lb59bgfHah8wV2Wr2AgPcI00FEnWkWsMEA+avkjFpoBqDQR4s9Wi53cCy
 /jIWezYID9tOjkXCFUYNBAjszbtk+FX6mwGXqpSoBTiUWOqMrSYJ33ZgGClgupXbPYmO
 lBB5zQqMT05HZfMiaSu35tKvOb99AD5rWLvVM9GHxJUiV7HAge3s/915VdXiDCw7+f2I
 gQFw==
X-Gm-Message-State: AOAM5338K8U6wZHUTtsU3sP9/13Bb5rPwm3zDpMHn0O4yxUqeFr6x/yD
 KUDLAgC1QOIHDS/geSYGSyCD4UEnRy92PNZjs/HGLCkgrtXUQTCL2+IUP+d7w7DZKYoojczfxCN
 xc24af75Saz1q/2gIwZeStXSNPTrUHLbEBYi4xxaFQMGviRQU5f7NhuMBV4bH
X-Received: by 2002:a1c:e908:0:b0:37c:3d08:e0d3 with SMTP id
 q8-20020a1ce908000000b0037c3d08e0d3mr7732263wmc.97.1646401370580; 
 Fri, 04 Mar 2022 05:42:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzi9Nf7HZG+J2/jekPnAL5h+Qv2phV9WaZIK3tIJvJLPaZ2lJC3Nv9Up8inbzlMsuUwMf/dKw==
X-Received: by 2002:a1c:e908:0:b0:37c:3d08:e0d3 with SMTP id
 q8-20020a1ce908000000b0037c3d08e0d3mr7732247wmc.97.1646401370228; 
 Fri, 04 Mar 2022 05:42:50 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 z6-20020a1cf406000000b0037c4e2d3baesm11719232wma.19.2022.03.04.05.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:42:48 -0800 (PST)
Date: Fri, 4 Mar 2022 08:42:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 43/45] vhost: use wfd on functions setting vring call fd
Message-ID: <20220304133556.233983-44-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sergio Lopez <slp@redhat.com>

When ioeventfd is emulated using qemu_pipe(), only EventNotifier's wfd
can be used for writing.

Use the recently introduced event_notifier_get_wfd() function to
obtain the fd that our peer must use to signal the vring.

Signed-off-by: Sergio Lopez <slp@redhat.com>
Message-Id: <20220303115911.20962-3-slp@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 7b03efccec..b643f42ea4 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1287,7 +1287,7 @@ static int vhost_virtqueue_init(struct vhost_dev *dev,
         return r;
     }
 
-    file.fd = event_notifier_get_fd(&vq->masked_notifier);
+    file.fd = event_notifier_get_wfd(&vq->masked_notifier);
     r = dev->vhost_ops->vhost_set_vring_call(dev, &file);
     if (r) {
         VHOST_OPS_DEBUG(r, "vhost_set_vring_call failed");
@@ -1542,9 +1542,9 @@ void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
 
     if (mask) {
         assert(vdev->use_guest_notifier_mask);
-        file.fd = event_notifier_get_fd(&hdev->vqs[index].masked_notifier);
+        file.fd = event_notifier_get_wfd(&hdev->vqs[index].masked_notifier);
     } else {
-        file.fd = event_notifier_get_fd(virtio_queue_get_guest_notifier(vvq));
+        file.fd = event_notifier_get_wfd(virtio_queue_get_guest_notifier(vvq));
     }
 
     file.index = hdev->vhost_ops->vhost_get_vq_index(hdev, n);
-- 
MST


