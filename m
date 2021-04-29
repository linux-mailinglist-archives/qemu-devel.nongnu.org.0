Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF9A36E2EC
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 03:23:49 +0200 (CEST)
Received: from localhost ([::1]:46248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbvP9-0006lE-UW
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 21:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lbvNp-0006Du-Rt; Wed, 28 Apr 2021 21:22:25 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lbvNl-0000Gu-5C; Wed, 28 Apr 2021 21:22:25 -0400
Received: from dggeml755-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FVyLF3FMlz19JnD;
 Thu, 29 Apr 2021 09:18:13 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggeml755-chm.china.huawei.com (10.1.199.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 29 Apr 2021 09:22:11 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 29 Apr 2021 09:22:10 +0800
Subject: Re: [RFC PATCH v2 1/4] vl.c: Add -smp, clusters=* command line
 support for ARM cpu
To: Andrew Jones <drjones@redhat.com>
References: <20210413083147.34236-1-wangyanan55@huawei.com>
 <20210413083147.34236-2-wangyanan55@huawei.com>
 <20210428102353.cfjvzss56c4zwb4y@gator>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <bd09a979-d940-bd29-778a-97f537b5fe1a@huawei.com>
Date: Thu, 29 Apr 2021 09:22:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210428102353.cfjvzss56c4zwb4y@gator>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme707-chm.china.huawei.com (10.1.199.103) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S .
 Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com, qemu-devel@nongnu.org,
 yangyicong@huawei.com, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 prime.zeng@hisilicon.com, Igor
 Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/4/28 18:23, Andrew Jones wrote:
> On Tue, Apr 13, 2021 at 04:31:44PM +0800, Yanan Wang wrote:
>> A cluster means a group of cores that share some resources (e.g. cache)
>> among them under the LLC. For example, ARM64 server chip Kunpeng 920 has
>> 6 or 8 clusters in each NUMA, and each cluster has 4 cores. All clusters
>> share L3 cache data while cores within each cluster share the L2 cache.
>>
>> The cache affinity of cluster has been proved to improve the Linux kernel
>> scheduling performance and a patchset has been posted, in which a general
>> sched_domain for clusters was added and a cluster level was added in the
>> arch-neutral cpu topology struct like below.
>> struct cpu_topology {
>>      int thread_id;
>>      int core_id;
>>      int cluster_id;
>>      int package_id;
>>      int llc_id;
>>      cpumask_t thread_sibling;
>>      cpumask_t core_sibling;
>>      cpumask_t cluster_sibling;
>>      cpumask_t llc_sibling;
>> }
>>
>> Also the Kernel Doc: Documentation/devicetree/bindings/cpu/cpu-topology.txt
>> defines a four-level CPU topology hierarchy like socket/cluster/core/thread.
>> According to the context, a socket node's child nodes must be one or more
>> cluster nodes and a cluster node's child nodes must be one or more cluster
>> nodes/one or more core nodes.
>>
>> So let's add the -smp, clusters=* command line support for ARM cpu, so that
>> future guest os could make use of cluster cpu topology for better scheduling
>> performance. For ARM machines, a four-level cpu hierarchy can be defined and
>> it will be sockets/clusters/cores/threads. Because we only support clusters
>> for ARM cpu currently, a new member "unsigned smp_clusters" is added to the
>> VirtMachineState structure.
>>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   include/hw/arm/virt.h |  1 +
>>   qemu-options.hx       | 26 +++++++++++++++-----------
>>   softmmu/vl.c          |  3 +++
>>   3 files changed, 19 insertions(+), 11 deletions(-)
>>
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index 4a4b98e4a7..5d5d156924 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -155,6 +155,7 @@ struct VirtMachineState {
>>       char *pciehb_nodename;
>>       const int *irqmap;
>>       int fdt_size;
>> +    unsigned smp_clusters;
>>       uint32_t clock_phandle;
>>       uint32_t gic_phandle;
>>       uint32_t msi_phandle;
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index fd21002bd6..65343ea23c 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -184,25 +184,29 @@ SRST
>>   ERST
>>   
>>   DEF("smp", HAS_ARG, QEMU_OPTION_smp,
>> -    "-smp [cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,dies=dies][,sockets=sockets]\n"
>> +    "-smp [cpus=]n[,maxcpus=cpus][,clusters=clusters][,cores=cores][,threads=threads][,dies=dies][,sockets=sockets]\n"
> Please put clusters directly in front of dies in the above list, like it
> is in the list description below
>
>>       "                set the number of CPUs to 'n' [default=1]\n"
>>       "                maxcpus= maximum number of total cpus, including\n"
>>       "                offline CPUs for hotplug, etc\n"
>> -    "                cores= number of CPU cores on one socket (for PC, it's on one die)\n"
>> +    "                cores= number of CPU cores on one socket\n"
>> +    "                (it's on one die for PC, and on one cluster for ARM)\n"
>>       "                threads= number of threads on one CPU core\n"
>> +    "                clusters= number of CPU clusters on one socket (for ARM only)\n"
>>       "                dies= number of CPU dies on one socket (for PC only)\n"
>>       "                sockets= number of discrete sockets in the system\n",
>>           QEMU_ARCH_ALL)
>>   SRST
>> -``-smp [cpus=]n[,cores=cores][,threads=threads][,dies=dies][,sockets=sockets][,maxcpus=maxcpus]``
>> -    Simulate an SMP system with n CPUs. On the PC target, up to 255 CPUs
>> -    are supported. On Sparc32 target, Linux limits the number of usable
>> -    CPUs to 4. For the PC target, the number of cores per die, the
>> -    number of threads per cores, the number of dies per packages and the
>> -    total number of sockets can be specified. Missing values will be
>> -    computed. If any on the three values is given, the total number of
>> -    CPUs n can be omitted. maxcpus specifies the maximum number of
>> -    hotpluggable CPUs.
>> +``-smp [cpus=]n[,maxcpus=cpus][,clusters=clusters][,cores=cores][,threads=threads][,dies=dies][,sockets=sockets]``
> Also move clusters in this list over in front of dies to match the
> suggested change above.
Thanks, I will change the place.

Thanks,
Yanan
>> +    Simulate an SMP system with n CPUs. On the PC target, up to 255
>> +    CPUs are supported. On the Sparc32 target, Linux limits the number
>> +    of usable CPUs to 4. For the PC target, the number of threads per
>> +    core, the number of cores per die, the number of dies per package
>> +    and the total number of sockets can be specified. For the ARM target,
>> +    the number of threads per core, the number of cores per cluster, the
>> +    number of clusters per socket and the total number of sockets can be
>> +    specified. And missing values will be computed. If any of the five
>> +    values is given, the total number of CPUs n can be omitted. Maxcpus
>> +    specifies the maximum number of hotpluggable CPUs.
>>   ERST
>>   
>>   DEF("numa", HAS_ARG, QEMU_OPTION_numa,
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index aadb526138..46f5b6b575 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -720,6 +720,9 @@ static QemuOptsList qemu_smp_opts = {
>>           }, {
>>               .name = "dies",
>>               .type = QEMU_OPT_NUMBER,
>> +        }, {
>> +            .name = "clusters",
>> +            .type = QEMU_OPT_NUMBER,
>>           }, {
>>               .name = "cores",
>>               .type = QEMU_OPT_NUMBER,
>> -- 
>> 2.19.1
>>
> Thanks,
> drew
>
> .

