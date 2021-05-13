Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC4A37F280
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 07:11:58 +0200 (CEST)
Received: from localhost ([::1]:40106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh3dc-0001sd-UA
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 01:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lh3cC-0000qL-0e; Thu, 13 May 2021 01:10:28 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lh3c8-0008A1-Qc; Thu, 13 May 2021 01:10:27 -0400
Received: from dggeml703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FgflX4cwcz5wPC;
 Thu, 13 May 2021 13:06:48 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggeml703-chm.china.huawei.com (10.3.17.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 13 May 2021 13:10:11 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 13 May 2021 13:10:10 +0800
Subject: Re: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
To: Andrew Jones <drjones@redhat.com>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-6-wangyanan55@huawei.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <1551b7d6-e010-e5c7-47e1-c347ca78a1db@huawei.com>
Date: Thu, 13 May 2021 13:10:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210413080745.33004-6-wangyanan55@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme709-chm.china.huawei.com (10.1.199.105) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
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
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 prime.zeng@hisilicon.com, yangyicong@huawei.com, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David
 Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Drew,

I got a question below, and hope your reply. Thanks!
On 2021/4/13 16:07, Yanan Wang wrote:
> Add the Processor Properties Topology Table (PPTT) to present
> CPU topology information to ACPI guests. Note, while a DT boot
> Linux guest with a non-flat CPU topology will see socket and
> core IDs being sequential integers starting from zero, e.g.
> with -smp 4,sockets=2,cores=2,threads=1
>
> a DT boot produces
>
>   cpu:  0 package_id:  0 core_id:  0
>   cpu:  1 package_id:  0 core_id:  1
>   cpu:  2 package_id:  1 core_id:  0
>   cpu:  3 package_id:  1 core_id:  1
>
> an ACPI boot produces
>
>   cpu:  0 package_id: 36 core_id:  0
>   cpu:  1 package_id: 36 core_id:  1
>   cpu:  2 package_id: 96 core_id:  2
>   cpu:  3 package_id: 96 core_id:  3
>
> This is due to several reasons:
>
>   1) DT cpu nodes do not have an equivalent field to what the PPTT
>      ACPI Processor ID must be, i.e. something equal to the MADT CPU
>      UID or equal to the UID of an ACPI processor container. In both
>      ACPI cases those are platform dependant IDs assigned by the
>      vendor.
>
>   2) While QEMU is the vendor for a guest, if the topology specifies
>      SMT (> 1 thread), then, with ACPI, it is impossible to assign a
>      core-id the same value as a package-id, thus it is not possible
>      to have package-id=0 and core-id=0. This is because package and
>      core containers must be in the same ACPI namespace and therefore
>      must have unique UIDs.
>
>   3) ACPI processor containers are not required for PPTT tables to
>      be used and, due to the limitations of which IDs are selected
>      described above in (2), they are not helpful for QEMU, so we
>      don't build them with this patch. In the absence of them, Linux
>      assigns its own unique IDs. The maintainers have chosen not to use
>      counters from zero, but rather ACPI table offsets, which explains
>      why the numbers are so much larger than with DT.
>
>   4) When there is no SMT (threads=1) the core IDs for ACPI boot guests
>      match the logical CPU IDs, because these IDs must be equal to the
>      MADT CPU UID (as no processor containers are present), and QEMU
>      uses the logical CPU ID for these MADT IDs.
>
> Tested-by: Jiajie Li <lijiajie11@huawei.com>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>   hw/arm/virt-acpi-build.c | 63 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 63 insertions(+)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 2ad5dad1bf..03fd812d5a 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -436,6 +436,64 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                    vms->oem_table_id);
>   }
>   
> +/* PPTT */
> +static void
> +build_pptt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> +{
> +    int pptt_start = table_data->len;
> +    int uid = 0, cpus = 0, socket = 0;
> +    MachineState *ms = MACHINE(vms);
> +    unsigned int smp_cores = ms->smp.cores;
> +    unsigned int smp_threads = ms->smp.threads;
> +
> +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> +
> +    for (socket = 0; cpus < ms->possible_cpus->len; socket++) {
> +        uint32_t socket_offset = table_data->len - pptt_start;
> +        int core;
> +
> +        build_processor_hierarchy_node(
> +            table_data, 1, /* Physical package */
> +            0, socket, /* No parent */
> +            NULL, 0);  /* No private resources */
> +
> +        for (core = 0; core < smp_cores; core++) {
> +            uint32_t core_offset = table_data->len - pptt_start;
> +            int thread;
> +
> +            if (smp_threads <= 1) {
> +                build_processor_hierarchy_node(
> +                    table_data,
> +                    (1 << 1) | /* ACPI Processor ID valid */
> +                    (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
> +                    socket_offset, uid++, /* Parent is a Socket */
> +                    NULL, 0);  /* No private resources */
> +            } else {
> +                build_processor_hierarchy_node(
> +                    table_data, 0,
> +                    socket_offset, core, /* Parent is a Socket */
> +                    NULL, 0); /* No private resources */
> +
> +                for (thread = 0; thread < smp_threads; thread++) {
> +                    build_processor_hierarchy_node(
> +                        table_data,
> +                        (1 << 1) | /* ACPI Processor ID valid */
> +                        (1 << 2) | /* ACPI 6.3 - Processor is a Thread */
> +                        (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
> +                        core_offset, uid++, /* Parent is a Core */
> +                        NULL, 0);  /* No private resources */
> +                }
> +            }
> +        }
> +        cpus += smp_cores * smp_threads;
> +    }
> +
> +    build_header(linker, table_data,
> +                 (void *)(table_data->data + pptt_start), "PPTT",
> +                 table_data->len - pptt_start, 2,
> +                 vms->oem_id, vms->oem_table_id);
> +}
> +
>   /* GTDT */
>   static void
>   build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> @@ -707,6 +765,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>       acpi_add_table(table_offsets, tables_blob);
>       build_madt(tables_blob, tables->linker, vms);
>   
> +    if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
I'm not really sure why we need to care about "ms->smp.cpus > 1" here?

IMO, just like MADT in which we create both ENABLED and DISABLED
gicc nodes no matter of number of ENABLED nodes is one or not, we
should create PPTT table for all the possible cpus and not care about
number of smp cpus, too. This will be more consistent with the ACPI
specification and the PPTT table will be used for ACPI cpu hotplug in
the future even with  "smp.cpus == 1".

Care of "smp.cpus > 1" in the DT cpu-map part makes sense to me,
because we are required to only add present cpu nodes to the DT and
Linux Doc says that a cpu-map is not needed for uniprocessor systems.

Thanks,
Yanan
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_pptt(tables_blob, tables->linker, vms);
> +    }
> +
>       acpi_add_table(table_offsets, tables_blob);
>       build_gtdt(tables_blob, tables->linker, vms);
>   

