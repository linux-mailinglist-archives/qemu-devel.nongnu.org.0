Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9BA434866
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 11:57:00 +0200 (CEST)
Received: from localhost ([::1]:38584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md8LD-00072h-CJ
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 05:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1md8GJ-0001i8-Ei; Wed, 20 Oct 2021 05:51:55 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1md8GH-0004vF-OF; Wed, 20 Oct 2021 05:51:55 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HZ5PJ3k0yzbhGf;
 Wed, 20 Oct 2021 17:47:16 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 20 Oct 2021 17:51:50 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Wed, 20 Oct 2021 17:51:49 +0800
Subject: Re: [PATCH v8 7/8] hw/arm/virt-acpi-build: Generate PPTT table
To: Eric Auger <eauger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Andrew Jones <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>
References: <20211014132206.19220-1-wangyanan55@huawei.com>
 <20211014132206.19220-8-wangyanan55@huawei.com>
 <66786f13-6603-1cdd-7ce7-b1c77f617ac8@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <d1242aa5-9809-46bf-2815-3e3b898e3798@huawei.com>
Date: Wed, 20 Oct 2021 17:51:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <66786f13-6603-1cdd-7ce7-b1c77f617ac8@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme708-chm.china.huawei.com (10.1.199.104) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.074,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 wanghaibin.wang@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/10/20 16:05, Eric Auger wrote:
> Hi
>
> On 10/14/21 3:22 PM, Yanan Wang wrote:
>> Generate PPTT table for Arm virt machines.
> Generate the Processor Properties Topology Table (PPTT) for ARM virt
> machines supporting it (>= 6.2)
Ok, much clearer. I will add it to the commit msg.

Thanks,
Yanan
.
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>> ---
>>   hw/arm/virt-acpi-build.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 6cec97352b..658a0a5d39 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -875,13 +875,19 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>       dsdt = tables_blob->len;
>>       build_dsdt(tables_blob, tables->linker, vms);
>>   
>> -    /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
>> +    /* FADT MADT PPTT GTDT MCFG SPCR pointed to by RSDT */
>>       acpi_add_table(table_offsets, tables_blob);
>>       build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
>>   
>>       acpi_add_table(table_offsets, tables_blob);
>>       build_madt(tables_blob, tables->linker, vms);
>>   
>> +    if (!vmc->no_cpu_topology) {
>> +        acpi_add_table(table_offsets, tables_blob);
>> +        build_pptt(tables_blob, tables->linker, ms,
>> +                   vms->oem_id, vms->oem_table_id);
>> +    }
>> +
>>       acpi_add_table(table_offsets, tables_blob);
>>       build_gtdt(tables_blob, tables->linker, vms);
>>   
>>
> Besides
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>
> Eric
>
> .


