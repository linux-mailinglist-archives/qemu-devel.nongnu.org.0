Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F45600C9B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 12:39:22 +0200 (CEST)
Received: from localhost ([::1]:52986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okNWg-0004Gs-Eo
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 06:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1okNGX-0006tT-I1
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 06:22:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1okNGS-0002n5-PL
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 06:22:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666002151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5VtGJ+R0u1i76HD8/kqhE6HDIbY4tdj1ft0eXicaSbw=;
 b=d0XUtweLi1qiQohU3zR7NihOMqc9xQCzifn8tOjdrZb6m71fCWxIX1PUfB5KftQ1GU13ln
 FWRYV2Cy4lfIF7gs0yoI9GVurcRognN/xahpe6SVLMkzqsM00mzKnUhUdPznE1EWwGdhRW
 kcaBUy8Xsfj7rdMQOwbr2qbO4aL7/Lw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-Wqoynl-iOK-UcC75Bk85nQ-1; Mon, 17 Oct 2022 06:22:29 -0400
X-MC-Unique: Wqoynl-iOK-UcC75Bk85nQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA7C029A8AED;
 Mon, 17 Oct 2022 10:22:18 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06A49410871;
 Mon, 17 Oct 2022 10:22:04 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca
Subject: [PATCH 11/11] tests: acpi: update expected blobs
Date: Mon, 17 Oct 2022 12:21:46 +0200
Message-Id: <20221017102146.2254096-12-imammedo@redhat.com>
In-Reply-To: <20221017102146.2254096-1-imammedo@redhat.com>
References: <20221017102146.2254096-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 LOTS_OF_MONEY=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Expected changes are:
 1) Moving _GPE scope declaration achec of all _E0x methods
   +    Scope (_GPE)
   +    {
   +        Name (_HID, "ACPI0006" /* GPE Block Device */)  // _HID: Hardware ID
   +    }
   +
        Scope (_SB)
        {
            Device (\_SB.PCI0.PRES)
    ============
            \_SB.CPUS.CSCN ()
        }

   -    Scope (_GPE)
   -    {
   -        Name (_HID, "ACPI0006" /* GPE Block Device */)  // _HID: Hardware ID
   -    }

 2) Moving _E01 handler after PCI0 scope is defined
    -    Scope (_GPE)
    -    {
    -        Name (_HID, "ACPI0006" /* GPE Block Device */)  // _HID: Hardware ID
    -        Method (_E01, 0, NotSerialized)  // _Exx: Edge-Triggered GPE
    -        {
    -            Acquire (\_SB.PCI0.BLCK, 0xFFFF)
    -            \_SB.PCI0.PCNT ()
    -            Release (\_SB.PCI0.BLCK)
    -        }
    -    }
    -
         Scope (\_SB.PCI0)
         {
             Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
    =============
                 }
             }
         }
    +
    +    Scope (_GPE)
    +    {
    +        Method (_E01, 0, NotSerialized)  // _Exx: Edge-Triggered GPE
    +        {
    +            Acquire (\_SB.PCI0.BLCK, 0xFFFF)
    +            \_SB.PCI0.PCNT ()
    +            Release (\_SB.PCI0.BLCK)
    +        }
    +    }
     }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |  34 --------------------
 tests/data/acpi/pc/DSDT                     | Bin 6496 -> 6501 bytes
 tests/data/acpi/pc/DSDT.acpierst            | Bin 6456 -> 6461 bytes
 tests/data/acpi/pc/DSDT.acpihmat            | Bin 7821 -> 7826 bytes
 tests/data/acpi/pc/DSDT.bridge              | Bin 9570 -> 9575 bytes
 tests/data/acpi/pc/DSDT.cphp                | Bin 6960 -> 6965 bytes
 tests/data/acpi/pc/DSDT.dimmpxm             | Bin 8150 -> 8155 bytes
 tests/data/acpi/pc/DSDT.hpbridge            | Bin 6456 -> 6461 bytes
 tests/data/acpi/pc/DSDT.hpbrroot            | Bin 3107 -> 3107 bytes
 tests/data/acpi/pc/DSDT.ipmikcs             | Bin 6568 -> 6573 bytes
 tests/data/acpi/pc/DSDT.memhp               | Bin 7855 -> 7860 bytes
 tests/data/acpi/pc/DSDT.nohpet              | Bin 6354 -> 6359 bytes
 tests/data/acpi/pc/DSDT.numamem             | Bin 6502 -> 6507 bytes
 tests/data/acpi/pc/DSDT.roothp              | Bin 6694 -> 6699 bytes
 tests/data/acpi/q35/DSDT                    | Bin 8407 -> 8412 bytes
 tests/data/acpi/q35/DSDT.acpierst           | Bin 8424 -> 8429 bytes
 tests/data/acpi/q35/DSDT.acpihmat           | Bin 9732 -> 9737 bytes
 tests/data/acpi/q35/DSDT.applesmc           | Bin 8453 -> 8458 bytes
 tests/data/acpi/q35/DSDT.bridge             | Bin 11536 -> 11541 bytes
 tests/data/acpi/q35/DSDT.cphp               | Bin 8871 -> 8876 bytes
 tests/data/acpi/q35/DSDT.cxl                | Bin 9733 -> 9738 bytes
 tests/data/acpi/q35/DSDT.dimmpxm            | Bin 10061 -> 10066 bytes
 tests/data/acpi/q35/DSDT.ipmibt             | Bin 8482 -> 8487 bytes
 tests/data/acpi/q35/DSDT.ipmismbus          | Bin 8495 -> 8500 bytes
 tests/data/acpi/q35/DSDT.ivrs               | Bin 8424 -> 8429 bytes
 tests/data/acpi/q35/DSDT.memhp              | Bin 9766 -> 9771 bytes
 tests/data/acpi/q35/DSDT.mmio64             | Bin 9537 -> 9542 bytes
 tests/data/acpi/q35/DSDT.multi-bridge       | Bin 8727 -> 8732 bytes
 tests/data/acpi/q35/DSDT.nohpet             | Bin 8265 -> 8270 bytes
 tests/data/acpi/q35/DSDT.numamem            | Bin 8413 -> 8418 bytes
 tests/data/acpi/q35/DSDT.pvpanic-isa        | Bin 8508 -> 8513 bytes
 tests/data/acpi/q35/DSDT.tis.tpm12          | Bin 9013 -> 9018 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 9039 -> 9044 bytes
 tests/data/acpi/q35/DSDT.viot               | Bin 9516 -> 9521 bytes
 tests/data/acpi/q35/DSDT.xapic              | Bin 35770 -> 35775 bytes
 35 files changed, 34 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 725a1dc798..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,35 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/DSDT",
-"tests/data/acpi/pc/DSDT.bridge",
-"tests/data/acpi/pc/DSDT.ipmikcs",
-"tests/data/acpi/pc/DSDT.cphp",
-"tests/data/acpi/pc/DSDT.memhp",
-"tests/data/acpi/pc/DSDT.numamem",
-"tests/data/acpi/pc/DSDT.nohpet",
-"tests/data/acpi/pc/DSDT.dimmpxm",
-"tests/data/acpi/pc/DSDT.acpihmat",
-"tests/data/acpi/pc/DSDT.acpierst",
-"tests/data/acpi/pc/DSDT.roothp",
-"tests/data/acpi/pc/DSDT.hpbridge",
-"tests/data/acpi/pc/DSDT.hpbrroot",
-"tests/data/acpi/q35/DSDT",
-"tests/data/acpi/q35/DSDT.tis.tpm2",
-"tests/data/acpi/q35/DSDT.tis.tpm12",
-"tests/data/acpi/q35/DSDT.bridge",
-"tests/data/acpi/q35/DSDT.multi-bridge",
-"tests/data/acpi/q35/DSDT.mmio64",
-"tests/data/acpi/q35/DSDT.ipmibt",
-"tests/data/acpi/q35/DSDT.cphp",
-"tests/data/acpi/q35/DSDT.memhp",
-"tests/data/acpi/q35/DSDT.numamem",
-"tests/data/acpi/q35/DSDT.nohpet",
-"tests/data/acpi/q35/DSDT.dimmpxm",
-"tests/data/acpi/q35/DSDT.acpihmat",
-"tests/data/acpi/q35/DSDT.acpierst",
-"tests/data/acpi/q35/DSDT.applesmc",
-"tests/data/acpi/q35/DSDT.pvpanic-isa",
-"tests/data/acpi/q35/DSDT.ivrs",
-"tests/data/acpi/q35/DSDT.viot",
-"tests/data/acpi/q35/DSDT.cxl",
-"tests/data/acpi/q35/DSDT.ipmismbus",
-"tests/data/acpi/q35/DSDT.xapic",
diff --git a/tests/data/acpi/pc/DSDT b/tests/data/acpi/pc/DSDT
index 5b4624cb68c78eab6e356987974b9bee6c9a1785..f1cf7fab349bd26e0f0fa461c715534c1426fbf5 100644
GIT binary patch
delta 60
zcmaE0^wfyUCD<h-Rg!^$@xex}HLSuS@$Lbx9Pu8WF1(J;0iFg124<VLu=25N7UJ^b
OXA`goNl(7cX$1fe{1Br6

delta 55
zcmaEA^uUPACD<h-L6U)i(O@Ij8rIFHS$SAQ{aNDO16(=cJv?1_9i0O_4Gav-7$$2=
LT5Z0@>CX=Uu}Tiy

diff --git a/tests/data/acpi/pc/DSDT.acpierst b/tests/data/acpi/pc/DSDT.acpierst
index 99461b771eec2043263b5bc3c109a08969a99af9..5cb477625e96f5526f0c7703ba3b443a0b35eefd 100644
GIT binary patch
delta 60
zcmdmCwAYBsCD<jzR+52%QE?;J8dhPEc=rHTj(87G7hXr_08ax01GCLrSov5s3vsFO
OvkBOPq$gkJv;qLpD-T2f

delta 55
zcmdmMw8MzYCD<jzLXv@jv2Y{T8rIFHS$SAQ{aNDO16(=cJv?1_9i0O_4Gav-7$!4I
LT5Z0@sm>1oq7x2P

diff --git a/tests/data/acpi/pc/DSDT.acpihmat b/tests/data/acpi/pc/DSDT.acpihmat
index b84f3b47c37e427b927c36036307db6e83a843e5..76e8bef36fdb667447ad0320d35604031aae2c93 100644
GIT binary patch
delta 46
zcmeCRon*`966_K(NsfVmaqdR0HLQ#xlRxqaZ{Esk#ktv@-;bY7z&_qRz;!YUzZC#I
C&J4u>

delta 55
zcmbPa+iT0^66_MvE62dV_;w@L8rIFHSuHt5{aNDO16(=cJv?1_9i0O_4Gav-7$!%^
LS#4(K_vZ%yzRnKP

diff --git a/tests/data/acpi/pc/DSDT.bridge b/tests/data/acpi/pc/DSDT.bridge
index 6771620078086e42b445474b16797094e0d0a801..c94c1b54b3ac3085c02307d9564b258e791fcf1e 100644
GIT binary patch
delta 60
zcmaFl_1ufgCD<h-U6p}>@$5#fHLSuS@$Lbx9Pu8WF1(J;0iFg124<VLu=25N7UBw!
OW)rXnNl(7cX$1fq#t`5D

delta 55
zcmaFv^~j6MCD<h-NtJ<tQFbHO8rIFHS$SAQ{aNDO16(=cJv?1_9i0O_4Gav-7$)ng
LT5Z0@87K_^yYmkx

diff --git a/tests/data/acpi/pc/DSDT.cphp b/tests/data/acpi/pc/DSDT.cphp
index 298fa1592676b3a2089b08eff5f764e04391b961..eb3da0e232e4362bd5850e4eebf5916cbc1d565a 100644
GIT binary patch
delta 60
zcmdmBw$+TwCD<jzRGNW-(Pbmo8dhPEc=rHTj(87G7hXr_08ax01GCLrSnsiJe#Gs^
O&n93GlAgSr+X?{i%n<be

delta 55
zcmdmLw!w_cCD<jzK$?Mpamq%nHLROYv)*A9^=FB94{+s(_waP#b#xB!G%zqQW0?F~
L%4+j6Zhw9N$1M;p

diff --git a/tests/data/acpi/pc/DSDT.dimmpxm b/tests/data/acpi/pc/DSDT.dimmpxm
index 9fcadb266b92fc4942621f0fd919703723de2fd9..6553e4c6053aff76ac42dad87d714e4e9ab28f72 100644
GIT binary patch
delta 81
zcmca+f7_nRCD<k8wmbs^qrgV4HLMyM@$Lbx9Pu8WF1(J;0iFg124)N*!tt&KCJb#c
jdhx+d@qS@0L0k=+x3U&+ZSEBC<!2MH2kDt?DPRQvnI{$^

delta 75
zcmca@f6boDCD<k8nmhvoW8FrsHLRQOv*vS&u*JIvxN^jMc)IX9ItO?f7#Nr_OkOB&
fB_bjm?`mMe&=#W?AM6zG7v>Vg)v(z|z@HxgQ?nI5

diff --git a/tests/data/acpi/pc/DSDT.hpbridge b/tests/data/acpi/pc/DSDT.hpbridge
index 99461b771eec2043263b5bc3c109a08969a99af9..5cb477625e96f5526f0c7703ba3b443a0b35eefd 100644
GIT binary patch
delta 60
zcmdmCwAYBsCD<jzR+52%QE?;J8dhPEc=rHTj(87G7hXr_08ax01GCLrSov5s3vsFO
OvkBOPq$gkJv;qLpD-T2f

delta 55
zcmdmMw8MzYCD<jzLXv@jv2Y{T8rIFHS$SAQ{aNDO16(=cJv?1_9i0O_4Gav-7$!4I
LT5Z0@sm>1oq7x2P

diff --git a/tests/data/acpi/pc/DSDT.hpbrroot b/tests/data/acpi/pc/DSDT.hpbrroot
index b10b17cb1111f6b5d61da4aa1c754f2921a4ac1c..ff04ad360beb60571d48bd1e477a4e58e5ee9337 100644
GIT binary patch
delta 37
scmZ21u~=e5CX290ynBEvN4$rp3$LSdfTw|hf!XGC7Cx5ET^uu+0mthKGXMYp

delta 38
tcmZ21u~=e5Cd=kJ79JK6k$Cq2SB`iOPZwTC=KxOw0|PUL&7B;xm;uwt3P}I}

diff --git a/tests/data/acpi/pc/DSDT.ipmikcs b/tests/data/acpi/pc/DSDT.ipmikcs
index aff3e9bbe1fdbf783c49d07a49c2e16317a2871e..83eec58a52b5844a02003665494f63a4ea0b26a7 100644
GIT binary patch
delta 60
zcmZ2syw;e@CD<iott0~jW6VabHLSuS@$Lbx9Pu8WF1(J;0iFg124<VLu=25N7UG)5
O&n93GlAe5>(+U9a*$_bh

delta 55
zcmZ2$yuz5vCD<iog(L$5<C=|JYgjj*X60cK^=FB94{+s(_waP#b#xB!G%zqQW0+hl
LX|?$p=X8Dmy|53$

diff --git a/tests/data/acpi/pc/DSDT.memhp b/tests/data/acpi/pc/DSDT.memhp
index 07b193b9939e2199bce5edc743de5494133c1e8c..9e2201d170a86652951a2a4b234bb58204010642 100644
GIT binary patch
delta 60
zcmZ2)yTz8vCD<ioiyQ+3<E4#UYgmOv;@tyWIpRG$U3eXx13V2349qrfVU6Y7oXGFT
O&n93GlAf%_Zv_AqSP+^3

delta 55
zcmdmDyWW<|CD<ioy&MArqtZsMHLROYvqp1@`m@Bl2e@*?dw9C=Iywh<8W<RuF-)$K
Lv)Zi6@6QhaxVa9~

diff --git a/tests/data/acpi/pc/DSDT.nohpet b/tests/data/acpi/pc/DSDT.nohpet
index ceee7722ceed8a7e8f61a37805a4c855f47244a8..c969e0dae410763a5f749c4c4fc842ccbf901fc5 100644
GIT binary patch
delta 61
zcmca)c-@f8CD<k8x&#9Q<Eo8Za;zdE@$Lbx9Pu8WF1(J;0iFg124)PK)meF2Hn(v4
P@v{logXAZBa#{fZ0$&e^

delta 55
zcmca^c*&5<CD<k8k^}<-<FAcea;%$eS$SAQ{aNDO16(=cJv?1_9i0O_4Gav-7$(n^
Lu-fdw>CX=UxO5J{

diff --git a/tests/data/acpi/pc/DSDT.numamem b/tests/data/acpi/pc/DSDT.numamem
index e03f4d07b86018d12def37b5397ba9673548e2b7..1cecaa64e9ef29b5096ae1ba4882e2c8e080f0ea 100644
GIT binary patch
delta 60
zcmaE6^xBBaCD<h-Tatl+v1=pO8dhPEc=rHTj(87G7hXr_08ax01GCLrSVdSiOK|z|
OvkBOPq$l6yv;qJHRuFLj

delta 55
zcmaED^vsCMCD<h-O_G6u@zzGJHLROYvkI|@`m@Bl2e@*?dw9C=Iywh<8W<RuF-$g;
LwAy@!)1Myz(Jl|F

diff --git a/tests/data/acpi/pc/DSDT.roothp b/tests/data/acpi/pc/DSDT.roothp
index 418cc92e4c061ad21e1d281e0b5e6114e283b7d3..f57a14cd5c48ddded4c5d0b7da037b9d021a9ecb 100644
GIT binary patch
delta 60
zcmZ2xvf6~pCD<iITZ(~!v3?`h8dhPEc=rHTj(87G7hXr_08ax01GCLrSov5s3vr1E
OunE|Mq$gkJv;qLuX%Aok

delta 55
zcmZ2&vdo0bCD<iIO^Shm@%%=vHLROYv+}Tr`m@Bl2e@*?dw9C=Iywh<8W<RuF--m_
LX|?$pr>Fn`uA2{E

diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
index c8a2b5df26608f10c75ab8f2f9e404fda987891b..8e989819a5f8c470a8933bf9b7af7b988048cce6 100644
GIT binary patch
delta 60
zcmccac*l{;CD<k8jsgP%<M)kRb0maC;@tyWIpRG$U3eXx13V2349qq!k>F$5%p`l2
OnN7eRBt7}Kj1>Sj$q~x{

delta 55
zcmccPc-@i9CD<k8x&i|Oqx(j#ITD+9OYpFW`m@Bl2e@*?dw9C=Iywh<8W<RuF-%^h
LV72*}%r#~J)0q%|

diff --git a/tests/data/acpi/q35/DSDT.acpierst b/tests/data/acpi/q35/DSDT.acpierst
index eb63e439b92424e4c50b7e5f1df92da54ecfc6ea..03745d78de4c7e9639a4a37553361e0e18258633 100644
GIT binary patch
delta 60
zcmaFi_|}ojCD<k8tpWoB<MfSOb0maC;@tyWIpRG$U3eXx13V2349qq!k>F$5%q07a
OnN7eRBt7}Kj1>SepAoMB

delta 55
zcmaFs_`;FPCD<k8g#rTu<MWMNb0jwJmf&F#^=FB94{+s(_waP#b#xB!G%zqQW0<^I
L!D{m{ndi&^_#F{+

diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT.acpihmat
index f9199a0dd614b30c9e73eb7de7e051ce84c1d73f..3ad9ba3c987ca1cfbafc3778db889602ab53530e 100644
GIT binary patch
delta 46
zcmZqi>Ga`p33dtLRAXRZ+`N%%js&B~<cEsFo0m#hac<UEy2{KZU?1-u;5zw>q7?u+
C+70gj

delta 55
zcmeD5Y4PE533dr#QDb0WWZuX%M`H7C2}@2<f0lUn09TH94^J0fN9O=f0|NsyhRNqu
Ltu}vFyv7Uwjvfzm

diff --git a/tests/data/acpi/q35/DSDT.applesmc b/tests/data/acpi/q35/DSDT.applesmc
index 286a4ecec273ca0e2fe2d65f80e8566a68a2f794..5f01572dc2cf44aa0e730401e0709b95cd8db604 100644
GIT binary patch
delta 60
zcmZp5>T=?833dtLQe<FYJh72$j)bsCynBEvN4$rp3$LSdfTw|hf!XFI5_~M1nPiz+
O*aYlB(vy$NSOEakt`ArM

delta 55
zcmeBjYIWjr33dr#Rb*gbl-S5MM`H7C2_6<vf0lUn09TH94^J0fN9O=f0|NsyhRGKc
LtTrE$VPOFPgdz?)

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index 9a733a54e428d3506aaf73f8d4c1f28324a71a42..97141f9db208e1948bc2bdb3f3452ac8f78f98b0 100644
GIT binary patch
delta 60
zcmbObH8qOMCD<iIRF{E)aoI+$ITFGm@$Lbx9Pu8WF1(J;0iFg124<U=Nbs?2W|HL-
OU=y$hNl!j5V+8=@EDx#x

delta 55
zcmbOlH6e=2CD<iIK$n4m@!LkOITD+9OYpFW`m@Bl2e@*?dw9C=Iywh<8W<RuF-*R#
LW3~C148H&XyC@H%

diff --git a/tests/data/acpi/q35/DSDT.cphp b/tests/data/acpi/q35/DSDT.cphp
index 8579626c7f1f035c8d400544c2af6ce6372a5625..622e8e5f3700abffc58683689b9470573c117cd0 100644
GIT binary patch
delta 60
zcmZ4Py2h2uCD<iojS>R`WAsL@ITFGm@$Lbx9Pu8WF1(J;0iFg124<U=NZe!Hd`a#q
OGn;@tNP6;gIV%7cs1h9j

delta 55
zcmZ4Ey4;n^CD<ioxe@~d<LZrEb0jwJmbk+z>dzAI9^lFm@8Rjf>*yTdX<%Sr#xS`^
L$!ha7xogY-;e!y;

diff --git a/tests/data/acpi/q35/DSDT.cxl b/tests/data/acpi/q35/DSDT.cxl
index 96594c00b3b0e0a4933d6d851d927487ad4d18eb..cecc1caaab81db8559781d23e45d8c615dc73740 100644
GIT binary patch
delta 60
zcmZqm>GI)n33dtLQe$9Xe7})vj)bsCynBEvN4$rp3$LSdfTw|hf!XFI5_~M1nPizc
O*#zuC(vy$NSOEaxZV#OR

delta 55
zcmeD3Y4zc933dr#RbyaawBN`zM`H7C2_6<vf0lUn09TH94^J0fN9O=f0|NsyhRGLH
Ltu`N%Vc`S-kB$z6

diff --git a/tests/data/acpi/q35/DSDT.dimmpxm b/tests/data/acpi/q35/DSDT.dimmpxm
index e2a3ecf7d90c8c411550505c3b70bf8d19ba4bc9..e5be00b4fa658477a9ae7016ed72ae04430a3b2f 100644
GIT binary patch
delta 81
zcmX@>cgc^-CD<h-NS%R!QEemF90?7Lc=rHTj(87G7hXr_08ax012YB@;doaA6Na`J
jz4&0Kc)u{0Ag+eZOC|ETHdiQLWo8qw2kDutscZ!Rg;*9z

delta 76
zcmccQch--~CD<jzSDk@@amq%nITD-COXP8hI<v*Q2e@*?dw9C=Iywh<8W<RuF-(?F
gw-ON%j(0UMVQ7odiw|~+_X~3g;%eAzqkN4S07LH;B>(^b

diff --git a/tests/data/acpi/q35/DSDT.ipmibt b/tests/data/acpi/q35/DSDT.ipmibt
index 427272b95692099edc47f569e41fbb3ba69f6b60..c4f8212c63be2a1d579d6ebc9ac41d4bd5be414b 100644
GIT binary patch
delta 60
zcmZ4FwA_iyCD<iIU6Fx-k!K^<90_5Oc=rHTj(87G7hXr_08ax01GCLbB=}f1Gs!Bj
OunE|Mq$eMju>t_cgbxq^

delta 55
zcmZ4Pw8)9eCD<iINs)npF=ivz9Er`lC3sjw{aNDO16(=cJv?1_9i0O_4Gav-7$(0}
Lu-be~Mv(;op_&g5

diff --git a/tests/data/acpi/q35/DSDT.ipmismbus b/tests/data/acpi/q35/DSDT.ipmismbus
index 794779e75aaf33902de834caaa6b0763c4513615..05fb38820fa9213a20ace5943486ed18ad6a765c 100644
GIT binary patch
delta 60
zcmZ4Qw8e?bCD<jzM3I4karQ>8ITFGm@$Lbx9Pu8WF1(J;0iFg124<U=Nbs?2W|Gxq
OVH2<iNl!j5V+8=}bPv-2

delta 55
zcmdnuwBCu!CD<iIUy*@<@%2WoITD+9OYpFW`m@Bl2e@*?dw9C=Iywh<8W<RuF--oY
LV72*}j2;UBz|{}m

diff --git a/tests/data/acpi/q35/DSDT.ivrs b/tests/data/acpi/q35/DSDT.ivrs
index eb63e439b92424e4c50b7e5f1df92da54ecfc6ea..03745d78de4c7e9639a4a37553361e0e18258633 100644
GIT binary patch
delta 60
zcmaFi_|}ojCD<k8tpWoB<MfSOb0maC;@tyWIpRG$U3eXx13V2349qq!k>F$5%q07a
OnN7eRBt7}Kj1>SepAoMB

delta 55
zcmaFs_`;FPCD<k8g#rTu<MWMNb0jwJmf&F#^=FB94{+s(_waP#b#xB!G%zqQW0<^I
L!D{m{ndi&^_#F{+

diff --git a/tests/data/acpi/q35/DSDT.memhp b/tests/data/acpi/q35/DSDT.memhp
index 923e213ab6a3c82faa6f659c29de9c8afb6878dd..2a4635d48c017970ee38d14148b20d38b699b030 100644
GIT binary patch
delta 60
zcmZ4Hv)YHtCD<iITaAH%@x?~2ITFGm@$Lbx9Pu8WF1(J;0iFg124<U=NW^k(4ph3z
O%qCzDlAbK4WCZ{TDG<T{

delta 55
zcmZ4Ov&@IfCD<iIO^tzp(PAUl9Er`lC89Y+{aNDO16(=cJv?1_9i0O_4Gav-7$$#I
Lwc0GIbd4DRtqc!#

diff --git a/tests/data/acpi/q35/DSDT.mmio64 b/tests/data/acpi/q35/DSDT.mmio64
index a77aa37ca0bb407abbef134e8dce4461070856a2..0491761dc7132460b08b443579f0d4cad3fa3163 100644
GIT binary patch
delta 60
zcmX@;b<B&)CD<jzO_hOxamhxmITFGm@$Lbx9Pu8WF1(J;0iFg124<U=NThRYj#hle
O%qCzDlAf%fXaxWd&Jgwh

delta 55
zcmX@+b<m5;CD<jzQI&y#@ykZ8ITD+9OQdp$`m@Bl2e@*?dw9C=Iywh<8W<RuF-+!B
Lwc0GN_?#I4)UFS_

diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
index 43469e6c89813025b902534ed61d39ad940ff7bb..485f571afd35cbd2044baeb7027ef077ba9a133d 100644
GIT binary patch
delta 60
zcmbR4GRK9>CD<iIMu~xeF>xc;90_5Oc=rHTj(87G7hXr_08ax01GCLbB=}f1Gs%jw
OvI*FOq$eMju>t_l9uGeN

delta 55
zcmbQ^GTnvCCD<iIT#12!apOj=ITD+9OYpFW`m@Bl2e@*?dw9C=Iywh<8W<RuF-(4>
LXtnv6j2J5bsWcBX

diff --git a/tests/data/acpi/q35/DSDT.nohpet b/tests/data/acpi/q35/DSDT.nohpet
index e17b252b03b290ba39601afffbee66159a57bfb1..9c2ec9f2c96f6bdf536c28559fd804523134cf2c 100644
GIT binary patch
delta 61
zcmX@<aL$3tCD<jzPl17f@xVqdJ_!+#c=rHTj(87G7hXr_08ax012cxr;u5?pn@eP_
PGP4QTgXAY$%2)va^~Ddc

delta 55
zcmX@-aMFRxCD<jzQ-OhjQD7q%pTuTe2_6<vf0lUn09TH94^J0fN9O=f0|NsyhRGrd
LR+}wkt}z1ud(I7H

diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.numamem
index ade716519de8bd626b3cddee686f55757bb4eb35..2302de88e93a22118889cd33a8c63811925cff02 100644
GIT binary patch
delta 60
zcmccX_{fpVCD<k8kpcq)<HC(xb0maC;@tyWIpRG$U3eXx13V2349qq!kq}|o%prS~
OnN7eRBt7}8j1>SZBN3SZ

delta 55
zcmaFlc-N83CD<k8t^xxC<HwC$b0jwJmJnhQ^=FB94{+s(_waP#b#xB!G%zqQW0<@`
L!D{mvnQP1d^L-Ib

diff --git a/tests/data/acpi/q35/DSDT.pvpanic-isa b/tests/data/acpi/q35/DSDT.pvpanic-isa
index b6740b1ec2f4e01bdbdc34bc8bf0a2c36f134671..5e4b51d33b8bb88ca2610254e6306c16e5b5b0db 100644
GIT binary patch
delta 60
zcmdnvbkK>*CD<jzQIUaxan?qzITFGm@$Lbx9Pu8WF1(J;0iFg124<U=Nbs?2W|FmH
OVH2<iNl!j5V+8>7gb)S*

delta 55
zcmX@;w8x3dCD<jzMv;Mm@zqAIITD+9OYpFW`m@Bl2e@*?dw9C=Iywh<8W<RuF-&Gx
LwAy@3#+n5H!3Pf@

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm12 b/tests/data/acpi/q35/DSDT.tis.tpm12
index 5bc095351fd009fb2171daaa4f824c5cc9f36819..1723fca4464383694f806f93331d008e84b93fef 100644
GIT binary patch
delta 60
zcmdn$w#$vnCD<jzN|}LyQGFxV90_5Oc=rHTj(87G7hXr_08ax01GCLbB=}f1GszmW
Ou?g6Nq$eMju>t_xEDwVK

delta 54
zcmdnxw$+WxCD<jzRGEQ+v3w)f9Er`lC3sjw{aNDO16(=cJv?1_9i0O_4Gav-7$zxO
KZ9XPr!Uh1Jz7CfF

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm2 b/tests/data/acpi/q35/DSDT.tis.tpm2
index 47417f47f7e25576f31207cb0b752b8c086a4480..1a0d6284da01addd0393b8aad96873398411895e 100644
GIT binary patch
delta 60
zcmX@_cEyd$CD<h-M45qs@$g2jITFGm@$Lbx9Pu8WF1(J;0iFg124<U=Nbs?2W|H+~
OV-v6kNl!j5V+8;TzYvE2

delta 55
zcmccOcHWK4CD<jzUzve{QFtTQ9Er`lC3sjw{aNDO16(=cJv?1_9i0O_4Gav-7$!?8
LTWvlj<HrU7tkw>;

diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
index 574b8a0094c556cd8555b7a4e1b92b2d5f64750a..6927d1cc96565f0e1e4c7f19fd709635873db912 100644
GIT binary patch
delta 60
zcmZ4Ewb6^qCD<jzP?dp!amq%nITFGm@$Lbx9Pu8WF1(J;0iFg124<U=Nbs?2W|Gz7
OU=y$hNl!j5V+8=~s1Mix

delta 55
zcmdn!wZ@CfCD<iIN0otr@ySN6ITD+9OYpFW`m@Bl2e@*?dw9C=Iywh<8W<RuF--oh
LVzv30j5Y@V!R`;`

diff --git a/tests/data/acpi/q35/DSDT.xapic b/tests/data/acpi/q35/DSDT.xapic
index 74381116ad7f01a860fee9201df38d1ea24a0be6..4a8a4af625edb1fd01a1404e33f34e85c1a252f3 100644
GIT binary patch
delta 62
zcmdlrooWAcCN7s?myrG43=E8GH*(F95EhAd4{+s(_waP#b#xB!G%zqQ+q^{LW8UVc
R?N^!E1nfc5lUKD{0RVxr6)gY&

delta 57
zcmV-90LK5nmjb$%0t!S^L{z$q0005~u?n0Rv%47YZWT`iUq?_y2wzA^L=8bhP)RT_
PFg5^_g^N0~sfX4BNAVNl

-- 
2.31.1


