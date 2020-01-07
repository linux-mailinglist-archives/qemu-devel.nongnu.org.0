Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2DA132A29
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 16:39:51 +0100 (CET)
Received: from localhost ([::1]:51714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioqxS-0005fq-Nu
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 10:39:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56907)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ioqUH-0006kf-7u
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:09:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ioqUE-0005oo-UA
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:09:41 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:45821
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ioqUE-0005nq-Pw
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:09:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578409778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G5o3BZFfXOYMxsGVfHABUVa3/NLQ378y2wjX3/MhgO8=;
 b=GGMGpTJuUvgkMdDNoLrsYDPrTng2SG4wAJdt+P7F2x6s6vrP2E0AgoRwOKp+62LKw623B7
 gD9jHG70Gt6oC5cq1NRwsCuLzxvYrGo8PFd5a6r9fj9anWonjI6d9SnTmTreVDbbDhD+Am
 sLdjWtO3JNjU/OlRv0msHH2ciMjMZn8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-iksGxIo4P1yvzCZdR_BEAA-1; Tue, 07 Jan 2020 10:09:37 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2214A107ACC5;
 Tue,  7 Jan 2020 15:09:36 +0000 (UTC)
Received: from localhost (ovpn-112-42.ams2.redhat.com [10.36.112.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 963877C82C;
 Tue,  7 Jan 2020 15:09:29 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/37] etraxfs: remove PROP_PTR usage
Date: Tue,  7 Jan 2020 19:04:29 +0400
Message-Id: <20200107150442.1727958-25-marcandre.lureau@redhat.com>
In-Reply-To: <20200107150442.1727958-1-marcandre.lureau@redhat.com>
References: <20200107150442.1727958-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: iksGxIo4P1yvzCZdR_BEAA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

etraxfs_dma_client are not Object, so can't be exposed to user with
QOM path. Let's remove property usage and move the constructor to the
.c unit, simplifying some code on the way.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/cris/etraxfs.h | 20 +++---------------
 hw/net/etraxfs_eth.c      | 44 +++++++++++++++++++++++++++++----------
 2 files changed, 36 insertions(+), 28 deletions(-)

diff --git a/include/hw/cris/etraxfs.h b/include/hw/cris/etraxfs.h
index aa146a2cd8..403e7f95e6 100644
--- a/include/hw/cris/etraxfs.h
+++ b/include/hw/cris/etraxfs.h
@@ -30,23 +30,9 @@
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
=20
-/* Instantiate an ETRAXFS Ethernet MAC.  */
-static inline DeviceState *
-etraxfs_eth_init(NICInfo *nd, hwaddr base, int phyaddr,
-                 void *dma_out, void *dma_in)
-{
-    DeviceState *dev;
-    qemu_check_nic_model(nd, "fseth");
-
-    dev =3D qdev_create(NULL, "etraxfs-eth");
-    qdev_set_nic_properties(dev, nd);
-    qdev_prop_set_uint32(dev, "phyaddr", phyaddr);
-    qdev_prop_set_ptr(dev, "dma_out", dma_out);
-    qdev_prop_set_ptr(dev, "dma_in", dma_in);
-    qdev_init_nofail(dev);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
-    return dev;
-}
+DeviceState *etraxfs_eth_init(NICInfo *nd, hwaddr base, int phyaddr,
+                              struct etraxfs_dma_client *dma_out,
+                              struct etraxfs_dma_client *dma_in);
=20
 static inline DeviceState *etraxfs_ser_create(hwaddr addr,
                                               qemu_irq irq,
diff --git a/hw/net/etraxfs_eth.c b/hw/net/etraxfs_eth.c
index 4cfbf1135a..f30d963487 100644
--- a/hw/net/etraxfs_eth.c
+++ b/hw/net/etraxfs_eth.c
@@ -338,14 +338,8 @@ typedef struct ETRAXFSEthState
     uint8_t macaddr[2][6];
     uint32_t regs[FS_ETH_MAX_REGS];
=20
-    union {
-        void *vdma_out;
-        struct etraxfs_dma_client *dma_out;
-    };
-    union {
-        void *vdma_in;
-        struct etraxfs_dma_client *dma_in;
-    };
+    struct etraxfs_dma_client *dma_out;
+    struct etraxfs_dma_client *dma_in;
=20
     /* MDIO bus.  */
     struct qemu_mdio mdio_bus;
@@ -635,8 +629,6 @@ static void etraxfs_eth_realize(DeviceState *dev, Error=
 **errp)
=20
 static Property etraxfs_eth_properties[] =3D {
     DEFINE_PROP_UINT32("phyaddr", ETRAXFSEthState, phyaddr, 1),
-    DEFINE_PROP_PTR("dma_out", ETRAXFSEthState, vdma_out),
-    DEFINE_PROP_PTR("dma_in", ETRAXFSEthState, vdma_in),
     DEFINE_NIC_PROPERTIES(ETRAXFSEthState, conf),
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -648,10 +640,40 @@ static void etraxfs_eth_class_init(ObjectClass *klass=
, void *data)
     dc->realize =3D etraxfs_eth_realize;
     dc->reset =3D etraxfs_eth_reset;
     dc->props =3D etraxfs_eth_properties;
-    /* Reason: pointer properties "dma_out", "dma_in" */
+    /* Reason: dma_out, dma_in are not user settable */
     dc->user_creatable =3D false;
 }
=20
+
+/* Instantiate an ETRAXFS Ethernet MAC.  */
+DeviceState *
+etraxfs_eth_init(NICInfo *nd, hwaddr base, int phyaddr,
+                 struct etraxfs_dma_client *dma_out,
+                 struct etraxfs_dma_client *dma_in)
+{
+    DeviceState *dev;
+    qemu_check_nic_model(nd, "fseth");
+
+    dev =3D qdev_create(NULL, "etraxfs-eth");
+    qdev_set_nic_properties(dev, nd);
+    qdev_prop_set_uint32(dev, "phyaddr", phyaddr);
+
+    /*
+     * TODO: QOM design, define a QOM interface for "I am an etraxfs
+     * DMA client" (which replaces the current 'struct
+     * etraxfs_dma_client' ad-hoc interface), implement it on the
+     * ethernet device, and then have QOM link properties on the DMA
+     * controller device so that you can pass the interface
+     * implementations to it.
+     */
+    ETRAX_FS_ETH(dev)->dma_out =3D dma_out;
+    ETRAX_FS_ETH(dev)->dma_in =3D dma_in;
+    qdev_init_nofail(dev);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
+
+    return dev;
+}
+
 static const TypeInfo etraxfs_eth_info =3D {
     .name          =3D TYPE_ETRAX_FS_ETH,
     .parent        =3D TYPE_SYS_BUS_DEVICE,
--=20
2.25.0.rc1.20.g2443f3f80d


