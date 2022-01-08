Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 371484880BD
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:56:21 +0100 (CET)
Received: from localhost ([::1]:50620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60xw-0003a8-9x
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:56:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Av-00054G-5S
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:05:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60At-0002is-JD
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:05:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1bYEz3aJ2ZVHIKx33NW8o1kl0YJwc2D4eOCg251Ckdk=;
 b=cSHVk7TXB124szBMHk/x6BSwd9KEVrdgTc/3atMKe+rON8VO81j54n7Bjz6j1nxPRPY6P1
 Ay4rA/zNcokyccbYolRtndv3nsOR+LZgQ1tLvy8Px6gyIWpytI1LZAUaYygJAzCM4vCR+V
 701zcbNgfQcw8uHkO5W0dSwC5f8J8AQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-WQ5ZP9QlMSC2YTLqBg1X7g-1; Fri, 07 Jan 2022 20:05:38 -0500
X-MC-Unique: WQ5ZP9QlMSC2YTLqBg1X7g-1
Received: by mail-wr1-f71.google.com with SMTP id
 v18-20020a5d5912000000b001815910d2c0so2361610wrd.1
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:05:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1bYEz3aJ2ZVHIKx33NW8o1kl0YJwc2D4eOCg251Ckdk=;
 b=cuxUhWvKBrpeLFdk/Pvkdok6Edm1xpn4gJpXpTzlUrm/gD68vr43JSRHGXv9Rb5Xd7
 7kV1R6gx3ZOzh6zJcy5xWBiPHH04i31vOtWkaWtxqh4JE0uWif3PQeuCaXjnC8M7P2Tj
 MR8hBgW8RPVpuuysEe8oXtFH94FapF39XUA2YB6wCOzjYbdo4wDdw88TkhsG7PMg90nR
 4Z9frGBZJefbuEbeNkskVcwEcnSqLDeEsl928pPdYOF4guFchfIuU4ZkxnWfMf0gTSdl
 BhQiQ6M1hIGqyti9z6iXC/mz0GHaSj5NVrf9YRvjiEqyrdncpM0VsExvjBrdb8zrLvPx
 hniQ==
X-Gm-Message-State: AOAM531e4nUlNQW/eWGHmHZme/Im+jgPtHkFgk77EfzuRPnyooO9OVA6
 +K8nB8NGU7RsWbPdD6hFFXizO3czhJEFJIL+enB9pp35wrZRngtwUf6J11mQCks9ixar6eJMeC3
 Jv+C3hVpCf75tNxBYzRT2QlPrgicl23Mdp1FMTosZ3cJkzZWFaFQqataLFRD4
X-Received: by 2002:a05:6000:3c1:: with SMTP id
 b1mr55441806wrg.394.1641603936395; 
 Fri, 07 Jan 2022 17:05:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsO3ZCP4usMI/qdeCoHjAN1uF45LW/Lm62YhR3Ac78hegpFxbxKD6Yq1+OSvuXr0fP4MS/SQ==
X-Received: by 2002:a05:6000:3c1:: with SMTP id
 b1mr55441796wrg.394.1641603936228; 
 Fri, 07 Jan 2022 17:05:36 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id h2sm204754wrr.96.2022.01.07.17.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:05:35 -0800 (PST)
Date: Fri, 7 Jan 2022 20:05:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 37/55] virtio: signal after wrapping packed used_idx
Message-ID: <20220108003423.15830-38-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Tiwei Bie <tiwei.bie@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Packed Virtqueues wrap used_idx instead of letting it run freely like
Split Virtqueues do. If the used ring wraps more than once there is no
way to compare vq->signalled_used and vq->used_idx in
virtio_packed_should_notify() since they are modulo vq->vring.num.

This causes the device to stop sending used buffer notifications when
when virtio_packed_should_notify() is called less than once each time
around the used ring.

It is possible to trigger this with virtio-blk's dataplane
notify_guest_bh() irq coalescing optimization. The call to
virtio_notify_irqfd() (and virtio_packed_should_notify()) is deferred to
a BH. If the guest driver is polling it can complete and submit more
requests before the BH executes, causing the used ring to wrap more than
once. The result is that the virtio-blk device ceases to raise
interrupts and I/O hangs.

Cc: Tiwei Bie <tiwei.bie@intel.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20211130134510.267382-1-stefanha@redhat.com>
Fixes: 86044b24e865fb9596ed77a4d0f3af8b90a088a1 ("virtio: basic packed virtqueue support")
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 36edb1dad5..971e59a663 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -885,6 +885,7 @@ static void virtqueue_packed_flush(VirtQueue *vq, unsigned int count)
     if (vq->used_idx >= vq->vring.num) {
         vq->used_idx -= vq->vring.num;
         vq->used_wrap_counter ^= 1;
+        vq->signalled_used_valid = false;
     }
 }
 
-- 
MST


