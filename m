Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F783DA3A8
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 15:03:43 +0200 (CEST)
Received: from localhost ([::1]:44386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m95hO-0000Ud-FC
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 09:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m95Vb-00059G-6T
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:51:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m95VZ-0001xZ-D3
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:51:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627563088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wMludD6UGs3ht2eHfU0N4k6LyN19995Gi/P5zkCnfoA=;
 b=S4X6nJjkcgEQ2i4RPvZi/R4CjYLg2idM8wZfAS1/Sm+7L9hCUcOtLVrdIO5A5KnoqKvBeV
 fkQxQYqi54PBSSoszfRRoMhzBk3jiTCah4QQF0ss/lEYk+ejyp545WQ9a+WysLoNGbzrmJ
 69EPKG7qswKd171rgO+SI1IbONUw3R0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-X5f9QunaOBmyvRxl_m1r-w-1; Thu, 29 Jul 2021 08:51:27 -0400
X-MC-Unique: X5f9QunaOBmyvRxl_m1r-w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53AE492505;
 Thu, 29 Jul 2021 12:51:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00CA126E5E;
 Thu, 29 Jul 2021 12:51:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E1DAF1800982; Thu, 29 Jul 2021 14:50:44 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] docs: Fold usb2.txt passthrough information into usb.rst
Date: Thu, 29 Jul 2021 14:50:44 +0200
Message-Id: <20210729125044.3531457-8-kraxel@redhat.com>
In-Reply-To: <20210729125044.3531457-1-kraxel@redhat.com>
References: <20210729125044.3531457-1-kraxel@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Fold the usb2.txt information on device passthrough into usb.rst;
since this is the last part of the .txt file we can delete it now.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210728141457.14825-5-peter.maydell@linaro.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 docs/usb2.txt               | 58 -------------------------------------
 MAINTAINERS                 |  1 -
 docs/system/devices/usb.rst | 49 +++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 59 deletions(-)
 delete mode 100644 docs/usb2.txt

diff --git a/docs/usb2.txt b/docs/usb2.txt
deleted file mode 100644
index 6a88d5314f9c..000000000000
--- a/docs/usb2.txt
+++ /dev/null
@@ -1,58 +0,0 @@
-
-More USB tips & tricks
-======================
-
-Recently the USB pass through driver (also known as usb-host) and the
-QEMU USB subsystem gained a few capabilities which are available only
-via qdev properties, i,e. when using '-device'.
-
-USB pass through hints
-----------------------
-
-The usb-host driver has a bunch of properties to specify the device
-which should be passed to the guest:
-
-  hostbus=<nr> -- Specifies the bus number the device must be attached
-  to.
-
-  hostaddr=<nr> -- Specifies the device address the device got
-  assigned by the guest os.
-
-  hostport=<str> -- Specifies the physical port the device is attached
-  to.
-
-  vendorid=<hexnr> -- Specifies the vendor ID of the device.
-  productid=<hexnr> -- Specifies the product ID of the device.
-
-In theory you can combine all these properties as you like.  In
-practice only a few combinations are useful:
-
-  (1) vendorid+productid -- match for a specific device, pass it to
-      the guest when it shows up somewhere in the host.
-
-  (2) hostbus+hostport -- match for a specific physical port in the
-      host, any device which is plugged in there gets passed to the
-      guest.
-
-  (3) hostbus+hostaddr -- most useful for ad-hoc pass through as the
-      hostaddr isn't stable, the next time you plug in the device it
-      gets a new one ...
-
-Note that USB 1.1 devices are handled by UHCI/OHCI and USB 2.0 by
-EHCI.  That means a device plugged into the very same physical port
-may show up on different buses depending on the speed.  The port I'm
-using for testing is bus 1 + port 1 for 2.0 devices and bus 3 + port 1
-for 1.1 devices.  Passing through any device plugged into that port
-and also assign them to the correct bus can be done this way:
-
-    qemu -M pc ${otheroptions}                               \
-        -usb                                                 \
-        -device usb-ehci,id=ehci                             \
-        -device usb-host,bus=usb-bus.0,hostbus=3,hostport=1  \
-        -device usb-host,bus=ehci.0,hostbus=1,hostport=1
-
-enjoy,
-  Gerd
-
---
-Gerd Hoffmann <kraxel@redhat.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index b1f8e82befc6..2089e71007d6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1837,7 +1837,6 @@ F: hw/usb/*
 F: stubs/usb-dev-stub.c
 F: tests/qtest/usb-*-test.c
 F: docs/system/devices/usb.rst
-F: docs/usb-storage.txt
 F: include/hw/usb.h
 F: include/hw/usb/
 
diff --git a/docs/system/devices/usb.rst b/docs/system/devices/usb.rst
index bab0cd3fdfd1..afb7d6c2268d 100644
--- a/docs/system/devices/usb.rst
+++ b/docs/system/devices/usb.rst
@@ -300,3 +300,52 @@ are not supported yet.
 
 When relaunching QEMU, you may have to unplug and plug again the USB
 device to make it work again (this is a bug).
+
+``usb-host`` properties for specifying the host device
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The example above uses the ``vendorid`` and ``productid`` to
+specify which host device to pass through, but this is not
+the only way to specify the host device. ``usb-host`` supports
+the following properties:
+
+``hostbus=<nr>``
+  Specifies the bus number the device must be attached to
+``hostaddr=<nr>``
+  Specifies the device address the device got assigned by the guest os
+``hostport=<str>``
+  Specifies the physical port the device is attached to
+``vendorid=<hexnr>``
+  Specifies the vendor ID of the device
+``productid=<hexnr>``
+  Specifies the product ID of the device.
+
+In theory you can combine all these properties as you like.  In
+practice only a few combinations are useful:
+
+- ``vendorid`` and ``productid`` -- match for a specific device, pass it to
+  the guest when it shows up somewhere in the host.
+
+- ``hostbus`` and ``hostport`` -- match for a specific physical port in the
+  host, any device which is plugged in there gets passed to the
+  guest.
+
+- ``hostbus`` and ``hostaddr`` -- most useful for ad-hoc pass through as the
+  hostaddr isn't stable. The next time you plug the device into the host it
+  will get a new hostaddr.
+
+Note that on the host USB 1.1 devices are handled by UHCI/OHCI and USB
+2.0 by EHCI.  That means different USB devices plugged into the very
+same physical port on the host may show up on different host buses
+depending on the speed. Supposing that devices plugged into a given
+physical port appear as bus 1 + port 1 for 2.0 devices and bus 3 + port 1
+for 1.1 devices, you can pass through any device plugged into that port
+and also assign it to the correct USB bus in QEMU like this:
+
+.. parsed-literal::
+
+   |qemu_system| -M pc [...]                            \\
+        -usb                                                 \\
+        -device usb-ehci,id=ehci                             \\
+        -device usb-host,bus=usb-bus.0,hostbus=3,hostport=1  \\
+        -device usb-host,bus=ehci.0,hostbus=1,hostport=1
-- 
2.31.1


