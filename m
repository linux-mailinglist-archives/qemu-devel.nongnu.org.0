Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FB3698A90
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 03:35:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSU6b-00021p-M0; Wed, 15 Feb 2023 21:34:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pSU6Z-00021W-0J
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:34:39 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pSU6Q-0008RV-Fy
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:34:38 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4PHJql20ZkznWCy;
 Thu, 16 Feb 2023 10:32:03 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Thu, 16 Feb 2023 10:34:24 +0800
Message-ID: <7d7da023-eda6-bbf7-d772-3ee7a6148c3b@huawei.com>
Date: Thu, 16 Feb 2023 10:34:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH RESEND 07/18] i386: Support modules_per_die in
 X86CPUTopoInfo
To: Zhao Liu <zhao1.liu@linux.intel.com>
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
 <20230213093625.158170-8-zhao1.liu@linux.intel.com>
In-Reply-To: <20230213093625.158170-8-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.257,
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

Hi Zhao,

在 2023/2/13 17:36, Zhao Liu 写道:
> From: Zhuocheng Ding <zhuocheng.ding@intel.com>
>
> Support module level in i386 cpu topology structure "X86CPUTopoInfo".
>
> Before updating APIC ID parsing rule with module level, the
> apicid_core_width() temporarily combines the core and module levels
> together.
If we dont merge this one with the followed patches, then nits below
may be meaningful.
> At present, we don't expose module level in CPUID.1FH because currently
> linux (v6.2-rc6) doesn't support module level. And exposing module and
> die levels at the same time in CPUID.1FH will cause linux to calculate
> the wrong die_id. The module level should be exposed until the real
> machine has the module level in CPUID.1FH.
>
> In addition, update topology structure in test-x86-apicid.c.
>
> Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
> Co-developed-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   hw/i386/x86.c                |  3 ++-
>   include/hw/i386/topology.h   | 13 ++++++++---
>   target/i386/cpu.c            | 17 ++++++++------
>   tests/unit/test-x86-apicid.c | 45 +++++++++++++++++++-----------------
>   4 files changed, 46 insertions(+), 32 deletions(-)
>
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index ae1bb562d6e2..1c069ff56ae7 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -71,7 +71,8 @@ inline void init_topo_info(X86CPUTopoInfo *topo_info,
>       MachineState *ms = MACHINE(x86ms);
>   
>       topo_info->dies_per_pkg = ms->smp.dies;
> -    topo_info->cores_per_die = ms->smp.cores;
> +    topo_info->modules_per_die = ms->smp.clusters;
> +    topo_info->cores_per_module = ms->smp.cores;
Here we can ensure that topo_info->modules_per_die is always 1, so...
>       topo_info->threads_per_core = ms->smp.threads;
>   }
>   
> diff --git a/include/hw/i386/topology.h b/include/hw/i386/topology.h
> index 81573f6cfde0..bbb00dc4aad8 100644
> --- a/include/hw/i386/topology.h
> +++ b/include/hw/i386/topology.h
> @@ -54,7 +54,8 @@ typedef struct X86CPUTopoIDs {
>   
>   typedef struct X86CPUTopoInfo {
>       unsigned dies_per_pkg;
> -    unsigned cores_per_die;
> +    unsigned modules_per_die;
> +    unsigned cores_per_module;
>       unsigned threads_per_core;
>   } X86CPUTopoInfo;
>   
> @@ -78,7 +79,12 @@ static inline unsigned apicid_smt_width(X86CPUTopoInfo *topo_info)
>    */
>   static inline unsigned apicid_core_width(X86CPUTopoInfo *topo_info)
>   {
> -    return apicid_bitwidth_for_count(topo_info->cores_per_die);
> +    /*
> +     * TODO: Will separate module info from core_width when update
> +     * APIC ID with module level.
> +     */
> +    return apicid_bitwidth_for_count(topo_info->cores_per_module *
> +                                     topo_info->modules_per_die);
>   }
...We can directly add apicid_module_width (which returns 0 so far)
and apicid_module_offset here which don't rely on the APIC ID rule
change, and avoid the "TODO..".

Then patch 8 and 10 are about module_id, so can be merged.
Is this good?

Thanks,
Yanan
>   /* Bit width of the Die_ID field */
> @@ -128,7 +134,8 @@ static inline void x86_topo_ids_from_idx(X86CPUTopoInfo *topo_info,
>                                            X86CPUTopoIDs *topo_ids)
>   {
>       unsigned nr_dies = topo_info->dies_per_pkg;
> -    unsigned nr_cores = topo_info->cores_per_die;
> +    unsigned nr_cores = topo_info->cores_per_module *
> +                        topo_info->modules_per_die;
>       unsigned nr_threads = topo_info->threads_per_core;
>   
>       topo_ids->pkg_id = cpu_index / (nr_dies * nr_cores * nr_threads);
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 61ec9a7499b8..6f3d114c7d12 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -336,7 +336,9 @@ static void encode_cache_cpuid8000001d(CPUCacheInfo *cache,
>   
>       /* L3 is shared among multiple cores */
>       if (cache->level == 3) {
> -        l3_threads = topo_info->cores_per_die * topo_info->threads_per_core;
> +        l3_threads = topo_info->modules_per_die *
> +                     topo_info->cores_per_module *
> +                     topo_info->threads_per_core;
>           *eax |= (l3_threads - 1) << 14;
>       } else {
>           *eax |= ((topo_info->threads_per_core - 1) << 14);
> @@ -5218,11 +5220,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>       uint32_t cpus_per_pkg;
>   
>       topo_info.dies_per_pkg = env->nr_dies;
> -    topo_info.cores_per_die = cs->nr_cores / env->nr_dies;
> +    topo_info.modules_per_die = env->nr_modules;
> +    topo_info.cores_per_module = cs->nr_cores / env->nr_dies / env->nr_modules;
>       topo_info.threads_per_core = cs->nr_threads;
>   
> -    cpus_per_pkg = topo_info.dies_per_pkg * topo_info.cores_per_die *
> -                   topo_info.threads_per_core;
> +    cpus_per_pkg = topo_info.dies_per_pkg * topo_info.modules_per_die *
> +                   topo_info.cores_per_module * topo_info.threads_per_core;
>   
>       /* Calculate & apply limits for different index ranges */
>       if (index >= 0xC0000000) {
> @@ -5298,8 +5301,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>               if (*eax & 31) {
>                   int host_vcpus_per_cache = 1 + ((*eax & 0x3FFC000) >> 14);
>                   int vcpus_per_socket = cpus_per_pkg;
> -                int cores_per_socket = topo_info.cores_per_die *
> -                                       topo_info.dies_per_pkg;
> +                int cores_per_socket = cpus_per_pkg /
> +                                       topo_info.threads_per_core;
>                   if (cores_per_socket > 1) {
>                       *eax &= ~0xFC000000;
>                       *eax |= (pow2ceil(cores_per_socket) - 1) << 26;
> @@ -5483,7 +5486,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>               break;
>           case 1:
>               *eax = apicid_die_offset(&topo_info);
> -            *ebx = topo_info.cores_per_die * topo_info.threads_per_core;
> +            *ebx = cpus_per_pkg / topo_info.dies_per_pkg;
>               *ecx |= CPUID_TOPOLOGY_LEVEL_CORE;
>               break;
>           case 2:
> diff --git a/tests/unit/test-x86-apicid.c b/tests/unit/test-x86-apicid.c
> index 2b104f86d7c2..f21b8a5d95c2 100644
> --- a/tests/unit/test-x86-apicid.c
> +++ b/tests/unit/test-x86-apicid.c
> @@ -30,13 +30,16 @@ static void test_topo_bits(void)
>   {
>       X86CPUTopoInfo topo_info = {0};
>   
> -    /* simple tests for 1 thread per core, 1 core per die, 1 die per package */
> -    topo_info = (X86CPUTopoInfo) {1, 1, 1};
> +    /*
> +     * simple tests for 1 thread per core, 1 core per module,
> +     *                  1 module per die, 1 die per package
> +     */
> +    topo_info = (X86CPUTopoInfo) {1, 1, 1, 1};
>       g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 0);
>       g_assert_cmpuint(apicid_core_width(&topo_info), ==, 0);
>       g_assert_cmpuint(apicid_die_width(&topo_info), ==, 0);
>   
> -    topo_info = (X86CPUTopoInfo) {1, 1, 1};
> +    topo_info = (X86CPUTopoInfo) {1, 1, 1, 1};
>       g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 0), ==, 0);
>       g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 1), ==, 1);
>       g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 2), ==, 2);
> @@ -45,39 +48,39 @@ static void test_topo_bits(void)
>   
>       /* Test field width calculation for multiple values
>        */
> -    topo_info = (X86CPUTopoInfo) {1, 1, 2};
> +    topo_info = (X86CPUTopoInfo) {1, 1, 1, 2};
>       g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 1);
> -    topo_info = (X86CPUTopoInfo) {1, 1, 3};
> +    topo_info = (X86CPUTopoInfo) {1, 1, 1, 3};
>       g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 2);
> -    topo_info = (X86CPUTopoInfo) {1, 1, 4};
> +    topo_info = (X86CPUTopoInfo) {1, 1, 1, 4};
>       g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 2);
>   
> -    topo_info = (X86CPUTopoInfo) {1, 1, 14};
> +    topo_info = (X86CPUTopoInfo) {1, 1, 1, 14};
>       g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 4);
> -    topo_info = (X86CPUTopoInfo) {1, 1, 15};
> +    topo_info = (X86CPUTopoInfo) {1, 1, 1, 15};
>       g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 4);
> -    topo_info = (X86CPUTopoInfo) {1, 1, 16};
> +    topo_info = (X86CPUTopoInfo) {1, 1, 1, 16};
>       g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 4);
> -    topo_info = (X86CPUTopoInfo) {1, 1, 17};
> +    topo_info = (X86CPUTopoInfo) {1, 1, 1, 17};
>       g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 5);
>   
>   
> -    topo_info = (X86CPUTopoInfo) {1, 30, 2};
> +    topo_info = (X86CPUTopoInfo) {1, 1, 30, 2};
>       g_assert_cmpuint(apicid_core_width(&topo_info), ==, 5);
> -    topo_info = (X86CPUTopoInfo) {1, 31, 2};
> +    topo_info = (X86CPUTopoInfo) {1, 1, 31, 2};
>       g_assert_cmpuint(apicid_core_width(&topo_info), ==, 5);
> -    topo_info = (X86CPUTopoInfo) {1, 32, 2};
> +    topo_info = (X86CPUTopoInfo) {1, 1, 32, 2};
>       g_assert_cmpuint(apicid_core_width(&topo_info), ==, 5);
> -    topo_info = (X86CPUTopoInfo) {1, 33, 2};
> +    topo_info = (X86CPUTopoInfo) {1, 1, 33, 2};
>       g_assert_cmpuint(apicid_core_width(&topo_info), ==, 6);
>   
> -    topo_info = (X86CPUTopoInfo) {1, 30, 2};
> +    topo_info = (X86CPUTopoInfo) {1, 1, 30, 2};
>       g_assert_cmpuint(apicid_die_width(&topo_info), ==, 0);
> -    topo_info = (X86CPUTopoInfo) {2, 30, 2};
> +    topo_info = (X86CPUTopoInfo) {2, 1, 30, 2};
>       g_assert_cmpuint(apicid_die_width(&topo_info), ==, 1);
> -    topo_info = (X86CPUTopoInfo) {3, 30, 2};
> +    topo_info = (X86CPUTopoInfo) {3, 1, 30, 2};
>       g_assert_cmpuint(apicid_die_width(&topo_info), ==, 2);
> -    topo_info = (X86CPUTopoInfo) {4, 30, 2};
> +    topo_info = (X86CPUTopoInfo) {4, 1, 30, 2};
>       g_assert_cmpuint(apicid_die_width(&topo_info), ==, 2);
>   
>       /* build a weird topology and see if IDs are calculated correctly
> @@ -85,18 +88,18 @@ static void test_topo_bits(void)
>   
>       /* This will use 2 bits for thread ID and 3 bits for core ID
>        */
> -    topo_info = (X86CPUTopoInfo) {1, 6, 3};
> +    topo_info = (X86CPUTopoInfo) {1, 1, 6, 3};
>       g_assert_cmpuint(apicid_smt_width(&topo_info), ==, 2);
>       g_assert_cmpuint(apicid_core_offset(&topo_info), ==, 2);
>       g_assert_cmpuint(apicid_die_offset(&topo_info), ==, 5);
>       g_assert_cmpuint(apicid_pkg_offset(&topo_info), ==, 5);
>   
> -    topo_info = (X86CPUTopoInfo) {1, 6, 3};
> +    topo_info = (X86CPUTopoInfo) {1, 1, 6, 3};
>       g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 0), ==, 0);
>       g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 1), ==, 1);
>       g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 2), ==, 2);
>   
> -    topo_info = (X86CPUTopoInfo) {1, 6, 3};
> +    topo_info = (X86CPUTopoInfo) {1, 1, 6, 3};
>       g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 1 * 3 + 0), ==,
>                        (1 << 2) | 0);
>       g_assert_cmpuint(x86_apicid_from_cpu_idx(&topo_info, 1 * 3 + 1), ==,


