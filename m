Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFC8615D0D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 08:38:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq8Iy-0006Sy-Db; Wed, 02 Nov 2022 03:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1oq8Iu-0006Ji-20
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 03:36:52 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1oq8Ir-00062L-90
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 03:36:51 -0400
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4N2JX71pSDzpSxV;
 Wed,  2 Nov 2022 15:33:11 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 15:36:43 +0800
Subject: Re: [PATCH v4 3/6] tests: virt: Update expected ACPI tables for virt
 test
To: Yicong Yang <yangyicong@huawei.com>
CC: <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>,
 <yangyicong@hisilicon.com>, <prime.zeng@huawei.com>,
 <hesham.almatary@huawei.com>, <ionela.voinescu@arm.com>,
 <darren@os.amperecomputing.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, <imammedo@redhat.com>,
 <ani@anisinha.ca>, <eduardo@habkost.net>, <marcel.apfelbaum@gmail.com>,
 <f4bug@amsat.org>, <qemu-devel@nongnu.org>
References: <20221101071048.29553-1-yangyicong@huawei.com>
 <20221101071048.29553-4-yangyicong@huawei.com>
Message-ID: <7c59ec85-d817-ade2-fbb1-4e29ad93e601@huawei.com>
Date: Wed, 2 Nov 2022 15:36:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20221101071048.29553-4-yangyicong@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 2022/11/1 15:10, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
>
> Update the ACPI tables according to the acpi aml_build change, also
> empty bios-tables-test-allowed-diff.h.
>
> The disassembled differences between actual and expected PPTT:
>
>    /*
>     * Intel ACPI Component Architecture
>     * AML/ASL+ Disassembler version 20180105 (64-bit version)
>     * Copyright (c) 2000 - 2018 Intel Corporation
>     *
>   - * Disassembly of tests/data/acpi/virt/PPTT, Tue Nov  1 09:29:12 2022
>   + * Disassembly of /tmp/aml-DIIGV1, Tue Nov  1 09:29:12 2022
>     *
>     * ACPI Data Table [PPTT]
>     *
>     * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
>     */
>
>    [000h 0000   4]                    Signature : "PPTT"    [Processor Properties Topology Table]
>   -[004h 0004   4]                 Table Length : 00000060
>   +[004h 0004   4]                 Table Length : 0000004C
>    [008h 0008   1]                     Revision : 02
>   -[009h 0009   1]                     Checksum : 48
>   +[009h 0009   1]                     Checksum : A8
>    [00Ah 0010   6]                       Oem ID : "BOCHS "
>    [010h 0016   8]                 Oem Table ID : "BXPC    "
>    [018h 0024   4]                 Oem Revision : 00000001
>    [01Ch 0028   4]              Asl Compiler ID : "BXPC"
>    [020h 0032   4]        Asl Compiler Revision : 00000001
>
>    [024h 0036   1]                Subtable Type : 00 [Processor Hierarchy Node]
>    [025h 0037   1]                       Length : 14
>    [026h 0038   2]                     Reserved : 0000
>    [028h 0040   4]        Flags (decoded below) : 00000001
>                                Physical package : 1
>                         ACPI Processor ID valid : 0
>    [02Ch 0044   4]                       Parent : 00000000
>    [030h 0048   4]            ACPI Processor ID : 00000000
>    [034h 0052   4]      Private Resource Number : 00000000
>
>    [038h 0056   1]                Subtable Type : 00 [Processor Hierarchy Node]
>    [039h 0057   1]                       Length : 14
>    [03Ah 0058   2]                     Reserved : 0000
>   -[03Ch 0060   4]        Flags (decoded below) : 00000000
>   +[03Ch 0060   4]        Flags (decoded below) : 0000000A
>                                Physical package : 0
>   -                     ACPI Processor ID valid : 0
>   +                     ACPI Processor ID valid : 1
>    [040h 0064   4]                       Parent : 00000024
>    [044h 0068   4]            ACPI Processor ID : 00000000
>    [048h 0072   4]      Private Resource Number : 00000000
>
>   -[04Ch 0076   1]                Subtable Type : 00 [Processor Hierarchy Node]
>   -[04Dh 0077   1]                       Length : 14
>   -[04Eh 0078   2]                     Reserved : 0000
>   -[050h 0080   4]        Flags (decoded below) : 0000000A
>   -                            Physical package : 0
>   -                     ACPI Processor ID valid : 1
>   -[054h 0084   4]                       Parent : 00000038
>   -[058h 0088   4]            ACPI Processor ID : 00000000
>   -[05Ch 0092   4]      Private Resource Number : 00000000
>   -
>   -Raw Table Data: Length 96 (0x60)
>   +Raw Table Data: Length 76 (0x4C)
>
>   -  0000: 50 50 54 54 60 00 00 00 02 48 42 4F 43 48 53 20  // PPTT`....HBOCHS
>   +  0000: 50 50 54 54 4C 00 00 00 02 A8 42 4F 43 48 53 20  // PPTTL.....BOCHS
>      0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
>      0020: 01 00 00 00 00 14 00 00 01 00 00 00 00 00 00 00  // ................
>   -  0030: 00 00 00 00 00 00 00 00 00 14 00 00 00 00 00 00  // ................
>   -  0040: 24 00 00 00 00 00 00 00 00 00 00 00 00 14 00 00  // $...............
>   -  0050: 0A 00 00 00 38 00 00 00 00 00 00 00 00 00 00 00  // ....8...........
>   +  0030: 00 00 00 00 00 00 00 00 00 14 00 00 0A 00 00 00  // ................
>   +  0040: 24 00 00 00 00 00 00 00 00 00 00 00              // $...........
Looks ok:
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>   tests/data/acpi/virt/PPTT                   | Bin 96 -> 76 bytes
>   tests/qtest/bios-tables-test-allowed-diff.h |   1 -
>   2 files changed, 1 deletion(-)
>
> diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/virt/PPTT
> index f56ea63b369a604877374ad696c396e796ab1c83..7a1258ecf123555b24462c98ccbb76b4ac1d0c2b 100644
> GIT binary patch
> delta 32
> fcmYfB;R*-{3GrcIU|?D?k;`ae01J-_kOKn%ZFdCM
>
> delta 53
> pcmeZC;0g!`2}xjJU|{l?$YrDgWH5jU5Ca567#O&Klm(arApowi1QY-O
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index cb143a55a6..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,2 +1 @@
>   /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/virt/PPTT",


