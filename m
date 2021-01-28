Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 707D3307D11
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:54:19 +0100 (CET)
Received: from localhost ([::1]:48460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5BUo-0008Ef-Bb
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:54:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l5BI1-0006cx-OK
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:41:07 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l5BHw-0007cD-K8
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:41:05 -0500
Received: from fraeml707-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DRSKG0QkBz67fHY;
 Fri, 29 Jan 2021 01:34:58 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml707-chm.china.huawei.com (10.206.15.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 28 Jan 2021 18:40:53 +0100
Received: from localhost (10.47.74.140) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 28 Jan
 2021 17:40:52 +0000
Date: Thu, 28 Jan 2021 17:40:09 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Ben Widawsky <ben@bwidawsk.net>
Subject: Re: [RFC PATCH v2 24/32] hw/cxl/device: Add a memory device (8.2.8.5)
Message-ID: <20210128174009.00007536@Huawei.com>
In-Reply-To: <20210128165801.pvskbbkogz722sns@mail.bwidawsk.net>
References: <20210105165323.783725-1-ben.widawsky@intel.com>
 <20210105165323.783725-25-ben.widawsky@intel.com>
 <20210127220312.6850abe2@redhat.com>
 <20210127212645.ztuxaopjnwtm7u2i@intel.com>
 <20210128102538.000066ff@Huawei.com>
 <20210128150318.ujl2uzyzbygqnlg2@mail.bwidawsk.net>
 <20210128151444.2rjkcbhrwflq6zga@mail.bwidawsk.net>
 <20210128165151.skmzjvferaipavt6@mail.bwidawsk.net>
 <20210128165801.pvskbbkogz722sns@mail.bwidawsk.net>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.74.140]
X-ClientProxiedBy: lhreml732-chm.china.huawei.com (10.201.108.83) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Chris Browy <cbrowy@avery-design.com>,
 qemu-devel@nongnu.org,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Prashant V Agarwal <agpr123@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 08:58:01 -0800
Ben Widawsky <ben@bwidawsk.net> wrote:

> On 21-01-28 08:51:51, Ben Widawsky wrote:
> > On 21-01-28 07:14:44, Ben Widawsky wrote:  
> > > On 21-01-28 07:03:18, Ben Widawsky wrote:  
> > > > On 21-01-28 10:25:38, Jonathan Cameron wrote:  
> > > > > On Wed, 27 Jan 2021 13:26:45 -0800
> > > > > Ben Widawsky <ben.widawsky@intel.com> wrote:
> > > > >   
> > > > > > On 21-01-27 22:03:12, Igor Mammedov wrote:  
> > > > > > > On Tue,  5 Jan 2021 08:53:15 -0800
> > > > > > > Ben Widawsky <ben.widawsky@intel.com> wrote:
> > > > > > >     
> > > > > > > > A CXL memory device (AKA Type 3) is a CXL component that contains some
> > > > > > > > combination of volatile and persistent memory. It also implements the
> > > > > > > > previously defined mailbox interface as well as the memory device
> > > > > > > > firmware interface.
> > > > > > > > 
> > > > > > > > The following example will create a 256M device in a 512M window:
> > > > > > > > 
> > > > > > > > -object "memory-backend-file,id=cxl-mem1,share,mem-path=cxl-type3,size=512M"
> > > > > > > > -device "cxl-type3,bus=rp0,memdev=cxl-mem1,id=cxl-pmem0,size=256M"    
> > > > > > > 
> > > > > > > I'd expect whole backend used by frontend, so one would not need "size" property
> > > > > > > on frontend (like we do with memory devices).
> > > > > > > So question is why it partially uses memdev?    
> > > > > > 
> > > > > > Answered in a separate thread...  
> > > > > 
> > > > > One possible suggestion inline.
> > > > >   
> > > > > > > > +
> > > > > > > > +static void cxl_setup_memory(CXLType3Dev *ct3d, Error **errp)
> > > > > > > > +{
> > > > > > > > +    MemoryRegionSection mrs;
> > > > > > > > +    MemoryRegion *mr;
> > > > > > > > +    uint64_t offset = 0;
> > > > > > > > +    size_t remaining_size;
> > > > > > > > +
> > > > > > > > +    if (!ct3d->hostmem) {
> > > > > > > > +        error_setg(errp, "memdev property must be set");
> > > > > > > > +        return;
> > > > > > > > +    }
> > > > > > > > +
> > > > > > > > +    /* FIXME: need to check mr is the host bridge's MR */
> > > > > > > > +    mr = host_memory_backend_get_memory(ct3d->hostmem);
> > > > > > > > +
> > > > > > > > +    /* Create our new subregion */
> > > > > > > > +    ct3d->cxl_dstate.pmem = g_new(MemoryRegion, 1);
> > > > > > > > +
> > > > > > > > +    /* Find the first free space in the window */
> > > > > > > > +    WITH_RCU_READ_LOCK_GUARD()
> > > > > > > > +    {
> > > > > > > > +        mrs = memory_region_find(mr, offset, 1);
> > > > > > > > +        while (mrs.mr && mrs.mr != mr) {
> > > > > > > > +            offset += memory_region_size(mrs.mr);
> > > > > > > > +            mrs = memory_region_find(mr, offset, 1);
> > > > > > > > +        }
> > > > > > > > +    }
> > > > > > > > +
> > > > > > > > +    remaining_size = memory_region_size(mr) - offset;
> > > > > > > > +    if (remaining_size < ct3d->size) {
> > > > > > > > +        g_free(ct3d->cxl_dstate.pmem);
> > > > > > > > +        error_setg(errp,
> > > > > > > > +                   "Not enough free space (%zd) required for device (%" PRId64  ")",
> > > > > > > > +                   remaining_size, ct3d->size);
> > > > > > > > +    }
> > > > > > > > +
> > > > > > > > +    /* Register our subregion as non-volatile */
> > > > > > > > +    memory_region_init_ram(ct3d->cxl_dstate.pmem, OBJECT(ct3d),
> > > > > > > > +                           "cxl_type3-memory", ct3d->size, errp);    
> > > > > > > this allocates ct3d->size of anon RAM, was this an intention?
> > > > > > > If yes, can you clarify why extra RAM is used instead of using what
> > > > > > > backend provides?    
> > > > > > 
> > > > > > It sounds like I'm doing the wrong thing then. There should be one chunk of
> > > > > > memory which is a subset of the full memory backend object. Could you please
> > > > > > advise on what I should be doing instead? Is add_subregion() sufficient?  
> > > > > 
> > > > > Taking inspiration from nvdimm I'm carrying a patch that uses
> > > > > memory_region_init_alias(ct3d->cxl_dstate.pmem, OBJECT(qct3d)q,
> > > > > 			 "cxl_type3-memory", mr, offset, ct3d->size);
> > > > > 
> > > > > I 'think' that's doing the right thing, but haven't fully tested it yet
> > > > > so may be completely wrong :)
> > > > > 
> > > > > Then for the pmem addr, call memory_region_set_address() to put it
> > > > > in a particular location.
> > > > >   
> > > > 
> > > > Yes - this is what I'd like to do and what I initially tried, and I also believe
> > > > it's right, but it doesn't work.
> > > > 
> > > > range_invariant: Assertion `range->lob <= range->upb || range->lob == range->upb + 1' failed.
> > > > 
> > > > I was digging into this yesterday, but opted to start a new thread on the
> > > > matter.
> > > >   
> > > 
> > > Hmm. I think I need to figure out the right add_subregion after this and it
> > > might work. I'll keep digging, but if you have ideas, let me know.  
> > 
> > [snip]
> > 
> > I managed to get a bit further. With the following, I start getting complaints
> > about fragmented memory when adding devices later.
> > 
> >      memory_region_init_alias(ct3d->cxl_dstate.pmem, OBJECT(ct3d),
> >              "cxl_type3-memory", mr, mr->addr + offset, ct3d->size);
> >      memory_region_set_nonvolatile(ct3d->cxl_dstate.pmem, true);
> >      memory_region_add_subregion(mr, offset, ct3d->cxl_dstate.pmem);
> > 
> > -device nvdimm,memdev=nvmem1,id=nv1,label-size=2M,node=5: could not find position in guest address space for memory device - memory fragmented due to alignments
> >   
> 
> Ignore this. It was a problem with my commandline.
> 
> I think I have something limping along now.

Great.  It's going to get more interesting to do this 'right' though.

We'll need to define a memory window similar to device_mem which is used for
normal memory hotplug then export that window via the relevant ACPI tables
(once defined somewhere public).  Finally we'll then want to actually
do the memory_region_add_subregion() only on the OS / firmware having
configured the type3 device by setting it's PA base.

Going to be fiddly - but should be doable.  With it basically working
should be a series of sensible (ish) steps to get there.

Jonathan






