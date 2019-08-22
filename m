Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647BC98BAF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 08:51:21 +0200 (CEST)
Received: from localhost ([::1]:38586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0gwK-0006gR-H9
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 02:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38449)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tgfbeta@me.com>) id 1i0guN-0005RT-3X
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 02:49:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tgfbeta@me.com>) id 1i0guM-0007Hc-3W
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 02:49:19 -0400
Received: from pv50p00im-ztdg10012101.me.com ([17.58.6.49]:51723)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tgfbeta@me.com>) id 1i0guL-0007CT-SI
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 02:49:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1566456553; bh=6PUVU1MZHFFpo0CsMyHLeCK1tngokKtt2DOZ2uG+hzQ=;
 h=From:Content-Type:Subject:Message-Id:Date:To;
 b=v44yjRa/dh6QtrKApkdJYFdQsnUOydnJo8QWrzXqyIc4KCp0vURp2m3cQf1RN/NQD
 ZFOhPNqE2T+jp0R3r+Xee8hUMlWXOtyMKggH2Ja6skW7xVcthNRsXRNlXSjkxhzXE8
 qG7DrHK/fjh+idEV4VwmvQbSc3aFDoh7DXPTLTpQG0/Ys1uuingrpf3m7M1c461B9F
 eQxdz0WxQFot+AdPqvLSaJ5QNKH8WjZJlMtWB3a8UnCa8swE7TvpnIwhklHgqAODJa
 yc2VCnSqfKAsFTiedJu0hiDkOVIIWVqXBCPmFYDwje4Vq6teCP0T9a1EUoK1ufL2qN
 xP0fYxvZnLgKQ==
Received: from [172.16.10.130] (unknown [36.106.167.236])
 by pv50p00im-ztdg10012101.me.com (Postfix) with ESMTPSA id B9D5F840807;
 Thu, 22 Aug 2019 06:49:12 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Message-Id: <8E5A9C27-C76D-46CF-85B0-79121A00B05F@me.com>
Date: Thu, 22 Aug 2019 14:49:09 +0800
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3445.104.11)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-22_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=873 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1812120000 definitions=main-1908220074
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 17.58.6.49
Subject: [Qemu-devel] [PATCH] vfio: fix a typo
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
From: Chen Zhang via Qemu-devel <qemu-devel@nongnu.org>
Reply-To: Chen Zhang <tgfbeta@me.com>
Cc: qemu-trivial@nongnu.org, Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Chen Zhang <tgfbeta@me.com>
---
 hw/vfio/pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index dc3479c..c5e6fe6 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -44,7 +44,7 @@
 #define TYPE_VFIO_PCI "vfio-pci"
 #define PCI_VFIO(obj)    OBJECT_CHECK(VFIOPCIDevice, obj, =
TYPE_VFIO_PCI)
=20
-#define TYPE_VIFO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
+#define TYPE_VFIO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
=20
 static void vfio_disable_interrupts(VFIOPCIDevice *vdev);
 static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled);
@@ -3199,7 +3199,7 @@ static void =
vfio_pci_nohotplug_dev_class_init(ObjectClass *klass, void *data)
 }
=20
 static const TypeInfo vfio_pci_nohotplug_dev_info =3D {=20
-    .name =3D TYPE_VIFO_PCI_NOHOTPLUG,
+    .name =3D TYPE_VFIO_PCI_NOHOTPLUG,
     .parent =3D TYPE_VFIO_PCI,
     .instance_size =3D sizeof(VFIOPCIDevice),
     .class_init =3D vfio_pci_nohotplug_dev_class_init,
--=20
2.7.4



