Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF7E1988AD
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 02:08:54 +0200 (CEST)
Received: from localhost ([::1]:58446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJ4Sb-0005vP-NL
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 20:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35486)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yan.y.zhao@intel.com>) id 1jJ4LE-0004Y7-LS
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 20:01:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yan.y.zhao@intel.com>) id 1jJ4LC-0001YU-Au
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 20:01:16 -0400
Received: from mga11.intel.com ([192.55.52.93]:25078)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
 id 1jJ4LC-0001PD-1F
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 20:01:14 -0400
IronPort-SDR: mnt8PrCg8ulEDZ5egUeQYgSFV/F5o8JKOGnsAbXvXDYZfLMSt38aGZjbDgRg9QmDwKcgn2i9JR
 HG0nY2XyiMpA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2020 17:01:10 -0700
IronPort-SDR: cKPZwYX5xtMXxoc8B45mQDpH1GNSdF+bzp56ViGVmG1lPtorYWsPA8OS3XjzRI2fdCRJXHEJTa
 i6wx38qXV2Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,326,1580803200"; d="scan'208";a="248876712"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by orsmga003.jf.intel.com with ESMTP; 30 Mar 2020 17:01:04 -0700
Date: Mon, 30 Mar 2020 19:51:31 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH v16 Kernel 4/7] vfio iommu: Implementation of ioctl for
 dirty pages tracking.
Message-ID: <20200330235131.GB6478@joy-OptiPlex-7040>
References: <1585084732-18473-1-git-send-email-kwankhede@nvidia.com>
 <20200325021135.GB20109@joy-OptiPlex-7040>
 <33d38629-aeaf-1c30-26d4-958b998620b0@nvidia.com>
 <20200327003055.GB26419@joy-OptiPlex-7040>
 <deb8b18f-aa79-70d3-ce05-89b607f813c4@nvidia.com>
 <20200330032437.GD30683@joy-OptiPlex-7040>
 <e91dbf70-05bf-977f-208b-0fb5988af3a8@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e91dbf70-05bf-977f-208b-0fb5988af3a8@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 192.55.52.93
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

On Mon, Mar 30, 2020 at 09:49:21PM +0800, Kirti Wankhede wrote:
> 
> 
> On 3/30/2020 8:54 AM, Yan Zhao wrote:
> > On Fri, Mar 27, 2020 at 01:28:13PM +0800, Kirti Wankhede wrote:
> >> Hit send button little early.
> >>
> >>   >
> >>   > I checked v12, it's not like what I said.
> >>   > In v12, bitmaps are generated per vfio_dma, and combination of the
> >>   > bitmaps are required in order to generate a big bitmap suiting for dirty
> >>   > query. It can cause problem when offset not aligning.
> >>   > But what I propose here is to generate an rb tree orthogonal to the tree
> >>   > of vfio_dma.
> >>   >
> >>   > as to CPU cycles saving, I don't think iterating/translating page by page
> >>   > would achieve that purpose.
> >>   >
> >>
> >> Instead of creating one extra rb tree for dirty pages tracking in v10
> >> tried to use dma->pfn_list itself, we tried changes in v10, v11 and v12,
> >> latest version is evolved version with best possible approach after
> >> discussion. Probably, go through v11 as well.
> >> https://patchwork.kernel.org/patch/11298335/
> >>
> > I'm not sure why all those previous implementations are bound to
> > vfio_dma. for vIOMMU on, in most cases, a vfio_dma is only for a page,
> > so generating a one-byte bitmap for a single page in each vfio_dma ?
> > is it possible to creating one extra rb tree to keep dirty ranges, and
> > one fixed length kernel bitmap whose content is generated on query,
> > serving as a bouncing buffer for copy_to_user
> > 
> 
> One fixed length? what should be fixed value? then isn't it better to 
> fix the size to dma->size?
> 
> This is also to prevent DoS attack, user space application can query a 
> very large range.
> 
> >>
> >> On 3/27/2020 6:00 AM, Yan Zhao wrote:
> >>> On Fri, Mar 27, 2020 at 05:39:01AM +0800, Kirti Wankhede wrote:
> >>>>
> >>>>
> >>>> On 3/25/2020 7:41 AM, Yan Zhao wrote:
> >>>>> On Wed, Mar 25, 2020 at 05:18:52AM +0800, Kirti Wankhede wrote:
> >>>>>> VFIO_IOMMU_DIRTY_PAGES ioctl performs three operations:
> >>>>>> - Start dirty pages tracking while migration is active
> >>>>>> - Stop dirty pages tracking.
> >>>>>> - Get dirty pages bitmap. Its user space application's responsibility to
> >>>>>>      copy content of dirty pages from source to destination during migration.
> >>>>>>
> >>>>>> To prevent DoS attack, memory for bitmap is allocated per vfio_dma
> >>>>>> structure. Bitmap size is calculated considering smallest supported page
> >>>>>> size. Bitmap is allocated for all vfio_dmas when dirty logging is enabled
> >>>>>>
> >>>>>> Bitmap is populated for already pinned pages when bitmap is allocated for
> >>>>>> a vfio_dma with the smallest supported page size. Update bitmap from
> >>>>>> pinning functions when tracking is enabled. When user application queries
> >>>>>> bitmap, check if requested page size is same as page size used to
> >>>>>> populated bitmap. If it is equal, copy bitmap, but if not equal, return
> >>>>>> error.
> >>>>>>
> >>>>>> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> >>>>>> Reviewed-by: Neo Jia <cjia@nvidia.com>
> >>>>>> ---
> >>>>>>     drivers/vfio/vfio_iommu_type1.c | 266 +++++++++++++++++++++++++++++++++++++++-
> >>>>>>     1 file changed, 260 insertions(+), 6 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> >>>>>> index 70aeab921d0f..874a1a7ae925 100644
> >>>>>> --- a/drivers/vfio/vfio_iommu_type1.c
> >>>>>> +++ b/drivers/vfio/vfio_iommu_type1.c
> >>>>>> @@ -71,6 +71,7 @@ struct vfio_iommu {
> >>>>>>     	unsigned int		dma_avail;
> >>>>>>     	bool			v2;
> >>>>>>     	bool			nesting;
> >>>>>> +	bool			dirty_page_tracking;
> >>>>>>     };
> >>>>>>     
> >>>>>>     struct vfio_domain {
> >>>>>> @@ -91,6 +92,7 @@ struct vfio_dma {
> >>>>>>     	bool			lock_cap;	/* capable(CAP_IPC_LOCK) */
> >>>>>>     	struct task_struct	*task;
> >>>>>>     	struct rb_root		pfn_list;	/* Ex-user pinned pfn list */
> >>>>>> +	unsigned long		*bitmap;
> >>>>>>     };
> >>>>>>     
> >>>>>>     struct vfio_group {
> >>>>>> @@ -125,7 +127,21 @@ struct vfio_regions {
> >>>>>>     #define IS_IOMMU_CAP_DOMAIN_IN_CONTAINER(iommu)	\
> >>>>>>     					(!list_empty(&iommu->domain_list))
> >>>>>>     
> >>>>>> +#define DIRTY_BITMAP_BYTES(n)	(ALIGN(n, BITS_PER_TYPE(u64)) / BITS_PER_BYTE)
> >>>>>> +
> >>>>>> +/*
> >>>>>> + * Input argument of number of bits to bitmap_set() is unsigned integer, which
> >>>>>> + * further casts to signed integer for unaligned multi-bit operation,
> >>>>>> + * __bitmap_set().
> >>>>>> + * Then maximum bitmap size supported is 2^31 bits divided by 2^3 bits/byte,
> >>>>>> + * that is 2^28 (256 MB) which maps to 2^31 * 2^12 = 2^43 (8TB) on 4K page
> >>>>>> + * system.
> >>>>>> + */
> >>>>>> +#define DIRTY_BITMAP_PAGES_MAX	(uint64_t)(INT_MAX - 1)
> >>>>>> +#define DIRTY_BITMAP_SIZE_MAX	 DIRTY_BITMAP_BYTES(DIRTY_BITMAP_PAGES_MAX)
> >>>>>> +
> >>>>>>     static int put_pfn(unsigned long pfn, int prot);
> >>>>>> +static unsigned long vfio_pgsize_bitmap(struct vfio_iommu *iommu);
> >>>>>>     
> >>>>>>     /*
> >>>>>>      * This code handles mapping and unmapping of user data buffers
> >>>>>> @@ -175,6 +191,77 @@ static void vfio_unlink_dma(struct vfio_iommu *iommu, struct vfio_dma *old)
> >>>>>>     	rb_erase(&old->node, &iommu->dma_list);
> >>>>>>     }
> >>>>>>     
> >>>>>> +
> >>>>>> +static int vfio_dma_bitmap_alloc(struct vfio_dma *dma, uint64_t pgsize)
> >>>>>> +{
> >>>>>> +	uint64_t npages = dma->size / pgsize;
> >>>>>> +
> > If pgsize > dma->size, npages = 0.
> > wouldn't it cause problem?
> > 
> 
> This patch-set supports bitmap for smallest supported page size, i.e. 
> PAGE_SIZE. vfio_dma_do_map() validates dma->size accordingly. So this 
> case will not happen.
> 
as far as I know, qemu/kvm uses 4k as the unit for dirty page tracking.
so why smallest iommu page size is used here?
wouldn't it cause problem?

Thanks
Yan


