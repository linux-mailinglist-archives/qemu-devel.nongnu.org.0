Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9629644E0CC
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 04:27:34 +0100 (CET)
Received: from localhost ([::1]:33780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlNDx-0001YM-N9
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 22:27:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mlN9d-0002nF-Dg
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 22:23:05 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mlN9a-0005dN-Ay
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 22:23:05 -0500
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Hr3kf2DWkzZccf;
 Fri, 12 Nov 2021 11:20:42 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Fri, 12 Nov 2021 11:22:58 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Fri, 12 Nov 2021 11:22:58 +0800
Subject: Re: [PATCH-for-6.2 v3 6/6] hw/core: Rename smp_parse() ->
 machine_parse_smp_config()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20211111100351.2153662-1-philmd@redhat.com>
 <20211111100351.2153662-7-philmd@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <83bd90b3-9593-9af3-68ec-e8a9d17d80fa@huawei.com>
Date: Fri, 12 Nov 2021 11:22:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211111100351.2153662-7-philmd@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme712-chm.china.huawei.com (10.1.199.108) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.999,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/11/11 18:03, Philippe Mathieu-Daudé wrote:
> All methods related to MachineState are prefixed with "machine_".
> smp_parse() does not need to be an exception. Rename it and
> const'ify the SMPConfiguration argument, since it doesn't need
> to be modified.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   include/hw/boards.h         | 3 ++-
>   hw/core/machine-smp.c       | 6 ++++--
>   hw/core/machine.c           | 2 +-
>   tests/unit/test-smp-parse.c | 8 ++++----
>   4 files changed, 11 insertions(+), 8 deletions(-)
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 9c1c1901046..7597cec4400 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -34,7 +34,8 @@ HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine);
>   void machine_set_cpu_numa_node(MachineState *machine,
>                                  const CpuInstanceProperties *props,
>                                  Error **errp);
> -void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp);
> +void machine_parse_smp_config(MachineState *ms,
> +                              const SMPConfiguration *config, Error **errp);
>   
>   /**
>    * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices
> diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
> index 116a0cbbfab..2cbfd574293 100644
> --- a/hw/core/machine-smp.c
> +++ b/hw/core/machine-smp.c
> @@ -44,7 +44,8 @@ static char *cpu_hierarchy_to_string(MachineState *ms)
>   }
>   
>   /*
> - * smp_parse - Generic function used to parse the given SMP configuration
> + * machine_parse_smp_config: Generic function used to parse the given
> + *                           SMP configuration
>    *
>    * Any missing parameter in "cpus/maxcpus/sockets/cores/threads" will be
>    * automatically computed based on the provided ones.
> @@ -63,7 +64,8 @@ static char *cpu_hierarchy_to_string(MachineState *ms)
>    * introduced topology members which are likely to be target specific should
>    * be directly set as 1 if they are omitted (e.g. dies for PC since 4.1).
>    */
> -void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
> +void machine_parse_smp_config(MachineState *ms,
> +                              const SMPConfiguration *config, Error **errp)
>   {
>       MachineClass *mc = MACHINE_GET_CLASS(ms);
>       unsigned cpus    = config->has_cpus ? config->cpus : 0;
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 26ec54e7261..a2d3c9969d9 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -760,7 +760,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
>           return;
>       }
>   
> -    smp_parse(ms, config, errp);
> +    machine_parse_smp_config(ms, config, errp);
>   }
>   
>   static void machine_class_init(ObjectClass *oc, void *data)
> diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
> index 11109752799..b158ebb16b1 100644
> --- a/tests/unit/test-smp-parse.c
> +++ b/tests/unit/test-smp-parse.c
> @@ -337,7 +337,7 @@ static const struct SMPTestData data_with_dies_invalid[] = {
>       },
>   };
>   
> -static char *smp_config_to_string(SMPConfiguration *config)
> +static char *smp_config_to_string(const SMPConfiguration *config)
>   {
>       return g_strdup_printf(
>           "(SMPConfiguration) {\n"
> @@ -371,7 +371,7 @@ static char *cpu_topology_to_string(const CpuTopology *topo)
>           topo->cores, topo->threads, topo->max_cpus);
>   }
>   
> -static void check_parse(MachineState *ms, SMPConfiguration *config,
> +static void check_parse(MachineState *ms, const SMPConfiguration *config,
>                           const CpuTopology *expect_topo, const char *expect_err,
>                           bool is_valid)
>   {
> @@ -380,8 +380,8 @@ static void check_parse(MachineState *ms, SMPConfiguration *config,
>       g_autofree char *output_topo_str = NULL;
>       Error *err = NULL;
>   
> -    /* call the generic parser smp_parse() */
> -    smp_parse(ms, config, &err);
> +    /* call the generic parser */
> +    machine_parse_smp_config(ms, config, &err);
>   
>       output_topo_str = cpu_topology_to_string(&ms->smp);
>   


