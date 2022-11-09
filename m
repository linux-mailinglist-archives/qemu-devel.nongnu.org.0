Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A003622B03
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 12:58:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osjhg-0004b2-2x; Wed, 09 Nov 2022 06:57:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minglei.liu@smartx.com>)
 id 1osjhT-0004ao-OF
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 06:56:59 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minglei.liu@smartx.com>)
 id 1osjhR-0003VE-6a
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 06:56:59 -0500
Received: by mail-pj1-x102e.google.com with SMTP id k5so16489643pjo.5
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 03:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TgvSPWprhys13hLuWPkSdImKHatyOYCQqB1pzQ26IgQ=;
 b=Sh5UFS/bNobtv04ZB50uRQrHOIETPd7+l8z/+TOIE1Cf7u7TBNmX1xBbLL20mvQcOj
 PDpXeEpnxHFRV4d5Hr6iwaxxHZgDMI2Sih4QzjjzajEgCGhlinmVAZJty77JckiyfOHD
 tPv9Sg3YwkFvF8SJIb2zRsXf+grHW1HKPB7oIekEJF0UZAb3iHZpj33/zDt976t2wUGj
 6c5lUBrRmBmyXbPX6MDn8G2nvGOjf4JMDarlEtL31ELWBl1osNqAbCKYc6bhfNufEcRZ
 ZZNM8kZaOc+BPhCqlaeRZY6zewpg5jCQMtFalUID/P+TgkS5hykIqbOjigDiKCgYKLBc
 oFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TgvSPWprhys13hLuWPkSdImKHatyOYCQqB1pzQ26IgQ=;
 b=UECfSglxTxDfhxADjJTgN6JEvxa8TzCvzXcFDaL9iqnt+6aa+ZMfWQtrG8duSgoleE
 4K6NghF9iUOSNWOU8TOYu4445jg/3V/HOP+RSYJXWRq7q3+PNHPgGVkUnpEEcVC62D6I
 UARkT9wmE6oXN5hR5dLNizKV1YwiNNMaUVy7b7poezKCG/YBuhY4FencMA7pRlDKWaSQ
 mD3dCRba1dD+t1e93eNssmwzVtGk5ZSuIoHUmGpscfk+IFbyFKYlxoCu/A33oh3q5rcK
 6e6caUlqsBhAmvQqLBaxh3phAb2s9APXjX42oQrXcdc4T/cJoooBk/k11aK8lpZl5EA3
 aoEw==
X-Gm-Message-State: ACrzQf0mRXJKZSIPWiLnYQstxlPeFt2rF/2e3Hjy0FJ6V9lvYaK0z6kv
 dU0J+Ex5qqpp+UgvCwFcGFj3maz5XPOWnA==
X-Google-Smtp-Source: AMsMyM7ey5KV2+SKPXfmuw8mnx15pVJCqVoj01O/CAuWcVdHulneVQF3ByaJeZtsKuWZbV3dSPNG9g==
X-Received: by 2002:a17:902:d512:b0:181:f1f4:fcb4 with SMTP id
 b18-20020a170902d51200b00181f1f4fcb4mr61188738plg.102.1667995014616; 
 Wed, 09 Nov 2022 03:56:54 -0800 (PST)
Received: from hugh.. ([125.69.0.79]) by smtp.gmail.com with ESMTPSA id
 u12-20020a170902714c00b001888a46e2d0sm3629353plm.162.2022.11.09.03.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 03:56:54 -0800 (PST)
From: "minglei.liu" <minglei.liu@smartx.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com,
	"minglei.liu" <minglei.liu@smartx.com>
Subject: [PATCH] usbredir: Do not detach usb if backend chardev disconnect
Date: Wed,  9 Nov 2022 19:56:19 +0800
Message-Id: <20221109115619.696826-1-minglei.liu@smartx.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=minglei.liu@smartx.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

If the network between qemu and usbredirserver is temporarily disconnected,
the USB device in the VM will be unplugged. If the reconnect parameter is
configured for the backend chardev, the device will be reconnected later.
But from the inside of the VM, this USB device has experienced unplug and
re-plug, if the USB storage device has been mounted in the VM before,
the drive letter will change after the device is re-plugged.

So in this case, we no longer unplug the device, and operations to the USB
is returned immediately at this point.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1305
Signed-off-by: minglei.liu <minglei.liu@smartx.com>
---
 hw/usb/redirect.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 1bd30efc3e..73731bcab5 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -379,6 +379,11 @@ static void usbredir_cancel_packet(USBDevice *udev, USBPacket *p)
     USBRedirDevice *dev = USB_REDIRECT(udev);
     int i = USBEP2I(p->ep);
 
+    if(!dev->parser) {
+        ERROR("usbredir parser is not available, need reconnect.\n");
+        return;
+    }
+
     if (p->combined) {
         usb_combined_packet_cancel(udev, p);
         return;
@@ -519,6 +524,11 @@ static void usbredir_handle_reset(USBDevice *udev)
 {
     USBRedirDevice *dev = USB_REDIRECT(udev);
 
+    if(!dev->parser) {
+        ERROR("usbredir parser is not available, need reconnect.\n");
+        return;
+    }
+
     DPRINTF("reset device\n");
     usbredirparser_send_reset(dev->parser);
     usbredirparser_do_write(dev->parser);
@@ -959,6 +969,11 @@ static void usbredir_handle_data(USBDevice *udev, USBPacket *p)
     USBRedirDevice *dev = USB_REDIRECT(udev);
     uint8_t ep;
 
+    if(!dev->parser) {
+        ERROR("usbredir parser is not available, need reconnect.\n");
+        return;
+    }
+
     ep = p->ep->nr;
     if (p->pid == USB_TOKEN_IN) {
         ep |= USB_DIR_IN;
@@ -1027,6 +1042,11 @@ static void usbredir_ep_stopped(USBDevice *udev, USBEndpoint *uep)
 {
     USBRedirDevice *dev = USB_REDIRECT(udev);
 
+    if(!dev->parser) {
+        ERROR("usbredir parser is not available, need reconnect.\n");
+        return;
+    }
+
     usbredir_stop_ep(dev, USBEP2I(uep));
     usbredirparser_do_write(dev->parser);
 }
@@ -1098,6 +1118,11 @@ static void usbredir_handle_control(USBDevice *udev, USBPacket *p,
     USBRedirDevice *dev = USB_REDIRECT(udev);
     struct usb_redir_control_packet_header control_packet;
 
+    if(!dev->parser) {
+        ERROR("usbredir parser is not available, need reconnect.\n");
+        return;
+    }
+
     if (usbredir_already_in_flight(dev, p->id)) {
         p->status = USB_RET_ASYNC;
         return;
@@ -1155,6 +1180,11 @@ static int usbredir_alloc_streams(USBDevice *udev, USBEndpoint **eps,
     struct usb_redir_alloc_bulk_streams_header alloc_streams;
     int i;
 
+    if(!dev->parser) {
+        ERROR("usbredir parser is not available, need reconnect.\n");
+        return -1;
+    }
+
     if (!usbredirparser_peer_has_cap(dev->parser,
                                      usb_redir_cap_bulk_streams)) {
         ERROR("peer does not support streams\n");
@@ -1193,6 +1223,11 @@ static void usbredir_free_streams(USBDevice *udev, USBEndpoint **eps,
     struct usb_redir_free_bulk_streams_header free_streams;
     int i;
 
+    if(!dev->parser) {
+        ERROR("usbredir parser is not available, need reconnect.\n");
+        return;
+    }
+
     if (!usbredirparser_peer_has_cap(dev->parser,
                                      usb_redir_cap_bulk_streams)) {
         return;
@@ -1219,8 +1254,6 @@ static void usbredir_chardev_close_bh(void *opaque)
     USBRedirDevice *dev = opaque;
 
     qemu_bh_cancel(dev->device_reject_bh);
-    usbredir_device_disconnect(dev);
-
     if (dev->parser) {
         DPRINTF("destroying usbredirparser\n");
         usbredirparser_destroy(dev->parser);
-- 
2.27.0


