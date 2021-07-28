Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBE33D9036
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 16:18:00 +0200 (CEST)
Received: from localhost ([::1]:36610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8kNj-0007FU-SA
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 10:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8kKx-0004RI-Uu
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 10:15:08 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8kKw-0007VP-A3
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 10:15:07 -0400
Received: by mail-wr1-x436.google.com with SMTP id j2so2734109wrx.9
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 07:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kvZcy/pQqom8ti6GfZ9pyXdeZh+6hzPg79+N3EGB/4Q=;
 b=Ml0n3oDqGDRZ847XJ5KzemcXYx1GuxjfrzCbSGI0Hb3bQlIiYGunU35r46yo4gNbH0
 f6kHA2QB8orGYeHoE2F3qN1cyGVzK+KcKawL5UCtGPUPtzt8gBr+LmZY7Ro/BKUx40GI
 yJToJfI4pad0sdQj6RFrL3s/zLgL2941EZr+Pd4pbcLKttl3CBSFpP7RAakAW1Z8A+/6
 ChNM2H9TDtkQ1jQfTMRDStAoOZkqaIWFXVOnQKuq1foRuVkb1NTOLXxVFA4hI7iZGIX9
 tJQf9xjAFPo1pBbyOL647eShqUxc4s4ENkANuMF3+nEQ5+5WwQ0osQka4OjxqmKP6JMI
 0qhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kvZcy/pQqom8ti6GfZ9pyXdeZh+6hzPg79+N3EGB/4Q=;
 b=SPz8dbL8iNOQPFdc7WQMXPNu7e65p07cDGZDLlyKpqeTMTbyKv0RxlMFMV8x3PSpxw
 aB7NLVa+6cG1fjRqW0nOjnY+cQ2iNbZm8PcFnzuEN60ppnszX3ottHTGnzbGecqotc2s
 BM0GIH4zhsqD6Uq2/iLH1D0hCk6Dwv0hncyiudwRpA65rtIyy3VLENhjb/U/8S+YVp3i
 LpAWqWeQK5/hHLeGGHqhsHHcw9W7IxWvZqyaG+EfSEA0tGMDC4e17ylcKeQFSv1AViXP
 YmA5bW+JqIxr7JZc8LXj2ifQqOXZgp7UPKtl9f82tJco2UDSdCBf7VQgN2tw+Bsfxn0L
 AK9Q==
X-Gm-Message-State: AOAM53015gS3U/MLqRFC3WKToyYaR+qbdnS7MfQAxVwogfoVvTtyiFFB
 ueiSpUr8PzscqnCWCEdR5YiapQSjMWJvVQ==
X-Google-Smtp-Source: ABdhPJyxKJpskvhWIq5+EjmVvx7xWVT5LdLW6AYHaUQj4wW0kvXRODfQ5vq/rGvDJH1xON5PFEFjGw==
X-Received: by 2002:a5d:4b4e:: with SMTP id w14mr10819702wrs.341.1627481704894; 
 Wed, 28 Jul 2021 07:15:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d8sm7598247wrv.20.2021.07.28.07.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 07:15:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] docs: Fold usb2.txt physical port addressing info into
 usb.rst
Date: Wed, 28 Jul 2021 15:14:56 +0100
Message-Id: <20210728141457.14825-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210728141457.14825-1-peter.maydell@linaro.org>
References: <20210728141457.14825-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

Fold the usb2.txt documentation about specifying which physical
port a USB device should use into usb.rst.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/devices/usb.rst | 33 +++++++++++++++++++++++++++++++++
 docs/usb2.txt               | 32 --------------------------------
 2 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/docs/system/devices/usb.rst b/docs/system/devices/usb.rst
index 9f0e613dcc7..bab0cd3fdfd 100644
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
 
diff --git a/docs/usb2.txt b/docs/usb2.txt
index adf4ba3f2a0..6a88d5314f9 100644
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
 
-- 
2.20.1


