Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 525886A0DC6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 17:21:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVEKN-0007cv-AK; Thu, 23 Feb 2023 11:20:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pVEKI-0007cn-JG
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:20:10 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pVEKG-0002Og-3J
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:20:10 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 6A7065C01CC;
 Thu, 23 Feb 2023 11:20:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 23 Feb 2023 11:20:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1677169205; x=1677255605; bh=uV0lM0hm84OesCgAA/f4ypkFG
 fz2HJ4O5ndkuBDJKi0=; b=RBh6oBj2DmWzsvnOr41f9AejhoB6Awr7WrTG/1pym
 ushPod7NJ45D/5ozhCaIo4ffT0+f6mbj/URpBWjkWjdc9DKh2QoRMzKtz2Xk21YZ
 NNDG5Q1WQDjbbItTC8+74ksF2uzbNKFMl6kb+Oac64XeP7zyKWDEbaHqjkKd15Hz
 SHfawjNkXnfgFZ7U1NMdKIgCC3Xq1O6YRQDXjS98vbf11IvC1yXAClllbP3TMNxC
 yZOMVnGLzRoCXQGG9ry/cN/z949CGXbJkjwjGBZ8PD/o/1PyfGHnZLUSyV4j0J+y
 sCdG2M/MKGsZENx2YmIEEV/k7kTjBCtsbJ5soO0ba8AEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1677169205; x=1677255605; bh=uV0lM0hm84OesCgAA/f4ypkFGfz2HJ4O5nd
 kuBDJKi0=; b=JsinVcnNtiuAIZaeTTPheY4CnbSk+qRyzhJOissDQEP8YIyKJKt
 Yw+5Op3uaJFeXPYAXethy2SlEIqbUrQ9dN8W3vWqQykIbS/wsxQsFN5HWcSDQhr+
 pV3Q880hmfwd2ACoHKjOF1uj3mcgbINctPeTFoIoHR9CLiIr/axRrLChrFRuK1Ui
 9qScHcPCPis0d2LILcLQs2x0ggqg3OX7+hmCCvirpvEyzWQJtk8Os7qywpn/2BjC
 X3zkJkvB4RFAl86yrCDfRgLcrImBM2JaScoPPV9TxmCgbjDckCvEjKy7YqudEqKD
 sbRCDiMkvhguiDVc2TLOJEB7b/xRiTc09dQ==
X-ME-Sender: <xms:NJL3YxPdFoX0NOuGX6Q4Oy7R1kRSMxSx8Sl_P1dzAAtGHqzYWUFFmA>
 <xme:NJL3Yz9P1cRnkM1WDsrDGVHiDv815KQCCEfg8jgz2Dk9HzHYKERLopFmrcHOJLlHw
 tzSpTQr67ngyH49GZs>
X-ME-Received: <xmr:NJL3YwSweRuIYRohHEj7mXc3O__fNXlorWmxxmRQKWpwD_KTAQwE-eSw7k5d>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekuddgkeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
 fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhephfetuddtudevieeljeejte
 ffheeujeduhefgffejudfhueelleduffefgfffveeknecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
 grthdrtghomh
X-ME-Proxy: <xmx:NJL3Y9v1hgc3dgjALr7rhsZ93ID2luIvqk7dmCMi6a8Kek4BO0sSug>
 <xmx:NJL3Y5c0gUGSdC9t5HkKBffOvPs70z4068ylmMjGMugJAiQeVBh0Gg>
 <xmx:NJL3Y52qXefwQQx7aEcBhd5ig3kHsf4JBwWeZD2u5d_KXLLwRd7h0A>
 <xmx:NZL3Y97mYxE37uhR5Z_jGf7ocTqLP-xCqm6gltLt0M2BAKbsMuYtaw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Feb 2023 11:20:03 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, balaton@eik.bme.hu, nathan@kernel.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH] hw/mips/gt64xxx_pci: Don't endian-swap GT_PCI0_CFGADDR
Date: Thu, 23 Feb 2023 16:19:58 +0000
Message-Id: <20230223161958.48696-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=jiaxun.yang@flygoat.com;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE
MemoryRegionOps") converted CFGADDR/CFGDATA registers to use PCI_HOST_BRIDGE's
accessor facility and enabled byte swap for both CFGADDR/CFGDATA register.

However CFGADDR as a ISD internal register is not controled by MByteSwap
bit, it follows endian of all other ISD register, which means it ties to
little endian.

Move mapping of CFGADDR out of gt64120_update_pci_cfgdata_mapping to disable
endian-swapping.

This should fix some recent reports about poweroff hang.

Fixes: 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE MemoryRegionOps")
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/pci-host/gt64120.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/hw/pci-host/gt64120.c b/hw/pci-host/gt64120.c
index f226d0342039..82c15edb4698 100644
--- a/hw/pci-host/gt64120.c
+++ b/hw/pci-host/gt64120.c
@@ -321,9 +321,6 @@ static void gt64120_isd_mapping(GT64120State *s)
 static void gt64120_update_pci_cfgdata_mapping(GT64120State *s)
 {
     /* Indexed on MByteSwap bit, see Table 158: PCI_0 Command, Offset: 0xc00 */
-    static const MemoryRegionOps *pci_host_conf_ops[] = {
-        &pci_host_conf_be_ops, &pci_host_conf_le_ops
-    };
     static const MemoryRegionOps *pci_host_data_ops[] = {
         &pci_host_data_be_ops, &pci_host_data_le_ops
     };
@@ -339,15 +336,6 @@ static void gt64120_update_pci_cfgdata_mapping(GT64120State *s)
      * - Table 16: 32-bit PCI Transaction Endianess
      * - Table 158: PCI_0 Command, Offset: 0xc00
      */
-    if (memory_region_is_mapped(&phb->conf_mem)) {
-        memory_region_del_subregion(&s->ISD_mem, &phb->conf_mem);
-        object_unparent(OBJECT(&phb->conf_mem));
-    }
-    memory_region_init_io(&phb->conf_mem, OBJECT(phb),
-                          pci_host_conf_ops[s->regs[GT_PCI0_CMD] & 1],
-                          s, "pci-conf-idx", 4);
-    memory_region_add_subregion_overlap(&s->ISD_mem, GT_PCI0_CFGADDR << 2,
-                                        &phb->conf_mem, 1);
 
     if (memory_region_is_mapped(&phb->data_mem)) {
         memory_region_del_subregion(&s->ISD_mem, &phb->data_mem);
@@ -1208,6 +1196,12 @@ static void gt64120_realize(DeviceState *dev, Error **errp)
                                 PCI_DEVFN(18, 0), TYPE_PCI_BUS);
 
     pci_create_simple(phb->bus, PCI_DEVFN(0, 0), "gt64120_pci");
+    memory_region_init_io(&phb->conf_mem, OBJECT(phb),
+                          &pci_host_conf_le_ops,
+                          s, "pci-conf-idx", 4);
+    memory_region_add_subregion_overlap(&s->ISD_mem, GT_PCI0_CFGADDR << 2,
+                                        &phb->conf_mem, 1);
+
 
     /*
      * The whole address space decoded by the GT-64120A doesn't generate
-- 
2.37.1 (Apple Git-137.1)


