Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA3A45754D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 18:19:09 +0100 (CET)
Received: from localhost ([::1]:41046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo7XY-0005pf-AT
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 12:19:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mo7R4-00072U-TM
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 12:12:27 -0500
Received: from [2a00:1450:4864:20::42c] (port=37637
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mo7R3-0006Pe-G7
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 12:12:26 -0500
Received: by mail-wr1-x42c.google.com with SMTP id b12so19294223wrh.4
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 09:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L/CC3I2TBV/ZdA0Br80pFCsNnb1lQ9G4hQuRebB0TTw=;
 b=XJJoc84RDmhstokLaNYqA67+k1GSj04TrY4fvspn6lIgT6KFo4RfuxePUi9PvpN/Og
 ShtLiMcvHHFxkLemM6Ig6ik+//qZhM1bXvD2KFsdwOGYJTfFYJWoEKhqsEAdcvQMLhaz
 135mdpNoeW+3AnR0RZ6ol8Q/P8yMllzx9hejlWh9zbz6Te8QjdHN7nR4jacMJhSAcqRz
 PqbiFVWiaeKZAkdK1ywGz/J44ZpMlIGI/4Kson1sgUbKYQkFdNLijE6FANTdSZ6Z2cVT
 sF0Kl6fjoadjkwn5FqWkJChhf+YiN8MsCioTq3tskQYfuWQj/VuMOVTq4Mh88c1kSmfW
 ZfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=L/CC3I2TBV/ZdA0Br80pFCsNnb1lQ9G4hQuRebB0TTw=;
 b=d6/m9AcZj0JeJQtKzErFwZ2I1ZZ4wwJ5FXDEn4vvs7FQNb8MsD1XI6b/gYgEMFWsO8
 7/3/6eVRRbT19y5vbqVWIbwL0ZD3ASt3kk9WTA9uvQPGsgjfopiSIYdvizlWnkSai5Xm
 I2tAgF+LqLyn38oTyFlDJZp7lAvxYL73C2dtVnkLMQv9rGCg6Ofl85/l78G9advfJ8kE
 bIr9FtyDWAVIITBjU9Idzy3hqxPW9UeIn7ESGUZWOyiDf7gF0k1ox0haIxkCMbXyvmo4
 vNf+jSQ8LpCfQhBHoM5eKbnoZJSyTlDP8Q+TjsA4I3ay7XtPWPMI4lSP7yv+dzS4YVFI
 HYCA==
X-Gm-Message-State: AOAM530/7Kr/iyX20iu8EZeSqQltCAXXgO/wFi2bI3opM9zx6tan0zhp
 1XKKXTzNhYUfs1JnThfESfrcz1LT3h4=
X-Google-Smtp-Source: ABdhPJyAZRYVkHItd/wIhSdc35V3BXNTEYUIUBLuAlp00W6042VtGY69SkjmJRUo5G7Hs1oaZbbK5Q==
X-Received: by 2002:a5d:47c7:: with SMTP id o7mr9662363wrc.204.1637341943937; 
 Fri, 19 Nov 2021 09:12:23 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 o12sm510061wrc.85.2021.11.19.09.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 09:12:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.0 4/5] hw/mips/jazz: Inline vga_mmio_init() and remove it
Date: Fri, 19 Nov 2021 18:12:01 +0100
Message-Id: <20211119171202.458919-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211119171202.458919-1-f4bug@amsat.org>
References: <20211119171202.458919-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vga_mmio_init() is used only one time and not very helpful,
inline and remove it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/display/vga.h |  6 ------
 hw/display/vga-mmio.c    | 20 --------------------
 hw/mips/jazz.c           |  9 ++++++++-
 3 files changed, 8 insertions(+), 27 deletions(-)

diff --git a/include/hw/display/vga.h b/include/hw/display/vga.h
index 03c65a14218..451e4c9898c 100644
--- a/include/hw/display/vga.h
+++ b/include/hw/display/vga.h
@@ -9,8 +9,6 @@
 #ifndef QEMU_HW_DISPLAY_VGA_H
 #define QEMU_HW_DISPLAY_VGA_H
 
-#include "exec/hwaddr.h"
-
 /*
  * modules can reference this symbol to avoid being loaded
  * into system emulators without vga support
@@ -24,8 +22,4 @@ enum vga_retrace_method {
 
 extern enum vga_retrace_method vga_retrace_method;
 
-int vga_mmio_init(hwaddr vram_base,
-                    hwaddr ctrl_base, int it_shift,
-                    MemoryRegion *address_space);
-
 #endif
diff --git a/hw/display/vga-mmio.c b/hw/display/vga-mmio.c
index d1c5f31c134..af9229794c9 100644
--- a/hw/display/vga-mmio.c
+++ b/hw/display/vga-mmio.c
@@ -25,7 +25,6 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "hw/display/vga.h"
 #include "hw/sysbus.h"
 #include "hw/qdev-properties.h"
 #include "vga_int.h"
@@ -87,25 +86,6 @@ static void vga_mmio_reset(DeviceState *dev)
     vga_common_reset(s);
 }
 
-int vga_mmio_init(hwaddr vram_base,
-                    hwaddr ctrl_base, int it_shift,
-                    MemoryRegion *address_space)
-{
-    DeviceState *dev;
-    SysBusDevice *s;
-
-    dev = qdev_new(TYPE_VGA_MMIO);
-    qdev_prop_set_uint8(dev, "it_shift", it_shift);
-    s = SYS_BUS_DEVICE(dev);
-    sysbus_realize_and_unref(s, &error_fatal);
-
-    sysbus_mmio_map(s, 0, ctrl_base);
-    sysbus_mmio_map(s, 1, vram_base + 0x000a0000);
-    sysbus_mmio_map(s, 2, VBE_DISPI_LFB_PHYSICAL_ADDRESS);
-
-    return 0;
-}
-
 static void vga_mmio_realizefn(DeviceState *dev, Error **errp)
 {
     VGAMmioState *s = VGA_MMIO(dev);
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 8f345afd137..bd9815c773e 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -43,6 +43,7 @@
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/timer/i8254.h"
 #include "hw/display/vga.h"
+#include "hw/display/bochs-vbe.h"
 #include "hw/audio/pcspk.h"
 #include "hw/input/i8042.h"
 #include "hw/sysbus.h"
@@ -274,7 +275,13 @@ static void mips_jazz_init(MachineState *machine,
         }
         break;
     case JAZZ_PICA61:
-        vga_mmio_init(0x40000000, 0x60000000, 0, get_system_memory());
+        dev = qdev_new("vga-mmio");
+        qdev_prop_set_uint8(dev, "it_shift", 0);
+        sysbus = SYS_BUS_DEVICE(dev);
+        sysbus_realize_and_unref(sysbus, &error_fatal);
+        sysbus_mmio_map(sysbus, 0, 0x60000000);
+        sysbus_mmio_map(sysbus, 1, 0x400a0000);
+        sysbus_mmio_map(sysbus, 2, VBE_DISPI_LFB_PHYSICAL_ADDRESS);
         break;
     default:
         break;
-- 
2.31.1


