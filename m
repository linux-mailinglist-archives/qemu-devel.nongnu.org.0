Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CC83D9042
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 16:19:52 +0200 (CEST)
Received: from localhost ([::1]:44024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8kPX-0003r9-AG
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 10:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8kKy-0004SO-Sj
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 10:15:08 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8kKw-0007Vo-W4
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 10:15:08 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 o5-20020a1c4d050000b02901fc3a62af78so4444844wmh.3
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 07:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cOFMT94+QgDAwNgiL7YNxb6ny/F84wGTRdXmMFu22r0=;
 b=rioTRi6FWz66vnekPUs/Y5VWlW+4SrwNXub7t0cDB5OLFrpWsXD7ms8J2dflN5CHz2
 Au0Rgl8x5PVtOIzpoQS7wSQxRzxb1jDascqcyhclXbpmEOvLmHeRboJOHY3FJdnYUTG0
 3+YKvTkVlbrP4yotWJZiBGGg82YOZxWSTP1FPDbq3m+6yom4SdBOr9LPkxpRj9aaiukr
 XQY0OWLikzOe5KwaLzCaJpHV1kyu0qQKigec5YFLzQouhjjpZAIBScnejc4mUXT1Uncr
 l2ssBv7tCO5VMVefUGCjldF5QDjVgxXhIFzonSm1oZJra6dDn76nJ0g2HOKXlMAIrGhb
 zSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cOFMT94+QgDAwNgiL7YNxb6ny/F84wGTRdXmMFu22r0=;
 b=eQzmV7Fxda4pYt5Gue7zhI7JNs07Arg3ooMokabvpwSG+tbAuO/i1bODMbJiJHTIGv
 0IHB5NtDW4O3raTjSf/UFDIDNUOz8ExloLmw0BKjX+3k+55KI9ypIOn4Fgby3mRKEGzf
 Uck5BBD5nrT8jsEtAkMHRDmCCG0dd2nfOf0BxVmsevklY+8G/3AOeTYcg0aFnDPZHN1Y
 Kk5ECA9yz+q//vG1dvp9rbMNBejXzFhCfIsXutk5gxM2rED1puUUDwkuhsOhbLsgaIJ8
 2FZz+ujrsp2K+Y6vI/+098fJJAmQFchfeFI26Dh3kDFKnDf1mf/ivugrD0c9o5Dz3Gnh
 sYVQ==
X-Gm-Message-State: AOAM533prxYhY+cUGmPqJPEWn6PHZ2dP9pramO2CCIrE67QdAJp55Ta3
 Ewe/dmHylxiLA7mjl8SMB9OLo85NFdJZ0g==
X-Google-Smtp-Source: ABdhPJzl2LDM63VWIh89yJYvbOpv62bo9eHqNczHhbI29iovKLmUkedPXLmeNArZ2IkecuFne1B/PA==
X-Received: by 2002:a1c:c918:: with SMTP id f24mr13339109wmb.88.1627481705622; 
 Wed, 28 Jul 2021 07:15:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d8sm7598247wrv.20.2021.07.28.07.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 07:15:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] docs: Fold usb2.txt passthrough information into usb.rst
Date: Wed, 28 Jul 2021 15:14:57 +0100
Message-Id: <20210728141457.14825-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210728141457.14825-1-peter.maydell@linaro.org>
References: <20210728141457.14825-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

Fold the usb2.txt information on device passthrough into usb.rst;
since this is the last part of the .txt file we can delete it now.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/devices/usb.rst | 49 +++++++++++++++++++++++++++++++
 docs/usb2.txt               | 58 -------------------------------------
 MAINTAINERS                 |  1 -
 3 files changed, 49 insertions(+), 59 deletions(-)
 delete mode 100644 docs/usb2.txt

diff --git a/docs/system/devices/usb.rst b/docs/system/devices/usb.rst
index bab0cd3fdfd..afb7d6c2268 100644
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
diff --git a/docs/usb2.txt b/docs/usb2.txt
deleted file mode 100644
index 6a88d5314f9..00000000000
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
index bb82bebf59e..9359a3db619 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1841,7 +1841,6 @@ F: hw/usb/*
 F: stubs/usb-dev-stub.c
 F: tests/qtest/usb-*-test.c
 F: docs/system/devices/usb.rst
-F: docs/usb-storage.txt
 F: include/hw/usb.h
 F: include/hw/usb/
 
-- 
2.20.1


