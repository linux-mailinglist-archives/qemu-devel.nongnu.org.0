Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1586D2FEE22
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 16:11:02 +0100 (CET)
Received: from localhost ([::1]:47836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2bbx-0006mA-5C
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 10:11:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2bZv-0005jd-4Q
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 10:08:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2bZm-0006BF-Cq
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 10:08:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611241723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FwaSG1RLxFteTVKwUWZvt8Yow3JgoKP1McWoEkOTTn0=;
 b=Phqq1umFksAr4Qzavt9XVzpYayd5WENJnRWPPAOdxQJmgjieNzQk+CXG+KK4mi+4UrFowm
 kV9vAfg9hFYQPFZdkPhnRccMQmkn4kHJGeo5eAr0s2a/utZ+lkJVnnh2fwMqCIVxhiyz4e
 fuAaMGX4gbdbT5CPjgLLwhuoxvCPNCo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-mnNzRN6oO6OqLjcVSFXDIg-1; Thu, 21 Jan 2021 10:08:39 -0500
X-MC-Unique: mnNzRN6oO6OqLjcVSFXDIg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 693CF15743;
 Thu, 21 Jan 2021 15:08:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B387160BF3;
 Thu, 21 Jan 2021 15:08:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BDFBE180039C; Thu, 21 Jan 2021 16:08:32 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] usb-host: map LIBUSB_SPEED_SUPER_PLUS to USB_SPEED_SUPER
Date: Thu, 21 Jan 2021 16:08:32 +0100
Message-Id: <20210121150832.3564097-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: Angel Pagan <Angel.Pagan@stratus.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Handle host superspeedplus (usb 3.1+) devices like superspeed (usb 3.0)
devices.  That is enough to get them handled properly by xhci.  They show
up as superspeed devices inside the guest, but should be able to actually
run at higher speeds.

Reported-by: Angel Pagan <Angel.Pagan@stratus.com>
Tested-by: Angel Pagan <Angel.Pagan@stratus.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/host-libusb.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index b950501d100f..90ad038a265e 100644
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
@@ -963,8 +972,14 @@ static int usb_host_open(USBHostDevice *s, libusb_device *dev, int hostfd)
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


