Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C0631C4DC
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 02:12:38 +0100 (CET)
Received: from localhost ([::1]:35098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBour-0000wk-H1
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 20:12:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBopJ-0001uh-H3
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 20:06:57 -0500
Received: from mga06.intel.com ([134.134.136.31]:34397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBopF-0004h7-Qr
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 20:06:53 -0500
IronPort-SDR: 3gcBrMm4L0sJwWeRxOinUIgAjOcxO159p7/JqjQxwmiOT3s0MT/rg/OZWCxji54bPtmRScPSsu
 MGrzp6k68gUQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="244264046"
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="244264046"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 17:06:44 -0800
IronPort-SDR: rD05ELY3IGfiN3U9G46WTSIr81QrQNZk1Js4CnmSETWWlnLE7lcEXPdAbFda5vSgx02e/7oSBz
 IyInSqRCwTZg==
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="591695505"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 17:06:44 -0800
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com
Subject: [PATCH v4 10/10] qtest/acpi/bios-tables-test: update acpi tables
Date: Mon, 15 Feb 2021 17:04:15 -0800
Message-Id: <b944cc0ff8c0cb3be98f63a9d3f200a676393e4f.1613436967.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613436967.git.isaku.yamahata@intel.com>
References: <cover.1613436967.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1613436967.git.isaku.yamahata@intel.com>
References: <cover.1613436967.git.isaku.yamahata@intel.com>
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=isaku.yamahata@intel.com; helo=mga06.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Isaku Yamahata <isaku.yamahata@intel.com>

update golden master acpi tables and empty
bios-tables-test-allowed-diff.h.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 tests/data/acpi/pc/DSDT.nohpet              | Bin 0 -> 4923 bytes
 tests/data/acpi/pc/FACP.nosmm               | Bin 0 -> 116 bytes
 tests/data/acpi/q35/DSDT                    | Bin 7801 -> 7872 bytes
 tests/data/acpi/q35/DSDT.acpihmat           | Bin 9126 -> 9197 bytes
 tests/data/acpi/q35/DSDT.bridge             | Bin 7819 -> 7890 bytes
 tests/data/acpi/q35/DSDT.cphp               | Bin 8265 -> 8336 bytes
 tests/data/acpi/q35/DSDT.dimmpxm            | Bin 9455 -> 9526 bytes
 tests/data/acpi/q35/DSDT.ipmibt             | Bin 7876 -> 7947 bytes
 tests/data/acpi/q35/DSDT.memhp              | Bin 9160 -> 9231 bytes
 tests/data/acpi/q35/DSDT.mmio64             | Bin 8932 -> 9003 bytes
 tests/data/acpi/q35/DSDT.nohpet             | Bin 0 -> 7730 bytes
 tests/data/acpi/q35/DSDT.numamem            | Bin 7807 -> 7878 bytes
 tests/data/acpi/q35/DSDT.tis                | Bin 8407 -> 8478 bytes
 tests/data/acpi/q35/FACP.nosmm              | Bin 0 -> 244 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |  14 --------------
 15 files changed, 14 deletions(-)

diff --git a/tests/data/acpi/pc/DSDT.nohpet b/tests/data/acpi/pc/DSDT.nohpet
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..302deb595c79da7eb8da87baad16a21326e02430 100644
GIT binary patch
literal 4923
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
AJpcdz

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/pc/FACP.nosmm b/tests/data/acpi/pc/FACP.nosmm
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..3cb7d75ea796e0579177c863f16e2aefdc8bed65 100644
GIT binary patch
literal 116
zcmZ>BbPgzCU|?W0aq@Te2v%^42yk`-iZKGkKx_~V1B?uuFeU>78-&RMr9nInAp603
bs5lb?3k#6>pZ`BUM1+CC2*_C4z`y_i8aE69

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
index d25cd7072932886d6967f4023faac1e1fa6e836c..abff765d8e3941a408e6bc703c0b61ec46feccae 100644
GIT binary patch
delta 101
zcmexqbHJ9%CD<k8fE)t@Bilr-R3<0>iG?fOqnlh=T!I{(IpRG$U3dfh0t}oD3>i3r
soI>3M<+)_q#TgiQ7#Sd71CRn?5D=(j5aEt@4hrU20#dtKiZNam0McO<jQ{`u

delta 29
lcmX?L`_qQYCD<jTQjURv@!LeMR3>k(iG?dSCo;y%0sxek35@^%

diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT.acpihmat
index 722e06af83abcde203a2b96a8ec81fd3bab9fc98..5a1d554ee31e64731b42e483e945e5999b79d45a 100644
GIT binary patch
delta 101
zcmZ4H{??t#CD<k8tug}x<Kc;1sZ37%6AM?mM>n~$xCA*mbHsaiy6^`01sFIR7&34K
sIfc3j%5%xIi!(6rFfu^E1|S8(ARti5Ai^E*92Cs41f+Je6l0GP03F2^od5s;

delta 29
lcmaFszRaD=CD<ionKA<d<K~H6sZ8En6AM>vPGsy+0sxbG37r4{

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index 06bac139d668ddfc7914e258b471a303c9dbd192..184f07c664496c37ffe1475a86358b3c0d702d68 100644
GIT binary patch
delta 101
zcmeCSy=2Sf66_LkNsfVmasEWER3<0>iG?fOqnlh=T!I{(IpRG$U3dfh0t}oD3>i3r
soI>3M<+)_q#TgiQ7#Sd71CRn?5D=(j5aEt@4hrU20#dtKim^}@0O;@)?*IS*

delta 29
kcmca)+ilC`66_MvEyuvX*guggmC2iHV&TfoiHwD^0EVOp?*IS*

diff --git a/tests/data/acpi/q35/DSDT.cphp b/tests/data/acpi/q35/DSDT.cphp
index 2b933ac482e6883efccbd7d6c96089602f2c0b4d..8e164c4a1cc46f552c834601c356d345287c9750 100644
GIT binary patch
delta 101
zcmX@<Fu{?_CD<iof&v2rW7b5jR3<0>iG?fOqnlh=T!I{(IpRG$U3dfh0t}oD3>i3r
soI>3M<+)_q#TgiQ7#Sd71CRn?5D=(j5aEt@4hrU20#dtKicw!40Kp9vJpcdz

delta 29
kcmbQ>c+!E(CD<jzQ-OhjF=`@LDw8+Y#KM)E6B+g80e#a5Jpcdz

diff --git a/tests/data/acpi/q35/DSDT.dimmpxm b/tests/data/acpi/q35/DSDT.dimmpxm
index bd8f8305b028ef20f9b6d1a0c69ac428d027e3d1..47cf7eeb43da90fb637d3c96a69af999a67d132e 100644
GIT binary patch
delta 101
zcmaFwxy_5qCD<jzOqGFw(R3nLDw7lc#KM*C(M_%_E<ujY9Pu8WF1!JL0S3+nh724*
sPN8ms@?0|Q;tUKtj0_O40Z4%`2nbX%h;YX{2L*F10jb?A#duX20Jd)xy8r+H

delta 29
lcmdny_1=@qCD<k8y$S;ZquNBSR3>k(iG?dSCo*1D1^|<h3A+FQ

diff --git a/tests/data/acpi/q35/DSDT.ipmibt b/tests/data/acpi/q35/DSDT.ipmibt
index a8f868e23c25688ab1c0371016c071f23e9d732f..cfb8439511e05c0d3e6c74f5a5ddae8c35d3b939 100644
GIT binary patch
delta 101
zcmX?N+il0?66_MfEziKfXgQH9mC1>JV&O{n=q6Vdmmo)Hj(87G7v2EB00U<OLk5l@
sr%*RRc`liDaRvq+Mg|Dj0Hi<|1OzG>M7ZOfgMvAhfYff5Vq7H)0DAcp?*IS*

delta 29
lcmeCSJ7UY_66_LkM2>-hQEMVsDw8+Y#KM)E6B$>@0sw=v2=4#@

diff --git a/tests/data/acpi/q35/DSDT.memhp b/tests/data/acpi/q35/DSDT.memhp
index 9a802e4c67022386442976d5cb997ea3fc57b58f..4e588f184a6be20a156d195e0ed28e5b56d129a1 100644
GIT binary patch
delta 101
zcmX@%-tWQX66_Mfufo8<_<bT*Dw7lc#KM*C(M_%_E<ujY9Pu8WF1!JL0S3+nh724*
sPN8ms@?0|Q;tUKtj0_O40Z4%`2nbX%h;YX{2L*F10jb?A#kfuh0LiNr+W-In

delta 29
lcmeD8IN{Fa66_LkLYaYq@x?^0R3>k(iG?dSCo-;60sxYY3EKbw

diff --git a/tests/data/acpi/q35/DSDT.mmio64 b/tests/data/acpi/q35/DSDT.mmio64
index 948c2dc7264c31932b490ca00691a7c4d9aefdb0..d76e8136998c5b3a25bac21da7070a47fcfbde4e 100644
GIT binary patch
delta 101
zcmaFjy4sD)CD<iITbY4@am_@oR3<0>iG?fOqnlh=T!I{(IpRG$U3dfh0t}oD3>i3r
soI>3M<+)_q#TgiQ7#Sd71CRn?5D=(j5aEt@4hrU20#dtKit&^p0M2d|`Tzg`

delta 29
lcmZ4O_QaLTCD<k8i4p??<J^f{sZ8En6AM>vPGmf#2mqEa3Hks4

diff --git a/tests/data/acpi/q35/DSDT.nohpet b/tests/data/acpi/q35/DSDT.nohpet
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..3a98616f729cda2f1984e94a3dbd2bde02aa620a 100644
GIT binary patch
literal 7730
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
UNwx$+FkB48F>frXjcc^=e@rVFY5)KL

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.numamem
index 44ec1b0af400da6d298284aa959aa38add7e6dd5..13f09ff3d8c566fdf4f9c7a604e92184ac1aee2f 100644
GIT binary patch
delta 101
zcmexwbIg{@CD<k8m>dHG<A#Y`sZ37%6AM?mM>n~$xCA*mbHsaiy6^`01sFIR7&34K
sIfc3j%5%xIi!(6rFfu^E1|S8(ARti5Ai^E*92Cs41f+Je6l1C^023M(PXGV_

delta 29
lcmX?R``?DkCD<jTUXFo*alu5cR3>k(iG?dSCo-nW0sxU=2~Pk3

diff --git a/tests/data/acpi/q35/DSDT.tis b/tests/data/acpi/q35/DSDT.tis
index 30da3ec27958881801dacc954a343321ba26a2ae..e15073068895a3b601b49267806b55a904b8dbff 100644
GIT binary patch
delta 101
zcmccaIM0d8CD<iIPLY9u@%lurR3<0>iG?fOqnlh=T!I{(IpRG$U3dfh0t}oD3>i3r
soI>3M<+)_q#TgiQ7#Sd71CRn?5D=(j5aEt@4hrU20#dtKigB+z0Lo1j<p2Nx

delta 29
lcmbQ|bls85CD<k8x&i|O<B5q}sZ8En6AM>vPGsCG4*-+D3FQC)

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
index 95592459c5..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,15 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/FACP.nosmm",
-"tests/data/acpi/pc/DSDT.nohpet",
-"tests/data/acpi/q35/DSDT",
-"tests/data/acpi/q35/DSDT.tis",
-"tests/data/acpi/q35/DSDT.bridge",
-"tests/data/acpi/q35/DSDT.mmio64",
-"tests/data/acpi/q35/DSDT.ipmibt",
-"tests/data/acpi/q35/DSDT.cphp",
-"tests/data/acpi/q35/DSDT.memhp",
-"tests/data/acpi/q35/DSDT.numamem",
-"tests/data/acpi/q35/FACP.nosmm",
-"tests/data/acpi/q35/DSDT.nohpet",
-"tests/data/acpi/q35/DSDT.dimmpxm",
-"tests/data/acpi/q35/DSDT.acpihmat",
-- 
2.17.1


