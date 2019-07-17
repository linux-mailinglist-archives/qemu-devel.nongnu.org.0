Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E50116B98D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 11:47:53 +0200 (CEST)
Received: from localhost ([::1]:55454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hngXQ-0006Hi-T8
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 05:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42198)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hngX8-0005qp-U2
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 05:47:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hngX7-0004Rw-Tz
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 05:47:34 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:54575)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1hngX7-0004RG-Nc
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 05:47:33 -0400
Received: by mail-wm1-x341.google.com with SMTP id p74so21446357wme.4
 for <qemu-devel@nongnu.org>; Wed, 17 Jul 2019 02:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dbece1O+8+8gl9sxthTmKxvPFyZ2+lF74XZaPFS1las=;
 b=pjImoR0RGHgu2roSw6hYlvchgivuAVySqh2qw7FWlSVZIVWFaw02O9UccH63tMgcaw
 rzGWs5+r0kqsrfbODyGzsDhiLHVMgxI01geKk3uwg2H1+B5D33Chrg8/Cw8mrFAIwNDQ
 xCaVbNJupFoXK+cUmoKe0UPdiTVBctLe6v/WAAfZ7aEQ4EoY25eOcXGUCTbPgbX2h4Pk
 kuIiqQ4D2QhdiPrXsNun39tb5VQHszFeoOTfv7iJ6YsRxYdorl5lvSHvPsRp2TqzWK4I
 U+euPUhwowvoi4+wGm2wqs6+3fvyS7LVMKVSmXMdzDdjyb9L8qTeBAgKt8XoR+jBB3lA
 5jeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Dbece1O+8+8gl9sxthTmKxvPFyZ2+lF74XZaPFS1las=;
 b=XDjtrvnUZHKBgTbtQLHi4jvyrrzo9uLsXm+nQQH163M+9Jt3qme8kv7BvCfjkQYsAd
 BTZ9Aq8mAjMB82wiInrNaZvlwi91TwsY8r+IkjYMQUDYId4SdCaQnRKjLvA6JigRjQgs
 lfs1LrTq2HjeOCAiOvO9gWC8+aPDcoqyXDmXnIGza3N8RCuLAibjNSCLLAfp8DgTTDVj
 Uz9+O6bjCEL4Eqmb0ZOkoydh+OamIxVpTQGoqyHgAQe7OlB9gbBWVkg0ReAEcmveECj+
 FiOPJ4RObiLahnqGH69rUmRySjY5J8y0NDM4/NeAe9XnuH4El5gPGIZqj3VAZonkuOeE
 EeBA==
X-Gm-Message-State: APjAAAV4jzxW60a1jJsBXii7WmF8uDtQSlnCNR5ZpdkEtCStMypWFNi2
 XDC6EfHmRWde70rSAkiZ38Wqj4XqGns=
X-Google-Smtp-Source: APXvYqySOnpaI4dg3k+IDJULoI8Sy7/X9Jrm2WjI7tp+tw6CMDVsuFV2IEBiP2IEBqBLbVgv7VH+og==
X-Received: by 2002:a1c:a503:: with SMTP id o3mr34000090wme.37.1563356851100; 
 Wed, 17 Jul 2019 02:47:31 -0700 (PDT)
Received: from donizetti.lan ([2001:b07:6468:f312:e427:3beb:1110:dda2])
 by smtp.gmail.com with ESMTPSA id 2sm28592349wrn.29.2019.07.17.02.47.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 17 Jul 2019 02:47:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 17 Jul 2019 11:47:28 +0200
Message-Id: <20190717094728.31006-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PATCH] virtio-scsi: remove unused argument to
 virtio_scsi_common_realize
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The argument is not used and passing it clutters error propagation in the
callers.  So, get rid of it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/vhost-scsi.c            | 2 +-
 hw/scsi/vhost-user-scsi.c       | 2 +-
 hw/scsi/virtio-scsi.c           | 4 ++--
 include/hw/virtio/virtio-scsi.h | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index 4090f99ee4..76bb875ca6 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -262,7 +262,7 @@ static void vhost_scsi_unrealize(DeviceState *dev, Error **errp)
     vhost_dev_cleanup(&vsc->dev);
     g_free(vqs);
 
-    virtio_scsi_common_unrealize(dev, errp);
+    virtio_scsi_common_unrealize(dev);
 }
 
 static Property vhost_scsi_properties[] = {
diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
index a9fd8ea305..a0b69fbc0f 100644
--- a/hw/scsi/vhost-user-scsi.c
+++ b/hw/scsi/vhost-user-scsi.c
@@ -125,7 +125,7 @@ static void vhost_user_scsi_unrealize(DeviceState *dev, Error **errp)
     vhost_dev_cleanup(&vsc->dev);
     g_free(vqs);
 
-    virtio_scsi_common_unrealize(dev, errp);
+    virtio_scsi_common_unrealize(dev);
     vhost_user_cleanup(&s->vhost_user);
 }
 
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 61ce365fe9..d0bdbff090 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -922,7 +922,7 @@ static void virtio_scsi_device_realize(DeviceState *dev, Error **errp)
     virtio_scsi_dataplane_setup(s, errp);
 }
 
-void virtio_scsi_common_unrealize(DeviceState *dev, Error **errp)
+void virtio_scsi_common_unrealize(DeviceState *dev)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIOSCSICommon *vs = VIRTIO_SCSI_COMMON(dev);
@@ -936,7 +936,7 @@ static void virtio_scsi_device_unrealize(DeviceState *dev, Error **errp)
     VirtIOSCSI *s = VIRTIO_SCSI(dev);
 
     qbus_set_hotplug_handler(BUS(&s->bus), NULL, &error_abort);
-    virtio_scsi_common_unrealize(dev, errp);
+    virtio_scsi_common_unrealize(dev);
 }
 
 static Property virtio_scsi_properties[] = {
diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
index 4c0bcdb788..122f7c4b6f 100644
--- a/include/hw/virtio/virtio-scsi.h
+++ b/include/hw/virtio/virtio-scsi.h
@@ -145,7 +145,7 @@ void virtio_scsi_common_realize(DeviceState *dev,
                                 VirtIOHandleOutput cmd,
                                 Error **errp);
 
-void virtio_scsi_common_unrealize(DeviceState *dev, Error **errp);
+void virtio_scsi_common_unrealize(DeviceState *dev);
 bool virtio_scsi_handle_event_vq(VirtIOSCSI *s, VirtQueue *vq);
 bool virtio_scsi_handle_cmd_vq(VirtIOSCSI *s, VirtQueue *vq);
 bool virtio_scsi_handle_ctrl_vq(VirtIOSCSI *s, VirtQueue *vq);
-- 
2.21.0


