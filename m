Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0EA318589
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 08:09:24 +0100 (CET)
Received: from localhost ([::1]:43526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA66F-0004oB-7y
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 02:09:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lA5mT-0002G4-Gi
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 01:48:49 -0500
Received: from mga11.intel.com ([192.55.52.93]:48349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lA5mQ-00085A-Fe
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 01:48:49 -0500
IronPort-SDR: g/ZJgeBqwjZKfquFChFm66N6dkcK03KE9TkLbvvtOQ6wYE2FgEtAGKvzaX9t5v5I8bPFRsRk5V
 YlwaxwtiTkIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="178692967"
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="178692967"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 22:48:25 -0800
IronPort-SDR: GQFwS+yZ1qhbA99LwKfZKLsSLuQhoRpuRoFrejjzWObeI4yhJzk0YSdf5T6RnhSK00TOhOK6lq
 JQ6S7eMjYX9Q==
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; d="scan'208";a="588716297"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 22:48:24 -0800
From: Isaku Yamahata <isaku.yamahata@intel.com>
To: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com
Subject: [PATCH v3 10/10] qtest/acpi/bios-tables-test: update acpi tables
Date: Wed, 10 Feb 2021 22:46:46 -0800
Message-Id: <189374a634d77475171245ed6fc332aa8e94d656.1613025709.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613025709.git.isaku.yamahata@intel.com>
References: <cover.1613025709.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1613025709.git.isaku.yamahata@intel.com>
References: <cover.1613025709.git.isaku.yamahata@intel.com>
Received-SPF: pass client-ip=192.55.52.93;
 envelope-from=isaku.yamahata@intel.com; helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: isaku.yamahata@intel.com, isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

update golden master acpi tables and empty
bios-tables-test-allowed-diff.h.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 tests/data/acpi/q35/DSDT                    | Bin 7801 -> 7892 bytes
 tests/data/acpi/q35/DSDT.acpihmat           | Bin 9126 -> 9217 bytes
 tests/data/acpi/q35/DSDT.bridge             | Bin 7819 -> 7910 bytes
 tests/data/acpi/q35/DSDT.cphp               | Bin 8265 -> 8356 bytes
 tests/data/acpi/q35/DSDT.dimmpxm            | Bin 9455 -> 9546 bytes
 tests/data/acpi/q35/DSDT.ipmibt             | Bin 7876 -> 7967 bytes
 tests/data/acpi/q35/DSDT.memhp              | Bin 9160 -> 9251 bytes
 tests/data/acpi/q35/DSDT.mmio64             | Bin 8932 -> 9023 bytes
 tests/data/acpi/q35/DSDT.nohpet             | Bin 0 -> 7750 bytes
 tests/data/acpi/q35/DSDT.nosmm              | Bin 0 -> 7892 bytes
 tests/data/acpi/q35/DSDT.numamem            | Bin 7807 -> 7898 bytes
 tests/data/acpi/q35/DSDT.tis                | Bin 8407 -> 8498 bytes
 tests/data/acpi/q35/FACP.nosmm              | Bin 0 -> 244 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |  13 -------------
 14 files changed, 13 deletions(-)

diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
index d25cd7072932886d6967f4023faac1e1fa6e836c..6d3097f30420049230a42706208f6013e22dce2f 100644
GIT binary patch
delta 121
zcmexqbH$d+CD<k8iW~z2<J^f{sZ4GH6AM>HM>l!0x&%2obHsaiy6^`01sFIR7&34K
zIfc3j8gm(RX)`eJFft&(1`zZA|Nr|DLSU8vh^%A~;f{9>3g%b>(!W`XF<uq`0HztW

delta 29
lcmca&`_qQYCD<jTQjURv@!LeMR3>k(iG?dSmomo70sxmQ3AF$K

diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT.acpihmat
index 722e06af83abcde203a2b96a8ec81fd3bab9fc98..7112fac785602bc559888d2e94447e4b4ce1c171 100644
GIT binary patch
delta 121
zcmZ4H-sr*Q66_MfsKUU&7&(zEmB~$DV&Tf@=q68Ammo)Hj(87G7v2EB00U<OLk5l@
zr%*RRV=jX(Z3YG&Mg|1f0Al|C|9?M12+R@yk(CT0-0{vq!5m9K`Zr54_9y`WM?M%v

delta 29
lcmZqlSmw^<66_MPOqqd!aq~p3R3>k(iG?dSmooM!0RV@p2}S?_

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index 06bac139d668ddfc7914e258b471a303c9dbd192..d3bbfcaa504f9c877de2a725e8e488023b6a75bb 100644
GIT binary patch
delta 121
zcmeCSeP+w$66_N4Opbwp(QG1DDwCVQ#KM))(M_JLE<ujY9Pu8WF1!JL0S3+nh724*
zPN8ms##{zn+6)Xlj0^~{0mS_O|Nnl35SS$ZA}bk0xZ|CJf;pCe^lz48ER+QRvSt|<

delta 29
kcmaE6+ilC`66_MvEyuvX*guggmC2iHV&TforHqBL0EsvW7XSbN

diff --git a/tests/data/acpi/q35/DSDT.cphp b/tests/data/acpi/q35/DSDT.cphp
index 2b933ac482e6883efccbd7d6c96089602f2c0b4d..8cf1fbe3cb04f02c9a12a835e9235303ab2169f3 100644
GIT binary patch
delta 121
zcmX@<u*8weCD<ioi2?%yBjZG_R3<lpiG?epqnkWgU4k5)IpRG$U3dfh0t}oD3>i3r
zoI>3MjkyfEv>6z97#R>?1Bm(m|Ns36Auvk-L{>70aK}3b1#>I`>EA5Hs4ouyftwg*

delta 29
kcmZ4Dc+!E(CD<jzQ-OhjF=`@LDw8+Y#KM)EOBwa$0f1)+WdHyG

diff --git a/tests/data/acpi/q35/DSDT.dimmpxm b/tests/data/acpi/q35/DSDT.dimmpxm
index bd8f8305b028ef20f9b6d1a0c69ac428d027e3d1..78a018140ff41e84b6ea93683cd0444f216ecded 100644
GIT binary patch
delta 121
zcmaFwdCH5+CD<jzOO=6v@ytZ7R3<lpiG?epqnkWgU4k5)IpRG$U3dfh0t}oD3>i3r
zoI>3MjkyfEv>6z97#R>?1Bm(m|Ns36Auvk-L{>70aK}3b1#>I`>EA5HcvTqy-i;aK

delta 29
lcmX@*_1=@qCD<k8y$S;ZquNBSR3>k(iG?dSmoi>e1^|{N3F80&

diff --git a/tests/data/acpi/q35/DSDT.ipmibt b/tests/data/acpi/q35/DSDT.ipmibt
index a8f868e23c25688ab1c0371016c071f23e9d732f..f27e355455b207e6336e14f33bb8a57c31f91604 100644
GIT binary patch
delta 121
zcmX?NJKv7WCD<iIUY>!0@xnx|R3<lpiG?epqnkWgU4k5)IpRG$U3dfh0t}oD3>i3r
zoI>3MjkyfEv>6z97#R>?1Bm(m|Ns36Auvk-L{>70aK}3b1#>I`>EA5HxJniPmirkO

delta 29
lcmbPlcf^*<CD<k8h#Uh0qt-;OR3>k(iG?dSmol!B1ptOe2^RnW

diff --git a/tests/data/acpi/q35/DSDT.memhp b/tests/data/acpi/q35/DSDT.memhp
index 9a802e4c67022386442976d5cb997ea3fc57b58f..97fe90178ad4ff250bea8e815706e26cc7cc2ac6 100644
GIT binary patch
delta 121
zcmX@%zSx7yCD<iIS%ratv2P+*DwCVQ#KM))(M_JLE<ujY9Pu8WF1!JL0S3+nh724*
zPN8ms##{zn+6)Xlj0^~{0mS_O|Nnl35SS$ZA}bk0xZ|CJf;pCe^lz48T&Dy8jA<DI

delta 29
lcmZ4Nal)O;CD<k8gfasI<BN%0sZ8En6AM>vE@fP&1OSyG3IhND

diff --git a/tests/data/acpi/q35/DSDT.mmio64 b/tests/data/acpi/q35/DSDT.mmio64
index 948c2dc7264c31932b490ca00691a7c4d9aefdb0..c744f209d4c8c3dd7ad31b2c9d800c22c2cba37e 100644
GIT binary patch
delta 121
zcmaFjy5Eh<CD<jzUYUV`(Rm_QDwCVQ#KM))(M_JLE<ujY9Pu8WF1!JL0S3+nh724*
zPN8ms##{zn+6)Xlj0^~{0mS_O|Nnl35SS$ZA}bk0xZ|CJf;pCe^lz48Jf#Q#k$f2<

delta 29
lcmdn*_QaLTCD<k8i4p??<J^f{sZ8En6AM>vE@eEW2mqMG3L*di

diff --git a/tests/data/acpi/q35/DSDT.nohpet b/tests/data/acpi/q35/DSDT.nohpet
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..b19f8c6bee66c187a707eb9b1b94cd7e1a7265da 100644
GIT binary patch
literal 7750
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
V0VdfJ2*GeZ5XZc+pf(n1<NtS=8)^Um

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/DSDT.nosmm b/tests/data/acpi/q35/DSDT.nosmm
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..6d3097f30420049230a42706208f6013e22dce2f 100644
GIT binary patch
literal 7892
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
WN`OhW1VXUB5Qrn*SX3KJwDErfCPZog

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.numamem
index 44ec1b0af400da6d298284aa959aa38add7e6dd5..99c34bd71abf680261dd5047f63b91641d0ba02d 100644
GIT binary patch
delta 121
zcmexwbIX>?CD<k8mK*~Eqx(dzR3<lpiG?epqnkWgU4k5)IpRG$U3dfh0t}oD3>i3r
zoI>3MjkyfEv>6z97#R>?1Bm(m|Ns36Auvk-L{>70aK}3b1#>I`>EA5Hm?{eZ<nbAI

delta 29
lcmca*``?DkCD<jTUXFo*alu5cR3>k(iG?dSmolcx0sxcs33mVh

diff --git a/tests/data/acpi/q35/DSDT.tis b/tests/data/acpi/q35/DSDT.tis
index 30da3ec27958881801dacc954a343321ba26a2ae..f2461ecd90da760852806aadf2fe9e49940707c9 100644
GIT binary patch
delta 121
zcmccaxXFpjCD<jzNRfeoF>fMQDwCVQ#KM))(M_JLE<ujY9Pu8WF1!JL0S3+nh724*
zPN8ms##{zn+6)Xlj0^~{0mS_O|Nnl35SS$ZA}bk0xZ|CJf;pCe^lz48+$#?NjN=&%

delta 29
lcmdnwbls85CD<k8x&i|O<B5q}sZ8En6AM>vE@j*+4*-@^3Jm}N

diff --git a/tests/data/acpi/q35/FACP.nosmm b/tests/data/acpi/q35/FACP.nosmm
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..891450367cbd1aca397d296831ebeb5cc0788f0f 100644
GIT binary patch
literal 244
zcmZ>BbPo8!z`($K&B@={BUr&HBEZ=VD8>jB1F=Cg3@|cq!k7#UY!D_3lm_uQfNTYr
zI1>Yl08s2d|9^gnN(KfaAY*9@0|O%m1H(@qh$vhVrU*zgDgX&2bAdcCU<4Y7Y#&S<
TnPyagxC11{*nn^khz|n*0A~&X

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index b79ac495c2..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,14 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT",
-"tests/data/acpi/q35/DSDT.tis",
-"tests/data/acpi/q35/DSDT.bridge",
-"tests/data/acpi/q35/DSDT.ipmibt",
-"tests/data/acpi/q35/DSDT.cphp",
-"tests/data/acpi/q35/DSDT.memhp",
-"tests/data/acpi/q35/DSDT.numamem",
-"tests/data/acpi/q35/DSDT.dimmpxm",
-"tests/data/acpi/q35/DSDT.acpihmat",
-"tests/data/acpi/q35/DSDT.mmio64",
-"tests/data/acpi/q35/DSDT.nosmm",
-"tests/data/acpi/q35/FACP.nosmm",
-"tests/data/acpi/q35/DSDT.nohpet",
-- 
2.17.1


