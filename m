Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1222D424DCD
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 09:09:44 +0200 (CEST)
Received: from localhost ([::1]:33172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNXD-000173-2w
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 03:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNEW-0005Ht-30
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:50:28 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:5819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNEK-00072t-2e
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:50:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633589412; x=1665125412;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EiCsybfW76bO6gD3KXL7cM/MzWcIXsMcur22ZTnBFkY=;
 b=pdvDtz7MGEJuuBJNMj5sAumjaJ4y5WxNvWwtE/L4F4DpTRr37p9f/ucz
 LUNjzMOV9UxXjHKPAvqXhis6RihK3MDRRlLp22T81GwZWe/xuXK1bbmWJ
 +c/E+8zaOHY2Gh9aUrt+4YRYvzzWSsHCDsBeBJRyc9K/7eCsxad9mU9A+
 H2Nksf7FwlGLTJjsvQa0Ntwm1CdfCIr+tPkqvEHiVl5kavbIe4J66YbLq
 nL63uD0y6kYufj7C5SR6NjTUM7agxazKwFC8zRh1LFRbJO8YGm/kpKQ96
 tsLrpAfzYSm9AG8aDo9lSSovZe/4sg9m/7hD0Pj36WqfICNvVvfOlWxob w==;
X-IronPort-AV: E=Sophos;i="5.85,352,1624291200"; d="scan'208";a="181145337"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2021 14:50:10 +0800
IronPort-SDR: 4l8jmphmuKCh+Ux9E2hQkF5EogQHDcq6pCekQpVbd39kjVvxsg+UYjiOTtzm66fxbXpINVrii3
 50bKmjUGQZe4hfC183PELYrsh507OGnEdVtzkv+YPLpur13omlkQlKW73m24FTFENDvKLhHIoz
 3vtRc6N75Fz9+xOPrFC8CJEYzwlYQA2f3P7ZpwPa2n3czD/Fmfvhf3YrtygRemuZLVhnwjY1aj
 xYJHy6/qN3ExVhlHT0YIiajYXSowUrhTpqAp2DVlyd4ZzlAKmqhJGH5CDqaaoNEN0fp5TdkMU6
 kl9rugZvuMx/aYBsUIr2iHfr
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:26:04 -0700
IronPort-SDR: WO/F2DUKzhMGDAEQrg/Eg3mws0rpyUHuXZKFsrqM3I3P9jJ2pzyhZAl5e4gyYOsCSBSCcOq9nO
 iZUst9XJShBIPK/joEwsxczUWE6rjoW6gA71kVOvVRu2jUgKJIk7zuk1oHn5Cq+kcJmKBONal3
 Yj34Vq4D3GkPw08fgsogt4pV04xk7TpzFSCaKlrvUjqTl88kuSdoAQTCpP/q1FWJGanz4rrXFd
 RdtRqP809tczYkGzirTw4JlucNa9sNe96fyKdi8cA2JY/SB/9gLmMki1n5AqiDGjhLXdol8ECB
 6qQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:50:11 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HQ24y0G3lz1RvmH
 for <qemu-devel@nongnu.org>; Wed,  6 Oct 2021 23:50:10 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1633589409; x=1636181410; bh=EiCsybf
 W76bO6gD3KXL7cM/MzWcIXsMcur22ZTnBFkY=; b=Lftl/1RvkAEwz53884Sr5Zc
 0jdNaR72fy8t/t7k6j771kr6dQECSi02UKKufCys22rj6XTBldeAfmhcFzvDhBXo
 V9mvcAClZ3OIxztRq3FqrbCN2EEeL+ImUIVJC9k69HB2Zd+mrRwwcGtXyeiXfyrW
 ZKg55cswv4fUZWiT41SODP5IQ2QeSimESQ7SD3sr+b1SuIep8lYVD89GnPOTntwn
 +My8UN6OTCAet6ji8fzsd5SY9griEVFeKs9vE3JUUvC4WCJjaSX7tVtA2GBW/Vu0
 d3dxgbHgR0o4F8S55iQnr1jwIw7Qa8RpO3XRPP/HZj1VeXPuCGmRgk1WKv/XLzA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id D1NDjwWh4HiN for <qemu-devel@nongnu.org>;
 Wed,  6 Oct 2021 23:50:09 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.32])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HQ24s3Cyyz1RvTg;
 Wed,  6 Oct 2021 23:50:05 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 22/26] hw/char/mchp_pfsoc_mmuart: Use a MemoryRegion container
Date: Thu,  7 Oct 2021 16:47:47 +1000
Message-Id: <20211007064751.608580-23-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=907902f29=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Our device have 2 different I/O regions:
- a 16550 UART mapped for 32-bit accesses
- 13 extra registers

Instead of mapping each region on the main bus, introduce
a container, map the 2 devices regions on the container,
and map the container on the main bus.

Before:

  (qemu) info mtree
    ...
    0000000020100000-000000002010001f (prio 0, i/o): serial
    0000000020100020-000000002010101f (prio 0, i/o): mchp.pfsoc.mmuart
    0000000020102000-000000002010201f (prio 0, i/o): serial
    0000000020102020-000000002010301f (prio 0, i/o): mchp.pfsoc.mmuart
    0000000020104000-000000002010401f (prio 0, i/o): serial
    0000000020104020-000000002010501f (prio 0, i/o): mchp.pfsoc.mmuart
    0000000020106000-000000002010601f (prio 0, i/o): serial
    0000000020106020-000000002010701f (prio 0, i/o): mchp.pfsoc.mmuart

After:

  (qemu) info mtree
    ...
    0000000020100000-0000000020100fff (prio 0, i/o): mchp.pfsoc.mmuart
      0000000020100000-000000002010001f (prio 0, i/o): serial
      0000000020100020-0000000020100fff (prio 0, i/o): mchp.pfsoc.mmuart.=
regs
    0000000020102000-0000000020102fff (prio 0, i/o): mchp.pfsoc.mmuart
      0000000020102000-000000002010201f (prio 0, i/o): serial
      0000000020102020-0000000020102fff (prio 0, i/o): mchp.pfsoc.mmuart.=
regs
    0000000020104000-0000000020104fff (prio 0, i/o): mchp.pfsoc.mmuart
      0000000020104000-000000002010401f (prio 0, i/o): serial
      0000000020104020-0000000020104fff (prio 0, i/o): mchp.pfsoc.mmuart.=
regs
    0000000020106000-0000000020106fff (prio 0, i/o): mchp.pfsoc.mmuart
      0000000020106000-000000002010601f (prio 0, i/o): serial
      0000000020106020-0000000020106fff (prio 0, i/o): mchp.pfsoc.mmuart.=
regs

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
Message-id: 20210925133407.1259392-3-f4bug@amsat.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/char/mchp_pfsoc_mmuart.h |  1 +
 hw/char/mchp_pfsoc_mmuart.c         | 11 ++++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/hw/char/mchp_pfsoc_mmuart.h b/include/hw/char/mchp_p=
fsoc_mmuart.h
index 9c012e6c97..864ac1a36b 100644
--- a/include/hw/char/mchp_pfsoc_mmuart.h
+++ b/include/hw/char/mchp_pfsoc_mmuart.h
@@ -33,6 +33,7 @@
 #define MCHP_PFSOC_MMUART_REG_COUNT 13
=20
 typedef struct MchpPfSoCMMUartState {
+    MemoryRegion container;
     MemoryRegion iomem;
     hwaddr base;
     qemu_irq irq;
diff --git a/hw/char/mchp_pfsoc_mmuart.c b/hw/char/mchp_pfsoc_mmuart.c
index 584e7fec17..ea58655976 100644
--- a/hw/char/mchp_pfsoc_mmuart.c
+++ b/hw/char/mchp_pfsoc_mmuart.c
@@ -25,6 +25,8 @@
 #include "chardev/char.h"
 #include "hw/char/mchp_pfsoc_mmuart.h"
=20
+#define REGS_OFFSET 0x20
+
 static uint64_t mchp_pfsoc_mmuart_read(void *opaque, hwaddr addr, unsign=
ed size)
 {
     MchpPfSoCMMUartState *s =3D opaque;
@@ -72,16 +74,19 @@ MchpPfSoCMMUartState *mchp_pfsoc_mmuart_create(Memory=
Region *sysmem,
=20
     s =3D g_new0(MchpPfSoCMMUartState, 1);
=20
+    memory_region_init(&s->container, NULL, "mchp.pfsoc.mmuart", 0x1000)=
;
+
     memory_region_init_io(&s->iomem, NULL, &mchp_pfsoc_mmuart_ops, s,
-                          "mchp.pfsoc.mmuart", 0x1000);
+                          "mchp.pfsoc.mmuart.regs", 0x1000 - REGS_OFFSET=
);
+    memory_region_add_subregion(&s->container, REGS_OFFSET, &s->iomem);
=20
     s->base =3D base;
     s->irq =3D irq;
=20
-    s->serial =3D serial_mm_init(sysmem, base, 2, irq, 399193, chr,
+    s->serial =3D serial_mm_init(&s->container, 0, 2, irq, 399193, chr,
                                DEVICE_LITTLE_ENDIAN);
=20
-    memory_region_add_subregion(sysmem, base + 0x20, &s->iomem);
+    memory_region_add_subregion(sysmem, base, &s->container);
=20
     return s;
 }
--=20
2.31.1


