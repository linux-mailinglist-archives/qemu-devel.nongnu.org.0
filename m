Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E033651133
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 18:25:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Jt3-0004Na-LO; Mon, 19 Dec 2022 12:25:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1p7Jt1-0004NB-9j
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:25:11 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1p7Jsy-0003bM-CQ
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:25:11 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4NbRLp38H2z67KPP;
 Tue, 20 Dec 2022 01:21:06 +0800 (CST)
Received: from localhost (10.81.210.222) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 19 Dec
 2022 17:25:03 +0000
Date: Mon, 19 Dec 2022 17:25:02 +0000
To: Gregory Price <gregory.price@memverge.com>
CC: Gregory Price <gourry.memverge@gmail.com>, <qemu-devel@nongnu.org>,
 <linux-cxl@vger.kernel.org>, <alison.schofield@intel.com>,
 <dave@stgolabs.net>, <a.manzanares@samsung.com>, <bwidawsk@kernel.org>,
 <hchkuo@avery-design.com.tw>, <cbrowy@avery-design.com>,
 <ira.weiny@intel.com>
Subject: Re: [RFC v4 3/3] hw/cxl: Multi-Region CXL Type-3 Devices (Volatile
 and Persistent)
Message-ID: <20221219172502.00001338@Huawei.com>
In-Reply-To: <Y6CNcuIzUVmKL0SM@memverge.com>
References: <20221128150157.97724-1-gregory.price@memverge.com>
 <20221128150157.97724-4-gregory.price@memverge.com>
 <20221219124211.000032b7@Huawei.com>
 <Y6CNcuIzUVmKL0SM@memverge.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.81.210.222]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 19 Dec 2022 11:12:34 -0500
Gregory Price <gregory.price@memverge.com> wrote:

> On Mon, Dec 19, 2022 at 12:42:11PM +0000, Jonathan Cameron wrote:
> > As a process thing, when reworking a patch I picked up for the
> > CXL qemu gitlab tree, drop the SOB that I added as it's not relevant
> > to the new patch.
> >   
> 
> ack
> 
> > Still no need to post a new version unless you particularly
> > want to or there are other changes to make.  
> 
> ack
> 
> > > +Deprecations
> > > +------------
> > > +
> > > +The Type 3 device [memdev] attribute has been deprecated in favor
> > > +of the [persistent-memdev] and [volatile-memdev] attributes. [memdev]  
> > 
> > That's not quite correct as it sort of implies we could previously use
> > memdev for the volatile case.  
> 
> An early version of the patch explicitly errored out / warned the user
> if they attempted to do this, but that got rebuffed.  This could be
> added back in.

Ah. I was unclear. I just mean that the deprecation text here is a little
misleading.  Not commenting on the functionality in this patch.

> 
> > > -    return address_space_read(&ct3d->hostmem_as, dpa_offset, attrs, data, size);
> > > +    if (vmr) {
> > > +        if (dpa_offset <= int128_get64(vmr->size)) {
> > > +            as = &ct3d->hostvmem_as;  
> > 
> > As a follow up it might be worth exploring if we can combine the two address spaces.
> > I'm not keen to do it yet, because of no simple way to test it and it's less obviously
> > correct than just having separate address spaces.
> > 
> > Would involve mapping a the two hostmem regions into a container memory region which
> > would be the one we use to build the address space.  Advantage would be that we wouldn't
> > need special handling for which region it was in here or the write path as QEMUs
> > normal heirarchical memory regions would handle that for us.
> > I'm not 100% sure it would work though!
> >   
> 
> Originally I had tried putting them both into one, with the thought that
> since it's technically one device address space there should only be one
> way to access the address space instead of two.
> 
> After investigating, the address space has to be initialized with a
> memdev, and an address space only supports a single memdev, so i settled
> on two address spaces in order to keep the memdevs separate (considering
> each region may have different attributes).

I think an address space needs a memory region, not a memdev.
Initialize a container region with memory_region_init()
We could then add the two memdev associated regions (with different 
attributes) as subregions using memory_region_add_subregion()

Similar is done for the system memory
https://elixir.bootlin.com/qemu/latest/source/softmmu/physmem.c#L2675
creates it.  Then it's mostly accessed by get_system_memory()

Memory is then added to that at particular base addresses via for example
https://elixir.bootlin.com/qemu/latest/source/hw/arm/virt.c#L2210
and similar.
I think we can do the same here.

> 
> This opens the question as to how to actually represent a persistent
> memory device that can be partitioned as volatile.
> 
> Consider the following setup:
> 
> device[pmem 512mb, volatile 512 mb]
> produces:
>     memdev(512mb, pmem) && memdev(512mb, volatile)
> 
> But if I partition the device to 256p/768v, when i access data in range
> [256mb,512mb), then i have volatile data going into the persistent memory
> store by nature of the fact that the capacity is located in that memdev.
> 
> An alternative would be to require a vmem region the same size as the
> pmem region (+ whatever additional volatile capacity), but this
> means using 2x the resources to represent the real capacity of the
> device. That's not good.

Do we care enough about the overhead, given this is emulation only?
Not that I think this is the way to go

> 
> Another alternative would be to create a wrapper memdev that encompasses
> persistent and volatile operations, and then create the partitioning
> logic on top of it, such that it can use a single memdev while handling
> whatever sematics only apply to each individual region.
> 
> The tl;dr here:  Going down to a single address space would probably
> require writing a wrapper memdev that abstracts away all the
> partitioning logic.  Maybe that's worth it?

For current setup, I think we can just create memory region that handles both of them.

For the partitioning case, lots of options.  I'm not sure what will work best.
Maybe we just decide we don't care if a persistent region (memdev-pmem) is presented
as volatile. I don't think it will do any real harm in the emulation, but maybe
I'm wrong on that?

> 
> > > @@ -744,30 +891,35 @@ static void validate_lsa_access(MemoryRegion *mr, uint64_t size,
> > >  static uint64_t get_lsa(CXLType3Dev *ct3d, void *buf, uint64_t size,
> > >                      uint64_t offset)
> > >  {
> > > -    return size;
> > > +    return 0;  
> > 
> > Hmm. Maybe this should return an error, but then we can't use the uint64_t as a return
> > value.  As this function would never be called with !ct3d->lsa let's leave it as it stands.
> >   
> > >  }  
> 
> I originally wanted to do that, but I chose to keep the current contract
> semantics so as to minimize the change set.  I agree though that this
> should probably return an error.

Lets leave it for now.

Curious question on this lot. How are you testing it?  Some exciting scripts
to bring the hdm decoders up etc for the volatile region? Or some prototype
driver code?

Jonathan


