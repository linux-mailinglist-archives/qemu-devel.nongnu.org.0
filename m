Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E72D06137A5
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:16:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUIP-0002Iu-AQ; Mon, 31 Oct 2022 08:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHz-00084F-M3
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHv-0002z2-OT
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o4ROciCLZ9i/1jI+qJP8SDYVOQK7gC8l6WXiDFJoS00=;
 b=FL3wqMh2MoxGuCvdFA6P4iIHKQqL5pNpVnGpQvwYXnCmhkvkjpp1Zx1n0VuYrgPIXE00pm
 phV8qW5zw3MMemI1Q5QWXjxrhUUwasvO1qBnsBn+5Xaw3h9LWDaBfKmiH/FZRUtPgqMzWJ
 fIcQ2O3sLXCBmn5QmiajP6EOqnZMqbU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-335-GB8MVXIWPgKSGZTvC2SfwQ-1; Mon, 31 Oct 2022 08:53:09 -0400
X-MC-Unique: GB8MVXIWPgKSGZTvC2SfwQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 az11-20020a05600c600b00b003c6e3d4d5b1so5257981wmb.7
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o4ROciCLZ9i/1jI+qJP8SDYVOQK7gC8l6WXiDFJoS00=;
 b=6ABDsiau7gVuqYtnj1TF6txAZV/KgbYZgoOPNTaPKKlJROu7PYOuxNIqTA9chbUnRq
 L11w2m2g03U3PZVB0/sL2kWDn18arn83kKdRtfsxbeMc8G1yJkUmPymgtv6S++jko1Oq
 QTG9Yv2TYnHQFCGWo99tRtaWjRu2kP5KKDreL41RhH3zuc91Kyxe73L9SIXHXzlkdUY/
 C0p4PHsPr/mWO4aYn3Lot8l4O2+r/uiSF6XKvrgvZfGp5d9wNGEBvL8Qxhoay2vxkIWP
 d6ofSkkbvWfk8q+6uxBwux7mg4dcNi/1XxudGzPcVb9rURSqXE75ilXQyMhS5IuKUjHa
 dbxA==
X-Gm-Message-State: ACrzQf2v2aHCEVOy1XLbId1Wad13PMc3jkLXnbrSCmYv6u2m83rt0a2A
 6ZbJ2g0G0nzAQvAFyoWPyeukvremeNG43hZ1IAolKtP5ZndvRVYE/rbczxRRdhHTJarAUW6Cqty
 evFPTMXjwNx280MzNM8woyUAL0JtK9oJ/KUgNbmPvoNKwg/Kh5Z1pEF69L+M4
X-Received: by 2002:a05:600c:5493:b0:3c9:c18:87d5 with SMTP id
 iv19-20020a05600c549300b003c90c1887d5mr17461279wmb.188.1667220788075; 
 Mon, 31 Oct 2022 05:53:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4/zLuP/GQ3qABWBIZyqsglWxwCr20WiWsXNIrfSXJdUeUk+dwi7EWTDIyPk6HHk9mGwNphpg==
X-Received: by 2002:a05:600c:5493:b0:3c9:c18:87d5 with SMTP id
 iv19-20020a05600c549300b003c90c1887d5mr17461259wmb.188.1667220787769; 
 Mon, 31 Oct 2022 05:53:07 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 y10-20020a5d620a000000b0023657e1b97esm7119347wru.11.2022.10.31.05.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:53:07 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:53:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 50/86] vhost: vhost-kernel: enable vq reset feature
Message-ID: <20221031124928.128475-51-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Kangjie Xu <kangjie.xu@linux.alibaba.com>

Add virtqueue reset feature for vhost-kernel.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-15-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/vhost_net.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index f2ada02781..a6a130e1ae 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -47,6 +47,7 @@ static const int kernel_feature_bits[] = {
     VIRTIO_NET_F_MTU,
     VIRTIO_F_IOMMU_PLATFORM,
     VIRTIO_F_RING_PACKED,
+    VIRTIO_F_RING_RESET,
     VIRTIO_NET_F_HASH_REPORT,
     VHOST_INVALID_FEATURE_BIT
 };
-- 
MST


