Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C097F5796EB
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 11:58:51 +0200 (CEST)
Received: from localhost ([::1]:49182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDk0A-0002MV-Rc
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 05:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heshamelmatary@gmail.com>)
 id 1oDjvi-00022U-0R; Tue, 19 Jul 2022 05:54:14 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:47032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <heshamelmatary@gmail.com>)
 id 1oDjvf-0004RW-SB; Tue, 19 Jul 2022 05:54:13 -0400
Received: by mail-wr1-x435.google.com with SMTP id z13so1202957wro.13;
 Tue, 19 Jul 2022 02:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rhRalr/dbkkAeqGrNYKhrSBP62nyfUQidKXMTAxo4tw=;
 b=buPjg63cjy5ZozbXgOEYynIMpUvg6GEjM+CTFIYrS8nog0KM4uHd0gXwNLMArsCfXz
 veSqKjMDdW3khHSYDAyHzcI9hUS5rlqOFrTk8DJ2ebZFvvLT6eL0jjKxsH1CUUX3EzXy
 za9VyvlIRgKDUl0M4M+e3Al3QNCcsQxd/nGegpjwYWoMfPrYxknx702vtSwP4j+LV2Ya
 ZNxoO5E1Q6+OLfd6rGC9Buziai7tlkumTeS4hXtebeSd+pmMBWAe5c1cMlEssY7EOYzc
 Y+b7f9HvE7Y8WvWadU0Dw6fM135oIEjKeq+udgm3fZEen15YJlqdNaF7YBToIRKLqYX0
 JTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rhRalr/dbkkAeqGrNYKhrSBP62nyfUQidKXMTAxo4tw=;
 b=xKLEJV0kroVfvJGoXJpxAedIt+phpNmbiqB81CxrEWbRhcbPfbNNP4MKECWmRgiGmH
 OfklzYvG/bdy5UgJsTyXjKopqvYfNIAux4w6nwdo3a9f/+n1AVpa4HzQNvmSuLFF02A2
 TwaBFweZ/JdbAJndw0c2kf3WEinvtZm5t72SAthKwd5pYDWPIItolCcdRD0b52TXGyvB
 GEU4xBOCxeAz/mEsT+e0/xfv/+jIxfEfNV6SniSm8fn02qM5K9gI2KXlPhG3CdGiJy1G
 7BPmjitr2HmsCYZcqsg4GlD1q8Ck8T4h4MFficNFi2w5omY7EcXkL9yhzgV8UahyPkkY
 7iIQ==
X-Gm-Message-State: AJIora/hW8ovwtSzkzqMlXfUSd7btVNlTI375EtJO7rtfCESLdFFeJF3
 dsJCpIgFtswSPsQUiAyZgK8=
X-Google-Smtp-Source: AGRyM1vzF+hYF56FbgvFIHyZhMGmTg0kYB54ken43uHfOMg6zOmBaaD2CRSEzrFLhw4XsnIn6CrAnw==
X-Received: by 2002:adf:ea12:0:b0:21d:7be3:aba8 with SMTP id
 q18-20020adfea12000000b0021d7be3aba8mr25129402wrm.180.1658224449906; 
 Tue, 19 Jul 2022 02:54:09 -0700 (PDT)
Received: from localhost.localdomain ([86.188.218.117])
 by smtp.gmail.com with ESMTPSA id
 h26-20020a05600c2cba00b003a2e5f536b3sm24146005wmc.24.2022.07.19.02.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 02:54:09 -0700 (PDT)
From: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
X-Google-Original-From: Hesham Almatary <hesham.almatary@huawei.com>
To: jonathan.cameron@huawei.com,
	qemu-devel@nongnu.org
Cc: yangyicong@huawei.com, chenxiang66@hisilicon.com, linuxarm@huawei.com,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 wangyanan55@huawei.com, marcel.apfelbaum@gmail.com, eduardo@habkost.net,
 Brice.Goglin@inria.fr, mst@redhat.com, jingqi.liu@intel.com
Subject: [PATCH v2 8/8] tests: virt: Update expected *.acpihmatvirt tables
Date: Tue, 19 Jul 2022 10:49:50 +0100
Message-Id: <20220719094950.1049516-9-hesham.almatary@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719094950.1049516-1-hesham.almatary@huawei.com>
References: <20220719094950.1049516-1-hesham.almatary@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=heshamelmatary@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

* Expected ACPI Data Table [HMAT]
[000h 0000   4]                    Signature : "HMAT"    [Heterogeneous
Memory Attributes Table]
[004h 0004   4]                 Table Length : 00000120
[008h 0008   1]                     Revision : 02
[009h 0009   1]                     Checksum : 4F
[00Ah 0010   6]                       Oem ID : "BOCHS "
[010h 0016   8]                 Oem Table ID : "BXPC    "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "BXPC"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   4]                     Reserved : 00000000

[028h 0040   2]               Structure Type : 0000 [Memory Proximity
Domain Attributes]
[02Ah 0042   2]                     Reserved : 0000
[02Ch 0044   4]                       Length : 00000028
[030h 0048   2]        Flags (decoded below) : 0001
            Processor Proximity Domain Valid : 1
[032h 0050   2]                    Reserved1 : 0000
[034h 0052   4]   Processor Proximity Domain : 00000000
[038h 0056   4]      Memory Proximity Domain : 00000000
[03Ch 0060   4]                    Reserved2 : 00000000
[040h 0064   8]                    Reserved3 : 0000000000000000
[048h 0072   8]                    Reserved4 : 0000000000000000

[050h 0080   2]               Structure Type : 0000 [Memory Proximity
Domain Attributes]
[052h 0082   2]                     Reserved : 0000
[054h 0084   4]                       Length : 00000028
[058h 0088   2]        Flags (decoded below) : 0001
            Processor Proximity Domain Valid : 1
[05Ah 0090   2]                    Reserved1 : 0000
[05Ch 0092   4]   Processor Proximity Domain : 00000001
[060h 0096   4]      Memory Proximity Domain : 00000001
[064h 0100   4]                    Reserved2 : 00000000
[068h 0104   8]                    Reserved3 : 0000000000000000
[070h 0112   8]                    Reserved4 : 0000000000000000

[078h 0120   2]               Structure Type : 0000 [Memory Proximity
Domain Attributes]
[07Ah 0122   2]                     Reserved : 0000
[07Ch 0124   4]                       Length : 00000028
[080h 0128   2]        Flags (decoded below) : 0000
            Processor Proximity Domain Valid : 0
[082h 0130   2]                    Reserved1 : 0000
[084h 0132   4]   Processor Proximity Domain : 00000080
[088h 0136   4]      Memory Proximity Domain : 00000002
[08Ch 0140   4]                    Reserved2 : 00000000
[040h 0064   8]                    Reserved3 : 0000000000000000
[048h 0072   8]                    Reserved4 : 0000000000000000

[050h 0080   2]               Structure Type : 0000 [Memory Proximity
Domain Attributes]
[052h 0082   2]                     Reserved : 0000
[054h 0084   4]                       Length : 00000028
[058h 0088   2]        Flags (decoded below) : 0001
            Processor Proximity Domain Valid : 1
[05Ah 0090   2]                    Reserved1 : 0000
[05Ch 0092   4]   Processor Proximity Domain : 00000001
[060h 0096   4]      Memory Proximity Domain : 00000001
[064h 0100   4]                    Reserved2 : 00000000
[068h 0104   8]                    Reserved3 : 0000000000000000
[070h 0112   8]                    Reserved4 : 0000000000000000

[078h 0120   2]               Structure Type : 0000 [Memory Proximity
Domain Attributes]
[07Ah 0122   2]                     Reserved : 0000
[07Ch 0124   4]                       Length : 00000028
[080h 0128   2]        Flags (decoded below) : 0000
            Processor Proximity Domain Valid : 0
[082h 0130   2]                    Reserved1 : 0000
[084h 0132   4]   Processor Proximity Domain : 00000080
[088h 0136   4]      Memory Proximity Domain : 00000002
[08Ch 0140   4]                    Reserved2 : 00000000
[090h 0144   8]                    Reserved3 : 0000000000000000
[098h 0152   8]                    Reserved4 : 0000000000000000

[0A0h 0160   2]               Structure Type : 0001 [System Locality
Latency and Bandwidth Information]
[0A2h 0162   2]                     Reserved : 0000
[0A4h 0164   4]                       Length : 00000040
[0A8h 0168   1]        Flags (decoded below) : 00
                            Memory Hierarchy : 0
[0A9h 0169   1]                    Data Type : 00
[0AAh 0170   2]                    Reserved1 : 0000
[0ACh 0172   4] Initiator Proximity Domains # : 00000002
[0B0h 0176   4]   Target Proximity Domains # : 00000003
[0B4h 0180   4]                    Reserved2 : 00000000
[0B8h 0184   8]              Entry Base Unit : 0000000000002710
[0C0h 0192   4] Initiator Proximity Domain List : 00000000
[0C4h 0196   4] Initiator Proximity Domain List : 00000001
[0C8h 0200   4] Target Proximity Domain List : 00000000
[0CCh 0204   4] Target Proximity Domain List : 00000001
[0D0h 0208   4] Target Proximity Domain List : 00000002
[0D4h 0212   2]                        Entry : 0001
[0D6h 0214   2]                        Entry : 0002
[0D8h 0216   2]                        Entry : 0003
[0DAh 0218   2]                        Entry : 0002
[0DCh 0220   2]                        Entry : 0001
[0DEh 0222   2]                        Entry : 0003

[0E0h 0224   2]               Structure Type : 0001 [System Locality
Latency and Bandwidth Information]
[0E2h 0226   2]                     Reserved : 0000
[0E4h 0228   4]                       Length : 00000040
[0E8h 0232   1]        Flags (decoded below) : 00
                            Memory Hierarchy : 0
[0E9h 0233   1]                    Data Type : 03
[0EAh 0234   2]                    Reserved1 : 0000
[0ECh 0236   4] Initiator Proximity Domains # : 00000002
[0F0h 0240   4]   Target Proximity Domains # : 00000003
[0F4h 0244   4]                    Reserved2 : 00000000
[0F8h 0248   8]              Entry Base Unit : 0000000000000001
[100h 0256   4] Initiator Proximity Domain List : 00000000
[104h 0260   4] Initiator Proximity Domain List : 00000001
[108h 0264   4] Target Proximity Domain List : 00000000
[10Ch 0268   4] Target Proximity Domain List : 00000001
[110h 0272   4] Target Proximity Domain List : 00000002
[114h 0276   2]                        Entry : 000A
[116h 0278   2]                        Entry : 0005
[118h 0280   2]                        Entry : 0001
[11Ah 0282   2]                        Entry : 0005
[11Ch 0284   2]                        Entry : 000A
[11Eh 0286   2]                        Entry : 0001

Raw Table Data: Length 288 (0x120)

    0000: 48 4D 41 54 20 01 00 00 02 4F 42 4F 43 48 53 20  // HMAT
....OBOCHS
    0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC
....BXPC
    0020: 01 00 00 00 00 00 00 00 00 00 00 00 28 00 00 00  //
............(...
    0030: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  //
................
    0040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  //
................
    0050: 00 00 00 00 28 00 00 00 01 00 00 00 01 00 00 00  //
....(...........
    0060: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  //
................
    0070: 00 00 00 00 00 00 00 00 00 00 00 00 28 00 00 00  //
............(...
    0080: 00 00 00 00 80 00 00 00 02 00 00 00 00 00 00 00  //
................
    0090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  //
................
    00A0: 01 00 00 00 40 00 00 00 00 00 00 00 02 00 00 00  //
....@...........
    00B0: 03 00 00 00 00 00 00 00 10 27 00 00 00 00 00 00  //
.........'......
    00C0: 00 00 00 00 01 00 00 00 00 00 00 00 01 00 00 00  //
................
    00D0: 02 00 00 00 01 00 02 00 03 00 02 00 01 00 03 00  //
................
    00E0: 01 00 00 00 40 00 00 00 00 03 00 00 02 00 00 00  //
....@...........
    00F0: 03 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00  //
................
    0100: 00 00 00 00 01 00 00 00 00 00 00 00 01 00 00 00  //
................
    0110: 02 00 00 00 0A 00 05 00 01 00 05 00 0A 00 01 00  //
................

Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
---
 tests/data/acpi/virt/APIC.acpihmatvirt      | Bin 0 -> 396 bytes
 tests/data/acpi/virt/DSDT.acpihmatvirt      | Bin 0 -> 5282 bytes
 tests/data/acpi/virt/HMAT.acpihmatvirt      | Bin 0 -> 288 bytes
 tests/data/acpi/virt/PPTT.acpihmatvirt      | Bin 0 -> 196 bytes
 tests/data/acpi/virt/SRAT.acpihmatvirt      | Bin 0 -> 240 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   5 -----
 6 files changed, 5 deletions(-)

diff --git a/tests/data/acpi/virt/APIC.acpihmatvirt b/tests/data/acpi/virt/APIC.acpihmatvirt
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..873e12f67c3838351a3ab4b7a43ee76e7730849a 100644
GIT binary patch
literal 396
zcmZ<^@O18BWME)k<K*w`5v<@85#X!<1VAAM5F13p0FMNW#lQh$F##FeJ}@2w15CX*
zLI}uWgsNwO(#&xED9V5wkXaxzU>GD%s#!2MfXo894}@W2q?!fN3j!dsn1M71lWP`8
TF9`6$!;uLb4j}U!7y=joChH0T

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/DSDT.acpihmatvirt b/tests/data/acpi/virt/DSDT.acpihmatvirt
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..aee6ba017cd730948bfa93e91551eb10a6809293 100644
GIT binary patch
literal 5282
zcmZvg%WoT16o>EFlh__VVmr?J;S@^6vl`n?la{u`9y^IkoET5iAUTpNArK{-N>oUt
zLJC<FsKkOsVjWN<{tYBn?AWnj&4zz~9p>D*Gs*9?XQYhh%)RHE`;Cv|<7xWM-JeTJ
z#SR)f-lo6Q_^|6O(Pk;7^s#=;f4^ZJ4E)BRe?05CuA3Zewwu|y*KJd<qLPEXc2k+L
ziZo{RkLM__DvdcYGguP`<Nf2C-cBdFVz0C5x|K?J#pJ;2`Gr|$>S;>pWu{bKsqaRW
zWnH4^F|BBIecxL*;161zJz8y*a{b-9lcr>^ZW%<u$r(f}H63Qw?R&jQbZfh}L#fLb
zmp#wCxVWQY;l*7<g!h9Z^krW{#MA|%5+WLU72$2;2qz{nY+zK85#HSw7;%X)3XB>u
zu9+M80>hRVNnl(<#<Iv5kr)mzmXUE?WQ<CT3^1-EV?|^nBt{MxE67+C8A*we2gWKg
zZitMO#3%ye1~4k&hvS9!#gP~#VBAE8Sf>0#5|#QSFy2LmT&Edn9n-+Lg$%h)vl3$#
z7`Krj*J(~-%md>NGUPfPlNgJ@cn=wJo#rLR5-`?~A=ha^V!Q&3Ix^%sElP~bz-S;t
zuG4XeaRnG2FsgE$mL$gOz-S^vuG0yL@g^`@$dK!FQewOfjCEwlbvh+6t^#8N8FHOY
zOAHqno5+ysbVg!Sfzd{WT&J@V;~FsTB15jzIf-!{81ExPuG4vmu?mbWWXN^8ATe$N
zqXUeZT&If?;}$Tsks;S<Sz_D)#!krC{-x`+!*z7GyKdcGrRKw<rprV%-Nm#vXy0gT
zpSLCcZm&>w=DW&MZS}EQQZD^9>F5jfKz&57N<)IiqubjZ-}>A+DyHr9aHux?wyVss
zMaLCY%;@t@jDl(u#3`t$V%E+KhnCVgG%t*F7ER2Vu^^A8Mxo9melVB1Br`XRbY?V_
zS|EKzni^zMs57Ih#DmOe1#zV_qp5L|NmGMN3Uwx}D7cCpWJW8ngUo0uwM?O9kVzqW
zjxf)WAT#nDF`3cgDMZgv=1EN{ttXmFEf#uGh@J`NnP8p??nxnfCYfiFc~VP;o)n^I
zig{8yZSG!hOH$mELiBW)r^7s{g+osY(KF3F)66r?Jt;)b4D-w|PipzllS1^&GS4jY
z%yLf((KE+9bIg-kMD(N(J;#{m81o$Co)n@d{hTp19#nCjc~VP>o)n^Ifq52~XMuZC
zh@M5}S!ABnf}$sd=sC_j$C>9i_oNU#>E|bSmY65CtmsK0dQLFU3FbM$Jt;)bN#;4p
zJgLP+PYTg<ig`{k&nfOnA$rn}OYod#p41YfCxz%a!#ro0=M49x5Itv^=PdK278*S%
zM9(?qImbNbxF?0^InO-jnJ2Z}=t&`ZE-=pp=DEN<DMZgj=DEl`sYORm3emI7Jj=|p
z%snYIp8eytt=~%X^G$y#d+z%A7jc&!OXQq%@F?Qd;47WJcV9YJ8XfpOpPr2bsIX&T
zD0)tSsLKM%oI6L|)vF2{T!zxm3y}4iz%u7JD{OQ*i=G=G>x#fK=R#H~KkyoLbw>X~
zRep_j=5}l*oJZegRgC_f(>ByQ>l^xXWvIIdw)}ATpZ-}!+wdxlSQ+X8%tlQMZ9^Kh
z)U&rBCm24`V|ojsi=96ISS9_vZdWC}-QJcet)~V%zGpu>R9<txa=Mu~`Lr<Z<olh!
zYX6q!*M8i8RR8t%pPxKCbZnYXrPn0A)*k9WbM!$?qn_xUQ`Y;_{PU9s)>kxA31(ML
zC!e20^UUeI9(<@L>+@%aKjqAMeUZx9Vd<Sg)9=`)m&|JZSo!^LfBDPK4^#hiW`6TJ
zr>T?A)L9{JS$angx;l2R<+Ezk54v>C)g1Sw`xCqeba%>Y7q><q(f5scZq`T~T-DF}
zHd@VrDRJ|#uc8}Idf1nxfsk+NJZ`;VQjc0a>PzVzO{N^X|8-i2UdwN7EtM7qt$Vwv
hhdQ`_nm>7R-_iZv)9!w+;T-jkXY>Jno;-6c^*?7DCOrTE

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/HMAT.acpihmatvirt b/tests/data/acpi/virt/HMAT.acpihmatvirt
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..6494d11b9fff54f8c403ec9e4893fdff72bde9c9 100644
GIT binary patch
literal 288
zcmaJ)F%Ezr5IZ0&Og@24pP{g@7)*5VIX>Ms;S4dxCU-4Odz5uKq7kt*)m-+N&Mij(
zmQa%w6GZ=3|IM0X_Ak#IabYaQ2iTvR&x~t&7@Gj;A7o|>w!;|gr;lRa*AB0!)_xEV
I&r86*0dKzu0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/PPTT.acpihmatvirt b/tests/data/acpi/virt/PPTT.acpihmatvirt
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..710dba5e793cf36df94087666db58af5f8d03684 100644
GIT binary patch
literal 196
zcmWFt2njjDz`(#X&&l7}BUr&HBEVSz2pEB4AU23*5Mf{d(;zks0L4H+1wuhcpcogB
gWr0HsZU&Nh$YLOEC0O)!0L7SK;!rz4V$4u60KkX}0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/SRAT.acpihmatvirt b/tests/data/acpi/virt/SRAT.acpihmatvirt
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..691ef56e34bc84509270db316d908f5979c209bb 100644
GIT binary patch
literal 240
zcmWFzat!&vz`($~%E{l^BUr&HBEVSz2pEB4AU22wVHjW*g0Wzt5D{c`%t9a@6A&ZR
rfLP2(B8(b94g@$rX%;9A*9GD;YQW53aKWz*WFHuKKxqyrjba`E3*rd@

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 4f849715bd..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,6 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/APIC.acpihmatvirt",
-"tests/data/acpi/virt/DSDT.acpihmatvirt",
-"tests/data/acpi/virt/HMAT.acpihmatvirt",
-"tests/data/acpi/virt/PPTT.acpihmatvirt",
-"tests/data/acpi/virt/SRAT.acpihmatvirt",
-- 
2.25.1


