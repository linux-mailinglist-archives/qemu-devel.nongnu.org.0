Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE97B5450A7
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:22:40 +0200 (CEST)
Received: from localhost ([::1]:49504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJzb-0005a2-Gs
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1525abdf4=anthony.perard@citrix.com>)
 id 1nzIkJ-0001g0-Fd; Thu, 09 Jun 2022 10:02:47 -0400
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175]:31027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1525abdf4=anthony.perard@citrix.com>)
 id 1nzIkE-00082x-5Q; Thu, 09 Jun 2022 10:02:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1654783362;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=paGXb34Mhy13nhDQiM1CO7vzOLM/JRT2V7IsY1lUB2A=;
 b=NXB78+MRa0fbysS7wyMbVN+MowA6Xm3zv6+qo5oaB8pTtNEEwjlTqq9F
 WsT4VQXOLWCRiJmCoqxA7hA5qlqvhuzjWjlJS5Ot3HgkglE7HXuph+XQr
 8KLn5rDcLjZ98hmUX1iBWg71I52KO1e8rB55QjGcszZE25tDKYCiS/39o s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 73081444
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yDQjv6tH1ffBN9/eKpWuyojwqOfnVI9eMUV32f8akzHdYApBsoF/q
 tZmKTyFaKuJZGr2L413O961oExXucDXy942GVRkpC4xEnkW+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW13V6
 YupyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi83D5DDv/wMSyBfMH9nP/AWoaTAPECw5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllpyy3ZCvA3B4jOWazQ6fdT3Ssqh9AIFvHbD
 yYcQWU0NESZP0ETUrsRIMhgg96BtifxSWNVi1uNi7Mn/jTR/gMkhdABN/KKI4fXFK25hH2wq
 27b9n71BTkaPdacziGZtHShmofnhyLwWIsIGPu4+/hmjUeIwWo7DBwQXEG85/6jhSaWQt9aN
 gke/i0lroA080qkSMS7WAe3yFaGpRgbRPJKHuE64R3Lwa3Riy6BDG8CXD9HafQ8ucM2TCBs3
 ViM9/vyBTFprLCEYX2Y/7aQ6zi1PEA9NGIHeGoIQBUI5/Hlp4c8iA+JScxseIawh8f+FDW2y
 iiEoSw0jqgWpcEO3qS/u1vAhlqEo4PVZhQ46gXeQiSu6QYRWWK+T9X2sx6Bt68GddvHCAna1
 JQZpySAxP4/MJ6qjD2VeeIuQqiruqbcKzrBuVE6SvHN6A+RF26fkZF4uW8jeBk0aJpUJlcFc
 2eI51oPucY70G+CKPYuPtnvU5lCIb3IT4yNaxzCUjZZjnGdniej9TomW0Of1nuFfKMEwfBmY
 sfznSpB4B8n5UVbINmeHb51PUcDnHxW+I8qbcmTI+6b+bSffmWJbrwOLUGDaOs0hIvd/liJr
 I8EbZvWlU4HOAEbXsUw2ddLRW3m0FBhXcymwyCpXrXrzvVa9JEJVKaKnOJJl31NlKVJjObYl
 kyAtrtj4AOn3xXvcFzSAlg6Me+Hdcsu9hoTYH1zVWtELlB+OO5DGo9EL8tpFVTmncQ+pcNJo
 w4tK53aUq0eEWSek9nfBLGkxLFfmN2QrVrmF0KYjPIXJfaMmyShFgfYQzbS
IronPort-HdrOrdr: A9a23:KEAS4KpiO9dYlfnLX37JrTkaV5oteYIsimQD101hICG8cqSj+P
 xG+85rsiMc6QxhIU3I9urgBEDtex7hHNtOkOss1NSZLW3bUQmTTL2KhLGKq1aLJ8S9zJ856U
 4JSdkZNDSaNzZHZKjBjDVQa+xQo+W6zA==
X-IronPort-AV: E=Sophos;i="5.91,287,1647316800"; d="scan'208";a="73081444"
To: <qemu-devel@nongnu.org>
CC: Bernhard Beschow <shentey@gmail.com>, Anthony PERARD
 <anthony.perard@citrix.com>, "Michael S. Tsirkin" <mst@redhat.com>, "Marcel
 Apfelbaum" <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, John Snow <jsnow@redhat.com>, <qemu-block@nongnu.org>
Subject: [PULL 1/3] hw/ide/piix: Remove redundant "piix3-ide-xen" device class
Date: Thu, 9 Jun 2022 15:02:00 +0100
Message-ID: <20220609140202.45227-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220609140202.45227-1-anthony.perard@citrix.com>
References: <20220609140202.45227-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.155.175;
 envelope-from=prvs=1525abdf4=anthony.perard@citrix.com;
 helo=esa6.hc3370-68.iphmx.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

Commit 0f8445820f11a69154309863960328dda3dc1ad4 'xen: piix reuse pci
generic class init function' already resolved redundant code which in
turn rendered piix3-ide-xen redundant.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
Message-Id: <20220513180957.90514-2-shentey@gmail.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/i386/pc_piix.c | 3 +--
 hw/ide/piix.c     | 7 -------
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 578e537b35..0e45521e74 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -246,8 +246,7 @@ static void pc_init1(MachineState *machine,
     if (pcmc->pci_enabled) {
         PCIDevice *dev;
 
-        dev = pci_create_simple(pci_bus, piix3_devfn + 1,
-                                xen_enabled() ? "piix3-ide-xen" : "piix3-ide");
+        dev = pci_create_simple(pci_bus, piix3_devfn + 1, "piix3-ide");
         pci_ide_create_devs(dev);
         idebus[0] = qdev_get_child_bus(&dev->qdev, "ide.0");
         idebus[1] = qdev_get_child_bus(&dev->qdev, "ide.1");
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index ce89fd0aa3..2345fe9e1d 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -241,12 +241,6 @@ static const TypeInfo piix3_ide_info = {
     .class_init    = piix3_ide_class_init,
 };
 
-static const TypeInfo piix3_ide_xen_info = {
-    .name          = "piix3-ide-xen",
-    .parent        = TYPE_PCI_IDE,
-    .class_init    = piix3_ide_class_init,
-};
-
 /* NOTE: for the PIIX4, the IRQs and IOports are hardcoded */
 static void piix4_ide_class_init(ObjectClass *klass, void *data)
 {
@@ -272,7 +266,6 @@ static const TypeInfo piix4_ide_info = {
 static void piix_ide_register_types(void)
 {
     type_register_static(&piix3_ide_info);
-    type_register_static(&piix3_ide_xen_info);
     type_register_static(&piix4_ide_info);
 }
 
-- 
Anthony PERARD


