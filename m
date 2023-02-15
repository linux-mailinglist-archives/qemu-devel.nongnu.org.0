Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6086974E9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 04:28:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS8Sb-0001Lg-Sy; Tue, 14 Feb 2023 22:27:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pS8SY-0001LC-Jr
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 22:27:54 -0500
Received: from mga01.intel.com ([192.55.52.88])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pS8SW-0001OH-6a
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 22:27:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676431672; x=1707967672;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=C11267zVA3UY6J6lmNykH/7FLqcquRHrtw5RKwjtSx4=;
 b=ndbX/nvbgSH39bJJAuVe4NF3eUoEZd6qVTmxaoAMzUaEnUw3hikjFA+P
 +GjFvfQG9JheTMGu4b9G6ULQ20oqM6nkLFIKCD5zEvbJhx/WhoZGlNTr9
 A1LIL3RsG6sPSN5kF/V4EivBOBwQsQugskF0XLAJeVK17bHqiKBvVM/mB
 pUpMq0SgwPoJiJ0mak6ikvpYbDR54YmwdeBWBKktha6MIXSw6LjOyEdx/
 wkOJzt8uI17KeFfpWyLehvoa5XPZl5FFVSBMRFwgyqtuJDe46RtJpHUj/
 mSb97yGJndt23palt4GqSnL8O0iJ67TE3mKE+GDhbawwgrfepBHFmaNfa w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="358752810"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; d="scan'208";a="358752810"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 19:27:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="998318989"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; d="scan'208";a="998318989"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by fmsmga005.fm.intel.com with ESMTP; 14 Feb 2023 19:27:45 -0800
Date: Wed, 15 Feb 2023 11:35:33 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH RESEND 02/18] tests: Rename test-x86-cpuid.c to
 test-x86-apicid.c
Message-ID: <Y+xTBXvOEOpOJEj0@liuzhao-OptiPlex-7080>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
 <20230213093625.158170-3-zhao1.liu@linux.intel.com>
 <cf0e39e0-4c49-18ed-5b5a-b438bd6e76b7@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf0e39e0-4c49-18ed-5b5a-b438bd6e76b7@huawei.com>
Received-SPF: none client-ip=192.55.52.88;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga01.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

On Wed, Feb 15, 2023 at 10:36:34AM +0800, wangyanan (Y) wrote:
> Date: Wed, 15 Feb 2023 10:36:34 +0800
> From: "wangyanan (Y)" <wangyanan55@huawei.com>
> Subject: Re: [PATCH RESEND 02/18] tests: Rename test-x86-cpuid.c to
>  test-x86-apicid.c
> 
> ÔÚ 2023/2/13 17:36, Zhao Liu Ð´µÀ:
> > From: Zhao Liu <zhao1.liu@intel.com>
> > 
> > In fact, this unit tests APIC ID other than CPUID.
> > Rename to test-x86-apicid.c to make its name more in line with its
> > actual content.
> > 
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > ---
> >   MAINTAINERS                                        | 2 +-
> >   tests/unit/meson.build                             | 4 ++--
> >   tests/unit/{test-x86-cpuid.c => test-x86-apicid.c} | 2 +-
> >   3 files changed, 4 insertions(+), 4 deletions(-)
> >   rename tests/unit/{test-x86-cpuid.c => test-x86-apicid.c} (99%)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 96e25f62acaa..71c1bc24371b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1679,7 +1679,7 @@ F: include/hw/southbridge/piix.h
> >   F: hw/misc/sga.c
> >   F: hw/isa/apm.c
> >   F: include/hw/isa/apm.h
> > -F: tests/unit/test-x86-cpuid.c
> > +F: tests/unit/test-x86-apicid.c
> >   F: tests/qtest/test-x86-cpuid-compat.c
> >   PC Chipset
> > diff --git a/tests/unit/meson.build b/tests/unit/meson.build
> > index ffa444f4323c..a9df2843e92e 100644
> > --- a/tests/unit/meson.build
> > +++ b/tests/unit/meson.build
> > @@ -20,8 +20,8 @@ tests = {
> >     'test-opts-visitor': [testqapi],
> >     'test-visitor-serialization': [testqapi],
> >     'test-bitmap': [],
> > -  # all code tested by test-x86-cpuid is inside topology.h
> > -  'test-x86-cpuid': [],
> > +  # all code tested by test-x86-apicid is inside topology.h
> > +  'test-x86-apicid': [],
> >     'test-cutils': [],
> >     'test-div128': [],
> >     'test-shift128': [],
> > diff --git a/tests/unit/test-x86-cpuid.c b/tests/unit/test-x86-apicid.c
> > similarity index 99%
> > rename from tests/unit/test-x86-cpuid.c
> > rename to tests/unit/test-x86-apicid.c
> > index bfabc0403a1a..2b104f86d7c2 100644
> > --- a/tests/unit/test-x86-cpuid.c
> > +++ b/tests/unit/test-x86-apicid.c
> > @@ -1,5 +1,5 @@
> >   /*
> > - *  Test code for x86 CPUID and Topology functions
> > + *  Test code for x86 APIC ID and Topology functions
> >    *
> I'm not very sure. The "CPUID" sounds like a general test for kinds of CPU
> IDs.

CPUID usually refers to that basic instruction in the x86 to obtain basic
cpu information. So such naming is prone to ambiguity.

The cpu topology info of x86 is parsed based on the apic id, including
the sub-ids of each topology levels (such as thread id/core id...etc.).
These sub-ids are all part of the apic id.

> Besides APIC IDs computed from x86_apicid_from_cpu_idx(), there are also
> topo IDs computed from x86_topo_ids_from_idx() although this kind of IDs
> are not tested in test-x86-cpuid.c so far.

What about "test-x86-topo.c" or "test-x86-topo-ids.c"?

> 
> Thanks,
> Yanan
> >    *  Copyright (c) 2012 Red Hat Inc.
> >    *
> 

