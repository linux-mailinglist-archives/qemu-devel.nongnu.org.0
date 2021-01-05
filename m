Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F902EB117
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:11:28 +0100 (CET)
Received: from localhost ([::1]:50904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwprj-0004Op-Kl
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:11:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpbf-0000VD-Vt
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:54:51 -0500
Received: from mga11.intel.com ([192.55.52.93]:21248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpbc-00012W-38
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:54:51 -0500
IronPort-SDR: DA+XRGvb+J4iznz4Q8IUfSU3UT+fQiHUEg9kCo9c9+0wYnjjqRPJqgwA97xzKsI5JUYy2nz00f
 33NWqyFuZWSA==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="173629545"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="173629545"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:54:00 -0800
IronPort-SDR: y7BmYfgBNp8tnZIau7mDlg9SID2uOYdm84esRzc3i2CVrSsCItg7DTM58MtPLinejXzH6equAC
 oV26HFJguvrQ==
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="346338023"
Received: from tgeddam-mobl.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.140.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:53:59 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 18/32] tests/acpi: remove stale allowed tables
Date: Tue,  5 Jan 2021 08:53:09 -0800
Message-Id: <20210105165323.783725-19-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210105165323.783725-1-ben.widawsky@intel.com>
References: <20210105165323.783725-1-ben.widawsky@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=ben.widawsky@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SUBJ_WIPE_DEBT=1.004 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Ben Widawsky <ben.widawsky@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 Chris Browy <cbrowy@avery-design.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Prashant V Agarwal <agpr123@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

     Scope (_SB)
     {
         Device (PCI0)
         {
             Name (_HID, EisaId ("PNP0A03") /* PCI Bus */)  // _HID: Hardware ID
-            Name (_ADR, Zero)  // _ADR: Address
             Name (_UID, Zero)  // _UID: Unique ID
+            Name (_ADR, Zero)  // _ADR: Address

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 tests/data/acpi/pc/DSDT                     | Bin 5065 -> 5065 bytes
 tests/data/acpi/pc/DSDT.acpihmat            | Bin 6390 -> 6390 bytes
 tests/data/acpi/pc/DSDT.bridge              | Bin 6924 -> 6924 bytes
 tests/data/acpi/pc/DSDT.cphp                | Bin 5529 -> 5529 bytes
 tests/data/acpi/pc/DSDT.dimmpxm             | Bin 6719 -> 6719 bytes
 tests/data/acpi/pc/DSDT.hpbridge            | Bin 5026 -> 5026 bytes
 tests/data/acpi/pc/DSDT.hpbrroot            | Bin 3084 -> 3084 bytes
 tests/data/acpi/pc/DSDT.ipmikcs             | Bin 5137 -> 5137 bytes
 tests/data/acpi/pc/DSDT.memhp               | Bin 6424 -> 6424 bytes
 tests/data/acpi/pc/DSDT.numamem             | Bin 5071 -> 5071 bytes
 tests/data/acpi/pc/DSDT.roothp              | Bin 5261 -> 5261 bytes
 tests/data/acpi/q35/DSDT                    | Bin 7801 -> 7801 bytes
 tests/data/acpi/q35/DSDT.acpihmat           | Bin 9126 -> 9126 bytes
 tests/data/acpi/q35/DSDT.bridge             | Bin 7819 -> 7819 bytes
 tests/data/acpi/q35/DSDT.cphp               | Bin 8265 -> 8265 bytes
 tests/data/acpi/q35/DSDT.dimmpxm            | Bin 9455 -> 9455 bytes
 tests/data/acpi/q35/DSDT.ipmibt             | Bin 7876 -> 7876 bytes
 tests/data/acpi/q35/DSDT.memhp              | Bin 9160 -> 9160 bytes
 tests/data/acpi/q35/DSDT.mmio64             | Bin 8932 -> 8932 bytes
 tests/data/acpi/q35/DSDT.numamem            | Bin 7807 -> 7807 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |  21 --------------------
 21 files changed, 21 deletions(-)

diff --git a/tests/data/acpi/pc/DSDT b/tests/data/acpi/pc/DSDT
index f6173df1d598767a79aa34ad7585ad7d45c5d4f3..b516745128e3f1a297b6327e9057026a2d16229c 100644
GIT binary patch
delta 20
bcmX@9eo}oxJ7=h;3j;^Iqf5}n36{bDOsEE~

delta 20
bcmX@9eo}oxJEx;d5CcbisHe-u36{bDOlAhI

diff --git a/tests/data/acpi/pc/DSDT.acpihmat b/tests/data/acpi/pc/DSDT.acpihmat
index 67f3f7249eaaa9404ebf0f2d0a324b8c8e3bd445..aeae285c6434ae6cf3c53660e34425727a497871 100644
GIT binary patch
delta 20
bcmexn_|0%aJ7=h;3j;^Iqf5}n3271lRUHRT

delta 20
bcmexn_|0%aJEx;d5CcbisHe-u3271lRNDtm

diff --git a/tests/data/acpi/pc/DSDT.bridge b/tests/data/acpi/pc/DSDT.bridge
index 643390f4c4138b37fc481656d3f555d0eeedcb02..4cd26a87dd11d96e10bf6de786b9d56ebfe0a4f9 100644
GIT binary patch
delta 20
bcmeA%>oJ?q&Kc_I!oU&l=n}MXLX8vvMneXi

delta 20
bcmeA%>oJ?q&gtk9#J~|B>glp^LX8vvMgaz#

diff --git a/tests/data/acpi/pc/DSDT.cphp b/tests/data/acpi/pc/DSDT.cphp
index 1ddcf7d8812f5d8d4d38fe7e7b35fd5885806046..fecb784812cbb2308ef58acf4a2c580f56d35c39 100644
GIT binary patch
delta 20
bcmbQKJyUx^J7=h;3j;^Iqf5}n37nz;MY;wk

delta 20
bcmbQKJyUx^JEx;d5CcbisHe-u37nz;MR*1%

diff --git a/tests/data/acpi/pc/DSDT.dimmpxm b/tests/data/acpi/pc/DSDT.dimmpxm
index c44385cc01879324738ffb7f997b8cdd762cbf97..f2c31e150ead16e4931367a6dab42704950a21e9 100644
GIT binary patch
delta 20
bcmdmQvfpGvJ7=h;3j;^Iqf5}n3F{>RP4WjY

delta 20
bcmdmQvfpGvJEx;d5CcbisHe-u3F{>RO|S<r

diff --git a/tests/data/acpi/pc/DSDT.hpbridge b/tests/data/acpi/pc/DSDT.hpbridge
index 4ecf1eb13bf49499f729b53a6d0114672a76e28d..7a8955cdbc52c025a2fd8f160cf8aff9442c985b 100644
GIT binary patch
delta 20
bcmZ3azDRvSJ7=h;3j;^Iqf5}n2|~gEMvw+M

delta 20
bcmZ3azDRvSJEx;d5CcbisHe-u2|~gEMotDf

diff --git a/tests/data/acpi/pc/DSDT.hpbrroot b/tests/data/acpi/pc/DSDT.hpbrroot
index a3046226ec1dcb234b726029b3790dfedb3b9221..88d23fca4743c2ee57493e7d77d6297a60964d3c 100644
GIT binary patch
delta 20
bcmeB?=#iMv&Kc_I!oU&l=n}MXLJc<nLHq_$

delta 20
bcmeB?=#iMv&gtk9#J~|B>glp^LJc<nLAnM}

diff --git a/tests/data/acpi/pc/DSDT.ipmikcs b/tests/data/acpi/pc/DSDT.ipmikcs
index f1638c5d079a9442c09390426a913010df6efd8d..d670ae793b5778c095a7f8c79ff1a046889d1a56 100644
GIT binary patch
delta 20
bcmbQJF;QbeJ7=h;3j;^Iqf5}n35~)4MGOXr

delta 20
bcmbQJF;QbeJEx;d5CcbisHe-u35~)4M9Kz;

diff --git a/tests/data/acpi/pc/DSDT.memhp b/tests/data/acpi/pc/DSDT.memhp
index 4c19e45e66918c61674785c99e4474e58866f125..a7de3d9fd94e62e8fc357fe3093bf7f394a39219 100644
GIT binary patch
delta 20
bcmbPXG{a~@J7=h;3j;^Iqf5}n2^|suN0A1$

delta 20
bcmbPXG{a~@JEx;d5CcbisHe-u2^|suM^6T}

diff --git a/tests/data/acpi/pc/DSDT.numamem b/tests/data/acpi/pc/DSDT.numamem
index 40cfd933259af05ac2aee07fca32f22122255211..57958b6cec216c1fb8731f4ed2da67f0fad7484a 100644
GIT binary patch
delta 20
bcmX@FeqMb-J7=h;3j;^Iqf5}n3HHJOO_&D2

delta 20
bcmX@FeqMb-JEx;d5CcbisHe-u3HHJOO;!fL

diff --git a/tests/data/acpi/pc/DSDT.roothp b/tests/data/acpi/pc/DSDT.roothp
index 078fc8031b479cc77b6527a2b7b4bd576b6e6028..624d0e367693fe267a4237a5fc97295cee2ebd60 100644
GIT binary patch
delta 20
bcmeCx?A4sm&Kc_I!oU&l=n}MX!e3zkMUV#m

delta 20
bcmeCx?A4sm&gtk9#J~|B>glp^!e3zkMNS6(

diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
index d25cd7072932886d6967f4023faac1e1fa6e836c..17e2aebde98e0a3161d93e9b2e200737b13699ac 100644
GIT binary patch
delta 21
dcmexq^V4R+<cTvI**M}IU4j@kOEJdF0sv{z2gd*a

delta 19
bcmexq^V4R+WEMx4Aclz(n>R}_#>)Z#RX+z<

diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT.acpihmat
index 722e06af83abcde203a2b96a8ec81fd3bab9fc98..7b3d659352a0923822f6a5db1dbd0a6ad853c446 100644
GIT binary patch
delta 21
dcmZ4HzRZ2X<cTvI**M}IU4j@kOELB+0RUdw2WbER

delta 19
bcmZ4HzRZ2XWEMx4Aclz(n>R}__9y`WOK1lA

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index 06bac139d668ddfc7914e258b471a303c9dbd192..5961b55b1067c3090b2f1f4cd3386d71efee241d 100644
GIT binary patch
delta 21
ccmeCS?Y5mTdE(4QHja2lmmr4CQjCSN09fk={{R30

delta 19
acmeCS?Y5mTnZ?m1h+*Qy=FL)!g|Yxf4F-?^

diff --git a/tests/data/acpi/q35/DSDT.cphp b/tests/data/acpi/q35/DSDT.cphp
index 2b933ac482e6883efccbd7d6c96089602f2c0b4d..09c92d52f92bb346ed807945b9638cad958446f8 100644
GIT binary patch
delta 21
dcmX@<aMEGI<cTvI**M}IU4j@kOEK!p0{~)+2SES;

delta 19
bcmX@<aMEGIWEMx4Aclz(n>R}_>dONFPN@dc

diff --git a/tests/data/acpi/q35/DSDT.dimmpxm b/tests/data/acpi/q35/DSDT.dimmpxm
index bd8f8305b028ef20f9b6d1a0c69ac428d027e3d1..1da97afb32dddafefe7f27934acbcb7d56a67489 100644
GIT binary patch
delta 21
dcmaFw`QCHF<cTvI**M}IU4j@kOEF$m1^{az2uT0{

delta 19
bcmaFw`QCHFWEMx4Aclz(n>R}_UR4GFR)YuH

diff --git a/tests/data/acpi/q35/DSDT.ipmibt b/tests/data/acpi/q35/DSDT.ipmibt
index a8f868e23c25688ab1c0371016c071f23e9d732f..c7e68432b66e7b4d03284c882c65bbf3066825dc 100644
GIT binary patch
delta 21
dcmX?Nd&G9a<cTvI**M}IU4j@kOEIpJ1ps122dV%7

delta 19
bcmX?Nd&G9aWEMx4Aclz(n>R}_u95`+PJ;(K

diff --git a/tests/data/acpi/q35/DSDT.memhp b/tests/data/acpi/q35/DSDT.memhp
index 9a802e4c67022386442976d5cb997ea3fc57b58f..3af457dd550461b2d2ea85aa85d7740452913b34 100644
GIT binary patch
delta 21
dcmX@%e!_ji<cTvI**M}IU4j@kOEIof0sv%g2hRWi

delta 19
bcmX@%e!_jiWEMx4Aclz(n>R}_u2TX4P;>`i

diff --git a/tests/data/acpi/q35/DSDT.mmio64 b/tests/data/acpi/q35/DSDT.mmio64
index 948c2dc7264c31932b490ca00691a7c4d9aefdb0..a4d20f676ac173e6846dcd4e076220d512215963 100644
GIT binary patch
delta 21
dcmaFj`owj@<cTvI**M}IU4j@kOEI2O1ORBc2p#|c

delta 19
bcmaFj`owj@WEMx4Aclz(n>R}_o>Bw=R96SD

diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.numamem
index 44ec1b0af400da6d298284aa959aa38add7e6dd5..bbab0d10a2a064528519fa69e90c799430129b75 100644
GIT binary patch
delta 21
dcmexw^WSE|<cTvI**M}IU4j@kOEIR(0sv~w2iX7s

delta 19
bcmexw^WSE|WEMx4Aclz(n>R}_rpf{URwD;$

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 5c695cdf37..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,22 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/DSDT",
-"tests/data/acpi/pc/DSDT.acpihmat",
-"tests/data/acpi/pc/DSDT.bridge",
-"tests/data/acpi/pc/DSDT.cphp",
-"tests/data/acpi/pc/DSDT.dimmpxm",
-"tests/data/acpi/pc/DSDT.hpbridge",
-"tests/data/acpi/pc/DSDT.hpbrroot",
-"tests/data/acpi/pc/DSDT.ipmikcs",
-"tests/data/acpi/pc/DSDT.memhp",
-"tests/data/acpi/pc/DSDT.numamem",
-"tests/data/acpi/pc/DSDT.roothp",
-"tests/data/acpi/q35/DSDT",
-"tests/data/acpi/q35/DSDT.acpihmat",
-"tests/data/acpi/q35/DSDT.bridge",
-"tests/data/acpi/q35/DSDT.cphp",
-"tests/data/acpi/q35/DSDT.dimmpxm",
-"tests/data/acpi/q35/DSDT.ipmibt",
-"tests/data/acpi/q35/DSDT.memhp",
-"tests/data/acpi/q35/DSDT.mmio64",
-"tests/data/acpi/q35/DSDT.numamem",
-"tests/data/acpi/q35/DSDT.tis",
-- 
2.30.0


