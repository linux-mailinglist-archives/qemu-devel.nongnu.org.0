Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D390229E68
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 19:22:32 +0200 (CEST)
Received: from localhost ([::1]:60050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyIRr-0006gG-Ar
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 13:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jyIR1-0006CT-6D; Wed, 22 Jul 2020 13:21:39 -0400
Received: from charlie.dont.surf ([128.199.63.193]:50644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jyIQw-0005yd-LO; Wed, 22 Jul 2020 13:21:38 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 5245DBF5DD;
 Wed, 22 Jul 2020 17:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=irrelevant.dk;
 s=default; t=1595438491;
 bh=AKnLVFpBxL+7eIVzC6cGNp9HGaiM2taxAdLwBVoiM60=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oFslqoZs4thx1AL5cs0yLtQMGx/yLq2xswoMSrHAkMgXbcyvShpUPRzOivvGabALf
 G6GKKLdAJQsFnZC1kdJBBo1dnpkkIKpZIdxPBS3zGYdLV1Vhkc6jss9likoG1qvMMk
 SW0M7R3ajUmqYGl/zhniPcRMq2GtbK1eip4O/gbYquWtKJj9SWy1f9b0tTrZIcgSP8
 iDPyP4fNMEekfH5NOO2Np1Jw5cquNQGfs3QYXk1K8Zw8rVe4peptgLmT/TO945d3DT
 4JP7FYNxy43uw9RNF3psJPLOSBTuPUfZYWJnyd1m/V+xLvF7ONpAyvvpoG1EKfmNiz
 Y/L/wUNbm6HLQ==
Date: Wed, 22 Jul 2020 19:21:27 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
Subject: Re: [PATCH v4 2/2] nvme: allow cmb and pmr to be enabled on same
 device
Message-ID: <20200722172127.GA712967@apples.localdomain>
References: <20200702103127.hoonqkas3bw2v7re@apples.localdomain>
 <8f871a0d-47f1-1c8a-fcc2-aab2638c70cf@linux.intel.com>
 <20200702175113.6qtnpxqimpavzx7h@apples.localdomain>
 <191b39ed-0588-b5db-d352-965efd19128a@linux.intel.com>
 <20200706071545.md4tivimefffgyi6@apples.localdomain>
 <16d74d40-bd55-997d-7fd6-e7ec59566a68@linux.intel.com>
 <20200715080658.GA506302@apples.localdomain>
 <9143a543-d32d-f3e7-c37b-b3df7f853952@linux.intel.com>
 <20200722074305.GA606300@apples.localdomain>
 <63d2e5ed-3c73-4a80-ae45-ce3665b406c8@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <63d2e5ed-3c73-4a80-ae45-ce3665b406c8@linux.intel.com>
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/22 13:21:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: kbusch@kernel.org, kwolf@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Jul 22 10:00, Andrzej Jakowski wrote:
> On 7/22/20 12:43 AM, Klaus Jensen wrote:
> > @keith, please see below - can you comment on the Linux kernel 2 MB
> > boundary requirement for the CMB? Or should we hail Stephen (or Logan
> > maybe) since this seems to be related to p2pdma?
> > 
> > On Jul 21 14:54, Andrzej Jakowski wrote:
> >> On 7/15/20 1:06 AM, Klaus Jensen wrote:
> >>> Hi Andrzej,
> >>>
> >>> I've not been ignoring this, but sorry for not following up earlier.
> >>>
> >>> I'm hesitent to merge anything that very obviously breaks an OS that we
> >>> know is used a lot to this using this device. Also because the issue has
> >>> not been analyzed well enough to actually know if this is a QEMU or
> >>> kernel issue.
> >>
> >> Hi Klaus,
> >>
> >> Thx for your response! I understand your hesitance on merging stuff that
> >> obviously breaks guest OS. 
> >>
> >>>
> >>> Now, as far as I can test, having the MSI-X vector table and PBA in BAR
> >>> 0, PMR in BAR 2 and CMB in BAR 4 seems to make everyone happy
> >>> (irregardless of IOMMU on/off).
> >>>
> >>> Later, when the issue is better understood, we can add options to set
> >>> offsets, BIRs etc.
> >>>
> >>> The patch below replaces your "[PATCH v4 2/2] nvme: allow cmb and pmr to
> >>> be enabled" (but still requires "[PATCH v4 1/2] ...") and applies to
> >>> git://git.infradead.org/qemu-nvme.git nvme-next branch.
> >>>
> >>> Can you reproduce the issues with that patch? I can't on a stock Arch
> >>> Linux 5.7.5-arch1-1 kernel.
> >>
> >> While I'm happy that approach with MSIX and PBA in BAR0 works fine, I
> >> feel that investigation part why it works while mine doesn't is
> >> missing. It looks to me that both patches are basically following same 
> >> approach: create memory subregion and overlay on top of other memory
> >> region. Why one works and the other doesn't then?
> >>
> >> Having in mind that, I have recently focused on understanding problem.
> >> I observed that when guest assigns address to BAR4, addr field in
> >> nvme-bar4 memory region gets populated, but it doesn't get automatically
> >> populated in ctrl_mem (cmb) memory subregion, so later when nvme_addr_is_cmb() 
> >> is called address check works incorrectly and as a consequence vmm does dma 
> >> read instead of memcpy.
> >> I created a patch that sets correct address on ctrl_mem subregion and guest 
> >> OS boots up correctly.
> >>
> >> When I looked into pci and memory region code I noticed that indeed address
> >> is only assigned to top level memory region but not to contained subregions.
> >> I think that because in your approach cmb grabs whole bar exclusively it works
> >> fine.
> >>
> >> Here is my question (perhaps pci folks can help answer :)): if we consider 
> >> memory region overlapping for pci devices as valid use case should pci 
> >> code on configuration cycles walk through all contained subregion and
> >> update addr field accordingly?
> >>
> >> Thx!
> >>
> > 
> > Hi Andrzej,
> > 
> > Thanks for looking into this. I think your analysis helped me nail this.
> > The problem is that we added the use of a subregion and have some
> > assumptions that no longer hold.
> > 
> > nvme_addr_is_cmb() assumes that n->ctrl_mem.addr is an absolute address.
> > But when the memory region is a subregion, addr holds an offset into the
> > parent container instead. Thus, changing all occurances of
> > n->ctrl_mem.addr to (n->bar0.addr + n->ctrl_mem.addr) fixes the issue
> > (this is required in nvme_addr_is_cmb and nvme_map_prp). I patched that
> > in your original patch[1]. The reason my version worked is because there
> > was no subregion involved for the CMB, so the existing address
> > validation calculations were still correct.
> 
> I'm a little bit concerned with this approach:
> (n->bar0.addr + n->ctrl_mem.addr) and hoping to have some debate. Let me 
> describe my understanding of the problem.

Oh. In the context of your patch I meant bar4 of course, but anyway.

> It looks to me that addr field sometimes contains *absolute* address (when no 
> hierarchy is used) and other times it contains *relative* address (when
> hierarchy is created). From my perspective use of this field is inconsistent
> and thus error-prone.  
> Because of that I think that doing n->bar0.addr + n->ctrl_mem.addr doesn't
> solve root problem and is still prone to the same problem if in the future
> we potentially build even more complicated hierarchy.
> I think that we could solve it by introducing helper function like
> 
> hwaddr memory_region_get_abs_addr(MemoryRegion *mr) 
> 
> to retrieve absolute address and in the documentation indicate that addr field
> can be relative or absolute and it is recommended to use above function to 
> retrieve absolute address.
> What do you think?
> 

I'm all for a helper - I was not gonna cheer for the quick'n'dirty fix I
did just to convince myself that this was the issue ;)

I think the helper might already be there in memory.c. It's just not
exported.

   static hwaddr memory_region_to_absolute_addr(MemoryRegion *mr, hwaddr offset)

> > 
> > This leaves us with the Linux kernel complaining about not being able to
> > register the CMB if it is not on a 2MB boundary - this is probably just
> > a constraint in the kernel that we can't do anything about (but I'm no
> > kernel hacker...), which can be fixed by either being "nice" towards the
> > Linux kernel by forcing a 2 MB alignment in the device or exposing the
> > SZU field such that the user can choose 16MiB size units (or higher)
> > instead of 1MiB. I'm leaning towards ensuring the 2 MB alignment in the
> > device such that we do not have to introduce new cmb_size parameters,
> > while also making it easier for the user to configure. But I'm not
> > really sure.
> This is kernel limitation that we have to live with. The minimum granularity
> of devm_memremap_pages() is 2MB and it must be 2MB aligned. It used to worse
> at 128MB size+align (section-size), but sub-section memory-hotplug patches 
> adjusted that to a 2MB section. 

Thanks for that explanation!

> Ensuring 2MiB size and alignment in the device emulation makes sense to me.
> Perhaps we could document that limitations - making user more aware of it.
> 

Sounds good to me.

