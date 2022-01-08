Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCD34880BF
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:57:38 +0100 (CET)
Received: from localhost ([::1]:56158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60zB-0007RK-Pn
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:57:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Bl-0006ec-Ai
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:06:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Bj-0002uv-Sw
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:06:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sZKl68SrJVJX9J/g8uBNG773VeE63EY7yyNvoTLPOxc=;
 b=XpF4LdFbyJPXPSuMyFuiVnLP1d6NDPWobcJ47xCOQ/Y5CQ+wYL2/BMR9VIrBOwZwBcP9Ha
 RxrP47KQ22siIP+KwdvbQ6e04W+4XPsV95PRsnwW0mubrZPjhWcm1/JL4IgeargdvGw2Jp
 Rj1dnt596ZafwdMwSK4SJtDHve5cA2k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516--JDPA-g1ME6V9XRtP0bVRw-1; Fri, 07 Jan 2022 20:06:30 -0500
X-MC-Unique: -JDPA-g1ME6V9XRtP0bVRw-1
Received: by mail-wm1-f70.google.com with SMTP id
 n3-20020a05600c3b8300b00345c3fc40b0so5619305wms.3
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:06:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sZKl68SrJVJX9J/g8uBNG773VeE63EY7yyNvoTLPOxc=;
 b=gi3yCjJAAgk/LOBTXoEbbh67nuLwoA/XtMoANvVrznkNujCSlGUc4w5TKGdBmfovzi
 mCwLnBbo7InB17a7qSJ44O8IUUf0A1Xp7sBxNuxa/hczp4PFayg6pL6ZpMRQvvx886p8
 cfstes5Vs5WX5cppFc74X1QUzuJErEM5q9zwL1XaD1Wjy6iycnsUcQLnSiEnzFN2Hqqd
 tQUsusj7v8EHUIzGJKXQ8mYJsKb9ZTulhjhwi0Sm7zsbPlC39bcaM45Z4N7/7RkzrttO
 q2WnmHVYBY+EHQzQ+kkDs7t81qGVFfBk0LFTlXSdxWB0wFZip7OtSBanKGBTGae7KdQ9
 CUzg==
X-Gm-Message-State: AOAM533M0cNFw3jP/VVMNdXRTNZ2xG0RXvo+BQXAxbxMqriYV28Q4YoG
 8ea/JFgtqhc4pdU8RrwELllq3a9+AYBOEmF+acMCEYxOYd5SIVg8FF2aRFIOs2IqJMY+EzDmkGm
 uZDDOKga8rcNJq8KahbeC4iElhAzIh1BYDB82TGOgScrX8+JKgwAxo3amZbij
X-Received: by 2002:a05:6000:24b:: with SMTP id
 m11mr11149219wrz.122.1641603988910; 
 Fri, 07 Jan 2022 17:06:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzy4bEN0GjhnFWAgKXrwL+MNoBVoD/YQXdyhjY8biuSauI0FXZQgLryuVb7B/RD6FcGnUpn7Q==
X-Received: by 2002:a05:6000:24b:: with SMTP id
 m11mr11149206wrz.122.1641603988656; 
 Fri, 07 Jan 2022 17:06:28 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id b10sm74399wmj.42.2022.01.07.17.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:06:28 -0800 (PST)
Date: Fri, 7 Jan 2022 20:06:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 52/55] virtio/vhost-vsock: don't double close vhostfd,
 remove redundant cleanup
Message-ID: <20220108003423.15830-53-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniil Tatianin <d-tatianin@yandex-team.ru>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniil Tatianin <d-tatianin@yandex-team.ru>

In case of an error during initialization in vhost_dev_init, vhostfd is
closed in vhost_dev_cleanup. Remove close from err_virtio as it's both
redundant and causes a double close on vhostfd.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
Message-Id: <20211129125204.1108088-1-d-tatianin@yandex-team.ru>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vsock.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 478c0c9a87..433d42d897 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -171,6 +171,10 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
     ret = vhost_dev_init(&vvc->vhost_dev, (void *)(uintptr_t)vhostfd,
                          VHOST_BACKEND_TYPE_KERNEL, 0, errp);
     if (ret < 0) {
+        /*
+         * vhostfd is closed by vhost_dev_cleanup, which is called
+         * by vhost_dev_init on initialization error.
+         */
         goto err_virtio;
     }
 
@@ -183,15 +187,10 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
     return;
 
 err_vhost_dev:
-    vhost_dev_cleanup(&vvc->vhost_dev);
     /* vhost_dev_cleanup() closes the vhostfd passed to vhost_dev_init() */
-    vhostfd = -1;
+    vhost_dev_cleanup(&vvc->vhost_dev);
 err_virtio:
     vhost_vsock_common_unrealize(vdev);
-    if (vhostfd >= 0) {
-        close(vhostfd);
-    }
-    return;
 }
 
 static void vhost_vsock_device_unrealize(DeviceState *dev)
-- 
MST


