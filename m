Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14333435A1F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 06:57:38 +0200 (CEST)
Received: from localhost ([::1]:52882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdQ92-0000wF-HZ
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 00:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZY-0005cu-5i; Thu, 21 Oct 2021 00:20:56 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:49731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZW-0000JC-9R; Thu, 21 Oct 2021 00:20:55 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HZZ5p5KyVz4xdR; Thu, 21 Oct 2021 15:20:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634790030;
 bh=RmGCdBUsGauCbTZYFxJB9b85cUOt8+dHAgX8Hsbu2+s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZhL6IedTAKVEv8flCMMhcYeeE+IePPHYqCleFEtT18c9QMxCo0cFzod0W2w6EtK3N
 NvFhJ8HyYKye2oBWI13M9dAxK66YAB/jdt/4G7+GJCoUnGlvbLM7Cvtn9nE4pU2hVw
 YlCLfPWd9XgSpYD8uQJXCT7gDH3XeYpS+f8aEAlI=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 17/25] ppc/pegasos2: Add constants for PCI config addresses
Date: Thu, 21 Oct 2021 15:20:19 +1100
Message-Id: <20211021042027.345405-18-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021042027.345405-1-david@gibson.dropbear.id.au>
References: <20211021042027.345405-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Define a constant for PCI config addresses to make it clearer what
these numbers are.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <9bd8e84d02d91693b71082a1fadeb86e6bce3025.1634241019.git.balaton@eik.bme.hu>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pegasos2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index a861bf16b8..39e96d323f 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -54,11 +54,13 @@
 
 #define BUS_FREQ_HZ 133333333
 
+#define PCI0_CFG_ADDR 0xcf8
 #define PCI0_MEM_BASE 0xc0000000
 #define PCI0_MEM_SIZE 0x20000000
 #define PCI0_IO_BASE  0xf8000000
 #define PCI0_IO_SIZE  0x10000
 
+#define PCI1_CFG_ADDR 0xc78
 #define PCI1_MEM_BASE 0x80000000
 #define PCI1_MEM_SIZE 0x40000000
 #define PCI1_IO_BASE  0xfe000000
@@ -226,7 +228,7 @@ static void pegasos2_mv_reg_write(Pegasos2MachineState *pm, uint32_t addr,
 static uint32_t pegasos2_pci_config_read(Pegasos2MachineState *pm, int bus,
                                          uint32_t addr, uint32_t len)
 {
-    hwaddr pcicfg = bus ? 0xc78 : 0xcf8;
+    hwaddr pcicfg = bus ? PCI1_CFG_ADDR : PCI0_CFG_ADDR;
     uint64_t val = 0xffffffffULL;
 
     if (len <= 4) {
@@ -239,7 +241,7 @@ static uint32_t pegasos2_pci_config_read(Pegasos2MachineState *pm, int bus,
 static void pegasos2_pci_config_write(Pegasos2MachineState *pm, int bus,
                                       uint32_t addr, uint32_t len, uint32_t val)
 {
-    hwaddr pcicfg = bus ? 0xc78 : 0xcf8;
+    hwaddr pcicfg = bus ? PCI1_CFG_ADDR : PCI0_CFG_ADDR;
 
     pegasos2_mv_reg_write(pm, pcicfg, 4, addr | BIT(31));
     pegasos2_mv_reg_write(pm, pcicfg + 4, len, val);
-- 
2.31.1


