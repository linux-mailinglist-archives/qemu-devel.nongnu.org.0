Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 301EC542171
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 08:23:36 +0200 (CEST)
Received: from localhost ([::1]:53998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyp6N-0001tC-3u
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 02:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=15114fb85=alistair.francis@opensource.wdc.com>)
 id 1nyp3N-0000Vz-7I
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 02:20:29 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:51943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=15114fb85=alistair.francis@opensource.wdc.com>)
 id 1nyp3L-0002rD-5K
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 02:20:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654669227; x=1686205227;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xmD9ihWfTEMvHrmO7KryZ+Excz+d1MBSVj2SG7ICO8Q=;
 b=QpPbmRf095Xrz4Rq+P2+Jocq8KWTsVOg9utqVxsf6HwyHsP+0C9KN1jj
 fzzj0sKDidpVOyBy/ukGDhtnl39YDqikmRjA7HYmDfY+/9V9TJYTIgAAj
 9cs5UnE58wDu0+GdXsuUo+Sj3JPdKWDWXvw2lijRnSyWTcHX8DqI0tLoJ
 Kkye84/99anF8JH5FiBcyBJABeZaLFgxBMYIY3JiJk4SGAvglvoUOLBnm
 +hlDCmOtlrdmp4VPFL2h8YzJLxrqPYSf3av68RKm2wMfFmGg4zKfq12o4
 loNFSNlzMgKrFa1MgKVvCR7zXJ+/V9j0k7p6lCf7vo+jiQtaUc5zfInAC w==;
X-IronPort-AV: E=Sophos;i="5.91,285,1647273600"; d="scan'208";a="314614962"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2022 14:20:25 +0800
IronPort-SDR: wAejAmNFWFtFRIxfdlM+noWkSpX+lGWS+MSEpcFc1fQfA6W5S4fvtWtOEfV2BwXszcqPKc/K4E
 vJCkPM6YurbsUKWtaLha5Nx8qNcio8jQVS9qjqVBUDSqG4PFKdFWtIIiSsnb7vAxTizZ2hQTpO
 VWdMAD6uB3VuGCBV6G5ix360PdFrsWQqDoO6Vw8Tup5NwTYEwUOP2zfPK+oF4GlVk3m39nGnXq
 tkcMzBNU4wSVLSKy57q50DRUS7O2fc2a4XV6JGE2TGOSEMT0PnzWt/r3HWMVXM3VsMQ99Skok8
 7QVm8KjLjNy2pieurAkuE+iD
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jun 2022 22:39:14 -0700
IronPort-SDR: yNQ27b4DpwpVDT7Aun3jWoCQ5ldKMPoT9/QyzhS73tJ0FtpZ7Fy++tOd+C3a6BeqF7aM0VTe3c
 rh3EIJ1BETT6I7TODW7M6I+VL10vQVpaQXHgD2PsDRxUAMKl0qLXB5dm1LG5Yw+pGgtWK0GZFO
 Zu13Kt1+fOTQsNB6zZU6jXJSrvIAbS5lkuzEMf2GUtTcEMnxFUeVaaP2AIFpuBnao0WD0sx1TB
 kMfiLm0J3kWRfBR0b8gqeaXx13YpmvcgnSA8hpP84Gw5PNZRxsxi83mKNdFX2x7eAhNGROep6a
 370=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jun 2022 23:20:25 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LHxt05vYGz1SVp2
 for <qemu-devel@nongnu.org>; Tue,  7 Jun 2022 23:20:24 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1654669224;
 x=1657261225; bh=xmD9ihWfTEMvHrmO7KryZ+Excz+d1MBSVj2SG7ICO8Q=; b=
 C+ujj8TPi/fMmOPcAb+qavxb4Y+DG8gR19Mdi2w08XtzRt0y4POkx96KACL1an0v
 996xxOnNq4+vp3S6h2rFOgZey3f1S3Bv0LRgrRwPwbNBX7iD0b2t61yQ9tVqvF9L
 GffC4vWO6dg7M8apnuOzL4tPSa/a04D5HUnu78XHJOVzHjogBL0y8nz7LPuv9UWf
 1yBc2TyobOhgqNhHt4O04ePN9Lm/W9bY+/pcFLJAj2b3wH5xhD4VEpQiWixroAe0
 p64KM8WpzGx2pxpc8F/IxnPFTyeWKL3VKUY3yVT5FtdUprgjUWCAhFoyladTA2WN
 pT19txeiLWOONCKnrlD7ig==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id NhkgfvflWHrC for <qemu-devel@nongnu.org>;
 Tue,  7 Jun 2022 23:20:24 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.12])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LHxsw1Qc6z1Rvlc;
 Tue,  7 Jun 2022 23:20:19 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 bmeng.cn@gmail.com, alistair23@gmail.com
Subject: [PATCH] hw/riscv: boot: Reduce FDT address alignment constraints
Date: Wed,  8 Jun 2022 16:20:15 +1000
Message-Id: <20220608062015.317894-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=15114fb85=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

We previously stored the device tree at a 16MB alignment from the end of
memory (or 3GB). This means we need at least 16MB of memory to be able
to do this. We don't actually need the FDT to be 16MB aligned, so let's
drop it down to 2MB so that we can support systems with less memory,
while also allowing FDT size expansion.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/992
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/boot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 57a41df8e9..e476d8f491 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -226,11 +226,11 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t =
mem_size, void *fdt)
     /*
      * We should put fdt as far as possible to avoid kernel/initrd overw=
riting
      * its content. But it should be addressable by 32 bit system as wel=
l.
-     * Thus, put it at an 16MB aligned address that less than fdt size f=
rom the
+     * Thus, put it at an 2MB aligned address that less than fdt size fr=
om the
      * end of dram or 3GB whichever is lesser.
      */
     temp =3D (dram_base < 3072 * MiB) ? MIN(dram_end, 3072 * MiB) : dram=
_end;
-    fdt_addr =3D QEMU_ALIGN_DOWN(temp - fdtsize, 16 * MiB);
+    fdt_addr =3D QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
=20
     ret =3D fdt_pack(fdt);
     /* Should only fail if we've built a corrupted tree */
--=20
2.36.1


