Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F5E56FF96
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 12:58:10 +0200 (CEST)
Received: from localhost ([::1]:39304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAr7B-0006m3-Ne
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 06:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1oAqy9-0000Cj-BR; Mon, 11 Jul 2022 06:48:49 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1oAqy6-0002bO-91; Mon, 11 Jul 2022 06:48:49 -0400
Received: from fraeml715-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LhLBy3l80z67K73;
 Mon, 11 Jul 2022 18:45:46 +0800 (CST)
Received: from lhreml751-chm.china.huawei.com (10.201.108.201) by
 fraeml715-chm.china.huawei.com (10.206.15.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 11 Jul 2022 12:48:44 +0200
Received: from O84201547D.china.huawei.com (10.122.247.218) by
 lhreml751-chm.china.huawei.com (10.201.108.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 11 Jul 2022 11:48:43 +0100
To: <jonathan.cameron@huawei.com>, <qemu-devel@nongnu.org>
CC: <yangyicong@huawei.com>, <chenxiang66@hisilicon.com>,
 <linuxarm@huawei.com>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <imammedo@redhat.com>, <wangyanan55@huawei.com>,
 <marcel.apfelbaum@gmail.com>, <eduardo@habkost.net>, <Brice.Goglin@inria.fr>, 
 <mst@redhat.com>
Subject: [PATCH 8/8] tests: virt: Update expected *.acpihmatvirt tables
Date: Mon, 11 Jul 2022 11:44:36 +0100
Message-ID: <20220711104436.8363-9-hesham.almatary@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711104436.8363-1-hesham.almatary@huawei.com>
References: <20220711104436.8363-1-hesham.almatary@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.218]
X-ClientProxiedBy: lhreml732-chm.china.huawei.com (10.201.108.83) To
 lhreml751-chm.china.huawei.com (10.201.108.201)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=hesham.almatary@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Hesham Almatary <hesham.almatary@huawei.com>
From:  Hesham Almatary via <qemu-devel@nongnu.org>

* Expected ACPI Data Table [HMAT]
[000h 0000   4]                    Signature : "HMAT"    [Heterogeneous Memory Attributes Table]
[004h 0004   4]                 Table Length : 00000120
[008h 0008   1]                     Revision : 02
[009h 0009   1]                     Checksum : 4F
[00Ah 0010   6]                       Oem ID : "BOCHS "
[010h 0016   8]                 Oem Table ID : "BXPC    "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "BXPC"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   4]                     Reserved : 00000000

[028h 0040   2]               Structure Type : 0000 [Memory Proximity Domain Attributes]
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

[050h 0080   2]               Structure Type : 0000 [Memory Proximity Domain Attributes]
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

[078h 0120   2]               Structure Type : 0000 [Memory Proximity Domain Attributes]
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

[050h 0080   2]               Structure Type : 0000 [Memory Proximity Domain Attributes]
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

[078h 0120   2]               Structure Type : 0000 [Memory Proximity Domain Attributes]
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

[0A0h 0160   2]               Structure Type : 0001 [System Locality Latency and Bandwidth Information]
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

[0E0h 0224   2]               Structure Type : 0001 [System Locality Latency and Bandwidth Information]
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

    0000: 48 4D 41 54 20 01 00 00 02 4F 42 4F 43 48 53 20  // HMAT ....OBOCHS
    0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
    0020: 01 00 00 00 00 00 00 00 00 00 00 00 28 00 00 00  // ............(...
    0030: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0050: 00 00 00 00 28 00 00 00 01 00 00 00 01 00 00 00  // ....(...........
    0060: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0070: 00 00 00 00 00 00 00 00 00 00 00 00 28 00 00 00  // ............(...
    0080: 00 00 00 00 80 00 00 00 02 00 00 00 00 00 00 00  // ................
    0090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00A0: 01 00 00 00 40 00 00 00 00 00 00 00 02 00 00 00  // ....@...........
    00B0: 03 00 00 00 00 00 00 00 10 27 00 00 00 00 00 00  // .........'......
    00C0: 00 00 00 00 01 00 00 00 00 00 00 00 01 00 00 00  // ................
    00D0: 02 00 00 00 01 00 02 00 03 00 02 00 01 00 03 00  // ................
    00E0: 01 00 00 00 40 00 00 00 00 03 00 00 02 00 00 00  // ....@...........
    00F0: 03 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00  // ................
    0100: 00 00 00 00 01 00 00 00 00 00 00 00 01 00 00 00  // ................
    0110: 02 00 00 00 0A 00 05 00 01 00 05 00 0A 00 01 00  // ................

* Expected ACPI Data Table [FACP]
[000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
[004h 0004   4]                 Table Length : 0000010C
[008h 0008   1]                     Revision : 05
[009h 0009   1]                     Checksum : 55
[00Ah 0010   6]                       Oem ID : "BOCHS "
[010h 0016   8]                 Oem Table ID : "BXPC    "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "BXPC"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   4]                 FACS Address : 00000000
[028h 0040   4]                 DSDT Address : 00000000
[02Ch 0044   1]                        Model : 00
[02Dh 0045   1]                   PM Profile : 00 [Unspecified]
[02Eh 0046   2]                SCI Interrupt : 0000
[030h 0048   4]             SMI Command Port : 00000000
[034h 0052   1]            ACPI Enable Value : 00
[035h 0053   1]           ACPI Disable Value : 00
[036h 0054   1]               S4BIOS Command : 00
[037h 0055   1]              P-State Control : 00
[038h 0056   4]     PM1A Event Block Address : 00000000
[03Ch 0060   4]     PM1B Event Block Address : 00000000
[040h 0064   4]   PM1A Control Block Address : 00000000
[044h 0068   4]   PM1B Control Block Address : 00000000
[048h 0072   4]    PM2 Control Block Address : 00000000
[04Ch 0076   4]       PM Timer Block Address : 00000000
[050h 0080   4]           GPE0 Block Address : 00000000
[054h 0084   4]           GPE1 Block Address : 00000000
[058h 0088   1]       PM1 Event Block Length : 00
[059h 0089   1]     PM1 Control Block Length : 00
[05Ah 0090   1]     PM2 Control Block Length : 00
[05Bh 0091   1]        PM Timer Block Length : 00
[05Ch 0092   1]            GPE0 Block Length : 00
[05Dh 0093   1]            GPE1 Block Length : 00
[05Eh 0094   1]             GPE1 Base Offset : 00
[05Fh 0095   1]                 _CST Support : 00
[060h 0096   2]                   C2 Latency : 0000
[062h 0098   2]                   C3 Latency : 0000
[064h 0100   2]               CPU Cache Size : 0000
[066h 0102   2]           Cache Flush Stride : 0000
[068h 0104   1]            Duty Cycle Offset : 00
[069h 0105   1]             Duty Cycle Width : 00
[06Ah 0106   1]          RTC Day Alarm Index : 00
[06Bh 0107   1]        RTC Month Alarm Index : 00
[06Ch 0108   1]            RTC Century Index : 00
[06Dh 0109   2]   Boot Flags (decoded below) : 0000
               Legacy Devices Supported (V2) : 0
            8042 Present on ports 60/64 (V2) : 0
                        VGA Not Present (V4) : 0
                      MSI Not Supported (V4) : 0
                PCIe ASPM Not Supported (V4) : 0
                   CMOS RTC Not Present (V5) : 0
[06Fh 0111   1]                     Reserved : 00
[070h 0112   4]        Flags (decoded below) : 00100000
      WBINVD instruction is operational (V1) : 0
              WBINVD flushes all caches (V1) : 0
                    All CPUs support C1 (V1) : 0
                  C2 works on MP system (V1) : 0
            Control Method Power Button (V1) : 0
            Control Method Sleep Button (V1) : 0
        RTC wake not in fixed reg space (V1) : 0
            RTC can wake system from S4 (V1) : 0
                        32-bit PM Timer (V1) : 0
                      Docking Supported (V1) : 0
               Reset Register Supported (V2) : 0
                            Sealed Case (V3) : 0
                    Headless - No Video (V3) : 0
        Use native instr after SLP_TYPx (V3) : 0
              PCIEXP_WAK Bits Supported (V4) : 0
                     Use Platform Timer (V4) : 0
               RTC_STS valid on S4 wake (V4) : 0
                Remote Power-on capable (V4) : 0
                 Use APIC Cluster Model (V4) : 0
     Use APIC Physical Destination Mode (V4) : 0
                       Hardware Reduced (V5) : 1
                      Low Power S0 Idle (V5) : 0

[074h 0116  12]               Reset Register : [Generic Address Structure]
[074h 0116   1]                     Space ID : 00 [SystemMemory]
[075h 0117   1]                    Bit Width : 00
[076h 0118   1]                   Bit Offset : 00
[077h 0119   1]         Encoded Access Width : 00 [Undefined/Legacy]
[078h 0120   8]                      Address : 0000000000000000

[080h 0128   1]         Value to cause reset : 00
[081h 0129   2]    ARM Flags (decoded below) : 0003
                              PSCI Compliant : 1
                       Must use HVC for PSCI : 1

[083h 0131   1]          FADT Minor Revision : 01
[084h 0132   8]                 FACS Address : 0000000000000000
[08Ch 0140   8]                 DSDT Address : 0000000000000000
[094h 0148  12]             PM1A Event Block : [Generic Address Structure]
[094h 0148   1]                     Space ID : 00 [SystemMemory]
[095h 0149   1]                    Bit Width : 00
[096h 0150   1]                   Bit Offset : 00
[097h 0151   1]         Encoded Access Width : 00 [Undefined/Legacy]
[098h 0152   8]                      Address : 0000000000000000

[0A0h 0160  12]             PM1B Event Block : [Generic Address Structure]
[0A0h 0160   1]                     Space ID : 00 [SystemMemory]
[0A1h 0161   1]                    Bit Width : 00
[0A2h 0162   1]                   Bit Offset : 00
[0A3h 0163   1]         Encoded Access Width : 00 [Undefined/Legacy]
[0A4h 0164   8]                      Address : 0000000000000000

[0ACh 0172  12]           PM1A Control Block : [Generic Address Structure]
[0ACh 0172   1]                     Space ID : 00 [SystemMemory]
[0ADh 0173   1]                    Bit Width : 00
[0AEh 0174   1]                   Bit Offset : 00
[0AFh 0175   1]         Encoded Access Width : 00 [Undefined/Legacy]
[0B0h 0176   8]                      Address : 0000000000000000

[0B8h 0184  12]           PM1B Control Block : [Generic Address Structure]
[0B8h 0184   1]                     Space ID : 00 [SystemMemory]
[0B9h 0185   1]                    Bit Width : 00
[0BAh 0186   1]                   Bit Offset : 00
[0BBh 0187   1]         Encoded Access Width : 00 [Undefined/Legacy]
[0BCh 0188   8]                      Address : 0000000000000000

[0C4h 0196  12]            PM2 Control Block : [Generic Address Structure]
[0C4h 0196   1]                     Space ID : 00 [SystemMemory]
[0C5h 0197   1]                    Bit Width : 00
[0C6h 0198   1]                   Bit Offset : 00
[0C7h 0199   1]         Encoded Access Width : 00 [Undefined/Legacy]
[0C8h 0200   8]                      Address : 0000000000000000

[0D0h 0208  12]               PM Timer Block : [Generic Address Structure]
[0D0h 0208   1]                     Space ID : 00 [SystemMemory]
[0D1h 0209   1]                    Bit Width : 00
[0D2h 0210   1]                   Bit Offset : 00
[0D3h 0211   1]         Encoded Access Width : 00 [Undefined/Legacy]
[0D4h 0212   8]                      Address : 0000000000000000

[0DCh 0220  12]                   GPE0 Block : [Generic Address Structure]
[0DCh 0220   1]                     Space ID : 00 [SystemMemory]
[0DDh 0221   1]                    Bit Width : 00
[0DEh 0222   1]                   Bit Offset : 00
[0DFh 0223   1]         Encoded Access Width : 00 [Undefined/Legacy]
[0E0h 0224   8]                      Address : 0000000000000000

[0E8h 0232  12]                   GPE1 Block : [Generic Address Structure]
[0E8h 0232   1]                     Space ID : 00 [SystemMemory]
[0E9h 0233   1]                    Bit Width : 00
[0EAh 0234   1]                   Bit Offset : 00
[0EBh 0235   1]         Encoded Access Width : 00 [Undefined/Legacy]
[0ECh 0236   8]                      Address : 0000000000000000

[0F4h 0244  12]       Sleep Control Register : [Generic Address Structure]
[0F4h 0244   1]                     Space ID : 00 [SystemMemory]
[0F5h 0245   1]                    Bit Width : 00
[0F6h 0246   1]                   Bit Offset : 00
[0F7h 0247   1]         Encoded Access Width : 00 [Undefined/Legacy]
[0F8h 0248   8]                      Address : 0000000000000000

[100h 0256  12]        Sleep Status Register : [Generic Address Structure]
[100h 0256   1]                     Space ID : 00 [SystemMemory]
[101h 0257   1]                    Bit Width : 00
[102h 0258   1]                   Bit Offset : 00
[103h 0259   1]         Encoded Access Width : 00 [Undefined/Legacy]
[104h 0260   8]                      Address : 0000000000000000

/**** ACPI table terminates in the middle of a data structure! (dump table) */

Raw Table Data: Length 268 (0x10C)

    0000: 46 41 43 50 0C 01 00 00 05 55 42 4F 43 48 53 20  // FACP.....UBOCHS
    0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
    0020: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0070: 00 00 10 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0080: 00 03 00 01 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00A0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00B0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00C0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00D0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00E0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00F0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0100: 00 00 00 00 00 00 00 00 00 00 00 00              // ............

* Expected ACPI Data Table [SRAT]
[000h 0000   4]                    Signature : "SRAT"    [System Resource Affinity Table]
[004h 0004   4]                 Table Length : 0000006A
[008h 0008   1]                     Revision : 03
[009h 0009   1]                     Checksum : 65
[00Ah 0010   6]                       Oem ID : "BOCHS "
[010h 0016   8]                 Oem Table ID : "BXPC    "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "BXPC"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   4]               Table Revision : 00000001
[028h 0040   8]                     Reserved : 0000000000000000

[030h 0048   1]                Subtable Type : 03 [GICC Affinity]
[031h 0049   1]                       Length : 12

[032h 0050   4]             Proximity Domain : 00000000
[036h 0054   4]           Acpi Processor UID : 00000000
[03Ah 0058   4]        Flags (decoded below) : 00000001
                                     Enabled : 1
[03Eh 0062   4]                 Clock Domain : 00000000

[042h 0066   1]                Subtable Type : 01 [Memory Affinity]
[043h 0067   1]                       Length : 28

[044h 0068   4]             Proximity Domain : 00000000
[048h 0072   2]                    Reserved1 : 0000
[04Ah 0074   8]                 Base Address : 0000000040000000
[052h 0082   8]               Address Length : 0000000008000000
[05Ah 0090   4]                    Reserved2 : 00000000
[05Eh 0094   4]        Flags (decoded below) : 00000001
                                     Enabled : 1
                               Hot Pluggable : 0
                                Non-Volatile : 0
[062h 0098   8]                    Reserved3 : 0000000000000000

Raw Table Data: Length 106 (0x6A)

    0000: 53 52 41 54 6A 00 00 00 03 65 42 4F 43 48 53 20  // SRATj....eBOCHS
    0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
    0020: 01 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00  // ................
    0030: 03 12 00 00 00 00 00 00 00 00 01 00 00 00 00 00  // ................
    0040: 00 00 01 28 00 00 00 00 00 00 00 00 00 40 00 00  // ...(.........@..
    0050: 00 00 00 00 00 08 00 00 00 00 00 00 00 00 01 00  // ................
    0060: 00 00 00 00 00 00 00 00 00 00                    // ..........

Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
---
 tests/data/acpi/virt/DSDT.acpihmatvirt      | Bin 0 -> 5282 bytes
 tests/data/acpi/virt/FACP.acpihmatvirt      | Bin 0 -> 268 bytes
 tests/data/acpi/virt/HMAT.acpihmatvirt      | Bin 0 -> 288 bytes
 tests/data/acpi/virt/SRAT.acpihmatvirt      | Bin 0 -> 240 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
 5 files changed, 4 deletions(-)

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

diff --git a/tests/data/acpi/virt/FACP.acpihmatvirt b/tests/data/acpi/virt/FACP.acpihmatvirt
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..1f764220f8533c427168e80ccf298604826a00b4 100644
GIT binary patch
literal 268
ycmZ>BbPnKQWME(ob@F%i2v%^42yj*a0-z8Bhz+8t3j|P&V`iYf6{t24%>w}Cy9NOO

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

diff --git a/tests/data/acpi/virt/SRAT.acpihmatvirt b/tests/data/acpi/virt/SRAT.acpihmatvirt
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..691ef56e34bc84509270db316d908f5979c209bb 100644
GIT binary patch
literal 240
zcmWFzat!&vz`($~%E{l^BUr&HBEVSz2pEB4AU22wVHjW*g0Wzt5D{c`%t9a@6A&ZR
rfLP2(B8(b94g@$rX%;9A*9GD;YQW53aKWz*WFHuKKxqyrjba`E3*rd@

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 44594cae59..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/DSDT.acpihmatvirt",
-"tests/data/acpi/virt/FACP.acpihmatvirt",
-"tests/data/acpi/virt/HMAT.acpihmatvirt",
-"tests/data/acpi/virt/SRAT.acpihmatvirt",
-- 
2.25.1


