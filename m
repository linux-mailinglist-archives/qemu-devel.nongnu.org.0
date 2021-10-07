Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F16B424DB4
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 09:07:49 +0200 (CEST)
Received: from localhost ([::1]:56322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNVM-0006DG-8g
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 03:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNEJ-0005Fm-Vw
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:50:18 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:25643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNEE-0006yG-Fo
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:50:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633589406; x=1665125406;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W9UZg/AuSNOSJg3PTtbVzY0SYxMaAjxpFacvTfTecvM=;
 b=E/mkWP48qtvpFfQP5b8dkGnFpTqIvkdFnCuHcztj4o+VsbKwxd+HexDb
 HObdn7oHkwtcYRKt2EcpsbW8i/xF0UNqbxmU4hgN3NgZkdbIk0jbtwvYX
 ubBOjbbW18fLaH3ettKU6lRHt99gqRTjIGe0JcFOBteZhEon8n573PgkW
 wQdXM0MlA7Lqa38GKzabznAVnmU+seL78kAQZb+MVbAnR3zVBVRLjqLvv
 C6cc19SLhfxSAPnKVH7OR89NNIp0oox50PSrtPQW4mtlRkwxdRZeOMR4B
 emSQuP7+RKhqyH2BFfmSuR5SfAZYqrSnLs+VAoOsOsl2x34iKvm8dec46 w==;
X-IronPort-AV: E=Sophos;i="5.85,352,1624291200"; d="scan'208";a="181145331"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2021 14:50:05 +0800
IronPort-SDR: QPsmsOA5GaVW4GcM7kepOpWwCL+/I4ThTVOO63fMioh46dIPAw+oFnGF65JlFn8jmLka9KrsSs
 kmLqsIP/Qpr9GD0w3EmyT7TL6uvZIUUN7NZ7KO0UvFxmyPZYaEHTHPkdjzkDsU5RLlTNEJBU9F
 iI8byBwjKmhxBGjvwPYPA45vDztne6Xj3wYJh22RJJTxToKFQeYhNRv3WGYlvmBS7Wcj6gYrkO
 HytDiRhUX3JbiEkEgGPhZ2LgVLqadDAvJstJkGfiwiPZyFEiyOBRAPi1sgY7br8t7W0cCUR5xk
 sr3AgFZISKYsUJJ7evfyEX50
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:25:59 -0700
IronPort-SDR: +jl5MC/dJLWQZFcThMOuOdoK1NTd3grg9jqo3RrT4yoxzZrK6YeYvswjrircuJSrb9ZxsbwPbK
 eIg3y6p+4RziSeE/NzevU+wP6rtRIrqOnUmf2SOrUSE2tVayAjt6ZE3Um5tUkHFX5PvoO/GZCV
 +e6DYhW+XDkvG+tH3NRkS8Fhlnjjw+CFOIgVPNqkqVjV+11F2pO+IExDsAt2WC24jRF7c8jowz
 Kn1f4XJC/5MyuwYzI0S3CcB3KqhCKHBsYAIXoiLsGW15MkRLzRR1hzUcKUt4BL9PxNpJUZPY/Y
 Ht4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:50:06 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HQ24r6swZz1RvmJ
 for <qemu-devel@nongnu.org>; Wed,  6 Oct 2021 23:50:04 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1633589404; x=1636181405; bh=W9UZg/A
 uSNOSJg3PTtbVzY0SYxMaAjxpFacvTfTecvM=; b=BRX9ySdfuFcW9ms0zrDDkUW
 fA/XXqrnlgSAr5tkAtz1c5DedHGC4CcoqRdSUeGklaH84o7/M85jUcQ3g81iLAd0
 3NQdqYZll6oynIHEq7lmZlonIE/98kTZktfz5NU1BXNvgFEl84GnGjWq/wx1svs6
 x2lAjUkCIr1VIAR4TcUDVZG2DuOF4YDe+SHvf7eAyFVnaevHiLB4/lLcLIDwkPK4
 lpJ6oDzstJBV5d55pB0yjJGeZROwvo1hrKSuCoaYOCpEH9M+ZDE6Co+q3Hre18oy
 P+IcbXr5i/dbESJGwzcEiVqrG59Wp2VlK1sF/APBxVgj29BsidoAbJHVcgTD+Sg=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 5QfmAk2VV67y for <qemu-devel@nongnu.org>;
 Wed,  6 Oct 2021 23:50:04 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.32])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HQ24l6ZRLz1RvTg;
 Wed,  6 Oct 2021 23:49:59 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 21/26] hw/char/mchp_pfsoc_mmuart: Simplify
 MCHP_PFSOC_MMUART_REG definition
Date: Thu,  7 Oct 2021 16:47:46 +1000
Message-Id: <20211007064751.608580-22-alistair.francis@opensource.wdc.com>
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

The current MCHP_PFSOC_MMUART_REG_SIZE definition represent the
size occupied by all the registers. However all registers are
32-bit wide, and the MemoryRegionOps handlers are restricted to
32-bit:

  static const MemoryRegionOps mchp_pfsoc_mmuart_ops =3D {
      .read =3D mchp_pfsoc_mmuart_read,
      .write =3D mchp_pfsoc_mmuart_write,
      .impl =3D {
          .min_access_size =3D 4,
          .max_access_size =3D 4,
      },

Avoid being triskaidekaphobic, simplify by using the number of
registers.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210925133407.1259392-2-f4bug@amsat.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/char/mchp_pfsoc_mmuart.h |  4 ++--
 hw/char/mchp_pfsoc_mmuart.c         | 14 ++++++++------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/include/hw/char/mchp_pfsoc_mmuart.h b/include/hw/char/mchp_p=
fsoc_mmuart.h
index f61990215f..9c012e6c97 100644
--- a/include/hw/char/mchp_pfsoc_mmuart.h
+++ b/include/hw/char/mchp_pfsoc_mmuart.h
@@ -30,7 +30,7 @@
=20
 #include "hw/char/serial.h"
=20
-#define MCHP_PFSOC_MMUART_REG_SIZE  52
+#define MCHP_PFSOC_MMUART_REG_COUNT 13
=20
 typedef struct MchpPfSoCMMUartState {
     MemoryRegion iomem;
@@ -39,7 +39,7 @@ typedef struct MchpPfSoCMMUartState {
=20
     SerialMM *serial;
=20
-    uint32_t reg[MCHP_PFSOC_MMUART_REG_SIZE / sizeof(uint32_t)];
+    uint32_t reg[MCHP_PFSOC_MMUART_REG_COUNT];
 } MchpPfSoCMMUartState;
=20
 /**
diff --git a/hw/char/mchp_pfsoc_mmuart.c b/hw/char/mchp_pfsoc_mmuart.c
index 2facf85c2d..584e7fec17 100644
--- a/hw/char/mchp_pfsoc_mmuart.c
+++ b/hw/char/mchp_pfsoc_mmuart.c
@@ -29,13 +29,14 @@ static uint64_t mchp_pfsoc_mmuart_read(void *opaque, =
hwaddr addr, unsigned size)
 {
     MchpPfSoCMMUartState *s =3D opaque;
=20
-    if (addr >=3D MCHP_PFSOC_MMUART_REG_SIZE) {
+    addr >>=3D 2;
+    if (addr >=3D MCHP_PFSOC_MMUART_REG_COUNT) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: read: addr=3D0x%" HWADDR_PRI=
x "\n",
-                      __func__, addr);
+                      __func__, addr << 2);
         return 0;
     }
=20
-    return s->reg[addr / sizeof(uint32_t)];
+    return s->reg[addr];
 }
=20
 static void mchp_pfsoc_mmuart_write(void *opaque, hwaddr addr,
@@ -44,13 +45,14 @@ static void mchp_pfsoc_mmuart_write(void *opaque, hwa=
ddr addr,
     MchpPfSoCMMUartState *s =3D opaque;
     uint32_t val32 =3D (uint32_t)value;
=20
-    if (addr >=3D MCHP_PFSOC_MMUART_REG_SIZE) {
+    addr >>=3D 2;
+    if (addr >=3D MCHP_PFSOC_MMUART_REG_COUNT) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: bad write: addr=3D0x%" HWADD=
R_PRIx
-                      " v=3D0x%x\n", __func__, addr, val32);
+                      " v=3D0x%x\n", __func__, addr << 2, val32);
         return;
     }
=20
-    s->reg[addr / sizeof(uint32_t)] =3D val32;
+    s->reg[addr] =3D val32;
 }
=20
 static const MemoryRegionOps mchp_pfsoc_mmuart_ops =3D {
--=20
2.31.1


