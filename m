Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1668322160
	for <lists+qemu-devel@lfdr.de>; Sat, 18 May 2019 05:30:54 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56950 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRq3h-0001cy-7z
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 23:30:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hRq1V-0000bK-Na
	for qemu-devel@nongnu.org; Fri, 17 May 2019 23:28:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hRq1U-00036i-SX
	for qemu-devel@nongnu.org; Fri, 17 May 2019 23:28:37 -0400
Received: from m12-18.163.com ([220.181.12.18]:40382)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>)
	id 1hRq1T-0002zi-B4; Fri, 17 May 2019 23:28:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=m/jK5BRzZ77Fytp9Cm
	+5i3Aa2DC0aXVgIOAmW6CJ4SI=; b=TftTTbdHITftWYsVcHK+E+P6mzGcFBJTX5
	bgpwmo24XLwZoCsSryUM9a7h46k7TOPS4oCcg/3b5W6ZSPorFpf3kbDeN93qb3G1
	f2nSF1iTT8DJvvhEw+RVfF1hdjLJXjKqklb2KEMvMyA12eZ2W1gifK5LJDElXFHp
	qyKWIuqqg=
Received: from localhost.localdomain (unknown [183.159.73.182])
	by smtp14 (Coremail) with SMTP id EsCowACXzsrXe99czqL5Gg--.37649S2;
	Sat, 18 May 2019 11:28:24 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: alex.williamson@redhat.com,
	lvivier@redhat.com
Date: Fri, 17 May 2019 20:28:08 -0700
Message-Id: <20190518032811.60341-1-liq3ea@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: EsCowACXzsrXe99czqL5Gg--.37649S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruFyfJF4DAr4xWw1DCF18AFb_yoWDAwcEy3
	ZxZwsYk3s8CayxKrsxZa43Cw48Zw45tF48t3sYyrs2yr4UG3Z8CryDAFn7ZryfWr4fAry8
	Grs2qr13GryUKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRo7KPUUUUU==
X-Originating-IP: [183.159.73.182]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/xtbBZhi4bVaD1iSbFgAAsB
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.18
Subject: [Qemu-devel] [PATCH 1/4] vfio: pci: make "vfio-pci-nohotplug" as
 MACRO
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, philmd@redhat.com, liq3ea@gmail.com,
	qemu-devel@nongnu.org, Li Qiang <liq3ea@163.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CC: qemu-trivial@nongnu.org
Signed-off-by: Li Qiang <liq3ea@163.com>
---
 hw/vfio/pci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 8cecb53d5c..08729e5875 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -40,6 +40,8 @@
 #define TYPE_VFIO_PCI "vfio-pci"
 #define PCI_VFIO(obj)    OBJECT_CHECK(VFIOPCIDevice, obj, TYPE_VFIO_PCI)
 
+#define TYPE_VIFO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
+
 static void vfio_disable_interrupts(VFIOPCIDevice *vdev);
 static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled);
 
@@ -3304,8 +3306,8 @@ static void vfio_pci_nohotplug_dev_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo vfio_pci_nohotplug_dev_info = {
-    .name = "vfio-pci-nohotplug",
-    .parent = "vfio-pci",
+    .name = TYPE_VIFO_PCI_NOHOTPLUG,
+    .parent = TYPE_VFIO_PCI,
     .instance_size = sizeof(VFIOPCIDevice),
     .class_init = vfio_pci_nohotplug_dev_class_init,
 };
-- 
2.17.1



