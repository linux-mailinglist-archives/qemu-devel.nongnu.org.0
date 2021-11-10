Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAC644BB43
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 06:34:16 +0100 (CET)
Received: from localhost ([::1]:52452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkgFT-0005NR-5H
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 00:34:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1mkgDW-00037q-Rm
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 00:32:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1mkgDT-0005BW-Cj
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 00:32:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636522330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mPT+72E/l+L3sNmHoqombcXf/Ziryu75FBCqMRZG72A=;
 b=UMGK0kBvsSdD9JCvxJo1XiRE/4EMCKHHjoETjAd1ZzXYrB4YyaAmJ0tkMeIIqdRMOiyZHG
 lbRevdMofrsMUhvUP5zGzcCk82Eag14mM0OyApKgbUv+oSN+OXrQpdAe87BmWW4a5Pl9PQ
 HnpvpJ5jZmAlygalCcGRBeoc1t4ryhQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-nFtpEphTNl-LkXJchG8_hw-1; Wed, 10 Nov 2021 00:32:07 -0500
X-MC-Unique: nFtpEphTNl-LkXJchG8_hw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 886A81006AA0;
 Wed, 10 Nov 2021 05:32:06 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6934D5D9CA;
 Wed, 10 Nov 2021 05:32:02 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] bios-tables-test: Update golden binaries
Date: Wed, 10 Nov 2021 06:30:14 +0100
Message-Id: <20211110053014.489591-6-jusual@redhat.com>
In-Reply-To: <20211110053014.489591-1-jusual@redhat.com>
References: <20211110053014.489591-1-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jusual@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The changes are the result of
        'hw/i386/acpi-build: Deny control on PCIe Native Hot-Plug in _OSC'
and listed here:

Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
             {
                 CreateDWordField (Arg3, Zero, CDW1)
                 If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
                 {
                     CreateDWordField (Arg3, 0x04, CDW2)
                     CreateDWordField (Arg3, 0x08, CDW3)
                     Local0 = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
-                    Local0 &= 0x1F
+                    Local0 &= 0x1E

Signed-off-by: Julia Suvorova <jusual@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |  16 ----------------
 tests/data/acpi/q35/DSDT                    | Bin 8289 -> 8289 bytes
 tests/data/acpi/q35/DSDT.acpihmat           | Bin 9614 -> 9614 bytes
 tests/data/acpi/q35/DSDT.bridge             | Bin 11003 -> 11003 bytes
 tests/data/acpi/q35/DSDT.cphp               | Bin 8753 -> 8753 bytes
 tests/data/acpi/q35/DSDT.dimmpxm            | Bin 9943 -> 9943 bytes
 tests/data/acpi/q35/DSDT.dmar               | Bin 0 -> 8289 bytes
 tests/data/acpi/q35/DSDT.ipmibt             | Bin 8364 -> 8364 bytes
 tests/data/acpi/q35/DSDT.ivrs               | Bin 8306 -> 8306 bytes
 tests/data/acpi/q35/DSDT.memhp              | Bin 9648 -> 9648 bytes
 tests/data/acpi/q35/DSDT.mmio64             | Bin 9419 -> 9419 bytes
 tests/data/acpi/q35/DSDT.multi-bridge       | Bin 8583 -> 8583 bytes
 tests/data/acpi/q35/DSDT.nohpet             | Bin 8147 -> 8147 bytes
 tests/data/acpi/q35/DSDT.nosmm              | Bin 0 -> 8289 bytes
 tests/data/acpi/q35/DSDT.numamem            | Bin 8295 -> 8295 bytes
 tests/data/acpi/q35/DSDT.smm-compat         | Bin 0 -> 8289 bytes
 tests/data/acpi/q35/DSDT.smm-compat-nosmm   | Bin 0 -> 8289 bytes
 tests/data/acpi/q35/DSDT.tis.tpm12          | Bin 8894 -> 8894 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 8894 -> 8894 bytes
 tests/data/acpi/q35/DSDT.xapic              | Bin 35652 -> 35652 bytes
 20 files changed, 16 deletions(-)
 create mode 100644 tests/data/acpi/q35/DSDT.dmar
 create mode 100644 tests/data/acpi/q35/DSDT.nosmm
 create mode 100644 tests/data/acpi/q35/DSDT.smm-compat
 create mode 100644 tests/data/acpi/q35/DSDT.smm-compat-nosmm

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 48e5634d4b..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,17 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT",
-"tests/data/acpi/q35/DSDT.tis",
-"tests/data/acpi/q35/DSDT.bridge",
-"tests/data/acpi/q35/DSDT.mmio64",
-"tests/data/acpi/q35/DSDT.ipmibt",
-"tests/data/acpi/q35/DSDT.cphp",
-"tests/data/acpi/q35/DSDT.memhp",
-"tests/data/acpi/q35/DSDT.acpihmat",
-"tests/data/acpi/q35/DSDT.numamem",
-"tests/data/acpi/q35/DSDT.dimmpxm",
-"tests/data/acpi/q35/DSDT.nohpet",
-"tests/data/acpi/q35/DSDT.tis.tpm2",
-"tests/data/acpi/q35/DSDT.tis.tpm12",
-"tests/data/acpi/q35/DSDT.multi-bridge",
-"tests/data/acpi/q35/DSDT.ivrs",
-"tests/data/acpi/q35/DSDT.xapic",
diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
index 281fc82c03b2562d2e6b7caec0d817b034a47138..c1965f6051ef2af81dd8412abe169d87845bb033 100644
GIT binary patch
delta 24
gcmaFp@X&$FCD<h-QGtPh@z+GID~xg*?>ET<0BnZ{w*UYD

delta 24
gcmaFp@X&$FCD<h-QGtPh@#jRYD~$3R?>ET<0BnK?w*UYD

diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT.acpihmat
index 8c1e05a11a328ec1cc6f86e36e52c28f41f9744e..f24d4874bff8d327a165ed7c36de507aea114edd 100644
GIT binary patch
delta 24
fcmeD4?(^ny33dtTQ)OUa+&+=(3ZvY{`|DKzU@Hhn

delta 24
fcmeD4?(^ny33dtTQ)OUa+%}Qx3ZwkS`|DKzU?vDi

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index 6f1464b6c712d7f33cb4b891b7ce76fe228f44c9..424d51bd1cb39ea73501ef7d0044ee52cec5bdac 100644
GIT binary patch
delta 24
gcmewz`a6`%CD<k8w-y5fBg;gtD~xg*@5^Wb0CWThXaE2J

delta 24
gcmewz`a6`%CD<k8w-y5fBlASAD~$3R@5^Wb0CWEcXaE2J

diff --git a/tests/data/acpi/q35/DSDT.cphp b/tests/data/acpi/q35/DSDT.cphp
index f8337ff5191a37a47dcf7c09a6c39c4e704a15bf..f1275606f68eeba54bfb11e63d818420385a62b9 100644
GIT binary patch
delta 24
fcmdn!veAXhCD<jzP>F$oF>WH)6-K#@_k$DxTWtqt

delta 24
fcmdn!veAXhCD<jzP>F$oF?J%?6-N1u_k$DxTWAMo

diff --git a/tests/data/acpi/q35/DSDT.dimmpxm b/tests/data/acpi/q35/DSDT.dimmpxm
index fe5820d93d057ef09a001662369b15afbc5b87e2..76e451e829ec4c245315f7eed8731aa1be45a747 100644
GIT binary patch
delta 24
gcmccad)=4ICD<k8x*7umqsK(9D~xg*@BdH*0B$o00{{R3

delta 24
gcmccad)=4ICD<k8x*7umqx(dzD~$3R@BdH*0B$Y`0{{R3

diff --git a/tests/data/acpi/q35/DSDT.dmar b/tests/data/acpi/q35/DSDT.dmar
new file mode 100644
index 0000000000000000000000000000000000000000..c1965f6051ef2af81dd8412abe169d87845bb033
GIT binary patch
literal 8289
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
Cro3tZ

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/DSDT.ipmibt b/tests/data/acpi/q35/DSDT.ipmibt
index 631741065860fd5036aa303904dabd1d2839f9c6..6ad2411d0ec95f204cfc64b430c537bce09c35bd 100644
GIT binary patch
delta 24
gcmZ4ExW<voCD<iojRFG$quxZWD~xg*@1K<i0AMf(82|tP

delta 24
gcmZ4ExW<voCD<iojRFG$qwYkmD~$3R@1K<i0AMQ!82|tP

diff --git a/tests/data/acpi/q35/DSDT.ivrs b/tests/data/acpi/q35/DSDT.ivrs
index b0eafe90e5832935557ec5e6802c0147c88f379c..cad26e3f0c27a40a33101155a5282ed9bcb1d441 100644
GIT binary patch
delta 24
gcmez5@X3M8CD<jTNP&TYan?kxD~xg*?@yKo0BrUMn*aa+

delta 24
gcmez5@X3M8CD<jTNP&TYappv>D~$3R?@yKo0BrFHn*aa+

diff --git a/tests/data/acpi/q35/DSDT.memhp b/tests/data/acpi/q35/DSDT.memhp
index 9bc11518fc57687ca789dc70793b48b29a0d74ed..4e9cb3dc6896bb79ccac0fe342a404549f6610e8 100644
GIT binary patch
delta 24
gcmdnsy}_HyCD<iogDL|9<C}?GR~Y3s-oK~<0BV~F1poj5

delta 24
gcmdnsy}_HyCD<iogDL|9<LilBR~Y3t-oK~<0BV*A1poj5

diff --git a/tests/data/acpi/q35/DSDT.mmio64 b/tests/data/acpi/q35/DSDT.mmio64
index 713288a12ef2b70a20b4e8836c036ba4db3a57a8..eb5a1c7171c02d153487bfcecfb7019b7c1bf406 100644
GIT binary patch
delta 24
gcmX@@dD@f9CD<k8v<d?Q<BEw~R~Y3s-hZPE0B$h}CjbBd

delta 24
gcmX@@dD@f9CD<k8v<d?Q<MN4IR~Y3t-hZPE0B$S^CjbBd

diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
index a24c713d22102a1a1583b5c902edffe1694e5cfe..45808eb03b78d07ebbe853f674abfed589d35e26 100644
GIT binary patch
delta 24
fcmZp7Zg=K#33dr-S7cyd?3>7Sg;8$f{S^uTTRaEr

delta 24
fcmZp7Zg=K#33dr-S7cyd?48JUg;9Rv{S^uTTQ>*m

diff --git a/tests/data/acpi/q35/DSDT.nohpet b/tests/data/acpi/q35/DSDT.nohpet
index e8202e6ddfbe96071f32f1ec05758f650569943e..83d1aa00ac5686df479673fb0d7830f946e25dea 100644
GIT binary patch
delta 24
gcmca?f7zbPCD<k8vOEI=<B^G6R~Y3s-v1&80B=4CMF0Q*

delta 24
gcmca?f7zbPCD<k8vOEI=<Kc;1R~Y3t-v1&80B<=7MF0Q*

diff --git a/tests/data/acpi/q35/DSDT.nosmm b/tests/data/acpi/q35/DSDT.nosmm
new file mode 100644
index 0000000000000000000000000000000000000000..c1965f6051ef2af81dd8412abe169d87845bb033
GIT binary patch
literal 8289
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
Cro3tZ

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.numamem
index 151e7cf42953f3f5fe61ff0140ab7b976fe9e5b8..050aaa237b466b0bda8cca5cfaa06f84661d622e 100644
GIT binary patch
delta 24
gcmaFv@Z5pRCD<h-U4emtamhrkD~xg*?{~-p0BWTOc>n+a

delta 24
gcmaFv@Z5pRCD<h-U4emtaq&d1D~$3R?{~-p0BWEJc>n+a

diff --git a/tests/data/acpi/q35/DSDT.smm-compat b/tests/data/acpi/q35/DSDT.smm-compat
new file mode 100644
index 0000000000000000000000000000000000000000..c1965f6051ef2af81dd8412abe169d87845bb033
GIT binary patch
literal 8289
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
Cro3tZ

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/DSDT.smm-compat-nosmm b/tests/data/acpi/q35/DSDT.smm-compat-nosmm
new file mode 100644
index 0000000000000000000000000000000000000000..c1965f6051ef2af81dd8412abe169d87845bb033
GIT binary patch
literal 8289
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
Cro3tZ

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm12 b/tests/data/acpi/q35/DSDT.tis.tpm12
index c96b5277a14ae98174408d690d6e0246bd932623..0ebdf6fbd77967f1ab5d5337b7b1fed314cfaca8 100644
GIT binary patch
delta 24
gcmdnzy3du%CD<iopArKDqxwXyD~xg*@84Gh0A(f!W&i*H

delta 24
gcmdnzy3du%CD<iopArKDquNBSD~$3R@84Gh0A(QvW&i*H

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm2 b/tests/data/acpi/q35/DSDT.tis.tpm2
index c92d4d29c79352a60974ea9f665d0b9a410a4bac..dcbb7f0af377425db53130e8ba1c62c09c22e006 100644
GIT binary patch
delta 24
gcmdnzy3du%CD<iopArKD<D-dOR~Y3s-oLL10Bm##ApigX

delta 24
gcmdnzy3du%CD<iopArKD<HLzuR~Y3t-oLL10BmmwApigX

diff --git a/tests/data/acpi/q35/DSDT.xapic b/tests/data/acpi/q35/DSDT.xapic
index 119fc90f1f8a7b6934df6fd95609446e627ce15d..17552ce363ae81985f69f9ae85837a1540b79ae0 100644
GIT binary patch
delta 26
icmX>yjp@iVCN7s?mk^h31_s6r6S=N1%5A)#+64f6_X&Rh

delta 26
icmX>yjp@iVCN7s?mk^h31_s9U6S=N1%5S`%+64f6@(F(c

-- 
2.31.1


