Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A94696643
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 15:14:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRw4o-0007zr-2d; Tue, 14 Feb 2023 09:14:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRw4e-0007xj-Vq
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 09:14:25 -0500
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRw4c-0004Xh-SE
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 09:14:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676384062; x=1707920062;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=x9ZaFbv3Wt/bS0lvkEaFRgOCJJ84KiZjG5cIM3SrbGc=;
 b=MojMLDyXCGfC3EAhaX8aqeiwCQYiK+X/o0CZGBb6A/j7rDbeLQmWKJ/D
 zgJCEG3r3RBL/nl/pTTNb+uSP7svvh8kYVBodYnenVNwKM0VdTLXG8B0Z
 v0+1F3W/pZTmd78pogBvqkVetEAr7+EwjcYHimwpyd/6WnN9T4fN/ZJCq
 w1QMHghp6gof7alyaK+CcRG1EpnulnHGfDHQpe+maTJk3ZNo7PuuxTGoF
 gqr7Y2zoxRtV/Yve92fcUBa99ofhXn2UTUxqiSZ6f1sd4ituOiBbdjQOg
 7tbNRs3ioZZmj3r3xqBtZNLViwVj32kP46WnsBtjLItD0ffZCVwdPKJRl Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="319197150"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="319197150"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 06:14:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="732906810"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="732906810"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by fmsmga008.fm.intel.com with ESMTP; 14 Feb 2023 06:14:16 -0800
Date: Tue, 14 Feb 2023 22:22:04 +0800
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
Subject: Re: [PATCH RESEND 01/18] machine: Fix comment of
 machine_parse_smp_config()
Message-ID: <Y+uZDAlt6BAuTY69@liuzhao-OptiPlex-7080>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
 <20230213093625.158170-2-zhao1.liu@linux.intel.com>
 <0f64a5cd-a97c-ee54-e131-387fee0be853@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f64a5cd-a97c-ee54-e131-387fee0be853@huawei.com>
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga02.intel.com
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

On Mon, Feb 13, 2023 at 09:31:53PM +0800, wangyanan (Y) wrote:
> Date: Mon, 13 Feb 2023 21:31:53 +0800
> From: "wangyanan (Y)" <wangyanan55@huawei.com>
> Subject: Re: [PATCH RESEND 01/18] machine: Fix comment of
>  machine_parse_smp_config()
> 
> 
> ÔÚ 2023/2/13 17:36, Zhao Liu Ð´µÀ:
> > From: Zhao Liu <zhao1.liu@intel.com>
> > 
> > Now smp supports dies and clusters, so add description about these 2
> > levels in the comment of machine_parse_smp_config().
> > 
> > Fixes: 864c3b5 (hw/core/machine: Introduce CPU cluster topology support)
> > Suggested-by: Robert Hoo <robert.hu@linux.intel.com>
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > ---
> >   hw/core/machine-smp.c | 7 ++++---
> >   1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
> > index c3dab007dadc..3fd9e641efde 100644
> > --- a/hw/core/machine-smp.c
> > +++ b/hw/core/machine-smp.c
> > @@ -51,8 +51,8 @@ static char *cpu_hierarchy_to_string(MachineState *ms)
> >    * machine_parse_smp_config: Generic function used to parse the given
> >    *                           SMP configuration
> >    *
> > - * Any missing parameter in "cpus/maxcpus/sockets/cores/threads" will be
> > - * automatically computed based on the provided ones.
> > + * Any missing parameter in "cpus/maxcpus/sockets/dies/clusters/cores/threads"
> > + * will be automatically computed based on the provided ones.
> This is intential. Newly added topo params (apart from maxcpus/
> socket/cores/threads) wiil be assigned to 1 and not computed
> based the provided ones. There is no problem about this part.

Sorry, I see. Will fix.

> >    *
> >    * In the calculation of omitted sockets/cores/threads: we prefer sockets
> >    * over cores over threads before 6.2, while preferring cores over sockets
> > @@ -66,7 +66,8 @@ static char *cpu_hierarchy_to_string(MachineState *ms)
> >    *
> >    * For compatibility, apart from the parameters that will be computed, newly
> >    * introduced topology members which are likely to be target specific should
> > - * be directly set as 1 if they are omitted (e.g. dies for PC since 4.1).
> > + * be directly set as 1 if they are omitted (e.g. dies for PC since v4.1 and
> > + * clusters for arm since v7.0).
> >    */
> Given that we are going to support cluster for PC machine.
> Maybe simple "(i.e. dies for PC since 4.1)" here is good enough?

Makes sense. Now I understand this logic, and I will drop this commit.

Thanks,
Zhao

> 
> Thanks,
> Yanan
> >   void machine_parse_smp_config(MachineState *ms,
> >                                 const SMPConfiguration *config, Error **errp)
> 

