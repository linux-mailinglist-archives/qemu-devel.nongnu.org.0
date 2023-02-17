Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C38C69A440
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 04:21:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSrIk-0006tN-IR; Thu, 16 Feb 2023 22:20:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pSrIi-0006t6-KJ
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 22:20:44 -0500
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pSrIg-0006Bw-Pd
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 22:20:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676604042; x=1708140042;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pCEhkDVjvxON2TvuDG6s1uXOohGXcPPCxU4HIhYxjjo=;
 b=BtFrHMxF7Co4o7L5mbjAOIpdqPkWtcN9aPJ3nScO1q20687WKtzfFaV+
 t6xT30yuOFlRIaVBCrpWakirqqMlnnGEehrb3GCiKgHH8fJkLgfLnYYxH
 lbJ30zcuya/tZYfvBOz4f8g/BTCmW0Nw5rvhP66k144Z6TZfwcX+rwxsF
 pEq7LqmCgx8EMkNGDdx8oa3ujnqkBYf54t7jU/JhHhd9QS+ac5jsx0FTt
 mWpwsOdXVyp88ThMyWcMhFpD0ZhEYkVBZOI6+JNe6jwgUsONsY5fRQHWs
 Q68CMUvfUXGF5oUUfyALiKV33roZgIsZ0IQFpn8F0eURM/udTxHKukbMv g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="334100389"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="334100389"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 19:20:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="663743175"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="663743175"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by orsmga007.jf.intel.com with ESMTP; 16 Feb 2023 19:20:36 -0800
Date: Fri, 17 Feb 2023 11:28:28 +0800
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
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [RFC 42/52] hw/machine: Add hybrid_supported in generic topo
 properties
Message-ID: <Y+70XPYXH3bQ1ZfD@liuzhao-OptiPlex-7080>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-43-zhao1.liu@linux.intel.com>
 <e8102ed2-35b6-0fc2-c20b-dbfca89ec50b@huawei.com>
 <Y+xJI1k6yoOh8g6l@liuzhao-OptiPlex-7080>
 <0f9d94cb-e784-eaee-d081-b00c9a788548@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f9d94cb-e784-eaee-d081-b00c9a788548@huawei.com>
Received-SPF: none client-ip=134.134.136.65;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga03.intel.com
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

On Thu, Feb 16, 2023 at 08:28:37PM +0800, wangyanan (Y) wrote:
> Date: Thu, 16 Feb 2023 20:28:37 +0800
> From: "wangyanan (Y)" <wangyanan55@huawei.com>
> Subject: Re: [RFC 42/52] hw/machine: Add hybrid_supported in generic topo
>  properties
> 
> 在 2023/2/15 10:53, Zhao Liu 写道:
> > On Tue, Feb 14, 2023 at 09:46:50AM +0800, wangyanan (Y) wrote:
> > > Date: Tue, 14 Feb 2023 09:46:50 +0800
> > > From: "wangyanan (Y)" <wangyanan55@huawei.com>
> > > Subject: Re: [RFC 42/52] hw/machine: Add hybrid_supported in generic topo
> > >   properties
> > > 
> > > Hi Zhao,
> > > 
> > > 在 2023/2/13 17:50, Zhao Liu 写道:
> > > > From: Zhao Liu <zhao1.liu@intel.com>
> > > > 
> > > > Since hybrid cpu topology configuration can benefit not only x86, but
> > > > also other architectures/platforms that have supported (in real
> > > > machines) or will support hybrid CPU topology, "-hybrid" can be generic.
> > > > 
> > > > So add the generic topology property to configure if support hybrid
> > > > cpu topology for architectures/platforms in SmpCompatProps.
> > > > 
> > > > Also rename SmpCompatProps to TopoCompatProps to make this structure
> > > > more generic for both smp topology and hybrid topology.
> > > > 
> > > > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > > > ---
> > > >    include/hw/boards.h | 15 +++++++++++----
> > > >    1 file changed, 11 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/include/hw/boards.h b/include/hw/boards.h
> > > > index 34ec035b5c9f..17be3485e823 100644
> > > > --- a/include/hw/boards.h
> > > > +++ b/include/hw/boards.h
> > > > @@ -127,19 +127,26 @@ typedef struct {
> > > >    } CPUArchIdList;
> > > >    /**
> > > > - * SMPCompatProps:
> > > > - * @prefer_sockets - whether sockets are preferred over cores in smp parsing
> > > > + * TopoCompatProps:
> > > > + * @hybrid_support - whether hybrid cpu topology are supported by machine.
> > > inconsistent with the name in the definition below.
> > Thanks! Will fix.
> > 
> > > > + *                   Note that hybrid cpu topology requires to specify the
> > > > + *                   topology of each core so that there will no longer be
> > > > + *                   a default core topology, thus prefer_sockets won't work
> > > > + *                   when hybrid_support is enabled.
> > > > + * @prefer_sockets - whether sockets are preferred over cores in smp parsing.
> > > > + *                   Not work when hybrid_support is enabled.
> > > >     * @dies_supported - whether dies are supported by the machine
> > > >     * @clusters_supported - whether clusters are supported by the machine
> > > >     * @has_clusters - whether clusters are explicitly specified in the user
> > > >     *                 provided SMP configuration
> > > >     */
> > > >    typedef struct {
> > > > +    bool hybrid_supported;
> > > >        bool prefer_sockets;
> > > >        bool dies_supported;
> > > >        bool clusters_supported;
> > > >        bool has_clusters;
> > > > -} SMPCompatProps;
> > > > +} TopoCompatProps;
> > > Also here. "Rename SMPCompatProps to TopoCompatProps and
> > > move it to cpu-topology.h and adapt the code" should be organized
> > > in one or more separate patches, being pre-patches together with
> > > the conversion of CpuTopology before.
> > Do you think TopoCompatProps/SMPCompatProps should also be moved
> > into cpu-topology.h? It seems that SMPCompatProps is a collection
> > of properties of MachineClass.
> TopoCompatProps holds properties all about CPU topology, I think we
> can do this, cpu-topology.h will be included in boards.h any way. But it's
> ups to you whether to do this.😉

Yeah, it makes sense to manage all topologically related.
So I will, thanks!

> 
> Thanks,
> Yanan
> > > And put the "hybrid_supported"
> > > extension into another patch. Would this make it easier to review?
> > Yes, I agree. Thanks!
> > 
> > Zhao
> > 
> > > Thanks,
> > > Yanan
> > > >    /**
> > > >     * MachineClass:
> > > > @@ -281,7 +288,7 @@ struct MachineClass {
> > > >        bool nvdimm_supported;
> > > >        bool numa_mem_supported;
> > > >        bool auto_enable_numa;
> > > > -    SMPCompatProps smp_props;
> > > > +    TopoCompatProps smp_props;
> > > >        const char *default_ram_id;
> > > >        HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
> 

