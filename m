Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE6F697B9D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 13:18:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSGjB-0005b4-TC; Wed, 15 Feb 2023 07:17:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pSGj8-0005am-Cm
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:17:34 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pSGj5-00015q-4L
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:17:33 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4PGxpv5CJsz16Ncn;
 Wed, 15 Feb 2023 20:15:03 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Wed, 15 Feb 2023 20:17:23 +0800
Message-ID: <964b18ef-d147-ba17-a5a5-2aff55467018@huawei.com>
Date: Wed, 15 Feb 2023 20:17:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH RESEND 14/18] i386: Add cache topology info in CPUCacheInfo
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
 <20230213093625.158170-15-zhao1.liu@linux.intel.com>
In-Reply-To: <20230213093625.158170-15-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.257,
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
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Zhao,

在 2023/2/13 17:36, Zhao Liu 写道:
> From: Zhao Liu <zhao1.liu@intel.com>
>
> Currently, by default, the cache topology is encoded as:
> 1. i/d cache is shared in one core.
> 2. L2 cache is shared in one core.
> 3. L3 cache is shared in one die.
>
> This default general setting has caused a misunderstanding, that is, the
> cache topology is completely equated with a specific cpu topology, such
> as the connection between L2 cache and core level, and the connection
> between L3 cache and die level.
>
> In fact, the settings of these topologies depend on the specific
> platform and are not static. For example, on Alder Lake-P, every
> four Atom cores share the same L2 cache.
>
> Thus, we should explicitly define the corresponding cache topology for
> different cache models to increase scalability.
>
> Except legacy_l2_cache_cpuid2 (its default topo level is INVALID),
It seems like its default topo level is UNKNOWN in this case.
> explicitly set the corresponding topology level for all other cache
> models. In order to be compatible with the existing cache topology, set
> the CORE level for the i/d cache, set the CORE level for L2 cache, and
> set the DIE level for L3 cache.
>
> The field for CPUID[4].EAX[bits 25:14] or CPUID[0x8000001D].EAX[bits
> 25:14] will be set based on CPUCacheInfo.share_level.
>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   target/i386/cpu.c | 19 +++++++++++++++++++
>   target/i386/cpu.h | 16 ++++++++++++++++
>   2 files changed, 35 insertions(+)
>
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 27bbbc36b11c..364534e84b1b 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -433,6 +433,7 @@ static CPUCacheInfo legacy_l1d_cache = {
>       .sets = 64,
>       .partitions = 1,
>       .no_invd_sharing = true,
> +    .share_level = CORE,
>   };
>   
>   /*FIXME: CPUID leaf 0x80000005 is inconsistent with leaves 2 & 4 */
> @@ -447,6 +448,7 @@ static CPUCacheInfo legacy_l1d_cache_amd = {
>       .partitions = 1,
>       .lines_per_tag = 1,
>       .no_invd_sharing = true,
> +    .share_level = CORE,
>   };
>   
>   /* L1 instruction cache: */
> @@ -460,6 +462,7 @@ static CPUCacheInfo legacy_l1i_cache = {
>       .sets = 64,
>       .partitions = 1,
>       .no_invd_sharing = true,
> +    .share_level = CORE,
>   };
>   
>   /*FIXME: CPUID leaf 0x80000005 is inconsistent with leaves 2 & 4 */
> @@ -474,6 +477,7 @@ static CPUCacheInfo legacy_l1i_cache_amd = {
>       .partitions = 1,
>       .lines_per_tag = 1,
>       .no_invd_sharing = true,
> +    .share_level = CORE,
>   };
>   
>   /* Level 2 unified cache: */
> @@ -487,6 +491,7 @@ static CPUCacheInfo legacy_l2_cache = {
>       .sets = 4096,
>       .partitions = 1,
>       .no_invd_sharing = true,
> +    .share_level = CORE,
>   };
>   
>   /*FIXME: CPUID leaf 2 descriptor is inconsistent with CPUID leaf 4 */
> @@ -509,6 +514,7 @@ static CPUCacheInfo legacy_l2_cache_amd = {
>       .associativity = 16,
>       .sets = 512,
>       .partitions = 1,
> +    .share_level = CORE,
>   };
>   
>   /* Level 3 unified cache: */
> @@ -524,6 +530,7 @@ static CPUCacheInfo legacy_l3_cache = {
>       .self_init = true,
>       .inclusive = true,
>       .complex_indexing = true,
> +    .share_level = DIE,
>   };
>   
>   /* TLB definitions: */
> @@ -1668,6 +1675,7 @@ static const CPUCaches epyc_cache_info = {
>           .lines_per_tag = 1,
>           .self_init = 1,
>           .no_invd_sharing = true,
> +        .share_level = CORE,
>       },
>       .l1i_cache = &(CPUCacheInfo) {
>           .type = INSTRUCTION_CACHE,
> @@ -1680,6 +1688,7 @@ static const CPUCaches epyc_cache_info = {
>           .lines_per_tag = 1,
>           .self_init = 1,
>           .no_invd_sharing = true,
> +        .share_level = CORE,
>       },
>       .l2_cache = &(CPUCacheInfo) {
>           .type = UNIFIED_CACHE,
> @@ -1690,6 +1699,7 @@ static const CPUCaches epyc_cache_info = {
>           .partitions = 1,
>           .sets = 1024,
>           .lines_per_tag = 1,
> +        .share_level = CORE,
>       },
>       .l3_cache = &(CPUCacheInfo) {
>           .type = UNIFIED_CACHE,
> @@ -1703,6 +1713,7 @@ static const CPUCaches epyc_cache_info = {
>           .self_init = true,
>           .inclusive = true,
>           .complex_indexing = true,
> +        .share_level = DIE,
>       },
>   };
>   
> @@ -1718,6 +1729,7 @@ static const CPUCaches epyc_rome_cache_info = {
>           .lines_per_tag = 1,
>           .self_init = 1,
>           .no_invd_sharing = true,
> +        .share_level = CORE,
>       },
>       .l1i_cache = &(CPUCacheInfo) {
>           .type = INSTRUCTION_CACHE,
> @@ -1730,6 +1742,7 @@ static const CPUCaches epyc_rome_cache_info = {
>           .lines_per_tag = 1,
>           .self_init = 1,
>           .no_invd_sharing = true,
> +        .share_level = CORE,
>       },
>       .l2_cache = &(CPUCacheInfo) {
>           .type = UNIFIED_CACHE,
> @@ -1740,6 +1753,7 @@ static const CPUCaches epyc_rome_cache_info = {
>           .partitions = 1,
>           .sets = 1024,
>           .lines_per_tag = 1,
> +        .share_level = CORE,
>       },
>       .l3_cache = &(CPUCacheInfo) {
>           .type = UNIFIED_CACHE,
> @@ -1753,6 +1767,7 @@ static const CPUCaches epyc_rome_cache_info = {
>           .self_init = true,
>           .inclusive = true,
>           .complex_indexing = true,
> +        .share_level = DIE,
>       },
>   };
>   
> @@ -1768,6 +1783,7 @@ static const CPUCaches epyc_milan_cache_info = {
>           .lines_per_tag = 1,
>           .self_init = 1,
>           .no_invd_sharing = true,
> +        .share_level = CORE,
>       },
>       .l1i_cache = &(CPUCacheInfo) {
>           .type = INSTRUCTION_CACHE,
> @@ -1780,6 +1796,7 @@ static const CPUCaches epyc_milan_cache_info = {
>           .lines_per_tag = 1,
>           .self_init = 1,
>           .no_invd_sharing = true,
> +        .share_level = CORE,
>       },
>       .l2_cache = &(CPUCacheInfo) {
>           .type = UNIFIED_CACHE,
> @@ -1790,6 +1807,7 @@ static const CPUCaches epyc_milan_cache_info = {
>           .partitions = 1,
>           .sets = 1024,
>           .lines_per_tag = 1,
> +        .share_level = CORE,
>       },
>       .l3_cache = &(CPUCacheInfo) {
>           .type = UNIFIED_CACHE,
> @@ -1803,6 +1821,7 @@ static const CPUCaches epyc_milan_cache_info = {
>           .self_init = true,
>           .inclusive = true,
>           .complex_indexing = true,
> +        .share_level = DIE,
>       },
>   };
>   
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 8668e74e0c87..5a955431f759 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1476,6 +1476,15 @@ enum CacheType {
>       UNIFIED_CACHE
>   };
>   
> +enum CPUTopoLevel {
> +    INVALID = 0,
Maybe UNKNOWN?
> +    SMT,
> +    CORE,
> +    MODULE,
> +    DIE,
> +    PACKAGE,
Do we need a prefix like CPU_TOPO_LEVEL_* or shorter CPU_TL_*
to avoid possible naming conflicts with other micros or enums?
Not sure..

Thanks,
Yanan
> +};
> +
>   typedef struct CPUCacheInfo {
>       enum CacheType type;
>       uint8_t level;
> @@ -1517,6 +1526,13 @@ typedef struct CPUCacheInfo {
>        * address bits.  CPUID[4].EDX[bit 2].
>        */
>       bool complex_indexing;
> +
> +    /*
> +     * Cache Topology. The level that cache is shared in.
> +     * Used to encode CPUID[4].EAX[bits 25:14] or
> +     * CPUID[0x8000001D].EAX[bits 25:14].
> +     */
> +    enum CPUTopoLevel share_level;
>   } CPUCacheInfo;
>   
>   


