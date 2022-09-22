Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EE85E640B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 15:47:12 +0200 (CEST)
Received: from localhost ([::1]:45026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obMXn-0002Ar-OE
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 09:47:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1obM2L-0005k0-9G
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:14:41 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:5174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1obM23-0001Ft-N8
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:14:41 -0400
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MYFzx3HClzHpmX;
 Thu, 22 Sep 2022 21:11:57 +0800 (CST)
Received: from localhost.localdomain (10.67.164.66) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 21:14:07 +0800
To: <mst@redhat.com>, <imammedo@redhat.com>, <ani@anisinha.ca>,
 <eduardo@habkost.net>, <marcel.apfelbaum@gmail.com>, <f4bug@amsat.org>,
 <wangyanan55@huawei.com>, <qemu-devel@nongnu.org>
CC: <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>,
 <yangyicong@hisilicon.com>, <prime.zeng@huawei.com>,
 <hesham.almatary@huawei.com>, <ionela.voinescu@arm.com>,
 <darren@os.amperecomputing.com>
Subject: [PATCH 2/4] tests: virt: update expected ACPI tables for virt test
Date: Thu, 22 Sep 2022 21:11:41 +0800
Message-ID: <20220922131143.58003-3-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220922131143.58003-1-yangyicong@huawei.com>
References: <20220922131143.58003-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.164.66]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=yangyicong@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Yicong Yang <yangyicong@huawei.com>
From:  Yicong Yang via <qemu-devel@nongnu.org>

From: Yicong Yang <yangyicong@hisilicon.com>

Update the ACPI tables according to the acpi aml_build change.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 tests/data/acpi/virt/APIC.pxb     | Bin 0 -> 168 bytes
 tests/data/acpi/virt/DBG2.memhp   | Bin 0 -> 87 bytes
 tests/data/acpi/virt/DBG2.numamem | Bin 0 -> 87 bytes
 tests/data/acpi/virt/DBG2.pxb     | Bin 0 -> 87 bytes
 tests/data/acpi/virt/FACP.pxb     | Bin 0 -> 268 bytes
 tests/data/acpi/virt/GTDT.pxb     | Bin 0 -> 96 bytes
 tests/data/acpi/virt/MCFG.pxb     | Bin 0 -> 60 bytes
 tests/data/acpi/virt/PPTT         | Bin 96 -> 76 bytes
 tests/data/acpi/virt/PPTT.memhp   | Bin 0 -> 76 bytes
 tests/data/acpi/virt/PPTT.numamem | Bin 0 -> 76 bytes
 tests/data/acpi/virt/PPTT.pxb     | Bin 0 -> 76 bytes
 tests/data/acpi/virt/SPCR.pxb     | Bin 0 -> 80 bytes
 12 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 tests/data/acpi/virt/APIC.pxb
 create mode 100644 tests/data/acpi/virt/DBG2.memhp
 create mode 100644 tests/data/acpi/virt/DBG2.numamem
 create mode 100644 tests/data/acpi/virt/DBG2.pxb
 create mode 100644 tests/data/acpi/virt/FACP.pxb
 create mode 100644 tests/data/acpi/virt/GTDT.pxb
 create mode 100644 tests/data/acpi/virt/MCFG.pxb
 create mode 100644 tests/data/acpi/virt/PPTT.memhp
 create mode 100644 tests/data/acpi/virt/PPTT.numamem
 create mode 100644 tests/data/acpi/virt/PPTT.pxb
 create mode 100644 tests/data/acpi/virt/SPCR.pxb

diff --git a/tests/data/acpi/virt/APIC.pxb b/tests/data/acpi/virt/APIC.pxb
new file mode 100644
index 0000000000000000000000000000000000000000..023f15f12e74fb9a3a6d3d9dc994541016947d6a
GIT binary patch
literal 168
zcmZ<^@N{0mz`(#9;N<V@5v<@85#X!<1dKp25F13p0FMNW#lQh$F##FeJ}@2w15CX*
gLI}uWgsNwO(#&xED9V5wUbr1hU^O7~92f!^05#AE0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/DBG2.memhp b/tests/data/acpi/virt/DBG2.memhp
new file mode 100644
index 0000000000000000000000000000000000000000..86e6314f7b0235ef8ed3e0221e09f996c41f5e98
GIT binary patch
literal 87
zcmZ>9ayJTR0D|*Q{>~o33QiFL&I&-l2owUbL9`AKgJ=eA21Zr}H4uw|p@A7lh%qQJ
TFmQk+Il-a=3=Gcxz6J~c3~mVl

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/DBG2.numamem b/tests/data/acpi/virt/DBG2.numamem
new file mode 100644
index 0000000000000000000000000000000000000000..86e6314f7b0235ef8ed3e0221e09f996c41f5e98
GIT binary patch
literal 87
zcmZ>9ayJTR0D|*Q{>~o33QiFL&I&-l2owUbL9`AKgJ=eA21Zr}H4uw|p@A7lh%qQJ
TFmQk+Il-a=3=Gcxz6J~c3~mVl

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/DBG2.pxb b/tests/data/acpi/virt/DBG2.pxb
new file mode 100644
index 0000000000000000000000000000000000000000..86e6314f7b0235ef8ed3e0221e09f996c41f5e98
GIT binary patch
literal 87
zcmZ>9ayJTR0D|*Q{>~o33QiFL&I&-l2owUbL9`AKgJ=eA21Zr}H4uw|p@A7lh%qQJ
TFmQk+Il-a=3=Gcxz6J~c3~mVl

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/FACP.pxb b/tests/data/acpi/virt/FACP.pxb
new file mode 100644
index 0000000000000000000000000000000000000000..1f764220f8533c427168e80ccf298604826a00b4
GIT binary patch
literal 268
ycmZ>BbPnKQWME(ob@F%i2v%^42yj*a0-z8Bhz+8t3j|P&V`iYf6{t24%>w}Cy9NOO

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/GTDT.pxb b/tests/data/acpi/virt/GTDT.pxb
new file mode 100644
index 0000000000000000000000000000000000000000..9408b71b59c0e0f2991c0053562280155b47bc0b
GIT binary patch
literal 96
zcmZ<{aS2IaU|?YCaq@Te2v%^42yj*a0!E-1hz+8Vfh?3G2c%hmSQ^Tgg3{;|04K!<
A0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/MCFG.pxb b/tests/data/acpi/virt/MCFG.pxb
new file mode 100644
index 0000000000000000000000000000000000000000..f4ae3203a4e9258a397c9912332178640209637b
GIT binary patch
literal 60
scmeZuc5}C3U|?W;<K*w`5v<@85#X!<1dKp25F11z0RaaH=Rb%706Iko0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/virt/PPTT
index f56ea63b369a604877374ad696c396e796ab1c83..7a1258ecf123555b24462c98ccbb76b4ac1d0c2b 100644
GIT binary patch
delta 32
fcmYfB;R*-{3GrcIU|?D?k;`ae01J-_kOKn%ZFdCM

delta 53
pcmeZC;0g!`2}xjJU|{l?$YrDgWH5jU5Ca567#O&Klm(arApowi1QY-O

diff --git a/tests/data/acpi/virt/PPTT.memhp b/tests/data/acpi/virt/PPTT.memhp
new file mode 100644
index 0000000000000000000000000000000000000000..7a1258ecf123555b24462c98ccbb76b4ac1d0c2b
GIT binary patch
literal 76
zcmWFt2nq3FU|?Wc;pFe^5v<@85#X!<1dKp25F11@h%hjKX%HI*fMQ%gwhD|7qyeJ>
B2LS*8

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/PPTT.numamem b/tests/data/acpi/virt/PPTT.numamem
new file mode 100644
index 0000000000000000000000000000000000000000..7a1258ecf123555b24462c98ccbb76b4ac1d0c2b
GIT binary patch
literal 76
zcmWFt2nq3FU|?Wc;pFe^5v<@85#X!<1dKp25F11@h%hjKX%HI*fMQ%gwhD|7qyeJ>
B2LS*8

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/PPTT.pxb b/tests/data/acpi/virt/PPTT.pxb
new file mode 100644
index 0000000000000000000000000000000000000000..7a1258ecf123555b24462c98ccbb76b4ac1d0c2b
GIT binary patch
literal 76
zcmWFt2nq3FU|?Wc;pFe^5v<@85#X!<1dKp25F11@h%hjKX%HI*fMQ%gwhD|7qyeJ>
B2LS*8

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/SPCR.pxb b/tests/data/acpi/virt/SPCR.pxb
new file mode 100644
index 0000000000000000000000000000000000000000..24e0a579e7d73f432a614380e29aa95113344186
GIT binary patch
literal 80
zcmWFza1IJ!U|?W6?d0$55v<@85#X!<1dKp25F11@12F>!1Bl59VJZSCW(Gzk28RDY
I01|@%0RBM>0RR91

literal 0
HcmV?d00001

-- 
2.24.0


