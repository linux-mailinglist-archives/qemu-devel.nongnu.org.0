Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD52351ACD
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 20:07:36 +0200 (CEST)
Received: from localhost ([::1]:46838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS1jD-0004wy-Ft
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 14:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lS1er-0003Bj-VE
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 14:03:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lS1ek-0005ry-Hi
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 14:03:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617300177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G31uNypBJwdGB42YcMOaMNC4SaJrMSHozBk1bd66u7c=;
 b=APat1eS00o60fY0sUG5WDMJsMF3a/cxAEq6DPPYINDUKlFzSsdf1TG7MrFr8stv79ZO8x9
 JxT+/xnsDMlQ9XV0WzyZrLKhwnu0vsyv+yOWsGWseCTBz6FoDfGIU3U9vuTnVPHNClDlau
 4IygdoPPJfhTR5XFsiHw9CTFMy7rB44=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-GgqOUB_cNaaBt2RMUGH7sA-1; Thu, 01 Apr 2021 14:02:55 -0400
X-MC-Unique: GgqOUB_cNaaBt2RMUGH7sA-1
Received: by mail-wm1-f69.google.com with SMTP id k132so1594586wma.1
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 11:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G31uNypBJwdGB42YcMOaMNC4SaJrMSHozBk1bd66u7c=;
 b=JlVMcpW/gA900i4hzWDyMQJPjgg7v1wMluRf+0/GHTBpGDur3BCsQlJn50AuFfVYaG
 SHnZIBS910CkQGp1lRBMMxgnkKFFC3JDqrGU/Mq4nv7X0Z78zWA7oRfz9H5/Q9qvqSoV
 frVBHnimnnbyH9U1FYCvte/jkYCARU9m3urvhMGf2/fqwfX0TYbMkwdZSB/kkwiS5bGs
 jakUx8pHoqRL7qwAuVtWb593USMM/0MPC+2DDJNfeX6GJMkbXa4HB6f6jLW8rGKnui0t
 mNmH+f0vreMQB+CMBMH6qJX6Jx1iC4FecRba7rXAaOPgtSSK7lK1sYaLI63ttWLp/VRb
 Duhg==
X-Gm-Message-State: AOAM531GPpi3J/OZdziZGEW1e6YAtPA6ww0vQEAcnva0BlJUeXVnBvjp
 pCKTB3XKG8wJs4btekcXoLGuId97TEOpLdSB4if7ZGqCnkE3xElN/qK4kY6eOdVnad97gE5QgmZ
 bOZP85GEQj1acN2q8xkVYkfgiDfYk6dMoRLfNe9Cf6TqFO61DGL6eK1hCfz9c
X-Received: by 2002:a5d:6a4c:: with SMTP id t12mr10961496wrw.289.1617300174262; 
 Thu, 01 Apr 2021 11:02:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztEqL0FjHv0Y+Cf3DLfhcZ7nUdOk6TdL/fa3Vkt0p6TS1sMssxFFkWX6XkW+verJKOhSB5hw==
X-Received: by 2002:a5d:6a4c:: with SMTP id t12mr10961464wrw.289.1617300174073; 
 Thu, 01 Apr 2021 11:02:54 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id h9sm9226071wmb.35.2021.04.01.11.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 11:02:53 -0700 (PDT)
Date: Thu, 1 Apr 2021 14:02:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/9] vhost-user-blk: use different event handlers on
 initialization
Message-ID: <20210401180235.226321-2-mst@redhat.com>
References: <20210401180235.226321-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210401180235.226321-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Denis Plotnikov <den-plotnikov@yandex-team.ru>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Denis Plotnikov <den-plotnikov@yandex-team.ru>

It is useful to use different connect/disconnect event handlers
on device initialization and operation as seen from the further
commit fixing a bug on device initialization.

This patch refactors the code to make use of them: we don't rely any
more on the VM state for choosing how to cleanup the device, instead
we explicitly use the proper event handler depending on whether
the device has been initialized.

Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Message-Id: <20210325151217.262793-2-den-plotnikov@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/block/vhost-user-blk.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index b870a50e6b..1af95ec6aa 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -362,7 +362,18 @@ static void vhost_user_blk_disconnect(DeviceState *dev)
     vhost_dev_cleanup(&s->dev);
 }
 
-static void vhost_user_blk_event(void *opaque, QEMUChrEvent event);
+static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
+                                 bool realized);
+
+static void vhost_user_blk_event_realize(void *opaque, QEMUChrEvent event)
+{
+    vhost_user_blk_event(opaque, event, false);
+}
+
+static void vhost_user_blk_event_oper(void *opaque, QEMUChrEvent event)
+{
+    vhost_user_blk_event(opaque, event, true);
+}
 
 static void vhost_user_blk_chr_closed_bh(void *opaque)
 {
@@ -371,11 +382,12 @@ static void vhost_user_blk_chr_closed_bh(void *opaque)
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
 
     vhost_user_blk_disconnect(dev);
-    qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, vhost_user_blk_event,
-            NULL, opaque, NULL, true);
+    qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL,
+            vhost_user_blk_event_oper, NULL, opaque, NULL, true);
 }
 
-static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
+static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
+                                 bool realized)
 {
     DeviceState *dev = opaque;
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
@@ -406,7 +418,7 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
          * TODO: maybe it is a good idea to make the same fix
          * for other vhost-user devices.
          */
-        if (runstate_is_running()) {
+        if (realized) {
             AioContext *ctx = qemu_get_current_aio_context();
 
             qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, NULL, NULL,
@@ -473,8 +485,9 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
     s->vhost_vqs = g_new0(struct vhost_virtqueue, s->num_queues);
     s->connected = false;
 
-    qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL, vhost_user_blk_event,
-                             NULL, (void *)dev, NULL, true);
+    qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL,
+                             vhost_user_blk_event_realize, NULL, (void *)dev,
+                             NULL, true);
 
 reconnect:
     if (qemu_chr_fe_wait_connected(&s->chardev, &err) < 0) {
@@ -494,6 +507,10 @@ reconnect:
         goto reconnect;
     }
 
+    /* we're fully initialized, now we can operate, so change the handler */
+    qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL,
+                             vhost_user_blk_event_oper, NULL, (void *)dev,
+                             NULL, true);
     return;
 
 virtio_err:
-- 
MST


