Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B736A3FED5F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 14:02:47 +0200 (CEST)
Received: from localhost ([::1]:33920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLlQb-0003Ep-O7
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 08:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLl0o-0000L3-7j
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:36:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLl0k-0004zH-BW
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:36:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630582561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0VEDTQVPzoAZQuAc3dFyTABchh1XbonOFNxrJOIhJ6g=;
 b=CFjivTJuX0Vp76kn0sfTniprvniDmKa1tWIpVbGk/Gr0jaM31m1Qp5zkcCf//LNGEEFwsb
 aVdSs3n0oLN+KnU+4I1sh3kYZ0TudDiIxgJavxo4W/2z2IeCBZMVJEQMvvmlLnSnHylJEb
 q+PyGJ0fBkUvpcIX02/leOj2rAdOwnc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-5uYeLNcRN1iEP3AVzXUqgA-1; Thu, 02 Sep 2021 07:36:00 -0400
X-MC-Unique: 5uYeLNcRN1iEP3AVzXUqgA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AB016F309
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 11:35:59 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FF426A8F8;
 Thu,  2 Sep 2021 11:35:58 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/15] tests: acpi: update expected tables blobs
Date: Thu,  2 Sep 2021 07:35:41 -0400
Message-Id: <20210902113551.461632-6-imammedo@redhat.com>
In-Reply-To: <20210902113551.461632-1-imammedo@redhat.com>
References: <20210902113551.461632-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update adds CPU entries to MADT/SRAT/FACP and DSDT to cover 288 CPUs.
Notable changes are that CPUs with APIC ID 255 and higher
use 'Processor Local x2APIC Affinity' structure in SRAT and
"Device" element in DSDT.

FACP:
-                 Use APIC Cluster Model (V4) : 0
+                 Use APIC Cluster Model (V4) : 1

SRAT:
...
+[1010h 4112   1]                Subtable Type : 00 [Processor Local APIC/SAPIC Affinity]
+[1011h 4113   1]                       Length : 10
+
+[1012h 4114   1]      Proximity Domain Low(8) : 00
+[1013h 4115   1]                      Apic ID : FE
+[1014h 4116   4]        Flags (decoded below) : 00000001
+                                     Enabled : 1
+[1018h 4120   1]              Local Sapic EID : 00
+[1019h 4121   3]    Proximity Domain High(24) : 000000
+[101Ch 4124   4]                 Clock Domain : 00000000
+
+[1020h 4128   1]                Subtable Type : 02 [Processor Local x2APIC Affinity]
+[1021h 4129   1]                       Length : 18
+
+[1022h 4130   2]                    Reserved1 : 0000
+[1024h 4132   4]             Proximity Domain : 00000001
+[1028h 4136   4]                      Apic ID : 000000FF
+[102Ch 4140   4]        Flags (decoded below) : 00000001
+                                     Enabled : 1
+[1030h 4144   4]                 Clock Domain : 00000000
+[1034h 4148   4]                    Reserved2 : 00000000

...

+[1320h 4896   1]                Subtable Type : 02 [Processor Local x2APIC Affinity]
+[1321h 4897   1]                       Length : 18
+
+[1322h 4898   2]                    Reserved1 : 0000
+[1324h 4900   4]             Proximity Domain : 00000001
+[1328h 4904   4]                      Apic ID : 0000011F
+[132Ch 4908   4]        Flags (decoded below) : 00000001
+                                     Enabled : 1
+[1330h 4912   4]                 Clock Domain : 00000000
+[1334h 4916   4]                    Reserved2 : 00000000

DSDT:

...
+            Processor (C0FE, 0xFE, 0x00000000, 0x00)
+            {
...
+            }
+
+            Device (C0FF)
+            {
+                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
+                Name (_UID, 0xFF)  // _UID: Unique ID
...
+            }

+            Device (C11F)
+            {
+                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
+                Name (_UID, 0x011F)  // _UID: Unique ID
...
+            }

APIC:
+[034h 0052   1]                Subtable Type : 00 [Processor Local APIC]
+[035h 0053   1]                       Length : 08
+[036h 0054   1]                 Processor ID : 01
+[037h 0055   1]                Local Apic ID : 01
+[038h 0056   4]        Flags (decoded below) : 00000000
+                           Processor Enabled : 0

...

+[81Ch 2076   1]                Subtable Type : 00 [Processor Local APIC]
+[81Dh 2077   1]                       Length : 08
+[81Eh 2078   1]                 Processor ID : FE
+[81Fh 2079   1]                Local Apic ID : FE
+[820h 2080   4]        Flags (decoded below) : 00000000
+                           Processor Enabled : 0
+
+[824h 2084   1]                Subtable Type : 09 [Processor Local x2APIC]
+[825h 2085   1]                       Length : 10
+[826h 2086   2]                     Reserved : 0000
+[828h 2088   4]          Processor x2Apic ID : 000000FF
+[82Ch 2092   4]        Flags (decoded below) : 00000000
+                           Processor Enabled : 0
+[830h 2096   4]                Processor UID : 000000FF

...

+[A24h 2596   1]                Subtable Type : 09 [Processor Local x2APIC]
+[A25h 2597   1]                       Length : 10
+[A26h 2598   2]                     Reserved : 0000
+[A28h 2600   4]          Processor x2Apic ID : 0000011F
+[A2Ch 2604   4]        Flags (decoded below) : 00000000
+                           Processor Enabled : 0
+[A30h 2608   4]                Processor UID : 0000011F
+
+[A34h 2612   1]                Subtable Type : 01 [I/O APIC]
+[A35h 2613   1]                       Length : 0C
+[A36h 2614   1]                  I/O Apic ID : 00
+[A37h 2615   1]                     Reserved : 00
+[A38h 2616   4]                      Address : FEC00000
+[A3Ch 2620   4]                    Interrupt : 00000000
+
+[A40h 2624   1]                Subtable Type : 02 [Interrupt Source Override]
+[A41h 2625   1]                       Length : 0A
+[A42h 2626   1]                          Bus : 00
+[A43h 2627   1]                       Source : 00
+[A44h 2628   4]                    Interrupt : 00000002
+[A48h 2632   2]        Flags (decoded below) : 0000
                                     Polarity : 0
                                 Trigger Mode : 0

-[04Ah 0074   1]                Subtable Type : 02 [Interrupt Source Override]
-[04Bh 0075   1]                       Length : 0A
-[04Ch 0076   1]                          Bus : 00
-[04Dh 0077   1]                       Source : 05
-[04Eh 0078   4]                    Interrupt : 00000005
-[052h 0082   2]        Flags (decoded below) : 000D
+[A4Ah 2634   1]                Subtable Type : 02 [Interrupt Source Override]
+[A4Bh 2635   1]                       Length : 0A
+[A4Ch 2636   1]                          Bus : 00
+[A4Dh 2637   1]                       Source : 05
+[A4Eh 2638   4]                    Interrupt : 00000005
+[A52h 2642   2]        Flags (decoded below) : 000D
                                     Polarity : 1
                                 Trigger Mode : 3

-[054h 0084   1]                Subtable Type : 02 [Interrupt Source Override]
-[055h 0085   1]                       Length : 0A
-[056h 0086   1]                          Bus : 00
-[057h 0087   1]                       Source : 09
-[058h 0088   4]                    Interrupt : 00000009
-[05Ch 0092   2]        Flags (decoded below) : 000D
+[A54h 2644   1]                Subtable Type : 02 [Interrupt Source Override]
+[A55h 2645   1]                       Length : 0A
+[A56h 2646   1]                          Bus : 00
+[A57h 2647   1]                       Source : 09
+[A58h 2648   4]                    Interrupt : 00000009
+[A5Ch 2652   2]        Flags (decoded below) : 000D
                                     Polarity : 1
                                 Trigger Mode : 3

-[05Eh 0094   1]                Subtable Type : 02 [Interrupt Source Override]
-[05Fh 0095   1]                       Length : 0A
-[060h 0096   1]                          Bus : 00
-[061h 0097   1]                       Source : 0A
-[062h 0098   4]                    Interrupt : 0000000A
-[066h 0102   2]        Flags (decoded below) : 000D
+[A5Eh 2654   1]                Subtable Type : 02 [Interrupt Source Override]
+[A5Fh 2655   1]                       Length : 0A
+[A60h 2656   1]                          Bus : 00
+[A61h 2657   1]                       Source : 0A
+[A62h 2658   4]                    Interrupt : 0000000A
+[A66h 2662   2]        Flags (decoded below) : 000D
                                     Polarity : 1
                                 Trigger Mode : 3

-[068h 0104   1]                Subtable Type : 02 [Interrupt Source Override]
-[069h 0105   1]                       Length : 0A
-[06Ah 0106   1]                          Bus : 00
-[06Bh 0107   1]                       Source : 0B
-[06Ch 0108   4]                    Interrupt : 0000000B
-[070h 0112   2]        Flags (decoded below) : 000D
+[A68h 2664   1]                Subtable Type : 02 [Interrupt Source Override]
+[A69h 2665   1]                       Length : 0A
+[A6Ah 2666   1]                          Bus : 00
+[A6Bh 2667   1]                       Source : 0B
+[A6Ch 2668   4]                    Interrupt : 0000000B
+[A70h 2672   2]        Flags (decoded below) : 000D
                                     Polarity : 1
                                 Trigger Mode : 3

-[072h 0114   1]                Subtable Type : 04 [Local APIC NMI]
-[073h 0115   1]                       Length : 06
-[074h 0116   1]                 Processor ID : FF
-[075h 0117   2]        Flags (decoded below) : 0000
+[A72h 2674   1]                Subtable Type : 0A [Local x2APIC NMI]
+[A73h 2675   1]                       Length : 0C
+[A74h 2676   2]        Flags (decoded below) : 0000
                                     Polarity : 0
                                 Trigger Mode : 0
-[077h 0119   1]         Interrupt Input LINT : 01
+[A76h 2678   4]                Processor UID : FFFFFFFF
+[A7Ah 2682   1]         Interrupt Input LINT : 01
+[A7Bh 2683   3]                     Reserved : 000000

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v2:
  - rebase on top of ACPI PCI hotplug changes
---
 tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
 tests/data/acpi/q35/APIC.xapic              | Bin 0 -> 2686 bytes
 tests/data/acpi/q35/DSDT.xapic              | Bin 0 -> 35652 bytes
 tests/data/acpi/q35/FACP.xapic              | Bin 0 -> 244 bytes
 tests/data/acpi/q35/SRAT.xapic              | Bin 0 -> 5080 bytes
 5 files changed, 4 deletions(-)
 create mode 100644 tests/data/acpi/q35/APIC.xapic
 create mode 100644 tests/data/acpi/q35/FACP.xapic

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index c79ff104fb..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.xapic",
-"tests/data/acpi/q35/SRAT.xapic",
-"tests/data/acpi/q35/FACP",
-"tests/data/acpi/q35/APIC",
diff --git a/tests/data/acpi/q35/APIC.xapic b/tests/data/acpi/q35/APIC.xapic
new file mode 100644
index 0000000000000000000000000000000000000000..c1969c35aa12b61d25e0134bbb8d2187ba42d663
GIT binary patch
literal 2686
zcmXZeQ+OOv7=Yo~aI?wAcAeU0vPDuQZHm;k?bNny+g57ZPHkIh=b!JKoA-S43@*-G
z{Lu+<wq%Q@nWAFiZLx`wF-ZxwNPU?!O_RN-X{l+3X8k@%vx&=QJ3C3uY;TVa4(RBJ
zPEP3TjAs1}`ZBw?phf?(w5uz+xuMmH?(XQ}fu5e|<%Qnf=;MRFzUb$N{{9#cfPsM+
z6okRS7!rb^p%@m1;o%q&fsv7zE*+*%j~Oyx#*COL6K2kgS+ZbM6lTqe*|K5w?3g15
z=FEw?a$)Y=m?sbB&5QZ+VgCGBpa2#uh=mGa;lfy?2o^1h#fo9^;#i^tmMn>-N@3~J
zSf&g{M`KJ3+H6?1ES4*W<;!D*3K$!UadB9&B37z|l`CVFDp<8D#>Znq0#>Vr)vIG-
zBG#yZHEUw6T3EX_CM98=I#{<Z)~kp0>tllk*svisYJ`m&W0NM>v?(@ghRvH}ix$|j
zCAMmXty^Q8HrTc;wrhv&+hd0g*s&va>V%y;W0x-2wJUb(hTXekj~>{wC-&-vy?bMy
zKG?S}_UniJ`{RHCn4F9Q2jZYXICwA)8G=KH;;>;jd^nC6fg?xas8Kk2G>#dAW5?pS
zaX5ZFPMClbC*q_@IC(NonSxWN;<RZveLBvVfiq{~tXVjFHqM!YbLZl`c{qPQE?9sI
z7viEtxOg!xS%OQK;<9D9d^xUIfh$+ys#UmpHLh8MYuDnsb+~>#ZrFeuH{zyExOp>f
z*@9cQ;<jzLeLL>hfjf8Nu3fl$H}2Vkd-vkLeYk%=9yovp4`NCR9y)}F595&|c=RY9
zJBG)P<B1b^@+6)*g{M#BnKO9yES@`u=g;GX3wZG&Ub=*rFXNRfc=ak?yN1`V<Bc15
z^CsT9g|~0xojZ8<F5bI`_wVC_2bh|Q4<F*ANBH<LK6!#qpW?G;`20D(c!4ip;;UEq
z`Zd0JgKyvByLb5hJ%0FrA3x%!Px$#We))o5zv8!V`29Qn_<=uv;;&!$`#1jigMa^G
zTAJwMscHX=3n<MXfYNFrFqF14@qj38uUeFLP%TP3surc4REyHiszqtDYEjxnwJ2>-
zElRtp7Ny-(i_%urqO`keQQAYbDDA0Ql=f0BN_(porF~S3(!Q!iX+PDXw7+UmIzY83
z9jIEA4pJ>j2dfsPLsW~>p{hmcFx8@TxN1>4LbYgele0}R{tY{ee%8iO>pNrYvugUz
Y81RgpG2$6JW5}~=7X9ge`jQv^2Net*5C8xG

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/DSDT.xapic b/tests/data/acpi/q35/DSDT.xapic
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..1694d972418436bcf5df0c0184b2c027ebac48af 100644
GIT binary patch
literal 35652
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
aps!fSDJ7>O<*agxN-e6~B9FgCoc{v_03zW4

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/FACP.xapic b/tests/data/acpi/q35/FACP.xapic
new file mode 100644
index 0000000000000000000000000000000000000000..2d3659c9c6753d07c3d48742343cb8e8cc034de7
GIT binary patch
literal 244
zcmZ>BbPo8!z`($~)yd!4BUr&HBEVSz2pEB4AU24G0Y(N+hD|^Y6El!tgNU*~X%LSC
z$X0-fGcm9T0LA|E|L2FOWMD7?GM2WmFfej3F#P0!h{7ddihwku0+2v57svwxMxcSn
X_QAxFX+{NzJ3wNL4G8yu_%Hwf>QN2>

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/SRAT.xapic b/tests/data/acpi/q35/SRAT.xapic
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..097b11d8de2cc7aa8d76154a0082252ba5b735dd 100644
GIT binary patch
literal 5080
zcmaLbd6dm{9LDkI8Ot!XVJu@`t0`@??-_-(kWnd>79~p3riHZ7CW?yoi1w8>?P!mp
zg;WZqXtlP<HlOK?nfE>4<9E(I_rBiW=g;4{=XY;Wj}AQ-=1Fc_*sWuiq85d{x_4|*
zd|6U_j`w(Ny>c^cXPjrzu0X3I?Mk#N)6S+<g?3e1Ikc<Ms!qEGt(vrJ(aNP=n^qm#
zd9>=%u1Bjr?FO{+X*Z<Rh<0OIO=vfz)r@v?S|#^J+5O;_8RxBNx2DyG_I9+kr@aHM
z0@^#$+KF~sT07I;h1RaLccZmC?RK=<)82#Dp0xL(wKwg3XzfdTKU(|KK7iJNv=5?n
zFzrKV9ZI_ctwP!*-yvo9iw?^;Kb%%4+MQ{2p?w6cuC$M&brkKRX&pnm8?ElNkEPXv
zb`h<fw2z~8Jna)`^`d<ut&?c?rgbvyQ)rz^yAQ3?XrE5&4BBVX>P!19T4&SlN9!Eg
z{b>!LeJ-u@Xb+@yKJ7uYE}%V_)`he$qIEItOK4q6dkC$|XkSk23ffoF8cKT@t*dAc
zr*$>$YiM0d`#M@9Xpf|IJ?$H4-AMZ;S~t@kMe7#YqiKzyeJicoXpf~ej`r=e?x1}q
zt?{%c(7KEE-L&qZeJ`#1Xx~rk0oo7Jnn-&Rt%qn&rZt83!?Yfu{V1)+Xg^Nt3EEH6
zdW!bbw4R~;EUo8gPo*`D_Vct}p#37PmuSCCYdY;$XuV4NHCnIJeuLJVwBMpNgZ4~X
zvuM9f>mAzf(t3~f`?Nlw{UNQ7XwRlKhxW&`KA}CA);!vu()x_{=d`|{J)hPB+F#OI
zNc$^VU(^1E)*{;9()y0}Vp>aRFQxT8?H_0@qx~bTpJ*?qwSxA~w0@!eE3MyX|4!=<
z+AC?TqP?2d8ro}Vt)u-Xt-omhP3s@p|I%7d`#)M6Xm6yosl2oD|Np(ex%dG-vzI*6
z7st#VcB02VE74<LA<<)BG0|gRDbZtJIniUEo#?TzlIXFon&`35N%YuPOZ3=RPxRQ=
zNc7m(O!U~-O7z(0CVK2^CwlDbBzo-g5<T{H6Fv6z5<T|y6Fv3~5<T|$i5~lgi5~k#
zi5~mLi5~kVi5~l=i5~lAi5~mr8Qld@%U?NLQU0WCSNz9W$+arGbjV$4-S)c+wtZfD
Fx&<~`p8)^>

literal 0
HcmV?d00001

-- 
2.27.0


