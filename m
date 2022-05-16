Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D80528405
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:18:38 +0200 (CEST)
Received: from localhost ([::1]:36512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZgL-0001cZ-7L
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:18:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY9a-0002rd-1R
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:40:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY9Y-0005oh-5j
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:40:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=05bBIi63juyp7TE0qSn2TB6p9HVIagy23aAAjlVPBNA=;
 b=UBSxqWJPOecx5boqxZdCIvMmbBNvANpcqm4VqHlSSlIFD4dVP6krMfLTC6fIlrpy4A8x5n
 kDH9M5lZ9YmOoORtNP0ZAxrLTVu0vXltfrIdodjcJ6MTYgna51ryJ91NwXIjeFQr28YdFX
 G/J6ZBPI5tfNh4bxKJGxCti1wS7Hl84=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-XL1gEYiZNJqw9gJVbfy4QA-1; Mon, 16 May 2022 06:40:38 -0400
X-MC-Unique: XL1gEYiZNJqw9gJVbfy4QA-1
Received: by mail-wm1-f70.google.com with SMTP id
 i131-20020a1c3b89000000b00393fbb0718bso10166425wma.0
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:40:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=05bBIi63juyp7TE0qSn2TB6p9HVIagy23aAAjlVPBNA=;
 b=PXyx+yBS6VFo7cKpY1yhU/UxC2mtFXrN9Ru9cTyFIjtidgWGKWQpeEc4r3Nl699y3m
 b5DVeW0vSeI6DoxoeJma/mzWP/K8h4oPha6IzvWp+r7+HJ51NnqB8viRJ276epzaoMuK
 28uXktf9MyOaFoze+1T/0T48hE8mkWIB1l3R+dwv7Ik+1wC9Sqhim0aBZEw2Yiw38CSb
 AIDuxd1ozhR7y5q2PTf/oq9BzVq8yCPpl3NcY5oKlMHdb6R6uIV3r9r7PGJQ2tVZ7CJs
 PMKulu1PHjfTh9gC/O8Qu4KJxhx+EGm4spNfOoLDMhwBKF8zw18e9IOmDuDRCHoCIEzz
 ocxA==
X-Gm-Message-State: AOAM53093oyRMIJLgxIs37MQMUipNweEv3Bin/mSCDI2aWx/t0Kfkdax
 8yp3BdSbRoyHgtz3eohg9kfo+BLbHyel4gDVMr9XYgGtvASft1IjdmGyoFd9PVlk8yjMB/Uf4Nc
 5paz+Q6L9geKaN3Kqdf8D28X01Js4VJeP+FVXJ6mijUSz7dgHpE9X0nqsrOwt
X-Received: by 2002:a5d:42c7:0:b0:20c:ff89:8af8 with SMTP id
 t7-20020a5d42c7000000b0020cff898af8mr7766415wrr.618.1652697637251; 
 Mon, 16 May 2022 03:40:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0i7EF6PFRbzc85q9KBO5/0QQKiZcRuPS78l7DFNZFO+DIxn1Nn1hgGNBYR7H+ewG6DauRlg==
X-Received: by 2002:a5d:42c7:0:b0:20c:ff89:8af8 with SMTP id
 t7-20020a5d42c7000000b0020cff898af8mr7766396wrr.618.1652697636999; 
 Mon, 16 May 2022 03:40:36 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 18-20020a05600c229200b00394867d66ddsm9725523wmf.35.2022.05.16.03.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:40:36 -0700 (PDT)
Date: Mon, 16 May 2022 06:40:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 85/91] virtio-net: setup vhost_dev and notifiers for cvq only
 when feature is negotiated
Message-ID: <20220516095448.507876-86-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Si-Wei Liu <si-wei.liu@oracle.com>

When the control virtqueue feature is absent or not negotiated,
vhost_net_start() still tries to set up vhost_dev and install
vhost notifiers for the control virtqueue, which results in
erroneous ioctl calls with incorrect queue index sending down
to driver. Do that only when needed.

Fixes: 22288fe ("virtio-net: vhost control virtqueue support")
Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <1651890498-24478-2-git-send-email-si-wei.liu@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 9ad466f556..f9dd012021 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -292,7 +292,8 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
     NetClientState *nc = qemu_get_queue(n->nic);
     int queue_pairs = n->multiqueue ? n->max_queue_pairs : 1;
-    int cvq = n->max_ncs - n->max_queue_pairs;
+    int cvq = virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
+              n->max_ncs - n->max_queue_pairs : 0;
 
     if (!get_vhost_net(nc->peer)) {
         return;
-- 
MST


