Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE11230A693
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 12:31:49 +0100 (CET)
Received: from localhost ([::1]:56920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6XQq-00080D-Tc
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 06:31:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6XOU-0006L4-4Q
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:29:22 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6XOS-0008I3-Kh
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:29:21 -0500
Received: by mail-wr1-x42c.google.com with SMTP id p15so16125023wrq.8
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 03:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aPiraoQq+wBjdcIQOiUTo/rKER9nPb2vFzjApKq2T+g=;
 b=ko4bHURsbdywzQeAqTKNRMtP+zzJ6yTACMFwMAle7bWMNtkvJufYJrtPUI/M5VW3/O
 frmacZk8z5EwOYVKlR1W7pU0lJDo4Xtr7KDcSHqPIQGwsREIlJ5kPDQQ61Cr1BYMoUWE
 CF0rc60JUGkcPOKbMV0O0+zHtMU1Tui4QSz+lBYsHlKckNcTiNoyfbBX8hLgAYBcFvOE
 uNIFEwGblR6Um04jIkD8OHxk0Gs5LrqqQzd0x+eiVKhrXYbg0AxzeRgUoumA1uDQTC4m
 FxrgOOgPU5iJBrHon1c+gWeae2DbmRnTY7+cbkCrU59wU2snpSOPEcSb8jlKgXrUPOGp
 zwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aPiraoQq+wBjdcIQOiUTo/rKER9nPb2vFzjApKq2T+g=;
 b=KB1oRkWvJVkaP+RKdBV2CPFPe6ysbkDhnxtRIrFWGTlhtkE14XvGi57eiAkljk+SZo
 T8ffv58w3LY6VLED11nSo9qr3g49NqsPnxBXm5xHZ6m9aNdbDueZugQIqA7U8WQeyxZ+
 K7W50ImK/+G1WuiO45Ra8nVQIF1sfXoVytU4lY4LHoZ6z9n7rPtpHG/4xNBlcUZbYjEA
 uQmFvBrE1akTAe/jW2PVzHVOicAurAlG9s/wIsmSoT+Z2US5t/G4EDk4cvbL7kXxvjx9
 nz4cA27NwRLLZo0kdqxxvZdpkJe49qt6xXhKR1c41VRePiuNsHEZCScH/9fg2OdEhy/L
 2n2g==
X-Gm-Message-State: AOAM531lC5ssM0UcXKmiVJTURvd2haRMXZLmuUD23W6G4/OeOREcVfQd
 h4VEeMShoINVPkkn7wgWe44=
X-Google-Smtp-Source: ABdhPJwPt7ERal1fQeDzwH3w64qDIOwi7IRP9XTWdLtX/WYy5c6IDx5O5BK4Mw3ZLOmXAK4MQef0Tw==
X-Received: by 2002:a5d:4e0e:: with SMTP id p14mr17735664wrt.58.1612178959403; 
 Mon, 01 Feb 2021 03:29:19 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id y6sm26305538wrp.6.2021.02.01.03.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:29:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: [PATCH v3 2/7] hw/xen: Relax dependency on FSDEV_9P
Date: Mon,  1 Feb 2021 12:29:00 +0100
Message-Id: <20210201112905.545144-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210201112905.545144-1-f4bug@amsat.org>
References: <20210201112905.545144-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Relax the dependency on 9pfs by using the 'imply' Kconfig rule.
This fixes when XEN_PV without XEN_FV:

  /usr/bin/ld: libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in function
  `xen_be_register_common':
  hw/xen/xen-legacy-backend.c:754: undefined reference to `xen_9pfs_ops'

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/xen/xen-legacy-backend.c | 3 ++-
 accel/Kconfig               | 2 +-
 hw/xen/meson.build          | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index b61a4855b7b..338d443a5c0 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -33,6 +33,7 @@
 #include "hw/xen/xen-legacy-backend.h"
 #include "hw/xen/xen_pvdev.h"
 #include "monitor/qdev.h"
+#include CONFIG_DEVICES
 
 DeviceState *xen_sysdev;
 BusState *xen_sysbus;
@@ -750,7 +751,7 @@ void xen_be_register_common(void)
 
     xen_be_register("console", &xen_console_ops);
     xen_be_register("vkbd", &xen_kbdmouse_ops);
-#ifdef CONFIG_VIRTFS
+#ifdef CONFIG_FSDEV_9P
     xen_be_register("9pfs", &xen_9pfs_ops);
 #endif
 #ifdef CONFIG_USB_LIBUSB
diff --git a/accel/Kconfig b/accel/Kconfig
index 461104c7715..7565ccf69e6 100644
--- a/accel/Kconfig
+++ b/accel/Kconfig
@@ -15,4 +15,4 @@ config KVM
 
 config XEN
     bool
-    select FSDEV_9P if VIRTFS
+    imply FSDEV_9P
diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index 076954b89ca..3c2062b9b3e 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -2,12 +2,12 @@
   'xen-backend.c',
   'xen-bus-helper.c',
   'xen-bus.c',
-  'xen-legacy-backend.c',
   'xen_devconfig.c',
   'xen_pvdev.c',
 ))
 
 xen_specific_ss = ss.source_set()
+xen_specific_ss.add(files('xen-legacy-backend.c'))
 xen_specific_ss.add(when: 'CONFIG_XEN_PCI_PASSTHROUGH', if_true: files(
   'xen-host-pci-device.c',
   'xen_pt.c',
-- 
2.26.2


