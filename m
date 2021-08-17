Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CAD3EEDD5
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 15:56:15 +0200 (CEST)
Received: from localhost ([::1]:50066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFzZe-0008O5-Sy
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 09:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mFzXn-00076i-Vr; Tue, 17 Aug 2021 09:54:20 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mFzXk-0007mv-Ov; Tue, 17 Aug 2021 09:54:19 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4GpsvD24zRz1CXkr;
 Tue, 17 Aug 2021 21:53:44 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 17 Aug 2021 21:54:07 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 17 Aug 2021 21:54:06 +0800
Subject: Re: [PATCH for-6.2 v5 3/5] hw/arm/virt: Add cpu-map to device tree
To: Andrew Jones <drjones@redhat.com>
References: <20210805123921.62540-1-wangyanan55@huawei.com>
 <20210805123921.62540-4-wangyanan55@huawei.com>
 <3bde66bd-d0ea-0960-b171-3bbd1990d977@huawei.com>
 <20210817115120.kuo53uawx2o7hrhc@gator.home>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <eed9b40a-a09c-8481-6595-8a4b1efce84f@huawei.com>
Date: Tue, 17 Aug 2021 21:54:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210817115120.kuo53uawx2o7hrhc@gator.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme718-chm.china.huawei.com (10.1.199.114) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.961,
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
 Salil Mehta <salil.mehta@huawei.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 wanghaibin.wang@huawei.com, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/8/17 19:51, Andrew Jones wrote:
> On Tue, Aug 17, 2021 at 10:10:44AM +0800, wangyanan (Y) wrote:
>> Hi,
>> On 2021/8/5 20:39, Yanan Wang wrote:
>>> From: Andrew Jones <drjones@redhat.com>
>>>
>>> Support device tree CPU topology descriptions.
>>>
>>> In accordance with the Devicetree Specification, the Linux Doc
>>> "arm/cpus.yaml" requires that cpus and cpu nodes in the DT are
>>> present. And we have already met the requirement by generating
>>> /cpus/cpu@* nodes for members within ms->smp.cpus. Accordingly,
>>> we should also create subnodes in cpu-map for the present cpus,
>>> each of which relates to an unique cpu node.
>>>
>>> The Linux Doc "cpu/cpu-topology.txt" states that the hierarchy
>>> of CPUs in a SMP system is defined through four entities and
>>> they are socket/cluster/core/thread. It is also required that
>>> a socket node's child nodes must be one or more cluster nodes.
>>> Given that currently we are only provided with information of
>>> socket/core/thread, we assume there is one cluster child node
>>> in each socket node when creating cpu-map.
>>>
>>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>>> Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
>>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>>> ---
>>>    hw/arm/virt.c | 59 ++++++++++++++++++++++++++++++++++++++++++---------
>>>    1 file changed, 49 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index 82f2eba6bd..d1e294be95 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -350,20 +350,21 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>>>        int cpu;
>>>        int addr_cells = 1;
>>>        const MachineState *ms = MACHINE(vms);
>>> +    const VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>>>        int smp_cpus = ms->smp.cpus;
>>>        /*
>>> -     * From Documentation/devicetree/bindings/arm/cpus.txt
>>> -     *  On ARM v8 64-bit systems value should be set to 2,
>>> -     *  that corresponds to the MPIDR_EL1 register size.
>>> -     *  If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
>>> -     *  in the system, #address-cells can be set to 1, since
>>> -     *  MPIDR_EL1[63:32] bits are not used for CPUs
>>> -     *  identification.
>>> +     * See Linux Documentation/devicetree/bindings/arm/cpus.yaml
>>> +     * On ARM v8 64-bit systems value should be set to 2,
>>> +     * that corresponds to the MPIDR_EL1 register size.
>>> +     * If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
>>> +     * in the system, #address-cells can be set to 1, since
>>> +     * MPIDR_EL1[63:32] bits are not used for CPUs
>>> +     * identification.
>>>         *
>>> -     *  Here we actually don't know whether our system is 32- or 64-bit one.
>>> -     *  The simplest way to go is to examine affinity IDs of all our CPUs. If
>>> -     *  at least one of them has Aff3 populated, we set #address-cells to 2.
>>> +     * Here we actually don't know whether our system is 32- or 64-bit one.
>>> +     * The simplest way to go is to examine affinity IDs of all our CPUs. If
>>> +     * at least one of them has Aff3 populated, we set #address-cells to 2.
>>>         */
>>>        for (cpu = 0; cpu < smp_cpus; cpu++) {
>>>            ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
>>> @@ -406,8 +407,46 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>>>                    ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
>>>            }
>>> +        if (!vmc->no_cpu_topology) {
>>> +            qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle",
>>> +                                  qemu_fdt_alloc_phandle(ms->fdt));
>>> +        }
>>> +
>>>            g_free(nodename);
>>>        }
>>> +
>>> +    if (!vmc->no_cpu_topology) {
>>> +        /*
>>> +         * See Linux Documentation/devicetree/bindings/cpu/cpu-topology.txt
>>> +         * In a SMP system, the hierarchy of CPUs is defined through four
>>> +         * entities that are used to describe the layout of physical CPUs
>>> +         * in the system: socket/cluster/core/thread.
>>> +         */
>>> +        qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
>>> +
>>> +        for (cpu = smp_cpus - 1; cpu >= 0; cpu--) {
>>> +            char *cpu_path = g_strdup_printf("/cpus/cpu@%d", cpu);
>>> +            char *map_path;
>>> +
>>> +            if (ms->smp.threads > 1) {
>>> +                map_path = g_strdup_printf(
>>> +                    "/cpus/cpu-map/socket%d/cluster0/core%d/thread%d",
>>> +                    cpu / (ms->smp.cores * ms->smp.threads),
>>> +                    (cpu / ms->smp.threads) % ms->smp.cores,
>>> +                    cpu % ms->smp.threads);
>> It seems that there is some discrepancy between the documentation
>> (Documentation/devicetree/bindings/cpu/cpu-topology.txt) and the
>> actual implementation of DT topology parser for ARM64
>> (function parse_dt_topology() in drivers/base/arch_topology.c).
>>
>> The doc says the cpu-map node's child nodes can be:
>>      - one or more cluster nodes or
>>      - one or more socket nodes in a multi-socket system
>> which means a cpu-map can be defined as two formats such as:
>> 1) cpu-map
>>                     socket0
>>                                  cluster0
>>                                               core0
>>                                               core1
>>                                  cluster1
>>                                               core0
>>                                               core1
>>                     socket1
>>                                  cluster0
>>                                               core0
>>                                               core1
>>                                  cluster1
>>                                               core0
>>                                               core1
>>
>> 2) cpu-map
>>                     cluster0
>>                                  cluster0
>>                                               core0
>>                                               core1
>>                                  cluster1
>>                                               core0
>>                                               core1
>>                     cluster1
>>                                  cluster0
>>                                               core0
>>                                               core1
>>                                  cluster1
>>                                               core0
>>                                               core1
>>
>> But current parser only assumes that there are nested clusters within
>> cpu-map and is unaware of socket, the parser also ignore any information
>> about the nesting of clusters and present the scheduler with a flat list of
>> them. So based on current parser, we will get 4 packages (sockets) totally,
>> 2 cores per package, 1 threads per core from 2), but will get nothing
>> useful from 1).
>>
>> I think the ARM64 kernel DT parser should be optimized so that it's
>> also aware of sockets and can parse both formats of cpu-map. But
>> before this, I think we still have to build the cpu-map in format 2) if
>> we hope to describe topology successfully through DT. :)
> I would stick to implementing this per the documentation and as similarly
> to the ACPI version as possible. I doubt there will be many cases where a
> mach-virt VM is launched with a complex topology description and with DT
> instead of ACPI anyway. And, if there is a use for that, then the Linux
> parser needs to be fixed to match the documentation.
Thanks for the suggestion!

I agree at this point. We may need to keep consistence with the Doc.
The guest kernel should try to enure itself can parse both cpu-map
formats and should also accept the result if it can not get anything
useful from a well defined cpu-map.

Thanks,
Yanan
.
> Thanks,
> drew
>
>> Thanks,
>> Yanan
>> .
>>> +            } else {
>>> +                map_path = g_strdup_printf(
>>> +                    "/cpus/cpu-map/socket%d/cluster0/core%d",
>>> +                    cpu / ms->smp.cores,
>>> +                    cpu % ms->smp.cores);
>>> +            }
>>> +            qemu_fdt_add_path(ms->fdt, map_path);
>>> +            qemu_fdt_setprop_phandle(ms->fdt, map_path, "cpu", cpu_path);
>>> +
>>> +            g_free(map_path);
>>> +            g_free(cpu_path);
>>> +        }
>>> +    }
>>>    }
>>>    static void fdt_add_its_gic_node(VirtMachineState *vms)
> .


