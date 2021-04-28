Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B5D36D32C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 09:32:39 +0200 (CEST)
Received: from localhost ([::1]:42924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbegW-0002oo-9E
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 03:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lbef8-0001mf-T6; Wed, 28 Apr 2021 03:31:10 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lbef5-0005ky-Ab; Wed, 28 Apr 2021 03:31:10 -0400
Received: from dggeml761-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FVVZJ15Shz14JcW;
 Wed, 28 Apr 2021 15:27:04 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggeml761-chm.china.huawei.com (10.1.199.171) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 28 Apr 2021 15:31:00 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 28 Apr 2021 15:31:00 +0800
Subject: Re: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
To: Andrew Jones <drjones@redhat.com>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-6-wangyanan55@huawei.com>
 <20210427141644.n6vw5fprgjhrymfw@gator.home>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <beeb000b-5663-8b45-8f5e-5e329fb71dca@huawei.com>
Date: Wed, 28 Apr 2021 15:30:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210427141644.n6vw5fprgjhrymfw@gator.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme715-chm.china.huawei.com (10.1.199.111) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, Shannon
 Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 yangyicong@huawei.com, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Drew,

On 2021/4/27 22:16, Andrew Jones wrote:
> On Tue, Apr 13, 2021 at 04:07:44PM +0800, Yanan Wang wrote:
>> Add the Processor Properties Topology Table (PPTT) to present
>> CPU topology information to ACPI guests. Note, while a DT boot
>> Linux guest with a non-flat CPU topology will see socket and
>> core IDs being sequential integers starting from zero, e.g.
>> with -smp 4,sockets=2,cores=2,threads=1
>>
>> a DT boot produces
>>
>>   cpu:  0 package_id:  0 core_id:  0
>>   cpu:  1 package_id:  0 core_id:  1
>>   cpu:  2 package_id:  1 core_id:  0
>>   cpu:  3 package_id:  1 core_id:  1
>>
>> an ACPI boot produces
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
>>   3) ACPI processor containers are not required for PPTT tables to
>>      be used and, due to the limitations of which IDs are selected
>>      described above in (2), they are not helpful for QEMU, so we
>>      don't build them with this patch. In the absence of them, Linux
>>      assigns its own unique IDs. The maintainers have chosen not to use
>>      counters from zero, but rather ACPI table offsets, which explains
>>      why the numbers are so much larger than with DT.
>>
>>   4) When there is no SMT (threads=1) the core IDs for ACPI boot guests
>>      match the logical CPU IDs, because these IDs must be equal to the
>>      MADT CPU UID (as no processor containers are present), and QEMU
>>      uses the logical CPU ID for these MADT IDs.
>>
>> Tested-by: Jiajie Li <lijiajie11@huawei.com>
>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>> Signed-off-by: Ying Fang <fangying1@huawei.com>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/arm/virt-acpi-build.c | 63 ++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 63 insertions(+)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 2ad5dad1bf..03fd812d5a 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -436,6 +436,64 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>                    vms->oem_table_id);
>>   }
>>   
>> +/* PPTT */
> Please point out the ACPI spec section "5.2.29 Processor Properties
> Topology Table"
Will fix.
>> +static void
>> +build_pptt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> QEMU doesn't do this style, please write as
>
> static void build_pptt(GArray *table_data, BIOSLinker *linker,
>                         VirtMachineState *vms)
Will fix.
>> +{
>> +    int pptt_start = table_data->len;
>> +    int uid = 0, cpus = 0, socket = 0;
>> +    MachineState *ms = MACHINE(vms);
>> +    unsigned int smp_cores = ms->smp.cores;
>> +    unsigned int smp_threads = ms->smp.threads;
>> +
>> +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
>> +
>> +    for (socket = 0; cpus < ms->possible_cpus->len; socket++) {
> Why not iterate from zero to ms->smp.sockets? With this type of loop if
> the number of sockets doesn't correctly fit the number of possible cpus,
> then you'll magically create new sockets that the user didn't want. That
> case shouldn't be able to happen, though, because the smp parsing should
> catch it. In any case, iterating sockets between zero it's number would
> make more sense.
In either way, we will never meet "sockets * cores * threads != 
possible_cpus->len" here.
But yes, what you describe makes more sense and will make code easier 
for reading.
>> +        uint32_t socket_offset = table_data->len - pptt_start;
>> +        int core;
>> +
>> +        build_processor_hierarchy_node(
>> +            table_data, 1, /* Physical package */
> If we want to pass the flags with in-argument-list comments, then please
> make sure the flags are on separate lines. See below.
>
>> +            0, socket, /* No parent */
>> +            NULL, 0);  /* No private resources */
> We don't need the 'No parent' and 'No private resources' comments.
>
>          build_processor_hierarchy_node(table_data,
>              (1 << 0), /* ACPI 6.2: Physical package */
>              0, socket, NULL, 0);
>
>> +
>> +        for (core = 0; core < smp_cores; core++) {
>> +            uint32_t core_offset = table_data->len - pptt_start;
>> +            int thread;
>> +
>> +            if (smp_threads <= 1) {
>> +                build_processor_hierarchy_node(
>> +                    table_data,
>> +                    (1 << 1) | /* ACPI Processor ID valid */
>> +                    (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
>> +                    socket_offset, uid++, /* Parent is a Socket */
>> +                    NULL, 0);  /* No private resources */
> Now I see why you were calling out 6.3 in the previous patch. I suggest
> still keeping the function of the previous patch referencing 6.2, but
> also keep referencing 6.3 here, like you already do
>
>                  build_processor_hierarchy_node(table_data,
>                      (1 << 1) | /* ACPI Processor ID valid */
>                      (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
>                      socket_offset, uid++, NULL, 0);
>
>> +            } else {
>> +                build_processor_hierarchy_node(
>> +                    table_data, 0,
>> +                    socket_offset, core, /* Parent is a Socket */
>> +                    NULL, 0); /* No private resources */
> No need for these in-argument-comments that don't match up with the spec.
>
>> +
>> +                for (thread = 0; thread < smp_threads; thread++) {
>> +                    build_processor_hierarchy_node(
>> +                        table_data,
>> +                        (1 << 1) | /* ACPI Processor ID valid */
>> +                        (1 << 2) | /* ACPI 6.3 - Processor is a Thread */
>> +                        (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
> This looks good.
>
>> +                        core_offset, uid++, /* Parent is a Core */
>> +                        NULL, 0);  /* No private resources */
> Don't need these comments.
Thanks for above suggestions and guidance about in-argument-comments.
I will make some adjustment.
>> +                }
>> +            }
>> +        }
>> +        cpus += smp_cores * smp_threads;
> As stated above, we don't want this.
>
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
>> @@ -707,6 +765,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>       acpi_add_table(table_offsets, tables_blob);
>>       build_madt(tables_blob, tables->linker, vms);
>>   
>> +    if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
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
> Besides some changes that I think should be changed back and the 6.3
> flags, this patch looks very similar to [1], so I'd prefer my
> authorship be maintained. However, if my authorship is dropped, then
> my s-o-b should be replaced with a Co-developed-by.
Of course, I will make it right.

Thanks,
Yanan
>
> [1] https://github.com/rhdrjones/qemu/commit/439b38d67ca1f2cbfa5b9892a822b651ebd05c11
>
> Thanks,
> drew
>
> .

