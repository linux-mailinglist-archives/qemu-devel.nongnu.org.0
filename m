Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDDE5FEA80
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 10:26:12 +0200 (CEST)
Received: from localhost ([::1]:41224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojG1D-0005Mk-77
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 04:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2798045df=alistair.francis@opensource.wdc.com>)
 id 1ojFbU-0002k4-O3
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 03:59:36 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:22690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2798045df=alistair.francis@opensource.wdc.com>)
 id 1ojFbR-0001vA-PY
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 03:59:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665734373; x=1697270373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1KSugr9xxt8qoIzRpAot4UiGRS178nJLKyg5mjuCzjI=;
 b=ltRsOpq15wL3d3ArQ0oVlsidN28kj32eia7B9dYDRZif48k28uv1K6uS
 I1OWtnuwjmhZymwpONMnnSftVim99ANVV8OWp9vsGGEMI1+nb7jSzQLG6
 0MRfYeGH7vgO+7dcVgfnI+2xSPOzGK7I45q76/MayDafoEuygS9OKwllR
 eOQlR1diuCAvwUKhWNJnw9EM5fuwJFEE+JswZCIdK7bcZIkwszKh0sEVO
 eRWbCkEQtb5a25MbdOYivYvzI1tkaKZGsWgMsmJApfhRzoJE/Ao+mYRTP
 pbC6GHO7j8mZc3l4pmWdMu2Im8fBNXheV/PN1+0KXpT/qOfMtGY/ZI4Qs g==;
X-IronPort-AV: E=Sophos;i="5.95,182,1661788800"; d="scan'208";a="218968380"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Oct 2022 15:59:32 +0800
IronPort-SDR: cExGqevxgXBe8ges9S89zZghinsOUt8kgT9TlJUcK/VSAhsoakV6NJaRc5MXQq/3lYqL/CflNL
 IHSbcfpZ8kAIPv+UlZB4bEkj8BR4/wdZ20kzwpsuX9Kti6IsssYN+21zxt73LE4IgP4KCU8ZpL
 7twXueGJu86zI96fvipQG1Qqt3vq3zDvE4vrVE0kSEUVf8rJrme4FoOkFZKHxiibrHmiD/10QF
 ugpRuN38xP5yqaIv/++i7XLtq7j+4xuhqidWuuOac5IX9HCqxXHpCgErO7BvHWTu0iFZM80hgf
 +6mOUaS0R9GyO6fNRp85Z+x3
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 00:13:31 -0700
IronPort-SDR: 3LmKNnamjfmL2gpsNf/Xa7loEkBHAP5ZV3gAvLy+/iu8USuv+bcPL1YQo2miX+ZuiqUHzJutVW
 GuMKHfGbhIDHDWjr/pNsUbiM8iN9E6Ls8noCwe+snNHGosZJFz4m1HPJpQOvDbIhJPc8LJk1CS
 h1vaTB11e5gWn75W67it0N8oXzH3hWHXZ15xI/i0SXSfJ63CBTpItjLRhM+fS/epUXKT9iAomk
 wq7TXrZew9iyqm0HJ2NPmM4yVGMaxP/ZfEbslLm4yAQLIUdtY3yCIQBmjQyHP337jixFFRnlDo
 iZY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 00:59:32 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mpf1J0zHjz1RwqL
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 00:59:32 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1665734371; x=1668326372; bh=1KSugr9xxt8qoIzRpA
 ot4UiGRS178nJLKyg5mjuCzjI=; b=f94WoA8PWRR2B7XI3CSfQKRBUEQC8KN640
 4T58cu4v+Q/ESoaFWCcK1sNU68Q7AK67RwROiEGoryJBXR/EyMZ9V1ytIY7s4yUa
 M+YjSJ8h2abhZyCjYKRRyhrhEShgWcr1EM7FBy1VMTbu+/0HOTc5qQKeRHdgMEk4
 RBCDNLEWCR/4SnxYSAiP84DheXxFeVvjUuCXZkEkowb9CRRc4dozZKJDGQXCUE8v
 LiC4TK5C2MycJA/mwML9nKdVSbnVh8+EvvsKfmw4TpdlwRwcYMYle0QLqXmCDhBo
 1tjpFxItGwLNiLwfOPTmhyP7iGw8GSDis3XhJ+MPSTN3kB3KvZqA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 90g9CUnYzerA for <qemu-devel@nongnu.org>;
 Fri, 14 Oct 2022 00:59:31 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.19])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mpf195lYRz1RvLy;
 Fri, 14 Oct 2022 00:59:24 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Sunil V L <sunilvl@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 06/10] hw/riscv: virt: Enable booting S-mode firmware from
 pflash
Date: Fri, 14 Oct 2022 17:58:26 +1000
Message-Id: <20221014075830.914722-7-alistair.francis@opensource.wdc.com>
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

To boot S-mode firmware payload like EDK2 from persistent
flash storage, qemu needs to pass the flash address as the
next_addr in fw_dynamic_info to the opensbi.

When both -kernel and -pflash options are provided in command line,
the kernel (and initrd if -initrd) will be copied to fw_cfg table.
The S-mode FW will load the kernel/initrd from fw_cfg table.

If only pflash is given but not -kernel, then it is the job of
of the S-mode firmware to locate and load the kernel.

In either case, update the kernel_entry with the flash address
so that the opensbi can jump to the entry point of the S-mode
firmware.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221004092351.18209-4-sunilvl@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/boot.h |  1 +
 hw/riscv/boot.c         | 29 +++++++++++++++++++++++++++++
 hw/riscv/virt.c         | 18 +++++++++++++++++-
 3 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index a36f7618f5..93e5f8760d 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -57,5 +57,6 @@ void riscv_rom_copy_firmware_info(MachineState *machine=
, hwaddr rom_base,
                                   uint32_t reset_vec_size,
                                   uint64_t kernel_entry);
 void riscv_setup_direct_kernel(hwaddr kernel_addr, hwaddr fdt_addr);
+void riscv_setup_firmware_boot(MachineState *machine);
=20
 #endif /* RISCV_BOOT_H */
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index f6e8eafa28..e82bf27338 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -338,3 +338,32 @@ void riscv_setup_direct_kernel(hwaddr kernel_addr, h=
waddr fdt_addr)
         riscv_cpu->env.fdt_addr =3D fdt_addr;
     }
 }
+
+void riscv_setup_firmware_boot(MachineState *machine)
+{
+    if (machine->kernel_filename) {
+        FWCfgState *fw_cfg;
+        fw_cfg =3D fw_cfg_find();
+
+        assert(fw_cfg);
+        /*
+         * Expose the kernel, the command line, and the initrd in fw_cfg=
.
+         * We don't process them here at all, it's all left to the
+         * firmware.
+         */
+        load_image_to_fw_cfg(fw_cfg,
+                             FW_CFG_KERNEL_SIZE, FW_CFG_KERNEL_DATA,
+                             machine->kernel_filename,
+                             true);
+        load_image_to_fw_cfg(fw_cfg,
+                             FW_CFG_INITRD_SIZE, FW_CFG_INITRD_DATA,
+                             machine->initrd_filename, false);
+
+        if (machine->kernel_cmdline) {
+            fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE,
+                           strlen(machine->kernel_cmdline) + 1);
+            fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA,
+                              machine->kernel_cmdline);
+        }
+    }
+}
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index de2efccebf..a5bc7353b4 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1274,7 +1274,23 @@ static void virt_machine_done(Notifier *notifier, =
void *data)
     s->fw_cfg =3D create_fw_cfg(machine);
     rom_set_fw(s->fw_cfg);
=20
-    if (machine->kernel_filename) {
+    if (drive_get(IF_PFLASH, 0, 1)) {
+        /*
+         * S-mode FW like EDK2 will be kept in second plash (unit 1).
+         * When both kernel, initrd and pflash options are provided in t=
he
+         * command line, the kernel and initrd will be copied to the fw_=
cfg
+         * table and opensbi will jump to the flash address which is the
+         * entry point of S-mode FW. It is the job of the S-mode FW to l=
oad
+         * the kernel and initrd using fw_cfg table.
+         *
+         * If only pflash is given but not -kernel, then it is the job o=
f
+         * of the S-mode firmware to locate and load the kernel.
+         * In either case, the next_addr for opensbi will be the flash a=
ddress.
+         */
+        riscv_setup_firmware_boot(machine);
+        kernel_entry =3D virt_memmap[VIRT_FLASH].base +
+                       virt_memmap[VIRT_FLASH].size / 2;
+    } else if (machine->kernel_filename) {
         kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_ad=
dr);
=20
--=20
2.37.3


