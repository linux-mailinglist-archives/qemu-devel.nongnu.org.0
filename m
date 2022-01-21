Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE38495BDB
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 09:24:59 +0100 (CET)
Received: from localhost ([::1]:44658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nApEA-0005Kl-Bo
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 03:24:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0V-00089K-VR
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:44 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0T-0004KU-ID
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744961; x=1674280961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JoSHtMShyGQPRyscEFgCR6aqZqbwnh9BL+qXQLCZYsE=;
 b=iPMtPB3cwUopcOFcdsmd4SIaWh5BRR2YYNbwIBK64XUNpEmARQPvt3ku
 UxnHf0YNgIhQcBX5FH3G51S8PEiomiBs6wrAWFREadkbC9MCsniRmY5lg
 opv+TlJByLH1fPtkTluL39qvHJ8Ti3S2nTbJQuz5DnpoGTLouxJirsQpN
 2DodgsuS25Ek72XkQTcqajdsQ7VcElObITzJoJzai81CO8lNqV3oY4o9T
 Bh6f94gQ3py7RqA+pYqiWBt14wIzvAg0/OSHJpMyqV4K0aeL/22pnuxwI
 loZUaLB8nybD8FyPz0cfw121y7vOnujGYPl4/n3AO/a48mgApkYih6fjr g==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295083028"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:01:16 +0800
IronPort-SDR: NuPebrCVpR+IxdDQ0Z257W1WJ0gH3dold7rmWBo/tbZ//cr/d9VjOg2U8nZLJBSozhC4A5v6TB
 sZtBuxhtRkGqYOoEir09KqApFuf140SoOUcCYDsrcO262+VXyVzCdVEVO3AHHjKP5y4GpMZgYv
 hbhp5XjVljYn6eGF8gE+R4x0+vsDys1WmaMUbCGop2rQo4xnSgWInNuteR9/KoFZB68pfyI3Os
 7TYfm4+7GuMQXNz2fdvFESdHTcNRM65GviXnhzaX9AX59Fa96hbJ/IsndF1+ewW7HS9ShEzf7Q
 /qWMI6cJnCxhaql8fd4FZYa3
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:34:44 -0800
IronPort-SDR: Www/BBvQQ8kCh4m/jdXYo/GZlMFmYm3O5GSm9zpzPHJmb38UDDCqjq0kEnnbugfhup8tUCBhKY
 /M+xuDgXMezg1xI7V0BtNa5it9zDgGu+Qrs+Plf8pkIgOdqhQTV1Z7RBy+K1QyALdZWRZ97jMq
 zyQSDOgQrcetyg+zRb2M6aHhFYJGqP0errTqbqDnaLKWkaFOdoKCWcFV2w/2w3gxF1iedWytnY
 MJ3LDGVOJjCWOxPFClWcG3DCXo5D0fIFBeOBYafc15OU0Si9t20TTORAM1FY6kbwhjANQVHXmN
 Vsg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:01:16 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7zc3F9Sz1SVny
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:01:16 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744876; x=1645336877; bh=JoSHtMShyGQPRyscEF
 gCR6aqZqbwnh9BL+qXQLCZYsE=; b=hVfZx/2IrOhkgL5EHUMS+4R72W6/6UGl1O
 KfSTwNdDDGqmIgfbyQUrfZnuUsQZbxMn0j2TiquN2p/Y1GLytRA3FVIUgqSl1+Zs
 trmgB0hldEsR4X+r0MLnLZXdDnW/YFU+23AEp5jwxLKB/gMTCfVZKBNwIZxyw43P
 vM/cJwsVSsobTnloSaxVCNu3QlnCLLiHFmxiSc/4oqBfts+nmv1sTppkPGOJXzi4
 gDx+PXskoxAftooG2m9at5APW0SVhUwkUBRQ3KCGyCMR3aK+/t+ByrduL00oGlxh
 /EdhfTAxijtsJJJkL7GLYCjF2W3frkRlDqdMQ2nEYanvU52vAEJw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id YXww3FCt6zZ9 for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:01:16 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7zX3R8Tz1RvlN;
 Thu, 20 Jan 2022 22:01:12 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 37/61] hw/riscv: Remove macros for ELF BIOS image names
Date: Fri, 21 Jan 2022 15:58:06 +1000
Message-Id: <20220121055830.3164408-38-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: Anup Patel <apatel@ventanamicro.com>

Now that RISC-V Spike machine can use BIN BIOS images, we remove
the macros used for ELF BIOS image names.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/boot.h | 2 --
 hw/riscv/spike.c        | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 5834c234aa..d937c5c224 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -25,9 +25,7 @@
 #include "hw/riscv/riscv_hart.h"
=20
 #define RISCV32_BIOS_BIN    "opensbi-riscv32-generic-fw_dynamic.bin"
-#define RISCV32_BIOS_ELF    "opensbi-riscv32-generic-fw_dynamic.elf"
 #define RISCV64_BIOS_BIN    "opensbi-riscv64-generic-fw_dynamic.bin"
-#define RISCV64_BIOS_ELF    "opensbi-riscv64-generic-fw_dynamic.elf"
=20
 bool riscv_is_32bit(RISCVHartArrayState *harts);
=20
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 597df4c288..d059a67f9b 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -260,11 +260,11 @@ static void spike_board_init(MachineState *machine)
      */
     if (riscv_is_32bit(&s->soc[0])) {
         firmware_end_addr =3D riscv_find_and_load_firmware(machine,
-                                    RISCV32_BIOS_ELF, memmap[SPIKE_DRAM]=
.base,
+                                    RISCV32_BIOS_BIN, memmap[SPIKE_DRAM]=
.base,
                                     htif_symbol_callback);
     } else {
         firmware_end_addr =3D riscv_find_and_load_firmware(machine,
-                                    RISCV64_BIOS_ELF, memmap[SPIKE_DRAM]=
.base,
+                                    RISCV64_BIOS_BIN, memmap[SPIKE_DRAM]=
.base,
                                     htif_symbol_callback);
     }
=20
--=20
2.31.1


