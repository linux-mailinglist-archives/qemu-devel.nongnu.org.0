Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA65B33E1A1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 23:46:21 +0100 (CET)
Received: from localhost ([::1]:33428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMISC-0005SO-Os
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 18:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>)
 id 1lMIQj-0004hq-LO; Tue, 16 Mar 2021 18:44:49 -0400
Received: from mo6-p00-ob.smtp.rzone.de ([2a01:238:400:100::a]:29433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>)
 id 1lMIQd-00035b-Ew; Tue, 16 Mar 2021 18:44:49 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1615934675; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=C8TXa5XeHZwpup6coS6Ybg7qt8dadA/Zj9g3e5yxRAxB9GS1QujHxMG7SQEDhL2O3c
 3WoKVZfrIgAjeLpv8Q7nar2dj2lQGPmFfH4KQ3ASSA8Z5p6EybLpyb/ezEjxkZc2MO18
 L8YuKYsOF7dYP0Jgxu5GAAenaiSCxyQrvADRsisH2cMlmxgVLim+IiK8py48WylCYFUW
 kCcJ7oHztZDyegmCP6niA3ZwdMnebpPgqcHtPwYPe33nW4wRV1USNl6KNEhv1j47u43l
 DwlFslkwR5EjiU9iF9Vg7AznqGoAAGJhojHLIy+0DTqhClrBNlDtPKLYSv0PoPQDQ+dJ
 NGDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1615934675;
 s=strato-dkim-0002; d=strato.com;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=spRfbSf2EEd/CxkfCsgqRwYK32rzUNZ5IzSUCc4F8sE=;
 b=jKWlsPcNfGCDI+0IerHjFkVQzPBra8OQHIasTlFP1nekmnqt6CYrKfQCXcsiC9PfHA
 UkzMgTilP08dMybzWXMgBalp90QOFFYTSqDpQl42JRRrOwXSf6a/iic8gefLwpKOuJLF
 bQ3uZUXOXWP5lL5jzoqxbG5iHJ69UwFvlNJiVjnxs8Jal5toYRbljyQwWmNV3DZSJBsa
 kDA+xbUtqrIo9FbXWiFgNs0Rjqqg4hH9ZaYd8alhd3MDd/wSDQAmDLsteGi+0Wdajbkc
 Mb/Pl6soIYWTbSNEopDhP3n44ATttcPK7QrHou9GSPOO7DmHN42YkG4clZBzw8P/rQmq
 8F8w==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1615934675;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=spRfbSf2EEd/CxkfCsgqRwYK32rzUNZ5IzSUCc4F8sE=;
 b=GaZSz3vCR8zScvKLRGoWsbMwqCisU0+job6YMkP9x6YBV/KZnjpPD+Xu/dAoZL8ivf
 +JVXzVjifdt3m/6ji5C88QrgXFou4bFB2VOGmK6zbXvSF6t4koqWVteOWSCieI1CMZLb
 Yz0c2zJ/ANzOvSmDDgd+uwNgPTX6k5ejLGZ3RE5g9pCyVRQsMIkFkzJFGYgiaXKz1Oyg
 XczVLBKYnQQ9H+DzsPm/vFA5kpJ5EB4mpPBQxFm1L4P5w8XFeC2wU0LISUMI4W3FFDUV
 ihT0ppn8mnNBPq4zoxiFCIR9Mun4Qdq5R0ewUcj3/RIdJesqkOsem5euD+If1TDeFsur
 /gtA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS325Pjw=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 47.21.0 SBL|AUTH)
 with ESMTPSA id u08c13x2GMiZ7PY
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 16 Mar 2021 23:44:35 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v1] piix: fix regression during unplug in Xen HVM domUs
Date: Tue, 16 Mar 2021 23:44:12 +0100
Message-Id: <20210316224412.11609-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a01:238:400:100::a; envelope-from=olaf@aepfle.de;
 helo=mo6-p00-ob.smtp.rzone.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
 URIBL_SBL_A=0.1 autolearn=ham autolearn_force=no
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
Cc: Olaf Hering <olaf@aepfle.de>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit ee358e919e385fdc79d59d0d47b4a81e349cd5c9 causes a regression in
Xen HVM domUs which run xenlinux based kernels.

If the domU has an USB device assigned, for example with
"usbdevice=['tablet']" in domU.cfg, the late unplug of devices will
kill the emulated USB host. As a result the khubd thread hangs, and as
a result the entire boot process.

For some reason this does not affect pvops based kernels. This is
most likely caused by the fact that unplugging happens very early
during boot.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 hw/ide/piix.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index b9860e35a5..2a380a90e9 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -34,6 +34,7 @@
 #include "hw/ide/pci.h"
 #include "trace.h"
 
+static bool pci_piix3_xen_ide_unplug_done;
 static uint64_t bmdma_read(void *opaque, hwaddr addr, unsigned size)
 {
     BMDMAState *bm = opaque;
@@ -109,6 +110,8 @@ static void piix_ide_reset(DeviceState *dev)
     uint8_t *pci_conf = pd->config;
     int i;
 
+    if (pci_piix3_xen_ide_unplug_done == true)
+        return;
     for (i = 0; i < 2; i++) {
         ide_bus_reset(&d->bus[i]);
     }
@@ -169,6 +172,7 @@ int pci_piix3_xen_ide_unplug(DeviceState *dev, bool aux)
     IDEBus *idebus;
     BlockBackend *blk;
 
+    pci_piix3_xen_ide_unplug_done = true;
     pci_ide = PCI_IDE(dev);
 
     for (i = aux ? 1 : 0; i < 4; i++) {
@@ -259,6 +263,7 @@ static const TypeInfo piix4_ide_info = {
 
 static void piix_ide_register_types(void)
 {
+    pci_piix3_xen_ide_unplug_done = false;
     type_register_static(&piix3_ide_info);
     type_register_static(&piix3_ide_xen_info);
     type_register_static(&piix4_ide_info);

