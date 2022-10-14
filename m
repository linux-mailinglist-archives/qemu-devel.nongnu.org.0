Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 058EA5FEA4D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 10:18:04 +0200 (CEST)
Received: from localhost ([::1]:50796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojFtJ-0006rR-1H
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 04:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2798045df=alistair.francis@opensource.wdc.com>)
 id 1ojFbL-0002i8-Dz
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 03:59:31 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:22682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2798045df=alistair.francis@opensource.wdc.com>)
 id 1ojFbJ-0001uT-7W
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 03:59:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665734365; x=1697270365;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uhHBEKP/dll7L6VUrEL2zX04WJ9DjwyEHy6axA8GjQ4=;
 b=WpKvvI4ynguGs0kmGbk8CtixqjQAQOcW/fgBOCCo+MrmLDLLl8OQLXKt
 a1xu+dIl2/OhDgwv9HkBx6Qv+BZAu27N/VMaiGrLG8TnJBSrX13xOF8gN
 b5sp42LBLooLRPRJxFs64hOpVEWSpFOzLn7w8LdptdZ1eeHADYnnmzxZe
 OxlHOV3RweXyz1OU/5CESzO0gg0qRivdjhNKDpgf6iYkaIhW0INDWmK2o
 d9Tgh/ZFkughh5ot3e2h70lqz7uL8/fRqTH8ERBdV04qgYIitJszVl4u1
 5IGvOnUEX1RB4Uk4nqerf3AkYTmBjnldsU0K9U9yCFnaiU8t2PwV+mnAA A==;
X-IronPort-AV: E=Sophos;i="5.95,182,1661788800"; d="scan'208";a="218968373"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Oct 2022 15:59:23 +0800
IronPort-SDR: KMJI5SazGweqcwW0Zw0qeIADwsjG5oV9XXYXWF6mY99NxzxOWlsCC8Rhrp6B/5N3fOhFk6BEgn
 /ve/254Y65jJYfJ5ey1tOd8YNJNT5oaPcNNmjtyNDiVUNrydAgPSU496VxGwZYLOE9P7K7mUc8
 V28E35oNCac/4QqkPFJWB7FEIyImB+c/VHfju6tEtZ09ahMJwKN482j64Q7N3SHBG3Rb9vX5Za
 uN/dI0WlgAWYGBkguqaDCoAabrkkNIQ2J+/BVq2Ix8mHFyvVy8+OgmCpD7Af+f7AYWmfv6aRx7
 J2h8kVs0oUhwXhjR3B7GtLW3
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 00:13:22 -0700
IronPort-SDR: GFEEMGE0C6WVMOz4rmCnnpx3VvDbBtPKOK7qJ5PGFxhqIBW5QkbM16Bq4sYFGADrcr7+BAJSPB
 t9vdz3GpkE8C2w5UEqdVkunS2+5D3Kq7tnB3agIb+F3ilQ4Dg31tbRgnBDLaPIBYBeQABcbVGc
 GqHMTB30rWWIDTbzAre4ao7pEwhhkk3tu1CQRbPA8zL1k/i5vcVeqk/eXiPpj8qxGkUqMnIwH8
 JQYQTrWmP96ckikbKgjxCTgbzoaZ5dp7BxxC1+pEPR9ZChcFZPLvokTRAp87mEI0mhuuPQdNOw
 oMc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 00:59:23 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mpf156tSjz1Rwt8
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 00:59:21 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1665734361; x=1668326362; bh=uhHBEKP/dll7L6VUrE
 L2zX04WJ9DjwyEHy6axA8GjQ4=; b=qY5glchox2+UBb/QFx3dohGKnD2pqiQEj+
 REbXML8qgo5+ELw5JLTCCjbP7qWhmG/YviPzqHjLZ3fs2vG2IaptRdcEQ2XKh8f1
 +F2Tf+yG3mfoT/piG2ighLBbkgtuhYP8p2hBhERzQidj5697WU/1fzelpPLMnsBe
 SMi1QmtmayOF+huIXgIZxUX6E+oI8Ljl/gCDTkngjSImWlhQYgeKwPW9dfF+P43H
 rA520rZHrvwYh6U4bArkzCjRBTjt7XzQF3eMMghcxkFXtnew0yJN3x1tsRtwQb8L
 drDZX/Y+neWDK6CdbhzJG+7s7xTb832G1tAe8vOhuptG+fX//qJA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id pfHsRQvNdc7N for <qemu-devel@nongnu.org>;
 Fri, 14 Oct 2022 00:59:21 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.19])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mpf0v5GhGz1RvTp;
 Fri, 14 Oct 2022 00:59:11 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Sunil V L <sunilvl@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 05/10] hw/riscv: virt: Move create_fw_cfg() prior to loading
 kernel
Date: Fri, 14 Oct 2022 17:58:25 +1000
Message-Id: <20221014075830.914722-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221014075830.914722-1-alistair.francis@opensource.wdc.com>
References: <20221014075830.914722-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=2798045df=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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

From: Sunil V L <sunilvl@ventanamicro.com>

To enable both -kernel and -pflash options, the fw_cfg needs to be
created prior to loading the kernel.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221004092351.18209-3-sunilvl@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index befa9d2c26..de2efccebf 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1267,6 +1267,13 @@ static void virt_machine_done(Notifier *notifier, =
void *data)
                                     RISCV64_BIOS_BIN, start_addr, NULL);
     }
=20
+    /*
+     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the d=
evice
+     * tree cannot be altered and we get FDT_ERR_NOSPACE.
+     */
+    s->fw_cfg =3D create_fw_cfg(machine);
+    rom_set_fw(s->fw_cfg);
+
     if (machine->kernel_filename) {
         kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_ad=
dr);
@@ -1300,13 +1307,6 @@ static void virt_machine_done(Notifier *notifier, =
void *data)
         start_addr =3D virt_memmap[VIRT_FLASH].base;
     }
=20
-    /*
-     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the d=
evice
-     * tree cannot be altered and we get FDT_ERR_NOSPACE.
-     */
-    s->fw_cfg =3D create_fw_cfg(machine);
-    rom_set_fw(s->fw_cfg);
-
     /* Compute the fdt load address in dram */
     fdt_load_addr =3D riscv_load_fdt(memmap[VIRT_DRAM].base,
                                    machine->ram_size, machine->fdt);
--=20
2.37.3


