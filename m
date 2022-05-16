Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C898C529288
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:18:39 +0200 (CEST)
Received: from localhost ([::1]:37392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqi6w-0000DE-SO
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhiL-0007UB-7I
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:53:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhiJ-0006by-GV
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:53:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2D8zJoKITBIvDeR7b/dV2fYboZZQxIF/D34DE4tt2Q8=;
 b=WNsr4jToCUfW1/SG0d28ICuG9bjITUQXYpDX6V8U0+9JHAEx2euBQN6G0VXzcys9zi6Zi4
 NOFuPMvCOTVpJ3IAU6Rg8iyVL04PgjGZTn58dtFbqRgXx2PBoZHCIqbAfiMZNOHqvVJA0l
 PJWrE9gzm73qHP/+QCcyIITY0asO0gA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-BhpqoKfxOjWFpwk1SOGWRw-1; Mon, 16 May 2022 16:53:09 -0400
X-MC-Unique: BhpqoKfxOjWFpwk1SOGWRw-1
Received: by mail-ej1-f69.google.com with SMTP id
 ga27-20020a1709070c1b00b006f43c161da4so6356488ejc.7
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2D8zJoKITBIvDeR7b/dV2fYboZZQxIF/D34DE4tt2Q8=;
 b=XqwpBns0Jr4RcBKKWUYVRwG8H0Qbmm10pn/uq0a9E1UYaaZEU6QvI4+VTM/UhQGCwG
 mUdThpVswcVRopys5y1BRHyAmgS2XUbshe4MQzrTJNACL6rQG3ebLqZERG4sRbhQMCJG
 W6srVzoGKazKcLXMG2u4KUEEafhaq6dZTApqp+BzJSa5Jy2C65eVm1vzwioPQeWkRe7J
 a/EJhsVyahHtNTkWyg15J6bn7jFf6TrOe1Y+cjGLcLjDShRoBLJz55cEZHZmDf5FaPUJ
 Ntpkb12Psjr3j8D9Uplm6tkGswSK3RWmfOoIg+guI5xtutlCUlCZEC2ngD+jg6mWuXN4
 F1sg==
X-Gm-Message-State: AOAM533Y3f+FvwhWbGJB0lV0FRt3jDeBkub1eO6tOmqRWf8kqMXBdf1h
 5jo5S4Ia0gfyQMJiUzKyi4fD0Aw7M/l9urmVLx9hth8nzxeINz+TRG8C/aQ6wbV7o64ybnYrhi7
 12J5fS+FzVlgcIMntCSAyl7Nf6ckah/XCNvxucyqkAXiHelyVaVQKMN08AyTM
X-Received: by 2002:aa7:ce82:0:b0:42a:b4a1:992b with SMTP id
 y2-20020aa7ce82000000b0042ab4a1992bmr6312974edv.327.1652734387904; 
 Mon, 16 May 2022 13:53:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1AVRY423OLFDv2JEh1snHSt1CYknel9N5sMZSvfC3lYVpSU5VbddzFNps/ha/HqEFoV+2Xg==
X-Received: by 2002:aa7:ce82:0:b0:42a:b4a1:992b with SMTP id
 y2-20020aa7ce82000000b0042ab4a1992bmr6312958edv.327.1652734387664; 
 Mon, 16 May 2022 13:53:07 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 o23-20020aa7dd57000000b0042abfe32ac8sm604613edw.30.2022.05.16.13.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:53:07 -0700 (PDT)
Date: Mon, 16 May 2022 16:53:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: [PULL v2 43/86] vhost: Track descriptor chain in private at SVQ
Message-ID: <20220516204913.542894-44-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
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

From: Eugenio Pérez <eperezma@redhat.com>

The device could have access to modify them, and it definitely have
access when we implement packed vq. Harden SVQ maintaining a private
copy of the descriptor chain. Other fields like buffer addresses are
already maintained sepparatedly.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20220512175747.142058-2-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h |  6 ++++++
 hw/virtio/vhost-shadow-virtqueue.c | 12 +++++++-----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index e5e24c536d..c132c994e9 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -53,6 +53,12 @@ typedef struct VhostShadowVirtqueue {
     /* Next VirtQueue element that guest made available */
     VirtQueueElement *next_guest_avail_elem;
 
+    /*
+     * Backup next field for each descriptor so we can recover securely, not
+     * needing to trust the device access.
+     */
+    uint16_t *desc_next;
+
     /* Next head to expose to the device */
     uint16_t shadow_avail_idx;
 
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 1e5cfe2af6..1d6552b0fe 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -138,6 +138,7 @@ static void vhost_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
     for (n = 0; n < num; n++) {
         if (more_descs || (n + 1 < num)) {
             descs[i].flags = flags | cpu_to_le16(VRING_DESC_F_NEXT);
+            descs[i].next = cpu_to_le16(svq->desc_next[i]);
         } else {
             descs[i].flags = flags;
         }
@@ -145,10 +146,10 @@ static void vhost_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
         descs[i].len = cpu_to_le32(iovec[n].iov_len);
 
         last = i;
-        i = cpu_to_le16(descs[i].next);
+        i = cpu_to_le16(svq->desc_next[i]);
     }
 
-    svq->free_head = le16_to_cpu(descs[last].next);
+    svq->free_head = le16_to_cpu(svq->desc_next[last]);
 }
 
 static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
@@ -336,7 +337,6 @@ static void vhost_svq_disable_notification(VhostShadowVirtqueue *svq)
 static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
                                            uint32_t *len)
 {
-    vring_desc_t *descs = svq->vring.desc;
     const vring_used_t *used = svq->vring.used;
     vring_used_elem_t used_elem;
     uint16_t last_used;
@@ -365,7 +365,7 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
         return NULL;
     }
 
-    descs[used_elem.id].next = svq->free_head;
+    svq->desc_next[used_elem.id] = svq->free_head;
     svq->free_head = used_elem.id;
 
     *len = used_elem.len;
@@ -540,8 +540,9 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
     svq->vring.used = qemu_memalign(qemu_real_host_page_size(), device_size);
     memset(svq->vring.used, 0, device_size);
     svq->ring_id_maps = g_new0(VirtQueueElement *, svq->vring.num);
+    svq->desc_next = g_new0(uint16_t, svq->vring.num);
     for (unsigned i = 0; i < svq->vring.num - 1; i++) {
-        svq->vring.desc[i].next = cpu_to_le16(i + 1);
+        svq->desc_next[i] = cpu_to_le16(i + 1);
     }
 }
 
@@ -574,6 +575,7 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
         virtqueue_detach_element(svq->vq, next_avail_elem, 0);
     }
     svq->vq = NULL;
+    g_free(svq->desc_next);
     g_free(svq->ring_id_maps);
     qemu_vfree(svq->vring.desc);
     qemu_vfree(svq->vring.used);
-- 
MST


