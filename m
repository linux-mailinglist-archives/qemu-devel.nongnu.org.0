Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D2D3143D2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:32:21 +0100 (CET)
Received: from localhost ([::1]:54146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9G0y-0002JR-HU
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:32:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1l9EYy-0006rZ-5E
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 16:59:20 -0500
Received: from mga02.intel.com ([134.134.136.20]:59483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1l9EYv-0005Gb-I1
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 16:59:19 -0500
IronPort-SDR: lk3+klBcURCvRy+E2WDPQcNN1frxipPb25Je/hsoYyzv28cR7JtqCAb3K3UdIfX2yRUw/lij5c
 GUplX6tBT5dQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="168911431"
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="168911431"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 13:59:05 -0800
IronPort-SDR: TL78RxaTybZwuTzwY9IwgOiJPxoboR8GQ3sQti/RPDHal4NeVuZG3VQuOGeVAokzV6qg2tt3K3
 ef82cKGYuaaw==
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="487608599"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 13:59:05 -0800
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com, philmd@redhat.com
Subject: [PATCH v2 9/9] qtest/acpi/bios-tables-test: update acpi tables
Date: Mon,  8 Feb 2021 13:57:28 -0800
Message-Id: <04b1f15b0069942a8c5888576f77182f700ba87b.1612821109.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612821108.git.isaku.yamahata@intel.com>
References: <cover.1612821108.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1612821108.git.isaku.yamahata@intel.com>
References: <cover.1612821108.git.isaku.yamahata@intel.com>
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=isaku.yamahata@intel.com; helo=mga02.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

update golden master acpi tables and empty
bios-tables-test-allowed-diff.h.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 tests/data/acpi/q35/DSDT                    | Bin 7801 -> 8083 bytes
 tests/data/acpi/q35/DSDT.acpihmat           | Bin 9126 -> 9408 bytes
 tests/data/acpi/q35/DSDT.bridge             | Bin 7819 -> 8101 bytes
 tests/data/acpi/q35/DSDT.cphp               | Bin 8265 -> 8547 bytes
 tests/data/acpi/q35/DSDT.dimmpxm            | Bin 9455 -> 9737 bytes
 tests/data/acpi/q35/DSDT.ipmibt             | Bin 7876 -> 8158 bytes
 tests/data/acpi/q35/DSDT.memhp              | Bin 9160 -> 9442 bytes
 tests/data/acpi/q35/DSDT.mmio64             | Bin 8932 -> 9214 bytes
 tests/data/acpi/q35/DSDT.nohpet             | Bin 0 -> 7941 bytes
 tests/data/acpi/q35/DSDT.nosmm              | Bin 0 -> 8083 bytes
 tests/data/acpi/q35/DSDT.numamem            | Bin 7807 -> 8089 bytes
 tests/data/acpi/q35/DSDT.tis                | Bin 8407 -> 8689 bytes
 tests/data/acpi/q35/FACP.nosmm              | Bin 0 -> 244 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |  13 -------------
 14 files changed, 13 deletions(-)

diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
index d25cd7072932886d6967f4023faac1e1fa6e836c..00c60fca65ec37200fc0a17db2d6eb895a1553d2 100644
GIT binary patch
delta 314
zcmexqGufWYCD<iovOEI=<C%$EsZ6di6AM??M>ly0x&%2obHsaiy6^`01sFIR7&1gR
zxC8|mFmWYtaYQ!?fY{6du1-D*K*B?TBgiS#P0*Ojpi7&9frpWSNKnZj;>#8992Csa
z1u}q(&)3t>ryjx<0<t|IOfg@_2p<Sj3dr>62P;;K_i^<r0J$NdI)O2<I)RHVsXBq@
z$N&HTlR?5BDGPj9CMPl$B!f&XNCBA#WCM)?vVo>7;G3MpP{0FpssPBO1^knfxR`)^
Y83qOpxBv@S0Skz~1Z3-GDaLqN09%VpH2?qr

delta 29
lcmbPi|I>!cCD<jTQjURv@!LeMR3>k(iG?dSn=r-80sxN%2{r%#

diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT.acpihmat
index 722e06af83abcde203a2b96a8ec81fd3bab9fc98..47547fa043d102578f6613cb7f19009a1ee5a868 100644
GIT binary patch
delta 314
zcmZ4He!!E<CD<k8fC>WxW9LM!R3=xMiG?fcqnkVgU4k5)IpRG$U3dfh0t}oD3>l&u
zT!MlOn79(SIHDT`Ky2m!S0^6@AmO3F5#$u=CTPrM(5215z{AKuB&cK%@#Ttl4hrVz
z0vW)?=j-X`Qx9Pa0ofi9rkJl|gb#!%1!Q{kgB7dA`?&fQfZUK!oxqq_oxsJGRGq-{
z<NyEv$sl2mlm$L4lM@*Wl0l{xq=3u=vVlec*+5ek@J&u)DBuA)RRCnt0{+QKTueZ|
Y3<CoPT!00vfCa=~0<v|p6l0GP05g_MMF0Q*

delta 29
lcmX@$xy+r*CD<ionKA<d<K~H6sZ8En6AM>vHeu>f0sxKZ2}S?_

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index 06bac139d668ddfc7914e258b471a303c9dbd192..ab0d94da7d3dce23d18d5868760f5fd5ac6f7958 100644
GIT binary patch
delta 314
zcmeCSU24ze66_MPRGxu>F?AwWDwC_s#KM*J(M=wLE<ujY9Pu8WF1!JL0S3+nh78dS
zE<r&COk4?E9MO#eAU1P=tCNocknm982yzN_6Ex;B=+b6j;9+DS5>zsX_;STN2L*F<
zfehf{^Y!%esfVzIfNT#4Q_R;f!Uw{X0x~`N!HU)5eO&ztKyFB=PGC%|PT*oos!rhf
z@&Et-WRS2&$^svj$%%{w$skh;Qb6Vb*+8R!Y@jI%_$DVY6z~9@DgZKR0srJAE+!yf
YhJk?tF2Dj-zyjhg0ol4)im^}@0EnAQmjD0&

delta 29
kcmZ2#-)+m~66_MvEyuvX*guggmC2iHV&TfoCQOC00D%$+m;e9(

diff --git a/tests/data/acpi/q35/DSDT.cphp b/tests/data/acpi/q35/DSDT.cphp
index 2b933ac482e6883efccbd7d6c96089602f2c0b4d..19f75894abfc33762dc4e2b973f17bb9e989e82e 100644
GIT binary patch
delta 314
zcmX@<@YspVCD<h-S&@N((O@E1DwC_s#KM*J(M=wLE<ujY9Pu8WF1!JL0S3+nh78dS
zE<r&COk4?E9MO#eAU1P=tCNocknm982yzN_6Ex;B=+b6j;9+DS5>zsX_;STN2L*F<
zfehf{^Y!%esfVzIfNT#4Q_R;f!Uw{X0x~`N!HU)5eO&ztKyFB=PGC%|PT*oos!rhf
z@&Et-WRS2&$^svj$%%{w$skh;Qb6Vb*+8R!Y@jI%_$DVY6z~9@DgZKR0srJAE+!yf
YhJk?tF2Dj-zyjhg0ol4)icw!40Gy{wWB>pF

delta 29
kcmaFtbkc##CD<jzQ-OhjF=`@LDw8+Y#KM)EO_=oM0fwarWdHyG

diff --git a/tests/data/acpi/q35/DSDT.dimmpxm b/tests/data/acpi/q35/DSDT.dimmpxm
index bd8f8305b028ef20f9b6d1a0c69ac428d027e3d1..d7344a4e1328318510fe26508a608a985b5d44eb 100644
GIT binary patch
delta 314
zcmaFw+3CaO66_Mfsm8#-_<JH(DwC_s#KM*J(M=wLE<ujY9Pu8WF1!JL0S3+nh78dS
zE<r&COk4?E9MO#eAU1P=tCNocknm982yzN_6Ex;B=+b6j;9+DS5>zsX_;STN2L*F<
zfehf{^Y!%esfVzIfNT#4Q_R;f!Uw{X0x~`N!HU)5eO&ztKyFB=PGC%|PT*oos!rhf
z@&Et-WRS2&$^svj$%%{w$skh;Qb6Vb*+8R!Y@jI%_$DVY6z~9@DgZKR0srJAE+!yf
YhJk?tF2Dj-zyjhg0ol4)it(y40RE&*V*mgE

delta 29
lcmeD5dGE>P66_N4UWI{yQEehuDw8+Y#KM)EO_;7K0|1Tx31k2O

diff --git a/tests/data/acpi/q35/DSDT.ipmibt b/tests/data/acpi/q35/DSDT.ipmibt
index a8f868e23c25688ab1c0371016c071f23e9d732f..57c32c31a3fd40f5df01f743f062a5dcaa9b8231 100644
GIT binary patch
delta 314
zcmX?Nd(WQBCD<k8o;(8sBf~_lR3=xMiG?fcqnkVgU4k5)IpRG$U3dfh0t}oD3>l&u
zT!MlOn79(SIHDT`Ky2m!S0^6@AmO3F5#$u=CTPrM(5215z{AKuB&cK%@#Ttl4hrVz
z0vW)?=j-X`Qx9Pa0ofi9rkJl|gb#!%1!Q{kgB7dA`?&fQfZUK!oxqq_oxsJGRGq-{
z<NyEv$sl2mlm$L4lM@*Wl0l{xq=3u=vVlec*+5ek@J&u)DBuA)RRCnt0{+QKTueZ|
Y3<CoPT!00vfCa=~0<v|p6yqvc0O9;h761SM

delta 29
lcmca-f5eu{CD<k8h#Uh0qt-;OR3>k(iG?dSn=q}C1pthN2^RnW

diff --git a/tests/data/acpi/q35/DSDT.memhp b/tests/data/acpi/q35/DSDT.memhp
index 9a802e4c67022386442976d5cb997ea3fc57b58f..ae63519a139cf287cd6a1484c8298d17ee8c70dd 100644
GIT binary patch
delta 314
zcmX@%{>YQdCD<k8kqQF?<GzVpsZ6di6AM??M>ly0x&%2obHsaiy6^`01sFIR7&1gR
zxC8|mFmWYtaYQ!?fY{6du1-D*K*B?TBgiS#P0*Ojpi7&9frpWSNKnZj;>#8992Csa
z1u}q(&)3t>ryjx<0<t|IOfg@_2p<Sj3dr>62P;;K_i^<r0J$NdI)O2<I)RHVsXBq@
z$N&HTlR?5BDGPj9CMPl$B!f&XNCBA#WCM)?vVo>7;G3MpP{0FpssPBO1^knfxR`)^
Y83qOpxBv@S0Skz~1Z3-GDaLh50PUPj0ssI2

delta 29
lcmaFldBUB`CD<k8gfasI<BN%0sZ8En6AM>vHep()1OS^~3IhND

diff --git a/tests/data/acpi/q35/DSDT.mmio64 b/tests/data/acpi/q35/DSDT.mmio64
index 948c2dc7264c31932b490ca00691a7c4d9aefdb0..689ff7d5a75bb3a1f98b81e6c0e5748528e3720e 100644
GIT binary patch
delta 314
zcmaFj`p=!qCD<k8pE3gjWAQ|;R3=xMiG?fcqnkVgU4k5)IpRG$U3dfh0t}oD3>l&u
zT!MlOn79(SIHDT`Ky2m!S0^6@AmO3F5#$u=CTPrM(5215z{AKuB&cK%@#Ttl4hrVz
z0vW)?=j-X`Qx9Pa0ofi9rkJl|gb#!%1!Q{kgB7dA`?&fQfZUK!oxqq_oxsJGRGq-{
z<NyEv$sl2mlm$L4lM@*Wl0l{xq=3u=vVlec*+5ek@J&u)DBuA)RRCnt0{+QKTueZ|
Y3<CoPT!00vfCa=~0<v|p6yqsH0QIv?ApigX

delta 29
lcmez8{=}8bCD<k8i4p??<J^f{sZ8En6AM>vHeouY2mqe~3L*di

diff --git a/tests/data/acpi/q35/DSDT.nohpet b/tests/data/acpi/q35/DSDT.nohpet
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..73a7826f92a3ac99855c1d1ff1e9d72104e13e3a 100644
GIT binary patch
literal 7941
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
biyt>L?@552Yzc&5b2%?gxUr%dtJL^E0NhP#

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/DSDT.nosmm b/tests/data/acpi/q35/DSDT.nosmm
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..00c60fca65ec37200fc0a17db2d6eb895a1553d2 100644
GIT binary patch
literal 8083
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
axRH5V0!*?c5Q2@RKpgPKvf5aojsFAO`F3gm

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.numamem
index 44ec1b0af400da6d298284aa959aa38add7e6dd5..d1f45e46a95a98f720a5d8774c3e7a4cedb6adc5 100644
GIT binary patch
delta 314
zcmexwGt-{SCD<ioraS`!W7$NmR3=xMiG?fcqnkVgU4k5)IpRG$U3dfh0t}oD3>l&u
zT!MlOn79(SIHDT`Ky2m!S0^6@AmO3F5#$u=CTPrM(5215z{AKuB&cK%@#Ttl4hrVz
z0vW)?=j-X`Qx9Pa0ofi9rkJl|gb#!%1!Q{kgB7dA`?&fQfZUK!oxqq_oxsJGRGq-{
z<NyEv$sl2mlm$L4lM@*Wl0l{xq=3u=vVlec*+5ek@J&u)DBuA)RRCnt0{+QKTueZ|
Y3<CoPT!00vfCa=~0<v|p6l1C^01Tl^_W%F@

delta 29
lcmbPf|KEnoCD<jTUXFo*alu5cR3>k(iG?dSn=qxy0sxE82>1X1

diff --git a/tests/data/acpi/q35/DSDT.tis b/tests/data/acpi/q35/DSDT.tis
index 30da3ec27958881801dacc954a343321ba26a2ae..eb66aff05a8a88aab07eda12a18e4bb4e3f11e5f 100644
GIT binary patch
delta 314
zcmcca_|cimCD<k8qap(X<GhJnsZ6di6AM??M>ly0x&%2obHsaiy6^`01sFIR7&1gR
zxC8|mFmWYtaYQ!?fY{6du1-D*K*B?TBgiS#P0*Ojpi7&9frpWSNKnZj;>#8992Csa
z1u}q(&)3t>ryjx<0<t|IOfg@_2p<Sj3dr>62P;;K_i^<r0J$NdI)O2<I)RHVsXBq@
z$N&HTlR?5BDGPj9CMPl$B!f&XNCBA#WCM)?vVo>7;G3MpP{0FpssPBO1^knfxR`)^
Y83qOpxBv@S0Skz~1Z3-GDaO6>0PK`a3;+NC

delta 29
lcmez9eBF`DCD<k8x&i|O<B5q}sZ8En6AM>vHeuQ;4*;Bz3Jm}N

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


