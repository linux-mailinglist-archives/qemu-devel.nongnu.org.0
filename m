Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F342D382DC1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 15:44:41 +0200 (CEST)
Received: from localhost ([::1]:43480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lidY0-0006ps-VI
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 09:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lidX5-0005vX-72; Mon, 17 May 2021 09:43:43 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lidX2-0002Zq-Fj; Mon, 17 May 2021 09:43:42 -0400
Received: from dggems704-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FkKxz5BwRzQpFP;
 Mon, 17 May 2021 21:40:07 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggems704-chm.china.huawei.com (10.3.19.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 21:43:35 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 21:43:34 +0800
Subject: Re: [RFC PATCH v3 8/9] hw/arm/virt-acpi-build: Generate PPTT table
To: Andrew Jones <drjones@redhat.com>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-9-wangyanan55@huawei.com>
 <20210517080223.sajp445x5qsy57fq@gator.home>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <2dee4bda-fe42-15b1-3a22-22decbc0dbd0@huawei.com>
Date: Mon, 17 May 2021 21:43:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210517080223.sajp445x5qsy57fq@gator.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme715-chm.china.huawei.com (10.1.199.111) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=wangyanan55@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Drew,

On 2021/5/17 16:02, Andrew Jones wrote:
> On Sun, May 16, 2021 at 06:28:59PM +0800, Yanan Wang wrote:
>> From: Andrew Jones <drjones@redhat.com>
>>
>> Add the Processor Properties Topology Table (PPTT) to expose
>> CPU topology information defined by users to ACPI guests.
>>
>> Note, a DT-boot Linux guest with a non-flat CPU topology will
>> see socket and core IDs being sequential integers starting
>> from zero, which is different from ACPI-boot Linux guest,
>> e.g. with -smp 4,sockets=2,cores=2,threads=1
>>
>> a DT boot produces:
>>
>>   cpu:  0 package_id:  0 core_id:  0
>>   cpu:  1 package_id:  0 core_id:  1
>>   cpu:  2 package_id:  1 core_id:  0
>>   cpu:  3 package_id:  1 core_id:  1
>>
>> an ACPI boot produces:
>>
>>   cpu:  0 package_id: 36 core_id:  0
>>   cpu:  1 package_id: 36 core_id:  1
>>   cpu:  2 package_id: 96 core_id:  2
>>   cpu:  3 package_id: 96 core_id:  3
>>
>> This is due to several reasons:
>>
>>   1) DT cpu nodes do not have an equivalent field to what the PPTT
>>      ACPI Processor ID must be, i.e. something equal to the MADT CPU
>>      UID or equal to the UID of an ACPI processor container. In both
>>      ACPI cases those are platform dependant IDs assigned by the
>>      vendor.
>>
>>   2) While QEMU is the vendor for a guest, if the topology specifies
>>      SMT (> 1 thread), then, with ACPI, it is impossible to assign a
>>      core-id the same value as a package-id, thus it is not possible
>>      to have package-id=0 and core-id=0. This is because package and
>>      core containers must be in the same ACPI namespace and therefore
>>      must have unique UIDs.
>>
>>   3) ACPI processor containers are not mandatorily required for PPTT
>>      tables to be used and, due to the limitations of which IDs are
>>      selected described above in (2), they are not helpful for QEMU,
>>      so we don't build them with this patch. In the absence of them,
>>      Linux assigns its own unique IDs. The maintainers have chosen not
>>      to use counters from zero, but rather ACPI table offsets, which
>>      explains why the numbers are so much larger than with DT.
>>
>>   4) When there is no SMT (threads=1) the core IDs for ACPI boot guests
>>      match the logical CPU IDs, because these IDs must be equal to the
>>      MADT CPU UID (as no processor containers are present), and QEMU
>>      uses the logical CPU ID for these MADT IDs.
>>
>> So in summary, with QEMU as vender for guest, we use sequential integers
>> starting from zero for non-leaf nodes without valid ID flag, so that the
>> guest will ignore them and use table offsets as the unique IDs. And we
>> also use logical CPU IDs for leaf nodes to be consistent with MADT.
>>
>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>> Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/arm/virt-acpi-build.c | 58 +++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 57 insertions(+), 1 deletion(-)
> Why aren't we adding build_pptt to aml-build.c, like my original patch
> does? I don't see anything Arm specific below, at least not if you passed
> MachineState instead of VirtMachineState, like my original patch did.
I agree to move build_pptt to common code, so that other platforms
can also use it if they want. I will do it in next version.

BTW, it seems patch 1 and 5 were possibly missed for some review.
Any comments for them too? Thanks!
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 4d64aeb865..b03d57745a 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -435,6 +435,57 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>                    vms->oem_table_id);
>>   }
>>   
>> +/* ACPI 6.2: 5.2.29 Processor Properties Topology Table (PPTT) */
>> +static void build_pptt(GArray *table_data, BIOSLinker *linker,
>> +                       VirtMachineState *vms)
>> +{
>> +    MachineState *ms = MACHINE(vms);
>> +    int pptt_start = table_data->len;
>> +    int uid = 0, socket;
>> +
>> +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
>> +
>> +    for (socket = 0; socket < ms->smp.sockets; socket++) {
>> +        uint32_t socket_offset = table_data->len - pptt_start;
>> +        int core;
>> +
>> +        build_processor_hierarchy_node(
>> +            table_data,
>> +            (1 << 0), /* ACPI 6.2 - Physical package */
>> +            0, socket, NULL, 0);
>> +
>> +        for (core = 0; core < ms->smp.cores; core++) {
>> +            uint32_t core_offset = table_data->len - pptt_start;
>> +            int thread;
>> +
>> +            if (ms->smp.threads <= 1) {
> We can't have threads < 1, so this condition should be == 1.
Right, I will fix it.

Thanks,
Yanan
>> +                build_processor_hierarchy_node(
>> +                    table_data,
>> +                    (1 << 1) | /* ACPI 6.2 - ACPI Processor ID valid */
>> +                    (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
>> +                    socket_offset, uid++, NULL, 0);
>> +            } else {
>> +                build_processor_hierarchy_node(table_data, 0, socket_offset,
>> +                                               core, NULL, 0);
>> +
>> +                for (thread = 0; thread < ms->smp.threads; thread++) {
>> +                    build_processor_hierarchy_node(
>> +                        table_data,
>> +                        (1 << 1) | /* ACPI 6.2 - ACPI Processor ID valid */
>> +                        (1 << 2) | /* ACPI 6.3 - Processor is a Thread */
>> +                        (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
>> +                        core_offset, uid++, NULL, 0);
>> +                }
>> +            }
>> +        }
>> +    }
>> +
>> +    build_header(linker, table_data,
>> +                 (void *)(table_data->data + pptt_start), "PPTT",
>> +                 table_data->len - pptt_start, 2,
>> +                 vms->oem_id, vms->oem_table_id);
>> +}
>> +
>>   /* GTDT */
>>   static void
>>   build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>> @@ -719,13 +770,18 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
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
>> +        build_pptt(tables_blob, tables->linker, vms);
>> +    }
>> +
>>       acpi_add_table(table_offsets, tables_blob);
>>       build_gtdt(tables_blob, tables->linker, vms);
>>   
>> -- 
>> 2.19.1
>>
> Thanks,
> drew
>
> .

