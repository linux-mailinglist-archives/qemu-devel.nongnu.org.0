Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C24D4674E90
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:46:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm1w-0003Ey-Tq; Fri, 20 Jan 2023 02:41:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm1t-00032K-Qf
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:41:42 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm1r-0004qg-9u
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200499; x=1705736499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EhCTA0uOIpz+G/q3i9pexF41wYJQaVRzdVObkvGZqwE=;
 b=Rc1kGjj31yxfjyOP8E7t8Faxd67wzQaeDQAZDCVr6u0W264Vo9vbRx3+
 GGOueAJxK4ZvCMRYlMsW4EPWU1AswzQEFjSJqldihk/x0RB7oGS7FCsz9
 ks+M5t9CzvYkiNjnCFkE0ODq4EdIj/O95xeTZS2Y1wiyJpHhcLYwv8+TY
 PLi0IC7/qg4oMakrf9pBsSOC/ckcVneCpovjH4nXcCAThqPXXe6Va4N/d
 NqT2UNvctunj3Z8WJYwmgfqvrKMA9AJqwDoft3Np6HJPIod46CpQqkgIW
 46O5ybrIj5Wd9q45jhfhJWGdDzj/ZisoM9Rl3A7klT+89CwB2hKxri8GY g==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176780"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:40:37 +0800
IronPort-SDR: 6q+tEQgoMHvlODg47qDRgfO/I8c15xwuwYUCNeML6707wchU22M6/COuogykTpvoTzrBKja4ZQ
 RKwYfnMUpA2bdZgEIkxIUfF0EvEQgTCDoPZmYfjJeKXDLppZaSK9OraWA1ane/WH7ewj2WVPdN
 9YO4NUgrICOmFvicUXWUDY6KKfo5UFDEj0zJI5GoYn/3UAFS2ailvQMKp6m+5AByPOhb4VzIsf
 v5yY6ishXC5xOIbyyVEIYjSA3OV1/53m/3vqwjZsN+8NsUHwiFdw+C9MA9aLNWEsiMAYrds/Wn
 gdA=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:58:15 -0800
IronPort-SDR: Nkp7J11QxPl57VQjExKTBWEG9tKqZ/ld4CogUwD758NYF1hK+DhgllkKu9ktbvQzltsBm1DmCj
 3F0gzjfVblT1J9oz30ZlANZsCdL60VHZX6mwv2irRH6gfv3EIxBsymh0yV+2NeegiWSgSCrOwR
 IKW53+QhHWSos/YMG8mBuFG9FbxyNVmVI4CdUBYlF2r+U/zj+Cabn4M46LAoqPK/0yOJQ/ZIBO
 MaBF70DNYM9kPuupi0JS4OMoXakExRj2Mu+aYpAUHG6M9QfL0XoH7qz3yU6yi4vzsa+mo7hCNq
 MKQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:40:37 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NyryF1B4Sz1RwqL
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:40:37 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1674200436; x=1676792437; bh=EhCTA0uOIpz+G/q3i9
 pexF41wYJQaVRzdVObkvGZqwE=; b=hHqeyZi1d6OZd2ePA7tpbW3HoyzeUDENw1
 4w2vKVrQHFHJZ326/40XZgV1AhMAHkn+LEhN+RN9IqCao9hq5gMor+oUvj7IbOAO
 sb+xi5wh4JyUBcBI23BKMFp1Hs8o7cIWm19G65ydNRapFmLtAvaWeKpgvoYwK6gk
 wSEJgIN2qWbx3Z6wgB7Sh3Zz4ng8Md/mfgeuK6ljaNneBf9XdIPRAWMi2lr8fhjx
 8KSGV+Zc3SfQzadXqGfXLzGtkRLbYD8Uai/4sCMqUGJKexkbrH5zQjpBTRujXlCI
 JL+mmx9DZmBHeWGX1hjENkACiPiwEQNt6DpEK05WmLxF7I1Uykow==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Uwon3CgO8G8m for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:40:36 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NyryC2N44z1RvTp;
 Thu, 19 Jan 2023 23:40:35 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 37/37] hw/riscv/virt.c: move create_fw_cfg() back to
 virt_machine_init()
Date: Fri, 20 Jan 2023 17:39:13 +1000
Message-Id: <20230120073913.1028407-38-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
References: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=37747d9ec=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Commit 1c20d3ff6004 ("hw/riscv: virt: Add a machine done notifier")
moved the initialization of fw_cfg to the virt_machine_done() callback.

Problem is that the validation of fw_cfg by devices such as ramfb is
done before the machine done notifier is called. Moving create_fw_cfg()
to machine_done() results in QEMU failing to boot when using a ramfb
device:

./qemu-system-riscv64 -machine virt -device ramfb -serial stdio
qemu-system-riscv64: -device ramfb: ramfb device requires fw_cfg with DMA

The fix is simple: move create_fw_cfg() config back to
virt_machine_init(). This happens to be the same way the ARM 'virt'
machine deals with fw_cfg (see machvirt_init() and virt_machine_done()
in hw/arm/virt.c), so we're keeping consistency with how other machines
handle this device.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1343
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230117132751.229738-2-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index e6d4f06e8d..4a11b4b010 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1254,13 +1254,6 @@ static void virt_machine_done(Notifier *notifier, =
void *data)
     firmware_end_addr =3D riscv_find_and_load_firmware(machine, firmware=
_name,
                                                      start_addr, NULL);
=20
-    /*
-     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the d=
evice
-     * tree cannot be altered and we get FDT_ERR_NOSPACE.
-     */
-    s->fw_cfg =3D create_fw_cfg(machine);
-    rom_set_fw(s->fw_cfg);
-
     if (drive_get(IF_PFLASH, 0, 1)) {
         /*
          * S-mode FW like EDK2 will be kept in second plash (unit 1).
@@ -1468,6 +1461,13 @@ static void virt_machine_init(MachineState *machin=
e)
     memory_region_add_subregion(system_memory, memmap[VIRT_MROM].base,
                                 mask_rom);
=20
+    /*
+     * Init fw_cfg. Must be done before riscv_load_fdt, otherwise the
+     * device tree cannot be altered and we get FDT_ERR_NOSPACE.
+     */
+    s->fw_cfg =3D create_fw_cfg(machine);
+    rom_set_fw(s->fw_cfg);
+
     /* SiFive Test MMIO device */
     sifive_test_create(memmap[VIRT_TEST].base);
=20
--=20
2.39.0


