Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C84932DDE67
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:08:10 +0100 (CET)
Received: from localhost ([::1]:60010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq8vx-0003O4-QK
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:08:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8pS-0004wU-HN
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:01:26 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:9925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8pO-0002GA-EN
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:01:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608271589; x=1639807589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bROvv1sYpscojN5ig6iYRttdbF9TwiO/rm25YagzCms=;
 b=UWZhml0gZO1+BNjBeLzSR8yHLlcSjVY9WKke/0xg7PBIXFFXC5+fNu4h
 KUOXbq5rmHyYj+T0T0U1H48+YK/2Dyj8YEtNSKoKZjpd89mT7XVnAnTKi
 7Y8To2lyCAGffvY0TlnxU5QmNQhuBRU+RG1bSfXgJokKhnEZPw63iKOKi
 qgMU8Ot1FCYwtVP7q/FAl8Jk6yd7o/4DxJTnDXusWJWBJxe1bb2RcHzqZ
 OdHDO2IARMlR/Oe4tum5lhz6kZIGz21KeDKcnXQxo2U/votkinFT8EMXL
 GSF0T/D9iosyX1Q6XeLlOtpdy4tzSCAkWEbzkvbQezmt63x/bvocULFH8 w==;
IronPort-SDR: WRfM73q+/nwkZYUlfljVWCe2iXcTXIZtQRp6szjx3199koTx1Nsvh1F0XMHWF0Poh6gdIby/OQ
 pyi4+fKXGosQkJQ5b7WZX6jYvcL3ukENUuTHJQcnOcCmmAVpoKrcH5aWcvMz5gQcB6T816/Vyh
 YuoqaxqfNbt56mmDQN6NDGPdReNQEYI1GrNuvq6M9Cp2crHOhRzwFppz/s/sqM3kY0pgrWVljq
 1pqZ2KrGCviBTO6vCEQTXUr3xmggvFz2j2Fem1l74W3If/um3rQpceJ0PVGzgPUFbWn8yy4mHC
 WVM=
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; d="scan'208";a="259237036"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2020 14:06:23 +0800
IronPort-SDR: BZu+hqW43UZEGEdTg2Awfj3a8dG2Gg+TxGkK2gLYxo8rv4u2t3t63djY0M3WgwKWZpAV4Qvhkr
 3abZA4fQoQUU0JFCyl3Ssh7bgSbEm0M827dVl9w2/aVs2isy3wT/ZzrkDAVQS4xZi7ivNFJcs5
 lsaz/IghYdUNWZahUirGfRoFmX3yqPgYeZGLgJYsBVLNsWuzPINiKx/EyZPaiAZVs+TSNI0WI1
 /icCjDUuQhvEeSeCepKrEQL1ZhGx5dfn9Go7RSBsEVBi/n3HONKuVHekwGewzrE3gEw55FSj7n
 SLdlY1AQuv5RGvhunAoAc6A7
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 21:46:34 -0800
IronPort-SDR: SfHD5PEQhs9fhmfI0Fr59uq7N25Tk39C1ApOXMWbEqOBu5qiriA2AR743lmYjTfhPPo5NERelS
 nmLxCu/It/w8xtQTcG1Apxr1cZrWMoIhMVRb+Sy9rCO+izvpb4rbKTUPWfGty0ITu046/XtNxU
 P9o7oQ5udS2IQ75dKzRTgbbGSVIUHUiwr8kmVseL2e7SJstIYt9PVTqi8nNeD37Tg2EccpKN3t
 X5hGI9Io9QvcNt4axaQar3cceE+ZmjR1x00JkOexq9NTS+KVP5BedEZZRD/bLUn4rQT9f9rRBK
 QJw=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.68])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Dec 2020 22:01:18 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 01/23] hw/riscv: sifive_u: Add UART1 DT node in the generated
 DTB
Date: Thu, 17 Dec 2020 22:00:52 -0800
Message-Id: <20201218060114.3591217-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218060114.3591217-1-alistair.francis@wdc.com>
References: <20201218060114.3591217-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=614e9c0eb=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

The sifive_u machine emulates two UARTs but we have only UART0 DT
node in the generated DTB so this patch adds UART1 DT node in the
generated DTB.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20201111094725.3768755-1-anup.patel@wdc.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_u.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index e7f6dc5fb3..a629416785 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -385,6 +385,21 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cell(fdt, nodename, "reg", 0x0);
     g_free(nodename);
 
+    nodename = g_strdup_printf("/soc/serial@%lx",
+        (long)memmap[SIFIVE_U_DEV_UART1].base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,uart0");
+    qemu_fdt_setprop_cells(fdt, nodename, "reg",
+        0x0, memmap[SIFIVE_U_DEV_UART1].base,
+        0x0, memmap[SIFIVE_U_DEV_UART1].size);
+    qemu_fdt_setprop_cells(fdt, nodename, "clocks",
+        prci_phandle, PRCI_CLK_TLCLK);
+    qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
+    qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_UART1_IRQ);
+
+    qemu_fdt_setprop_string(fdt, "/aliases", "serial1", nodename);
+    g_free(nodename);
+
     nodename = g_strdup_printf("/soc/serial@%lx",
         (long)memmap[SIFIVE_U_DEV_UART0].base);
     qemu_fdt_add_subnode(fdt, nodename);
-- 
2.29.2


