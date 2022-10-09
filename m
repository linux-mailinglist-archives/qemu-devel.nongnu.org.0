Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED8B5F89D2
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Oct 2022 08:51:10 +0200 (CEST)
Received: from localhost ([::1]:40892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohQ9T-00012O-AD
	for lists+qemu-devel@lfdr.de; Sun, 09 Oct 2022 02:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1ohQ5n-0007kc-9O
 for qemu-devel@nongnu.org; Sun, 09 Oct 2022 02:47:19 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1ohQ5k-000675-6R
 for qemu-devel@nongnu.org; Sun, 09 Oct 2022 02:47:18 -0400
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MlXXn6Xy1zVhqM;
 Sun,  9 Oct 2022 14:42:33 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 9 Oct 2022 14:46:55 +0800
Subject: Re: [PATCH 1/4] hw/acpi/aml-build: Only generate cluster node in PPTT
 when specified
To: Yicong Yang <yangyicong@huawei.com>
CC: <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>,
 <yangyicong@hisilicon.com>, <prime.zeng@huawei.com>,
 <hesham.almatary@huawei.com>, <ionela.voinescu@arm.com>,
 <darren@os.amperecomputing.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor
 Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>, Eduardo Habkost
 <eduardo@habkost.net>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 <qemu-devel@nongnu.org>
References: <20220922131143.58003-1-yangyicong@huawei.com>
 <20220922131143.58003-2-yangyicong@huawei.com>
Message-ID: <a3bf8337-b257-8f2c-be3f-25ce59e7a3da@huawei.com>
Date: Sun, 9 Oct 2022 14:46:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20220922131143.58003-2-yangyicong@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.588,
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
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>

Hi Yicong,

On 2022/9/22 21:11, Yicong Yang wrote:
> From: Yicong Yang<yangyicong@hisilicon.com>
>
> Currently we'll always generate a cluster node no matter user has
> specified '-smp clusters=X' or not. Cluster is an optional level
> and it's unncessary to build it if user don't need. So only generate
> it when user specify explicitly.
>
> Also update the test ACPI tables.
It would be much more helpful to explain the problem you
have met in practice without this patch. (maybe have some
description or a link of the issue in the cover-letter if we
need a v2).

In qemu which behaves as like a firmware vendor for VM,
the ACPI PPTT is built based on the topology info produced
by machine_parse_smp_config(). And machine_parse_smp_config
will always calculate a complete topology hierarchy using its
algorithm, if the user gives an incomplete -smp CLI.

I think there are two options for us to chose:
1) approach described in this patch
2) qemu will always generate a full topology hierarchy in PPTT
with all the topo members it currently supports. While users
need to consider the necessity to use an incomplete -smp or
an complete one according to their specific scenario, and
should be aware of the kernel behavior resulted from the
config.

There is some Doc for users to explain how qemu will
parse user-specified -smp in [1].
[1] https://www.mankier.com/1/qemu#Options

Thanks,
Yanan
> Signed-off-by: Yicong Yang<yangyicong@hisilicon.com>
> ---
>   hw/acpi/aml-build.c   | 2 +-
>   hw/core/machine-smp.c | 3 +++
>   include/hw/boards.h   | 2 ++
>   3 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index e6bfac95c7..aab73af66d 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2030,7 +2030,7 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                   0, socket_id, NULL, 0);
>           }
>   
> -        if (mc->smp_props.clusters_supported) {
> +        if (mc->smp_props.clusters_supported && ms->smp.build_cluster) {
>               if (cpus->cpus[n].props.cluster_id != cluster_id) {
>                   assert(cpus->cpus[n].props.cluster_id > cluster_id);
>                   cluster_id = cpus->cpus[n].props.cluster_id;
> diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
> index b39ed21e65..5d37e8d07a 100644
> --- a/hw/core/machine-smp.c
> +++ b/hw/core/machine-smp.c
> @@ -158,6 +158,9 @@ void machine_parse_smp_config(MachineState *ms,
>       ms->smp.threads = threads;
>       ms->smp.max_cpus = maxcpus;
>   
> +    if (config->has_clusters)
> +        ms->smp.build_cluster = true;
> +
>       /* sanity-check of the computed topology */
>       if (sockets * dies * clusters * cores * threads != maxcpus) {
>           g_autofree char *topo_msg = cpu_hierarchy_to_string(ms);
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 7b416c9787..24aafc213d 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -305,6 +305,7 @@ typedef struct DeviceMemoryState {
>    * @cores: the number of cores in one cluster
>    * @threads: the number of threads in one core
>    * @max_cpus: the maximum number of logical processors on the machine
> + * @build_cluster: build cluster topology or not
>    */
>   typedef struct CpuTopology {
>       unsigned int cpus;
> @@ -314,6 +315,7 @@ typedef struct CpuTopology {
>       unsigned int cores;
>       unsigned int threads;
>       unsigned int max_cpus;
> +    bool build_cluster;
>   } CpuTopology;
>   
>   /**


