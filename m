Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B2F2E240F
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 04:26:28 +0100 (CET)
Received: from localhost ([::1]:59442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksHGl-0000tv-Aj
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 22:26:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ksH96-0001WY-Kd
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 22:18:32 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:56103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ksH94-0003db-Vf
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 22:18:32 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8089558037A;
 Wed, 23 Dec 2020 22:18:30 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 23 Dec 2020 22:18:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=qqFEscVG+bgxX
 D41y6VOa/Ihx+II+1KvEVbjUp3LV4E=; b=ylu/DWTp1xNp8FEwUWyCo6Ag2LX2z
 qXKoZhr7gXhjvA66heXHis2Q6nIuotB5cHWXWSjKCaCLhtWnMUgk/yfsxNT5+zE0
 DD2w7dE97/ntI0QL40p/4zyU7A8royJ/R8RlBg5yCei9jUpVHpH6rIEwCC9dtF2J
 C8xs23qMGhprqHdPXKx1C/jZafPNu63zyWP/sEaj3dYE+KKKHV1di+u4MxNuXX1+
 8JX7FpkEVj71+24KLe/GEk2K2d/h8WX3TEk6npw/FMehGUKzfkoU7p3QL7PYhc7R
 GOHOK37hdue9aENyBlfuyD6O+Q8Oh72iAyjNBiCo3AjCqmupmnwyigiEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=qqFEscVG+bgxXD41y6VOa/Ihx+II+1KvEVbjUp3LV4E=; b=RWdPskv7
 lnWghvYbek9srSlqwdmSXXtO22LGnrMLONSfwZ//o4dOEdQ4KMAt2kGSakOQcr87
 78nGaarnjgKqXuQDrjPL6seF8OtU/nj0a9ziDWgcdH8WCypcrvxMvQ6BPgOgyPCa
 MACKiIrSVhYeyN39KzwQCXiRONAL9XMw5IkKGVOsX8D3gFBVfm2p58wmEoXdvP8I
 E7QqgrLltyvijnV2ONFoMThKShBe458HKnBvU+35zo8B/+cdyicb7jvMcH8kmQso
 4uBRzAnyiRtF9n0bHvAS1egACSLpNpbGv/pLyC48S/xy/HAALSH+qLs05y2cdHfA
 FflPZCzdUt/dFw==
X-ME-Sender: <xms:hgjkX6vOVJIA40MRTqiBAFiSxCuU4smveL2m0_Omw6atmiUgOF40BA>
 <xme:hgjkX_e8Y5dy5Xqi8w2uRBS5xpuFUdk8y8Gzt_xy9o6TuS9w5IIvvP6datSvVvCtU
 8UuMBMzpap3QLsBIbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtkedgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepjeeihffgteelkeelffdukedtheevudejvdegkeekjeefhffhhfet
 udetgfdtffeunecukfhppedvvdefrddutdegrddvuddvrdehleenucevlhhushhtvghruf
 hiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehf
 lhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:hgjkX1y3UW44oi13fRcP_1a3Jle9zwa_PK91MctZZsbE4KHiGPwaNA>
 <xmx:hgjkX1MmO3ltQs6qsjDn0zYh74-Muayth1YWBGGlWUjXeZ6eOLq5Rg>
 <xmx:hgjkX6-nZU3YnmwOR9U_PBkVSHo0uvgr_Q6awZU2keC0gnIrNIw0bw>
 <xmx:hgjkX-ZHwZaKyUxyhr_WlzbXbQ43MW1kDn3G0wgRHq_QbxVHMHwuq1E0EjQ>
Received: from localhost.localdomain (unknown [223.104.212.59])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0E1E51080057;
 Wed, 23 Dec 2020 22:18:25 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/8] hw/pci-host/bonito: Fixup pci.lomem mapping
Date: Thu, 24 Dec 2020 11:17:46 +0800
Message-Id: <20201224031750.52146-5-jiaxun.yang@flygoat.com>
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

The original mapping had wrong base address.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/pci-host/bonito.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 3fad470fc6..737ee131e1 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -85,9 +85,8 @@
 #define BONITO_PCILO_BASE_VA    0xb0000000
 #define BONITO_PCILO_SIZE       0x0c000000
 #define BONITO_PCILO_TOP        (BONITO_PCILO_BASE + BONITO_PCILO_SIZE - 1)
-#define BONITO_PCILO0_BASE      0x10000000
-#define BONITO_PCILO1_BASE      0x14000000
-#define BONITO_PCILO2_BASE      0x18000000
+#define BONITO_PCILOx_BASE(x)   (BONITO_PCILO_BASE + BONITO_PCILOx_SIZE * x)
+#define BONITO_PCILOx_SIZE      0x04000000
 #define BONITO_PCIHI_BASE       0x20000000
 #define BONITO_PCIHI_SIZE       0x60000000
 #define BONITO_PCIHI_TOP        (BONITO_PCIHI_BASE + BONITO_PCIHI_SIZE - 1)
@@ -610,7 +609,7 @@ static void bonito_pcihost_realize(DeviceState *dev, Error **errp)
 {
     PCIHostState *phb = PCI_HOST_BRIDGE(dev);
     BonitoState *bs = BONITO_PCI_HOST_BRIDGE(dev);
-    MemoryRegion *pcimem_lo_alias = g_new(MemoryRegion, 3);
+    MemoryRegion *pcimem_lo_alias = g_new(MemoryRegion, 1);
 
     memory_region_init(&bs->pci_mem, OBJECT(dev), "pci.mem", BONITO_PCIHI_SIZE);
     phb->bus = pci_register_root_bus(dev, "pci",
@@ -622,9 +621,10 @@ static void bonito_pcihost_realize(DeviceState *dev, Error **errp)
         char *name = g_strdup_printf("pci.lomem%zu", i);
 
         memory_region_init_alias(&pcimem_lo_alias[i], NULL, name,
-                                 &bs->pci_mem, i * 64 * MiB, 64 * MiB);
+                                 &bs->pci_mem, BONITO_PCILOx_BASE(i),
+                                 BONITO_PCILOx_SIZE);
         memory_region_add_subregion(get_system_memory(),
-                                    BONITO_PCILO_BASE + i * 64 * MiB,
+                                    BONITO_PCILOx_BASE(i),
                                     &pcimem_lo_alias[i]);
         g_free(name);
     }
-- 
2.29.2


