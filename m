Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D532F921E
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 12:51:41 +0100 (CET)
Received: from localhost ([::1]:50558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l16aq-0003M7-DP
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 06:51:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l16Vr-0001Vb-2E
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 06:46:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l16Vp-0008Am-8q
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 06:46:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610883988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JJiWXDHCrLtiiVOj6jLxESuZWEbgyV7pwguWRAe3chY=;
 b=buNhMyQwdtcPbqMgJ/CE73qtc8/081mJ9C6jrQ/pp2AHPWvHHHFSbwEcKkGgTTtzpZcy2G
 l3eCdDiuStxEv2LXYqRW3H6kiS5q5e7R6U7RpfJCnQyIeDPDgWW1aGif+lw8vwYBmMllEI
 ESwxxdVGsMmD6zed6nuAAeSgZAd6Yps=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-grGx5AQjMXGjidzIHwKzYw-1; Sun, 17 Jan 2021 06:46:25 -0500
X-MC-Unique: grGx5AQjMXGjidzIHwKzYw-1
Received: by mail-wm1-f69.google.com with SMTP id u67so1136785wmb.0
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 03:46:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=JJiWXDHCrLtiiVOj6jLxESuZWEbgyV7pwguWRAe3chY=;
 b=XMi9I/rQhR5kR1U1QvpspZcd2fLBvY4sWU1P3QQrnkQWDkAgMtKrgHHkFKKB7ySXMo
 SwwGxIC8XqeKn0ibBo+CyAj1fTF5GxhcFTjNj04y8NnW98XIy7jHPSfc1XmVQXxzD8Cm
 tR7+rNB0L7Y+fdjtM2bnx+xO2e5Fo8BlS2fJSZW62u+7S+5OmIfeqG2EqSurynZZ4469
 TC3lZgk+f/OQn0Fum58vZDtkATnlUkw+cb4PUKvifoykDLuC7KfmofraAnwl0eQ57LVF
 98vY2J48ZN16l5zkRjp+X1A01w3aICXgzcpJnhRIqcbsv4JFhkW6bp6UU+1XdTy2wdtW
 OzYA==
X-Gm-Message-State: AOAM531LPM4uvBRbEoSJ4v17pbt7epeKP+UY3/SghCJ0hKu5gsteirJm
 Pyy8FroB6VIngFUXOurJuCGHE549kqx1A0l3Ef8Ho3ziPvzRC/CXwls3CuX8+wsk8KCgjp1mwC/
 7IApMbAMKps9+eP4dgQcy2+MI3rOtpvoXpEmDY/LuHHTeAKxZmlGE/gYrNHMl
X-Received: by 2002:a1c:68c5:: with SMTP id d188mr16930964wmc.64.1610883983198; 
 Sun, 17 Jan 2021 03:46:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzs1jGOGPZfEt1/HmWfRfk3Qhl++w7Ok4+BoE9LLz/r64QLRhFxNt9NjR/xMzO4YNs+6XN9IQ==
X-Received: by 2002:a1c:68c5:: with SMTP id d188mr16930950wmc.64.1610883982986; 
 Sun, 17 Jan 2021 03:46:22 -0800 (PST)
Received: from redhat.com (bzq-79-176-30-58.red.bezeqint.net. [79.176.30.58])
 by smtp.gmail.com with ESMTPSA id
 s13sm23969407wra.53.2021.01.17.03.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 03:46:22 -0800 (PST)
Date: Sun, 17 Jan 2021 06:46:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/10] vhost-user-fs: add the "bootindex" property
Message-ID: <20210117114519.539647-3-mst@redhat.com>
References: <20210117114519.539647-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210117114519.539647-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 =?utf-8?Q?J=C3=A1n?= Tomko <jtomko@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laszlo Ersek <lersek@redhat.com>

virtio-fs qualifies as a bootable device minimally under OVMF, but
currently the necessary "bootindex" property is missing. Add the property.

Expose the property only in the PCI device, for now. There is no boot
support for virtiofs on s390x (ccw) for the time being [1] [2], so leave
the CCW device unchanged. Add the property to the base device still,
because adding the alias to the CCW device later will be easier this way
[3].

[1] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg01745.html
[2] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg01870.html
[3] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg01751.html

Example OpenFirmware device path for the "vhost-user-fs-pci" device in the
"bootorder" fw_cfg file:

  /pci@i0cf8/pci-bridge@1,6/pci1af4,105a@0/filesystem@0

Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Ján Tomko <jtomko@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-fs@redhat.com
Signed-off-by: Laszlo Ersek <lersek@redhat.com>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20210112131603.12686-1-lersek@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-user-fs.h |  1 +
 hw/virtio/vhost-user-fs-pci.c     |  2 ++
 hw/virtio/vhost-user-fs.c         | 10 ++++++++++
 3 files changed, 13 insertions(+)

diff --git a/include/hw/virtio/vhost-user-fs.h b/include/hw/virtio/vhost-user-fs.h
index 6985752771..0d62834c25 100644
--- a/include/hw/virtio/vhost-user-fs.h
+++ b/include/hw/virtio/vhost-user-fs.h
@@ -39,6 +39,7 @@ struct VHostUserFS {
     VhostUserState vhost_user;
     VirtQueue **req_vqs;
     VirtQueue *hiprio_vq;
+    int32_t bootindex;
 
     /*< public >*/
 };
diff --git a/hw/virtio/vhost-user-fs-pci.c b/hw/virtio/vhost-user-fs-pci.c
index 8bb389bd28..2ed8492b3f 100644
--- a/hw/virtio/vhost-user-fs-pci.c
+++ b/hw/virtio/vhost-user-fs-pci.c
@@ -68,6 +68,8 @@ static void vhost_user_fs_pci_instance_init(Object *obj)
 
     virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
                                 TYPE_VHOST_USER_FS);
+    object_property_add_alias(obj, "bootindex", OBJECT(&dev->vdev),
+                              "bootindex");
 }
 
 static const VirtioPCIDeviceTypeInfo vhost_user_fs_pci_info = {
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index ed036ad9c1..ac4fc34b36 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -22,6 +22,7 @@
 #include "qemu/error-report.h"
 #include "hw/virtio/vhost-user-fs.h"
 #include "monitor/monitor.h"
+#include "sysemu/sysemu.h"
 
 static void vuf_get_config(VirtIODevice *vdev, uint8_t *config)
 {
@@ -279,6 +280,14 @@ static Property vuf_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static void vuf_instance_init(Object *obj)
+{
+    VHostUserFS *fs = VHOST_USER_FS(obj);
+
+    device_add_bootindex_property(obj, &fs->bootindex, "bootindex",
+                                  "/filesystem@0", DEVICE(obj));
+}
+
 static void vuf_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -300,6 +309,7 @@ static const TypeInfo vuf_info = {
     .name = TYPE_VHOST_USER_FS,
     .parent = TYPE_VIRTIO_DEVICE,
     .instance_size = sizeof(VHostUserFS),
+    .instance_init = vuf_instance_init,
     .class_init = vuf_class_init,
 };
 
-- 
MST


