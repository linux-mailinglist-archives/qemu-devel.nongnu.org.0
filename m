Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EAC3DA381
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 14:57:00 +0200 (CEST)
Received: from localhost ([::1]:60984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m95at-0000cL-SB
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 08:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m95VQ-0004b7-6V
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:51:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m95VN-0001p6-W0
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:51:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627563077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pR356JI7WfZBxcmNd8NhVPrZBjuiWMKSv46FRRJidCU=;
 b=BxgD4EjTgZBZ5f8WFAHmf21ENIvWtQzVsQYv3i5KEcQgue2d5bePSMjWq5S1JXZeecfAXI
 Rar6HsFYwZ/HYA2zJGcUlKsSW0KdqYJ3hfHm1hWHp1R2pYsGr/wnvDxjF61RRiUfz2hZje
 tw+GYFWADNh/uL9/8/eiWhJ5G5ZeZ+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-WSSg6QieP8O33VpAzUtJTw-1; Thu, 29 Jul 2021 08:51:15 -0400
X-MC-Unique: WSSg6QieP8O33VpAzUtJTw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A80401006C83;
 Thu, 29 Jul 2021 12:51:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2603719811;
 Thu, 29 Jul 2021 12:51:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C62881800980; Thu, 29 Jul 2021 14:50:44 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] docs: Fold usb2.txt USB controller information into usb.rst
Date: Thu, 29 Jul 2021 14:50:42 +0200
Message-Id: <20210729125044.3531457-6-kraxel@redhat.com>
In-Reply-To: <20210729125044.3531457-1-kraxel@redhat.com>
References: <20210729125044.3531457-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Fold the information in docs/usb2.txt about the different
kinds of supported USB controller into the main rST manual.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210728141457.14825-3-peter.maydell@linaro.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 docs/usb2.txt               | 82 -----------------------------------
 docs/system/devices/usb.rst | 86 +++++++++++++++++++++++++++++++++++++
 2 files changed, 86 insertions(+), 82 deletions(-)

diff --git a/docs/usb2.txt b/docs/usb2.txt
index 172614d3a7e0..adf4ba3f2a0c 100644
--- a/docs/usb2.txt
+++ b/docs/usb2.txt
@@ -1,86 +1,4 @@
 
-USB Quick Start
-===============
-
-XHCI controller support
------------------------
-
-QEMU has XHCI host adapter support.  The XHCI hardware design is much
-more virtualization-friendly when compared to EHCI and UHCI, thus XHCI
-emulation uses less resources (especially cpu).  So if your guest
-supports XHCI (which should be the case for any operating system
-released around 2010 or later) we recommend using it:
-
-    qemu -device qemu-xhci
-
-XHCI supports USB 1.1, USB 2.0 and USB 3.0 devices, so this is the
-only controller you need.  With only a single USB controller (and
-therefore only a single USB bus) present in the system there is no
-need to use the bus= parameter when adding USB devices.
-
-
-EHCI controller support
------------------------
-
-The QEMU EHCI Adapter supports USB 2.0 devices.  It can be used either
-standalone or with companion controllers (UHCI, OHCI) for USB 1.1
-devices.  The companion controller setup is more convenient to use
-because it provides a single USB bus supporting both USB 2.0 and USB
-1.1 devices.  See next section for details.
-
-When running EHCI in standalone mode you can add UHCI or OHCI
-controllers for USB 1.1 devices too.  Each controller creates its own
-bus though, so there are two completely separate USB buses: One USB
-1.1 bus driven by the UHCI controller and one USB 2.0 bus driven by
-the EHCI controller.  Devices must be attached to the correct
-controller manually.
-
-The easiest way to add a UHCI controller to a 'pc' machine is the
-'-usb' switch.  QEMU will create the UHCI controller as function of
-the PIIX3 chipset.  The USB 1.1 bus will carry the name "usb-bus.0".
-
-You can use the standard -device switch to add a EHCI controller to
-your virtual machine.  It is strongly recommended to specify an ID for
-the controller so the USB 2.0 bus gets an individual name, for example
-'-device usb-ehci,id=ehci".  This will give you a USB 2.0 bus named
-"ehci.0".
-
-When adding USB devices using the -device switch you can specify the
-bus they should be attached to.  Here is a complete example:
-
-    qemu -M pc ${otheroptions}                           \
-        -drive if=none,id=usbstick,file=/path/to/image   \
-        -usb                                             \
-        -device usb-ehci,id=ehci                         \
-        -device usb-tablet,bus=usb-bus.0                 \
-        -device usb-storage,bus=ehci.0,drive=usbstick
-
-This attaches a USB tablet to the UHCI adapter and a USB mass storage
-device to the EHCI adapter.
-
-
-Companion controller support
-----------------------------
-
-The UHCI and OHCI controllers can attach to a USB bus created by EHCI
-as companion controllers.  This is done by specifying the masterbus
-and firstport properties.  masterbus specifies the bus name the
-controller should attach to.  firstport specifies the first port the
-controller should attach to, which is needed as usually one EHCI
-controller with six ports has three UHCI companion controllers with
-two ports each.
-
-There is a config file in docs which will do all this for
-you, just try ...
-
-    qemu -readconfig docs/config/ich9-ehci-uhci.cfg
-
-... then use "bus=ehci.0" to assign your USB devices to that bus.
-
-Using the '-usb' switch for 'q35' machines will create a similar
-USB controller configuration.
-
-
 More USB tips & tricks
 ======================
 
diff --git a/docs/system/devices/usb.rst b/docs/system/devices/usb.rst
index 7da142ecbb9f..9f0e613dcc7c 100644
--- a/docs/system/devices/usb.rst
+++ b/docs/system/devices/usb.rst
@@ -8,6 +8,92 @@ plug virtual USB devices or real host USB devices (only works with
 certain host operating systems). QEMU will automatically create and
 connect virtual USB hubs as necessary to connect multiple USB devices.
 
+USB controllers
+~~~~~~~~~~~~~~~
+
+XHCI controller support
+^^^^^^^^^^^^^^^^^^^^^^^
+
+QEMU has XHCI host adapter support.  The XHCI hardware design is much
+more virtualization-friendly when compared to EHCI and UHCI, thus XHCI
+emulation uses less resources (especially CPU).  So if your guest
+supports XHCI (which should be the case for any operating system
+released around 2010 or later) we recommend using it:
+
+    qemu -device qemu-xhci
+
+XHCI supports USB 1.1, USB 2.0 and USB 3.0 devices, so this is the
+only controller you need.  With only a single USB controller (and
+therefore only a single USB bus) present in the system there is no
+need to use the bus= parameter when adding USB devices.
+
+
+EHCI controller support
+^^^^^^^^^^^^^^^^^^^^^^^
+
+The QEMU EHCI Adapter supports USB 2.0 devices.  It can be used either
+standalone or with companion controllers (UHCI, OHCI) for USB 1.1
+devices.  The companion controller setup is more convenient to use
+because it provides a single USB bus supporting both USB 2.0 and USB
+1.1 devices.  See next section for details.
+
+When running EHCI in standalone mode you can add UHCI or OHCI
+controllers for USB 1.1 devices too.  Each controller creates its own
+bus though, so there are two completely separate USB buses: One USB
+1.1 bus driven by the UHCI controller and one USB 2.0 bus driven by
+the EHCI controller.  Devices must be attached to the correct
+controller manually.
+
+The easiest way to add a UHCI controller to a ``pc`` machine is the
+``-usb`` switch.  QEMU will create the UHCI controller as function of
+the PIIX3 chipset.  The USB 1.1 bus will carry the name ``usb-bus.0``.
+
+You can use the standard ``-device`` switch to add a EHCI controller to
+your virtual machine.  It is strongly recommended to specify an ID for
+the controller so the USB 2.0 bus gets an individual name, for example
+``-device usb-ehci,id=ehci``.  This will give you a USB 2.0 bus named
+``ehci.0``.
+
+When adding USB devices using the ``-device`` switch you can specify the
+bus they should be attached to.  Here is a complete example:
+
+.. parsed-literal::
+
+    |qemu_system| -M pc ${otheroptions}                        \\
+        -drive if=none,id=usbstick,format=raw,file=/path/to/image   \\
+        -usb                                                        \\
+        -device usb-ehci,id=ehci                                    \\
+        -device usb-tablet,bus=usb-bus.0                            \\
+        -device usb-storage,bus=ehci.0,drive=usbstick
+
+This attaches a USB tablet to the UHCI adapter and a USB mass storage
+device to the EHCI adapter.
+
+
+Companion controller support
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The UHCI and OHCI controllers can attach to a USB bus created by EHCI
+as companion controllers.  This is done by specifying the ``masterbus``
+and ``firstport`` properties.  ``masterbus`` specifies the bus name the
+controller should attach to.  ``firstport`` specifies the first port the
+controller should attach to, which is needed as usually one EHCI
+controller with six ports has three UHCI companion controllers with
+two ports each.
+
+There is a config file in docs which will do all this for
+you, which you can use like this:
+
+.. parsed-literal::
+
+   |qemu_system| -readconfig docs/config/ich9-ehci-uhci.cfg
+
+Then use ``bus=ehci.0`` to assign your USB devices to that bus.
+
+Using the ``-usb`` switch for ``q35`` machines will create a similar
+USB controller configuration.
+
+
 .. _Connecting USB devices:
 
 Connecting USB devices
-- 
2.31.1


