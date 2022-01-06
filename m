Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DEE486583
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:49:56 +0100 (CET)
Received: from localhost ([::1]:50082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5T9P-0006LH-CK
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:49:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sej-0005Ha-0c
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Seg-0000za-8L
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1bYEz3aJ2ZVHIKx33NW8o1kl0YJwc2D4eOCg251Ckdk=;
 b=Edv9RffO+noJK3EimlBMr2p/cfgLjuXggK3NpyaueNTivMQZVOLZBvg6A6fd+s6Fuaym8Q
 8FjWf9cMwm9wSF6qLMpZ8a+YRXZMXH00gttJQKGtmgWKL01kRzSfPUBTsPP2+e6BrOsmsP
 Ffg7h6GN60h4c5JrY9s5NFdKgRq9S7Y=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-_x3YPVmYMCyuPJ0aj-25TA-1; Thu, 06 Jan 2022 08:18:06 -0500
X-MC-Unique: _x3YPVmYMCyuPJ0aj-25TA-1
Received: by mail-ed1-f71.google.com with SMTP id
 q15-20020a056402518f00b003f87abf9c37so1911415edd.15
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:18:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1bYEz3aJ2ZVHIKx33NW8o1kl0YJwc2D4eOCg251Ckdk=;
 b=Bg0hQSN8+bTpr0Cr6SjOzp9iOJnPhqQ4Y4nvSh+sNLIMxacQO9VL9Tk0ZLYfnfgr6T
 W0hsRwUHI3RhlnRAMIxIT8BciyTrvwf5hHpgI74V3+AZLPNQoJyZxMwFKBmSPdmINem9
 0xXByZLppT2HuLTkVQZIm6l1mmYXXLGuWmqxluFLgPDEsgdneFhDScCa1YaKx6f+s13I
 vvkmR5Tx88k8ZJkQxy7y8SYbxUg0mbYJV6JTdR3uM6DtlrtUd6eICwCrfLYH99EMVd/5
 kyUymF+yUfP/PRg9QNqUh5irjTmZ9hkaf+1zlwmF7VYM/SdZ2g+nRVmpzKVADPQt1982
 DKCg==
X-Gm-Message-State: AOAM532n/F+rultNBJk1f7A4JrrP8KY/q/kW8R0LIguKLikfbSwFRDzE
 dLyZQGMDmeCT8w1G+P5by8dt+HqkpSdiXLpdJvIyMFIT/AmSXXhumH/KKWOLPQ+AqJYSpKDyL7U
 O8re5JsOYA4IjPCtACRYTNceeEDbysinQCZJ6wm29nRYUsC63ywTKdi7m5wIQ
X-Received: by 2002:a17:906:48c9:: with SMTP id
 d9mr46065692ejt.57.1641475084913; 
 Thu, 06 Jan 2022 05:18:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPf/zbRaQEoZw4Ne3moE/IsL095GJEWzLHbM98YiFaE+NDk0hQt8DoarfwfI9eQ0NnI/Syng==
X-Received: by 2002:a17:906:48c9:: with SMTP id
 d9mr46065675ejt.57.1641475084616; 
 Thu, 06 Jan 2022 05:18:04 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id p5sm709398edx.34.2022.01.06.05.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:18:04 -0800 (PST)
Date: Thu, 6 Jan 2022 08:18:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 37/52] virtio: signal after wrapping packed used_idx
Message-ID: <20220106131534.423671-38-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
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


