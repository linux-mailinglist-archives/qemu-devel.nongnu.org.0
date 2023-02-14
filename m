Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 205BE6956C4
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 03:39:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRlDJ-0005Ns-7R; Mon, 13 Feb 2023 21:38:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pRlD7-0005Ne-6C
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 21:38:25 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pRlD5-0003Nl-05
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 21:38:24 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4PG51C6XCXznVLx;
 Tue, 14 Feb 2023 10:35:59 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Tue, 14 Feb 2023 10:37:39 +0800
Message-ID: <082f7ec4-e5ea-31fe-f4bf-f466de08f389@huawei.com>
Date: Tue, 14 Feb 2023 10:37:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH RESEND 09/18] i386: Fix comment style in topology.h
To: Zhao Liu <zhao1.liu@linux.intel.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, "Michael S .
 Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>, Markus
 Armbruster <armbru@redhat.com>
CC: <qemu-devel@nongnu.org>, Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi
 <dapeng1.mi@intel.com>, Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo
 <robert.hu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, Like Xu
 <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
 <20230213093625.158170-10-zhao1.liu@linux.intel.com>
In-Reply-To: <20230213093625.158170-10-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.345,
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

在 2023/2/13 17:36, Zhao Liu 写道:
> From: Zhao Liu <zhao1.liu@intel.com>
>
> For function comments in this file, keep the comment style consistent
> with other places.
>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   include/hw/i386/topology.h | 33 +++++++++++++++++----------------
>   1 file changed, 17 insertions(+), 16 deletions(-)
>
> diff --git a/include/hw/i386/topology.h b/include/hw/i386/topology.h
> index b0174c18b7bd..5de905dc00d3 100644
> --- a/include/hw/i386/topology.h
> +++ b/include/hw/i386/topology.h
> @@ -24,7 +24,8 @@
>   #ifndef HW_I386_TOPOLOGY_H
>   #define HW_I386_TOPOLOGY_H
>   
> -/* This file implements the APIC-ID-based CPU topology enumeration logic,
> +/*
> + * This file implements the APIC-ID-based CPU topology enumeration logic,
>    * documented at the following document:
>    *   Intel® 64 Architecture Processor Topology Enumeration
>    *   http://software.intel.com/en-us/articles/intel-64-architecture-processor-topology-enumeration/
> @@ -41,7 +42,8 @@
>   
>   #include "qemu/bitops.h"
>   
> -/* APIC IDs can be 32-bit, but beware: APIC IDs > 255 require x2APIC support
> +/*
> + * APIC IDs can be 32-bit, but beware: APIC IDs > 255 require x2APIC support
>    */
>   typedef uint32_t apic_id_t;
>   
> @@ -60,8 +62,7 @@ typedef struct X86CPUTopoInfo {
>       unsigned threads_per_core;
>   } X86CPUTopoInfo;
>   
> -/* Return the bit width needed for 'count' IDs
> - */
> +/* Return the bit width needed for 'count' IDs */
>   static unsigned apicid_bitwidth_for_count(unsigned count)
>   {
>       g_assert(count >= 1);
> @@ -69,15 +70,13 @@ static unsigned apicid_bitwidth_for_count(unsigned count)
>       return count ? 32 - clz32(count) : 0;
>   }
>   
> -/* Bit width of the SMT_ID (thread ID) field on the APIC ID
> - */
> +/* Bit width of the SMT_ID (thread ID) field on the APIC ID */
>   static inline unsigned apicid_smt_width(X86CPUTopoInfo *topo_info)
>   {
>       return apicid_bitwidth_for_count(topo_info->threads_per_core);
>   }
>   
> -/* Bit width of the Core_ID field
> - */
> +/* Bit width of the Core_ID field */
>   static inline unsigned apicid_core_width(X86CPUTopoInfo *topo_info)
>   {
>       /*
> @@ -94,8 +93,7 @@ static inline unsigned apicid_die_width(X86CPUTopoInfo *topo_info)
>       return apicid_bitwidth_for_count(topo_info->dies_per_pkg);
>   }
>   
> -/* Bit offset of the Core_ID field
> - */
> +/* Bit offset of the Core_ID field */
>   static inline unsigned apicid_core_offset(X86CPUTopoInfo *topo_info)
>   {
>       return apicid_smt_width(topo_info);
> @@ -107,14 +105,14 @@ static inline unsigned apicid_die_offset(X86CPUTopoInfo *topo_info)
>       return apicid_core_offset(topo_info) + apicid_core_width(topo_info);
>   }
>   
> -/* Bit offset of the Pkg_ID (socket ID) field
> - */
> +/* Bit offset of the Pkg_ID (socket ID) field */
>   static inline unsigned apicid_pkg_offset(X86CPUTopoInfo *topo_info)
>   {
>       return apicid_die_offset(topo_info) + apicid_die_width(topo_info);
>   }
>   
> -/* Make APIC ID for the CPU based on Pkg_ID, Core_ID, SMT_ID
> +/*
> + * Make APIC ID for the CPU based on Pkg_ID, Core_ID, SMT_ID
>    *
>    * The caller must make sure core_id < nr_cores and smt_id < nr_threads.
>    */
> @@ -127,7 +125,8 @@ static inline apic_id_t x86_apicid_from_topo_ids(X86CPUTopoInfo *topo_info,
>              topo_ids->smt_id;
>   }
>   
> -/* Calculate thread/core/package IDs for a specific topology,
> +/*
> + * Calculate thread/core/package IDs for a specific topology,
>    * based on (contiguous) CPU index
>    */
>   static inline void x86_topo_ids_from_idx(X86CPUTopoInfo *topo_info,
> @@ -154,7 +153,8 @@ static inline void x86_topo_ids_from_idx(X86CPUTopoInfo *topo_info,
>       topo_ids->smt_id = cpu_index % nr_threads;
>   }
>   
> -/* Calculate thread/core/package IDs for a specific topology,
> +/*
> + * Calculate thread/core/package IDs for a specific topology,
>    * based on APIC ID
>    */
>   static inline void x86_topo_ids_from_apicid(apic_id_t apicid,
> @@ -178,7 +178,8 @@ static inline void x86_topo_ids_from_apicid(apic_id_t apicid,
>       topo_ids->pkg_id = apicid >> apicid_pkg_offset(topo_info);
>   }
>   
> -/* Make APIC ID for the CPU 'cpu_index'
> +/*
> + * Make APIC ID for the CPU 'cpu_index'
>    *
>    * 'cpu_index' is a sequential, contiguous ID for the CPU.
>    */
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan

