Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD7B3DA36B
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 14:54:28 +0200 (CEST)
Received: from localhost ([::1]:49978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m95YR-0001We-QG
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 08:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m95VZ-00053g-4z
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:51:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m95VX-0001v2-B9
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:51:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627563086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P2G7uEUlC1wBa+DO0orPvkKIN2JlSfV8MvgpAs3qKe0=;
 b=SKd9kiR3nxMgJbCvtccUVaHs1WQLAoArzixN3dCJqfKL+16/sDlo3LybOMqW9eQDronIBF
 IQx8BjgQ4/PLE6AL4FJ7eatXFpslKNCu71IYge/n4Ojdk4NpBh3B7jr8mxsmEPFbarxzLc
 7D9nH3FH2IUcRBnogwtsFzXVpdGpijE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-JLKiq9QLOJyyupNXBnroFw-1; Thu, 29 Jul 2021 08:51:23 -0400
X-MC-Unique: JLKiq9QLOJyyupNXBnroFw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6398E107ACF5;
 Thu, 29 Jul 2021 12:51:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B56D5C1D1;
 Thu, 29 Jul 2021 12:51:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D2B661800981; Thu, 29 Jul 2021 14:50:44 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] docs: Fold usb2.txt physical port addressing info into
 usb.rst
Date: Thu, 29 Jul 2021 14:50:43 +0200
Message-Id: <20210729125044.3531457-7-kraxel@redhat.com>
In-Reply-To: <20210729125044.3531457-1-kraxel@redhat.com>
References: <20210729125044.3531457-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

Fold the usb2.txt documentation about specifying which physical
port a USB device should use into usb.rst.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210728141457.14825-4-peter.maydell@linaro.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 docs/usb2.txt               | 32 --------------------------------
 docs/system/devices/usb.rst | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/docs/usb2.txt b/docs/usb2.txt
index adf4ba3f2a0c..6a88d5314f9c 100644
--- a/docs/usb2.txt
+++ b/docs/usb2.txt
@@ -6,38 +6,6 @@ Recently the USB pass through driver (also known as usb-host) and the
 QEMU USB subsystem gained a few capabilities which are available only
 via qdev properties, i,e. when using '-device'.
 
-
-physical port addressing
-------------------------
-
-First you can (for all USB devices) specify the physical port where
-the device will show up in the guest.  This can be done using the
-"port" property.  UHCI has two root ports (1,2).  EHCI has six root
-ports (1-6), the emulated (1.1) USB hub has eight ports.
-
-Plugging a tablet into UHCI port 1 works like this:
-
-        -device usb-tablet,bus=usb-bus.0,port=1
-
-Plugging a hub into UHCI port 2 works like this:
-
-        -device usb-hub,bus=usb-bus.0,port=2
-
-Plugging a virtual USB stick into port 4 of the hub just plugged works
-this way:
-
-        -device usb-storage,bus=usb-bus.0,port=2.4,drive=...
-
-You can do basically the same in the monitor using the device_add
-command.  If you want to unplug devices too you should specify some
-unique id which you can use to refer to the device ...
-
-        (qemu) device_add usb-tablet,bus=usb-bus.0,port=1,id=my-tablet
-        (qemu) device_del my-tablet
-
-... when unplugging it with device_del.
-
-
 USB pass through hints
 ----------------------
 
diff --git a/docs/system/devices/usb.rst b/docs/system/devices/usb.rst
index 9f0e613dcc7c..bab0cd3fdfd1 100644
--- a/docs/system/devices/usb.rst
+++ b/docs/system/devices/usb.rst
@@ -199,6 +199,39 @@ option or the ``device_add`` monitor command. Available devices are:
 ``u2f-{emulated,passthru}``
    Universal Second Factor device
 
+Physical port addressing
+^^^^^^^^^^^^^^^^^^^^^^^^
+
+For all the above USB devices, by default QEMU will plug the device
+into the next available port on the specified USB bus, or onto
+some available USB bus if you didn't specify one explicitly.
+If you need to, you can also specify the physical port where
+the device will show up in the guest.  This can be done using the
+``port`` property.  UHCI has two root ports (1,2).  EHCI has six root
+ports (1-6), and the emulated (1.1) USB hub has eight ports.
+
+Plugging a tablet into UHCI port 1 works like this::
+
+        -device usb-tablet,bus=usb-bus.0,port=1
+
+Plugging a hub into UHCI port 2 works like this::
+
+        -device usb-hub,bus=usb-bus.0,port=2
+
+Plugging a virtual USB stick into port 4 of the hub just plugged works
+this way::
+
+        -device usb-storage,bus=usb-bus.0,port=2.4,drive=...
+
+In the monitor, the ``device_add` command also accepts a ``port``
+property specification. If you want to unplug devices too you should
+specify some unique id which you can use to refer to the device.
+You can then use ``device_del`` to unplug the device later.
+For example::
+
+        (qemu) device_add usb-tablet,bus=usb-bus.0,port=1,id=my-tablet
+        (qemu) device_del my-tablet
+
 Hotplugging USB storage
 ~~~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.31.1


