Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCC13FFBCC
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 10:22:31 +0200 (CEST)
Received: from localhost ([::1]:60764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM4T0-0000JY-Tt
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 04:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8880d40211=pdel@fb.com>)
 id 1mM4RN-0007JU-4s
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 04:20:49 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:29910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8880d40211=pdel@fb.com>)
 id 1mM4RK-0002Rz-UG
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 04:20:48 -0400
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 18385LbV016039
 for <qemu-devel@nongnu.org>; Fri, 3 Sep 2021 01:20:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=Vq5iCSx8Id6qY8McT9OYDl8gCzivphjvXnwXJWN8h6c=;
 b=NV6zreEigTXR2L3J5l4QZE1iMsd7QtbUwMWrG88xMYJ7IGXVFECnHls2xb5AKP/AYPgl
 dNsvEbguKjDmUMxIUL1CSajpogWQB7yAZVa/Xdlv708A7eYC+tN9tvTtiQrxPZkoMYFM
 piizcOZOW0k9cieDrySl8y3aTkVIoBaJ36s= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3aubk023h5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 01:20:44 -0700
Received: from intmgw001.05.prn6.facebook.com (2620:10d:c085:208::11) by
 mail.thefacebook.com (2620:10d:c085:11d::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Fri, 3 Sep 2021 01:20:43 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id 9910A18C838B; Fri,  3 Sep 2021 01:20:42 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <clg@kaod.org>, <joel@jms.id.au>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <patrick@stwcx.xyz>, Peter Delevoryas <pdel@fb.com>
Subject: [PATCH v2 1/1] hw/arm/aspeed: Add Fuji machine type
Date: Fri, 3 Sep 2021 01:20:27 -0700
Message-ID: <20210903082027.704397-2-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903082027.704397-1-pdel@fb.com>
References: <20210903082027.704397-1-pdel@fb.com>
X-FB-Internal: Safe
Content-Type: text/plain
X-FB-Source: Intern
X-Proofpoint-ORIG-GUID: Y_zfydOSjD7e08tIGHu2dMiIHtC1nw8b
X-Proofpoint-GUID: Y_zfydOSjD7e08tIGHu2dMiIHtC1nw8b
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-03_02:2021-09-03,
 2021-09-03 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2108310000 definitions=main-2109030049
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=8880d40211=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Delevoryas <pdel@fb.com>

This adds a new machine type "fuji-bmc" based on the following device tree:

https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/aspeed-bmc-=
facebook-fuji.dts

Most of the i2c devices are not there, they're added here:

https://github.com/facebook/openbmc/blob/helium/meta-facebook/meta-fuji/rec=
ipes-utils/openbmc-utils/files/setup_i2c.sh

I tested this by building a Fuji image from Facebook's OpenBMC repo,
booting, and ssh'ing from host-to-guest.

git clone https://github.com/facebook/openbmc
cd openbmc
./sync_yocto.sh
source openbmc-init-build-env fuji build-fuji
bitbake fuji-image
dd if=3D/dev/zero of=3D/tmp/fuji.mtd bs=3D1M count=3D128
dd if=3D./tmp/deploy/images/fuji/flash-fuji of=3D/tmp/fuji.mtd \
    bs=3D1k conv=3Dnotrunc

git clone --branch aspeed-next https://github.com/peterdelevoryas/qemu
cd qemu
./configure --target-list=3Darm-softmmu --disable-vnc
make -j $(nproc)
./build/arm-softmmu/qemu-system-arm \
    -machine fuji-bmc \
    -drive file=3D/tmp/fuji.mtd,format=3Draw,if=3Dmtd \
    -serial stdio \
    -nic user,hostfwd=3D::2222-:22
sshpass -p 0penBmc ssh root@localhost -p 2222

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed.c | 112 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 7a9459340c..cc2d721ac7 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -159,6 +159,10 @@ struct AspeedMachineState {
 #define RAINIER_BMC_HW_STRAP1 0x00000000
 #define RAINIER_BMC_HW_STRAP2 0x00000000
=20
+/* Fuji hardware value */
+#define FUJI_BMC_HW_STRAP1    0x00000000
+#define FUJI_BMC_HW_STRAP2    0x00000000
+
 /*
  * The max ram region is for firmwares that scan the address space
  * with load/store to guess how much RAM the SoC has.
@@ -772,6 +776,90 @@ static void rainier_bmc_i2c_init(AspeedMachineState *b=
mc)
     aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x50, 64 * KiB);
 }
=20
+static void get_pca9548_channels(I2CBus *bus, uint8_t mux_addr, I2CBus **c=
hannels) {
+    I2CSlave *mux =3D i2c_slave_create_simple(bus, "pca9548", mux_addr);
+    for (int i =3D 0; i < 8; i++) {
+        channels[i] =3D pca954x_i2c_get_bus(mux, i);
+    }
+}
+
+#define TYPE_LM75 TYPE_TMP105
+#define TYPE_TMP75 TYPE_TMP105
+#define TYPE_TMP422 "tmp422"
+
+static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc =3D &bmc->soc;
+    I2CBus *i2c[144] =3D {};
+
+    for (int i =3D 0; i < 16; i++) {
+        i2c[i] =3D aspeed_i2c_get_bus(&soc->i2c, i);
+    }
+    I2CBus *i2c180 =3D i2c[2];
+    I2CBus *i2c480 =3D i2c[8];
+    I2CBus *i2c600 =3D i2c[11];
+
+    get_pca9548_channels(i2c180, 0x70, &i2c[16]);
+    get_pca9548_channels(i2c480, 0x70, &i2c[24]);
+    // NOTE: The device tree skips [32, 40) in the alias numbering, so we =
do
+    // the same here.
+    get_pca9548_channels(i2c600, 0x77, &i2c[40]);
+    get_pca9548_channels(i2c[24], 0x71, &i2c[48]);
+    get_pca9548_channels(i2c[25], 0x72, &i2c[56]);
+    get_pca9548_channels(i2c[26], 0x76, &i2c[64]);
+    get_pca9548_channels(i2c[27], 0x76, &i2c[72]);
+    for (int i =3D 0; i < 8; i++) {
+        get_pca9548_channels(i2c[40 + i], 0x76, &i2c[80 + i * 8]);
+    }
+
+    i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4c);
+    i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4d);
+
+    aspeed_eeprom_init(i2c[19], 0x52, 64 * KiB);
+    aspeed_eeprom_init(i2c[20], 0x50, 2 * KiB);
+    aspeed_eeprom_init(i2c[22], 0x52, 2 * KiB);
+
+    i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x48);
+    i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x49);
+    i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x4a);
+    i2c_slave_create_simple(i2c[3], TYPE_TMP422, 0x4c);
+
+    aspeed_eeprom_init(i2c[8], 0x51, 64 * KiB);
+    i2c_slave_create_simple(i2c[8], TYPE_LM75, 0x4a);
+
+    i2c_slave_create_simple(i2c[50], TYPE_LM75, 0x4c);
+    aspeed_eeprom_init(i2c[50], 0x52, 64 * KiB);
+    i2c_slave_create_simple(i2c[51], TYPE_TMP75, 0x48);
+    i2c_slave_create_simple(i2c[52], TYPE_TMP75, 0x49);
+
+    i2c_slave_create_simple(i2c[59], TYPE_TMP75, 0x48);
+    i2c_slave_create_simple(i2c[60], TYPE_TMP75, 0x49);
+
+    aspeed_eeprom_init(i2c[65], 0x53, 64 * KiB);
+    i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x49);
+    i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x48);
+    aspeed_eeprom_init(i2c[68], 0x52, 64 * KiB);
+    aspeed_eeprom_init(i2c[69], 0x52, 64 * KiB);
+    aspeed_eeprom_init(i2c[70], 0x52, 64 * KiB);
+    aspeed_eeprom_init(i2c[71], 0x52, 64 * KiB);
+
+    aspeed_eeprom_init(i2c[73], 0x53, 64 * KiB);
+    i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x49);
+    i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x48);
+    aspeed_eeprom_init(i2c[76], 0x52, 64 * KiB);
+    aspeed_eeprom_init(i2c[77], 0x52, 64 * KiB);
+    aspeed_eeprom_init(i2c[78], 0x52, 64 * KiB);
+    aspeed_eeprom_init(i2c[79], 0x52, 64 * KiB);
+    aspeed_eeprom_init(i2c[28], 0x50, 2 * KiB);
+
+    for (int i =3D 0; i < 8; i++) {
+        aspeed_eeprom_init(i2c[81 + i * 8], 0x56, 64 * KiB);
+        i2c_slave_create_simple(i2c[82 + i * 8], TYPE_TMP75, 0x48);
+        i2c_slave_create_simple(i2c[83 + i * 8], TYPE_TMP75, 0x4b);
+        i2c_slave_create_simple(i2c[84 + i * 8], TYPE_TMP75, 0x4a);
+    }
+}
+
 static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
 {
     return ASPEED_MACHINE(obj)->mmio_exec;
@@ -1070,6 +1158,26 @@ static void aspeed_machine_rainier_class_init(Object=
Class *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 };
=20
+static void aspeed_machine_fuji_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc =3D "Facebook Fuji BMC (Cortex-A7)";
+    amc->soc_name =3D "ast2600-a3";
+    amc->hw_strap1 =3D FUJI_BMC_HW_STRAP1;
+    amc->hw_strap2 =3D FUJI_BMC_HW_STRAP2;
+    amc->fmc_model =3D "mx66l1g45g";
+    amc->spi_model =3D "mx66l1g45g";
+    amc->num_cs =3D 2;
+    amc->macs_mask =3D ASPEED_MAC3_ON;
+    amc->i2c_init =3D fuji_bmc_i2c_init;
+    amc->uart_default =3D ASPEED_DEV_UART1;
+    mc->default_ram_size =3D 2 * GiB;
+    mc->default_cpus =3D mc->min_cpus =3D mc->max_cpus =3D
+        aspeed_soc_num_cpus(amc->soc_name);
+};
+
 static const TypeInfo aspeed_machine_types[] =3D {
     {
         .name          =3D MACHINE_TYPE_NAME("palmetto-bmc"),
@@ -1119,6 +1227,10 @@ static const TypeInfo aspeed_machine_types[] =3D {
         .name          =3D MACHINE_TYPE_NAME("rainier-bmc"),
         .parent        =3D TYPE_ASPEED_MACHINE,
         .class_init    =3D aspeed_machine_rainier_class_init,
+    }, {
+        .name          =3D MACHINE_TYPE_NAME("fuji-bmc"),
+        .parent        =3D TYPE_ASPEED_MACHINE,
+        .class_init    =3D aspeed_machine_fuji_class_init,
     }, {
         .name          =3D TYPE_ASPEED_MACHINE,
         .parent        =3D TYPE_MACHINE,
--=20
2.30.2


