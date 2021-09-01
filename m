Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D803FE592
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 01:02:29 +0200 (CEST)
Received: from localhost ([::1]:60800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLZFT-0000TP-U3
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 19:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8878769573=pdel@fb.com>)
 id 1mLZD3-0007Kt-Vz
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 18:59:58 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:32984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8878769573=pdel@fb.com>)
 id 1mLZD0-0001kD-Qk
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 18:59:57 -0400
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 181MxRpr003247
 for <qemu-devel@nongnu.org>; Wed, 1 Sep 2021 15:59:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=Sa4UTLik+NUh5h39EqGmEIW8tWssV/sxVE0NuYicMaQ=;
 b=jSRB2bbOun5MuXXAFEZqyDGtjKGLYL4jh8R9B4xbx5YfJmJefdWdtjAkadvXqwyrJhvs
 CpY0iO0LK97XYQfnofuur/W64G0d3SrenuI6v2oTEnj/FFv3DyC72mDdiDJ+ctURJzhs
 0tlvXS6oYjjI1hNQ+2+N4hhq7jhMMODLq4A= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3ate08vnxr-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 15:59:53 -0700
Received: from intmgw002.46.prn1.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:82::d) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Wed, 1 Sep 2021 15:59:51 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id 776D317DA288; Wed,  1 Sep 2021 15:59:47 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <clg@kaod.org>, <joel@jms.id.au>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <patrick@stwcx.xyz>, <f4bug@amsat.org>,
 <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 Peter Delevoryas <pdel@fb.com>
Subject: [PATCH 1/1] hw/arm/aspeed: Add Fuji machine type
Date: Wed, 1 Sep 2021 15:59:46 -0700
Message-ID: <20210901225946.500125-2-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901225946.500125-1-pdel@fb.com>
References: <20210901225946.500125-1-pdel@fb.com>
X-FB-Internal: Safe
Content-Type: text/plain
X-FB-Source: Intern
X-Proofpoint-GUID: S3BJ3zOGP444FJ5FieWsnwXII-bRIv14
X-Proofpoint-ORIG-GUID: S3BJ3zOGP444FJ5FieWsnwXII-bRIv14
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-01_05:2021-09-01,
 2021-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2108310000 definitions=main-2109010135
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=8878769573=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

This adds a new machine type "fuji-bmc" that's equivalent to
"ast2600-evb" except that it uses MAC3 and UART1. It might be
appropriate to change other aspects of this machine type in the future,
but so far this is all the specificity necessary to get a Fuji OpenBMC
image booting and networking within QEMU.

Here's a link to the device tree:

https://github.com/facebook/openbmc-uboot/blob/openbmc/helium/v2019.04/arch=
/arm/dts/aspeed-bmc-facebook-fuji.dts

I tested this by building a Fuji image from Facebook's OpenBMC repo,
booting it, and ssh'ing into it.

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

U-Boot 2019.04 fuji-b9c651226b (Aug 25 2021 - 17:27:02 +0000)

SOC: AST2600-A3
eSPI Mode: SIO:Enable : SuperIO-2e
Eth: MAC0: RGMII, MAC1: RGMII, MAC2: RGMII, MAC3: RGMII
Model: Aspeed BMC
DRAM:  896 MiB (capacity:1024 MiB, VGA:64 MiB, ECC:on, ECC size:896 MiB)
MMC:   emmc_slot0@100: 0
...

sshpass -p 0penBmc ssh root@localhost -p 2222

Warning: Permanently added '[localhost]:2222' (ECDSA) to the list of known
Last login: Fri Mar  9 04:36:31 2018
root@bmc-oob:~# exit
logout
Connection to localhost closed.

I also created a Github release with the Fuji mtd image and added an
acceptance test utilizing it.

https://github.com/peterdelevoryas/openbmc/releases/tag/fuji-v0.1-alpha

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed.c                        | 14 ++++++++++++++
 tests/acceptance/boot_linux_console.py | 25 +++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 7a9459340c..3b8b660a34 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1070,6 +1070,16 @@ static void aspeed_machine_rainier_class_init(Object=
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
+    amc->macs_mask =3D ASPEED_MAC3_ON;
+    amc->uart_default =3D ASPEED_DEV_UART1;
+};
+
 static const TypeInfo aspeed_machine_types[] =3D {
     {
         .name          =3D MACHINE_TYPE_NAME("palmetto-bmc"),
@@ -1119,6 +1129,10 @@ static const TypeInfo aspeed_machine_types[] =3D {
         .name          =3D MACHINE_TYPE_NAME("rainier-bmc"),
         .parent        =3D TYPE_ASPEED_MACHINE,
         .class_init    =3D aspeed_machine_rainier_class_init,
+    }, {
+        .name          =3D MACHINE_TYPE_NAME("fuji-bmc"),
+        .parent        =3D MACHINE_TYPE_NAME("ast2600-evb"),
+        .class_init    =3D aspeed_machine_fuji_class_init,
     }, {
         .name          =3D TYPE_ASPEED_MACHINE,
         .parent        =3D TYPE_MACHINE,
diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot=
_linux_console.py
index 5248c8097d..63d32f6743 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -1143,6 +1143,31 @@ def test_arm_ast2600_debian(self):
         self.wait_for_console_pattern("SMP: Total of 2 processors activate=
d")
         self.wait_for_console_pattern("No filesystem could mount root")
=20
+    def test_arm_ast2600_fuji_openbmc(self):
+        """
+        :avocado: tags=3Darch:arm
+        :avocado: tags=3Dmachine:fuji-bmc
+        """
+
+        image_url =3D ('https://github.com/peterdelevoryas/openbmc/release=
s/download/'
+                     'fuji-v0.1-alpha/fuji.mtd')
+        image_hash =3D '36dd945a2ee34694684b5f3e7351517598bb39d8b6899c71bb=
d23791b42e082e'
+        image_path =3D self.fetch_asset(image_url, asset_hash=3Dimage_hash,
+                                      algorithm=3D'sha256')
+
+        self.vm.set_console()
+        self.vm.add_args('-drive', 'file=3D' + image_path + ',if=3Dmtd,for=
mat=3Draw',
+                         '-net', 'nic')
+        self.vm.launch()
+
+        self.wait_for_console_pattern("U-Boot 2019.04")
+        self.wait_for_console_pattern("## Loading kernel from FIT Image at=
 20100000")
+        self.wait_for_console_pattern("Starting kernel ...")
+        self.wait_for_console_pattern("Booting Linux on physical CPU 0xf00=
")
+        self.wait_for_console_pattern(
+                "aspeed-smc 1e620000.spi: read control register: 203b0041")
+        self.wait_for_console_pattern("ftgmac100 1e690000.ftgmac eth0: irq=
 ")
+
     def test_m68k_mcf5208evb(self):
         """
         :avocado: tags=3Darch:m68k
--=20
2.30.2


