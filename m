Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE26545B2A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 06:37:35 +0200 (CEST)
Received: from localhost ([::1]:35044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzWOs-0002r8-KB
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 00:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWFD-000331-OI
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:27:35 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:23579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWFA-00011H-Q2
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:27:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654835252; x=1686371252;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oB3R5NMAWtKu/5tdbSsPbN2ICARNBPSQ63u5w5klcpQ=;
 b=NBTEP8mw5kiYb1E9gVpYOYyO8u5toSioejV4/a9OqvGCBigr9ZShHeaK
 3tI2z65Wv6SpZ8Q5+6zKhZ7qTPwF7qaktLt7jS3U3f75k/EpQyyEMQ9Ci
 Ji0PjYCn68RdQ/vo5TRa+au8y3SVSd6inB5G/ncINIHCxejUSyo0wjFAt
 35PjX239XoYC0PgLEAmmXXXhUqxUo/4dAGVN+tqCtgthGoybLv2Fi6fAV
 GPPImuLC10cMKA0uAkw8dOee2fTHTxcn5x3ElHRRNqtYlBzHRmmtte/Js
 9/oVj6YTFsnurvYP7OXf0dAzSeDRuveTSRYsAVxuHbF9EBkCRZthrcMwQ w==;
X-IronPort-AV: E=Sophos;i="5.91,288,1647273600"; d="scan'208";a="307046430"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jun 2022 12:27:32 +0800
IronPort-SDR: 2+FnUu1D7jt97Ijxh6zxGz8fdc2JYUw4MT9CcaKTpd/rMXw1rheAifK8iR7KP5xH/5Pjbixwnv
 BcW2kNWtHFc7BvKvfeNBqOWVHuVTWEnMePMF4noxbzmOYDnzuoowhZti4xabvc7532gdkERSX7
 AL7v3R/5FLSVc+BtkDIbLepbxqgdMsuX5QgZc1Kq0M6+Y0vbIXp8QEEXENktigoWtwWp14PAG1
 TifC/5ylJkkoKBZdGwbsSItQq5GBoowLnA/IV11AJJ1KIsnr1oSWN9r6TkyMwpMSYunjuSMM08
 Iq1ccSsNyIc1ocTtBJ7vPPhn
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 20:50:40 -0700
IronPort-SDR: fWF3M+nG2+kgMr3njK++pESJuqizagIkFpmJzhyh+WOZv+Xy1wBmbfRP+MkjUKK/9r4UVBvwzb
 LEnLP8StmvvaOrGTfaHwFL2ktfjdwlHDy6wooMyh/xnlYuAWD9w3EBO/dgMSbUpYp7kh4svh7T
 3whk41Olt7rH26oVmlPuqE75OzvAw1mynhQK6jAIWDKHNWpiQk/vu87OJDwOB2mmXvAEanXIuH
 1chkghAew5cjaZEcA7ieXPP4X4w5oxT+a3MRmErITAnZ+Wd/sz9ZvxtW16doGQXz3EOel5HHuz
 oCQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 21:27:32 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LK7Gq5VGkz1SVnx
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 21:27:31 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1654835251; x=1657427252; bh=oB3R5NM
 AWtKu/5tdbSsPbN2ICARNBPSQ63u5w5klcpQ=; b=TReiGD15NgkZQ1S8RpfQ4hL
 CrTN10oM2pZj5aC/kWt336L4lW8ArdhTeVlVKY6jJWIQfGxc0WMIG+5JQFXiHNYV
 zRn51xaPX6YV08RWiTAaxlwe8JAbrzcXWxqBxoSMC8l8e5+eBwazCUdmECGblgfA
 IVpRvqQSPOwsc/ZPY0TVIGEv8STBD6nFcQy1hfNd17BM1S2xXY8yCX8Y34I5uG+4
 DvGDVCNUpNH9kA5YoakgM3jMUYKZTANBE51FK5w0f0mujzYgUc0DtJZWTNFigjug
 SkW3ZW1lpDyghl3urRwlNVf8hB8iPNE3CUtzZFLWyyRDFmDqmqfo9QzZM4mdSSw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id DiMokwfvdSPA for <qemu-devel@nongnu.org>;
 Thu,  9 Jun 2022 21:27:31 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.12])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LK7Gl4qSPz1Rvlx;
 Thu,  9 Jun 2022 21:27:27 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Mingwang Li <limingwang@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 04/25] hw/intc: sifive_plic: Avoid overflowing the addr_config
 buffer
Date: Fri, 10 Jun 2022 14:26:34 +1000
Message-Id: <20220610042655.2021686-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
References: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1538de18e=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Alistair Francis <alistair.francis@wdc.com>

Since commit ad40be27 "target/riscv: Support start kernel directly by
KVM" we have been overflowing the addr_config on "M,MS..."
configurations, as reported https://gitlab.com/qemu-project/qemu/-/issues=
/1050.

This commit changes the loop in sifive_plic_create() from iterating over
the number of harts to just iterating over the addr_config. The
addr_config is based on the hart_config, and will contain interrup detail=
s
for all harts. This way we can't iterate past the end of addr_config.

Fixes: ad40be27084536 ("target/riscv: Support start kernel directly by KV=
M")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1050
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Mingwang Li <limingwang@huawei.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20220601013631.196854-1-alistair.francis@opensource.wdc.com>
---
 hw/intc/sifive_plic.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index eebbcf33d4..56d60e9ac9 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -431,7 +431,7 @@ DeviceState *sifive_plic_create(hwaddr addr, char *ha=
rt_config,
     uint32_t context_stride, uint32_t aperture_size)
 {
     DeviceState *dev =3D qdev_new(TYPE_SIFIVE_PLIC);
-    int i, j =3D 0;
+    int i;
     SiFivePLICState *plic;
=20
     assert(enable_stride =3D=3D (enable_stride & -enable_stride));
@@ -451,18 +451,17 @@ DeviceState *sifive_plic_create(hwaddr addr, char *=
hart_config,
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
=20
     plic =3D SIFIVE_PLIC(dev);
-    for (i =3D 0; i < num_harts; i++) {
-        CPUState *cpu =3D qemu_get_cpu(hartid_base + i);
=20
-        if (plic->addr_config[j].mode =3D=3D PLICMode_M) {
-            j++;
-            qdev_connect_gpio_out(dev, num_harts + i,
+    for (i =3D 0; i < plic->num_addrs; i++) {
+        int cpu_num =3D plic->addr_config[i].hartid;
+        CPUState *cpu =3D qemu_get_cpu(hartid_base + cpu_num);
+
+        if (plic->addr_config[i].mode =3D=3D PLICMode_M) {
+            qdev_connect_gpio_out(dev, num_harts + cpu_num,
                                   qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EX=
T));
         }
-
-        if (plic->addr_config[j].mode =3D=3D PLICMode_S) {
-            j++;
-            qdev_connect_gpio_out(dev, i,
+        if (plic->addr_config[i].mode =3D=3D PLICMode_S) {
+            qdev_connect_gpio_out(dev, cpu_num,
                                   qdev_get_gpio_in(DEVICE(cpu), IRQ_S_EX=
T));
         }
     }
--=20
2.36.1


