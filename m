Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B5C19726C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 04:25:39 +0200 (CEST)
Received: from localhost ([::1]:43500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIk7O-0000vt-1x
	for lists+qemu-devel@lfdr.de; Sun, 29 Mar 2020 22:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53383)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yan.y.zhao@intel.com>) id 1jIk6c-0000WS-9U
 for qemu-devel@nongnu.org; Sun, 29 Mar 2020 22:24:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yan.y.zhao@intel.com>) id 1jIk6a-0001lP-6T
 for qemu-devel@nongnu.org; Sun, 29 Mar 2020 22:24:49 -0400
Received: from mga04.intel.com ([192.55.52.120]:39280)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
 id 1jIk6Z-0001iR-Tx
 for qemu-devel@nongnu.org; Sun, 29 Mar 2020 22:24:48 -0400
IronPort-SDR: tdA+dgfXJIbK8fuAX4tydyNlC/Rj9+ofd9rgvSVOuogWKAGwZcLlnXRTuPafyZGc2+4qU4MXRn
 rLsYDwm9GtGg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2020 19:24:44 -0700
IronPort-SDR: LNQIuW64wDlZVPiKJn63DVtJ/4DNuUQCARCuBcqiUEX2HuSoubJXLUtXjhIkmRiR8EvUBy4uVh
 ATXPTOhCKy5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,322,1580803200"; d="scan'208";a="272224977"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by fmsmga004.fm.intel.com with ESMTP; 29 Mar 2020 19:24:39 -0700
Date: Sun, 29 Mar 2020 22:15:06 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH v16 Kernel 5/7] vfio iommu: Update UNMAP_DMA ioctl to get
 dirty bitmap before unmap
Message-ID: <20200330021506.GC30683@joy-OptiPlex-7040>
References: <1585078359-20124-1-git-send-email-kwankhede@nvidia.com>
 <1585078359-20124-6-git-send-email-kwankhede@nvidia.com>
 <20200325021800.GC20109@joy-OptiPlex-7040>
 <3cabb357-b9c5-f8b3-5d57-1178ec0dde5a@nvidia.com>
 <20200327000426.GA26419@joy-OptiPlex-7040>
 <b6524b4a-e6a0-7328-5003-7286f2fd61a8@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6524b4a-e6a0-7328-5003-7286f2fd61a8@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 192.55.52.120
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
Cc: "Zhengxiao.zx@Alibaba-inc.com" <Zhengxiao.zx@Alibaba-inc.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "eauger@redhat.com" <eauger@redhat.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>, "Liu,
 Changpeng" <changpeng.liu@intel.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 27, 2020 at 12:42:43PM +0800, Kirti Wankhede wrote:
> 
> 
> On 3/27/2020 5:34 AM, Yan Zhao wrote:
> > On Fri, Mar 27, 2020 at 05:39:44AM +0800, Kirti Wankhede wrote:
> >>
> >>
> >> On 3/25/2020 7:48 AM, Yan Zhao wrote:
> >>> On Wed, Mar 25, 2020 at 03:32:37AM +0800, Kirti Wankhede wrote:
> >>>> DMA mapped pages, including those pinned by mdev vendor drivers, might
> >>>> get unpinned and unmapped while migration is active and device is still
> >>>> running. For example, in pre-copy phase while guest driver could access
> >>>> those pages, host device or vendor driver can dirty these mapped pages.
> >>>> Such pages should be marked dirty so as to maintain memory consistency
> >>>> for a user making use of dirty page tracking.
> >>>>
> >>>> To get bitmap during unmap, user should allocate memory for bitmap, set
> >>>> size of allocated memory, set page size to be considered for bitmap and
> >>>> set flag VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP.
> >>>>
> >>>> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> >>>> Reviewed-by: Neo Jia <cjia@nvidia.com>
> >>>> ---
> >>>>    drivers/vfio/vfio_iommu_type1.c | 54 ++++++++++++++++++++++++++++++++++++++---
> >>>>    include/uapi/linux/vfio.h       | 10 ++++++++
> >>>>    2 files changed, 60 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> >>>> index 27ed069c5053..b98a8d79e13a 100644
> >>>> --- a/drivers/vfio/vfio_iommu_type1.c
> >>>> +++ b/drivers/vfio/vfio_iommu_type1.c
> >>>> @@ -982,7 +982,8 @@ static int verify_bitmap_size(uint64_t npages, uint64_t bitmap_size)
> >>>>    }
> >>>>    
> >>>>    static int vfio_dma_do_unmap(struct vfio_iommu *iommu,
> >>>> -			     struct vfio_iommu_type1_dma_unmap *unmap)
> >>>> +			     struct vfio_iommu_type1_dma_unmap *unmap,
> >>>> +			     struct vfio_bitmap *bitmap)
> >>>>    {
> >>>>    	uint64_t mask;
> >>>>    	struct vfio_dma *dma, *dma_last = NULL;
> >>>> @@ -1033,6 +1034,10 @@ static int vfio_dma_do_unmap(struct vfio_iommu *iommu,
> >>>>    	 * will be returned if these conditions are not met.  The v2 interface
> >>>>    	 * will only return success and a size of zero if there were no
> >>>>    	 * mappings within the range.
> >>>> +	 *
> >>>> +	 * When VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP flag is set, unmap request
> >>>> +	 * must be for single mapping. Multiple mappings with this flag set is
> >>>> +	 * not supported.
> >>>>    	 */
> >>>>    	if (iommu->v2) {
> >>>>    		dma = vfio_find_dma(iommu, unmap->iova, 1);
> >>>> @@ -1040,6 +1045,13 @@ static int vfio_dma_do_unmap(struct vfio_iommu *iommu,
> >>>>    			ret = -EINVAL;
> >>>>    			goto unlock;
> >>>>    		}
> >>>> +
> >>>> +		if ((unmap->flags & VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP) &&
> >>>> +		    (dma->iova != unmap->iova || dma->size != unmap->size)) {
> >>> potential NULL pointer!
> >>>
> >>> And could you address the comments in v14?
> >>> How to handle DSI unmaps in vIOMMU
> >>> (https://lore.kernel.org/kvm/20200323011041.GB5456@joy-OptiPlex-7040/)
> >>>
> >>
> >> Sorry, I drafted reply to it, but I missed to send, it remained in my drafts
> >>
> >>   >
> >>   > it happens in vIOMMU Domain level invalidation of IOTLB
> >>   > (domain-selective invalidation, see vtd_iotlb_domain_invalidate() in
> >> qemu).
> >>   > common in VTD lazy mode, and NOT just happening once at boot time.
> >>   > rather than invalidate page by page, it batches the page invalidation.
> >>   > so, when this invalidation takes place, even higher level page tables
> >>   > have been invalid and therefore it has to invalidate a bigger
> >> combined range.
> >>   > That's why we see IOVAs are mapped in 4k pages, but are unmapped in 2M
> >>   > pages.
> >>   >
> >>   > I think those UNMAPs should also have GET_DIRTY_BIMTAP flag on, right?
> >>
> >>
> >> vtd_iotlb_domain_invalidate()
> >>     vtd_sync_shadow_page_table()
> >>       vtd_sync_shadow_page_table_range(vtd_as, &ce, 0, UINT64_MAX)
> >>         vtd_page_walk()
> >>           vtd_page_walk_level() - walk over specific level for IOVA range
> >>             vtd_page_walk_one()
> >>               memory_region_notify_iommu()
> >>               ...
> >>                 vfio_iommu_map_notify()
> >>
> >> In the above trace, isn't page walk will take care of creating proper
> >> IOTLB entry which should be same as created during mapping for that
> >> IOTLB entry?
> >>
> > No. It does walk the page table, but as it's dsi (delay & batched unmap),
> > pages table entry for a whole 2M (the higher level, not last level for 4K)
> > range is invalid, so the iotlb->addr_mask what vfio_iommu_map_notify()
> > receives is (2M - 1), not the same as the size for map.
> > 
> 
> When do this happen? during my testing I never hit this case. How can I 
> hit this case?

Just common settings to enable vIOMMU:
Qemu: -device intel-iommu,caching-mode=true
guest kernel parameter: intel_iommu=on

(intel_iommu=on turns on lazy mode by default)

In lazy mode, guest notifies DMA MAP on page level, but notifies DMA UNMAPs
in batch.
with a pass-through NVMe, there are 89 DSI unmaps in 1 second for a typical fio.
With a pass-through GPU, there 22 DSI unmaps in total for benchmark openArena
(lasting around 55 secs)
> 
> In this case, will adjacent whole vfio_dmas will be clubbed together or 
> will there be any intersection of vfio_dmas?
>
clubbed together.

