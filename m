Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAC631E5FC
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 06:55:31 +0100 (CET)
Received: from localhost ([::1]:36724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCcHi-00038p-9w
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 00:55:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lCcFa-0001Ck-Om
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 00:53:18 -0500
Received: from mga05.intel.com ([192.55.52.43]:7021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lCcFX-0003hi-UV
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 00:53:18 -0500
IronPort-SDR: kb2hWcW/TaJv6VgvqLXz58i/Feq7pntiNL+sTgzJE69wZbp0VxDVDqyT1XBIV7wuxLFyIFuJIU
 oE4TqIrXD2Hg==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="268260196"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; d="scan'208";a="268260196"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 21:53:01 -0800
IronPort-SDR: 1Zkr2nVC6jxcB03DYLmWcGVQ1WM/t1iNDoN5ln1bSRJC78XV6Uyu6MNpcaMqfl0T2rmgsXXcI4
 HqxcrMNrrDdw==
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; d="scan'208";a="589940946"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 21:53:01 -0800
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, imammedo@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com
Subject: [PATCH v5 10/10] qtest/acpi/bios-tables-test: update acpi tables
Date: Wed, 17 Feb 2021 21:51:18 -0800
Message-Id: <de5a7f88563d39ed0cec34ff1d4cd6a1bdc927f0.1613615732.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613615732.git.isaku.yamahata@intel.com>
References: <cover.1613615732.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1613615732.git.isaku.yamahata@intel.com>
References: <cover.1613615732.git.isaku.yamahata@intel.com>
Received-SPF: pass client-ip=192.55.52.43;
 envelope-from=isaku.yamahata@intel.com; helo=mga05.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NML_ADSP_CUSTOM_MED=0.9,
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
 tests/data/acpi/q35/DSDT                    | Bin 7801 -> 7859 bytes
 tests/data/acpi/q35/DSDT.acpihmat           | Bin 9126 -> 9184 bytes
 tests/data/acpi/q35/DSDT.bridge             | Bin 7819 -> 7877 bytes
 tests/data/acpi/q35/DSDT.cphp               | Bin 8265 -> 8323 bytes
 tests/data/acpi/q35/DSDT.dimmpxm            | Bin 9455 -> 9513 bytes
 tests/data/acpi/q35/DSDT.ipmibt             | Bin 7876 -> 7934 bytes
 tests/data/acpi/q35/DSDT.memhp              | Bin 9160 -> 9218 bytes
 tests/data/acpi/q35/DSDT.mmio64             | Bin 8932 -> 8990 bytes
 tests/data/acpi/q35/DSDT.nohpet             | Bin 0 -> 7717 bytes
 tests/data/acpi/q35/DSDT.numamem            | Bin 7807 -> 7865 bytes
 tests/data/acpi/q35/DSDT.tis                | Bin 8407 -> 8465 bytes
 tests/data/acpi/q35/FACP.nosmm              | Bin 0 -> 244 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |  14 --------------
 15 files changed, 14 deletions(-)

diff --git a/tests/data/acpi/pc/DSDT.nohpet b/tests/data/acpi/pc/DSDT.nohpet
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..d7d21be070c3b879e558193cbf8ded5a64c15eda 100644
GIT binary patch
literal 4923
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
AJpcdz

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/pc/FACP.nosmm b/tests/data/acpi/pc/FACP.nosmm
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..7e19550748b4deec9fad7bfb9a714254e1d695ee 100644
GIT binary patch
literal 116
zcmZ>BbPgzCU|?W8=j89~5v<@85#X!<1dKp25F13p03!n@jLE>j24S*5X%LSC$bPUM
bD$c~f!UAOe=l{<S5n*630y361FfafBA<PT`

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
index 008a3d7d0fd64224b0880412c0077e28e930fa5a..cccf92f0466fa4eaf2e9e06675b3b102c7a8eb86 100644
GIT binary patch
delta 88
zcmexqv)Pu*CD<iovm65h<GYDmsZ6eX6AM>bMK@Wv1UWi$#Cv$U@CNt=7&sdkGH}E@
j2L%htbIG)eGcfQlGC;tF|NsB*hq47K88%BX#>)Z#Nca{a

delta 29
lcmdmN`_qQYCD<jTQjURvap^>^R3>k(iG?dShcL#=0sxLH2_gUh

diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT.acpihmat
index 2723b690089c9e75869708cb92d3081b6bb5ec65..b3c1dd6bc40210425ac37dba88a650b0ea60ce1c 100644
GIT binary patch
delta 88
zcmZ4H{=l8fCD<k8fieRF<LZfAsZ6eX6AM>bMK@Wv1UWi$#Cv$U@CNt=7&sdkGH}E@
j2L%htbIG)eGcfQlGC;tF|NsB*hq47K88%BX_9y`WKL-{v

delta 29
lcmaFhzRaD=CD<ionKA<dW70&fR3>k(iG?dShcNai0RW8-2{Hfx

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index 86711455576518f9ddd1f524d82a447946be32ba..eb5d27d95b2cdeda5f7e1f6b151cfea02e6bd907 100644
GIT binary patch
delta 88
zcmeCSJ!;G466_LkRE~jxv3(*}Dw8YU#KM(U(M=XEL5|KG@gANoya9dz2F?bC3>@*!
iLBWFZTr%zA3=BMs3=pv4|NsB{p=^OlhRsrpg|Yw<cNK&H

delta 29
kcmX?V+ilC`66_MvEyuvXXg857mC2iHV&TfoA&iBx0Dw3Mga7~l

diff --git a/tests/data/acpi/q35/DSDT.cphp b/tests/data/acpi/q35/DSDT.cphp
index 42b7819ea8c9337e943c34e826af19723f99a358..e55d12990c98d8eed760b858ce18a036b612da1c 100644
GIT binary patch
delta 88
zcmX@<(Co<N66_MvtiZs)7&MV9mC2QFV&O`w=q3x7AV+78cn?n(-T=P<17`z6299{=
ipkP6HE}3?51_mBR1_;>j|NsB}P_{rN!)7T)eR%-yPZZJs

delta 29
kcmZp6Jn6vY66_M<sldR%$T^WKmC2iHV&TfoA&mO+0C#5x(f|Me

diff --git a/tests/data/acpi/q35/DSDT.dimmpxm b/tests/data/acpi/q35/DSDT.dimmpxm
index 7c3526d9670305e41020e5d95a3d0e9897b1e6d3..95901f94c0d445919cb84dd1f6d98c646ae8176e 100644
GIT binary patch
delta 88
zcmaFwxzdZvCD<iIQ<Z^%QFbC%Dw8YU#KM(U(M=XEL5|KG@gANoya9dz2F?bC3>@*!
iLBWFZTr%zA3=BMs3=pv4|NsB{p=^OlhRsrpSCs+g?G;b}

delta 29
lcmZ4K_1=@qCD<k8y$S;Z<JE~=sZ8En6AM>v4q?2i3;>)Z3Qzz5

diff --git a/tests/data/acpi/q35/DSDT.ipmibt b/tests/data/acpi/q35/DSDT.ipmibt
index 8d3ccc3e75164c2884fbe21659100e12fc70ae38..ce07e9f152def6a22ab29b3bde98b7d1f15a0522 100644
GIT binary patch
delta 88
zcmX?N`_GokCD<k8pBw`NqtZmKR3=xxiG?ezqMIySf*hSW;ypZFcmw<b44e%N893sd
jgMtO+xn$bK85npN86aT8|NsB@L)ikA44b7GSIGhZEesX|

delta 29
lcmexod&HK@CD<k8h#Uh0<IRa&sZ8En6AM>v4q;p+3jms{3IhND

diff --git a/tests/data/acpi/q35/DSDT.memhp b/tests/data/acpi/q35/DSDT.memhp
index f1c545d94b856fa8d19b8433233d80397cb05714..7acf6243f08cd906aa8a02d3acf1d720b36385ea 100644
GIT binary patch
delta 88
zcmX@%-sHjM66_Mfq{6_!cz+^SDw8YU#KM(U(M=XEL5|KG@gANoya9dz2F?bC3>@*!
iLBWFZTr%zA3=BMs3=pv4|NsB{p=^OlhRsrp>y!ZYffaB7

delta 29
lcmZqjIN{Fa66_LkLYaYqar#8AR3>k(iG?dShcK>F0sxF532*=a

diff --git a/tests/data/acpi/q35/DSDT.mmio64 b/tests/data/acpi/q35/DSDT.mmio64
index 4fb285f2efea00964ea0f5c4172c213f0817b563..77d46369e48efca9a9e5024542c77cd26144beff 100644
GIT binary patch
delta 88
zcmaFjI?s*ECD<iIPMLv$amqxlR3=xxiG?ezqMIySf*hSW;ypZFcmw<b44e%N893sd
jgMtO+xn$bK85npN86aT8|NsB@L)ikA44b7GPbmTb`w$h6

delta 29
lcmbQ|_QaLTCD<k8i4p??qt8UHR3>k(iG?dShcKQ}1OSi336B5(

diff --git a/tests/data/acpi/q35/DSDT.nohpet b/tests/data/acpi/q35/DSDT.nohpet
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..0b10128e42af0c7b65e010963085bbf690a64065 100644
GIT binary patch
literal 7717
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
GwDEs12p4Jq

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.numamem
index dd9dc9d02501afb50da7b9e77daabeee8968c340..e4c4582e7f76b072ab1123c748b89ea33ea1db87 100644
GIT binary patch
delta 88
zcmexwv(uK#CD<ioryK(V<BW-1sZ6eX6AM>bMK@Wv1UWi$#Cv$U@CNt=7&sdkGH}E@
j2L%htbIG)eGcfQlGC;tF|NsB*hq47K88%BXrpf{UHWn4+

delta 29
kcmdmK``?DkCD<jTUXFo*(SIUWDw8+Y#KM)ELl{$K0gCkq<NyEw

diff --git a/tests/data/acpi/q35/DSDT.tis b/tests/data/acpi/q35/DSDT.tis
index b8e380340209a38163ef6ca2f6f9dfaf458ab08d..15a26a14e4be5280c0f1cc09f66428311100b7ab 100644
GIT binary patch
delta 88
zcmccaIMIpACD<iIP?3RwasNcFR3=xxiG?ezqMIySf*hSW;ypZFcmw<b44e%N893sd
jgMtO+xn$bK85npN86aT8|NsB@L)ikA44b7G_sRnR_dOMQ

delta 29
lcmbQ}bls85CD<k8x&i|OWBEj`R3>k(iG?dShcNDy2LO#z33>nk

diff --git a/tests/data/acpi/q35/FACP.nosmm b/tests/data/acpi/q35/FACP.nosmm
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..6a9aa5f370eb9af6a03dc739d8a159be58fdee01 100644
GIT binary patch
literal 244
zcmZ>BbPo8!z`(#<;N<V@5v<@85#X!<1dKp25F13p03!n@jLE>j24S*5X%LSC$X0-f
zGcm9T0LA|E|L2FOWMD7?GM2V5Ffej3F#P0!h{7ddihwku0+2v57svwxMxcSn_QAxF
TX+{NzJ3wNL4G8yu_%Hwf9PJGO

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


