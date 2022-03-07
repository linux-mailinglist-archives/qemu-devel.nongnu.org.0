Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3D64CFBB5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:44:23 +0100 (CET)
Received: from localhost ([::1]:46452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAqk-0007aC-Pa
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:44:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRADB-0002T5-Lz
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRAD9-0002w1-9W
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=quAC4k9MEA5Bl9esxGjIJ3kbUgMyXwbno7leI74drOM=;
 b=YBfV6WmEE+B/kg5iGOpPfXrtJFmEY6mpYuBG20whJDqfn5CaCGbMt0nmKEIZG9g7jC/Kbs
 uQS7+4Myo/jGgFV/wkJZdAiJdzHZHXBdw07VEf3wM/vMX4Kp17lIK6FfTMni4QbuFDbsip
 x/cBJaXqdh2HO5pwIeWS5JGALVA4mRA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-e_teZHFkP4SG2Beyq6pm2w-1; Mon, 07 Mar 2022 05:03:25 -0500
X-MC-Unique: e_teZHFkP4SG2Beyq6pm2w-1
Received: by mail-ej1-f70.google.com with SMTP id
 hq34-20020a1709073f2200b006d677c94909so6778465ejc.8
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:03:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=quAC4k9MEA5Bl9esxGjIJ3kbUgMyXwbno7leI74drOM=;
 b=3GoV+O4IzDYu1PQ1M8fv81byk8VUbU6dFbYZ6bvRCxD6ZHJUhUEF49T53KwBTCd3ET
 C7N5iY6LtoVgoBiZcmW+1vuhU5/P949UIZkjukhnWF4KQurMJXnIxfAbLgcl7Wpij1LQ
 xVG1EVRq4ViXnnXaTfQtDHZfcZMKbpqTuj2/eQMANVIsHJtaQgiaEAzrACI9ChqlTQXX
 bJDLV0QmMEy2UMGKqR+BiDVy2YXzRhLpAQVWOlHiAIC0IPzaP2ZAFXyJe2tjbYIU44GG
 0dS8wI68X+SYR+pxBDCux2Y6SWaQrDNtQr/GMUfREQpeMHJ1qEhpXF5oM1OJLOeqp1ZT
 LGVg==
X-Gm-Message-State: AOAM532JeZCqBwhC8yUrtW3vn7IpC4ydWYMtSL4tATEgMrFJqpjBBWHX
 N+MhHvs8JsFFwEWrDOlbkNrvnXVZsi/3Bot70ibM+URXr2YXN0z+zv3y1gTx5DKYq1mXZNU36XX
 NEdA0wkWR0gBxBgAMMxo7akzI1Cv9dkZpo3ZUr1fN3FAIOWkg21SgIYD7Ex2c
X-Received: by 2002:a17:906:3283:b0:6ce:78f9:fafd with SMTP id
 3-20020a170906328300b006ce78f9fafdmr8522170ejw.534.1646647404382; 
 Mon, 07 Mar 2022 02:03:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybey7SN3gP5fsyXSJEediyVplpIDiSflhDyuOubfU7aeNh0+GfsiukBIwrbQ00qgx8gQDdzA==
X-Received: by 2002:a17:906:3283:b0:6ce:78f9:fafd with SMTP id
 3-20020a170906328300b006ce78f9fafdmr8522155ejw.534.1646647404125; 
 Mon, 07 Mar 2022 02:03:24 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 u9-20020aa7db89000000b0041372781e69sm5848913edt.52.2022.03.07.02.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:03:23 -0800 (PST)
Date: Mon, 7 Mar 2022 05:03:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 41/47] vhost: use wfd on functions setting vring call fd
Message-ID: <20220307100058.449628-42-mst@redhat.com>
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
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220304100854.14829-3-slp@redhat.com>
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


