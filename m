Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A20F86136E2
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:50:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUF8-0008C1-E0; Mon, 31 Oct 2022 08:50:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1opUF5-0008Ar-AR
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:50:16 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1opUF2-0001xH-HR
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:50:14 -0400
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4N1CY13PcXz15M0j;
 Mon, 31 Oct 2022 20:45:09 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 31 Oct 2022 20:50:08 +0800
CC: <yangyicong@hisilicon.com>, <jonathan.cameron@huawei.com>,
 <linuxarm@huawei.com>, <prime.zeng@huawei.com>, <hesham.almatary@huawei.com>, 
 <ionela.voinescu@arm.com>, <darren@os.amperecomputing.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Igor
 Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 1/5] hw/acpi/aml-build: Only generate cluster node in
 PPTT when specified
To: "wangyanan (Y)" <wangyanan55@huawei.com>
References: <20221031090523.34146-1-yangyicong@huawei.com>
 <20221031090523.34146-2-yangyicong@huawei.com>
 <8cffad8b-eb94-ab7b-c555-e5e2dd6d9591@huawei.com>
Message-ID: <d8c54679-1157-f9b7-397a-568f27ef43b2@huawei.com>
Date: Mon, 31 Oct 2022 20:50:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <8cffad8b-eb94-ab7b-c555-e5e2dd6d9591@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=yangyicong@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Yicong Yang <yangyicong@huawei.com>
From:  Yicong Yang via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On 2022/10/31 19:17, wangyanan (Y) wrote:
> 
> On 2022/10/31 17:05, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> Currently we'll always generate a cluster node no matter user has
>> specified '-smp clusters=X' or not. Cluster is an optional level
>> and will participant the building of Linux scheduling domains and
>> only appears on a few platforms.
>> It's unncessary to always build
>> it which cannot reflect the real topology on platforms have no
>> cluster and to avoid affecting the linux scheduling domains in the
>> VM.
> This sentence is a bit confusing, better to re-organize it.
>> So only generate it when user specified explicitly.
> "So only generate the cluster topology in ACPI PPTT when
> the user has specified it explicitly in -smp."
> Will this be more clear?

ok. seems better.

will also address the comments below.

thanks.

>>
>> Tested qemu-system-aarch64 with `-smp 8` and linux 6.1-rc1, without
>> this patch:
>> estuary:/sys/devices/system/cpu/cpu0/topology$ cat cluster_*
>> ff    # cluster_cpus
>> 0-7    # cluster_cpus_list
>> 56    # cluster_id
>>
>> with this patch:
>> estuary:/sys/devices/system/cpu/cpu0/topology$ cat cluster_*
>> ff    # cluster_cpus
>> 0-7    # cluster_cpus_list
>> 36    # cluster_id, with no cluster node kernel will make it to
>>       physical package id
>>
>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>   hw/acpi/aml-build.c                         | 2 +-
>>   hw/core/machine-smp.c                       | 3 +++
>>   include/hw/boards.h                         | 3 +++
>>   qemu-options.hx                             | 3 +++
>>   tests/qtest/bios-tables-test-allowed-diff.h | 1 +
>>   5 files changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>> index e6bfac95c7..60c1acf3da 100644
>> --- a/hw/acpi/aml-build.c
>> +++ b/hw/acpi/aml-build.c
>> @@ -2030,7 +2030,7 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>>                   0, socket_id, NULL, 0);
>>           }
>>   -        if (mc->smp_props.clusters_supported) {
>> +        if (mc->smp_props.clusters_supported && mc->smp_props.has_clusters) {
>>               if (cpus->cpus[n].props.cluster_id != cluster_id) {
>>                   assert(cpus->cpus[n].props.cluster_id > cluster_id);
>>                   cluster_id = cpus->cpus[n].props.cluster_id;
>> diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
>> index b39ed21e65..9c8950b2b0 100644
>> --- a/hw/core/machine-smp.c
>> +++ b/hw/core/machine-smp.c
>> @@ -158,6 +158,9 @@ void machine_parse_smp_config(MachineState *ms,
>>       ms->smp.threads = threads;
>>       ms->smp.max_cpus = maxcpus;
>>   +    if (config->has_clusters)
>> +        mc->smp_props.has_clusters = true;
>> +
> why not "mc->smp_props.has_clusters = config->has_clusters"?
>>       /* sanity-check of the computed topology */
>>       if (sockets * dies * clusters * cores * threads != maxcpus) {
>>           g_autofree char *topo_msg = cpu_hierarchy_to_string(ms);
>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>> index 311ed17e18..06ed66453f 100644
>> --- a/include/hw/boards.h
>> +++ b/include/hw/boards.h
>> @@ -130,11 +130,14 @@ typedef struct {
>>    * @prefer_sockets - whether sockets are preferred over cores in smp parsing
>>    * @dies_supported - whether dies are supported by the machine
>>    * @clusters_supported - whether clusters are supported by the machine
>> + * @has_clusters - whether clusters are explicitly specified in the user
>> + *                 provided SMP configuration
>>    */
>>   typedef struct {
>>       bool prefer_sockets;
>>       bool dies_supported;
>>       bool clusters_supported;
>> +    bool has_clusters;
>>   } SMPCompatProps;
>>     /**
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index eb38e5dc40..bbdbdef0af 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -349,6 +349,9 @@ SRST
>>       ::
>>             -smp 2
>> +
>> +    Note: The cluster topology will only be generated in ACPI and exposed
>> +    to guest if it's explicitly specified in -smp.
>>   ERST
>>     DEF("numa", HAS_ARG, QEMU_OPTION_numa,
>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
>> index dfb8523c8b..cb143a55a6 100644
>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>> @@ -1 +1,2 @@
>>   /* List of comma-separated changed AML files to ignore */
>> +"tests/data/acpi/virt/PPTT",
> This change in bios-tables-test-allowed-diff.h should be in a
> standalone patch before this patch.
> 
> For your reference: see patch 4-6 in [1]:
> https://patchew.org/QEMU/20220107083232.16256-1-wangyanan55@huawei.com/
> 
> Thanks,
> Yanan
> 
> .

