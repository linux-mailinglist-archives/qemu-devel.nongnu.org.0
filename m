Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C951319EB8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 16:08:21 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43963 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hP6CC-0003po-RU
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 10:08:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40448)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hP65K-00078e-05
	for qemu-devel@nongnu.org; Fri, 10 May 2019 10:01:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hP65J-00022B-07
	for qemu-devel@nongnu.org; Fri, 10 May 2019 10:01:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60788)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hP65I-00021p-R3
	for qemu-devel@nongnu.org; Fri, 10 May 2019 10:01:12 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 254973004156
	for <qemu-devel@nongnu.org>; Fri, 10 May 2019 14:01:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
	[10.36.117.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 80674610CA;
	Fri, 10 May 2019 14:01:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 77C4CA213; Fri, 10 May 2019 16:01:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 10 May 2019 16:01:02 +0200
Message-Id: <20190510140103.3834-8-kraxel@redhat.com>
In-Reply-To: <20190510140103.3834-1-kraxel@redhat.com>
References: <20190510140103.3834-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 10 May 2019 14:01:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 7/8] virtio-input-host-pci: cleanup types
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtio input is virtio-1.0 only, so we don't need the -transitional and
-non-transitional variants.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Message-id: 20190510105137.17481-1-kraxel@redhat.com
---
 hw/virtio/virtio-input-host-pci.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/virtio-input-host-pci.c b/hw/virtio/virtio-input-h=
ost-pci.c
index 725a51ad30b4..124c4f344742 100644
--- a/hw/virtio/virtio-input-host-pci.c
+++ b/hw/virtio/virtio-input-host-pci.c
@@ -13,7 +13,7 @@
=20
 typedef struct VirtIOInputHostPCI VirtIOInputHostPCI;
=20
-#define TYPE_VIRTIO_INPUT_HOST_PCI "virtio-input-host-pci-base"
+#define TYPE_VIRTIO_INPUT_HOST_PCI "virtio-input-host-pci"
 #define VIRTIO_INPUT_HOST_PCI(obj) \
         OBJECT_CHECK(VirtIOInputHostPCI, (obj), TYPE_VIRTIO_INPUT_HOST_P=
CI)
=20
@@ -31,10 +31,7 @@ static void virtio_host_initfn(Object *obj)
 }
=20
 static const VirtioPCIDeviceTypeInfo virtio_input_host_pci_info =3D {
-    .base_name             =3D TYPE_VIRTIO_INPUT_HOST_PCI,
-    .generic_name          =3D "virtio-input-host-pci",
-    .transitional_name     =3D "virtio-input-host-pci-transitional",
-    .non_transitional_name =3D "virtio-input-host-pci-non-transitional",
+    .generic_name  =3D TYPE_VIRTIO_INPUT_HOST_PCI,
     .parent        =3D TYPE_VIRTIO_INPUT_PCI,
     .instance_size =3D sizeof(VirtIOInputHostPCI),
     .instance_init =3D virtio_host_initfn,
--=20
2.18.1


