Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAE65AAB5A
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 11:28:20 +0200 (CEST)
Received: from localhost ([::1]:51694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU2yJ-0001K1-2N
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 05:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1oU2vd-0006H3-14; Fri, 02 Sep 2022 05:25:33 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1oU2vY-0000OJ-QC; Fri, 02 Sep 2022 05:25:32 -0400
Received: from fraeml745-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MJstx5KFbz688hK;
 Fri,  2 Sep 2022 17:24:41 +0800 (CST)
Received: from lhrpeml500004.china.huawei.com (7.191.163.9) by
 fraeml745-chm.china.huawei.com (10.206.15.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 2 Sep 2022 11:25:18 +0200
Received: from [10.202.227.118] (10.202.227.118) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 2 Sep 2022 10:25:17 +0100
Message-ID: <121c6b9f-0b7f-475b-570c-fd5bdc6f6c3a@huawei.com>
Date: Fri, 2 Sep 2022 10:25:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 0/8] AArch64/HMAT support and tests
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: <jonathan.cameron@huawei.com>, <qemu-devel@nongnu.org>,
 <yangyicong@huawei.com>, <chenxiang66@hisilicon.com>, <linuxarm@huawei.com>,
 <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
 <wangyanan55@huawei.com>, <marcel.apfelbaum@gmail.com>,
 <eduardo@habkost.net>, <Brice.Goglin@inria.fr>, <jingqi.liu@intel.com>
References: <20220719094950.1049516-1-hesham.almatary@huawei.com>
 <20220726110406-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220726110406-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.118]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 lhrpeml500004.china.huawei.com (7.191.163.9)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=hesham.almatary@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hello Michael,

On 7/26/2022 4:04 PM, Michael S. Tsirkin wrote:
> On Tue, Jul 19, 2022 at 10:49:42AM +0100, Hesham Almatary wrote:
>> This patchset adds support for AArch64/HMAT including a test.
>> It relies on other two patch sets from:
>>
>> Brice Goglin: to support -numa without initiators on q35/x86.
>>    https://lore.kernel.org/all/ed23accb-2c8b-90f4-a7a3-f81cc57bf678@inria.fr/
>> Xiang Chen: to enable/support HMAT on AArch64.
>>    https://lore.kernel.org/all/1643102134-15506-1-git-send-email-chenxiang66@hisilicon.com/
> Thanks!
> I think it's best to merge this all after the release.
> I've tagged this but please ping me after the release
> just to make sure. Thanks everyone!

Just a reminder of that could make it now.


>> I further add a test with ACPI/HMAT tables that uses the two
>> patch sets.
>>
>> Changes from v1:
>> - Generate APIC and PPTT ACPI tables for AArch64/virt
>> - Avoid using legacy syntax in numa/bios tests
>> - Delete unchanged FACP tables
>>
>> Brice Goglin (4):
>>    hmat acpi: Don't require initiator value in -numa
>>    tests: acpi: add and whitelist *.hmat-noinitiator expected blobs
>>    tests: acpi: q35: add test for hmat nodes without initiators
>>    tests: acpi: q35: update expected blobs *.hmat-noinitiators expected
>>      HMAT:
>>
>> Hesham Almatary (3):
>>    tests: Add HMAT AArch64/virt empty table files
>>    tests: acpi: aarch64/virt: add a test for hmat nodes with no initiators
>>    tests: virt: Update expected *.acpihmatvirt tables
>>
>> Xiang Chen (1):
>>    hw/arm/virt: Enable HMAT on arm virt machine
>>
>>   hw/arm/Kconfig                                |   1 +
>>   hw/arm/virt-acpi-build.c                      |   7 ++
>>   hw/core/machine.c                             |   4 +-
>>   tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 0 -> 144 bytes
>>   tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 0 -> 8553 bytes
>>   tests/data/acpi/q35/HMAT.acpihmat-noinitiator | Bin 0 -> 288 bytes
>>   tests/data/acpi/q35/SRAT.acpihmat-noinitiator | Bin 0 -> 312 bytes
>>   tests/data/acpi/virt/APIC.acpihmatvirt        | Bin 0 -> 396 bytes
>>   tests/data/acpi/virt/DSDT.acpihmatvirt        | Bin 0 -> 5282 bytes
>>   tests/data/acpi/virt/HMAT.acpihmatvirt        | Bin 0 -> 288 bytes
>>   tests/data/acpi/virt/PPTT.acpihmatvirt        | Bin 0 -> 196 bytes
>>   tests/data/acpi/virt/SRAT.acpihmatvirt        | Bin 0 -> 240 bytes
>>   tests/qtest/bios-tables-test.c                | 109 ++++++++++++++++++
>>   13 files changed, 118 insertions(+), 3 deletions(-)
>>   create mode 100644 tests/data/acpi/q35/APIC.acpihmat-noinitiator
>>   create mode 100644 tests/data/acpi/q35/DSDT.acpihmat-noinitiator
>>   create mode 100644 tests/data/acpi/q35/HMAT.acpihmat-noinitiator
>>   create mode 100644 tests/data/acpi/q35/SRAT.acpihmat-noinitiator
>>   create mode 100644 tests/data/acpi/virt/APIC.acpihmatvirt
>>   create mode 100644 tests/data/acpi/virt/DSDT.acpihmatvirt
>>   create mode 100644 tests/data/acpi/virt/HMAT.acpihmatvirt
>>   create mode 100644 tests/data/acpi/virt/PPTT.acpihmatvirt
>>   create mode 100644 tests/data/acpi/virt/SRAT.acpihmatvirt
>>
>> -- 
>> 2.25.1
>

