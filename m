Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2A5300A4C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 18:53:08 +0100 (CET)
Received: from localhost ([::1]:54284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l30cN-0007sj-WF
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 12:53:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l30YV-0003Vo-UB
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:49:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l30YR-0004gZ-Ea
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:49:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611337742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5N1EjzAm0Y7IDgRdCgj3PqwoKZeQzrmVWoaxscKEfdI=;
 b=c4yq4Z0GMKgP3gQtRecUEyX76r1pv1myP8+/4IYVkNj+5EIsNonwyA+puoGqXC6b8dccxA
 eyBGWjzDVfk44BHyczX6MWkJWWygMh+gdJ2HInrDRo/IPYe6+olOo/aBnaoZZSzHlDMB3Y
 CNoyCovL+MsmDj3M/U6V4HlTpdx4R5Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-04fJ7T_4NIaQ9Zg9fjtK9A-1; Fri, 22 Jan 2021 12:49:00 -0500
X-MC-Unique: 04fJ7T_4NIaQ9Zg9fjtK9A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B20FF180A099;
 Fri, 22 Jan 2021 17:48:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CEA919C59;
 Fri, 22 Jan 2021 17:48:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 611D9180062E; Fri, 22 Jan 2021 18:48:50 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 8/8] usb-host: map LIBUSB_SPEED_SUPER_PLUS to USB_SPEED_SUPER
Date: Fri, 22 Jan 2021 18:48:49 +0100
Message-Id: <20210122174849.3936119-9-kraxel@redhat.com>
In-Reply-To: <20210122174849.3936119-1-kraxel@redhat.com>
References: <20210122174849.3936119-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Angel Pagan <Angel.Pagan@stratus.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Handle host superspeedplus (usb 3.1+) devices like superspeed (usb 3.0)
devices.  That is enough to get them handled properly by xhci.  They show
up as superspeed devices inside the guest, but should be able to actually
run at higher speeds.

Reported-by: Angel Pagan <Angel.Pagan@stratus.com>
Tested-by: Angel Pagan <Angel.Pagan@stratus.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20210121150832.3564097-1-kraxel@redhat.com>
---
 hw/usb/host-libusb.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index 295d20227ad3..7dde3d12069e 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -179,6 +179,9 @@ static void usb_host_attach_kernel(USBHostDevice *s);
 #if LIBUSB_API_VERSION >= 0x01000103
 # define HAVE_STREAMS 1
 #endif
+#if LIBUSB_API_VERSION >= 0x01000106
+# define HAVE_SUPER_PLUS 1
+#endif
 
 static const char *speed_name[] = {
     [LIBUSB_SPEED_UNKNOWN] = "?",
@@ -186,6 +189,9 @@ static const char *speed_name[] = {
     [LIBUSB_SPEED_FULL]    = "12",
     [LIBUSB_SPEED_HIGH]    = "480",
     [LIBUSB_SPEED_SUPER]   = "5000",
+#ifdef HAVE_SUPER_PLUS
+    [LIBUSB_SPEED_SUPER_PLUS] = "5000+",
+#endif
 };
 
 static const unsigned int speed_map[] = {
@@ -193,6 +199,9 @@ static const unsigned int speed_map[] = {
     [LIBUSB_SPEED_FULL]    = USB_SPEED_FULL,
     [LIBUSB_SPEED_HIGH]    = USB_SPEED_HIGH,
     [LIBUSB_SPEED_SUPER]   = USB_SPEED_SUPER,
+#ifdef HAVE_SUPER_PLUS
+    [LIBUSB_SPEED_SUPER_PLUS] = USB_SPEED_SUPER,
+#endif
 };
 
 static const unsigned int status_map[] = {
@@ -964,8 +973,14 @@ static int usb_host_open(USBHostDevice *s, libusb_device *dev, int hostfd)
             libusb_speed = LIBUSB_SPEED_HIGH;
             break;
         case 5: /* super */
+            libusb_speed = LIBUSB_SPEED_SUPER;
+            break;
         case 6: /* super plus */
+#ifdef HAVE_SUPER_PLUS
+            libusb_speed = LIBUSB_SPEED_SUPER_PLUS;
+#else
             libusb_speed = LIBUSB_SPEED_SUPER;
+#endif
             break;
         }
     }
-- 
2.29.2


