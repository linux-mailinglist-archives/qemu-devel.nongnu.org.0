Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E04400618
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:49:51 +0200 (CEST)
Received: from localhost ([::1]:56128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFCA-0003wF-80
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mMF3z-0003uM-Sf
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:41:23 -0400
Received: from smtpout3.3005.mail-out.ovh.net ([217.182.185.173]:59103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mMF3v-0002N5-AX
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:41:22 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.6])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 1CCC313FB0D;
 Fri,  3 Sep 2021 19:41:17 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 3 Sep
 2021 21:41:16 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0054e6b8c49-3119-4b73-ab6b-551d30e99916,
 15E2C03324B5D6AD2543493448FEC157D625CB40) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 14/14] hw/arm/aspeed: Add Fuji machine type
Date: Fri, 3 Sep 2021 21:41:08 +0200
Message-ID: <20210903194108.131403-15-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903194108.131403-1-clg@kaod.org>
References: <20210903194108.131403-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 846f1de3-6d19-495b-b79a-bc9052a7c5b5
X-Ovh-Tracer-Id: 8816922171038665577
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvjedgudefkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigfdvvdffffevleefgefhheegtedutdfgueevfeffleegledvuefhteetueekjeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout3.3005.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Delevoryas <pdel@fb.com>

This adds a new machine type "fuji-bmc" based on the following device tree:

https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts

Most of the i2c devices are not there, they're added here:

https://github.com/facebook/openbmc/blob/helium/meta-facebook/meta-fuji/recipes-utils/openbmc-utils/files/setup_i2c.sh

I tested this by building a Fuji image from Facebook's OpenBMC repo,
booting, and ssh'ing from host-to-guest.

git clone https://github.com/facebook/openbmc
cd openbmc
./sync_yocto.sh
source openbmc-init-build-env fuji build-fuji
bitbake fuji-image
dd if=/dev/zero of=/tmp/fuji.mtd bs=1M count=128
dd if=./tmp/deploy/images/fuji/flash-fuji of=/tmp/fuji.mtd \
    bs=1k conv=notrunc

git clone --branch aspeed-next https://github.com/peterdelevoryas/qemu
cd qemu
./configure --target-list=arm-softmmu --disable-vnc
make -j $(nproc)
./build/arm-softmmu/qemu-system-arm \
    -machine fuji-bmc \
    -drive file=/tmp/fuji.mtd,format=raw,if=mtd \
    -serial stdio \
    -nic user,hostfwd=::2222-:22
sshpass -p 0penBmc ssh root@localhost -p 2222

Signed-off-by: Peter Delevoryas <pdel@fb.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
[ clg: checkpatch fixes ]
Message-Id: <20210903082027.704397-2-pdel@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 116 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 7a9459340cf4..23e1a811ca08 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -159,6 +159,10 @@ struct AspeedMachineState {
 #define RAINIER_BMC_HW_STRAP1 0x00000000
 #define RAINIER_BMC_HW_STRAP2 0x00000000
 
+/* Fuji hardware value */
+#define FUJI_BMC_HW_STRAP1    0x00000000
+#define FUJI_BMC_HW_STRAP2    0x00000000
+
 /*
  * The max ram region is for firmwares that scan the address space
  * with load/store to guess how much RAM the SoC has.
@@ -772,6 +776,94 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
     aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x50, 64 * KiB);
 }
 
+static void get_pca9548_channels(I2CBus *bus, uint8_t mux_addr,
+                                 I2CBus **channels)
+{
+    I2CSlave *mux = i2c_slave_create_simple(bus, "pca9548", mux_addr);
+    for (int i = 0; i < 8; i++) {
+        channels[i] = pca954x_i2c_get_bus(mux, i);
+    }
+}
+
+#define TYPE_LM75 TYPE_TMP105
+#define TYPE_TMP75 TYPE_TMP105
+#define TYPE_TMP422 "tmp422"
+
+static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc = &bmc->soc;
+    I2CBus *i2c[144] = {};
+
+    for (int i = 0; i < 16; i++) {
+        i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
+    }
+    I2CBus *i2c180 = i2c[2];
+    I2CBus *i2c480 = i2c[8];
+    I2CBus *i2c600 = i2c[11];
+
+    get_pca9548_channels(i2c180, 0x70, &i2c[16]);
+    get_pca9548_channels(i2c480, 0x70, &i2c[24]);
+    /*
+     * NOTE: The device tree skips [32, 40) in the alias numbering, so we do
+     * the same here.
+     */
+    get_pca9548_channels(i2c600, 0x77, &i2c[40]);
+    get_pca9548_channels(i2c[24], 0x71, &i2c[48]);
+    get_pca9548_channels(i2c[25], 0x72, &i2c[56]);
+    get_pca9548_channels(i2c[26], 0x76, &i2c[64]);
+    get_pca9548_channels(i2c[27], 0x76, &i2c[72]);
+    for (int i = 0; i < 8; i++) {
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
+    for (int i = 0; i < 8; i++) {
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
@@ -1070,6 +1162,26 @@ static void aspeed_machine_rainier_class_init(ObjectClass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 };
 
+static void aspeed_machine_fuji_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc = "Facebook Fuji BMC (Cortex-A7)";
+    amc->soc_name = "ast2600-a3";
+    amc->hw_strap1 = FUJI_BMC_HW_STRAP1;
+    amc->hw_strap2 = FUJI_BMC_HW_STRAP2;
+    amc->fmc_model = "mx66l1g45g";
+    amc->spi_model = "mx66l1g45g";
+    amc->num_cs = 2;
+    amc->macs_mask = ASPEED_MAC3_ON;
+    amc->i2c_init = fuji_bmc_i2c_init;
+    amc->uart_default = ASPEED_DEV_UART1;
+    mc->default_ram_size = 2 * GiB;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus =
+        aspeed_soc_num_cpus(amc->soc_name);
+};
+
 static const TypeInfo aspeed_machine_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
@@ -1119,6 +1231,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name          = MACHINE_TYPE_NAME("rainier-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_rainier_class_init,
+    }, {
+        .name          = MACHINE_TYPE_NAME("fuji-bmc"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_fuji_class_init,
     }, {
         .name          = TYPE_ASPEED_MACHINE,
         .parent        = TYPE_MACHINE,
-- 
2.31.1


