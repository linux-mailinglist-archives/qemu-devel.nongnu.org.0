Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C7B307BB2
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:05:09 +0100 (CET)
Received: from localhost ([::1]:41764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5AjE-0007i5-Cc
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:05:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1l5AcX-0003F2-2y
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:58:13 -0500
Received: from zangief.bwidawsk.net ([107.170.211.233]:50152
 helo=mail.bwidawsk.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1l5AcV-0000Xv-3S
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:58:12 -0500
Received: by mail.bwidawsk.net (Postfix, from userid 5001)
 id F364B122C5B; Thu, 28 Jan 2021 08:58:09 -0800 (PST)
Received: from mail.bwidawsk.net (c-73-37-61-164.hsd1.or.comcast.net
 [73.37.61.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.bwidawsk.net (Postfix) with ESMTPSA id B45B9122C5B;
 Thu, 28 Jan 2021 08:58:02 -0800 (PST)
Date: Thu, 28 Jan 2021 08:58:01 -0800
From: Ben Widawsky <ben@bwidawsk.net>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [RFC PATCH v2 24/32] hw/cxl/device: Add a memory device (8.2.8.5)
Message-ID: <20210128165801.pvskbbkogz722sns@mail.bwidawsk.net>
References: <20210105165323.783725-1-ben.widawsky@intel.com>
 <20210105165323.783725-25-ben.widawsky@intel.com>
 <20210127220312.6850abe2@redhat.com>
 <20210127212645.ztuxaopjnwtm7u2i@intel.com>
 <20210128102538.000066ff@Huawei.com>
 <20210128150318.ujl2uzyzbygqnlg2@mail.bwidawsk.net>
 <20210128151444.2rjkcbhrwflq6zga@mail.bwidawsk.net>
 <20210128165151.skmzjvferaipavt6@mail.bwidawsk.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210128165151.skmzjvferaipavt6@mail.bwidawsk.net>
Received-SPF: none client-ip=107.170.211.233; envelope-from=ben@bwidawsk.net;
 helo=mail.bwidawsk.net
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Prashant V Agarwal <agpr123@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-01-28 08:51:51, Ben Widawsky wrote:
> On 21-01-28 07:14:44, Ben Widawsky wrote:
> > On 21-01-28 07:03:18, Ben Widawsky wrote:
> > > On 21-01-28 10:25:38, Jonathan Cameron wrote:
> > > > On Wed, 27 Jan 2021 13:26:45 -0800
> > > > Ben Widawsky <ben.widawsky@intel.com> wrote:
> > > > 
> > > > > On 21-01-27 22:03:12, Igor Mammedov wrote:
> > > > > > On Tue,  5 Jan 2021 08:53:15 -0800
> > > > > > Ben Widawsky <ben.widawsky@intel.com> wrote:
> > > > > >   
> > > > > > > A CXL memory device (AKA Type 3) is a CXL component that contains some
> > > > > > > combination of volatile and persistent memory. It also implements the
> > > > > > > previously defined mailbox interface as well as the memory device
> > > > > > > firmware interface.
> > > > > > > 
> > > > > > > The following example will create a 256M device in a 512M window:
> > > > > > > 
> > > > > > > -object "memory-backend-file,id=cxl-mem1,share,mem-path=cxl-type3,size=512M"
> > > > > > > -device "cxl-type3,bus=rp0,memdev=cxl-mem1,id=cxl-pmem0,size=256M"  
> > > > > > 
> > > > > > I'd expect whole backend used by frontend, so one would not need "size" property
> > > > > > on frontend (like we do with memory devices).
> > > > > > So question is why it partially uses memdev?  
> > > > > 
> > > > > Answered in a separate thread...
> > > > 
> > > > One possible suggestion inline.
> > > > 
> > > > > > > +
> > > > > > > +static void cxl_setup_memory(CXLType3Dev *ct3d, Error **errp)
> > > > > > > +{
> > > > > > > +    MemoryRegionSection mrs;
> > > > > > > +    MemoryRegion *mr;
> > > > > > > +    uint64_t offset = 0;
> > > > > > > +    size_t remaining_size;
> > > > > > > +
> > > > > > > +    if (!ct3d->hostmem) {
> > > > > > > +        error_setg(errp, "memdev property must be set");
> > > > > > > +        return;
> > > > > > > +    }
> > > > > > > +
> > > > > > > +    /* FIXME: need to check mr is the host bridge's MR */
> > > > > > > +    mr = host_memory_backend_get_memory(ct3d->hostmem);
> > > > > > > +
> > > > > > > +    /* Create our new subregion */
> > > > > > > +    ct3d->cxl_dstate.pmem = g_new(MemoryRegion, 1);
> > > > > > > +
> > > > > > > +    /* Find the first free space in the window */
> > > > > > > +    WITH_RCU_READ_LOCK_GUARD()
> > > > > > > +    {
> > > > > > > +        mrs = memory_region_find(mr, offset, 1);
> > > > > > > +        while (mrs.mr && mrs.mr != mr) {
> > > > > > > +            offset += memory_region_size(mrs.mr);
> > > > > > > +            mrs = memory_region_find(mr, offset, 1);
> > > > > > > +        }
> > > > > > > +    }
> > > > > > > +
> > > > > > > +    remaining_size = memory_region_size(mr) - offset;
> > > > > > > +    if (remaining_size < ct3d->size) {
> > > > > > > +        g_free(ct3d->cxl_dstate.pmem);
> > > > > > > +        error_setg(errp,
> > > > > > > +                   "Not enough free space (%zd) required for device (%" PRId64  ")",
> > > > > > > +                   remaining_size, ct3d->size);
> > > > > > > +    }
> > > > > > > +
> > > > > > > +    /* Register our subregion as non-volatile */
> > > > > > > +    memory_region_init_ram(ct3d->cxl_dstate.pmem, OBJECT(ct3d),
> > > > > > > +                           "cxl_type3-memory", ct3d->size, errp);  
> > > > > > this allocates ct3d->size of anon RAM, was this an intention?
> > > > > > If yes, can you clarify why extra RAM is used instead of using what
> > > > > > backend provides?  
> > > > > 
> > > > > It sounds like I'm doing the wrong thing then. There should be one chunk of
> > > > > memory which is a subset of the full memory backend object. Could you please
> > > > > advise on what I should be doing instead? Is add_subregion() sufficient?
> > > > 
> > > > Taking inspiration from nvdimm I'm carrying a patch that uses
> > > > memory_region_init_alias(ct3d->cxl_dstate.pmem, OBJECT(qct3d)q,
> > > > 			 "cxl_type3-memory", mr, offset, ct3d->size);
> > > > 
> > > > I 'think' that's doing the right thing, but haven't fully tested it yet
> > > > so may be completely wrong :)
> > > > 
> > > > Then for the pmem addr, call memory_region_set_address() to put it
> > > > in a particular location.
> > > > 
> > > 
> > > Yes - this is what I'd like to do and what I initially tried, and I also believe
> > > it's right, but it doesn't work.
> > > 
> > > range_invariant: Assertion `range->lob <= range->upb || range->lob == range->upb + 1' failed.
> > > 
> > > I was digging into this yesterday, but opted to start a new thread on the
> > > matter.
> > > 
> > 
> > Hmm. I think I need to figure out the right add_subregion after this and it
> > might work. I'll keep digging, but if you have ideas, let me know.
> 
> [snip]
> 
> I managed to get a bit further. With the following, I start getting complaints
> about fragmented memory when adding devices later.
> 
>      memory_region_init_alias(ct3d->cxl_dstate.pmem, OBJECT(ct3d),
>              "cxl_type3-memory", mr, mr->addr + offset, ct3d->size);
>      memory_region_set_nonvolatile(ct3d->cxl_dstate.pmem, true);
>      memory_region_add_subregion(mr, offset, ct3d->cxl_dstate.pmem);
> 
> -device nvdimm,memdev=nvmem1,id=nv1,label-size=2M,node=5: could not find position in guest address space for memory device - memory fragmented due to alignments
> 

Ignore this. It was a problem with my commandline.

I think I have something limping along now.

