Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B181E17E396
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 16:27:21 +0100 (CET)
Received: from localhost ([::1]:44882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBKJM-0007jT-OC
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 11:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34084)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK37-0000Xu-Ao
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 11:10:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK35-0008BE-Rl
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 11:10:33 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:37509)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK2w-000808-Uv; Mon, 09 Mar 2020 11:10:23 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MeCxd-1jjHXV17Qd-00bNlh; Mon, 09 Mar 2020 16:09:34 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 22/33] hw/acpi: Include "hw/mem/nvdimm.h"
Date: Mon,  9 Mar 2020 16:08:26 +0100
Message-Id: <20200309150837.3193387-23-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NTc9gYTo1zgyCCMIFWflspFVQs5HlnqOXjyevZODLe+VuCqABS8
 GY+4Lfy4w8V1/7Ii+pM2ITHpvgrBl4n/WB7gEZ1ygjTKo2+zdiGL64CZ9omlp7p8X5Ppv2+
 BNZ8qiuuOECCmS21vLcsfmCKV25dgP2dyeiW+r0Y/e1J2SkBWk916H6cUuBZU6VGt4kYPYw
 Ao2QYdJ/uIRHXnwGRkuEQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EVY8x1Sb0zQ=:GiXNbmkKkMkwrteb3NG5o2
 tngeP6MhBD/AUrGRFUHSNyiYcSLgRJaTUtwDX+SlKsiFg3ZvD/+qvJPT/DYczPgj6IwFPv2Tg
 KyRu7yYP+dmL3k+uapJbNE98TYPsO5ujtCD6GF+ul0hPKN8QSf6RNSTvUbq2CEx41zVq1Q1x0
 8aHLEwQw0GLQhDwUz6P/D/RahmWCTn2ydQ/d68GD3sJHwIdwG/DgDbFw0dOfMyl8KzuOecEfG
 SxAq2fArd9R2G0xwdPso1xc5YD2+MFdQxLU8GqJD6LYiS8EN0Qlf7B97ExOx8ibRWXNIbyh+D
 gCb8EvzNtsa8AuFBzAc1l0+JR0fW4SHXhrziiEq54cY8DPowRcMRT4Pp764h7sNfQe26DuWIS
 V+PglYHc6lT/iX1I70jmpicwkqcLxcShjt/r8shPOAgw6pz7LHnWNU4ciDCt0qavHM0F6NTfd
 oS7AKxs4vLun2QvS/kdKoGiNVyjyNw7f/CwvINhffGkUVC2wTtSum8Gf7TWfF0BhneCarH1aN
 hh807vQmwk4c9Co5pBOI+7TsFJ6AZzdv9hHDVPux9MzRdi3cTHq23b4dQt6DIaZOMOn10wW14
 cQ6iKZJRAvRsSa+bBJWa7/zbCXLmNiKuFeaRCU0Nx68iS50pRvhIQ2dFdEckc1SnUAP3CGii/
 j6KOlWG/59yywa1PlL63AnkLkGY/BF1qUDGNbRKbdOt0v1bcIuv78VoELkUFbQhRe1C0SD7kW
 2535KZ7lQcqGIRzpzLcrTJIOH5RPY36Dt0tIEIq1ZajP8KUn8/HTyeTDDLE7zofCsbmTJRRjA
 V8+dTEqT7gQ9xpHKCYR5dclL9p3fOrp6onJddhgi7VCNkmf2goBxkGKd5FloHeAn93I893f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Both ich9.c and piix4.c use methods/definitions declared in the
NVDIMM device header. Include it.

This fixes (when modifying unrelated headers):

  hw/acpi/ich9.c:507:46: error: use of undeclared identifier 'TYPE_NVDIMM'
        if (object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM)) {
                                             ^
  hw/acpi/ich9.c:508:13: error: implicit declaration of function 'nvdimm_acpi_plug_cb' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
            nvdimm_acpi_plug_cb(hotplug_dev, dev);
            ^
  hw/acpi/piix4.c:403:46: error: use of undeclared identifier 'TYPE_NVDIMM'
        if (object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM)) {
                                             ^
  hw/acpi/piix4.c:404:13: error: implicit declaration of function 'nvdimm_acpi_plug_cb' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
            nvdimm_acpi_plug_cb(hotplug_dev, dev);
            ^

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200228114649.12818-16-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/acpi/ich9.c  | 1 +
 hw/acpi/piix4.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index fdd0a6c79e11..4e74284b65b7 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -39,6 +39,7 @@
 
 #include "hw/i386/ich9.h"
 #include "hw/mem/pc-dimm.h"
+#include "hw/mem/nvdimm.h"
 
 //#define DEBUG
 
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 6d621c31e751..b84dbba2c3e8 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -38,6 +38,7 @@
 #include "hw/acpi/cpu.h"
 #include "hw/hotplug.h"
 #include "hw/mem/pc-dimm.h"
+#include "hw/mem/nvdimm.h"
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/xen/xen.h"
-- 
2.24.1


