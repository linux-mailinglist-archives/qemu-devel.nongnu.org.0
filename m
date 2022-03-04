Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 953424CD5D5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:03:46 +0100 (CET)
Received: from localhost ([::1]:51138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8X3-0005Oi-M6
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:03:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ88n-0007tc-EM
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:38:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ88l-0000R2-TZ
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:38:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tZpSULKN+Xln7Ddi4XAIsi4Ma9E+7GOx9U1W/EkBGEQ=;
 b=TUnGrje+buD12o28nqqv9CLgY4c/rUdwJpjL0Zl0m1yhi3E8DNBnOsdXR0FqzOsx0VXjbI
 VukkswXT9BLBRFqBeO399mcITmPUJCAQaO5Lii6VyDk8wFbv7svTfFHSyz9h0RKh+5bF0W
 y4QZRNqcm1jTw7LSGcfwStW351JonlU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-DwWCQo3oOwCSu_8eGeXS_Q-1; Fri, 04 Mar 2022 08:38:36 -0500
X-MC-Unique: DwWCQo3oOwCSu_8eGeXS_Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 t8-20020adfa2c8000000b001e8f6889404so3386792wra.0
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:38:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tZpSULKN+Xln7Ddi4XAIsi4Ma9E+7GOx9U1W/EkBGEQ=;
 b=sXcibVtPocm3NO3jEQv3qqD180f8ulHaq8nS70s4l7icebMM8QAUUU1X6a+yI6Ma80
 HULK26AIowd/LRk7hcIQ/d/WU5WHjpCPOfn0JsdjT3Feh47Fm1HVWprLU9e22OeT6Wnz
 +Zjc8+fN/mBPfodVPPPi4dgXk39JS0LBW9k6fIodT+MugAT1SLLgHBTg41XcacXrfeTU
 AcuKuTct6fGchUNpdxMr4/7PZ/ad5Jv0kGpBefSCnf0PmJIDLSoWp7Qs5+qiy5wCJ7Zh
 j0XVDvOH6QPzi8i2iwuJ/cX7yU4RJ/jfERpeMEY0IDv6TB51J+iN6Muixmwe0516UFLY
 8OOw==
X-Gm-Message-State: AOAM530BXpbDEKGPUX9h8UcjmrQ95zgQG/vDy5cba7jyfdmMksRpNnri
 zKLv0pOls/X5HnzkBWUFh3cv3VpZD+6QbDzu058qKL1piS21XfNgXek4rtwyTrYwceWwGrjqZA4
 QnB4iZhCEJtrk6HT0G1Kmg9dNx+NZyp+4OYJBteoxiTepapCzkceDxShKbAjk
X-Received: by 2002:a05:6000:18c3:b0:1e5:82d3:e4e2 with SMTP id
 w3-20020a05600018c300b001e582d3e4e2mr29986069wrq.575.1646401112127; 
 Fri, 04 Mar 2022 05:38:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJ8VHiOqfnXZcmYg3wFm5gvAmPJRBxjO7vv4QOBunpGg3uXnbv2FNZq2PT8dak0H4IPuT+Vg==
X-Received: by 2002:a05:6000:18c3:b0:1e5:82d3:e4e2 with SMTP id
 w3-20020a05600018c300b001e582d3e4e2mr29986048wrq.575.1646401111878; 
 Fri, 04 Mar 2022 05:38:31 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 c124-20020a1c3582000000b00384d42a9638sm5285111wma.2.2022.03.04.05.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:38:26 -0800 (PST)
Date: Fri, 4 Mar 2022 08:38:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/45] vhost-user: remove VirtQ notifier restore
Message-ID: <20220304133556.233983-10-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-stable@nongnu.org,
 Xueming Li <xuemingl@nvidia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xueming Li <xuemingl@nvidia.com>

Notifier set when vhost-user backend asks qemu to mmap an FD and
offset. When vhost-user backend restart or getting killed, VQ notifier
FD and mmap addresses become invalid. After backend restart, MR contains
the invalid address will be restored and fail on notifier access.

On the other hand, qemu should munmap the notifier, release underlying
hardware resources to enable backend restart and allocate hardware
notifier resources correctly.

Qemu shouldn't reference and use resources of disconnected backend.

This patch removes VQ notifier restore, uses the default vhost-user
notifier to avoid invalid address access.

After backend restart, the backend should ask qemu to install a hardware
notifier if needed.

Fixes: 44866521bd6e ("vhost-user: support registering external host notifiers")
Cc: qemu-stable@nongnu.org
Signed-off-by: Xueming Li <xuemingl@nvidia.com>
Message-Id: <20220207071929.527149-2-xuemingl@nvidia.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-user.h |  1 -
 hw/virtio/vhost-user.c         | 19 +------------------
 2 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-user.h
index a9abca3288..f6012b2078 100644
--- a/include/hw/virtio/vhost-user.h
+++ b/include/hw/virtio/vhost-user.h
@@ -14,7 +14,6 @@
 typedef struct VhostUserHostNotifier {
     MemoryRegion mr;
     void *addr;
-    bool set;
 } VhostUserHostNotifier;
 
 typedef struct VhostUserState {
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 662853513e..ebe9bd58d0 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1162,19 +1162,6 @@ static int vhost_user_set_vring_num(struct vhost_dev *dev,
     return vhost_set_vring(dev, VHOST_USER_SET_VRING_NUM, ring);
 }
 
-static void vhost_user_host_notifier_restore(struct vhost_dev *dev,
-                                             int queue_idx)
-{
-    struct vhost_user *u = dev->opaque;
-    VhostUserHostNotifier *n = &u->user->notifier[queue_idx];
-    VirtIODevice *vdev = dev->vdev;
-
-    if (n->addr && !n->set) {
-        virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, true);
-        n->set = true;
-    }
-}
-
 static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
                                             int queue_idx)
 {
@@ -1182,17 +1169,14 @@ static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
     VhostUserHostNotifier *n = &u->user->notifier[queue_idx];
     VirtIODevice *vdev = dev->vdev;
 
-    if (n->addr && n->set) {
+    if (n->addr) {
         virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
-        n->set = false;
     }
 }
 
 static int vhost_user_set_vring_base(struct vhost_dev *dev,
                                      struct vhost_vring_state *ring)
 {
-    vhost_user_host_notifier_restore(dev, ring->index);
-
     return vhost_set_vring(dev, VHOST_USER_SET_VRING_BASE, ring);
 }
 
@@ -1558,7 +1542,6 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
     }
 
     n->addr = addr;
-    n->set = true;
 
     return 0;
 }
-- 
MST


