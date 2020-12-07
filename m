Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 381682D1350
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 15:15:28 +0100 (CET)
Received: from localhost ([::1]:55536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmHIV-0000XU-8k
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 09:15:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmHBL-0002CW-NF
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 09:08:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmHBF-0002j6-85
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 09:07:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607350076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D7SG/Ty5KCt51sucPe7SpPkTp6Wit2NKV3anvs/L9ZE=;
 b=eBlb5jRXAuMLhhJbEIZV6ijg+20+bOirfOZXLwu13Wvi19raUGZnumihCuY6nAcc3sa8Jn
 nWq3CEuqXi03ERpbKrzFGI4oDJprm2KIWX5Sl3PaJBLIJlQnLAy1lquzd6vhszyANRmBR8
 1VR6Xt5J8nSHlecCCQfjlZvaZVrTjak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-ZgHWM8UUOUaC2JIHa8O38w-1; Mon, 07 Dec 2020 09:07:55 -0500
X-MC-Unique: ZgHWM8UUOUaC2JIHa8O38w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EACBD858182;
 Mon,  7 Dec 2020 14:07:53 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB8B110016FF;
 Mon,  7 Dec 2020 14:07:52 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/8] tests/acpi: update expected files
Date: Mon,  7 Dec 2020 09:07:37 -0500
Message-Id: <20201207140739.3829993-7-imammedo@redhat.com>
In-Reply-To: <20201207140739.3829993-1-imammedo@redhat.com>
References: <20201207140739.3829993-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

update expected files with following change:

@@ -557,6 +557,7 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPCDSDT", 0x00000001)
                 CINS,   1,
                 CRMV,   1,
                 CEJ0,   1,
+                CEJF,   1,
                 Offset (0x05),
                 CCMD,   8
             }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |  21 --------------------
 tests/data/acpi/pc/DSDT                     | Bin 5060 -> 5065 bytes
 tests/data/acpi/pc/DSDT.acpihmat            | Bin 6385 -> 6390 bytes
 tests/data/acpi/pc/DSDT.bridge              | Bin 6919 -> 6924 bytes
 tests/data/acpi/pc/DSDT.cphp                | Bin 5524 -> 5529 bytes
 tests/data/acpi/pc/DSDT.dimmpxm             | Bin 6714 -> 6719 bytes
 tests/data/acpi/pc/DSDT.hpbridge            | Bin 5021 -> 5026 bytes
 tests/data/acpi/pc/DSDT.hpbrroot            | Bin 3079 -> 3084 bytes
 tests/data/acpi/pc/DSDT.ipmikcs             | Bin 5132 -> 5137 bytes
 tests/data/acpi/pc/DSDT.memhp               | Bin 6419 -> 6424 bytes
 tests/data/acpi/pc/DSDT.numamem             | Bin 5066 -> 5071 bytes
 tests/data/acpi/pc/DSDT.roothp              | Bin 5256 -> 5261 bytes
 tests/data/acpi/q35/DSDT                    | Bin 7796 -> 7801 bytes
 tests/data/acpi/q35/DSDT.acpihmat           | Bin 9121 -> 9126 bytes
 tests/data/acpi/q35/DSDT.bridge             | Bin 7814 -> 7819 bytes
 tests/data/acpi/q35/DSDT.cphp               | Bin 8260 -> 8265 bytes
 tests/data/acpi/q35/DSDT.dimmpxm            | Bin 9450 -> 9455 bytes
 tests/data/acpi/q35/DSDT.ipmibt             | Bin 7871 -> 7876 bytes
 tests/data/acpi/q35/DSDT.memhp              | Bin 9155 -> 9160 bytes
 tests/data/acpi/q35/DSDT.mmio64             | Bin 8927 -> 8932 bytes
 tests/data/acpi/q35/DSDT.numamem            | Bin 7802 -> 7807 bytes
 tests/data/acpi/q35/DSDT.tis                | Bin 8402 -> 8407 bytes
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
index 4ca46e5a2bdb1dfab79dd8630aeeb9a386d8b30e..f6173df1d598767a79aa34ad7585ad7d45c5d4f3 100644
GIT binary patch
delta 74
zcmX@2eo~#wCD<k8q%Z>m<ARM`Ti7`L?c#%-;-i~9CLd>uQ`QIw3J!5(P;d@#^<#AQ
b^b2Nm4)P6SbawSJ01<AC49uII*&BHPG~N^c

delta 69
zcmX@9eng$iCD<k8h%f^K<C%?ITi7_g?Bau+;-j0KCm&~vlT!`|3J!5(P;d@#^<#AQ
Z^b2Nm4)P6SbawSJU}Rv~?7`m10|3|D68``I

diff --git a/tests/data/acpi/pc/DSDT.acpihmat b/tests/data/acpi/pc/DSDT.acpihmat
index 35a74bce8cc152ecb615cb38c4b7f63c7c7d3ab3..67f3f7249eaaa9404ebf0f2d0a324b8c8e3bd445 100644
GIT binary patch
delta 74
zcmexp_|1^ZCD<k8n*;*`W9&w*Eo_{AF7d%m@zG5llaI5-DQg4-1&25?C^!eW`Y}3t
b`UNvO2l<9EI=gxqfCx862IkGq?CS&pQiv3j

delta 69
zcmexn_|cHdCD<k8qXYv3W9LS$Eo_{gF7d%m@zG7rlaI5-$tec}1&25?C^!eW`Y}3t
Z`UNvO2l<9EI=gxqFfy=g_F!Kp2mte(6O#Y{

diff --git a/tests/data/acpi/pc/DSDT.bridge b/tests/data/acpi/pc/DSDT.bridge
index 803d7a8e839ea8b7ac33c4490459ddaede584269..643390f4c4138b37fc481656d3f555d0eeedcb02 100644
GIT binary patch
delta 74
zcmZoS>oMbU33dtLk!E0Ee6f*h3md1uU3{=pd~}n?<l}5{${GPd!6A+e3eEwpevHnZ
be!+~+LB3&(&aPetAi|B2fqAnt`w?LP{pAyY

delta 69
zcmeA%Yd7O^33dr#mu6sK6xqnNg^kn8E<V^PKDx<y@^Q8}Ipu($;1EX!1?K=)KSpOy
YzhFk^Am1=XXIC!+Mh2G69_&Yi0d3zAfB*mh

diff --git a/tests/data/acpi/pc/DSDT.cphp b/tests/data/acpi/pc/DSDT.cphp
index 8bab2f506409f2b025a63d8b91c7bfdaa931e626..1ddcf7d8812f5d8d4d38fe7e7b35fd5885806046 100644
GIT binary patch
delta 74
zcmbQDJyV;@CD<iorYHjgBg;mvEo_|r(ec4f@zG5llaI5-DQg4-1&25?C^!eW`Y}3t
b`UNvO2l<9EI=gxqfCx862IkGq?16j$@e&fu

delta 69
zcmbQKJw=<#CD<ioiYNmEqrpb5Eo_`#(ec4f@zG7rlaI5-$tec}1&25?C^!eW`Y}3t
Z`UNvO2l<9EI=gxqFfy=g_Fxa>0|1#g5zGJp

diff --git a/tests/data/acpi/pc/DSDT.dimmpxm b/tests/data/acpi/pc/DSDT.dimmpxm
index e015b4594c96a6e0f34c0668e3383b9a91dff38e..c44385cc01879324738ffb7f997b8cdd762cbf97 100644
GIT binary patch
delta 74
zcmdmGvfqTuCD<jzUW$Q%@$E*gEo__~0rA03@zG5llaI5-DQg4-1&25?C^!eW`Y}3t
b`UNvO2l<9EI=gxqfCx862IkGq?B9g|DsB{3

delta 69
zcmdmQvde_aCD<jzN{WGjQF0^K7B)`jfcRji_~<6*$;a8^<dg$~f<qh`6r2NG{TQ7+
Z{el^tgM7mnon5^Q7#UbLd$4~O0sxmK5>@~J

diff --git a/tests/data/acpi/pc/DSDT.hpbridge b/tests/data/acpi/pc/DSDT.hpbridge
index 56032bcf1ba4e251f16c9028429826090531efdd..4ecf1eb13bf49499f729b53a6d0114672a76e28d 100644
GIT binary patch
delta 74
zcmbQMzDS+RCD<iokuU=T<IRm+Ti7`L?c#%-;-i~9CLd>uQ`QIw3J!5(P;d@#^<#AQ
b^b2Nm4)P6SbawSJ01<AC49uII*`s&>A;%M(

delta 69
zcmZ3aK3AQ~CD<iot}p`wBkM-4Eo_`#cJaYZ@zG7rlaI5-$tec}1&25?C^!eW`Y}3t
Z`UNvO2l<9EI=gxqFfy=g_F#|V0RWEi5u5-3

diff --git a/tests/data/acpi/pc/DSDT.hpbrroot b/tests/data/acpi/pc/DSDT.hpbrroot
index 36b0a8f2fbf93df47b66107125cd3ce01e017b92..a3046226ec1dcb234b726029b3790dfedb3b9221 100644
GIT binary patch
delta 52
zcmZpd=#k)Z33dtL;bCB4Y~0AD&Bp0(7a!~tAKm0J*^VuaQDgF4HfeTeS1&h42IkGX
H*nC+5ORx;6

delta 47
zcmeB?XqVt}33dr#=V4%AT)UA=n~l@UE<V^PKDx<yvK?C-qw?grY|=~&ESvYU`LY54
D6B7%l

diff --git a/tests/data/acpi/pc/DSDT.ipmikcs b/tests/data/acpi/pc/DSDT.ipmikcs
index ca6630e39f60ebd5c056f57c4c03fdb9d5467577..f1638c5d079a9442c09390426a913010df6efd8d 100644
GIT binary patch
delta 52
zcmeCtn5e<!66_KpD8j(NXuOf@4;!byU3{=pd~}n?WPbKIMvcjN?9%Mcu3m1849uIm
H*&BHPU-S(V

delta 47
zcmbQJ(WAlT66_MfBf`MI7{8J04;!bKU3{=pd~}oZWPbKIM&-$Q?9xmOESo2=H}U`g
DC4meR

diff --git a/tests/data/acpi/pc/DSDT.memhp b/tests/data/acpi/pc/DSDT.memhp
index 43f4e114e2cc48c68c35af47303fa87c9255db40..4c19e45e66918c61674785c99e4474e58866f125 100644
GIT binary patch
delta 74
zcmbPiG{cC?CD<iILXv@japFd<Eo_{w_VK|^@zG5llaI5-DQg4-1&25?C^!eW`Y}3t
b`UNvO2l<9EI=gxqfCx862IkGq>=y(9?$i@R

delta 69
zcmbPXG}(yDCD<iISdxK(aqmX1Eo__)_VK|^@zG7rlaI5-$tec}1&25?C^!eW`Y}3t
Z`UNvO2l<9EI=gxqFfy=g_F%st2mqHX5<~z1

diff --git a/tests/data/acpi/pc/DSDT.numamem b/tests/data/acpi/pc/DSDT.numamem
index ba8f7e6c33f9eb0f7a080144fcb4a27d36aa04ae..40cfd933259af05ac2aee07fca32f22122255211 100644
GIT binary patch
delta 74
zcmX@5eqNo+CD<k8yf6a;qt`~REo_{w_VK|^@zG5llaI5-DQg4-1&25?C^!eW`Y}3t
b`UNvO2l<9EI=gxqfCx862IkGq?Cm@NBh3@I

delta 69
zcmX@FeoCFoCD<k8lrRGWW7$ToEo__)_VK|^@zG7rlaI5-$tec}1&25?C^!eW`Y}3t
Z`UNvO2l<9EI=gxqFfy=g_F!-40RYHM61V^W

diff --git a/tests/data/acpi/pc/DSDT.roothp b/tests/data/acpi/pc/DSDT.roothp
index 18caa0765fc10adb29e01717390ead6c63cd0f3c..078fc8031b479cc77b6527a2b7b4bd576b6e6028 100644
GIT binary patch
delta 74
zcmeCs?A7FQ33dtT6=7gtJhqW*3md1uU3{=pd~}n?<l}5{${GPd!6A+e3eEwpevHnZ
be!+~+LB3&(&aPetAi|B2fqAntyDKjM4LcJ%

delta 69
zcmeCx?9k+L33dtT5Mf|o{Irp43md1GU3{=pd~}oZ<l}5{a>@Zg!6A+e3eEwpevHnZ
Ye!+~+LB3&(&aPetj0`NBJ=k4&0kY;2I{*Lx

diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
index e7414e78563372fca4d2aab9d16c58c0ff8468f4..d25cd7072932886d6967f4023faac1e1fa6e836c 100644
GIT binary patch
delta 74
zcmexj^V5dQCD<jTQjURv@!LkO2@;(CcJaYZ@zG5llNU?GDQg4-1&25?C^!eW`Y}3t
b`UNvO2l<9EI=gxqfCx862IkH3lA){sR<9H>

delta 69
zcmexq^TmeCCD<jTM2>-hQE4OB1PM+ryZB(I_~<6*$%`f8<dg$~f<qh`6r2NG{TQ7+
Z{el^tgM7mnon5^Q7#UbLt4M~j0sz2T5-|V(

diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT.acpihmat
index 88434da261212b15264c892976775acd5c954aea..722e06af83abcde203a2b96a8ec81fd3bab9fc98 100644
GIT binary patch
delta 74
zcmZ4JzRaD=CD<ionKA<d<K~TA6C^nOT;hYB;-i~9CNGwVQ`QIw3J!5(P;d@#^<#AQ
b^b2Nm4)P6SbawSJ01<AC49uJ5C7ZYaE9n!*

delta 69
zcmZ4HzR;b^CD<iop)vyl<Nb|X6C^l2UE+hC;-j0KCoh(WlT!`|3J!5(P;d@#^<#AQ
Z^b2Nm4)P6SbawSJU}Rv~tRmUO1pv>W62|}l

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index 118476ff6101e11d6b1f2d3399241d7fd1a6f634..06bac139d668ddfc7914e258b471a303c9dbd192 100644
GIT binary patch
delta 74
zcmZp(?Y8A|33dtTmSbRG?BB>WL4woYE<V^PKDx<c@?wcNWsQKK;1EX!1?K=)KSpOy
bzhFk^Am1=XXIC!+5aGtiz`R*rGMyCw1r-w%

delta 69
zcmeCSZL{Ta33dr-lVf0D+`W-&f&{0RU3{=pd~}oZ<i!$ka>@Zg!6A+e3eEwpevHnZ
Ye!+~+LB3&(&aPetj0`NBRV33{0jsML6aWAK

diff --git a/tests/data/acpi/q35/DSDT.cphp b/tests/data/acpi/q35/DSDT.cphp
index 69c5edf620529e995461ccba63b76a083f25b2b6..2b933ac482e6883efccbd7d6c96089602f2c0b4d 100644
GIT binary patch
delta 74
zcmX@&aMFRxCD<jzQ-OhjF=`{%1PM<6==fl#_~<5&$%`f8lr;i^f<qh`6r2NG{TQ7+
b{el^tgM7mnon5^QK!h731M_BiNmX_L67mxM

delta 69
zcmX@<aKwSjCD<jzMS+2Vv27#Q1PM;B==fl#_~<6*$%`f8<dg$~f<qh`6r2NG{TQ7+
Z{el^tgM7mnon5^Q7#UbLt4OM{0|2<T5&i%G

diff --git a/tests/data/acpi/q35/DSDT.dimmpxm b/tests/data/acpi/q35/DSDT.dimmpxm
index af41acba6e0117191ad8495a30ded7b0acc4d2ca..bd8f8305b028ef20f9b6d1a0c69ac428d027e3d1 100644
GIT binary patch
delta 74
zcmaFm`QDSuCD<k8y$S;ZquNHU2@;$h0rA03@zG5llNU?GDQg4-1&25?C^!eW`Y}3t
b`UNvO2l<9EI=gxqfCx862IkH3lBc-=N;4E{

delta 69
zcmaFw`O1^aCD<k8l?np`W6(yf2@;&n0rA03@zG7rlNU?G$tec}1&25?C^!eW`Y}3t
Z`UNvO2l<9EI=gxqFfy=gR*^i-4FK#d6KVhe

diff --git a/tests/data/acpi/q35/DSDT.ipmibt b/tests/data/acpi/q35/DSDT.ipmibt
index a650c3041ab9d6688eda843a6a2ab418e1a7ce9b..a8f868e23c25688ab1c0371016c071f23e9d732f 100644
GIT binary patch
delta 52
zcmdmQd&HK@CD<k8h#Uh0qt-^Q+Y+4qcJaYZ@zG5llix|iF=|Zqm6T?8cJ*>&WMJN$
IB^k;J0IQk~=Kufz

delta 47
zcmX?NyWf_}CD<iozZ?StW7tNn+Y+2!cJaYZ@zG7rlix|iF)B~?m6T>;VA-568OjO(
DX1NXL

diff --git a/tests/data/acpi/q35/DSDT.memhp b/tests/data/acpi/q35/DSDT.memhp
index 85598ca3f68f437e8d5048e2cb9815f20b332152..9a802e4c67022386442976d5cb997ea3fc57b58f 100644
GIT binary patch
delta 74
zcmX@?e!`v0CD<k8gfasI<BN@46C^lY?c;-;;-i~9CNGwVQ`QIw3J!5(P;d@#^<#AQ
c^b2Nm4)P6SbawSJ01<AC49uJ5C6{mk08y|Mb^rhX

delta 69
zcmX@%e%PJMCD<k8urdP!qsT_C2@;$R_VK|^@zG7rlNU?G$tec}1&25?C^!eW`Y}3t
Z`UNvO2l<9EI=gxqFfy=gR*_u71pvFI5_SLp

diff --git a/tests/data/acpi/q35/DSDT.mmio64 b/tests/data/acpi/q35/DSDT.mmio64
index 092fdc32628f5a145b510c2a46de8b02222b1951..948c2dc7264c31932b490ca00691a7c4d9aefdb0 100644
GIT binary patch
delta 74
zcmccb`oxvXCD<k8i4p??<J^s06C^lY?c;-;;-i~9CNGwVQ`QIw3J!5(P;d@#^<#AQ
c^b2Nm4)P6SbawSJ01<AC49uJ5B@b`{09FSSl>h($

delta 69
zcmaFjdf%1HCD<k8z7hii<H?O&6C^kt?Bj!-;-j0KCoh(WlT!`|3J!5(P;d@#^<#AQ
Z^b2Nm4)P6SbawSJU}Rv~tRi`U69D$<6O{k}

diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.numamem
index 899946255b9111e077e06c5f78be860e863911b9..44ec1b0af400da6d298284aa959aa38add7e6dd5 100644
GIT binary patch
delta 74
zcmexm^WTQcCD<jTUXFo*aluBe2@;&H_VK|^@zG5llNU?GDQg4-1&25?C^!eW`Y}3t
b`UNvO2l<9EI=gxqfCx862IkH3lF_UHMV=Gt

delta 69
zcmexw^UH?ICD<jTN{)en@ytf92@;$R_VK|^@zG7rlNU?G$tec}1&25?C^!eW`Y}3t
Z`UNvO2l<9EI=gxqFfy=gR*{Tm1pw#D66yc|

diff --git a/tests/data/acpi/q35/DSDT.tis b/tests/data/acpi/q35/DSDT.tis
index 08802fbd12eae6ad99f03a8db9a0bc7f95e77cb4..30da3ec27958881801dacc954a343321ba26a2ae 100644
GIT binary patch
delta 74
zcmccQc-@i9CD<k8x&i|O<B5%26C^nO?c#%-;-i~9CNGwVQ`QIw3J!5(P;d@#^<#AQ
c^b2Nm4)P6SbawSJ01<AC49uJ5B{#DJ090=ji2wiq

delta 69
zcmccac*&8=CD<k8k^%z*<Cl$G6C^mj?Bau+;-j0KCoh(WlT!`|3J!5(P;d@#^<#AQ
Z^b2Nm4)P6SbawSJU}Rv~tRlIY9RT%06Nvx-

-- 
2.27.0


