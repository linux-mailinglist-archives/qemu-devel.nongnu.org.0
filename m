Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8352915028B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 09:29:10 +0100 (CET)
Received: from localhost ([::1]:36042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyX6T-0005ok-JP
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 03:29:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34738)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iyX3q-0002BV-Nw
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 03:26:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iyX3p-0000yB-6h
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 03:26:26 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:45146)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iyX3o-0000x7-Vw; Mon, 03 Feb 2020 03:26:25 -0500
Received: by mail-wr1-x442.google.com with SMTP id a6so16688034wrx.12;
 Mon, 03 Feb 2020 00:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/a2AvhlrNq+nqNmvP5yTkn3vOLPg6+tDNEhEkfX8xNo=;
 b=jd86iqOjEh4ckVMErcVFBHrvwO4v2+EOqb+C/zGfcByfiV6HM1svWjV0wTdkHeA1xC
 cTpZ1NnlUzHsno5CbYV5AxbK0FpfdY12FcU3z7GcmHSnrgU2AcSZDmLneXVq7hL0QPNG
 B985oTIcD1OvkBSLmexdSPnAIPadR/fMfN9cyeg11lJcNOcnZ/70mhvmvmPsMU/0sOrI
 SYObl6dPH34RXhFvTdg82tGg6Qsg3a/K8ttsJ4i4rmdrSpojZg7oVvvyE1PGOc2HjrYg
 4VJdXN1rq/QC31rVhx9FvN51LEDtdNJUuO8oIKn8xCjHiWwQNS+nRui2hl2AiN3nfr2y
 jP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/a2AvhlrNq+nqNmvP5yTkn3vOLPg6+tDNEhEkfX8xNo=;
 b=SR2GTqiEUSeyaPyC5REHV4bj7CkYzLy1SDcTorq0NKPvxvy9Rt56Iqj9jJrFxcdJum
 7qL9ea2UPkTL80iTjeg92i1fYTI1+eFFDKprHDV/t00onnBysZteui8Gbsgde7DnqSrr
 z6g0/omcj3KKhO6MDstqVWzcv+sW5C1+85vY4f6pZQzPr5aWOfsNAk5gijEwwHmy31SS
 3PdOUVTZ1oKqh5izZpnWQb9j7P1g36UTlIGj1GWiDSllR0f5tddfygqThSVECqeIgU57
 ypmTP88hWS1NQQ/PVPP4SvWfKnSoN0wwICBJXwIEGNDY1S1V3rhGCS+xf5tlIH/AgrOv
 wvpA==
X-Gm-Message-State: APjAAAVLApKPcGAOKeMLlOV+dvfGmEE+bghX8FnVxA1RQWHt9leCnaBh
 3oiS6m/gYPCgJOTg7tko3F4CSIA9
X-Google-Smtp-Source: APXvYqxK3ZRg6AGYyML/L0hk0IdCjLIwUN/ePklV/5mtZWP+9WV/5VGI2bgTGXxiXfxFhr5y8isiDg==
X-Received: by 2002:a05:6000:10c:: with SMTP id
 o12mr10428596wrx.106.1580718383745; 
 Mon, 03 Feb 2020 00:26:23 -0800 (PST)
Received: from localhost.localdomain (162.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.162])
 by smtp.gmail.com with ESMTPSA id w20sm22396778wmk.34.2020.02.03.00.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 00:26:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] hw/arm/raspi: Use BCM2708 machine type with pre Device
 Tree kernels
Date: Mon,  3 Feb 2020 09:26:14 +0100
Message-Id: <20200203082619.7426-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200203082619.7426-1-f4bug@amsat.org>
References: <20200203082619.7426-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stephen Warren <swarren@nvidia.com>,
 =?UTF-8?q?Zolt=C3=A1n=20Baldaszti?= <bztemail@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jeremy Linton <lintonrjeremy@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Pete Batard <pete@akeo.ie>, Igor Mammedov <imammedo@redhat.com>,
 Michael Chan <michael.chan@broadcom.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Kshitij Soni <kshitij.soni@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When booting without device tree, the Linux kernels uses the $R1
register to determine the machine type. The list of values is
registered at [1].

There are two entries for the Raspberry Pi:

- https://www.arm.linux.org.uk/developer/machines/list.php?mid=3138
  name: MACH_TYPE_BCM2708
  value: 0xc42 (3138)
  status: Active, not mainlined
  date: 15 Oct 2010

- https://www.arm.linux.org.uk/developer/machines/list.php?mid=4828
  name: MACH_TYPE_BCM2835
  value: 4828
  status: Active, mainlined
  date: 6 Dec 2013

QEMU always used the non-mainlined type MACH_TYPE_BCM2708.
The value 0xc43 is registered to 'MX51_GGC' (processor i.MX51), and
0xc44 to 'Western Digital Sharespace NAS' (processor Marvell 88F5182).

The Raspberry Pi foundation bootloader only sets the BCM2708 machine
type, see [2] or [3]:

 133 9:
 134     mov r0, #0
 135     ldr r1, =3138       @ BCM2708 machine id
 136     ldr r2, atags       @ ATAGS
 137     bx  r4

U-Boot only uses MACH_TYPE_BCM2708 (see [4]):

 25 /*
 26  * 2835 is a SKU in a series for which the 2708 is the first or primary SoC,
 27  * so 2708 has historically been used rather than a dedicated 2835 ID.
 28  *
 29  * We don't define a machine type for bcm2709/bcm2836 since the RPi Foundation
 30  * chose to use someone else's previously registered machine ID (3139, MX51_GGC)
 31  * rather than obtaining a valid ID:-/
 32  *
 33  * For the bcm2837, hopefully a machine type is not needed, since everything
 34  * is DT.
 35  */

While the definition MACH_BCM2709 with value 0xc43 was introduced in
a commit described "Add 2709 platform for Raspberry Pi 2" out of the
mainline Linux kernel, it does not seem used, and the platform is
introduced with Device Tree support anyway (see [5] and [6]).

Remove the unused values (0xc43 introduced in commit 1df7d1f9303aef
"raspi: add raspberry pi 2 machine" and 0xc44 in commit bade58166f4
"raspi: Raspberry Pi 3 support"), keeping only MACH_TYPE_BCM2708.

[1] https://www.arm.linux.org.uk/developer/machines/
[2] https://github.com/raspberrypi/tools/blob/920c7ed2e/armstubs/armstub7.S#L135
[3] https://github.com/raspberrypi/tools/blob/49719d554/armstubs/armstub7.S#L64
[4] https://gitlab.denx.de/u-boot/u-boot/blob/v2015.04/include/configs/rpi-common.h#L18
[5] https://github.com/raspberrypi/linux/commit/d9fac63adac#diff-6722037d79570df5b392a49e0e006573R526
[6] http://lists.infradead.org/pipermail/linux-rpi-kernel/2015-February/001268.html

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Zoltán Baldaszti <bztemail@gmail.com>
Cc: Pekka Enberg <penberg@iki.fi>
Cc: Stephen Warren <swarren@nvidia.com>
Cc: Kshitij Soni <kshitij.soni@broadcom.com>
Cc: Michael Chan <michael.chan@broadcom.com>
Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: Jeremy Linton <lintonrjeremy@gmail.com>
Cc: Pete Batard <pete@akeo.ie>
---
 hw/arm/raspi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 3996f6c63a..ef76a27f33 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -29,8 +29,7 @@
 #define FIRMWARE_ADDR_3 0x80000 /* Pi 3 loads kernel.img here by default */
 #define SPINTABLE_ADDR  0xd8 /* Pi 3 bootloader spintable */
 
-/* Table of Linux board IDs for different Pi versions */
-static const int raspi_boardid[] = {[1] = 0xc42, [2] = 0xc43, [3] = 0xc44};
+#define MACH_TYPE_BCM2708   3138 /* Linux board IDs */
 
 typedef struct RasPiState {
     BCM283XState soc;
@@ -116,7 +115,7 @@ static void setup_boot(MachineState *machine, int version, size_t ram_size)
     static struct arm_boot_info binfo;
     int r;
 
-    binfo.board_id = raspi_boardid[version];
+    binfo.board_id = MACH_TYPE_BCM2708;
     binfo.ram_size = ram_size;
     binfo.nb_cpus = machine->smp.cpus;
 
-- 
2.21.1


