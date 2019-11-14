Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD405FC30E
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Nov 2019 10:52:05 +0100 (CET)
Received: from localhost ([::1]:54944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVBnI-00040h-RH
	for lists+qemu-devel@lfdr.de; Thu, 14 Nov 2019 04:52:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37445)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iVBi0-0007vO-II
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 04:46:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iVBhz-0004cM-7C
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 04:46:36 -0500
Received: from 5.mo6.mail-out.ovh.net ([46.105.54.31]:53704)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iVBhz-0004bh-1R
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 04:46:35 -0500
Received: from player737.ha.ovh.net (unknown [10.108.57.16])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 5717C1EC539
 for <qemu-devel@nongnu.org>; Thu, 14 Nov 2019 10:46:33 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player737.ha.ovh.net (Postfix) with ESMTPSA id DDAA32A786B0;
 Thu, 14 Nov 2019 09:46:25 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 5/5] aspeed: Add support for the tacoma-bmc board
Date: Thu, 14 Nov 2019 10:45:44 +0100
Message-Id: <20191114094544.30114-6-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191114094544.30114-1-clg@kaod.org>
References: <20191114094544.30114-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 2483735194706610961
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeffedgtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejfeejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedu
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.54.31
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Tacoma BMC board is replacement board for the BMC of the OpenPOWER
Witherspoon system. It uses a AST2600 SoC instead of a AST2500 and is
used for HW bringup.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index e34e6787430b..729f2e79cd79 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -92,6 +92,10 @@ struct AspeedBoardState {
 #define AST2600_EVB_HW_STRAP1 0x000000C0
 #define AST2600_EVB_HW_STRAP2 0x00000003
=20
+/* Tacoma hardware value */
+#define TACOMA_BMC_HW_STRAP1  0x00000000
+#define TACOMA_BMC_HW_STRAP2  0x00000000
+
 /*
  * The max ram region is for firmwares that scan the address space
  * with load/store to guess how much RAM the SoC has.
@@ -167,6 +171,34 @@ static void aspeed_board_init_flashes(AspeedSMCState=
 *s, const char *flashtype,
     }
 }
=20
+static void tacoma_bmc_i2c_init(AspeedBoardState *bmc)
+{
+    AspeedSoCState *soc =3D &bmc->soc;
+    uint8_t *eeprom_buf =3D g_malloc0(8 * 1024);
+
+    /* Bus 3: TODO bmp280@77 */
+    /* Bus 3: TODO max31785@52 */
+    /* Bus 3: TODO dps310@76 */
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), "pca9552"=
, 0x60);
+
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), "tmp423",=
 0x4c);
+
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 5), "tmp423",=
 0x4c);
+
+    /* The tacoma expects a TMP275 but a TMP105 is compatible */
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 9), TYPE_TMP1=
05,
+                     0x4a);
+
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "pca9552=
",
+                     0x60);
+    /* The tacoma expects Epson RX8900 RTC but a ds1338 is compatible */
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "ds1338"=
,
+                     0x32);
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), 0x5=
1,
+                          eeprom_buf);
+    /* Bus 11: TODO ucd90160@64 */
+}
+
 static void aspeed_machine_init(MachineState *machine)
 {
     AspeedBoardState *bmc;
@@ -485,6 +517,22 @@ static void aspeed_machine_ast2600_evb_class_init(Ob=
jectClass *oc, void *data)
     mc->default_ram_size =3D 1 * GiB;
 };
=20
+static void aspeed_machine_tacoma_class_init(ObjectClass *oc, void *data=
)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       =3D "Aspeed AST2600 EVB (Cortex A7)";
+    amc->soc_name  =3D "ast2600-a0";
+    amc->hw_strap1 =3D TACOMA_BMC_HW_STRAP1;
+    amc->hw_strap2 =3D TACOMA_BMC_HW_STRAP2;
+    amc->fmc_model =3D "mx66l1g45g";
+    amc->spi_model =3D "mx66l1g45g";
+    amc->num_cs    =3D 2;
+    amc->i2c_init  =3D tacoma_bmc_i2c_init;
+    mc->default_ram_size =3D 1 * GiB;
+};
+
 static const TypeInfo aspeed_machine_types[] =3D {
     {
         .name          =3D MACHINE_TYPE_NAME("palmetto-bmc"),
@@ -510,6 +558,10 @@ static const TypeInfo aspeed_machine_types[] =3D {
         .name          =3D MACHINE_TYPE_NAME("ast2600-evb"),
         .parent        =3D TYPE_ASPEED_MACHINE,
         .class_init    =3D aspeed_machine_ast2600_evb_class_init,
+    }, {
+        .name          =3D MACHINE_TYPE_NAME("tacoma-bmc"),
+        .parent        =3D TYPE_ASPEED_MACHINE,
+        .class_init    =3D aspeed_machine_tacoma_class_init,
     }, {
         .name          =3D TYPE_ASPEED_MACHINE,
         .parent        =3D TYPE_MACHINE,
--=20
2.21.0


