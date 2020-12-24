Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 709F92E240D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 04:24:03 +0100 (CET)
Received: from localhost ([::1]:53086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksHEQ-0006WG-G6
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 22:24:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ksH91-0001M6-K4
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 22:18:27 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:54799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ksH90-0003bm-1i
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 22:18:27 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9A47F580378;
 Wed, 23 Dec 2020 22:18:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 23 Dec 2020 22:18:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=lwQBPSZsDvt18
 JuHo+yXJWbMqTcbBHyGLTFqhtMJHBg=; b=DpjNeHS5OG+tLSuKs7vwW2teHCwQr
 cYP63oIdlmHZVa8N3kEXMiChHAanfnIDbTUQry3tiU6aZzo39fG+OHdjQ8kqK9dF
 rgJ/gPizQ7w0x0xr7noAcBD/mynb8cTDYXPwTDYWY9LI7ACQ5x5tEvY3uvpUcn9s
 az2wns/SpYRwHbgvqcTsq+EFlsz2x6skL0gk2b5PDcBYLkDh/ept7V3BzZQI7EYw
 K3jsGa2A/LY1y8l2Li5bj7lbeDSJ713liSk4TlDwoikumb18r7tOCOqa6uYiFOe0
 aQOk3LsetcMeE8EwG+XMB6NpWvAKZH28wNnyeXWi6My58OUuQ/v1IrsTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=lwQBPSZsDvt18JuHo+yXJWbMqTcbBHyGLTFqhtMJHBg=; b=piE6eIbA
 ceMjIm5xEL2dnEQfH3kkY4OOfIDHjV902HjdDJOK1UA9XLCPOgVXCt1Q4MJudrhZ
 r3vU1fin0V2NdNHn+DeKUPso95UDZB8QxsRXPSgDeQLHldK64GQI3zuEyOXYdREU
 GO/o2EfI1xUMffQK8ZJOqpiA2A6ah3q+ynPi036a8D8wb6AVz8itIXdOddEmpj5L
 nrI8A1zHuW/yFydUBcAEG/qpxVtFNAgN802xTR4uSM9/nhU4DZFNTL/XT/84Aw4D
 XS5EnggJQst+rV3wRSrCsU/4xJTF5oi/BIjOAy146bZ/RMbXt+mc7NL4sEHpGCBP
 /t2NPoL0d02NIQ==
X-ME-Sender: <xms:gQjkX6Hg5iGTo2-RlEeAPO-XylmbbOPYwfMyW26jg1B11jbQoPUXIg>
 <xme:gQjkX7VmgNcEU3KQ1SM2FGGxh44Vd7VwH88z-c7g8dFCqK-oYizlitFcGfFPqsIkC
 80ncsPijOkX1uNvHb8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtkedgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepjeeihffgteelkeelffdukedtheevudejvdegkeekjeefhffhhfet
 udetgfdtffeunecukfhppedvvdefrddutdegrddvuddvrdehleenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehf
 lhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:gQjkX0KxLroGhviYMB9QPB-ZkSV0CDBBVKT7YpoOMbqXsb2g90e8NA>
 <xmx:gQjkX0Ex3iKXp5tarL2coAElKE62uBw2PuLkKOinaH7brbwqr92x5A>
 <xmx:gQjkXwUjC3sKjRsQw_iXaLS8JL3HA9sweaA1OviotmwnX3q-kKC0TQ>
 <xmx:gQjkX-z8Z6HVoIItICMz_nrL9ea7gT4fzkuDtn-aL1OBgiKO-4pd5P1vls0>
Received: from localhost.localdomain (unknown [223.104.212.59])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0F5DA1080063;
 Wed, 23 Dec 2020 22:18:20 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/8] hw/pci-host/bonito: Fixup IRQ mapping
Date: Thu, 24 Dec 2020 11:17:45 +0800
Message-Id: <20201224031750.52146-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201224031750.52146-1-jiaxun.yang@flygoat.com>
References: <20201224031750.52146-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=66.111.4.229;
 envelope-from=jiaxun.yang@flygoat.com; helo=new3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Accroading to arch/mips/pci/fixup-fuloong2e.c in kernel,
despites south bridge IRQs needs special care, all other
IRQ pins are mapped by 'LOONGSON_IRQ_BASE + 25 + pin'.

As south bridge IRQs are all handled by ISA bus, we can
make a simple direct mapping.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v3: Define BONITO_PCI_IRQ_BASE for readability (f4bug)
---
 hw/pci-host/bonito.c | 30 +++++++-----------------------
 1 file changed, 7 insertions(+), 23 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index a99eced065..3fad470fc6 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -62,6 +62,9 @@
 #define DPRINTF(fmt, ...)
 #endif
 
+/* PCI slots IRQ pins start position */
+#define BONITO_PCI_IRQ_BASE         25
+
 /* from linux soure code. include/asm-mips/mips-boards/bonito64.h*/
 #define BONITO_BOOT_BASE        0x1fc00000
 #define BONITO_BOOT_SIZE        0x00100000
@@ -546,19 +549,16 @@ static const MemoryRegionOps bonito_spciconf_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-#define BONITO_IRQ_BASE 32
-
 static void pci_bonito_set_irq(void *opaque, int irq_num, int level)
 {
     BonitoState *s = opaque;
     qemu_irq *pic = s->pic;
     PCIBonitoState *bonito_state = s->pci_dev;
-    int internal_irq = irq_num - BONITO_IRQ_BASE;
 
-    if (bonito_state->regs[BONITO_INTEDGE] & (1 << internal_irq)) {
+    if (bonito_state->regs[BONITO_INTEDGE] & (1 << irq_num)) {
         qemu_irq_pulse(*pic);
     } else {   /* level triggered */
-        if (bonito_state->regs[BONITO_INTPOL] & (1 << internal_irq)) {
+        if (bonito_state->regs[BONITO_INTPOL] & (1 << irq_num)) {
             qemu_irq_raise(*pic);
         } else {
             qemu_irq_lower(*pic);
@@ -566,25 +566,9 @@ static void pci_bonito_set_irq(void *opaque, int irq_num, int level)
     }
 }
 
-/* map the original irq (0~3) to bonito irq (16~47, but 16~31 are unused) */
-static int pci_bonito_map_irq(PCIDevice *pci_dev, int irq_num)
+static int pci_bonito_map_irq(PCIDevice *pci_dev, int pin)
 {
-    int slot;
-
-    slot = (pci_dev->devfn >> 3);
-
-    switch (slot) {
-    case 5:   /* FULOONG2E_VIA_SLOT, SouthBridge, IDE, USB, ACPI, AC97, MC97 */
-        return irq_num % 4 + BONITO_IRQ_BASE;
-    case 6:   /* FULOONG2E_ATI_SLOT, VGA */
-        return 4 + BONITO_IRQ_BASE;
-    case 7:   /* FULOONG2E_RTL_SLOT, RTL8139 */
-        return 5 + BONITO_IRQ_BASE;
-    case 8 ... 12: /* PCI slot 1 to 4 */
-        return (slot - 8 + irq_num) + 6 + BONITO_IRQ_BASE;
-    default:  /* Unknown device, don't do any translation */
-        return irq_num;
-    }
+    return BONITO_PCI_IRQ_BASE + pin;
 }
 
 static void bonito_reset(void *opaque)
-- 
2.29.2


