Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4AD69606E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 11:13:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRsJD-00016m-Kj; Tue, 14 Feb 2023 05:13:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRsJB-00016L-53
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 05:13:09 -0500
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRsJ9-0002R2-Ka
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 05:13:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676369587; x=1707905587;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=USE8fx3Q8AqDZ4khA5hFjGmY9+IBo5sbXTdWS0oH2Ts=;
 b=OYaTqsICtpOo/erFU13b/y5BVNnChysWbNS5TjJ6KkiWMmoetcgt2k3A
 lhDtH2qo4Hhq/+onMww0bZBo4vIazT4D2iPFqZQ6hTBq6ibr/1X2Ouyvz
 vqyMirzPZ/4KsPf4S/vh+91o/ppNSegWYLEITA+Lvg7UjV68eziUxbNsN
 haS+6UveIAPhaMwtShENq64bTUscXibGdO7LmOdrlhqsQI7kfLhnruQUX
 UsgBZgmi0jT8EH+uBw+DsFjfi92EKig6pNulBwcHS7izxSWXGWetG5gl9
 EZdqAhYWKdQLcuHuxvNe+jQN5X28oqkQzti15HVToVxrxvb25kGKqjnhd g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="319157466"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="319157466"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 02:12:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="793063730"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="793063730"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by orsmga004.jf.intel.com with ESMTP; 14 Feb 2023 02:12:55 -0800
Date: Tue, 14 Feb 2023 18:20:41 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [RFC 33/52] i386: Rename init_topo_info() to init_apic_topo_info()
Message-ID: <Y+tgeUxjoUu52SeB@liuzhao-OptiPlex-7080>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-34-zhao1.liu@linux.intel.com>
 <d43f8d3b-2376-5004-ef92-24e3aac36af9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d43f8d3b-2376-5004-ef92-24e3aac36af9@linaro.org>
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

On Mon, Feb 13, 2023 at 02:27:18PM +0100, Philippe Mathieu-Daudé wrote:
> Date: Mon, 13 Feb 2023 14:27:18 +0100
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: Re: [RFC 33/52] i386: Rename init_topo_info() to
>  init_apic_topo_info()
> 
> On 13/2/23 10:50, Zhao Liu wrote:
> > From: Zhao Liu <zhao1.liu@intel.com>
> > 
> > Rename init_topo_info() to init_apic_topo_info() to adapt
> > X86ApicidTopoInfo.
> > 
> > Co-Developed-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
> > Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > ---
> >   hw/i386/x86.c         | 12 ++++++------
> >   include/hw/i386/x86.h |  3 ++-
> >   2 files changed, 8 insertions(+), 7 deletions(-)
> 
> 
> > diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
> > index ac6f1e4a74af..d84f7717900c 100644
> > --- a/include/hw/i386/x86.h
> > +++ b/include/hw/i386/x86.h
> > @@ -98,7 +98,8 @@ struct X86MachineState {
> >   #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
> >   OBJECT_DECLARE_TYPE(X86MachineState, X86MachineClass, X86_MACHINE)
> > -void init_topo_info(X86ApicidTopoInfo *topo_info, const X86MachineState *x86ms);
> > +void init_apicid_topo_info(X86ApicidTopoInfo *topo_info,
> > +                           const X86MachineState *x86ms);
> 
> Maybe s/init_apicid_topo_info/init_apic_topo_info/?
> 
> Otherwise,
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
Will remove the "id" suffix. Thanks!

Zhao

