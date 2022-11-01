Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC136144EB
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 08:12:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oplR0-00056S-DA; Tue, 01 Nov 2022 03:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1oplQx-00054X-PU
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 03:11:39 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1oplQs-0001sQ-HW
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 03:11:38 -0400
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N1h5F12bLzHvX7;
 Tue,  1 Nov 2022 15:11:13 +0800 (CST)
Received: from localhost.localdomain (10.67.164.66) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 15:11:30 +0800
To: <mst@redhat.com>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
 <ani@anisinha.ca>, <eduardo@habkost.net>, <marcel.apfelbaum@gmail.com>,
 <f4bug@amsat.org>, <wangyanan55@huawei.com>, <qemu-devel@nongnu.org>
CC: <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>,
 <yangyicong@hisilicon.com>, <prime.zeng@huawei.com>,
 <hesham.almatary@huawei.com>, <ionela.voinescu@arm.com>,
 <darren@os.amperecomputing.com>
Subject: [PATCH v4 6/6] tests: acpi: aarch64: Add *.topology tables
Date: Tue, 1 Nov 2022 15:10:48 +0800
Message-ID: <20221101071048.29553-7-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20221101071048.29553-1-yangyicong@huawei.com>
References: <20221101071048.29553-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.164.66]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=yangyicong@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Yicong Yang <yangyicong@huawei.com>
From:  Yicong Yang via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Yicong Yang <yangyicong@hisilicon.com>

Add *.topology tables for the aarch64's topology test and empty
bios-tables-test-allowed-diff.h

The disassembled differences between actual and expected
PPTT (the table which we actually care about):

 +/*
 + * Intel ACPI Component Architecture
 + * AML/ASL+ Disassembler version 20180105 (64-bit version)
 + * Copyright (c) 2000 - 2018 Intel Corporation
 + *
 + * Disassembly of /tmp/aml-WUN4U1, Tue Nov  1 09:51:52 2022
 + *
 + * ACPI Data Table [PPTT]
 + *
 + * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 + */
 +
 +[000h 0000   4]                    Signature : "PPTT"    [Processor Properties Topology Table]
 +[004h 0004   4]                 Table Length : 00000150
 +[008h 0008   1]                     Revision : 02
 +[009h 0009   1]                     Checksum : 7C
 +[00Ah 0010   6]                       Oem ID : "BOCHS "
 +[010h 0016   8]                 Oem Table ID : "BXPC    "
 +[018h 0024   4]                 Oem Revision : 00000001
 +[01Ch 0028   4]              Asl Compiler ID : "BXPC"
 +[020h 0032   4]        Asl Compiler Revision : 00000001
 +
 +
 +[024h 0036   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[025h 0037   1]                       Length : 14
 +[026h 0038   2]                     Reserved : 0000
 +[028h 0040   4]        Flags (decoded below) : 00000001
 +                            Physical package : 1
 +                     ACPI Processor ID valid : 0
 +[02Ch 0044   4]                       Parent : 00000000
 +[030h 0048   4]            ACPI Processor ID : 00000000
 +[034h 0052   4]      Private Resource Number : 00000000
 +
 +[038h 0056   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[039h 0057   1]                       Length : 14
 +[03Ah 0058   2]                     Reserved : 0000
 +[03Ch 0060   4]        Flags (decoded below) : 00000000
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 0
 +[040h 0064   4]                       Parent : 00000024
 +[044h 0068   4]            ACPI Processor ID : 00000000
 +[048h 0072   4]      Private Resource Number : 00000000
 +
 +[04Ch 0076   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[04Dh 0077   1]                       Length : 14
 +[04Eh 0078   2]                     Reserved : 0000
 +[050h 0080   4]        Flags (decoded below) : 00000000
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 0
 +[054h 0084   4]                       Parent : 00000038
 +[058h 0088   4]            ACPI Processor ID : 00000000
 +[05Ch 0092   4]      Private Resource Number : 00000000
 +
 +[060h 0096   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[061h 0097   1]                       Length : 14
 +[062h 0098   2]                     Reserved : 0000
 +[064h 0100   4]        Flags (decoded below) : 0000000E
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 1
 +[068h 0104   4]                       Parent : 0000004C
 +[06Ch 0108   4]            ACPI Processor ID : 00000000
 +[070h 0112   4]      Private Resource Number : 00000000
 +
 +[074h 0116   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[075h 0117   1]                       Length : 14
 +[076h 0118   2]                     Reserved : 0000
 +[078h 0120   4]        Flags (decoded below) : 0000000E
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 1
 +[07Ch 0124   4]                       Parent : 0000004C
 +[080h 0128   4]            ACPI Processor ID : 00000001
 +[084h 0132   4]      Private Resource Number : 00000000
 +
 +[088h 0136   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[089h 0137   1]                       Length : 14
 +[08Ah 0138   2]                     Reserved : 0000
 +[08Ch 0140   4]        Flags (decoded below) : 00000000
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 0
 +[090h 0144   4]                       Parent : 00000038
 +[094h 0148   4]            ACPI Processor ID : 00000001
 +[098h 0152   4]      Private Resource Number : 00000000
 +
 +[09Ch 0156   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[09Dh 0157   1]                       Length : 14
 +[09Eh 0158   2]                     Reserved : 0000
 +[0A0h 0160   4]        Flags (decoded below) : 0000000E
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 1
 +[0A4h 0164   4]                       Parent : 00000088
 +[0A8h 0168   4]            ACPI Processor ID : 00000002
 +[0ACh 0172   4]      Private Resource Number : 00000000
 +
 +[0B0h 0176   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[0B1h 0177   1]                       Length : 14
 +[0B2h 0178   2]                     Reserved : 0000
 +[0B4h 0180   4]        Flags (decoded below) : 0000000E
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 1
 +[0B8h 0184   4]                       Parent : 00000088
 +[0BCh 0188   4]            ACPI Processor ID : 00000003
 +[0C0h 0192   4]      Private Resource Number : 00000000
 +
 +[0C4h 0196   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[0C5h 0197   1]                       Length : 14
 +[0C6h 0198   2]                     Reserved : 0000
 +[0C8h 0200   4]        Flags (decoded below) : 00000000
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 0
 +[0CCh 0204   4]                       Parent : 00000024
 +[0D0h 0208   4]            ACPI Processor ID : 00000001
 +[0D4h 0212   4]      Private Resource Number : 00000000
 +
 +[0D8h 0216   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[0D9h 0217   1]                       Length : 14
 +[0DAh 0218   2]                     Reserved : 0000
 +[0DCh 0220   4]        Flags (decoded below) : 00000000
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 0
 +[0E0h 0224   4]                       Parent : 000000C4
 +[0E4h 0228   4]            ACPI Processor ID : 00000000
 +[0E8h 0232   4]      Private Resource Number : 00000000
 +
 +[0ECh 0236   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[0EDh 0237   1]                       Length : 14
 +[0EEh 0238   2]                     Reserved : 0000
 +[0F0h 0240   4]        Flags (decoded below) : 0000000E
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 1
 +[0F4h 0244   4]                       Parent : 000000D8
 +[0F8h 0248   4]            ACPI Processor ID : 00000004
 +[0FCh 0252   4]      Private Resource Number : 00000000
 +
 +[100h 0256   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[101h 0257   1]                       Length : 14
 +[102h 0258   2]                     Reserved : 0000
 +[104h 0260   4]        Flags (decoded below) : 0000000E
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 1
 +[108h 0264   4]                       Parent : 000000D8
 +[10Ch 0268   4]            ACPI Processor ID : 00000005
 +[110h 0272   4]      Private Resource Number : 00000000
 +
 +[114h 0276   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[115h 0277   1]                       Length : 14
 +[116h 0278   2]                     Reserved : 0000
 +[118h 0280   4]        Flags (decoded below) : 00000000
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 0
 +[11Ch 0284   4]                       Parent : 000000C4
 +[120h 0288   4]            ACPI Processor ID : 00000001
 +[124h 0292   4]      Private Resource Number : 00000000
 +
 +[128h 0296   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[129h 0297   1]                       Length : 14
 +[12Ah 0298   2]                     Reserved : 0000
 +[12Ch 0300   4]        Flags (decoded below) : 0000000E
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 1
 +[130h 0304   4]                       Parent : 00000114
 +[134h 0308   4]            ACPI Processor ID : 00000006
 +[138h 0312   4]      Private Resource Number : 00000000
 +
 +[13Ch 0316   1]                Subtable Type : 00 [Processor Hierarchy Node]
 +[13Dh 0317   1]                       Length : 14
 +[13Eh 0318   2]                     Reserved : 0000
 +[140h 0320   4]        Flags (decoded below) : 0000000E
 +                            Physical package : 0
 +                     ACPI Processor ID valid : 1
 +[144h 0324   4]                       Parent : 00000114
 +[148h 0328   4]            ACPI Processor ID : 00000007
 +[14Ch 0332   4]      Private Resource Number : 00000000
 +
 +Raw Table Data: Length 336 (0x150)
 +
 +  0000: 50 50 54 54 50 01 00 00 02 7C 42 4F 43 48 53 20  // PPTTP....|BOCHS
 +  0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
 +  0020: 01 00 00 00 00 14 00 00 01 00 00 00 00 00 00 00  // ................
 +  0030: 00 00 00 00 00 00 00 00 00 14 00 00 00 00 00 00  // ................
 +  0040: 24 00 00 00 00 00 00 00 00 00 00 00 00 14 00 00  // $...............
 +  0050: 00 00 00 00 38 00 00 00 00 00 00 00 00 00 00 00  // ....8...........
 +  0060: 00 14 00 00 0E 00 00 00 4C 00 00 00 00 00 00 00  // ........L.......
 +  0070: 00 00 00 00 00 14 00 00 0E 00 00 00 4C 00 00 00  // ............L...
 +  0080: 01 00 00 00 00 00 00 00 00 14 00 00 00 00 00 00  // ................
 +  0090: 38 00 00 00 01 00 00 00 00 00 00 00 00 14 00 00  // 8...............
 +  00A0: 0E 00 00 00 88 00 00 00 02 00 00 00 00 00 00 00  // ................
 +  00B0: 00 14 00 00 0E 00 00 00 88 00 00 00 03 00 00 00  // ................
 +  00C0: 00 00 00 00 00 14 00 00 00 00 00 00 24 00 00 00  // ............$...
 +  00D0: 01 00 00 00 00 00 00 00 00 14 00 00 00 00 00 00  // ................
 +  00E0: C4 00 00 00 00 00 00 00 00 00 00 00 00 14 00 00  // ................
 +  00F0: 0E 00 00 00 D8 00 00 00 04 00 00 00 00 00 00 00  // ................
 +  0100: 00 14 00 00 0E 00 00 00 D8 00 00 00 05 00 00 00  // ................
 +  0110: 00 00 00 00 00 14 00 00 00 00 00 00 C4 00 00 00  // ................
 +  0120: 01 00 00 00 00 00 00 00 00 14 00 00 0E 00 00 00  // ................
 +  0130: 14 01 00 00 06 00 00 00 00 00 00 00 00 14 00 00  // ................
 +  0140: 0E 00 00 00 14 01 00 00 07 00 00 00 00 00 00 00  // ................

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 tests/data/acpi/virt/APIC.topology          | Bin 0 -> 700 bytes
 tests/data/acpi/virt/DSDT.topology          | Bin 0 -> 5398 bytes
 tests/data/acpi/virt/PPTT.topology          | Bin 0 -> 336 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   3 ---
 4 files changed, 3 deletions(-)

diff --git a/tests/data/acpi/virt/APIC.topology b/tests/data/acpi/virt/APIC.topology
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..558a1856981531b0e18e6d4aa12569cd80aa0015 100644
GIT binary patch
literal 700
zcmbV~OA5k35JW4P_<@+UE_0Na*(d}Y$i~BZHNk$8j<`%06xH*o$1LVr?)g<q={-L3
zZSKcs$-SwP#7w$Q7oT+W$*O86UrB!d{M)jrTJASXrnUcf%@(j=xH;d-@;AWZec1Q5
zvgjgM$r49dbP=q^5=U8d5v-jhj<V<?SbIwxWzj{j4wg8|qKmrq-__rL18-2#2XL1S
A0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/DSDT.topology b/tests/data/acpi/virt/DSDT.topology
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..501314c91be01d927fd125e0c72e919fdd85592e 100644
GIT binary patch
literal 5398
zcmZvg%WoT16o>EFlh__VVmr?J;S@^6vl`n?la>}@kDbINPK+mQkX*@?5QvgZB`Ty+
zA*ERq=#EBW9i&M78%V6!v17rS4gUZ;%(-)ClHYO9NEy$Wd(SuX%^YWrr|CEMr>B&P
zoiz5mZGWZlN!MGU#ZpS?ZT*>lwrAZR_>DpTc;0heH#yjDH?wuG+ooVmB?ougO=ZR^
z(wNmhUZA|HH0H$2U`-s1o55@1plt?M#lbN%cwHPEH-l^9V4{C~)7$Grmc7ol>sBhE
zWpd#4{KC95^E{>WrAev0Qa_9<%eq9-6S@lPn+M*e0e{@;+@&j2rCfi%?xZQ%t6K(9
zaB>C_OU;Ivb^Bf~y0|;Ly*)}@y*TW7=EcDs6$=mUA|kv89H9^U3L>U15S0+o&}R|e
zDvoes62k^Y6&c|j9bv>J#yBu)$Ov!z2*Z{bNnl(<Mpz#sj4_Gf0Am#yVHu4u#wA7u
z7}t>zR@(?8Au)2mSVP9TDXbAjQexzRv5t%zA|oX+iom!5j7s?B7&#9|Vw8Y!6B%Ne
z@-InL>eIk@9~p9;W~B3&1;#C8$aR{P81ulmjSRU?a}r|_7#|=*uG0yLu?&n4ks;S<
zUSg~OV*?p-ofag<Yrv=@L$1@J#JCKM1~TM2os<|?fZ+k7D%WXAV!R2ACNktYost-D
z1EYluxlX4g#=F4SM21|aGZNz}Ft(5(*XgXpaDlOn47pC{Bt{h&ZDh!GIxjJ<0pkub
z<T_oD7}tUE5i;aDU6dH>z}P{CT&GJC<0ddVz^KV}x-2nn0b>^#a-EhX#s|RI3mLn=
zbiH<X9^KupTX)x~`S7UGGf_=<F|93HHyXR=ZHd3%E0mqZuJTk{eWq5FOMgw;`dU3y
zpVFt&kf8DC_Vy=tzH*L=X*)d}sx80mDzk0Tc10C4dcPB+pc(~n3TmpDwKKz^rF0I>
z3nQIH6LV%P$fK!Is56Nl%%v{L%nc)*8BL`YNFR}=2ALG<%;+fbATv6HxYC)?)VRr{
zsX-=%I+M;QIEo!)MrU9LnbA~gnL^7TlS1?yW1eF{X5=|$GNY5H5Ix74CpD#XKG9Ta
zvCxx3^h_|%1oKRAPYTg9$vl(HlUg$Lq!2w*%#+$_bM=BtlH#5eqNl?=9p*_b9C}iS
zo@wTpW}a#8Ng;Y>m}iE0Qp<;)6ryLAd1jesmU~i&o;l{3W1iF^q9=vuIl(+9nCArd
zq!2yn=ZvZGpo;U%lUhpjq!2v|%(K8e3*3`J^ei&ZBJ-pc6g??K&q?Mv$vh{yCxz%)
zVxA@DNi8dSQiz`PW0|f{^dDl1c}{Up3ej_#c}_D=YH`t%LiC(ro-@pIhI>+op7i4q
z?&mD?q?Q;xDMZgX<~hea=eQ?@=sC|k=b0z9(CA4adM+@}1?IWHJt;)bMdrE4JgMbI
zPYTg<iFqzD&n50jA$l$|&t>LGEjoHqh@NHUS!SMP?n$BX>>syneJjn+H~mod+|Ba`
zahG08<eYTyD&qCvkxtLuSN4_02Y%0|_b~w~>=+n|-V-3|vVb!C&QW*tS%nQQL+SSg
z$a+IynSGoUHoBZe?+uW3MPQkIA*+-hc#XO`qyM2Qzd<W=Ikpqd<L|R7M*q%f8S0hw
z9eukp)LjHiemMM3|16_rc$G%14D|qJp{9kFA&pw<#XFD_3?Jz+y#&$4O7DN7lK$Op
zS0%mu-i|75rUrYyXTLa9Uh|-Gx}7-rqA=;?`<=gP|CSdwemZzu|Mm8tpT9VCY?@G|
z&m?`;9_c`H^hQmip6ZoT*6Y*!%ae!Jw=_}-W>-$9U!Fws%<jA%e55Dq{bz?i=gfY6
zkjmL%>AgYI@7Sl8%-Q_0_WR%d>NlMqXa4ET{pNK}Qzu`lvqIdm^om||b?jctXVs`*
zbm^L_IqoahC%6Z6b;=tTmqu^V^Txb4Yb5Sp)$bU$TFrqear1()q8m?o!I-6ikZ<Zd
zZoOqvk6JzIOX-d#Q;yw#me!%y@>@GArKLgZ-hS$l4j!E5Po6$-bien!d(dk*NB!eD
My@B5+&m2qr5A>`*Jpcdz

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/PPTT.topology b/tests/data/acpi/virt/PPTT.topology
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..3fbcae5ff08aaf16fedf4da45e941661d79c1174 100644
GIT binary patch
literal 336
zcmWFt2nh*bWME*baq@Te2v%^42yj*a0-z8Bhz+6{L>L&rG>8oYKrs+dflv?<DrSKu
z#s}p4;1GkGi=-D>45YUMh?!vef$Csl%t&G&Cde(wdO>1GKm-gx_1*yTS+Iz)B8h>R
aAic=uf$S9l3b27BK>%tVNQ@mK!T<mOd=3Es

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 90f53f9c1d..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,4 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/APIC.topology",
-"tests/data/acpi/virt/DSDT.topology",
-"tests/data/acpi/virt/PPTT.topology",
-- 
2.24.0


