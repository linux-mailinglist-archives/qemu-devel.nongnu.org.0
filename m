Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1807C3F569A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 05:20:46 +0200 (CEST)
Received: from localhost ([::1]:59716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIMzO-0000ml-MU
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 23:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mIMyN-0007dU-4D; Mon, 23 Aug 2021 23:19:35 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mIMyK-0003D4-Bt; Mon, 23 Aug 2021 23:19:34 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GtvTL3lsBzYt01;
 Tue, 24 Aug 2021 11:18:46 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 24 Aug 2021 11:19:09 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 24 Aug 2021 11:19:08 +0800
Subject: Re: [PATCH for-6.2 v5 5/5] hw/acpi/aml-build: Generate PPTT table
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210805123921.62540-1-wangyanan55@huawei.com>
 <20210805123921.62540-6-wangyanan55@huawei.com>
 <20210823194718-mutt-send-email-mst@kernel.org>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <3d047677-427f-8a9c-7bda-9abca3c402f3@huawei.com>
Date: Tue, 24 Aug 2021 11:19:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210823194718-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme702-chm.china.huawei.com (10.1.199.98) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.023,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 wanghaibin.wang@huawei.com, Igor Mammedov <imammedo@redhat.com>,
 Salil Mehta <salil.mehta@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/8/24 7:52, Michael S. Tsirkin wrote:
> On Thu, Aug 05, 2021 at 08:39:21PM +0800, Yanan Wang wrote:
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
>> So in summary, with QEMU as vender for the guest, we use sequential
> vendor?
Yes, will fix the typo.
>> integers starting from zero for non-leaf nodes without valid ID flag,
>> so that guest will ignore them and use table offsets as unique IDs.
>> And we use logical CPU IDs for leaf nodes to be consistent with MADT.
>>
>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>> Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/acpi/aml-build.c         | 50 +++++++++++++++++++++++++++++++++++++
>>   hw/arm/virt-acpi-build.c    |  8 +++++-
>>   include/hw/acpi/aml-build.h |  3 +++
>>   3 files changed, 60 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>> index 9fa5024414..aa61c9651e 100644
>> --- a/hw/acpi/aml-build.c
>> +++ b/hw/acpi/aml-build.c
>> @@ -1946,6 +1946,56 @@ void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
>>       }
>>   }
>>   
>> +/* ACPI 6.2: 5.2.29 Processor Properties Topology Table (PPTT) */
>> +void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>> +                const char *oem_id, const char *oem_table_id)
>> +{
>> +    int pptt_start = table_data->len;
>> +    int uid = 0;
>> +    int socket;
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
> A bit better to be detailed:
>
> /* Physical package - represents the boundary of a physical package */
>
Ok. I will change this place and below mentioned to be more detailed
as you suggested if it's preferred.
>> +            0, socket, NULL, 0);
>> +
>> +        for (core = 0; core < ms->smp.cores; core++) {
>> +            uint32_t core_offset = table_data->len - pptt_start;
>> +            int thread;
>> +
>> +            if (ms->smp.threads > 1) {
>> +                build_processor_hierarchy_node(table_data, 0, socket_offset,
> and here:
> /* Physical package - does not represent the boundary of a physical package */
Thanks,
Yanan
.
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
>> +            } else {
>> +                build_processor_hierarchy_node(
>> +                    table_data,
>> +                    (1 << 1) | /* ACPI 6.2 - ACPI Processor ID valid */
>> +                    (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
>> +                    socket_offset, uid++, NULL, 0);
>> +            }
>> +        }
>> +    }
>> +
>> +    build_header(linker, table_data,
>> +                 (void *)(table_data->data + pptt_start), "PPTT",
>> +                 table_data->len - pptt_start, 2, oem_id, oem_table_id);
>> +}
>> +
>>   /* build rev1/rev3/rev5.1 FADT */
>>   void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>>                   const char *oem_id, const char *oem_table_id)
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 037cc1fd82..db23306a06 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -790,13 +790,19 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
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
>> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
>> index ea74b8f6ed..6c29f853cd 100644
>> --- a/include/hw/acpi/aml-build.h
>> +++ b/include/hw/acpi/aml-build.h
>> @@ -466,6 +466,9 @@ void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
>>                                       uint32_t parent, uint32_t id,
>>                                       uint32_t *priv_rsrc, uint32_t priv_num);
>>   
>> +void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>> +                const char *oem_id, const char *oem_table_id);
>> +
>>   void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>>                   const char *oem_id, const char *oem_table_id);
>>   
>> -- 
>> 2.19.1
> .


