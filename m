Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC92756437F
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 02:34:14 +0200 (CEST)
Received: from localhost ([::1]:37180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7nZ0-0008KE-1t
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 20:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nF3-0000pb-MC
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:13:37 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:46191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nF1-00021g-Qc
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:13:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656807214; x=1688343214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=trjbl88ky0sGG/muJvpQZxcW4cE0pwW8mhBbBDB/fRw=;
 b=gvaccfpW8FCi8Cx7KDKuir2HzBYKOEXGLMpacrDyPL3ba4LlgmXiPa5F
 EB7pDNrPJrADVwMM45DV+MXhGpGSJg4EGArwcqFKGxLlejHQQhnXrhwNw
 1iDIx2qYC3JSdnzb+hqGb+nQyoaNbLfc9Boz7tU63o7/5CMoM8UP3VoOC
 ndQAxYu52XWNPjN+5GF3xbxUe0DcROwaIhgreBqtHoS4a4j/sH5A5kyHG
 zxu0t+W1gg2Mc3mazUMKz4OGQ2KXuuC2BZ3kJPOmYrFarj/1SatiL9hQs
 MYiU9ywXlNH43jddeR9ItHgZNOO4OZjSJbfeLk0NBLFH6jI73vc00yAHz Q==;
X-IronPort-AV: E=Sophos;i="5.92,241,1650902400"; d="scan'208";a="204667266"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2022 08:13:15 +0800
IronPort-SDR: YU1JJqdAvEhNBgyOLgdZ825u+SPVdgYtksCEhMQghHsr3sYnv5faHd68pvxYHoKs4qVSCRARr/
 u5hufCVLNqbTehl0YUX5fSdXcCChfHqcOtczhMzYgB/HzjeyrBlkLKnKjgY/am1IOD4YPuLSct
 n/u2jRsY82wL4PB6PxCOroDH++Ct9vd5llF/ATOfLzpEgIF0yTQOL/W2gsf/K37o2iwt0nV8+1
 n8uuwunDolt2rkdZFTQeqUUIHibzHoVVXFr+yIUj3NBxEwAQD4dhxlYx/MORfZbW83AuBwHpMp
 65KFf9OLhb25eVFWi8r7h2b7
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 16:30:38 -0700
IronPort-SDR: Fxhs9sf9GQ2JN4dcjNgxNo0ov6eTCoMQHRISp6dOipq3sN9TDMZUne137/JFktQYb773nNUiJ1
 JElLJlGh3d5KopDeOLLKAbNVd/XfHXiAsgI7hoC0IJFomTgA/19GiRbpqx7GQrSODqp0QVdT81
 Gb+gsqYRoR6zGnuM8R/jBd5D45G3IfF//o+T6DJ4Mw3Py5udX25uT6uGWYqOFPo4Kb8YTZVkNS
 f8q8zoM4AdNUThYG930rJ1FdQULBdFcQ1k2fZC5tzu3B08HfGvHWDeh+NhKC6YcFl7ySXzeONq
 Pzo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 17:13:16 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lb8Xr2dk8z1Rw4L
 for <qemu-devel@nongnu.org>; Sat,  2 Jul 2022 17:13:16 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1656807195; x=1659399196; bh=trjbl88ky0sGG/muJv
 pQZxcW4cE0pwW8mhBbBDB/fRw=; b=Wwinz60RxBiPjq1NXrDcmaM4tfOOFQ4FLV
 itUqLAOClCs17rvarjlDQppHA8Mtva7IGr8APuzaFTgaPsuwFMxH/4C3I7k3hpE2
 wBO+ApUDGZA8C040rPE5XCQTbQmsV0zY6VV2sm58oAPT7oQ8BHmnPlL5Aw0Ey3kn
 eulXXbJ0kT5eAK2rZ9T3EyjG5sjRxv6CyZ/8DzUaK5Qvbd1+Aw9rixKi5c0QejlD
 orXz9N2HviUIKGq4jc5PyUIAypRcGzNtnOTWmUq1yStWL9c9v3+4FMgfC6+vhaCr
 fgkgguEBn1C8jiGm20MyJ0r9HVVj0Me7l45nOKPml/lOY+Jzud2g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 1KrqrpYZIDjZ for <qemu-devel@nongnu.org>;
 Sat,  2 Jul 2022 17:13:15 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lb8Xp0Q6Sz1Rwnx;
 Sat,  2 Jul 2022 17:13:13 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PULL v2 16/19] hw/riscv: boot: Reduce FDT address alignment
 constraints
Date: Sun,  3 Jul 2022 10:12:31 +1000
Message-Id: <20220703001234.439716-17-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
References: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=176813b30=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <20220608062015.317894-1-alistair.francis@opensource.wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/boot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 2d80f40b31..06b4fc5ac3 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -227,11 +227,11 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t =
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


