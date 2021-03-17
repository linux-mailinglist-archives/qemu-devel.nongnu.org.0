Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F1533EA58
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 08:02:52 +0100 (CET)
Received: from localhost ([::1]:40660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMQCg-0005mT-R6
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 03:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>)
 id 1lMQAu-0005AX-Bl; Wed, 17 Mar 2021 03:01:00 -0400
Received: from mo6-p00-ob.smtp.rzone.de ([2a01:238:400:100::c]:21849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>)
 id 1lMQAs-0003EZ-F6; Wed, 17 Mar 2021 03:01:00 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1615964450; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=QhJziYMy38tKBzT+jnW2C4YmGZ1LpnM1yOXvawVOjXRBFWX8xjgf2Yc130VDLvcvQP
 iaEdu9J+cagSPiEUt6y4FiNaE9Mt7V+UfKRWG+/6CtWlSmYzkRY5hajvM6f1Wx+mShpd
 u0MfiP0I1K4TJ5WRfOiPNxAql3NaezGb51GKtNlVt1PX4p+EvQf7tGzbWDMzDVFVLjwN
 r/WbxGEzgi+Tv/lkEHfTSL4BeWpXnQwNGXe0f3NPQhmVnxay8/GPYv15egHhFQ7CSS/m
 62b8dyr11AaIkhKRvBd+O8gPMMIaK2FDKAwF+Vu5F5kpvXfkd8mtoBYVwvFeT89crnK+
 Xrnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1615964450;
 s=strato-dkim-0002; d=strato.com;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=F5gsroM5N4Gb38oAx76awNUeg6mdAvkdztZJQE8rvpw=;
 b=bD5n6UEJ0IumSyeyLQRM+en8Q2cd3gGFofEVOxEgpzMq4oF/jWSY7zYcuwLTkySv2v
 i4ayvCeg67oMz7cu1ssPYNMeSOCFa5pOXDvpg1Xj/7ETx6rzoIPJC5zNOmdu7YvLUNmk
 uAMhA0K7zghET97gJVGvHOehvZ5ZpSrpAI54FnAbb5aJVvsSZ6Z0wD/EyZ1TjJCF2FkP
 yfyqVWbIzdrQmCPSxmZGgEQfahwQa0jdEEXSU+/SN2eLJWWL0TJs3yajIiQkznW4SHzO
 vvOXxkiolOEWMAo9NWmmslcEoPQhcJhDEqNeDRg7hmlxD+2fxIRdbhUXdAv7wk5OxE+m
 INvw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1615964450;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=F5gsroM5N4Gb38oAx76awNUeg6mdAvkdztZJQE8rvpw=;
 b=mzzd+qADwgwU7fgLB7cnhPrFYNn4DwI6ai1ZXd9r2AvGg3mLnzScIIjHwb5aUB+3tq
 QnnYZd29ov7wQXeDwT0nHVAmoedYK3Ux7SMCdoU7gC5bvt5IPqn2/scQqDiqsPGl8MD2
 ZK7Pt4IFRWWkDGP3RnYT8P12z/ds47aiTV046FGB0vr8tZKwoeC2vbxu7jaqrbl3j6QF
 z4V9eVPR78NAPlzwyg3hItqK3Z5a2BJ52qtTryktJRpBiST/WsdYyF+WDgICcKGOWjio
 ZwNcKxIatwSJcmD2oPJNu1H6E9J63C48tfSsPNRaEivaMQp7q+UPvh50GqnGWONBUafW
 bRpg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS325Pjw=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 47.21.0 SBL|AUTH)
 with ESMTPSA id u08c13x2H70o88o
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 17 Mar 2021 08:00:50 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v2] piix: fix regression during unplug in Xen HVM domUs
Date: Wed, 17 Mar 2021 08:00:46 +0100
Message-Id: <20210317070046.17860-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a01:238:400:100::c; envelope-from=olaf@aepfle.de;
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
 hw/ide/piix.c        | 5 +++++
 include/hw/ide/pci.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index b9860e35a5..7f1998bf04 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -109,6 +109,9 @@ static void piix_ide_reset(DeviceState *dev)
     uint8_t *pci_conf = pd->config;
     int i;
 
+    if (d->xen_unplug_done == true) {
+        return;
+    }
     for (i = 0; i < 2; i++) {
         ide_bus_reset(&d->bus[i]);
     }
@@ -151,6 +154,7 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
     PCIIDEState *d = PCI_IDE(dev);
     uint8_t *pci_conf = dev->config;
 
+    d->xen_unplug_done = false;
     pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
 
     bmdma_setup_bar(d);
@@ -170,6 +174,7 @@ int pci_piix3_xen_ide_unplug(DeviceState *dev, bool aux)
     BlockBackend *blk;
 
     pci_ide = PCI_IDE(dev);
+    pci_ide->xen_unplug_done = true;
 
     for (i = aux ? 1 : 0; i < 4; i++) {
         idebus = &pci_ide->bus[i / 2];
diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index d8384e1c42..9e71cfec3b 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -50,6 +50,7 @@ struct PCIIDEState {
     IDEBus bus[2];
     BMDMAState bmdma[2];
     uint32_t secondary; /* used only for cmd646 */
+    bool xen_unplug_done;
     MemoryRegion bmdma_bar;
     MemoryRegion cmd_bar[2];
     MemoryRegion data_bar[2];

