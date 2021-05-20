Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E07C38AB4E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 13:22:43 +0200 (CEST)
Received: from localhost ([::1]:35404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljglG-0002jo-Ds
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 07:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljgZR-0000qy-8P
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:10:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljgZE-0004q0-G6
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:10:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621509015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hT9YCxRj1ou3uPTM7bSJ+zjEyH6kGbopTpVH+99i5eA=;
 b=U0IC6NNcPAIICAYcoZ4O9ALpga3nVinRx7fhfowFpObaM96alSsHC4Ib3mHWn08lGX1BO/
 XOJSPmfPXPjBElkWfLSkJcrq6sQ72PELYcQU/udoAtj9m25tqEt0CpBkQ+UP2vYjkPoP0w
 +rRSiwLDKgVSuj7mYL4PuiEVYV6P6Sg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357--UsEFaXqOyu41KoHqu9Dwg-1; Thu, 20 May 2021 07:10:12 -0400
X-MC-Unique: -UsEFaXqOyu41KoHqu9Dwg-1
Received: by mail-wr1-f69.google.com with SMTP id
 q15-20020adfc50f0000b0290111f48b865cso5029759wrf.4
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 04:10:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hT9YCxRj1ou3uPTM7bSJ+zjEyH6kGbopTpVH+99i5eA=;
 b=avnEio57j91LfZn14vKfrx5HHM0m9GLUlFMxaAiTKaPhj2fZmgsY5F+j1nC1G/271Q
 +sR4XDsBw3wzJOkI9xbB9sXnfhr1h0G6jALICUga1BXzP54l2ZtL5p//Uuv4EgcSIxAM
 d/zFYSfV0eZPoH47907q1SMxo48PO87/8IhpFC23+NICs/ahUvcu5yzTzPfal9t5AR6R
 TLPjnYnyJ7u/fs3SOFN6MBpaEoy6JEpehvVL7CfmwqBXKIYshl5TdKldmRHtu8JAvERJ
 AfIX4RRAfOXRkGJQ17BJ6u6nOQOzmmWsKPfDpas/17qdcmkElcql2Eo9rt2VZaC90Xbz
 U+JA==
X-Gm-Message-State: AOAM532cA5n5FzRNyT2W4m4DVHwM7bJRPXC/9fob7awxGvOHI4dX7V8H
 s1X+B/yepQskWYX3IRg3595nlv5zgvrtKdP7+S+7ONmdizZUCbPC4nOx4zRTGH5O9dLhmHfDxdJ
 je67tKm23PuaEGlmB257VW3dP1q+xSEx9b7UXENr9ACv0Hmi95c4iR9XicRHfJSqx
X-Received: by 2002:a05:600c:1909:: with SMTP id
 j9mr3175859wmq.100.1621509011020; 
 Thu, 20 May 2021 04:10:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNpo4h4UrADIjXZ1b95pgvWd070pZ4FEyaaomJsGttuRFQyMPcbIM8LWkbeqgCSQnyXkoUtA==
X-Received: by 2002:a05:600c:1909:: with SMTP id
 j9mr3175822wmq.100.1621509010775; 
 Thu, 20 May 2021 04:10:10 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id f13sm3010371wrt.86.2021.05.20.04.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 04:10:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 11/12] hw/virtio: Have vring_avail_flags() return a
 boolean value
Date: Thu, 20 May 2021 13:09:18 +0200
Message-Id: <20210520110919.2483190-12-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210520110919.2483190-1-philmd@redhat.com>
References: <20210520110919.2483190-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to check the memory transaction succeeded, change
the vring_avail_flags() to take the value to read by argument,
so we can return a boolean whether we succeeded or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/virtio/virtio.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index e02544b2df7..1b8bc194ce1 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -287,16 +287,19 @@ static VRingMemoryRegionCaches *vring_get_region_caches(struct VirtQueue *vq)
 }
 
 /* Called within rcu_read_lock().  */
-static inline uint16_t vring_avail_flags(VirtQueue *vq)
+static inline bool vring_avail_flags(VirtQueue *vq, uint16_t *val)
 {
     VRingMemoryRegionCaches *caches = vring_get_region_caches(vq);
     hwaddr pa = offsetof(VRingAvail, flags);
 
     if (!caches) {
-        return 0;
+        *val = 0;
+        return true;
     }
 
-    return virtio_lduw_phys_cached(vq->vdev, &caches->avail, pa);
+    *val = virtio_lduw_phys_cached_with_attrs(vq->vdev, &caches->avail, pa);
+
+    return true;
 }
 
 /* Called within rcu_read_lock().  */
@@ -2462,7 +2465,9 @@ static bool virtio_split_should_notify(VirtIODevice *vdev, VirtQueue *vq)
     }
 
     if (!virtio_vdev_has_feature(vdev, VIRTIO_RING_F_EVENT_IDX)) {
-        return !(vring_avail_flags(vq) & VRING_AVAIL_F_NO_INTERRUPT);
+        uint16_t flags;
+        return vring_avail_flags(vq, &flags)
+               && !(flags & VRING_AVAIL_F_NO_INTERRUPT);
     }
 
     v = vq->signalled_used_valid;
-- 
2.26.3


