Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 256911E3954
	for <lists+qemu-devel@lfdr.de>; Wed, 27 May 2020 08:35:40 +0200 (CEST)
Received: from localhost ([::1]:36996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdpf8-0000Pm-O6
	for lists+qemu-devel@lfdr.de; Wed, 27 May 2020 02:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yan.y.zhao@intel.com>)
 id 1jdpdi-0008BQ-5K
 for qemu-devel@nongnu.org; Wed, 27 May 2020 02:34:10 -0400
Received: from mga18.intel.com ([134.134.136.126]:49926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yan.y.zhao@intel.com>)
 id 1jdpdb-0000bh-67
 for qemu-devel@nongnu.org; Wed, 27 May 2020 02:34:08 -0400
IronPort-SDR: Nv+loqVpqjS0oewT5S7JFmIA2K0kGWUCS4Jv6wQyg5keuGPAakgrEY6d1tihW/4giGKfZJuklx
 tmun28wdFN6g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2020 23:33:56 -0700
IronPort-SDR: D+qwpLaEIeXdxh/+dphpQ9hVejIkpcmzxBsE+zDn5CheAb5bMquiAl/270s8L8BH1rFkEyw/TF
 0OsoLG+AM+og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,440,1583222400"; d="scan'208";a="442397649"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by orsmga005.jf.intel.com with ESMTP; 26 May 2020 23:33:51 -0700
Date: Wed, 27 May 2020 02:23:58 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH Kernel v22 0/8] Add UAPIs to support migration for VFIO
 devices
Message-ID: <20200527062358.GD19560@joy-OptiPlex-7040>
References: <1589781397-28368-1-git-send-email-kwankhede@nvidia.com>
 <20200519105804.02f3cae8@x1.home>
 <20200525065925.GA698@joy-OptiPlex-7040>
 <426a5314-6d67-7cbe-bad0-e32f11d304ea@nvidia.com>
 <20200526141939.2632f100@x1.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526141939.2632f100@x1.home>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=yan.y.zhao@intel.com; helo=mga18.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/27 02:33:56
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Zhengxiao.zx@Alibaba-inc.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 cjia@nvidia.com, kvm@vger.kernel.org, eskultet@redhat.com, ziye.yang@intel.com,
 qemu-devel@nongnu.org, cohuck@redhat.com, shuangtai.tst@alibaba-inc.com,
 dgilbert@redhat.com, zhi.a.wang@intel.com, mlevitsk@redhat.com,
 pasic@linux.ibm.com, aik@ozlabs.ru, Kirti Wankhede <kwankhede@nvidia.com>,
 eauger@redhat.com, felipe@nutanix.com, jonathan.davies@nutanix.com,
 changpeng.liu@intel.com, Ken.Xue@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 26, 2020 at 02:19:39PM -0600, Alex Williamson wrote:
> On Mon, 25 May 2020 18:50:54 +0530
> Kirti Wankhede <kwankhede@nvidia.com> wrote:
> 
> > On 5/25/2020 12:29 PM, Yan Zhao wrote:
> > > On Tue, May 19, 2020 at 10:58:04AM -0600, Alex Williamson wrote:  
> > >> Hi folks,
> > >>
> > >> My impression is that we're getting pretty close to a workable
> > >> implementation here with v22 plus respins of patches 5, 6, and 8.  We
> > >> also have a matching QEMU series and a proposal for a new i40e
> > >> consumer, as well as I assume GVT-g updates happening internally at
> > >> Intel.  I expect all of the latter needs further review and discussion,
> > >> but we should be at the point where we can validate these proposed
> > >> kernel interfaces.  Therefore I'd like to make a call for reviews so
> > >> that we can get this wrapped up for the v5.8 merge window.  I know
> > >> Connie has some outstanding documentation comments and I'd like to make
> > >> sure everyone has an opportunity to check that their comments have been
> > >> addressed and we don't discover any new blocking issues.  Please send
> > >> your Acked-by/Reviewed-by/Tested-by tags if you're satisfied with this
> > >> interface and implementation.  Thanks!
> > >>  
> > > hi Alex
> > > after porting gvt/i40e vf migration code to kernel/qemu v23, we spoted
> > > two bugs.
> > > 1. "Failed to get dirty bitmap for iova: 0xfe011000 size: 0x3fb0 err: 22"
> > >     This is a qemu bug that the dirty bitmap query range is not the same
> > >     as the dma map range. It can be fixed in qemu. and I just have a little
> > >     concern for kernel to have this restriction.
> > >   
> > 
> > I never saw this unaligned size in my testing. In this case if you can 
> > provide vfio_* event traces, that will helpful.
> 
> Yeah, I'm curious why we're hitting such a call path, I think we were
> designing this under the assumption we wouldn't see these.  I also
that's because the algorithm for getting dirty bitmap query range is still not exactly
matching to that for dma map range in vfio_dma_map().


> wonder if we really need to enforce the dma mapping range for getting
> the dirty bitmap with the current implementation (unmap+dirty obviously
> still has the restriction).  We do shift the bitmap in place for
> alignment, but I'm not sure why we couldn't shift it back and only
> clear the range that was reported.  Kirti, do you see other issues?  I
> think a patch to lift that restriction is something we could plan to
> include after the initial series is included and before we've committed
> to the uapi at the v5.8 release.
>  
> > > 2. migration abortion, reporting
> > > "qemu-system-x86_64-lm: vfio_load_state: Error allocating buffer
> > > qemu-system-x86_64-lm: error while loading state section id 49(vfio)
> > > qemu-system-x86_64-lm: load of migration failed: Cannot allocate memory"
> > > 
> > > It's still a qemu bug and we can fixed it by
> > > "
> > > if (migration->pending_bytes == 0) {
> > > +            qemu_put_be64(f, 0);
> > > +            qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
> > > "  
> > 
> > In which function in QEMU do you have to add this?
> 
> I think this is relative to QEMU path 09/ where Yan had the questions
> below on v16 and again tried to get answers to them on v22:
> 
> https://lore.kernel.org/qemu-devel/20200520031323.GB10369@joy-OptiPlex-7040/
> 
> Kirti, please address these questions.
> 
> > > and actually there are some extra concerns about this part, as reported in
> > > [1][2].
> > > 
> > > [1] data_size should be read ahead of data_offset
> > > https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg02795.html.
> > > [2] should not repeatedly update pending_bytes in vfio_save_iterate()
> > > https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg02796.html.
> > > 
> > > but as those errors are all in qemu, and we have finished basic tests in
> > > both gvt & i40e, we're fine with the kernel part interface in general now.
> > > (except for my concern [1], which needs to update kernel patch 1)
> > >   
> > 
> >  >> what if pending_bytes is not 0, but vendor driver just does not want  to
> >  >> send data in this iteration? isn't it right to get data_size first   
> > before
> >  >> getting data_offset?  
> > 
> > If vendor driver doesn't want to send data but still has data in staging 
> > buffer, vendor driver still can control to send pending_bytes for this 
> > iteration as 0 as this is a trap field.
> > 
> > I would defer this to Alex.
> 
> This is my understanding of the protocol as well, when the device is
> running, pending_bytes might drop to zero if no internal state has
> changed and may be non-zero on the next iteration due to device
> activity.  When the device is not running, pending_bytes reporting zero
> indicates the device is done, there is no further state to transmit.
> Does that meet your need/expectation?
>
(1) on one side, as in vfio_save_pending(),
vfio_save_pending()
{
    ...
    ret = vfio_update_pending(vbasedev);
    ...
    *res_precopy_only += migration->pending_bytes;
    ...
}
the pending_bytes tells migration thread how much data is still hold in
device side.
the device data includes
device internal data + running device dirty data + device state.

so the pending_bytes should include device state as well, right?
if so, the pending_bytes should never reach 0 if there's any device
state to be sent after device is stopped.

(2) on the other side,
along side we updated the pending_bytes in vfio_save_pending() and
enter into the vfio_save_iterate(), if we repeatedly update
pending_bytes in vfio_save_iterate(), it would enter into a scenario
like

initially pending_bytes=500M.
vfio_save_iterate() -->
  round 1: transmitted 500M.
  round 2: update pending bytes, pending_bytes=50M (50M dirty data).
  round 3: update pending bytes, pending_bytes=50M.
  ...
  round N: update pending bytes, pending_bytes=50M.

If there're two vfio devices, the vfio_save_iterate() for the second device
may never get chance to be called because there's always pending_bytes
produced by the first device, even the size if small.

> > > so I wonder which way in your mind is better, to give our reviewed-by to
> > > the kernel part now, or hold until next qemu fixes?
> > > and as performance data from gvt is requested from your previous mail, is
> > > that still required before the code is accepted?
> 
> The QEMU series does not need to be perfect, I kind of expect we might
> see a few iterations of that beyond the kernel portion being accepted.
> We should have the QEMU series to the point that we've resolved any
> uapi issues though, which it seems like we're pretty close to having.
> Ideally I'd like to get the kernel series into my next branch before
> the merge window opens, where it seems like upstream is on schedule to
> have that happen this Sunday.  If you feel we're to the point were we
> can iron a couple details out during the v5.8 development cycle, then
> please provide your reviewed-by.  We haven't fully committed to a uapi
> until we've committed to it for a non-rc release.
> 
got it.

> I think the performance request was largely due to some conversations
> with Dave Gilbert wondering if all this actually works AND is practical
> for a LIVE migration.  I think we're all curious about things like how
> much data does a GPU have to transfer in each phase of migration, and
> particularly if the final phase is going to be a barrier to claiming
> the VM is actually sufficiently live.  I'm not sure we have many
> options if a device simply has a very large working set, but even
> anecdotal evidence that the stop-and-copy phase transfers abMB from the
> device while idle or xyzMB while active would give us some idea what to
for intel vGPU, the data is
single-round dirty query:
data to be transferred at stop-and-copy phase: 90MB+ ~ 900MB+, including
- device state: 9MB
- system dirty memory: 80MB+ ~ 900MB+ (depending on workload type)

multi-round dirty query :
-each iteration data: 60MB ~ 400MB
-data to be transferred at stop-and-copy phase: 70MB ~ 400MB



BTW, for viommu, the downtime data is as below. under the same network
condition and guest memory size, and no running dirty data/memory produced
by device.
(1) viommu off
single-round dirty query: downtime ~100ms 
(2) viommu on
single-round dirty query: downtime 58s 

Thanks
Yan
> expect.  Kirti, have you done any of those sorts of tests for NVIDIA's
> driver?
> 
> > > BTW, we have also conducted some basic tests when viommu is on, and found out
> > > errors like
> > > "qemu-system-x86_64-dt: vtd_iova_to_slpte: detected slpte permission error (iova=0x0, level=0x3, slpte=0x0, write=1)
> > > qemu-system-x86_64-dt: vtd_iommu_translate: detected translation failure (dev=00:03:00, iova=0x0)
> > > qemu-system-x86_64-dt: New fault is not recorded due to compression of faults".
> > >   
> > 
> > I saw these errors, I'm looking into it.
> 
> Let's try to at least determine if this is a uapi issue or just a QEMU
> implementation bug for progressing the kernel series.  Thanks,
> 
> Alex
> 

