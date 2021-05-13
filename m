Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8483A37F374
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 09:16:37 +0200 (CEST)
Received: from localhost ([::1]:39410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh5aG-0004s9-LZ
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 03:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lh5ZB-0003xx-KX; Thu, 13 May 2021 03:15:29 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lh5Z6-0007iy-Sq; Thu, 13 May 2021 03:15:29 -0400
Received: from dggeml752-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FgjWs2f2fz5yHx;
 Thu, 13 May 2021 15:11:53 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggeml752-chm.china.huawei.com (10.1.199.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 13 May 2021 15:15:16 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 13 May 2021 15:15:15 +0800
Subject: Re: [RFC PATCH v2 2/6] hw/arm/virt: DT: Add cpu-map
To: Andrew Jones <drjones@redhat.com>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-3-wangyanan55@huawei.com>
 <20210513065817.duqlblhcmje2hpnv@gator>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <f968541f-53d4-78b7-dbd1-ec9cba149598@huawei.com>
Date: Thu, 13 May 2021 15:15:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210513065817.duqlblhcmje2hpnv@gator>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme720-chm.china.huawei.com (10.1.199.116) To
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
 qemu-devel@nongnu.org, Shannon
 Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 yangyicong@huawei.com, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/5/13 14:58, Andrew Jones wrote:
> On Tue, Apr 13, 2021 at 04:07:41PM +0800, Yanan Wang wrote:
>> From: Andrew Jones <drjones@redhat.com>
>>
>> Support device tree CPU topology descriptions.
>>
>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/arm/virt.c         | 41 ++++++++++++++++++++++++++++++++++++++++-
>>   include/hw/arm/virt.h |  1 +
>>   2 files changed, 41 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 9f01d9041b..f4ae60ded9 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -352,10 +352,11 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>>       int cpu;
>>       int addr_cells = 1;
>>       const MachineState *ms = MACHINE(vms);
>> +    const VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>>       int smp_cpus = ms->smp.cpus;
>>   
>>       /*
>> -     * From Documentation/devicetree/bindings/arm/cpus.txt
>> +     *  See Linux Documentation/devicetree/bindings/arm/cpus.yaml
>>        *  On ARM v8 64-bit systems value should be set to 2,
>>        *  that corresponds to the MPIDR_EL1 register size.
>>        *  If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
>> @@ -408,8 +409,45 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>>                   ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
>>           }
>>   
>> +        if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
> We should probably always generate the cpu-map, like we agreed to always
> generate the PPTT.
Ok, I will remove smp.cpus check for cpu-map too.
Single cpu node, corresponding to single cpu-map path also works.
> If, for some reason, we don't want to generate the
> cpu-map for uniprocessor systems, then we should actually be checking
> ms->smp.maxcpus here (and below) to be sure it's uniprocessor.
Right, it's max cpus that ought to be checked but not smp cpus.

Thanks,
Yanan
> Thanks,
> drew
>
>> +            qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle",
>> +                                  qemu_fdt_alloc_phandle(ms->fdt));
>> +        }
>> +
>>           g_free(nodename);
>>       }
>> +
>> +    if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
>> +        /*
>> +         * See Linux Documentation/devicetree/bindings/cpu/cpu-topology.txt
>> +         * In a SMP system, the hierarchy of CPUs is defined through four
>> +         * entities that are used to describe the layout of physical CPUs
>> +         * in the system: socket/cluster/core/thread.
>> +         */
>> +        qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
>> +
>> +        for (cpu = ms->smp.cpus - 1; cpu >= 0; cpu--) {
>> +            char *cpu_path = g_strdup_printf("/cpus/cpu@%d", cpu);
>> +            char *map_path;
>> +
>> +            if (ms->smp.threads > 1) {
>> +                map_path = g_strdup_printf(
>> +                    "/cpus/cpu-map/%s%d/%s%d/%s%d",
>> +                    "socket", cpu / (ms->smp.cores * ms->smp.threads),
>> +                    "core", (cpu / ms->smp.threads) % ms->smp.cores,
>> +                    "thread", cpu % ms->smp.threads);
>> +            } else {
>> +                map_path = g_strdup_printf(
>> +                    "/cpus/cpu-map/%s%d/%s%d",
>> +                    "socket", cpu / ms->smp.cores,
>> +                    "core", cpu % ms->smp.cores);
>> +            }
>> +            qemu_fdt_add_path(ms->fdt, map_path);
>> +            qemu_fdt_setprop_phandle(ms->fdt, map_path, "cpu", cpu_path);
>> +            g_free(map_path);
>> +            g_free(cpu_path);
>> +        }
>> +    }
>>   }
>>   
>>   static void fdt_add_its_gic_node(VirtMachineState *vms)
>> @@ -2769,6 +2807,7 @@ static void virt_machine_5_2_options(MachineClass *mc)
>>       virt_machine_6_0_options(mc);
>>       compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
>>       vmc->no_secure_gpio = true;
>> +    vmc->no_cpu_topology = true;
>>   }
>>   DEFINE_VIRT_MACHINE(5, 2)
>>   
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index 921416f918..4a4b98e4a7 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -129,6 +129,7 @@ struct VirtMachineClass {
>>       bool no_kvm_steal_time;
>>       bool acpi_expose_flash;
>>       bool no_secure_gpio;
>> +    bool no_cpu_topology;
>>   };
>>   
>>   struct VirtMachineState {
>> -- 
>> 2.19.1
>>
> .

