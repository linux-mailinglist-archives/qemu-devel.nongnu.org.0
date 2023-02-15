Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15297697E53
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 15:28:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSIlt-0000KZ-H3; Wed, 15 Feb 2023 09:28:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pSIld-0000Ht-Rb
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:28:19 -0500
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pSIlZ-0004WQ-TA
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:28:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676471293; x=1708007293;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ljeFW608Hb2fGKEG4Z1DMHiYKG2nlHclbKR1cPDPjYU=;
 b=dmf/mbksSF9ROxGPKMscvkEgJ1zP2VFSP8XO2n3Yf0YfJiwKv3Z7lfxz
 3HGIMJhTupsr/itBCQJUmrSHLjpDJD7A9lR8FgBOErr5E7DuGV8wvSqKC
 K8nqJY0hf3B9KFPulnZ2+CM8T1RzWlN6mRoJ4z+0VrHWGM4KgcjDdCL5D
 qf5K4wwQHVc+W17F2tHdriZPdfwCl8txVYHU5xoscaYi+nejUQ+8AefgL
 dPCBJEJ+WghIw7OdDAttFz8dOPQHPX3N54p5v42i+rD3TkOYNl/IWrenV
 yho+ahuwvBQhSR/yvSAZl/GrCi3KHK0ymMJCZ1rIGFEhaRNxT+pFZBzHj A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="319471979"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="319471979"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 06:28:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="662958667"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="662958667"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by orsmga007.jf.intel.com with ESMTP; 15 Feb 2023 06:27:57 -0800
Date: Wed, 15 Feb 2023 22:35:49 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Cc: qemu-devel@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH RESEND 09/18] i386: Fix comment style in topology.h
Message-ID: <Y+ztxbHunwVcT6AW@liuzhao-OptiPlex-7080>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
 <20230213093625.158170-10-zhao1.liu@linux.intel.com>
 <863566f6-4c0b-67bd-880a-54bdbd4650f1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <863566f6-4c0b-67bd-880a-54bdbd4650f1@huawei.com>
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 15, 2023 at 06:54:15PM +0800, wangyanan (Y) wrote:
> Date: Wed, 15 Feb 2023 18:54:15 +0800
> From: "wangyanan (Y)" <wangyanan55@huawei.com>
> Subject: Re: [PATCH RESEND 09/18] i386: Fix comment style in topology.h
> 
> 在 2023/2/13 17:36, Zhao Liu 写道:
> > From: Zhao Liu <zhao1.liu@intel.com>
> > 
> > For function comments in this file, keep the comment style consistent
> > with other places.
> > 
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> nit：Better to move this cleanup patch to top of the series.

Ok, will do that. Thanks!

> > ---
> >   include/hw/i386/topology.h | 33 +++++++++++++++++----------------
> >   1 file changed, 17 insertions(+), 16 deletions(-)
> > 
> > diff --git a/include/hw/i386/topology.h b/include/hw/i386/topology.h
> > index b0174c18b7bd..5de905dc00d3 100644
> > --- a/include/hw/i386/topology.h
> > +++ b/include/hw/i386/topology.h
> > @@ -24,7 +24,8 @@
> >   #ifndef HW_I386_TOPOLOGY_H
> >   #define HW_I386_TOPOLOGY_H
> > -/* This file implements the APIC-ID-based CPU topology enumeration logic,
> > +/*
> > + * This file implements the APIC-ID-based CPU topology enumeration logic,
> >    * documented at the following document:
> >    *   Intel® 64 Architecture Processor Topology Enumeration
> >    *   http://software.intel.com/en-us/articles/intel-64-architecture-processor-topology-enumeration/
> > @@ -41,7 +42,8 @@
> >   #include "qemu/bitops.h"
> > -/* APIC IDs can be 32-bit, but beware: APIC IDs > 255 require x2APIC support
> > +/*
> > + * APIC IDs can be 32-bit, but beware: APIC IDs > 255 require x2APIC support
> >    */
> >   typedef uint32_t apic_id_t;
> > @@ -60,8 +62,7 @@ typedef struct X86CPUTopoInfo {
> >       unsigned threads_per_core;
> >   } X86CPUTopoInfo;
> > -/* Return the bit width needed for 'count' IDs
> > - */
> > +/* Return the bit width needed for 'count' IDs */
> >   static unsigned apicid_bitwidth_for_count(unsigned count)
> >   {
> >       g_assert(count >= 1);
> > @@ -69,15 +70,13 @@ static unsigned apicid_bitwidth_for_count(unsigned count)
> >       return count ? 32 - clz32(count) : 0;
> >   }
> > -/* Bit width of the SMT_ID (thread ID) field on the APIC ID
> > - */
> > +/* Bit width of the SMT_ID (thread ID) field on the APIC ID */
> >   static inline unsigned apicid_smt_width(X86CPUTopoInfo *topo_info)
> >   {
> >       return apicid_bitwidth_for_count(topo_info->threads_per_core);
> >   }
> > -/* Bit width of the Core_ID field
> > - */
> > +/* Bit width of the Core_ID field */
> >   static inline unsigned apicid_core_width(X86CPUTopoInfo *topo_info)
> >   {
> >       /*
> > @@ -94,8 +93,7 @@ static inline unsigned apicid_die_width(X86CPUTopoInfo *topo_info)
> >       return apicid_bitwidth_for_count(topo_info->dies_per_pkg);
> >   }
> > -/* Bit offset of the Core_ID field
> > - */
> > +/* Bit offset of the Core_ID field */
> >   static inline unsigned apicid_core_offset(X86CPUTopoInfo *topo_info)
> >   {
> >       return apicid_smt_width(topo_info);
> > @@ -107,14 +105,14 @@ static inline unsigned apicid_die_offset(X86CPUTopoInfo *topo_info)
> >       return apicid_core_offset(topo_info) + apicid_core_width(topo_info);
> >   }
> > -/* Bit offset of the Pkg_ID (socket ID) field
> > - */
> > +/* Bit offset of the Pkg_ID (socket ID) field */
> >   static inline unsigned apicid_pkg_offset(X86CPUTopoInfo *topo_info)
> >   {
> >       return apicid_die_offset(topo_info) + apicid_die_width(topo_info);
> >   }
> > -/* Make APIC ID for the CPU based on Pkg_ID, Core_ID, SMT_ID
> > +/*
> > + * Make APIC ID for the CPU based on Pkg_ID, Core_ID, SMT_ID
> >    *
> >    * The caller must make sure core_id < nr_cores and smt_id < nr_threads.
> >    */
> > @@ -127,7 +125,8 @@ static inline apic_id_t x86_apicid_from_topo_ids(X86CPUTopoInfo *topo_info,
> >              topo_ids->smt_id;
> >   }
> > -/* Calculate thread/core/package IDs for a specific topology,
> > +/*
> > + * Calculate thread/core/package IDs for a specific topology,
> >    * based on (contiguous) CPU index
> >    */
> >   static inline void x86_topo_ids_from_idx(X86CPUTopoInfo *topo_info,
> > @@ -154,7 +153,8 @@ static inline void x86_topo_ids_from_idx(X86CPUTopoInfo *topo_info,
> >       topo_ids->smt_id = cpu_index % nr_threads;
> >   }
> > -/* Calculate thread/core/package IDs for a specific topology,
> > +/*
> > + * Calculate thread/core/package IDs for a specific topology,
> >    * based on APIC ID
> >    */
> >   static inline void x86_topo_ids_from_apicid(apic_id_t apicid,
> > @@ -178,7 +178,8 @@ static inline void x86_topo_ids_from_apicid(apic_id_t apicid,
> >       topo_ids->pkg_id = apicid >> apicid_pkg_offset(topo_info);
> >   }
> > -/* Make APIC ID for the CPU 'cpu_index'
> > +/*
> > + * Make APIC ID for the CPU 'cpu_index'
> >    *
> >    * 'cpu_index' is a sequential, contiguous ID for the CPU.
> >    */
> 

