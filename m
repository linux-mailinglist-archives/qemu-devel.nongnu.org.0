Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B866F519230
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 01:14:34 +0200 (CEST)
Received: from localhost ([::1]:34662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm1iz-0000Ql-GK
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 19:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=61228a338c=pdel@fb.com>)
 id 1nm1XI-0007SZ-0o
 for qemu-devel@nongnu.org; Tue, 03 May 2022 19:02:28 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:42286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=61228a338c=pdel@fb.com>)
 id 1nm1XG-0007lR-8G
 for qemu-devel@nongnu.org; Tue, 03 May 2022 19:02:27 -0400
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243HFlla008454
 for <qemu-devel@nongnu.org>; Tue, 3 May 2022 16:02:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=w7WZS8JB1wb31fSBmGUAV8X6JoYOKGGhLtZ864uY10Q=;
 b=LGfR6TvroijNc/o8Ru/zhPWBpy1mI3DAkteHznF73hQaciwORDE7hgicABVEMuKzmaQe
 8GqCt2uJw3RxbR+ijvwLjezDvE1RBu/vE4DOEKx2/W4+c3qi4UIw2leDy1GoNIBm8DXg
 8xlafP9PbkK5ENpQZmet4zGhkmb7Gl6KWXc= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3fs2uy46f0-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 16:02:25 -0700
Received: from twshared31479.05.prn5.facebook.com (2620:10d:c085:208::f) by
 mail.thefacebook.com (2620:10d:c085:21d::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 3 May 2022 16:01:48 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 453485ADEA5A; Tue,  3 May 2022 16:01:46 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <patrick@stwcx.xyz>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <clg@kaod.org>
Subject: [PATCH v2 1/1] hw/arm/aspeed: Add fby35 machine type
Date: Tue, 3 May 2022 15:59:28 -0700
Message-ID: <20220503225925.1798324-2-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220503225925.1798324-1-pdel@fb.com>
References: <20220503225925.1798324-1-pdel@fb.com>
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: xIhTqbIXfKZyGZF1DrpI9wLQq1kOuDXc
X-Proofpoint-GUID: xIhTqbIXfKZyGZF1DrpI9wLQq1kOuDXc
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-03_09,2022-05-02_03,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=61228a338c=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Add the 'fby35-bmc' machine type based on the kernel DTS[1] and userspace
i2c setup scripts[2]. Undefined values are inherited from the AST2600-EVB.

Reference images can be found in Facebook OpenBMC Github Release assets
as "fby35.mtd". [3]

You can boot the reference images as follows (fby35 uses dual-flash):

qemu-system-arm -machine fby35-bmc \
    -drive file=3Dfby35.mtd,format=3Draw,if=3Dmtd \
    -drive file=3Dfby35.mtd,format=3Draw,if=3Dmtd \
    -nographic

[1] https://github.com/facebook/openbmc-linux/blob/412d5053258007117e94b1e3=
6015aefc1301474b/arch/arm/boot/dts/aspeed-bmc-facebook-fby35.dts
[2] https://github.com/facebook/openbmc/blob/e2294ff5d31dd65c248fe396a38528=
6d6d5c463d/meta-facebook/meta-fby35/recipes-fby35/plat-utils/files/setup-de=
v.sh
[3] https://github.com/facebook/openbmc/releases

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---

v2: Removed avocado test, updated commit message.

 hw/arm/aspeed.c | 63 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index a74c13ab0f..725c169488 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -21,6 +21,7 @@
 #include "hw/misc/led.h"
 #include "hw/qdev-properties.h"
 #include "sysemu/block-backend.h"
+#include "sysemu/reset.h"
 #include "hw/loader.h"
 #include "qemu/error-report.h"
 #include "qemu/units.h"
@@ -951,6 +952,35 @@ static void bletchley_bmc_i2c_init(AspeedMachineState =
*bmc)
     i2c_slave_create_simple(i2c[12], TYPE_PCA9552, 0x67);
 }
=20
+static void fby35_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc =3D &bmc->soc;
+    I2CBus *i2c[16];
+
+    for (int i =3D 0; i < 16; i++) {
+        i2c[i] =3D aspeed_i2c_get_bus(&soc->i2c, i);
+    }
+
+    i2c_slave_create_simple(i2c[2], TYPE_LM75, 0x4f);
+    i2c_slave_create_simple(i2c[8], TYPE_TMP421, 0x1f);
+    /* Hotswap controller is actually supposed to be mp5920 or ltc4282. */
+    i2c_slave_create_simple(i2c[11], "adm1272", 0x44);
+    i2c_slave_create_simple(i2c[12], TYPE_LM75, 0x4e);
+    i2c_slave_create_simple(i2c[12], TYPE_LM75, 0x4f);
+
+    aspeed_eeprom_init(i2c[4], 0x51, 128 * KiB);
+    aspeed_eeprom_init(i2c[6], 0x51, 128 * KiB);
+    aspeed_eeprom_init(i2c[8], 0x50, 32 * KiB);
+    aspeed_eeprom_init(i2c[11], 0x51, 128 * KiB);
+    aspeed_eeprom_init(i2c[11], 0x54, 128 * KiB);
+
+    /*
+     * TODO: There is a multi-master i2c connection to an AST1030 MiniBMC =
on
+     * buses 0, 1, 2, 3, and 9. Source address 0x10, target address 0x20 on
+     * each.
+     */
+}
+
 static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
 {
     return ASPEED_MACHINE(obj)->mmio_exec;
@@ -1293,6 +1323,35 @@ static void aspeed_machine_bletchley_class_init(Obje=
ctClass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 }
=20
+static void fby35_reset(MachineState *state)
+{
+    AspeedMachineState *bmc =3D ASPEED_MACHINE(state);
+    AspeedGPIOState *gpio =3D &bmc->soc.gpio;
+
+    qemu_devices_reset();
+
+    /* Board ID */
+    object_property_set_bool(OBJECT(gpio), "gpioV4", true, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioV5", true, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioV6", true, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioV7", false, &error_fatal);
+}
+
+static void aspeed_machine_fby35_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       =3D "Facebook fby35 BMC (Cortex-A7)";
+    mc->reset      =3D fby35_reset;
+    amc->fmc_model =3D "mx66l1g45g";
+    amc->num_cs    =3D 2;
+    amc->macs_mask =3D ASPEED_MAC3_ON;
+    amc->i2c_init  =3D fby35_i2c_init;
+    /* FIXME: Replace this macro with something more general */
+    mc->default_ram_size =3D FUJI_BMC_RAM_SIZE;
+}
+
 #define AST1030_INTERNAL_FLASH_SIZE (1024 * 1024)
 /* Main SYSCLK frequency in Hz (200MHz) */
 #define SYSCLK_FRQ 200000000ULL
@@ -1411,6 +1470,10 @@ static const TypeInfo aspeed_machine_types[] =3D {
         .name          =3D MACHINE_TYPE_NAME("bletchley-bmc"),
         .parent        =3D TYPE_ASPEED_MACHINE,
         .class_init    =3D aspeed_machine_bletchley_class_init,
+    }, {
+        .name          =3D MACHINE_TYPE_NAME("fby35-bmc"),
+        .parent        =3D MACHINE_TYPE_NAME("ast2600-evb"),
+        .class_init    =3D aspeed_machine_fby35_class_init,
     }, {
         .name           =3D MACHINE_TYPE_NAME("ast1030-evb"),
         .parent         =3D TYPE_ASPEED_MACHINE,
--=20
2.30.2


