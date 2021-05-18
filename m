Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A3B3876F2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:53:03 +0200 (CEST)
Received: from localhost ([::1]:36600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lixLS-0003u7-HX
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lixIl-0001qh-4i; Tue, 18 May 2021 06:50:16 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lixIh-00077S-Jr; Tue, 18 May 2021 06:50:14 -0400
Received: from dggems706-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fkt3M0bl9zQpMT;
 Tue, 18 May 2021 18:46:39 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggems706-chm.china.huawei.com (10.3.19.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 18 May 2021 18:50:08 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 18 May 2021 18:50:07 +0800
Subject: Re: [RFC PATCH v3 3/9] hw/arm/virt: Add cpu-map to device tree
To: Andrew Jones <drjones@redhat.com>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-4-wangyanan55@huawei.com>
 <20210517064140.4cvurykbsofb7y3n@gator.home>
 <5eb2dc87-1c0a-11ae-0a4c-f26c4a90a18d@huawei.com>
 <20210518074641.q6zsjso55akie4o6@gator.home>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <658e0338-a182-4b44-1dc8-aeb30ad97c4c@huawei.com>
Date: Tue, 18 May 2021 18:50:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210518074641.q6zsjso55akie4o6@gator.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme716-chm.china.huawei.com (10.1.199.112) To
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


On 2021/5/18 15:46, Andrew Jones wrote:
> On Mon, May 17, 2021 at 11:00:07PM +0800, wangyanan (Y) wrote:
>> Hi Drew,
>>
>> On 2021/5/17 14:41, Andrew Jones wrote:
>>> On Sun, May 16, 2021 at 06:28:54PM +0800, Yanan Wang wrote:
>>>> From: Andrew Jones <drjones@redhat.com>
>>>>
>>>> Support device tree CPU topology descriptions.
>>>>
>>>> In accordance with the Devicetree Specification, the Linux Doc
>>>> "arm/cpus.yaml" requires that cpus and cpu nodes in the DT are
>>>> present. And we meet the requirement by creating /cpus/cpu@*
>>>> nodes for members within ms->smp.cpus.
>>>>
>>>> Correspondingly, we should also create subnodes in cpu-map for
>>>> the present cpus, each of which relates to an unique cpu node.
>>>>
>>>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>>>> Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
>>>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>>>> ---
>>>>    hw/arm/virt.c | 41 ++++++++++++++++++++++++++++++++++++++++-
>>>>    1 file changed, 40 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>> index c07841e3a4..e5dcdebdbc 100644
>>>> --- a/hw/arm/virt.c
>>>> +++ b/hw/arm/virt.c
>>>> @@ -349,10 +349,11 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>>>>        int cpu;
>>>>        int addr_cells = 1;
>>>>        const MachineState *ms = MACHINE(vms);
>>>> +    const VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>>>>        int smp_cpus = ms->smp.cpus;
>>>>        /*
>>>> -     * From Documentation/devicetree/bindings/arm/cpus.txt
>>>> +     *  See Linux Documentation/devicetree/bindings/arm/cpus.yaml
>>> Rather than aligning the top line with the lower lines, we could remove
>>> the extra space from the lower lines. Or, leave the formatting as it was,
>>> by putting 'See' where 'From' was, like I did in my original patch.
>> I think I prefer removing the extra space from the lower lines, which is
>> the right thing to do.
> OK
>
>>>>         *  On ARM v8 64-bit systems value should be set to 2,
>>>>         *  that corresponds to the MPIDR_EL1 register size.
>>>>         *  If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
>>>> @@ -405,8 +406,46 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>>>>                    ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
>>>>            }
>>>> +        if (!vmc->no_cpu_topology) {
>>>> +            qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle",
>>>> +                                  qemu_fdt_alloc_phandle(ms->fdt));
>>>> +        }
>>>> +
>>>>            g_free(nodename);
>>>>        }
>>>> +
>>>> +    if (!vmc->no_cpu_topology) {
>>>> +        /*
>>>> +         * See Linux Documentation/devicetree/bindings/cpu/cpu-topology.txt
>>>> +         * In a SMP system, the hierarchy of CPUs is defined through four
>>>> +         * entities that are used to describe the layout of physical CPUs
>>> s/entities/levels/
>> Above comment was completely from Linux Doc cpu-topology.txt. See [1].
>> I think entities may be more reasonable than levels here, since there can be
>> multiple levels of clusters in cpu-map which makes the total not four.
> OK
>
>> [1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/cpu/cpu-topology.txt
>>>> +         * in the system: socket/cluster/core/thread.
>>> The comment says there are four levels including 'cluster', but there's no
>>> 'cluster' below.
>> According to Doc [1] (line 114), a socket node's child nodes must be
>> *one or more* cluster nodes which means cluster is mandatory to be
>> socket's child in DT.
>>
>> So I think maybe we should just keep the comment as-is, and change
>> the map-path from /cpus/cpu-map/socket*/cores*/threads* to
>> /cpus/cpu-map/socket*/cluster0/cores*/threads* in this patch?
> I agree. In fact, that's how I implemented it myself[1]
>
> [1] https://github.com/rhdrjones/qemu/commit/35feecdd43475608c8f55973a0c159eac4aafefd
Ok, will fix. Thanks!
> Thanks,
> drew
>
> .

