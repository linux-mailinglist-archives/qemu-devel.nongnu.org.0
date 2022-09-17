Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 786055BB8C8
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 16:35:02 +0200 (CEST)
Received: from localhost ([::1]:36140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZYuL-0004jT-6V
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 10:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1oZYsI-0003J8-6C
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 10:32:54 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:36600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1oZYsF-0002ix-Ml
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 10:32:52 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 i203-20020a1c3bd4000000b003b3df9a5ecbso1616983wma.1
 for <qemu-devel@nongnu.org>; Sat, 17 Sep 2022 07:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=LwgGVKof5czB4qVRgyCqM1IN9dGNGvOibxGxrCsxA7E=;
 b=WVzUypls8Us54WWg2z1LRqzi8j+5glgXlU2XoO9lYpbi24Hd0UiWE4ty9jJpL1l9at
 ntOo3HIYg7PEV324nsdKhc0NwQelKrtDmDOaKE/IZF78zehQGxaEBHJlzNuxrkkH03hl
 x1K+9C5XWlS6jNl1/wp2sXAtvx7PaD7FX3Z2Hx6f/PrBmYQl3+1M37MWSOwBW6CKz743
 W9ca0FxlmuKnp00d/CTEiYdhE3w48yxAxJwNm46ZVOtj5xEqQIQyEMy3ypwoLaIvAPoe
 +QXF4YhcqU9jaEGCND/oFU6IiBn31lQyw3KCe05jstKJLUVG+oXuvqsfx/zsXBBfzl0Z
 cD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=LwgGVKof5czB4qVRgyCqM1IN9dGNGvOibxGxrCsxA7E=;
 b=aAAEkvkG3uhVsiKWv+coa4UrZK059T+56PxipMD9BhE4Hh37/K52imojCJu5f/EYRA
 YjBWHqduAls48qVxhzhMJjeRmPL72yAoIE5Ja+nENL/dyhHPQgX5UTahFOaDvEueja66
 qd9KRMBC4hwSfvaJF/28LjOQK+HIMG7uHSHia+sN0mE6PFBLdDLu2tWh84epWmtAaNEd
 7rf7bBNROWIWPu1Z0imQSTsXLO8eINgdh52CirQkL/NqybbfoTzhnvfymVxChl16jflk
 MkewbRJiZjjoC683g040zhvsP0p/UGIbq4w1m3BniKEioByl7pxPA73MwMeRXXBL57KN
 JXHQ==
X-Gm-Message-State: ACrzQf1CT73IUVw7avpgP1D0Np4Qf4tOnHD88AFa5sULluv54f/OtdI5
 q2UMZS8a4vc1d4v5t3gPpXU=
X-Google-Smtp-Source: AMsMyM7f8eGxY4AVjm224flYw9aJowqgs/D8L2ko52TuW7aGPwSBFlDwvkdypC3O3kdRgw9Ryf2e8A==
X-Received: by 2002:a1c:7916:0:b0:3b4:7575:d2f9 with SMTP id
 l22-20020a1c7916000000b003b47575d2f9mr6701836wme.27.1663425169875; 
 Sat, 17 Sep 2022 07:32:49 -0700 (PDT)
Received: from liavpc.localdomain ([147.235.207.82])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a5d4bc3000000b002238ea5750csm9569406wrt.72.2022.09.17.07.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Sep 2022 07:32:48 -0700 (PDT)
From: Liav Albani <liavalb@gmail.com>
To: kraxel@redhat.com
Cc: qemu-devel@nongnu.org,
	Liav Albani <liavalb@gmail.com>
Subject: [PATCH v2] hw/display: load the correct ROM file for isa-vga device
Date: Sat, 17 Sep 2022 17:32:29 +0300
Message-Id: <20220917143229.115580-1-liavalb@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=liavalb@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Apparently QEMU didn't load the correct ROM file when using the isa-vga
device on my development machine, which resulted in a display waiting to
be initialized by a guest OS kernel. With this fix, SeaBIOS is able to
print vital data to a text mode console during boot, which is useful in
case of failing to continue booting.

The build name of the vgabios.bin is changed too, to vgabios-isavga.bin
to ensure we always have that file when QEMU is installed as a package
or compiled from source.

Signed-off-by: Liav Albani <liavalb@gmail.com>
---
 hw/display/vga-isa.c | 2 +-
 hw/display/vga_int.h | 2 +-
 pc-bios/meson.build  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
index 46abbc5653..bcf646d012 100644
--- a/hw/display/vga-isa.c
+++ b/hw/display/vga-isa.c
@@ -84,7 +84,7 @@ static void vga_isa_realizefn(DeviceState *dev, Error **errp)
                                 VBE_DISPI_LFB_PHYSICAL_ADDRESS,
                                 &s->vram);
     /* ROM BIOS */
-    rom_add_vga(VGABIOS_FILENAME);
+    rom_add_vga(VGABIOS_ISAVGA_FILENAME);
 }
 
 static Property vga_isa_properties[] = {
diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
index 305e700014..b63788e809 100644
--- a/hw/display/vga_int.h
+++ b/hw/display/vga_int.h
@@ -183,7 +183,7 @@ void vbe_ioport_write_data(void *opaque, uint32_t addr, uint32_t val);
 extern const uint8_t sr_mask[8];
 extern const uint8_t gr_mask[16];
 
-#define VGABIOS_FILENAME "vgabios.bin"
+#define VGABIOS_ISAVGA_FILENAME "vgabios-isavga.bin"
 #define VGABIOS_CIRRUS_FILENAME "vgabios-cirrus.bin"
 
 extern const MemoryRegionOps vga_mem_ops;
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 388e0db6e4..6af94a4a0a 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -29,7 +29,7 @@ blobs = [
   'bios-microvm.bin',
   'qboot.rom',
   'sgabios.bin',
-  'vgabios.bin',
+  'vgabios-isavga.bin',
   'vgabios-cirrus.bin',
   'vgabios-stdvga.bin',
   'vgabios-vmware.bin',
-- 
2.37.3


