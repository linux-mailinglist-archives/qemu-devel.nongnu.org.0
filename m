Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9F74865E9
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:17:54 +0100 (CET)
Received: from localhost ([::1]:60766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TaT-0003nt-5i
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:17:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sin-0003fd-Jl
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:22:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sil-0001tA-3i
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:22:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=873JIwL0Ssx4x2GI9hqUqv8te9fEzO/xVfFKyB9oXJQ=;
 b=QVMSDF9WJPJZtOdV8rb2rE2ivyboVBm+psTwm2TpwYtTrn4bftUsYSM3DJhuAB+K9R7dPU
 zwO0LIoeANYKwoRtovAEYjDRacfqsugpLhOuwbF23Hua3giQcTh1OcZuwuuxSwSKHI4jFL
 5xPHSLvAKbeSEMV8GglFOpPuOwEFigU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-iC3Zz2jwPR-CLqXsWbhFTw-1; Thu, 06 Jan 2022 08:22:21 -0500
X-MC-Unique: iC3Zz2jwPR-CLqXsWbhFTw-1
Received: by mail-ed1-f69.google.com with SMTP id
 h6-20020a056402280600b003f9967993aeso1937727ede.10
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:22:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=873JIwL0Ssx4x2GI9hqUqv8te9fEzO/xVfFKyB9oXJQ=;
 b=Oqg/IecbdHlQ6Rdn/qAqKWT795nAkw+PYGXGx7sML+nHfMa+fj1DbmPRKyES5zIujd
 hnqLmwwHPyTqSZGJkQImuzk8/T+uy0Wu7BZ8T27zTetnTmzG8tNhECUFiWJtN2UjPbSQ
 3vuJdVDH3Gk/kp2XIUf8Y/BwqgrPP9dw6AgoH8LJo1JmZdhyw65AnyGiA+xe6RT+Q04Q
 4ZTtLPrKfQWwbDvPH4+xlranCYwGAsryQu7vFfjdQugXWx4Ir2jlSINe0nLJEGmy4j6L
 aEpaWi6/dzGAfW+e0VZEYPKynyTGEJ4Uuz09XG+KjUg01M2MNTSz4idFNBivstDGZ0DK
 5RWw==
X-Gm-Message-State: AOAM531XnRtODbHoTGbdXEbHdX9dTxyFgG8cBKbWls8UO7Lc/FsV5pRa
 v5gyzjAzUA+8egGdsg5NN1MVMdkW88FVN+TjsFoKwW9ZDKVxyDkIOLi1IJzT04oEsBlhah7jj6H
 8L/D4wBIrt+t1T0Jj3lxZxqFgCknT0CL1x3kXgMplLjBZySggbLHZ1ii8ibCK
X-Received: by 2002:a05:6402:5190:: with SMTP id
 q16mr58491410edd.332.1641475340293; 
 Thu, 06 Jan 2022 05:22:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2NwMYyqLCvTH9MYwIcR0qM36ZDyIiUg0OXeuWHet+xdQYW6r7vzgi4/qHUmiEYrrmBTwzJA==
X-Received: by 2002:a05:6402:5190:: with SMTP id
 q16mr58491395edd.332.1641475340137; 
 Thu, 06 Jan 2022 05:22:20 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id q14sm727383edd.40.2022.01.06.05.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:22:19 -0800 (PST)
Date: Thu, 6 Jan 2022 08:22:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/52] vhost: introduce new VhostOps vhost_set_config_call
Message-ID: <20220106131534.423671-7-mst@redhat.com>
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

This patch introduces new VhostOps vhost_set_config_call. This function allows the
vhost to set the event fd to kernel

Signed-off-by: Cindy Lu <lulu@redhat.com>
Message-Id: <20211104164827.21911-5-lulu@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-backend.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index 81bf3109f8..ff34eb7c8a 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -126,6 +126,8 @@ typedef int (*vhost_get_device_id_op)(struct vhost_dev *dev, uint32_t *dev_id);
 
 typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
 
+typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
+                                       int fd);
 typedef struct VhostOps {
     VhostBackendType backend_type;
     vhost_backend_init vhost_backend_init;
@@ -171,6 +173,7 @@ typedef struct VhostOps {
     vhost_vq_get_addr_op  vhost_vq_get_addr;
     vhost_get_device_id_op vhost_get_device_id;
     vhost_force_iommu_op vhost_force_iommu;
+    vhost_set_config_call_op vhost_set_config_call;
 } VhostOps;
 
 int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
-- 
MST


