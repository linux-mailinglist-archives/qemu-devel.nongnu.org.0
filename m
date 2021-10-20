Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC68A43431A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 03:48:09 +0200 (CEST)
Received: from localhost ([::1]:42702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md0i8-0000av-VN
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 21:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1md0bs-00084o-Qc; Tue, 19 Oct 2021 21:41:40 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1md0bo-0005kW-JD; Tue, 19 Oct 2021 21:41:40 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HYtZq0v0Yz1DHls;
 Wed, 20 Oct 2021 09:39:47 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 20 Oct 2021 09:41:31 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Wed, 20 Oct 2021 09:41:30 +0800
Subject: Re: [PATCH v8 8/8] tests/data/acpi/virt: Update the empty expected
 file for PPTT
To: "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20211014132206.19220-1-wangyanan55@huawei.com>
 <20211014132206.19220-9-wangyanan55@huawei.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <3010c4ff-f742-e09f-c13b-02f142a285e1@huawei.com>
Date: Wed, 20 Oct 2021 09:41:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211014132206.19220-9-wangyanan55@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme702-chm.china.huawei.com (10.1.199.98) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.074,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping...

On 2021/10/14 21:22, Yanan Wang wrote:
> Run ./tests/data/acpi/rebuild-expected-aml.sh from build directory
> to update PPTT binary. Also empty bios-tables-test-allowed-diff.h.
>
> Disassembled output of the updated new file:
>
> /*
>   * Intel ACPI Component Architecture
>   * AML/ASL+ Disassembler version 20180810 (64-bit version)
>   * Copyright (c) 2000 - 2018 Intel Corporation
>   *
>   * Disassembly of tests/data/acpi/virt/PPTT, Fri Oct  8 10:12:32 2021
>   *
>   * ACPI Data Table [PPTT]
>   *
>   * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
>   */
>
> [000h 0000   4]                    Signature : "PPTT"    [Processor Properties Topology Table]
> [004h 0004   4]                 Table Length : 0000004C
> [008h 0008   1]                     Revision : 02
> [009h 0009   1]                     Checksum : A8
> [00Ah 0010   6]                       Oem ID : "BOCHS "
> [010h 0016   8]                 Oem Table ID : "BXPC    "
> [018h 0024   4]                 Oem Revision : 00000001
> [01Ch 0028   4]              Asl Compiler ID : "BXPC"
> [020h 0032   4]        Asl Compiler Revision : 00000001
>
> [024h 0036   1]                Subtable Type : 00 [Processor Hierarchy Node]
> [025h 0037   1]                       Length : 14
> [026h 0038   2]                     Reserved : 0000
> [028h 0040   4]        Flags (decoded below) : 00000001
>                              Physical package : 1
>                       ACPI Processor ID valid : 0
> [02Ch 0044   4]                       Parent : 00000000
> [030h 0048   4]            ACPI Processor ID : 00000000
> [034h 0052   4]      Private Resource Number : 00000000
>
> [038h 0056   1]                Subtable Type : 00 [Processor Hierarchy Node]
> [039h 0057   1]                       Length : 14
> [03Ah 0058   2]                     Reserved : 0000
> [03Ch 0060   4]        Flags (decoded below) : 0000000A
>                              Physical package : 0
>                       ACPI Processor ID valid : 1
> [040h 0064   4]                       Parent : 00000024
> [044h 0068   4]            ACPI Processor ID : 00000000
> [048h 0072   4]      Private Resource Number : 00000000
>
> Raw Table Data: Length 76 (0x4C)
>
>      0000: 50 50 54 54 4C 00 00 00 02 A8 42 4F 43 48 53 20  // PPTTL.....BOCHS
>      0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
>      0020: 01 00 00 00 00 14 00 00 01 00 00 00 00 00 00 00  // ................
>      0030: 00 00 00 00 00 00 00 00 00 14 00 00 0A 00 00 00  // ................
>      0040: 24 00 00 00 00 00 00 00 00 00 00 00              // $...........
>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>   tests/data/acpi/virt/PPTT                   | Bin 0 -> 76 bytes
>   tests/qtest/bios-tables-test-allowed-diff.h |   1 -
>   2 files changed, 1 deletion(-)
>
> diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/virt/PPTT
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..7a1258ecf123555b24462c98ccbb76b4ac1d0c2b 100644
> GIT binary patch
> literal 76
> zcmV-S0JHy4P*hY*00002s6tOeNK+s}SWrVCARr(C0000&SWrU&000006aWAL00000
> i0000000000000006aWAU0000a00000000000001^0tW#A
>
> literal 0
> KcmV+b0RR6000031
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index cb143a55a6..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,2 +1 @@
>   /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/virt/PPTT",


