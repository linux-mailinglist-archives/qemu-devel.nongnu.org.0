Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CBF3D1D51
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 07:23:43 +0200 (CEST)
Received: from localhost ([::1]:44402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6RBO-0004nA-33
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 01:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6RAK-00046G-HS
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 01:22:37 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6RAH-0001JK-AW
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 01:22:36 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GVgjL6V99zZrZw;
 Thu, 22 Jul 2021 13:19:02 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 22 Jul 2021 13:22:26 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 22 Jul 2021 13:22:25 +0800
Subject: Re: [PATCH for-6.2 v2 07/11] machine: Prefer cores over sockets in
 smp parsing since 6.2
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-8-wangyanan55@huawei.com> <YPT0GcmYohAxJ3da@yekko>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <947f142e-cf59-c7b4-be10-365e94cad162@huawei.com>
Date: Thu, 22 Jul 2021 13:22:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <YPT0GcmYohAxJ3da@yekko>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme716-chm.china.huawei.com (10.1.199.112) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.117,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Greg
 Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/7/19 11:40, David Gibson wrote:
> On Mon, Jul 19, 2021 at 11:20:39AM +0800, Yanan Wang wrote:
>> In the real SMP hardware topology world, it's much more likely that
>> we have high cores-per-socket counts and few sockets totally. While
>> the current preference of sockets over cores in smp parsing results
>> in a virtual cpu topology with low cores-per-sockets counts and a
>> large number of sockets, which is just contrary to the real world.
>>
>> Given that it is better to make the virtual cpu topology be more
>> reflective of the real world and also for the sake of compatibility,
>> we start to prefer cores over sockets over threads in smp parsing
>> since machine type 6.2 for different arches.
>>
>> In this patch, a boolean "smp_prefer_sockets" is added, and we only
>> enable the old preference on older machines and enable the new one
>> since type 6.2 for all arches by using the machine compat mechanism.
>>
>> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ppc parts
>
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
>
> Note that for the pseries machine types, being paravirtual, there is
> essentially no guest visible difference between "cores" and "sockets.
I see. When the difference start to make some sense for the pseries guest,
then I think high-count cores may also be preferred and we will already have
the preference of cores at that time because of today's work.

Thanks,
Yanan
.
>> ---
>>   hw/arm/virt.c              |  1 +
>>   hw/core/machine.c          | 59 +++++++++++++++++++++++++++++---------
>>   hw/i386/pc_piix.c          |  1 +
>>   hw/i386/pc_q35.c           |  1 +
>>   hw/ppc/spapr.c             |  1 +
>>   hw/s390x/s390-virtio-ccw.c |  1 +
>>   include/hw/boards.h        |  1 +
>>   qemu-options.hx            |  4 ++-
>>   8 files changed, 55 insertions(+), 14 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 01165f7f53..7babea40dc 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -2797,6 +2797,7 @@ static void virt_machine_6_1_options(MachineClass *mc)
>>   {
>>       virt_machine_6_2_options(mc);
>>       compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
>> +    mc->smp_prefer_sockets = true;
>>   }
>>   DEFINE_VIRT_MACHINE(6, 1)
>>   
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 63439c4a6d..c074425015 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -744,6 +744,22 @@ void machine_set_cpu_numa_node(MachineState *machine,
>>       }
>>   }
>>   
>> +/*
>> + * smp_parse - Generic function used to parse the given SMP configuration
>> + *
>> + * The topology parameters must be specified equal to or great than one
>> + * or just omitted, explicit configuration like "cpus=0" is not allowed.
>> + * The omitted parameters will be calculated based on the provided ones.
>> + *
>> + * maxcpus will default to the value of cpus if omitted and will be used
>> + * to compute the missing sockets/cores/threads. cpus will be calculated
>> + * from the computed parametrs if omitted.
>> + *
>> + * In calculation of omitted arch-netural sockets/cores/threads, we prefer
>> + * sockets over cores over threads before 6.2, while prefer cores over
>> + * sockets over threads since 6.2 on. The arch-specific dies will directly
>> + * default to 1 if omitted.
>> + */
>>   static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>>   {
>>       MachineClass *mc = MACHINE_GET_CLASS(ms);
>> @@ -772,19 +788,36 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>>   
>>       maxcpus = maxcpus > 0 ? maxcpus : cpus;
>>   
>> -    /* compute missing values, prefer sockets over cores over threads */
>> -    if (sockets == 0) {
>> -        cores = cores > 0 ? cores : 1;
>> -        threads = threads > 0 ? threads : 1;
>> -        sockets = maxcpus / (dies * cores * threads);
>> -        sockets = sockets > 0 ? sockets : 1;
>> -    } else if (cores == 0) {
>> -        threads = threads > 0 ? threads : 1;
>> -        cores = maxcpus / (sockets * dies * threads);
>> -        cores = cores > 0 ? cores : 1;
>> -    } else if (threads == 0) {
>> -        threads = maxcpus / (sockets * dies * cores);
>> -        threads = threads > 0 ? threads : 1;
>> +    /* prefer sockets over cores over threads before 6.2 */
>> +    if (mc->smp_prefer_sockets) {
>> +        if (sockets == 0) {
>> +            cores = cores > 0 ? cores : 1;
>> +            threads = threads > 0 ? threads : 1;
>> +            sockets = maxcpus / (dies * cores * threads);
>> +            sockets = sockets > 0 ? sockets : 1;
>> +        } else if (cores == 0) {
>> +            threads = threads > 0 ? threads : 1;
>> +            cores = maxcpus / (sockets * dies * threads);
>> +            cores = cores > 0 ? cores : 1;
>> +        } else if (threads == 0) {
>> +            threads = maxcpus / (sockets * dies * cores);
>> +            threads = threads > 0 ? threads : 1;
>> +        }
>> +    /* prefer cores over sockets over threads since 6.2 */
>> +    } else {
>> +        if (cores == 0) {
>> +            sockets = sockets > 0 ? sockets : 1;
>> +            threads = threads > 0 ? threads : 1;
>> +            cores = maxcpus / (sockets * dies * threads);
>> +            cores = cores > 0 ? cores : 1;
>> +        } else if (sockets == 0) {
>> +            threads = threads > 0 ? threads : 1;
>> +            sockets = maxcpus / (dies * cores * threads);
>> +            sockets = sockets > 0 ? sockets : 1;
>> +        } else if (threads == 0) {
>> +            threads = maxcpus / (sockets * dies * cores);
>> +            threads = threads > 0 ? threads : 1;
>> +        }
>>       }
>>   
>>       /* use the computed parameters to calculate the omitted cpus */
>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>> index fd5c2277f2..9b811fc6ca 100644
>> --- a/hw/i386/pc_piix.c
>> +++ b/hw/i386/pc_piix.c
>> @@ -432,6 +432,7 @@ static void pc_i440fx_6_1_machine_options(MachineClass *m)
>>       m->is_default = false;
>>       compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
>>       compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
>> +    m->smp_prefer_sockets = true;
>>   }
>>   
>>   DEFINE_I440FX_MACHINE(v6_1, "pc-i440fx-6.1", NULL,
>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>> index b45903b15e..88efb7fde4 100644
>> --- a/hw/i386/pc_q35.c
>> +++ b/hw/i386/pc_q35.c
>> @@ -372,6 +372,7 @@ static void pc_q35_6_1_machine_options(MachineClass *m)
>>       m->alias = NULL;
>>       compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
>>       compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
>> +    m->smp_prefer_sockets = true;
>>   }
>>   
>>   DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index d39fd4e644..a481fade51 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -4702,6 +4702,7 @@ static void spapr_machine_6_1_class_options(MachineClass *mc)
>>   {
>>       spapr_machine_6_2_class_options(mc);
>>       compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
>> +    mc->smp_prefer_sockets = true;
>>   }
>>   
>>   DEFINE_SPAPR_MACHINE(6_1, "6.1", false);
>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>> index 4d25278cf2..b40e647883 100644
>> --- a/hw/s390x/s390-virtio-ccw.c
>> +++ b/hw/s390x/s390-virtio-ccw.c
>> @@ -809,6 +809,7 @@ static void ccw_machine_6_1_class_options(MachineClass *mc)
>>   {
>>       ccw_machine_6_2_class_options(mc);
>>       compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
>> +    mc->smp_prefer_sockets = true;
>>   }
>>   DEFINE_CCW_MACHINE(6_1, "6.1", false);
>>   
>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>> index 2832f0f8aa..8df885c9d2 100644
>> --- a/include/hw/boards.h
>> +++ b/include/hw/boards.h
>> @@ -247,6 +247,7 @@ struct MachineClass {
>>       bool nvdimm_supported;
>>       bool numa_mem_supported;
>>       bool smp_dies_supported;
>> +    bool smp_prefer_sockets;
>>       bool auto_enable_numa;
>>       const char *default_ram_id;
>>   
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 0c9ddc0274..6ef57e838c 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -227,7 +227,9 @@ SRST
>>       from those which are given. Historically preference was given to the
>>       coarsest topology parameters when computing missing values (ie sockets
>>       preferred over cores, which were preferred over threads), however, this
>> -    behaviour is considered liable to change.
>> +    behaviour is considered liable to change. The historical preference of
>> +    sockets over cores over threads works before 6.2, and a new preference
>> +    of cores over sockets over threads starts to work since 6.2 on.
>>   ERST
>>   
>>   DEF("numa", HAS_ARG, QEMU_OPTION_numa,


