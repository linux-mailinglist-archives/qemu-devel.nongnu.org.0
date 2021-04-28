Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DF236D250
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 08:40:08 +0200 (CEST)
Received: from localhost ([::1]:34972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbdrh-0002o4-JI
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 02:40:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lbdoK-0000Gi-7p; Wed, 28 Apr 2021 02:36:36 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lbdoH-0005Sf-EO; Wed, 28 Apr 2021 02:36:36 -0400
Received: from dggeml703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FVTPC1D7MzYfBX;
 Wed, 28 Apr 2021 14:34:07 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggeml703-chm.china.huawei.com (10.3.17.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 28 Apr 2021 14:36:24 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 28 Apr 2021 14:36:21 +0800
Subject: Re: [RFC PATCH v2 2/6] hw/arm/virt: DT: Add cpu-map
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, Andrew Jones
 <drjones@redhat.com>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-3-wangyanan55@huawei.com>
 <648ff988-35f6-1857-2194-0d3e11e0d15c@redhat.com>
 <20210427100442.elz3bjgl6mcntevc@gator.home>
 <afe6dbd6-d026-3fd4-b794-01fe566e27a3@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <942cefdf-6d7c-8463-48b5-108b789988ae@huawei.com>
Date: Wed, 28 Apr 2021 14:36:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <afe6dbd6-d026-3fd4-b794-01fe566e27a3@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme713-chm.china.huawei.com (10.1.199.109) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
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
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 prime.zeng@hisilicon.com, yangyicong@huawei.com, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/4/27 20:36, Philippe Mathieu-Daudé wrote:
> On 4/27/21 12:04 PM, Andrew Jones wrote:
>> On Tue, Apr 27, 2021 at 11:47:17AM +0200, Philippe Mathieu-Daudé wrote:
>>> Hi Yanan, Drew,
>>>
>>> On 4/13/21 10:07 AM, Yanan Wang wrote:
>>>> From: Andrew Jones <drjones@redhat.com>
>>>>
>>>> Support device tree CPU topology descriptions.
>>>>
>>>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>>>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>>>> ---
>>>>   hw/arm/virt.c         | 41 ++++++++++++++++++++++++++++++++++++++++-
>>>>   include/hw/arm/virt.h |  1 +
>>>>   2 files changed, 41 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>> index 9f01d9041b..f4ae60ded9 100644
>>>> --- a/hw/arm/virt.c
>>>> +++ b/hw/arm/virt.c
>>>> @@ -352,10 +352,11 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>>>>       int cpu;
>>>>       int addr_cells = 1;
>>>>       const MachineState *ms = MACHINE(vms);
>>>> +    const VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>>>>       int smp_cpus = ms->smp.cpus;
>>>>   
>>>>       /*
>>>> -     * From Documentation/devicetree/bindings/arm/cpus.txt
>>>> +     *  See Linux Documentation/devicetree/bindings/arm/cpus.yaml
>>>>        *  On ARM v8 64-bit systems value should be set to 2,
>>>>        *  that corresponds to the MPIDR_EL1 register size.
>>>>        *  If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
>>>> @@ -408,8 +409,45 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>>>>                   ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
>>>>           }
>>>>   
>>>> +        if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
>>>> +            qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle",
>>>> +                                  qemu_fdt_alloc_phandle(ms->fdt));
>>>> +        }
>>>> +
>>>>           g_free(nodename);
>>>>       }
>>>> +
>>>> +    if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
>>>> +        /*
>>>> +         * See Linux Documentation/devicetree/bindings/cpu/cpu-topology.txt
>>>> +         * In a SMP system, the hierarchy of CPUs is defined through four
>>>> +         * entities that are used to describe the layout of physical CPUs
>>>> +         * in the system: socket/cluster/core/thread.
>>>> +         */
>>>> +        qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
>>>> +
>>>> +        for (cpu = ms->smp.cpus - 1; cpu >= 0; cpu--) {
>>>> +            char *cpu_path = g_strdup_printf("/cpus/cpu@%d", cpu);
>>>> +            char *map_path;
>>>> +
>>>> +            if (ms->smp.threads > 1) {
>>>> +                map_path = g_strdup_printf(
>>>> +                    "/cpus/cpu-map/%s%d/%s%d/%s%d",
>>>> +                    "socket", cpu / (ms->smp.cores * ms->smp.threads),
>>>> +                    "core", (cpu / ms->smp.threads) % ms->smp.cores,
>>>> +                    "thread", cpu % ms->smp.threads);
>>>> +            } else {
>>>> +                map_path = g_strdup_printf(
>>>> +                    "/cpus/cpu-map/%s%d/%s%d",
>>>> +                    "socket", cpu / ms->smp.cores,
>>>> +                    "core", cpu % ms->smp.cores);
>>>> +            }
>>>> +            qemu_fdt_add_path(ms->fdt, map_path);
>>>> +            qemu_fdt_setprop_phandle(ms->fdt, map_path, "cpu", cpu_path);
>>>> +            g_free(map_path);
>>>> +            g_free(cpu_path);
>>>> +        }
>>>> +    }
>>>>   }
>>>>   
>>>>   static void fdt_add_its_gic_node(VirtMachineState *vms)
>>>> @@ -2769,6 +2807,7 @@ static void virt_machine_5_2_options(MachineClass *mc)
>>>>       virt_machine_6_0_options(mc);
>>>>       compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
>>>>       vmc->no_secure_gpio = true;
>>>> +    vmc->no_cpu_topology = true;
>>> Bare with me because "machine versioning" is something new to me, I was
>>> expecting it to be only related to migrated fields.
>>> Why do we need to care about not adding the FDT node in older machines?
>>> Shouldn't the guest skip unknown FDT nodes?
>> It probably should, the question is whether it would. Also, the nodes may
>> not be unknown, so the guest will read the information and set up its
>> topology as instructed. That topology may not be the same as what was
>> getting used by default without the topology description. It's possible
>> that a user's application has a dependency on the topology and if that
>> topology gets changed under its feat it'll behave differently.
> [*]
>
> I see.
>
>> In short, machine versioning isn't just about vmstate, it's also about
>> keeping a machine type looking the same to the guest.
> Yes, TIL.
>
>> Now, it's possible that we're being overly cautious here, but this compat
>> variable doesn't complicate code too much. So I think I'd prefer to use it
>> than not.
> No problem. Could you or Yanan add your first paragraph ([*], reworded
> in the commit description? I don't think a comment in the code is
> useful, but having it in the commit is helpful IMO.
Hi Philippe,

Of course. I think I can do this for the commit description.

Thanks,
Yanan
> Thanks,
>
> Phil.
>
> .

