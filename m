Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A544A3A9F0B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 17:27:17 +0200 (CEST)
Received: from localhost ([::1]:52456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltXRk-00051x-Oe
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 11:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ltXQJ-0002pT-US
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:25:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ltXQE-0007g2-Qw
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:25:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623857142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SswVankWBSCpdtJlx8ozpiUo5AAPAAdJN3MyGoiOpQE=;
 b=icpt0tYImw3MTFbgl8BSOht8vMv6Pdt2Et278KK9MzDTuvCOInv/f4hJt/v/rvPPhe1HYH
 NFjY0K32hk8ARw1QwJyINwmPUxAmquOuCncZEPB4J8m1YVcHkKwtsECdbs+eQWBEc3UR0F
 5JvmwknflsWg/QqxhTqznpBe7axnl0o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-NvU2F_kDPLa1dBONM9b-Aw-1; Wed, 16 Jun 2021 11:25:10 -0400
X-MC-Unique: NvU2F_kDPLa1dBONM9b-Aw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFF59100C679
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 15:25:09 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EAC95C1C5;
 Wed, 16 Jun 2021 15:25:08 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 3/3] tests: acpi: update expected tables blobs
Date: Wed, 16 Jun 2021 11:24:55 -0400
Message-Id: <20210616152455.1270264-4-imammedo@redhat.com>
In-Reply-To: <20210616152455.1270264-1-imammedo@redhat.com>
References: <20210616152455.1270264-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, philmd@redhat.com, mst@redhat.com
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
 tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
 tests/data/acpi/q35/APIC.numamem            | Bin 0 -> 2686 bytes
 tests/data/acpi/q35/DSDT.numamem            | Bin 7865 -> 35222 bytes
 tests/data/acpi/q35/FACP.numamem            | Bin 0 -> 244 bytes
 tests/data/acpi/q35/SRAT.numamem            | Bin 224 -> 5080 bytes
 5 files changed, 4 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index c4c132e49b..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.numamem",
-"tests/data/acpi/q35/SRAT.numamem",
-"tests/data/acpi/q35/FACP.numamem",
-"tests/data/acpi/q35/APIC.numamem",
diff --git a/tests/data/acpi/q35/APIC.numamem b/tests/data/acpi/q35/APIC.numamem
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..c1969c35aa12b61d25e0134bbb8d2187ba42d663 100644
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

diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.numamem
index e4c4582e7f76b072ab1123c748b89ea33ea1db87..8458aad2484bc48a95f2df37109a4dbfe8cee893 100644
GIT binary patch
literal 35222
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
J<yus5@qf_;rqTca

delta 94
zcmV-k0HObulLEOt3Pe*xRJk4i00Ee>3d$G)ML(0*7_b6EG?R)MBoGlpR7P0>pbC>{
z0ER;_Fffx+C&>XulN=~47eo@1WC3shWN-msZ~$SVObn2dU;&k5qhTllv!;je0adac
Axc~qF

diff --git a/tests/data/acpi/q35/FACP.numamem b/tests/data/acpi/q35/FACP.numamem
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..2d3659c9c6753d07c3d48742343cb8e8cc034de7 100644
GIT binary patch
literal 244
zcmZ>BbPo8!z`($~)yd!4BUr&HBEVSz2pEB4AU24G0Y(N+hD|^Y6El!tgNU*~X%LSC
z$X0-fGcm9T0LA|E|L2FOWMD7?GM2WmFfej3F#P0!h{7ddihwku0+2v57svwxMxcSn
X_QAxFX+{NzJ3wNL4G8yu_%Hwf>QN2>

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/SRAT.numamem b/tests/data/acpi/q35/SRAT.numamem
index 56da58e2699cb13fcd41b5e1667ceeddbdd443b5..097b11d8de2cc7aa8d76154a0082252ba5b735dd 100644
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

delta 22
ecmcbi{(zAyILI;N0RsaA<NAqQW|J+17XScN1_uNH

-- 
2.27.0


