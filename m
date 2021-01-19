Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142362FBDE5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 18:44:36 +0100 (CET)
Received: from localhost ([::1]:58930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1v3S-0002iO-V5
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 12:44:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l1uQA-0001tP-6L
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:03:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l1uQ4-0003VZ-W8
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:03:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611075831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ibq0FzYx9vREls5Lo0tsG7AXoM8tgQ54rB9pTPjQDNg=;
 b=OYyx2zMvy0/53OUmebUJoBveW1ib0bE7FhUpq1CZ82Hxoz1467Qy9CeIOf2A+6dkRROGYm
 RrIasFelbmsd9uQO5LGWFjqTlqG6QojU116eXIcMUDl9M+x13J2K4nvi/XIfyWdNqFo43/
 kSBYXTV0dsHtw/RUjjsb5N+2btjtzQk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-o_OIv1-SPXaJayf8ShjjUg-1; Tue, 19 Jan 2021 12:03:49 -0500
X-MC-Unique: o_OIv1-SPXaJayf8ShjjUg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30DFC1DDE0;
 Tue, 19 Jan 2021 17:03:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3168260C74;
 Tue, 19 Jan 2021 17:03:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4DE8418003A1; Tue, 19 Jan 2021 18:03:42 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] usb-host: map LIBUSB_SPEED_SUPER_PLUS to USB_SPEED_SUPER
Date: Tue, 19 Jan 2021 18:03:42 +0100
Message-Id: <20210119170342.2120680-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
 hw/usb/host-libusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index b950501d100f..cb12e513c450 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -186,6 +186,7 @@ static const char *speed_name[] = {
     [LIBUSB_SPEED_FULL]    = "12",
     [LIBUSB_SPEED_HIGH]    = "480",
     [LIBUSB_SPEED_SUPER]   = "5000",
+    [LIBUSB_SPEED_SUPER_PLUS] = "5000+",
 };
 
 static const unsigned int speed_map[] = {
@@ -193,6 +194,7 @@ static const unsigned int speed_map[] = {
     [LIBUSB_SPEED_FULL]    = USB_SPEED_FULL,
     [LIBUSB_SPEED_HIGH]    = USB_SPEED_HIGH,
     [LIBUSB_SPEED_SUPER]   = USB_SPEED_SUPER,
+    [LIBUSB_SPEED_SUPER_PLUS] = USB_SPEED_SUPER,
 };
 
 static const unsigned int status_map[] = {
-- 
2.29.2


