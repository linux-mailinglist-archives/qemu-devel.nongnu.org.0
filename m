Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4C2324DC3
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 11:16:51 +0100 (CET)
Received: from localhost ([::1]:42566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFDhS-0004Zi-Gu
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 05:16:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ashe@kivikakk.ee>) id 1lFDf8-0002iz-1p
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:14:26 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:53047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ashe@kivikakk.ee>) id 1lFDey-0008W2-GU
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:14:25 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 3690DEA2;
 Thu, 25 Feb 2021 05:14:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 25 Feb 2021 05:14:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kivikakk.ee; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=iddEhS1vbD+ynSET2V8OytL+my
 6yf0XFX9t0q1n1Qfs=; b=dmFrr9UbaA7pDOgnAdLBafFFMS1q9qvHoLyJZI0NjN
 hdKnZif1+G4QCVy7vCZg36hyRvWsxXm097+qD5K7BWw5N6an6rceLWbEGuSpqh15
 hl2UgZamg5nmYNnJIW4BlM+BasFjZ1x3mxtbf/wTWXr2v+0pgY7iAQwHDHILb/hB
 k9ivfRNktEEDZYRK4iNfh99fZDZjpapqmpGDVkW7kK887eL5IqKd4h4VXDbCaJpF
 tKL/8SeM9aX/4a9FvRpcXKxpBEUvb9LYgBOs24K04uRpwP2llSm/LEV8Wid7Q5z5
 mW89ksxiC0BfVtTfk4uz0C6dAOVdAoLb4Ldod+zJZnew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=iddEhS1vbD+ynSET2
 V8OytL+my6yf0XFX9t0q1n1Qfs=; b=Yu6VX4rdKXp4vwszCfdGM1w9NCVlb6dh2
 sl+KUY3hiSsAcF2XSpi8NyXy8tCRxEwC6LNrP+MiVWXlse3+fwpljgN7HmKrHSn4
 8qeQ8BBR33UMpkjetTMxHnTss0QODTMGOxG0SQidJOzBMdXPuMp2sjeLpVhFwf4q
 S9qu/OT8mmG2NmO+B7ZN/Jg/XgruePaYkEeuVfiCXSzNctBhCj00uEmdnCOSlQDI
 S8PoTl+dG5UtxS4dOBjkwPj5U0Y3pye8X/PJkYaLDb7ERaBtury6Fw5AmIvCyU52
 9HwQZnXYviHKHeY1oPPXVmCYFB49EsuYihdWYyjQhvZERxUoax1Zg==
X-ME-Sender: <xms:cng3YL_MTuhPu5iaqigERJtrkCowB-6Y7QQE-oA-3H7m0BvQVuKPhA>
 <xme:cng3YHvjil8UZJ6dg0V80tb10KehZEPmukJh82zf_p-YYXxJJQR56ijtNqPuopu6l
 9twH98r70wwTX50tKU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeelgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetshhhvghrrghhucevohhnnhhorhcuoegrshhhvgeskhhivhhikhgr
 khhkrdgvvgeqnecuggftrfgrthhtvghrnhepjeejjeelhedvuedtgeeuieekffdvtedvfe
 ejueffueettdeitdfhgfekieefieefnecukfhppeduudelrddukedrfedurddufeehnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghshhgvse
 hkihhvihhkrghkkhdrvggv
X-ME-Proxy: <xmx:cng3YJC1R816qWwqZYtVyurgaHWyT9OYiWxvF1mAeB0qArl8HB16tg>
 <xmx:cng3YHcaS1opweT_cgQBkouEYJe7_E4SGnxLoqS4ufGazI-nXk9msQ>
 <xmx:cng3YAPzuL-G_Se6fOXM8ffbUcvwJxIbB-H5D5v0ZdMJhuXLnE-aLA>
 <xmx:cng3YLbqu0m1vZgynCnCpNrGdY9BS_rtBlnKJhVzN-vF6ajp1_NgUg>
Received: from tapioca.tomodachi (119-18-31-135.77121f.mel.static.aussiebb.net
 [119.18.31.135])
 by mail.messagingengine.com (Postfix) with ESMTPA id 65FC0240057;
 Thu, 25 Feb 2021 05:14:09 -0500 (EST)
From: Asherah Connor <ashe@kivikakk.ee>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/riscv: Add basic fw_cfg support to virt
Date: Thu, 25 Feb 2021 21:13:44 +1100
Message-Id: <20210225101343.40301-1-ashe@kivikakk.ee>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=ashe@kivikakk.ee;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Asherah Connor <ashe@kivikakk.ee>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provides a minimal fw_cfg for the virt machine on riscv.  I've
arbitrarily selected an MMIO base for it.  This is very rudimentary, so
no DMA interface is exposed.  Tested as working!

(First patch to qemu, so whatever patience you can afford would be
appreciated.)

Signed-off-by: Asherah Connor <ashe@kivikakk.ee>
---
 hw/riscv/virt.c         | 25 +++++++++++++++++++++++++
 include/hw/riscv/virt.h |  4 +++-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 2299b3a6be..4981ca004b 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -56,6 +56,7 @@ static const struct MemmapEntry {
     [VIRT_PLIC] =        {  0xc000000, VIRT_PLIC_SIZE(VIRT_CPUS_MAX * 2) },
     [VIRT_UART0] =       { 0x10000000,         0x100 },
     [VIRT_VIRTIO] =      { 0x10001000,        0x1000 },
+    [VIRT_FW_CFG] =      { 0x10100000,          0x10 },
     [VIRT_FLASH] =       { 0x20000000,     0x4000000 },
     [VIRT_PCIE_ECAM] =   { 0x30000000,    0x10000000 },
     [VIRT_PCIE_MMIO] =   { 0x40000000,    0x40000000 },
@@ -488,6 +489,26 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
     return dev;
 }
 
+static FWCfgState *create_fw_cfg(const RISCVVirtState *s)
+{
+    hwaddr base = virt_memmap[VIRT_FW_CFG].base;
+    hwaddr size = virt_memmap[VIRT_FW_CFG].size;
+    FWCfgState *fw_cfg;
+    char *nodename;
+
+    fw_cfg = fw_cfg_init_mem_wide(base + 8, base, 8, 0, NULL);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)MACHINE(s)->smp.cpus);
+
+    nodename = g_strdup_printf("/fw-cfg@%" PRIx64, base);
+    qemu_fdt_add_subnode(s->fdt, nodename);
+    qemu_fdt_setprop_string(s->fdt, nodename,
+                            "compatible", "qemu,fw-cfg-mmio");
+    qemu_fdt_setprop_sized_cells(s->fdt, nodename, "reg",
+                                 2, base, 2, size);
+    g_free(nodename);
+    return fw_cfg;
+}
+
 static void virt_machine_init(MachineState *machine)
 {
     const struct MemmapEntry *memmap = virt_memmap;
@@ -652,6 +673,10 @@ static void virt_machine_init(MachineState *machine)
         start_addr = virt_memmap[VIRT_FLASH].base;
     }
 
+    /* init fw_cfg */
+    s->fw_cfg = create_fw_cfg(s);
+    rom_set_fw(s->fw_cfg);
+
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
                                    machine->ram_size, s->fdt);
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 84b7a3848f..3b81a2e3f6 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -40,6 +40,7 @@ struct RISCVVirtState {
     RISCVHartArrayState soc[VIRT_SOCKETS_MAX];
     DeviceState *plic[VIRT_SOCKETS_MAX];
     PFlashCFI01 *flash[2];
+    FWCfgState *fw_cfg;
 
     void *fdt;
     int fdt_size;
@@ -58,7 +59,8 @@ enum {
     VIRT_DRAM,
     VIRT_PCIE_MMIO,
     VIRT_PCIE_PIO,
-    VIRT_PCIE_ECAM
+    VIRT_PCIE_ECAM,
+    VIRT_FW_CFG
 };
 
 enum {
-- 
2.24.3 (Apple Git-128)


