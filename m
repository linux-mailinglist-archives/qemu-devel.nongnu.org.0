Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D441320E2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 09:02:55 +0100 (CET)
Received: from localhost ([::1]:44050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iojUu-0005MZ-0f
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 02:41:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51369)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iojO1-00023d-8g
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 02:34:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iojNz-0006ik-HL
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 02:34:44 -0500
Received: from 4.mo69.mail-out.ovh.net ([46.105.42.102]:58003)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iojNz-0006ha-AP
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 02:34:43 -0500
Received: from player755.ha.ovh.net (unknown [10.108.35.185])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 5DC847B106
 for <qemu-devel@nongnu.org>; Tue,  7 Jan 2020 08:34:41 +0100 (CET)
Received: from kaod.org (lfbn-tou-1-1227-223.w90-76.abo.wanadoo.fr
 [90.76.50.223]) (Authenticated sender: clg@kaod.org)
 by player755.ha.ovh.net (Postfix) with ESMTPSA id A925ADFE0C27;
 Tue,  7 Jan 2020 07:34:32 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 1/5] hw/sd: Configure number of slots exposed by the ASPEED
 SDHCI model
Date: Tue,  7 Jan 2020 08:34:19 +0100
Message-Id: <20200107073423.30043-2-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200107073423.30043-1-clg@kaod.org>
References: <20200107073423.30043-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 3787808764389329681
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdehuddguddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdeltddrjeeirdehtddrvddvfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeehhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.42.102
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Jeffery <andrew@aj.id.au>

The AST2600 includes a second cut-down version of the SD/MMC controller
found in the AST2500, named the eMMC controller. It's cut down in the
sense that it only supports one slot rather than two, but it brings the
total number of slots supported by the AST2600 to three.

The existing code assumed that the SD controller always provided two
slots. Rework the SDHCI object to expose the number of slots as a
property to be set by the SoC configuration.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/sd/aspeed_sdhci.h |  1 +
 hw/arm/aspeed.c              |  2 +-
 hw/arm/aspeed_ast2600.c      |  2 ++
 hw/arm/aspeed_soc.c          |  2 ++
 hw/sd/aspeed_sdhci.c         | 11 +++++++++--
 5 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/include/hw/sd/aspeed_sdhci.h b/include/hw/sd/aspeed_sdhci.h
index dfdab4379021..dffbb46946b9 100644
--- a/include/hw/sd/aspeed_sdhci.h
+++ b/include/hw/sd/aspeed_sdhci.h
@@ -24,6 +24,7 @@ typedef struct AspeedSDHCIState {
     SysBusDevice parent;
=20
     SDHCIState slots[ASPEED_SDHCI_NUM_SLOTS];
+    uint8_t num_slots;
=20
     MemoryRegion iomem;
     qemu_irq irq;
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index cc06af4fbb3e..4174e313cae5 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -263,7 +263,7 @@ static void aspeed_machine_init(MachineState *machine=
)
         amc->i2c_init(bmc);
     }
=20
-    for (i =3D 0; i < ARRAY_SIZE(bmc->soc.sdhci.slots); i++) {
+    for (i =3D 0; i < bmc->soc.sdhci.num_slots; i++) {
         SDHCIState *sdhci =3D &bmc->soc.sdhci.slots[i];
         DriveInfo *dinfo =3D drive_get_next(IF_SD);
         BlockBackend *blk;
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 89e4b0095041..fb73c4043ea3 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -199,6 +199,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
     sysbus_init_child_obj(obj, "sdc", OBJECT(&s->sdhci), sizeof(s->sdhci=
),
                           TYPE_ASPEED_SDHCI);
=20
+    object_property_set_int(OBJECT(&s->sdhci), 2, "num-slots", &error_ab=
ort);
+
     /* Init sd card slot class here so that they're under the correct pa=
rent */
     for (i =3D 0; i < ASPEED_SDHCI_NUM_SLOTS; ++i) {
         sysbus_init_child_obj(obj, "sdhci[*]", OBJECT(&s->sdhci.slots[i]=
),
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index a6237e594017..c15ceb683950 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -209,6 +209,8 @@ static void aspeed_soc_init(Object *obj)
     sysbus_init_child_obj(obj, "sdc", OBJECT(&s->sdhci), sizeof(s->sdhci=
),
                           TYPE_ASPEED_SDHCI);
=20
+    object_property_set_int(OBJECT(&s->sdhci), 2, "num-slots", &error_ab=
ort);
+
     /* Init sd card slot class here so that they're under the correct pa=
rent */
     for (i =3D 0; i < ASPEED_SDHCI_NUM_SLOTS; ++i) {
         sysbus_init_child_obj(obj, "sdhci[*]", OBJECT(&s->sdhci.slots[i]=
),
diff --git a/hw/sd/aspeed_sdhci.c b/hw/sd/aspeed_sdhci.c
index cff3eb7dd21e..939d1510dedb 100644
--- a/hw/sd/aspeed_sdhci.c
+++ b/hw/sd/aspeed_sdhci.c
@@ -13,6 +13,7 @@
 #include "qapi/error.h"
 #include "hw/irq.h"
 #include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
=20
 #define ASPEED_SDHCI_INFO            0x00
 #define  ASPEED_SDHCI_INFO_RESET     0x00030000
@@ -120,14 +121,14 @@ static void aspeed_sdhci_realize(DeviceState *dev, =
Error **errp)
=20
     /* Create input irqs for the slots */
     qdev_init_gpio_in_named_with_opaque(DEVICE(sbd), aspeed_sdhci_set_ir=
q,
-                                        sdhci, NULL, ASPEED_SDHCI_NUM_SL=
OTS);
+                                        sdhci, NULL, sdhci->num_slots);
=20
     sysbus_init_irq(sbd, &sdhci->irq);
     memory_region_init_io(&sdhci->iomem, OBJECT(sdhci), &aspeed_sdhci_op=
s,
                           sdhci, TYPE_ASPEED_SDHCI, 0x1000);
     sysbus_init_mmio(sbd, &sdhci->iomem);
=20
-    for (int i =3D 0; i < ASPEED_SDHCI_NUM_SLOTS; ++i) {
+    for (int i =3D 0; i < sdhci->num_slots; ++i) {
         Object *sdhci_slot =3D OBJECT(&sdhci->slots[i]);
         SysBusDevice *sbd_slot =3D SYS_BUS_DEVICE(&sdhci->slots[i]);
=20
@@ -174,6 +175,11 @@ static const VMStateDescription vmstate_aspeed_sdhci=
 =3D {
     },
 };
=20
+static Property aspeed_sdhci_properties[] =3D {
+    DEFINE_PROP_UINT8("num-slots", AspeedSDHCIState, num_slots, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void aspeed_sdhci_class_init(ObjectClass *classp, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(classp);
@@ -181,6 +187,7 @@ static void aspeed_sdhci_class_init(ObjectClass *clas=
sp, void *data)
     dc->realize =3D aspeed_sdhci_realize;
     dc->reset =3D aspeed_sdhci_reset;
     dc->vmsd =3D &vmstate_aspeed_sdhci;
+    dc->props =3D aspeed_sdhci_properties;
 }
=20
 static TypeInfo aspeed_sdhci_info =3D {
--=20
2.21.1


