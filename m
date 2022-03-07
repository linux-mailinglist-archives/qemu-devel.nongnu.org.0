Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0114D0BE1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 00:18:10 +0100 (CET)
Received: from localhost ([::1]:33290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMcD-0006JG-H8
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 18:18:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7u-00013T-VH
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7t-0005kq-FV
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=quAC4k9MEA5Bl9esxGjIJ3kbUgMyXwbno7leI74drOM=;
 b=eV9paJZDTC99WF/i+s0GsER/PK/4kUp47NBrZmZFmMheb3BdFoF53moeCZOdQPspVyDfbD
 mZz3tSXp4enuBte6g3f2pfe/s7F5aPv9qEeeGIIlpDgLWGc1XnViy7gwF6PyvIxJmZYm8w
 pJLOkgLIarjOYLLEVIzzS72PpaTtteg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-53mePp-CMQ2DZDAtuQ9PTQ-1; Mon, 07 Mar 2022 17:46:47 -0500
X-MC-Unique: 53mePp-CMQ2DZDAtuQ9PTQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 n11-20020aa7c68b000000b0041641550e11so3096324edq.8
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:46:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=quAC4k9MEA5Bl9esxGjIJ3kbUgMyXwbno7leI74drOM=;
 b=5mNEPX6ButB19cKVAQOFBYm99/k2B9vtMzsK2x7t6eQXjInqQ+lQp5sLOFe0hY76w7
 O1XfGFswhQLgRfRARwk2mCRATfMS94kuAJua70e9OjEUXhpv+ljXljlqWiAFATPZHAKC
 g/Vjk790Kq5+0qY7tOvTMjByHHOQ8WhE7p9Sg3/1dg+lDDTvZxed9UUD+V37MWt31nDI
 RuaXNWSCxETRkrznVRzJzqzp1yAqcu1HH/dRHJWNiTz3qpvPTcMIrSCGfPMqjQOyht1w
 KAGvj36MMYZfK2mwPBJYc9+4VR+aF2GWhAjcFx4LPr6bUfgWe1L7jF2CAnf/e0fWI1S1
 qAvQ==
X-Gm-Message-State: AOAM530uKEulL8PzWbHMtFtneFnXpFHuNq73e80lEYvngyV7WeSL8dPC
 zXvfh/txx9mENlHkpI6fieAscvcq4XqXVmgJ8aKBFNDBMNqX6Msh7j+J7rvFlTz0u5oHeso9k1E
 zmaNcy3mKup6dTtp68/VxIGsiIHiO5F11CaxjNi/9sHeB2Zp+Ix8YOSte++a2
X-Received: by 2002:a17:907:728b:b0:6da:97db:b66d with SMTP id
 dt11-20020a170907728b00b006da97dbb66dmr10674817ejc.636.1646693206445; 
 Mon, 07 Mar 2022 14:46:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4KU5sho+CTd1iROBUj+EsTzlml+lQwgvfj59Mve5Rzn8QZTYYoi13NgphmIklsscNBZTdfg==
X-Received: by 2002:a17:907:728b:b0:6da:97db:b66d with SMTP id
 dt11-20020a170907728b00b006da97dbb66dmr10674806ejc.636.1646693206220; 
 Mon, 07 Mar 2022 14:46:46 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 q22-20020a170906771600b006cf8a37ebf5sm5137088ejm.103.2022.03.07.14.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:46:45 -0800 (PST)
Date: Mon, 7 Mar 2022 17:46:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 41/47] vhost: use wfd on functions setting vring call fd
Message-ID: <20220307224357.682101-42-mst@redhat.com>
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


