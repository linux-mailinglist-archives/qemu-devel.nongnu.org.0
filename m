Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E840169A7DC
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 10:09:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSwjU-0003EH-SR; Fri, 17 Feb 2023 04:08:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pSwjS-0003Ca-9m
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 04:08:42 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pSwjO-0005e0-Qb
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 04:08:42 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4PJ5ZF5jmvzrS1Z;
 Fri, 17 Feb 2023 17:08:05 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Fri, 17 Feb 2023 17:08:31 +0800
Message-ID: <fedeb88f-98bd-874c-bb7d-5f771f8d203f@huawei.com>
Date: Fri, 17 Feb 2023 17:08:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH RESEND 18/18] i386: Add new property to control L2 cache
 topo in CPUID.04H
To: Zhao Liu <zhao1.liu@linux.intel.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
CC: <qemu-devel@nongnu.org>, Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi
 <dapeng1.mi@intel.com>, Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo
 <robert.hu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, Like Xu
 <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, "Michael S .
 Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>, Markus
 Armbruster <armbru@redhat.com>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
 <20230213093625.158170-19-zhao1.liu@linux.intel.com>
 <f88368fe-2ef1-2f54-7afe-646ec4d11460@huawei.com>
 <Y+71/BXqsixQMGFV@liuzhao-OptiPlex-7080>
 <05984e8b-f710-9809-5495-84b0dade686f@huawei.com>
 <Y+8sLZLuXBG9Lrzs@liuzhao-OptiPlex-7080>
In-Reply-To: <Y+8sLZLuXBG9Lrzs@liuzhao-OptiPlex-7080>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.351,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

在 2023/2/17 15:26, Zhao Liu 写道:
> On Fri, Feb 17, 2023 at 12:07:01PM +0800, wangyanan (Y) wrote:
>> Date: Fri, 17 Feb 2023 12:07:01 +0800
>> From: "wangyanan (Y)" <wangyanan55@huawei.com>
>> Subject: Re: [PATCH RESEND 18/18] i386: Add new property to control L2
>>   cache topo in CPUID.04H
>>
>> 在 2023/2/17 11:35, Zhao Liu 写道:
>>> On Thu, Feb 16, 2023 at 09:14:54PM +0800, wangyanan (Y) wrote:
>>>> Date: Thu, 16 Feb 2023 21:14:54 +0800
>>>> From: "wangyanan (Y)" <wangyanan55@huawei.com>
>>>> Subject: Re: [PATCH RESEND 18/18] i386: Add new property to control L2
>>>>    cache topo in CPUID.04H
>>>>
>>>> 在 2023/2/13 17:36, Zhao Liu 写道:
>>>>> From: Zhao Liu <zhao1.liu@intel.com>
>>>>>
>>>>> The property x-l2-cache-topo will be used to change the L2 cache
>>>>> topology in CPUID.04H.
>>>>>
>>>>> Now it allows user to set the L2 cache is shared in core level or
>>>>> cluster level.
>>>>>
>>>>> If user passes "-cpu x-l2-cache-topo=[core|cluster]" then older L2 cache
>>>>> topology will be overrided by the new topology setting.
>>>> Currently x-l2-cache-topo only defines the share level *globally*.
>>> Yes, will set for all CPUs.
>>>
>>>> I'm thinking how we can make the property more powerful so that it
>>>> can specify which CPUs share l2 on core level and which CPUs share
>>>> l2 on cluster level.
>>>>
>>>> What would Intel's Hybrid CPUs do? Determine the l2 share level
>>>> is core or cluster according to the CPU core type (Atom or Core)?
>>>> While ARM does not have the core type concept but have CPUs
>>>> that l2 is shared on different levels in the same system.
>>> For example, Alderlake's "core" shares 1 L2 per core and every 4 "atom"s
>>> share 1 L2. For this case, we can set the topology as:
>>>
>>> cluster0 has 1 "core" and cluster1 has 4 "atom". Then set L2 shared on
>>> cluster level.
>>>
>>> Since cluster0 has only 1 "core" type core, then L2 per "core" works.
>>>
>>> Not sure if this idea can be applied to arm?
>> For a CPU topopoly where we have 2 clusters totally, 2 cores in cluster0
>> have their own L1/L2 cache and 2 threads in each core, 4 cores in cluster1
>> share one L2 cache and 1 thread in each core. The global way does not
>> work well.
>>
>> What about defining something general, which looks like -numa config:
>> -cache-topo cache=l2, share_level="core", cpus='0-3'
>> -cache-topo cache=l2, share_level="cluster", cpus='4-7'
> Hi Yanan, here it may be necessary to check whether the cpu index set
> in "cpus" is reasonable through the specific cpu topology.
Yes, the validity of the cache topo configs from the users should be
check in machine_parse_cache_topo ( if we will have this func).
It's not a big deal, we always need the validity checks.

In summary:
1、There can not be the same cpus in different "cpus" list.
2、A combination of all the "cpus" list should *just* cover all the CPUs
in the machine
3、Most importantly, cpus in the same cluster must be set with the
same cache "share_level" (core or cluster) and cpus in the same core
must also be set with the same cache "share_level".
> For example, core0 has 2 CPUs: cpu0 and cpu1, and core1 has 2 CPUs: cpu2
> and cpu3, then set l2 as:
>
> -cache-topo cache=l2, share_level="core", cpus='0-2'
> -cache-topo cache=l2, share_level="core", cpus='3'
>
> Whether this command is legal depends on the meaning we give to the
> parameter "cpu":
s/cpus/cpu.
It means all the afftected CPUs, e.g, the second case.
> 1. If "cpu" means all cpus share the cache set in this command, then
> this command should fail since cpu2 and cpu3 are in a core.
>
> 2. If "cpu" means the affected cpus, then this command should find the
> cores they belong to according to the cpu topology, and set L2 for those
> cores. This command may return success.
>
> What about removing share_level and ask "cpu" to mean all the sharing
> cpus to avoid checking the cpu topology?
>
> Then the above example should be:
>
> -cache-topo cache=l2, cpus='0-1'
> -cache-topo cache=l2, cpus='2-3'
Sorry, I dont understand how we will know the cache share_level of
cpus '0-1' or '2-3'. What will the CLIs will be like if we change the
belows CLIs by removing the "share_level" params.

-cache-topo cache=l2, share_level="core", cpus='0-3'
-cache-topo cache=l2, share_level="cluster", cpus='4-7'
> This decouples cpu topology and cache topology completely and very
> simple. In this way, determining the cache by specifying the shared cpu
> is similar to that in x86 CPUID.04H.
>
> But the price of simplicity is we may build a cache topology that doesn't
> match the reality.
>
> But if the cache topology must be set based on the cpu topology, another
> way is consider specifying the cache when setting the topology
> structure, which can be based on @Daniel's format [1]:
>
>    -object cpu-socket,id=sock0,cache=l3
>    -object cpu-die,id=die0,parent=sock0
>    -object cpu-cluster,id=cluster0,parent=die0
>    -object cpu-cluster,id=cluster1,parent=die0,cache=l2
>    -object x86-cpu-model-core,id=cpu0,parent=cluster0,threads=2,cache=l1i,lid,l2
>    -object x86-cpu-model-atom,id=cpu1,parent=cluster1,cache=l1i,lid
>    -object x86-cpu-model-atom,id=cpu2,parent=cluster1,cache=l1i,l1d
>
> Then from this command, cpu0 has a l2, and cpu1 and cpu2 shares a l2
> (the l2 is inserted in cluster1).
>
> This whole process is like when designing or building a CPU, the user
> decides where to insert the caches. The advantage is that it is easier
> to verify the rationality and is intuitive. But complicated.
Yeah, this is also a way.
Most of the concern is that it will not be easy/readable to extand the
cache configs, for example if we ever want to support custom cache size,
cache type or other cache properties in the future. And yes, will also
complex the -objects by making them huge.

I think keeping cache and cpu configs decouped will leave simplicity
to the users, just like we keep numa resources config from cpu
topology currently.

On the other hand, -cache-topo is not just for hybrid, it's also for
current smp, which make it inappropriate to bind -cache-topo
with hybrid case. For example, "-cache-topo name=l2, share_level=cluster"
will indicates that l2 cache is shared on cluster level globally. And 
this is
"x-l2-cache-topo" in this patch does.

Thanks,
Yanan
> (Also CC @Daniel for comments).
>
> [1]: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg03320.html
>
> Thanks,
> Zhao
>
>> If we ever want to support custom share-level for L3/L1, no extra work
>> is needed. We can also extend the CLI to support custom cache size, etc..
>>
>> If you thinks this a good idea to explore, I can work on it, since I'm
>> planing to add support cache topology for ARM.
>>
>> Thanks,
>> Yanan
>>>> Thanks,
>>>> Yanan
>>>>> Here we expose to user "cluster" instead of "module", to be consistent
>>>>> with "cluster-id" naming.
>>>>>
>>>>> Since CPUID.04H is used by intel CPUs, this property is available on
>>>>> intel CPUs as for now.
>>>>>
>>>>> When necessary, it can be extended to CPUID.8000001DH for amd CPUs.
>>>>>
>>>>> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
>>>>> ---
>>>>>     target/i386/cpu.c | 33 ++++++++++++++++++++++++++++++++-
>>>>>     target/i386/cpu.h |  2 ++
>>>>>     2 files changed, 34 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>>>>> index 5816dc99b1d4..cf84c720a431 100644
>>>>> --- a/target/i386/cpu.c
>>>>> +++ b/target/i386/cpu.c
>>>>> @@ -240,12 +240,15 @@ static uint32_t max_processor_ids_for_cache(CPUCacheInfo *cache,
>>>>>         case CORE:
>>>>>             num_ids = 1 << apicid_core_offset(topo_info);
>>>>>             break;
>>>>> +    case MODULE:
>>>>> +        num_ids = 1 << apicid_module_offset(topo_info);
>>>>> +        break;
>>>>>         case DIE:
>>>>>             num_ids = 1 << apicid_die_offset(topo_info);
>>>>>             break;
>>>>>         default:
>>>>>             /*
>>>>> -         * Currently there is no use case for SMT, MODULE and PACKAGE, so use
>>>>> +         * Currently there is no use case for SMT and PACKAGE, so use
>>>>>              * assert directly to facilitate debugging.
>>>>>              */
>>>>>             g_assert_not_reached();
>>>>> @@ -6633,6 +6636,33 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
>>>>>             env->cache_info_amd.l3_cache = &legacy_l3_cache;
>>>>>         }
>>>>> +    if (cpu->l2_cache_topo_level) {
>>>>> +        /*
>>>>> +         * FIXME: Currently only supports changing CPUID[4] (for intel), and
>>>>> +         * will support changing CPUID[0x8000001D] when necessary.
>>>>> +         */
>>>>> +        if (!IS_INTEL_CPU(env)) {
>>>>> +            error_setg(errp, "only intel cpus supports x-l2-cache-topo");
>>>>> +            return;
>>>>> +        }
>>>>> +
>>>>> +        if (!strcmp(cpu->l2_cache_topo_level, "core")) {
>>>>> +            env->cache_info_cpuid4.l2_cache->share_level = CORE;
>>>>> +        } else if (!strcmp(cpu->l2_cache_topo_level, "cluster")) {
>>>>> +            /*
>>>>> +             * We expose to users "cluster" instead of "module", to be
>>>>> +             * consistent with "cluster-id" naming.
>>>>> +             */
>>>>> +            env->cache_info_cpuid4.l2_cache->share_level = MODULE;
>>>>> +        } else {
>>>>> +            error_setg(errp,
>>>>> +                       "x-l2-cache-topo doesn't support '%s', "
>>>>> +                       "and it only supports 'core' or 'cluster'",
>>>>> +                       cpu->l2_cache_topo_level);
>>>>> +            return;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>>     #ifndef CONFIG_USER_ONLY
>>>>>         MachineState *ms = MACHINE(qdev_get_machine());
>>>>>         qemu_register_reset(x86_cpu_machine_reset_cb, cpu);
>>>>> @@ -7135,6 +7165,7 @@ static Property x86_cpu_properties[] = {
>>>>>                          false),
>>>>>         DEFINE_PROP_BOOL("x-intel-pt-auto-level", X86CPU, intel_pt_auto_level,
>>>>>                          true),
>>>>> +    DEFINE_PROP_STRING("x-l2-cache-topo", X86CPU, l2_cache_topo_level),
>>>>>         DEFINE_PROP_END_OF_LIST()
>>>>>     };
>>>>> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
>>>>> index 5a955431f759..aa7e96c586c7 100644
>>>>> --- a/target/i386/cpu.h
>>>>> +++ b/target/i386/cpu.h
>>>>> @@ -1987,6 +1987,8 @@ struct ArchCPU {
>>>>>         int32_t thread_id;
>>>>>         int32_t hv_max_vps;
>>>>> +
>>>>> +    char *l2_cache_topo_level;
>>>>>     };


