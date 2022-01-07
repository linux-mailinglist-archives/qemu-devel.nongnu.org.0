Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 296D848764A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:13:17 +0100 (CET)
Received: from localhost ([::1]:53244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nBM-0006SM-8c
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:13:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n24-0006tr-FY
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:03:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n22-0001mW-Ci
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:03:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m0o2ISf2fuLkjyQa6eo4LTXkqbFcr+aoyo0kUY28Ncc=;
 b=KTGqSNjhjf5vzqBC9GDG1R7w6dTVW2S17RyjT4SJnqyGHT73JwCrxsvgGuoIB6OiC1VaHY
 YDRIROdaFgOH6REOEkXGaqVDVez+vAJ+x1P1Q1Mn6IQrT/OCX2eLSXYMQBSapf5/bTy6Pv
 jIoEpToj7L63o3wRVLVlZttTvNCJAAo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-PpEji4TOPe-3UlxLsys5xw-1; Fri, 07 Jan 2022 06:03:33 -0500
X-MC-Unique: PpEji4TOPe-3UlxLsys5xw-1
Received: by mail-wr1-f72.google.com with SMTP id
 k4-20020adfc704000000b001a32d86a772so2129761wrg.5
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:03:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m0o2ISf2fuLkjyQa6eo4LTXkqbFcr+aoyo0kUY28Ncc=;
 b=2gzg1bWw+S9h5AtzwGrytIy5XaKc2PnQihKETmfke34NYjKTmqG/M/mXXmj1x2GZZO
 n+FaS9GtGmKjGv9xldjmScUqdCfyBCPv47lAiMUCp+cfvoxMG23YonGzfQlEBh3FIHHF
 2J7+asLmdDfYbyE7n9q2Ggfj1dNWKI6nGo8DtHuaM/OS20TL+kaxJJkM/AbozJQ8qAdp
 AARJjIGM/nO3gWTqz2oFJd8YlEcbovKzv7thUuBQeXF5bzpfaQtjkeLSx6z3PuzymJqd
 byzZEvfi8Kx9EPm5toSPhFTWZRAbZOv54vSNLIMktTkzpvZq31DHFlQDwWXKSVqb5Y6U
 p/Kw==
X-Gm-Message-State: AOAM533OugRRwfMXKW1+SNATXqh4xjBnFNAwBcRrVyzj0vC0ZIbXIS0i
 Gm+l0lvmQOaRjqGvY4hJx7AU9gNVOt4PvZUHodtbRrOp0jweOgsumhcP5XUwHSqBuuCjC2Z5d6f
 96y3F400KZtNtk1RxbK73wakUBwhuI+6OOyaXGQGB/I903pWnCARGdICuoBA+
X-Received: by 2002:a05:6000:1377:: with SMTP id
 q23mr7569045wrz.371.1641553412344; 
 Fri, 07 Jan 2022 03:03:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbvNEFEhKxPhCHH+nwiD7ZLjbq7Y6L/yDuvAf/N4iugfBVujcXiFMRi90z2Y9axx2r/nyC7w==
X-Received: by 2002:a05:6000:1377:: with SMTP id
 q23mr7569020wrz.371.1641553412031; 
 Fri, 07 Jan 2022 03:03:32 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id j11sm537633wrt.5.2022.01.07.03.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:03:31 -0800 (PST)
Date: Fri, 7 Jan 2022 06:03:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 08/55] virtio: add support for configure interrupt
Message-ID: <20220107102526.39238-9-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cindy Lu <lulu@redhat.com>

Add the functions to support the configure interrupt in virtio
The function virtio_config_guest_notifier_read will notify the
guest if there is an configure interrupt.
The function virtio_config_set_guest_notifier_fd_handler is
to set the fd hander for the notifier

Signed-off-by: Cindy Lu <lulu@redhat.com>
Message-Id: <20211104164827.21911-7-lulu@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio.h |  4 ++++
 hw/virtio/virtio.c         | 29 +++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 605ea79c90..d78088d872 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -111,6 +111,7 @@ struct VirtIODevice
     bool use_guest_notifier_mask;
     AddressSpace *dma_as;
     QLIST_HEAD(, VirtQueue) *vector_queues;
+    EventNotifier config_notifier;
 };
 
 struct VirtioDeviceClass {
@@ -313,11 +314,14 @@ uint16_t virtio_get_queue_index(VirtQueue *vq);
 EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq);
 void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
                                                 bool with_irqfd);
+void virtio_config_set_guest_notifier_fd_handler(VirtIODevice *vdev,
+                                                 bool assign, bool with_irqfd);
 int virtio_device_start_ioeventfd(VirtIODevice *vdev);
 int virtio_device_grab_ioeventfd(VirtIODevice *vdev);
 void virtio_device_release_ioeventfd(VirtIODevice *vdev);
 bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev);
 EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq);
+EventNotifier *virtio_config_get_guest_notifier(VirtIODevice *vdev);
 void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabled);
 void virtio_queue_host_notifier_read(EventNotifier *n);
 void virtio_queue_aio_set_host_notifier_handler(VirtQueue *vq, AioContext *ctx,
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index e11a8a0dba..36edb1dad5 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3493,7 +3493,14 @@ static void virtio_queue_guest_notifier_read(EventNotifier *n)
         virtio_irq(vq);
     }
 }
+static void virtio_config_guest_notifier_read(EventNotifier *n)
+{
+    VirtIODevice *vdev = container_of(n, VirtIODevice, config_notifier);
 
+    if (event_notifier_test_and_clear(n)) {
+        virtio_notify_config(vdev);
+    }
+}
 void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
                                                 bool with_irqfd)
 {
@@ -3510,6 +3517,23 @@ void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
     }
 }
 
+void virtio_config_set_guest_notifier_fd_handler(VirtIODevice *vdev,
+                                                 bool assign, bool with_irqfd)
+{
+    EventNotifier *n;
+    n = &vdev->config_notifier;
+    if (assign && !with_irqfd) {
+        event_notifier_set_handler(n, virtio_config_guest_notifier_read);
+    } else {
+        event_notifier_set_handler(n, NULL);
+    }
+    if (!assign) {
+        /* Test and clear notifier before closing it,*/
+        /* in case poll callback didn't have time to run. */
+        virtio_config_guest_notifier_read(n);
+    }
+}
+
 EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq)
 {
     return &vq->guest_notifier;
@@ -3583,6 +3607,11 @@ EventNotifier *virtio_queue_get_host_notifier(VirtQueue *vq)
     return &vq->host_notifier;
 }
 
+EventNotifier *virtio_config_get_guest_notifier(VirtIODevice *vdev)
+{
+    return &vdev->config_notifier;
+}
+
 void virtio_queue_set_host_notifier_enabled(VirtQueue *vq, bool enabled)
 {
     vq->host_notifier_enabled = enabled;
-- 
MST


