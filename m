Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD974696069
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 11:11:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRsHF-0000Om-1c; Tue, 14 Feb 2023 05:11:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRsHC-0000OW-T2
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 05:11:06 -0500
Received: from mga11.intel.com ([192.55.52.93])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRsHB-0002DT-2n
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 05:11:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676369465; x=1707905465;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TJbc/hGlGuBtxyVQ+0OIeR6GCyWqjJh6gU1MOOCMKy0=;
 b=TLiicbVs6mwTVwEi251hMil9OFK11jIGCgERTMqXcDQGbKUL5oaHyPwp
 V7U1xTqQAw8Le50vmqNBk+lbqNjmmITHTLH869WX0TJqrxy3gfHExijyv
 bqW1A5y9qdCRRmbadICWYCJ39F9uSMoas1DneRmoape5sf48JL4msfoTL
 WnDdm4kW1HRfXL35Q3fd5zRYoyFDnt+SApANqCzGPxTFTotbtHLAvnFXg
 u6noJb86Pi0ShgOnd0hWoScFrJY10vCThPRcUAIEEGdb9+gJqe7BJSUaT
 croqDc6XdE4ieMWvtb7vZuLQdSFOp0fyKcAJ4VOyWmiDM643BFbh0vPD4 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="328836925"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="328836925"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 02:11:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="701604029"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="701604029"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by orsmga001.jf.intel.com with ESMTP; 14 Feb 2023 02:10:59 -0800
Date: Tue, 14 Feb 2023 18:18:47 +0800
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
Subject: Re: [RFC 34/52] i386: Rename variable topo_info to apicid_topo
Message-ID: <Y+tgB63MQIWFx0kU@liuzhao-OptiPlex-7080>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-35-zhao1.liu@linux.intel.com>
 <0a17a258-2eef-38e9-5446-1eff19320c44@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a17a258-2eef-38e9-5446-1eff19320c44@linaro.org>
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Mon, Feb 13, 2023 at 02:28:54PM +0100, Philippe Mathieu-Daudé wrote:
> Date: Mon, 13 Feb 2023 14:28:54 +0100
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: Re: [RFC 34/52] i386: Rename variable topo_info to apicid_topo
> 
> On 13/2/23 10:50, Zhao Liu wrote:
> > From: Zhao Liu <zhao1.liu@intel.com>
> > 
> > Since X86ApicidTopoInfo is only used for APIC ID related work, the
> > common variable topo_info of X86ApicidTopoInfo type should be also
> > renamed to better suit its purpose.
> > 
> > Generic topology access should be obtained from MachineState.topo
> > (for the whole machine) or CPUState.topo (for the current CPU), and
> > apicid_topo (X86ApicidTopoInfo type) is only used to collaborate with
> > APIC ID.
> > 
> > Co-Developed-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
> > Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > ---
> >   hw/i386/x86.c                |  38 ++++-----
> >   include/hw/i386/topology.h   |  76 ++++++++---------
> >   include/hw/i386/x86.h        |   2 +-
> >   target/i386/cpu.c            |  71 ++++++++--------
> >   tests/unit/test-x86-apicid.c | 158 +++++++++++++++++------------------
> >   5 files changed, 173 insertions(+), 172 deletions(-)
> 
> The 'id' suffix doesn't add a lot of value IMO. Anyway,
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>

Thanks, it makes sense. I'll remove the id suffix.

Zhao


