Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BFA3D9037
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 16:18:00 +0200 (CEST)
Received: from localhost ([::1]:36664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8kNj-0007Ha-Tw
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 10:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8kKx-0004RA-Ny
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 10:15:08 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8kKv-0007UT-Hz
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 10:15:07 -0400
Received: by mail-wr1-x42b.google.com with SMTP id r2so2783730wrl.1
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 07:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+UN3ZxKmtOqLJCCR6zn7wm0RZkJocDT1JRQPYi7dhl8=;
 b=obzU5glNhTiaSbVEcnBl6EtTkacIa5mqHvtXJfh29Cd4egu9sKo0ilpQ9cO7O6iUn5
 242ig0VeP3jHXQB6hIdckUcR5bG0HZgji/TVmP7cTSGVL3HWW3+TsytOJnU/sbkxDe5S
 CEc6yj/ppnbY7NpQC+s1Mvxh8ECn+dsEkPisr33EbXCpJTwyNAyS776ykmuQl1+otk8O
 a+gRzT3Y8V9HnfaPADP4jypI3k159Ggjt+To9q4eTJ0u2sLGo3zVgg89OJxdEdXw6DpJ
 uL+BlXK/6ytgCLQpU6U2uNIAHNpmOu7sHgH8g8oTCqLcOZke1RmRfsbaiNCCtugA3CN8
 HdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+UN3ZxKmtOqLJCCR6zn7wm0RZkJocDT1JRQPYi7dhl8=;
 b=BnuG4RTNh70/xsO6QhW2hwEmG62t+7UETaHANrgIm8IoJ5CWcU/67/ZHupJfRqnfO9
 XO+C2OkYWy70WHOnvXeULN47IR8RgC1E4RbWwnX2uFQ+Vr7L1qVDnIiGokYYzBBgXjkH
 sSsCuo7AvuDQ8sfO5qpBWz+dJ+wUnA3qL5uee7QxW+QKP6fWmz5n65C/IRB+/+VPTWBi
 28g2FHs8BH9teBUEZ/K2gRfWWcA0wSzK4ngIHM58zoE0n0BEkYK0S/JAH8iBe+YnvQwa
 VcN9KIMnTKmvYBBztuUv7IZGOY5gQKf2FoHbLGNPScO4HCDhSLDsLuUft9J8AWVCBuI4
 o6pQ==
X-Gm-Message-State: AOAM531nz8JUrYH4NJKvNAt/JXZueuP82uLqXuC0J8++7NluhyhIcKz4
 Njv53FqRwmUTT6bzTEI9q1Y54MyrPsRMVg==
X-Google-Smtp-Source: ABdhPJxBo0CrFRoUSW30RLKwqIBZwLxyHD+yjR6GmFWlQuvgKdSPmWJVy7IbJuK+fLYl7M7RkFDp4A==
X-Received: by 2002:adf:ff92:: with SMTP id j18mr13902109wrr.334.1627481703976; 
 Wed, 28 Jul 2021 07:15:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d8sm7598247wrv.20.2021.07.28.07.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 07:15:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] docs: Fold usb2.txt USB controller information into
 usb.rst
Date: Wed, 28 Jul 2021 15:14:55 +0100
Message-Id: <20210728141457.14825-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210728141457.14825-1-peter.maydell@linaro.org>
References: <20210728141457.14825-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fold the information in docs/usb2.txt about the different
kinds of supported USB controller into the main rST manual.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/devices/usb.rst | 86 +++++++++++++++++++++++++++++++++++++
 docs/usb2.txt               | 82 -----------------------------------
 2 files changed, 86 insertions(+), 82 deletions(-)

diff --git a/docs/system/devices/usb.rst b/docs/system/devices/usb.rst
index 7da142ecbb9..9f0e613dcc7 100644
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
diff --git a/docs/usb2.txt b/docs/usb2.txt
index 172614d3a7e..adf4ba3f2a0 100644
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
 
-- 
2.20.1


