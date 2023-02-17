Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D7069A645
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 08:52:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSvXU-0005k7-W3; Fri, 17 Feb 2023 02:52:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pSvXH-0005j1-Fb
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 02:52:05 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pSvXE-0006uq-JW
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 02:52:03 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4PJ3qM0FsyzRryZ;
 Fri, 17 Feb 2023 15:49:19 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Fri, 17 Feb 2023 15:51:54 +0800
Message-ID: <8278f5ed-bbf4-89a1-79f5-203427a6a882@huawei.com>
Date: Fri, 17 Feb 2023 15:51:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC 41/52] machine: Introduce core_type() hook
To: Zhao Liu <zhao1.liu@linux.intel.com>
CC: <qemu-devel@nongnu.org>, Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi
 <dapeng1.mi@intel.com>, Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo
 <robert.hu@linux.intel.com>, Sean Christopherson <seanjc@google.com>, Like Xu
 <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, "Michael S .
 Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>, Markus
 Armbruster <armbru@redhat.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-42-zhao1.liu@linux.intel.com>
 <9fe2480d-d3e0-3cda-6bed-0132d1bdd1a0@huawei.com>
 <Y+7z/Y4LEmrLGSpC@liuzhao-OptiPlex-7080>
In-Reply-To: <Y+7z/Y4LEmrLGSpC@liuzhao-OptiPlex-7080>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
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

在 2023/2/17 11:26, Zhao Liu 写道:
> On Thu, Feb 16, 2023 at 08:15:23PM +0800, wangyanan (Y) wrote:
>> Date: Thu, 16 Feb 2023 20:15:23 +0800
>> From: "wangyanan (Y)" <wangyanan55@huawei.com>
>> Subject: Re: [RFC 41/52] machine: Introduce core_type() hook
>>
>> Hi Zhao,
>>
>> 在 2023/2/13 17:50, Zhao Liu 写道:
>>> From: Zhao Liu <zhao1.liu@intel.com>
>>>
>>> Since supported core types are architecture specific, we need this hook
>>> to allow archs define its own parsing or validation method.
>>>
>>> As the example, add the x86 core_type() which will be used in "-hybrid"
>>> parameter parsing.
>>>
>>> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
>>> ---
>>>    hw/core/machine-topo.c | 14 ++++++++++++++
>>>    hw/core/machine.c      |  1 +
>>>    hw/i386/x86.c          | 15 +++++++++++++++
>>>    include/hw/boards.h    |  7 +++++++
>>>    4 files changed, 37 insertions(+)
>>>
>>> diff --git a/hw/core/machine-topo.c b/hw/core/machine-topo.c
>>> index 12c05510c1b5..f9ab08a1252e 100644
>>> --- a/hw/core/machine-topo.c
>>> +++ b/hw/core/machine-topo.c
>>> @@ -352,3 +352,17 @@ void machine_parse_smp_config(MachineState *ms,
>>>            return;
>>>        }
>>>    }
>>> +
>>> +/*
>>> + * machine_parse_hybrid_core_type: the default hook to parse hybrid core
>>> + *                                 type corresponding to the coretype
>>> + *                                 string option.
>>> + */
>>> +int machine_parse_hybrid_core_type(MachineState *ms, const char *coretype)
>>> +{
>>> +    if (strcmp(coretype, "") == 0 || strcmp(coretype, "none") == 0) {
>>> +        return 0;
>>> +    }
>>> +
>>> +    return -1;
>>> +}
>> Is it possible that coretype can be NULL?
>> What would *coretype be if the users don't explicitly specify coretype
>> in the command line?
> At present, the coretype field cannot be omitted, which requires other code
> changes to support omission (if omission is required in the future, there
> should be an arch-specific method to supplement the default coretype at the
> same time).
IIUC, we may need to support the handling of omission case at the
beginning. Not all archs have/need the core type concept when they
support hybrid, and if an arch does not have the core type concept,
it's best to forbid it in the CLI and leave the handling to the generic
machine_parse_hybrid_core_type and the arch-specific core_type
hook should be NULL.

Thanks,
Yanan
>
>>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>>> index fad990f49b03..acc32b3be5f6 100644
>>> --- a/hw/core/machine.c
>>> +++ b/hw/core/machine.c
>>> @@ -926,6 +926,7 @@ static void machine_class_init(ObjectClass *oc, void *data)
>>>         * On Linux, each node's border has to be 8MB aligned
>>>         */
>>>        mc->numa_mem_align_shift = 23;
>>> +    mc->core_type = machine_parse_hybrid_core_type;
>>>        object_class_property_add_str(oc, "kernel",
>>>            machine_get_kernel, machine_set_kernel);
>>> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
>>> index f381fdc43180..f58a90359170 100644
>>> --- a/hw/i386/x86.c
>>> +++ b/hw/i386/x86.c
>>> @@ -1569,6 +1569,20 @@ static void machine_set_sgx_epc(Object *obj, Visitor *v, const char *name,
>>>        qapi_free_SgxEPCList(list);
>>>    }
>>> +static int x86_parse_hybrid_core_type(MachineState *ms, const char *coretype)
>>> +{
>>> +    X86HybridCoreType type;
>>> +
>>> +    if (strcmp(coretype, "atom") == 0) {
>>> +        type = INTEL_ATOM_TYPE;
>>> +    } else if (strcmp(coretype, "core") == 0) {
>>> +        type = INTEL_CORE_TYPE;
>>> +    } else {
>>> +        type = INVALID_HYBRID_TYPE;
>>> +    }
>> What about:
>> INTEL_CORE_TYPE_ATOM
>> INTEL_CORE_TYPE_CORE
>> X86_CORE_TYPE_UNKNOWN ?
>> just a suggestion.
> It looks better! Thanks.
>
>> Thanks,
>> Yanan
>>> +    return type;
>>> +}
>>> +
>>>    static void x86_machine_initfn(Object *obj)
>>>    {
>>>        X86MachineState *x86ms = X86_MACHINE(obj);
>>> @@ -1596,6 +1610,7 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
>>>        x86mc->save_tsc_khz = true;
>>>        x86mc->fwcfg_dma_enabled = true;
>>>        nc->nmi_monitor_handler = x86_nmi;
>>> +    mc->core_type = x86_parse_hybrid_core_type;
>>>        object_class_property_add(oc, X86_MACHINE_SMM, "OnOffAuto",
>>>            x86_machine_get_smm, x86_machine_set_smm,
>>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>>> index 9364c90d5f1a..34ec035b5c9f 100644
>>> --- a/include/hw/boards.h
>>> +++ b/include/hw/boards.h
>>> @@ -36,6 +36,7 @@ void machine_set_cpu_numa_node(MachineState *machine,
>>>                                   Error **errp);
>>>    void machine_parse_smp_config(MachineState *ms,
>>>                                  const SMPConfiguration *config, Error **errp);
>>> +int machine_parse_hybrid_core_type(MachineState *ms, const char *coretype);
>>>    /**
>>>     * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices
>>> @@ -199,6 +200,11 @@ typedef struct {
>>>     *    Return the type of KVM corresponding to the kvm-type string option or
>>>     *    computed based on other criteria such as the host kernel capabilities.
>>>     *    kvm-type may be NULL if it is not needed.
>>> + * @core_type:
>>> + *    Return the type of hybrid cores corresponding to the coretype string
>>> + *    option. The default hook only accept "none" or "" since the most generic
>>> + *    core topology should not specify any specific core type. Each arch can
>>> + *    define its own core_type() hook to override the default one.
>>>     * @numa_mem_supported:
>>>     *    true if '--numa node.mem' option is supported and false otherwise
>>>     * @hotplug_allowed:
>>> @@ -237,6 +243,7 @@ struct MachineClass {
>>>        void (*reset)(MachineState *state, ShutdownCause reason);
>>>        void (*wakeup)(MachineState *state);
>>>        int (*kvm_type)(MachineState *machine, const char *arg);
>>> +    int (*core_type)(MachineState *state, const char *type);
>>>        BlockInterfaceType block_default_type;
>>>        int units_per_default_bus;


