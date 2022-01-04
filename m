Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1617483A95
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 03:30:08 +0100 (CET)
Received: from localhost ([::1]:38656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ZaR-0000Wp-Vi
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 21:30:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n4ZZU-000858-A8; Mon, 03 Jan 2022 21:29:08 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n4ZZR-0001dz-3g; Mon, 03 Jan 2022 21:29:08 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JSc3v4gLGzccJw;
 Tue,  4 Jan 2022 10:28:27 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Tue, 4 Jan 2022 10:28:59 +0800
Subject: Re: [PATCH v6 7/7] tests/acpi/bios-table-test: Update expected
 virt/PPTT file
To: Ani Sinha <ani@anisinha.ca>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, Eric Auger <eauger@redhat.com>,
 <wanghaibin.wang@huawei.com>
References: <20220103084636.2496-1-wangyanan55@huawei.com>
 <20220103084636.2496-8-wangyanan55@huawei.com>
 <alpine.DEB.2.22.394.2201031730230.14895@anisinha-lenovo>
Message-ID: <d9c1574f-ab24-012f-0224-ab52eb7c0fc8@huawei.com>
Date: Tue, 4 Jan 2022 10:28:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2201031730230.14895@anisinha-lenovo>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme708-chm.china.huawei.com (10.1.199.104) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) NICE_REPLY_A=-3.354, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>

Hi Ani,
Thanks for your review.

On 2022/1/3 20:01, Ani Sinha wrote:
>
> On Mon, 3 Jan 2022, Yanan Wang wrote:
>
>> Run ./tests/data/acpi/rebuild-expected-aml.sh from build directory
>> to update PPTT binary. Also empty bios-tables-test-allowed-diff.h.
>>
>> The disassembled differences between actual and expected PPTT:
>>
>>   /*
>>    * Intel ACPI Component Architecture
>>    * AML/ASL+ Disassembler version 20180810 (64-bit version)
>>    * Copyright (c) 2000 - 2018 Intel Corporation
>>    *
>> - * Disassembly of tests/data/acpi/virt/PPTT, Mon Oct 25 20:24:53 2021
>> + * Disassembly of /tmp/aml-BPI5B1, Mon Oct 25 20:24:53 2021
>>    *
>>    * ACPI Data Table [PPTT]
>>    *
>>    * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
>>    */
>>
>>   [000h 0000   4]                    Signature : "PPTT"    [Processor Properties Topology Table]
>> -[004h 0004   4]                 Table Length : 0000004C
>> +[004h 0004   4]                 Table Length : 00000060
>>   [008h 0008   1]                     Revision : 02
>> -[009h 0009   1]                     Checksum : A8
>> +[009h 0009   1]                     Checksum : 48
>>   [00Ah 0010   6]                       Oem ID : "BOCHS "
>>   [010h 0016   8]                 Oem Table ID : "BXPC    "
>>   [018h 0024   4]                 Oem Revision : 00000001
>>   [01Ch 0028   4]              Asl Compiler ID : "BXPC"
>>   [020h 0032   4]        Asl Compiler Revision : 00000001
>>
>>   [024h 0036   1]                Subtable Type : 00 [Processor Hierarchy Node]
>>   [025h 0037   1]                       Length : 14
>>   [026h 0038   2]                     Reserved : 0000
>>   [028h 0040   4]        Flags (decoded below) : 00000001
>>                               Physical package : 1
>>                        ACPI Processor ID valid : 0
>>   [02Ch 0044   4]                       Parent : 00000000
>>   [030h 0048   4]            ACPI Processor ID : 00000000
>>   [034h 0052   4]      Private Resource Number : 00000000
>>
>>   [038h 0056   1]                Subtable Type : 00 [Processor Hierarchy Node]
>>   [039h 0057   1]                       Length : 14
>>   [03Ah 0058   2]                     Reserved : 0000
>> -[03Ch 0060   4]        Flags (decoded below) : 0000000A
>> +[03Ch 0060   4]        Flags (decoded below) : 00000000
>>                               Physical package : 0
>> -                     ACPI Processor ID valid : 1
>> +                     ACPI Processor ID valid : 0
> I do not know this very well but does the above two changes (flags and
> processor ID) makes sense?
Yes. I think this is exactly what we expected.
Above flags is for the newly inserted cluster node which is between
socket node and core node. Flag "Physical package" is 0 because
it does not represent the boundary of physical package. Flag
"ACPI Processor ID valid" is 0, because we don't need a valid ID
for a container in QEMU (cluster is container of CPU core) just
like socket node.

"0000000A" originally comes from core node, which now is at
place [*] below.

We can also read the reason why we don't need a valid ID for a
container in 099f2df2e6b "hw/acpi/aml-build: Add PPTT table".
>
>>   [040h 0064   4]                       Parent : 00000024
>>   [044h 0068   4]            ACPI Processor ID : 00000000
>>   [048h 0072   4]      Private Resource Number : 00000000
>>
>> -Raw Table Data: Length 76 (0x4C)
>> +[04Ch 0076   1]                Subtable Type : 00 [Processor Hierarchy Node]
>> +[04Dh 0077   1]                       Length : 14
>> +[04Eh 0078   2]                     Reserved : 0000
>> +[050h 0080   4]        Flags (decoded below) : 0000000A
>> +                            Physical package : 0
>> +                     ACPI Processor ID valid : 1
>> +[054h 0084   4]                       Parent : 00000038
>> +[058h 0088   4]            ACPI Processor ID : 00000000
>> +[05Ch 0092   4]      Private Resource Number : 00000000
[*] Information of core node.

Thanks,
Yanan
>> +
>> +Raw Table Data: Length 96 (0x60)
>>
>> -    0000: 50 50 54 54 4C 00 00 00 02 A8 42 4F 43 48 53 20  // PPTTL.....BOCHS
>> +    0000: 50 50 54 54 60 00 00 00 02 48 42 4F 43 48 53 20  // PPTT`....HBOCHS
>>       0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
>>       0020: 01 00 00 00 00 14 00 00 01 00 00 00 00 00 00 00  // ................
>> -    0030: 00 00 00 00 00 00 00 00 00 14 00 00 0A 00 00 00  // ................
>> -    0040: 24 00 00 00 00 00 00 00 00 00 00 00              // $...........
>> +    0030: 00 00 00 00 00 00 00 00 00 14 00 00 00 00 00 00  // ................
>> +    0040: 24 00 00 00 00 00 00 00 00 00 00 00 00 14 00 00  // $...............
>> +    0050: 0A 00 00 00 38 00 00 00 00 00 00 00 00 00 00 00  // ....8...........
>>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   tests/data/acpi/virt/PPTT                   | Bin 76 -> 96 bytes
>>   tests/qtest/bios-tables-test-allowed-diff.h |   1 -
>>   2 files changed, 1 deletion(-)
>>
>> diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/virt/PPTT
>> index 7a1258ecf123555b24462c98ccbb76b4ac1d0c2b..f56ea63b369a604877374ad696c396e796ab1c83 100644
>> GIT binary patch
>> delta 53
>> zcmV-50LuSNU<y!BR8(L90006=kqR;-00000Bme*a000000000002BZK3IG5AH~;_u
>> L0000000000uCW9Z
>>
>> delta 32
>> qcmV+*0N?*$ObSp?R8&j=00080kqR=APy`Gl00000000000001OcLdh}
>>
>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
>> index cb143a55a6..dfb8523c8b 100644
>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>> @@ -1,2 +1 @@
>>   /* List of comma-separated changed AML files to ignore */
>> -"tests/data/acpi/virt/PPTT",
>> --
>> 2.27.0
>>
>>
> .


