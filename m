Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 271F6422E20
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:37:58 +0200 (CEST)
Received: from localhost ([::1]:39144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnS1-0002di-6K
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmsw-0000F2-RT
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmsu-00055H-4l
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fs2jGv1ZGLGWfNNqaXvArTOk/Hk3P7U2RtH4BA/MbhI=;
 b=E02xj45cRd9QsU/dszJOss4tT7WFyBhtzfuGqMRTtNFGzGgDPowBrWEXT4ccMvU5R32uVU
 7R8fac+zn39DUKEZF6VovCNIQvpJmUgmlO79UKa+UT1b7nfv/sVkE6KdUQdF5kDMWIGmvG
 eZGPk24n/K5LjODz2rJvaZnJpx3bWqA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-ANSAZk5ePU2hCvrXMO2bSQ-1; Tue, 05 Oct 2021 12:01:34 -0400
X-MC-Unique: ANSAZk5ePU2hCvrXMO2bSQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 13-20020a05600c230d00b0030d762b5832so957334wmo.9
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Fs2jGv1ZGLGWfNNqaXvArTOk/Hk3P7U2RtH4BA/MbhI=;
 b=vwMSi5HK7Y8KrBsnBdnKiDXCyTeyXnaz40iaXiVoC/CMfFQaiEhYX+6aUtPcUYTXDz
 PR7Wovcny7L+4APkC9I+uBqSJZKDCUaIBV/4VHP5J+jefqY7PFgOO/n8+bgLQQ7vfdq9
 JVH6pUMZWo7NUv3AZ5pjAYGLlM2b3Sxuwm6NW62OPNC5nSOXaYwZYH7rXXTUrx5fIJ7H
 Z0RhJNXeAr53nJRCFEAVSA6m7lZIHjImFlg7lc4xmOqEcH6PyfSexRtYyEIb5aL+oEw/
 qBjoU9iY8uOKWnKXue9XsWGhu20EX+QClsbmuqfxdiCbwLUoS8SkYeKLDbmUi6MYAo+K
 v33g==
X-Gm-Message-State: AOAM533v0p5Bpw2Al6Y9Qx8kgHIFF9rxC8FAa/aiLk/bjCXj79wX7KOo
 IXP0livPPwHGjBpSaPwXtZLDC3H4myMrEZuhzTErZBnWLqr+HePpMYtY1xxrqj4dUjZqKchsmJ3
 6srGSCxpXfQcwaC3Bm7jIedKFk2edH2n9McgenapsXCuaoPooOPT4bLPunz2t
X-Received: by 2002:adf:9d47:: with SMTP id o7mr22912102wre.50.1633449692081; 
 Tue, 05 Oct 2021 09:01:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyhIil+A2dE+e5z3LVeqsbh0w5d827MXLnNciuRdWpfirOe4uqbiA9gidpboN2TvOGJTaWaA==
X-Received: by 2002:adf:9d47:: with SMTP id o7mr22912063wre.50.1633449691804; 
 Tue, 05 Oct 2021 09:01:31 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id o19sm19065749wrg.60.2021.10.05.09.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:01:31 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:01:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/57] vhost-vsock: fix migration issue when seqpacket is
 supported
Message-ID: <20211005155946.513818-14-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, Jiang Wang <jiang.wang@bytedance.com>,
 qemu-stable@nongnu.org, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefano Garzarella <sgarzare@redhat.com>

Commit 1e08fd0a46 ("vhost-vsock: SOCK_SEQPACKET feature bit support")
enabled the SEQPACKET feature bit.
This commit is released with QEMU 6.1, so if we try to migrate a VM where
the host kernel supports SEQPACKET but machine type version is less than
6.1, we get the following errors:

    Features 0x130000002 unsupported. Allowed features: 0x179000000
    Failed to load virtio-vhost_vsock:virtio
    error while loading state for instance 0x0 of device '0000:00:05.0/virtio-vhost_vsock'
    load of migration failed: Operation not permitted

Let's disable the feature bit for machine types < 6.1.
We add a new OnOffAuto property for this, called `seqpacket`.
When it is `auto` (default), QEMU behaves as before, trying to enable the
feature, when it is `on` QEMU will fail if the backend (vhost-vsock
kernel module) doesn't support it.

Fixes: 1e08fd0a46 ("vhost-vsock: SOCK_SEQPACKET feature bit support")
Cc: qemu-stable@nongnu.org
Reported-by: Jiang Wang <jiang.wang@bytedance.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20210921161642.206461-2-sgarzare@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-vsock.h |  3 +++
 hw/core/machine.c               |  1 +
 hw/virtio/vhost-vsock.c         | 19 ++++++++++++++++---
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/include/hw/virtio/vhost-vsock.h b/include/hw/virtio/vhost-vsock.h
index 84f4e727c7..3f121a624f 100644
--- a/include/hw/virtio/vhost-vsock.h
+++ b/include/hw/virtio/vhost-vsock.h
@@ -30,6 +30,9 @@ struct VHostVSock {
     VHostVSockCommon parent;
     VHostVSockConf conf;
 
+    /* features */
+    OnOffAuto seqpacket;
+
     /*< public >*/
 };
 
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 3920a2f2af..74f2a9a984 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -46,6 +46,7 @@ GlobalProperty hw_compat_6_0[] = {
     { "nvme-ns", "eui64-default", "off"},
     { "e1000", "init-vet", "off" },
     { "e1000e", "init-vet", "off" },
+    { "vhost-vsock-device", "seqpacket", "off" },
 };
 const size_t hw_compat_6_0_len = G_N_ELEMENTS(hw_compat_6_0);
 
diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 1b1a5c70ed..dade0da031 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -114,10 +114,21 @@ static uint64_t vhost_vsock_get_features(VirtIODevice *vdev,
                                          Error **errp)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
+    VHostVSock *vsock = VHOST_VSOCK(vdev);
 
-    virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_SEQPACKET);
-    return vhost_get_features(&vvc->vhost_dev, feature_bits,
-                                requested_features);
+    if (vsock->seqpacket != ON_OFF_AUTO_OFF) {
+        virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_SEQPACKET);
+    }
+
+    requested_features = vhost_get_features(&vvc->vhost_dev, feature_bits,
+                                            requested_features);
+
+    if (vsock->seqpacket == ON_OFF_AUTO_ON &&
+        !virtio_has_feature(requested_features, VIRTIO_VSOCK_F_SEQPACKET)) {
+        error_setg(errp, "vhost-vsock backend doesn't support seqpacket");
+    }
+
+    return requested_features;
 }
 
 static const VMStateDescription vmstate_virtio_vhost_vsock = {
@@ -218,6 +229,8 @@ static void vhost_vsock_device_unrealize(DeviceState *dev)
 static Property vhost_vsock_properties[] = {
     DEFINE_PROP_UINT64("guest-cid", VHostVSock, conf.guest_cid, 0),
     DEFINE_PROP_STRING("vhostfd", VHostVSock, conf.vhostfd),
+    DEFINE_PROP_ON_OFF_AUTO("seqpacket", VHostVSock, seqpacket,
+                            ON_OFF_AUTO_AUTO),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
MST


