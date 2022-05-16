Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B825292C4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:22:12 +0200 (CEST)
Received: from localhost ([::1]:43886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiAN-0004au-Il
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhiP-0007hZ-1g
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:53:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhiN-0006ca-EX
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:53:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2MX7GRtcGWhweVhH9nwZohY+y+oXcbntcjH/J+Q42jg=;
 b=TX5xPfjUXDQr+4YPVD9xILGNe6ERClr55Y9cayDTWtXzLcOW58D3DRgw/fJO82vMD9q4vK
 4UjgR7DoaEGYuo964L42u8GHPAOGgUtwQfy1AGfZIymnUsdhpvKTnmwOutUS8QiPy9EKZv
 MbnDu9RnqvGQGnK47quQn/loS98HXa4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-ZHlnJiIiNeKl1sQrq3HBNw-1; Mon, 16 May 2022 16:53:13 -0400
X-MC-Unique: ZHlnJiIiNeKl1sQrq3HBNw-1
Received: by mail-ed1-f72.google.com with SMTP id
 b3-20020aa7d483000000b004282ca95814so10417632edr.9
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2MX7GRtcGWhweVhH9nwZohY+y+oXcbntcjH/J+Q42jg=;
 b=Q7wrl0Kpm3E2+4VgklbQR3iY9s+3HqKl7u3AKPl49KhTjrrkdVLHvs3Ld7ikAFEd7v
 4e0XIONJ/C6QY6j8KWxvCa/mL+2zbrVniFVguCHQ10FOkIdYmavWe3wbQFF6m1mua8uy
 xBv6G52sHG/55dnzgFspn/v6+yahNdvYxU/kZFzkB4gCX4S6ImJOE5Xq2WiqJ1UWFSqg
 MDyn3DUTlRwcPPMPuKFhrxiCtmHBKhhj0uUOfNjpCNVu8KtDAFW059XR9KPKiUsZunAL
 aEUmbkwH301LAfQEWgQhBSFu3AFt7ClE5SEq/XpCFgCrTv44I1JHswI3msregvguCtMR
 bd7A==
X-Gm-Message-State: AOAM533WdKd4Xf24lExL0re+sARksUBA07P6DEUG5ckzsTgpK2qmiBAq
 E2DTct35Vo++BJR53d0IIDu2KBI7YLftsmlbfAlMubxEFyHK5WJ32ubCv61CTAGOWeCYABMQTZL
 mm6Q/iI3pLnhBesQ491UWTnYhTVV+hCr7wIDcBwX1VCCNEFEOTwU4lsAjdD68
X-Received: by 2002:a17:907:1c82:b0:6f4:60e5:1ddd with SMTP id
 nb2-20020a1709071c8200b006f460e51dddmr16846434ejc.274.1652734391876; 
 Mon, 16 May 2022 13:53:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz92rZw3j/itTZxpjgVRWzM/5dq5Ulxvhz+LaaIpwm2c07mfMrHikSeTnZdQP8mNdMD5I2LWw==
X-Received: by 2002:a17:907:1c82:b0:6f4:60e5:1ddd with SMTP id
 nb2-20020a1709071c8200b006f460e51dddmr16846414ejc.274.1652734391568; 
 Mon, 16 May 2022 13:53:11 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 p7-20020a170907910700b006f3ef214dabsm178217ejq.17.2022.05.16.13.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:53:11 -0700 (PDT)
Date: Mon, 16 May 2022 16:53:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: [PULL v2 44/86] vhost: Fix device's used descriptor dequeue
Message-ID: <20220516204913.542894-45-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

Only the first one of them were properly enqueued back.

Fixes: 100890f7ca ("vhost: Shadow virtqueue buffers forwarding")

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20220512175747.142058-3-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 1d6552b0fe..a8376ef82b 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -334,12 +334,22 @@ static void vhost_svq_disable_notification(VhostShadowVirtqueue *svq)
     svq->vring.avail->flags |= cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
 }
 
+static uint16_t vhost_svq_last_desc_of_chain(const VhostShadowVirtqueue *svq,
+                                             uint16_t num, uint16_t i)
+{
+    for (uint16_t j = 0; j < (num - 1); ++j) {
+        i = le16_to_cpu(svq->desc_next[i]);
+    }
+
+    return i;
+}
+
 static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
                                            uint32_t *len)
 {
     const vring_used_t *used = svq->vring.used;
     vring_used_elem_t used_elem;
-    uint16_t last_used;
+    uint16_t last_used, last_used_chain, num;
 
     if (!vhost_svq_more_used(svq)) {
         return NULL;
@@ -365,7 +375,10 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
         return NULL;
     }
 
-    svq->desc_next[used_elem.id] = svq->free_head;
+    num = svq->ring_id_maps[used_elem.id]->in_num +
+          svq->ring_id_maps[used_elem.id]->out_num;
+    last_used_chain = vhost_svq_last_desc_of_chain(svq, num, used_elem.id);
+    svq->desc_next[last_used_chain] = svq->free_head;
     svq->free_head = used_elem.id;
 
     *len = used_elem.len;
-- 
MST


