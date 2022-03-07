Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EECBC4D0B85
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 23:54:44 +0100 (CET)
Received: from localhost ([::1]:46024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMFX-0007V7-Mh
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 17:54:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM6Q-0006E3-TR
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:45:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM6P-0005Ra-8M
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:45:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2MmbtRN8dUw8oStDJevhrQCWdjKFEsw6VGH8lAmLmm4=;
 b=afI4AdlK/jKeFKHhrwfAsWHMDFgxxewu4zusmAT6y6EOPqzc6jbNz/6MBjz805qovHumni
 UAyrelITPD4WgGzj/Shk57wNtN40O7/mb756J/b+jRWArW3dywebhkCfVYyjSAfoN19Hrc
 EQdhvCeb4KJNiUYxgAf0TcdRhdGBu/4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-T-ZJPIbaNDqcjdzR0Urfgw-1; Mon, 07 Mar 2022 17:45:15 -0500
X-MC-Unique: T-ZJPIbaNDqcjdzR0Urfgw-1
Received: by mail-wm1-f70.google.com with SMTP id
 d8-20020a05600c34c800b0037e3cd6225eso5689723wmq.6
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:45:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2MmbtRN8dUw8oStDJevhrQCWdjKFEsw6VGH8lAmLmm4=;
 b=7xU/cxedBs+2vkfIXp+8TdSnFtjp0csFohDTbofvVy4EUXEhdt5B8/9AvYpJK+tCJD
 sai5qSMBVF975OSpeDT6xT0+LeB8m1KalgXEJ+frrONWjdTyYKp3tgkXz9fZDFqF7CuN
 dkfZLahCDqHiISITOLSIcX9skYx4SJLEB/9KsS6hjlESVziv9JibVlw/UAu7iQiWzY7+
 4632NGWTIcxoqve9Mwo74HA+PvF3lJbZL0ShJv/qEdrcsFXnlrtt8LVlu71aNAUiqG3o
 crlbJBQOpzzRPB4EC+NxchCtIk+NPvt4QwHTn66mczZnkz+51yQrFr76UtqiWSG4iyW8
 B4vQ==
X-Gm-Message-State: AOAM533s9PtXPkRvH27Hwi3Oj+9HiyQk9zYZYg8AJlWzglTQDqFHPa2v
 W+7MGlzzq/sqI9iGfX+QM0h5I3Hj4bKN7uhUuFB6WxutI4IJ1L5t5ynSa5fI+XBwNMP8mxkzzrM
 zFzLD5c7+emJNpUsNEIwB7M+FwBas6M29dYNISYuL3EhR9c76P+8cqi9kL3ZM
X-Received: by 2002:a1c:cc06:0:b0:389:79c7:aee6 with SMTP id
 h6-20020a1ccc06000000b0038979c7aee6mr963249wmb.47.1646693114014; 
 Mon, 07 Mar 2022 14:45:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynCWlIrfn8wFIMy5dElSa9MlpF5EJIe/zBGuftW7Wc7x7MS4FhseIUpt76UVFOV6ElrEd/Kg==
X-Received: by 2002:a1c:cc06:0:b0:389:79c7:aee6 with SMTP id
 h6-20020a1ccc06000000b0038979c7aee6mr963232wmb.47.1646693113722; 
 Mon, 07 Mar 2022 14:45:13 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 e2-20020adfe7c2000000b001f04d622e7fsm12371831wrn.39.2022.03.07.14.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:45:13 -0800 (PST)
Date: Mon, 7 Mar 2022 17:45:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 13/47] hw/virtio: vdpa: Fix leak of host-notifier
 memory-region
Message-ID: <20220307224357.682101-14-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 Peter Maydell <peter.maydell@linaro.org>, jasowang@redhat.com,
 qemu-stable@nongnu.org, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

If call virtio_queue_set_host_notifier_mr fails, should free
host-notifier memory-region.

This problem can trigger a coredump with some vDPA drivers (mlx5,
but not with the vdpasim), if we unplug the virtio-net card from
the guest after a stop/start.

The same fix has been done for vhost-user:
  1f89d3b91e3e ("hw/virtio: Fix leak of host-notifier memory-region")

Fixes: d0416d487bd5 ("vhost-vdpa: map virtqueue notification area if possible")
Cc: jasowang@redhat.com
Resolves: https://bugzilla.redhat.com/2027208
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Message-Id: <20220211170259.1388734-1-lvivier@redhat.com>
Cc: qemu-stable@nongnu.org
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 04ea43704f..11f696468d 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -431,6 +431,7 @@ static int vhost_vdpa_host_notifier_init(struct vhost_dev *dev, int queue_index)
     g_free(name);
 
     if (virtio_queue_set_host_notifier_mr(vdev, queue_index, &n->mr, true)) {
+        object_unparent(OBJECT(&n->mr));
         munmap(addr, page_size);
         goto err;
     }
-- 
MST


