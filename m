Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC316A7CE3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:37:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeFn-0002Zm-Uz; Thu, 02 Mar 2023 03:25:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFb-0002Gl-FA
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFa-0002Cg-11
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sRn8nbOLvbg1RpQOABWdg5Az4dJPZXr4HCT32fm1f4w=;
 b=KB8sgfcl3om+poS/4dDgVSmqskZg0Fv3fjL93gdSMMmzxQ3s9gmdukqJZ9ho4VJU+/zE0F
 QKPU2dTp3w0uXXrC8CkAGKeX1/uWecz1xGnxA5riX0N4FMj+Wy6KEH8pvglfR0iGZgrtmx
 /UJao/WrXrNp4H2SZmyy+j5UqNYu+PE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-380-cUAjxOGPPQiupIU6lI8L_g-1; Thu, 02 Mar 2023 03:25:15 -0500
X-MC-Unique: cUAjxOGPPQiupIU6lI8L_g-1
Received: by mail-wm1-f70.google.com with SMTP id
 e17-20020a05600c219100b003e21fa60ec1so747396wme.2
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:25:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745514;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sRn8nbOLvbg1RpQOABWdg5Az4dJPZXr4HCT32fm1f4w=;
 b=y8BNHHyANjsOFcBRjLPh9F85UgreMvFI8EbA1HIps/+VopWol9BPSLkJQeS9dKvz77
 V/FNby+ba5gpaviFdEg7OcLUH5EmgCkVduvUS4SRrQGS85HU4g3NYNV0IFmxfVTpTbR4
 BiU1Kf9ts11oiYMb2YwOSMKGP+zuNPw4CxsltwJcYRQYRKjFgtB3DpAb2vobDWHM1e6S
 GcdAIgLs0MxMmD0LADTjlU5NdklwM6KQv1/K3G8gNFsv8ePVIxsH2lrmHurcptS2qJsO
 Zm9jiYmrC73hsx2QC+XmPX5Ps1uBc/XBn8viCbfj8+QXMTWNmjdq0+GRM4wUYgSh7atC
 SsCw==
X-Gm-Message-State: AO0yUKXwCcQ1NGo9JdC1yHEa11CLTvqb7oecx8dw+3KalxYJkr6gjsg1
 WH77qMSRYvC1F6k9+GCUbw1j7Ehttd9qJSy3WHsK3u6PJp8G+H6nd6My/HTSa1EGEnzb2I09Yuc
 oAB+oRaDXP3lMpafHN+OamSmhUPnpdv5H7cRCj49YFsA/16GLjCE2STUOG/s3WoXMZg==
X-Received: by 2002:a05:600c:1d16:b0:3df:9858:c030 with SMTP id
 l22-20020a05600c1d1600b003df9858c030mr840800wms.5.1677745514275; 
 Thu, 02 Mar 2023 00:25:14 -0800 (PST)
X-Google-Smtp-Source: AK7set/p2BlBnZcNOsUEUA8Mt3m0X7kkgetFZThKekdGkJBDzJvCGnRX9Zo3u0NjFPyiUJ7mBea6IQ==
X-Received: by 2002:a05:600c:1d16:b0:3df:9858:c030 with SMTP id
 l22-20020a05600c1d1600b003df9858c030mr840785wms.5.1677745514014; 
 Thu, 02 Mar 2023 00:25:14 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 ja20-20020a05600c557400b003eb596cbc54sm2234104wmb.0.2023.03.02.00.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:25:13 -0800 (PST)
Date: Thu, 2 Mar 2023 03:25:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PULL 13/53] vhost-user-rng: Back up vqs before cleaning up vhost_dev
Message-ID: <20230302082343.560446-14-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Akihiko Odaki <akihiko.odaki@daynix.com>

vhost_dev_cleanup() clears vhost_dev so back up its vqs member to free
the memory pointed by the member.

Fixes: 821d28b88f ("vhost-user-rng: Add vhost-user-rng implementation")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20230130140516.78078-1-akihiko.odaki@daynix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-user-rng.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
index 201a39e220..efc54cd3fb 100644
--- a/hw/virtio/vhost-user-rng.c
+++ b/hw/virtio/vhost-user-rng.c
@@ -229,6 +229,7 @@ static void vu_rng_device_realize(DeviceState *dev, Error **errp)
     return;
 
 vhost_dev_init_failed:
+    g_free(rng->vhost_dev.vqs);
     virtio_delete_queue(rng->req_vq);
 virtio_add_queue_failed:
     virtio_cleanup(vdev);
@@ -239,12 +240,12 @@ static void vu_rng_device_unrealize(DeviceState *dev)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VHostUserRNG *rng = VHOST_USER_RNG(dev);
+    struct vhost_virtqueue *vhost_vqs = rng->vhost_dev.vqs;
 
     vu_rng_set_status(vdev, 0);
 
     vhost_dev_cleanup(&rng->vhost_dev);
-    g_free(rng->vhost_dev.vqs);
-    rng->vhost_dev.vqs = NULL;
+    g_free(vhost_vqs);
     virtio_delete_queue(rng->req_vq);
     virtio_cleanup(vdev);
     vhost_user_cleanup(&rng->vhost_user);
-- 
MST


