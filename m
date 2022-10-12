Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F895FBF14
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 04:14:27 +0200 (CEST)
Received: from localhost ([::1]:33232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiRGL-0005dx-Oi
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 22:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1oiREt-0004Ac-Jj
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 22:12:55 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:4525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1oiREo-0008W6-64
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 22:12:55 -0400
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MnGJX5psXzlVjR;
 Wed, 12 Oct 2022 10:07:56 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 12 Oct 2022 10:12:30 +0800
CC: <yangyicong@hisilicon.com>, <jonathan.cameron@huawei.com>,
 <linuxarm@huawei.com>, <prime.zeng@huawei.com>, <hesham.almatary@huawei.com>, 
 <ionela.voinescu@arm.com>, <darren@os.amperecomputing.com>, Igor Mammedov
 <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>, Eduardo Habkost
 <eduardo@habkost.net>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH 1/4] hw/acpi/aml-build: Only generate cluster node in PPTT
 when specified
To: "wangyanan (Y)" <wangyanan55@huawei.com>, "Michael S . Tsirkin"
 <mst@redhat.com>
References: <20220922131143.58003-1-yangyicong@huawei.com>
 <20220922131143.58003-2-yangyicong@huawei.com>
 <a3bf8337-b257-8f2c-be3f-25ce59e7a3da@huawei.com>
Message-ID: <1355f1b4-5370-a916-bd79-92cd5af71b9c@huawei.com>
Date: Wed, 12 Oct 2022 10:12:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <a3bf8337-b257-8f2c-be3f-25ce59e7a3da@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=yangyicong@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.934,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Yicong Yang <yangyicong@huawei.com>
From:  Yicong Yang via <qemu-devel@nongnu.org>

On 2022/10/9 14:46, wangyanan (Y) wrote:
> Hi Yicong,
> 
> On 2022/9/22 21:11, Yicong Yang wrote:
>> From: Yicong Yang<yangyicong@hisilicon.com>
>>
>> Currently we'll always generate a cluster node no matter user has
>> specified '-smp clusters=X' or not. Cluster is an optional level
>> and it's unncessary to build it if user don't need. So only generate
>> it when user specify explicitly.
>>
>> Also update the test ACPI tables.
> It would be much more helpful to explain the problem you
> have met in practice without this patch. (maybe have some
> description or a link of the issue in the cover-letter if we
> need a v2).
> 

My problem is related to this but not fully caused by this.

I found my schedule domains are not built as expected with command
`-smp 8` and 4 NUMA nodes. The final schedule domains built look
like below with no NUMA domains built.

[    2.141316] CPU0 attaching sched-domain(s):
[    2.142558]  domain-0: span=0-7 level=MC
[    2.145364]   groups: 0:{ span=0 cap=964 }, 1:{ span=1 cap=914 }, 2:{ span=2 cap=921 }, 3:{ span=3 cap=964 }, 4:{ span=4 cap=925 }, 5:{ span=5 cap=964 }, 6:{ span=6 cap=967 }, 7:{ span=7 cap=967 }
[    2.158357] CPU1 attaching sched-domain(s):
[    2.158964]  domain-0: span=0-7 level=MC

should be:

[    2.008885] CPU0 attaching sched-domain(s):
[    2.009764]  domain-0: span=0-1 level=MC
[    2.012654]   groups: 0:{ span=0 cap=962 }, 1:{ span=1 cap=925 }
[    2.016532]   domain-1: span=0-3 level=NUMA
[    2.017444]    groups: 0:{ span=0-1 cap=1887 }, 2:{ span=2-3 cap=1871 }
[    2.019354]    domain-2: span=0-5 level=NUMA
[    2.019983]     groups: 0:{ span=0-3 cap=3758 }, 4:{ span=4-5 cap=1935 }
[    2.021527]     domain-3: span=0-7 level=NUMA
[    2.022516]      groups: 0:{ span=0-5 mask=0-1 cap=5693 }, 6:{ span=4-7 mask=6-7 cap=3978 }
[...]

It's because the MC level span extends to Cluster level which spans
all the cpus in the system, then the schedule domain building stops
at MC level since it already includes all the cpus.

It makes people confusing that cluster node is generated without
asking for it.

A discussion for the problem:
https://lore.kernel.org/lkml/2c079860-ee82-7719-d3d2-756192f41704@huawei.com/

> In qemu which behaves as like a firmware vendor for VM,
> the ACPI PPTT is built based on the topology info produced
> by machine_parse_smp_config(). And machine_parse_smp_config
> will always calculate a complete topology hierarchy using its
> algorithm, if the user gives an incomplete -smp CLI.
> 

Considering cluster is an optional level and most platforms don't
have it, they may even don't realize this is built and a always
build policy cannot emulate the topology on these platforms.
Also it may influences the build of schedule domains uncousiously
in some cases so...

> I think there are two options for us to chose:
> 1) approach described in this patch
> 2) qemu will always generate a full topology hierarchy in PPTT
> with all the topo members it currently supports. While users
> need to consider the necessity to use an incomplete -smp or
> an complete one according to their specific scenario, and
> should be aware of the kernel behavior resulted from the
> config.
> 

...I'd prefer 1) then users can generate this *only* when they
explicitly know what they want and what they'll get. A full
topology hierachy generation lacks flexibility. Any thought?

> There is some Doc for users to explain how qemu will
> parse user-specified -smp in [1].
> [1] https://www.mankier.com/1/qemu#Options
> 

Thanks!
Yicong

> Thanks,
> Yanan
>> Signed-off-by: Yicong Yang<yangyicong@hisilicon.com>
>> ---
>>   hw/acpi/aml-build.c   | 2 +-
>>   hw/core/machine-smp.c | 3 +++
>>   include/hw/boards.h   | 2 ++
>>   3 files changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>> index e6bfac95c7..aab73af66d 100644
>> --- a/hw/acpi/aml-build.c
>> +++ b/hw/acpi/aml-build.c
>> @@ -2030,7 +2030,7 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>>                   0, socket_id, NULL, 0);
>>           }
>>   -        if (mc->smp_props.clusters_supported) {
>> +        if (mc->smp_props.clusters_supported && ms->smp.build_cluster) {
>>               if (cpus->cpus[n].props.cluster_id != cluster_id) {
>>                   assert(cpus->cpus[n].props.cluster_id > cluster_id);
>>                   cluster_id = cpus->cpus[n].props.cluster_id;
>> diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
>> index b39ed21e65..5d37e8d07a 100644
>> --- a/hw/core/machine-smp.c
>> +++ b/hw/core/machine-smp.c
>> @@ -158,6 +158,9 @@ void machine_parse_smp_config(MachineState *ms,
>>       ms->smp.threads = threads;
>>       ms->smp.max_cpus = maxcpus;
>>   +    if (config->has_clusters)
>> +        ms->smp.build_cluster = true;
>> +
>>       /* sanity-check of the computed topology */
>>       if (sockets * dies * clusters * cores * threads != maxcpus) {
>>           g_autofree char *topo_msg = cpu_hierarchy_to_string(ms);
>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>> index 7b416c9787..24aafc213d 100644
>> --- a/include/hw/boards.h
>> +++ b/include/hw/boards.h
>> @@ -305,6 +305,7 @@ typedef struct DeviceMemoryState {
>>    * @cores: the number of cores in one cluster
>>    * @threads: the number of threads in one core
>>    * @max_cpus: the maximum number of logical processors on the machine
>> + * @build_cluster: build cluster topology or not
>>    */
>>   typedef struct CpuTopology {
>>       unsigned int cpus;
>> @@ -314,6 +315,7 @@ typedef struct CpuTopology {
>>       unsigned int cores;
>>       unsigned int threads;
>>       unsigned int max_cpus;
>> +    bool build_cluster;
>>   } CpuTopology;
>>     /**
> 
> .

