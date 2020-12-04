Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4592CF533
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 20:59:55 +0100 (CET)
Received: from localhost ([::1]:43402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klHFC-00053B-RN
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 14:59:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1klEcd-0007RY-8y
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:11:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1klEbJ-0006hs-Dm
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:11:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607101800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rzMpVxE6jKylmPaHhPhHcFYH8sDW2xyDJxQ4TH6w1aI=;
 b=GyxCpormajtXwA+LqCleI972MUw2v7A0OD59fk1Ac9fPBCA9XlVojI1cgonN6MvHcJ0S+q
 rNWtYxeOij1DOpxIcvqhCH3L1rIc4Crbve6ESEjGS6mW41JlhQV7+xjs4PEHJPt+353dJO
 a1iIQ08oMda49PfnZzesvfzSejJCCN0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-ABI57hbuP3SLwDFI23Hkqw-1; Fri, 04 Dec 2020 12:09:54 -0500
X-MC-Unique: ABI57hbuP3SLwDFI23Hkqw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF8211922020;
 Fri,  4 Dec 2020 17:09:53 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3DCD63BA7;
 Fri,  4 Dec 2020 17:09:52 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/8] tests/acpi: update expected files
Date: Fri,  4 Dec 2020 12:09:37 -0500
Message-Id: <20201204170939.1815522-7-imammedo@redhat.com>
In-Reply-To: <20201204170939.1815522-1-imammedo@redhat.com>
References: <20201204170939.1815522-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lersek@redhat.com, ankur.a.arora@oracle.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |  21 --------------------
 tests/data/acpi/pc/DSDT                     | Bin 5060 -> 5067 bytes
 tests/data/acpi/pc/DSDT.acpihmat            | Bin 6385 -> 6392 bytes
 tests/data/acpi/pc/DSDT.bridge              | Bin 6919 -> 6926 bytes
 tests/data/acpi/pc/DSDT.cphp                | Bin 5524 -> 5531 bytes
 tests/data/acpi/pc/DSDT.dimmpxm             | Bin 6714 -> 6721 bytes
 tests/data/acpi/pc/DSDT.hpbridge            | Bin 5021 -> 5028 bytes
 tests/data/acpi/pc/DSDT.hpbrroot            | Bin 3079 -> 3086 bytes
 tests/data/acpi/pc/DSDT.ipmikcs             | Bin 5132 -> 5139 bytes
 tests/data/acpi/pc/DSDT.memhp               | Bin 6419 -> 6426 bytes
 tests/data/acpi/pc/DSDT.numamem             | Bin 5066 -> 5073 bytes
 tests/data/acpi/pc/DSDT.roothp              | Bin 5256 -> 5263 bytes
 tests/data/acpi/q35/DSDT                    | Bin 7796 -> 7803 bytes
 tests/data/acpi/q35/DSDT.acpihmat           | Bin 9121 -> 9128 bytes
 tests/data/acpi/q35/DSDT.bridge             | Bin 7814 -> 7821 bytes
 tests/data/acpi/q35/DSDT.cphp               | Bin 8260 -> 8267 bytes
 tests/data/acpi/q35/DSDT.dimmpxm            | Bin 9450 -> 9457 bytes
 tests/data/acpi/q35/DSDT.ipmibt             | Bin 7871 -> 7878 bytes
 tests/data/acpi/q35/DSDT.memhp              | Bin 9155 -> 9162 bytes
 tests/data/acpi/q35/DSDT.mmio64             | Bin 8927 -> 8934 bytes
 tests/data/acpi/q35/DSDT.numamem            | Bin 7802 -> 7809 bytes
 tests/data/acpi/q35/DSDT.tis                | Bin 8402 -> 8409 bytes
 22 files changed, 21 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index cc75f3fc46..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,22 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/DSDT",
-"tests/data/acpi/q35/DSDT",
-"tests/data/acpi/q35/DSDT.tis",
-"tests/data/acpi/q35/DSDT.bridge",
-"tests/data/acpi/q35/DSDT.mmio64",
-"tests/data/acpi/q35/DSDT.ipmibt",
-"tests/data/acpi/q35/DSDT.cphp",
-"tests/data/acpi/q35/DSDT.memhp",
-"tests/data/acpi/q35/DSDT.numamem",
-"tests/data/acpi/q35/DSDT.dimmpxm",
-"tests/data/acpi/q35/DSDT.acpihmat",
-"tests/data/acpi/pc/DSDT.bridge",
-"tests/data/acpi/pc/DSDT.ipmikcs",
-"tests/data/acpi/pc/DSDT.cphp",
-"tests/data/acpi/pc/DSDT.memhp",
-"tests/data/acpi/pc/DSDT.numamem",
-"tests/data/acpi/pc/DSDT.dimmpxm",
-"tests/data/acpi/pc/DSDT.acpihmat",
-"tests/data/acpi/pc/DSDT.roothp",
-"tests/data/acpi/pc/DSDT.hpbridge",
-"tests/data/acpi/pc/DSDT.hpbrroot",
diff --git a/tests/data/acpi/pc/DSDT b/tests/data/acpi/pc/DSDT
index 4ca46e5a2bdb1dfab79dd8630aeeb9a386d8b30e..295819caa4a1bfafb7834b19649dac7e44d22839 100644
GIT binary patch
delta 76
zcmX@2ep;Q&CD<k8v@in$<MNGMTi7@q?c;-;;-j0qCLd>uQ`HIx3J!5(P;d@#^<#AQ
d^b2Nm4)P6SbawSJU}OMMZj1~}o1NJkc>q|H6axSN

delta 69
zcmX@Deng$iCD<k8h%f^K<C%?ITi7_g?Bau+;-j0KCm&~vlT!`|3J!5(P;d@#^<#AQ
Z^b2Nm4)P6SbawSJU}Rv~?8V;50|3}=69WJM

diff --git a/tests/data/acpi/pc/DSDT.acpihmat b/tests/data/acpi/pc/DSDT.acpihmat
index 35a74bce8cc152ecb615cb38c4b7f63c7c7d3ab3..0354a205657efce4957933b9da84bc599282a344 100644
GIT binary patch
delta 76
zcmexp_`{IPCD<k8hXexyW6DOZEo__)uJOT6@zG6QlaI5-scHoT1&25?C^!eW`Y}3t
d`UNvO2l<9EI=gxqFfxEBH%11g&CcxW1Oayf6qf)1

delta 69
zcmexi_|cHdCD<k8qXYv3W9LS$Eo_{gF7d%m@zG7rlaI5-$tec}1&25?C^!eW`Y}3t
Z`UNvO2l<9EI=gxqFfy=g_F`Wr2mtgh6PEx0

diff --git a/tests/data/acpi/pc/DSDT.bridge b/tests/data/acpi/pc/DSDT.bridge
index 803d7a8e839ea8b7ac33c4490459ddaede584269..7bdcb830b5f6bd5f4aca0528ae3dcca4e429c6fb 100644
GIT binary patch
delta 76
zcmZoS>oenW33dtLlV)IGe7})v3md1SeSEM}d~}o7<l}5{s#*a-!6A+e3eEwpevHnZ
de!+~+LB3&(&aPetj0_;kjgf(Avore<VE`Z)6NCT&

delta 69
zcmeA(Yd7O^33dr#mu6sK6xqnNg^kn8E<V^PKDx<y@^Q8}Ipu($;1EX!1?K=)KSpOy
YzhFk^Am1=XXIC!+Mh2G6UhGGN0d8>-ga7~l

diff --git a/tests/data/acpi/pc/DSDT.cphp b/tests/data/acpi/pc/DSDT.cphp
index 8bab2f506409f2b025a63d8b91c7bfdaa931e626..d62a3a3e39801348b9d590343355678c38e520f7 100644
GIT binary patch
delta 76
zcmbQDJzJa0CD<iowkQJwBlkwGEo_{QG4a7p@zG6QlaI5-scHoT1&25?C^!eW`Y}3t
d`UNvO2l<9EI=gxqFfxEBH%11g&CcwBd;k*763_qu

delta 69
zcmbQOJw=<#CD<ioiYNmEqrpb5Eo_`#(ec4f@zG7rlaI5-$tec}1&25?C^!eW`Y}3t
Z`UNvO2l<9EI=gxqFfy=g_F@m@0|1%I5zqht

diff --git a/tests/data/acpi/pc/DSDT.dimmpxm b/tests/data/acpi/pc/DSDT.dimmpxm
index e015b4594c96a6e0f34c0668e3383b9a91dff38e..9458d9a96aca5633cd5369f8daa4db8a2ce63b55 100644
GIT binary patch
delta 76
zcmdmGa?pg!CD<jzQHp_q@##jcEo_`#0rA03@zG6QlaI5-scHoT1&25?C^!eW`Y}3t
d`UNvO2l<9EI=gxqFfxEBH%11g&CcxKg#b-~6j}fP

delta 69
zcmX?Tvde_aCD<jzN{WGjQF0^K7B)`jfcRji_~<6*$;a8^<dg$~f<qh`6r2NG{TQ7+
Z{el^tgM7mnon5^Q7#UbLd$E5P0sxn{5?TNN

diff --git a/tests/data/acpi/pc/DSDT.hpbridge b/tests/data/acpi/pc/DSDT.hpbridge
index 56032bcf1ba4e251f16c9028429826090531efdd..34dcfeed22bc1fb3a611b866c13232b969a982a9 100644
GIT binary patch
delta 76
zcmbQMzC@kNCD<ioi7*2L<AaS{Ti7@q?c;-;;-j0qCLd>uQ`HIx3J!5(P;d@#^<#AQ
d^b2Nm4)P6SbawSJU}OMMZj1~}o1NLCcmPEO6QBS9

delta 69
zcmZ3YK3AQ~CD<iot}p`wBkM-4Eo_`#cJaYZ@zG7rlaI5-$tec}1&25?C^!eW`Y}3t
Z`UNvO2l<9EI=gxqFfy=g_F|9X0RWGK5ugA7

diff --git a/tests/data/acpi/pc/DSDT.hpbrroot b/tests/data/acpi/pc/DSDT.hpbrroot
index 36b0a8f2fbf93df47b66107125cd3ce01e017b92..09949201424ee98994ae650b9b76171dba6cb5cd 100644
GIT binary patch
delta 53
zcmZpd=#$`b33dtL<6&T6?AXYq&Bp0yA0O-#AKm0N*^VuaQET#CHW>~^XIC#bMh2$M
IyV!hL0ag?YtN;K2

delta 46
zcmeB^XqVt}33dr#=V4%AT)UA=n~l@UE<V^PKDx<yvK?C-qw?grY%+{2n-8-2vH}1J
Co(rr1

diff --git a/tests/data/acpi/pc/DSDT.ipmikcs b/tests/data/acpi/pc/DSDT.ipmikcs
index ca6630e39f60ebd5c056f57c4c03fdb9d5467577..60f4dde1e4d80d64eb8645218acee78daff45dc4 100644
GIT binary patch
delta 53
zcmeCtn5@C&66_KpEW*IRXtj~+4;!bWeSEM}d~}o7WPbKIMy<(t>@pmT&aPf=j0{Yh
IyV)Cg0BW`k7XSbN

delta 46
zcmbQN(WAlT66_MfBf`MI7{8J04;!bKU3{=pd~}oZWPbKIM&-$Q>@tijn<ue1@&EuE
Ct_&9d

diff --git a/tests/data/acpi/pc/DSDT.memhp b/tests/data/acpi/pc/DSDT.memhp
index 43f4e114e2cc48c68c35af47303fa87c9255db40..4302ff996f74bf6a3615b7a8885c6ef21bc318d6 100644
GIT binary patch
delta 76
zcmbPiG|Py~CD<iIN|J$rv2!EW7B)_I`}km|_~<6D$;a8^RJ8(vf<qh`6r2NG{TQ7+
d{el^tgM7mnon5^Q7#Tp68zTeLW@q*bf&dUA6G#96

delta 69
zcmbPbG}(yDCD<iISdxK(aqmX1Eo__)_VK|^@zG7rlaI5-$tec}1&25?C^!eW`Y}3t
Z`UNvO2l<9EI=gxqFfy=g_F}&v2mqJ95=a05

diff --git a/tests/data/acpi/pc/DSDT.numamem b/tests/data/acpi/pc/DSDT.numamem
index ba8f7e6c33f9eb0f7a080144fcb4a27d36aa04ae..b615c14a5e0f63e36f3d75eadf9d46e4dcea13d3 100644
GIT binary patch
delta 76
zcmX@5eo>vvCD<k8qA&vkqtiyNEo_|b_VK|^@zG6QlaI5-scHoT1&25?C^!eW`Y}3t
d`UNvO2l<9EI=gxqFfxEBH%11g&CcxYJOD<J6TAQb

delta 69
zcmcbpeoCFoCD<k8lrRGWW7$ToEo__)_VK|^@zG7rlaI5-$tec}1&25?C^!eW`Y}3t
Z`UNvO2l<9EI=gxqFfy=g_F`}60RYI}61)Ha

diff --git a/tests/data/acpi/pc/DSDT.roothp b/tests/data/acpi/pc/DSDT.roothp
index 18caa0765fc10adb29e01717390ead6c63cd0f3c..10a5bab1968dbf4ee844d7bcfc3876b58fdf54af 100644
GIT binary patch
delta 76
zcmeCs?APRS33dtT7hzyvJiC!=3md1SeSEM}d~}o7<l}5{s#*a-!6A+e3eEwpevHnZ
de!+~+LB3&(&aPetj0_;kjgf(AvopIZF90v!6F&d|

delta 69
zcmeCz?9k+L33dtT5Mf|o{Irp43md1GU3{=pd~}oZ<l}5{a>@Zg!6A+e3eEwpevHnZ
Ye!+~+LB3&(&aPetj0`NBz1UrO0ke1#KL7v#

diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
index e7414e78563372fca4d2aab9d16c58c0ff8468f4..931afc6f626a022d368011c412f36211d1d34031 100644
GIT binary patch
delta 76
zcmexj^V^2YCD<jTT8@E%@$W{i2@;%+_VK|^@zG6QlNU?GscHoT1&25?C^!eW`Y}3t
d`UNvO2l<9EI=gxqFfxEBH%11g&GM3=tN?pc6g2<<

delta 69
zcmexu^TmeCCD<jTM2>-hQE4OB1PM+ryZB(I_~<6*$%`f8<dg$~f<qh`6r2NG{TQ7+
Z{el^tgM7mnon5^Q7#UbLt4W5k0sz455;Xt-

diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT.acpihmat
index 88434da261212b15264c892976775acd5c954aea..f884ede4efbf07dddd0049b9118679d049159bdc 100644
GIT binary patch
delta 76
zcmZ4JzQUc$CD<iog)##J<F1Wd6C^ktT;qeC;-j0qCNGwVQ`HIx3J!5(P;d@#^<#AQ
d^b2Nm4)P6SbawSJU}OMMZj1~}o8={&xByR86UzVq

delta 69
zcmZ4CzR;b^CD<iop)vyl<Nb|X6C^l2UE+hC;-j0KCoh(WlT!`|3J!5(P;d@#^<#AQ
Z^b2Nm4)P6SbawSJU}Rv~tR~sS1pv@863YMp

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index 118476ff6101e11d6b1f2d3399241d7fd1a6f634..d1ce6d9065318cd71edec489ed124c1eb22fd9b0 100644
GIT binary patch
delta 76
zcmZp(?X~4{33dtTm1AIFoVJl`f&{0deSEM}d~}o7<i!$ks#*a-!6A+e3eEwpevHnZ
de!+~+LB3&(&aPetj0_;kjgf(Av%F+FD*z{36Bqyh

delta 69
zcmeCRZL{Ta33dr-lVf0D+`W-&f&{0RU3{=pd~}oZ<i!$ka>@Zg!6A+e3eEwpevHnZ
Ye!+~+LB3&(&aPetj0`NB)g;qd0jxa|7ytkO

diff --git a/tests/data/acpi/q35/DSDT.cphp b/tests/data/acpi/q35/DSDT.cphp
index 69c5edf620529e995461ccba63b76a083f25b2b6..f5b411a54bb6942f59ed016d43c4c28a7f99eb6b 100644
GIT binary patch
delta 76
zcmX@&aN2>(CD<jzTY-UrF>xc;1PM;ZnD}6)_~<6D$%`f8RJ8(vf<qh`6r2NG{TQ7+
d{el^tgM7mnon5^Q7#Tp68zTeLW_d|fb^tYu69NDL

delta 69
zcmX@@aKwSjCD<jzMS+2Vv27#Q1PM;B==fl#_~<6*$%`f8<dg$~f<qh`6r2NG{TQ7+
Z{el^tgM7mnon5^Q7#UbLt4XS|0|2>55&{4K

diff --git a/tests/data/acpi/q35/DSDT.dimmpxm b/tests/data/acpi/q35/DSDT.dimmpxm
index af41acba6e0117191ad8495a30ded7b0acc4d2ca..4bb12250f9dcdb34b2c2801186746a3693398cea 100644
GIT binary patch
delta 76
zcmaFm`O%ZhCD<k8qY489qufTW2@;%M0rA03@zG6QlNU?GscHoT1&25?C^!eW`Y}3t
d`UNvO2l<9EI=gxqFfxEBH%11g&GM3`xdCnX6m9?j

delta 69
zcmez9`O1^aCD<k8l?np`W6(yf2@;&n0rA03@zG7rlNU?G$tec}1&25?C^!eW`Y}3t
Z`UNvO2l<9EI=gxqFfy=gR+Bu<4FK%F6K((i

diff --git a/tests/data/acpi/q35/DSDT.ipmibt b/tests/data/acpi/q35/DSDT.ipmibt
index a650c3041ab9d6688eda843a6a2ab418e1a7ce9b..3ef8170d2a7004e3098af9e675a52174329c39ae 100644
GIT binary patch
delta 53
zcmdmQd(4*0CD<k8m>dHGqv1xb+Y+3P_VK|^@zG6Qlix|iF=|crm6YLNbawS}V`O03
JoFy5`3IMor4(k8_

delta 46
zcmX?RyWf_}CD<iozZ?StW7tNn+Y+2!cJaYZ@zG7rlix|iF)B~?m6Ty**<2_Y$_fBl
C&<*PV

diff --git a/tests/data/acpi/q35/DSDT.memhp b/tests/data/acpi/q35/DSDT.memhp
index 85598ca3f68f437e8d5048e2cb9815f20b332152..7e68670cdef2f65083f0a2044eb86565f3da1f89 100644
GIT binary patch
delta 76
zcmX@?e#)K8CD<k8lrjSY<AaS{6C^m@?c;-;;-j0qCNGwVQ`HIx3J!5(P;d@#^<#AQ
e^b2Nm4)P6SbawSJU}OMMZj1~}o8={!Z~*{y-4uEN

delta 69
zcmX@*e%PJMCD<k8urdP!qsT_C2@;$R_VK|^@zG7rlNU?G$tec}1&25?C^!eW`Y}3t
Z`UNvO2l<9EI=gxqFfy=gR+C)91pvG_5_$jt

diff --git a/tests/data/acpi/q35/DSDT.mmio64 b/tests/data/acpi/q35/DSDT.mmio64
index 092fdc32628f5a145b510c2a46de8b02222b1951..462e3bd5b622b7da06b2eaf194cc55a07ce9f9f9 100644
GIT binary patch
delta 76
zcmccb`plKfCD<k8nGyp7<J65@6C^m@?c;-;;-j0qCNGwVQ`HIx3J!5(P;d@#^<#AQ
e^b2Nm4)P6SbawSJU}OMMZj1~}o8=`BZ~_2&JQSG#

delta 69
zcmaFndf%1HCD<k8z7hii<H?O&6C^kt?Bj!-;-j0KCoh(WlT!`|3J!5(P;d@#^<#AQ
Z^b2Nm4)P6SbawSJU}Rv~tR{JY69D&n6PW-2

diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.numamem
index 899946255b9111e077e06c5f78be860e863911b9..1bfae7b803a971d47eeba3d943b83b9862f0c3cf 100644
GIT binary patch
delta 76
zcmexm(`d`(66_MvD96CSIAbH%1PM-e`}km|_~<6D$%`f8RJ8(vf<qh`6r2NG{TQ7+
d{el^tgM7mnon5^Q7#Tp68zTeLW_ihIRsckp6K?<j

delta 69
zcmZp){bj@D66_LECC9+PcxEHl1PM+D`}km|_~<6*$%`f8<dg$~f<qh`6r2NG{TQ7+
Z{el^tgM7mnon5^Q7#UbLt4T()0szJ!5^n$i

diff --git a/tests/data/acpi/q35/DSDT.tis b/tests/data/acpi/q35/DSDT.tis
index 08802fbd12eae6ad99f03a8db9a0bc7f95e77cb4..24f390d3404640f4f2636bff54911e012f8c23c2 100644
GIT binary patch
delta 76
zcmccQc+-)~CD<k8rUC;4<N1wT6C^kt?c;-;;-j0qCNGwVQ`HIx3J!5(P;d@#^<#AQ
e^b2Nm4)P6SbawSJU}OMMZj1~}o8=`pvjYHm0~Cz_

delta 69
zcmccVc*&8=CD<k8k^%z*<Cl$G6C^mj?Bau+;-j0KCoh(WlT!`|3J!5(P;d@#^<#AQ
Z^b2Nm4)P6SbawSJU}Rv~tR}gc9RT&z6O8}>

-- 
2.27.0


