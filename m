Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D43613EDC
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 21:18:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opbCj-0000A5-IU; Mon, 31 Oct 2022 16:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbCb-0008CZ-Q0; Mon, 31 Oct 2022 16:16:10 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbCT-0001FB-6V; Mon, 31 Oct 2022 16:16:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dgtd0UJc8G+xqf3SCtNhRPavB+1WEQc3RMKfTkB/2hk=; b=WhDnuWqPT/Jw2e85K2M2MLMRDk
 hjXWplKoFu5rRyaTWdk13AwrOrCjhslgvT2qnfrbSnqDSd4eEX6BkXSzZJMvrr6r13kSeLT3PfgfG
 SE0b9sYLRPjNGzwfu6rFORffcd6dwP8oy7meBtjCjDnS+NhQJcBHaKDDAQ+T2hH1W7CAQzGqQOhFX
 +uKxQ4Lqw7TPhp4LczhVQn8BXkkG2bCg8/BijengzwCGcCIQb8EofoD26JwAGOo+zCa/jYNT3e78p
 Dq2mYBB4k8uOZJeNILzjDNoJag3WnYDXcU8X6a5bY1C473WNy5AA7FPTPjnuD7/xF8XQNQAcD5Np0
 janj1LWwh+uCEC0TnZE2EKQCA85tM1b7f9FeKXv1itRkSpZjjsjRPRq5/B9l9eaS6WcGn/c10oXoq
 prKctrIJp5cigZFXodUHOKz2MJG0mM9htwmcRXoXVQvdu4W+sZZdnkBhnru1elDu6tfJ/4ky52qkL
 7siCVprQFBEWSXLRfbB3JVuYNHpUQs82Hch7V9BTnO0TOe2QULdRHmwxf0x30Cri0cF1LOke3liK9
 V/00lgDB/dZRMQgtuUfo89Eioh566pyB8DHgpIAW8aJ2FdSuw5WRR7VCyTnPLyIfosIYARouszEqc
 Zr7i9atgFedZ303/gEZLsixKWqyKc4UspLYXXgMVA=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbCG-0003Dd-0T; Mon, 31 Oct 2022 20:15:51 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org,
	stefanha@redhat.com
Date: Mon, 31 Oct 2022 20:14:34 +0000
Message-Id: <20221031201435.677168-14-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
References: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 13/14] mac_{old|new}world: Code style fix adding missing braces
 to if-s
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: BALATON Zoltan <balaton@eik.bme.hu>

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <ab891af01894bc01df0df78247da00fef4f59242.1666957578.git.balaton@eik.bme.hu>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/ppc/mac_newworld.c | 6 ++++--
 hw/ppc/mac_oldworld.c | 9 ++++++---
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 6b2d781dea..37123daa6b 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -202,14 +202,16 @@ static void ppc_core99_init(MachineState *machine)
         kernel_size = load_elf(machine->kernel_filename, NULL,
                                translate_kernel_address, NULL, NULL, NULL,
                                NULL, NULL, 1, PPC_ELF_MACHINE, 0, 0);
-        if (kernel_size < 0)
+        if (kernel_size < 0) {
             kernel_size = load_aout(machine->kernel_filename, kernel_base,
                                     machine->ram_size - kernel_base,
                                     bswap_needed, TARGET_PAGE_SIZE);
-        if (kernel_size < 0)
+        }
+        if (kernel_size < 0) {
             kernel_size = load_image_targphys(machine->kernel_filename,
                                               kernel_base,
                                               machine->ram_size - kernel_base);
+        }
         if (kernel_size < 0) {
             error_report("could not load kernel '%s'",
                          machine->kernel_filename);
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 23d9268281..558c639202 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -160,14 +160,16 @@ static void ppc_heathrow_init(MachineState *machine)
         kernel_size = load_elf(machine->kernel_filename, NULL,
                                translate_kernel_address, NULL, NULL, NULL,
                                NULL, NULL, 1, PPC_ELF_MACHINE, 0, 0);
-        if (kernel_size < 0)
+        if (kernel_size < 0) {
             kernel_size = load_aout(machine->kernel_filename, kernel_base,
                                     machine->ram_size - kernel_base,
                                     bswap_needed, TARGET_PAGE_SIZE);
-        if (kernel_size < 0)
+        }
+        if (kernel_size < 0) {
             kernel_size = load_image_targphys(machine->kernel_filename,
                                               kernel_base,
                                               machine->ram_size - kernel_base);
+        }
         if (kernel_size < 0) {
             error_report("could not load kernel '%s'",
                          machine->kernel_filename);
@@ -291,8 +293,9 @@ static void ppc_heathrow_init(MachineState *machine)
         pci_create_simple(pci_bus, -1, "pci-ohci");
     }
 
-    if (graphic_depth != 15 && graphic_depth != 32 && graphic_depth != 8)
+    if (graphic_depth != 15 && graphic_depth != 32 && graphic_depth != 8) {
         graphic_depth = 15;
+    }
 
     /* No PCI init: the BIOS will do it */
 
-- 
2.30.2


