Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C421842EDAA
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:29:38 +0200 (CEST)
Received: from localhost ([::1]:43890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJWz-0000Dg-Pw
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1922771660=david.dai@montage-tech.com>)
 id 1mbJDx-00011i-M8
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:09:57 -0400
Received: from usmail.montage-tech.com ([12.176.92.53]:53319)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=1922771660=david.dai@montage-tech.com>)
 id 1mbJDs-0004Us-9q
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:09:57 -0400
X-MDAV-Result: clean
X-MDAV-Processed: usmail.montage-tech.com, Fri, 15 Oct 2021 02:09:49 -0700
Received: from shmail.montage-tech.com by usmail.montage-tech.com with ESMTP
 id md5001005841449.msg; Fri, 15 Oct 2021 02:09:49 -0700
X-Spam-Processed: usmail.montage-tech.com, Fri, 15 Oct 2021 02:09:49 -0700
 (not processed: message from trusted or authenticated source)
X-MDArrival-Date: Fri, 15 Oct 2021 02:09:49 -0700
X-Return-Path: prvs=1922771660=david.dai@montage-tech.com
X-Envelope-From: david.dai@montage-tech.com
X-MDaemon-Deliver-To: qemu-devel@nongnu.org
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=montage-tech.com;
 s=MDaemon; t=1634288960; x=1634893760;
 i=david.dai@montage-tech.com; q=dns/txt; h=Date:From:To:Cc:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To; bh=oq1YNEwuzKYN/ky6hl8psLNKLpE+
 zz3XJn7e5I/+o8o=; b=Kt3Vch2jDsWOTn+vMShKYqlgHJitycBL6+ppS5W/DHQo
 Je4r7lJpPdJC5utOz9KnJ3rTMCI6Lybhj7SaszZqqxFA/3LiLuLQ0gMbS13BvEP8
 A2mErWFQzh9XF6SWwu/2yVmCs7joFqMimwqUcubVq0B9WzlI3881Kpkp1ZGHpL0=
X-MDAV-Result: clean
X-MDAV-Processed: shmail.montage-tech.com, Fri, 15 Oct 2021 17:09:20 +0800
Received: from tianmu-host-sw-01 by shmail.montage-tech.com with ESMTPA id
 pp5001017649596.msg; Fri, 15 Oct 2021 17:09:18 +0800
X-Spam-Processed: shmail.montage-tech.com, Fri, 15 Oct 2021 17:09:18 +0800
 (not processed: message from trusted or authenticated source)
Date: Fri, 15 Oct 2021 17:10:07 +0800
From: "david.dai" <david.dai@montage-tech.com>
To: "David Hildenbrand (david@redhat.com)" <david@redhat.com>
Subject: Re: [PATCH] hw/misc: Add a virtual pci device to dynamically attach
 memory to QEMU
Message-ID: <20211015091007.GA155094@tianmu-host-sw-01>
References: <YVGAWh7e96f8yed0@stefanha-x1.localdomain>
 <38a0312e-3b00-ac41-3cb0-ab5592b06dc1@redhat.com>
 <20210927122848.GB144947@tianmu-host-sw-01>
 <c87c301e-62af-ab5a-2b9c-fa2ef28898f1@redhat.com>
 <20210930094007.GA239054@tianmu-host-sw-01>
 <5eba1406-4012-481a-b7ed-0090654668d2@redhat.com>
 <20211009094233.GA13867@tianmu-host-sw-01>
 <ea36815e-0b79-b5b2-9735-367404c9b8f6@redhat.com>
 <20211013081337.GA96268@tianmu-host-sw-01>
 <0c244f16-ca16-9f70-dab8-f543accc063b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c244f16-ca16-9f70-dab8-f543accc063b@redhat.com>
X-MDCFSigsAdded: montage-tech.com
Received-SPF: pass client-ip=12.176.92.53;
 envelope-from=prvs=1922771660=david.dai@montage-tech.com;
 helo=usmail.montage-tech.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, eajames@linux.ibm.com,
 qemu-devel@nongnu.org, changguo.du@montage-tech.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 10:33:39AM +0200, David Hildenbrand (david@redhat.com) wrote:
> 
> CAUTION: This email originated from outside of the organization. Do not
> click links or open attachments unless you recognize the sender and know the
> content is safe.
> 
> 
> On 13.10.21 10:13, david.dai wrote:
> > On Mon, Oct 11, 2021 at 09:43:53AM +0200, David Hildenbrand (david@redhat.com) wrote:
> > > 
> > > 
> > > 
> > > > > virito-mem currently relies on having a single sparse memory region (anon
> > > > > mmap, mmaped file, mmaped huge pages, mmap shmem) per VM. Although we can
> > > > > share memory with other processes, sharing with other VMs is not intended.
> > > > > Instead of actually mmaping parts dynamically (which can be quite
> > > > > expensive), virtio-mem relies on punching holes into the backend and
> > > > > dynamically allocating memory/file blocks/... on access.
> > > > > 
> > > > > So the easy way to make it work is:
> > > > > 
> > > > > a) Exposing the CXL memory to the buddy via dax/kmem, esulting in device
> > > > > memory getting managed by the buddy on a separate NUMA node.
> > > > > 
> > > > 
> > > > Linux kernel buddy system? how to guarantee other applications don't apply memory
> > > > from it
> > > 
> > > Excellent question. Usually, you would online the memory to ZONE_MOVABLE,
> > > such that even if some other allocation ended up there, that it could
> > > get migrated somewhere else.
> > > 
> > > For example, "daxctl reconfigure-device" tries doing that as default:
> > > 
> > > https://pmem.io/ndctl/daxctl-reconfigure-device.html
> > > 
> > > However, I agree that we might actually want to tell the system to not
> > > use this CPU-less node as fallback for other allocations, and that we
> > > might not want to swap out such memory etc.
> > > 
> > > 
> > > But, in the end all that virtio-mem needs to work in the hypervisor is
> > > 
> > > a) A sparse memmap (anonymous RAM, memfd, file)
> > > b) A way to populate memory within that sparse memmap (e.g., on fault,
> > >     using madvise(MADV_POPULATE_WRITE), fallocate())
> > > c) A way to discard memory (madvise(MADV_DONTNEED),
> > >     fallocate(FALLOC_FL_PUNCH_HOLE))
> > > 
> > > So instead of using anonymous memory+mbind, you can also mmap a sparse file
> > > and rely on populate-on-demand. One alternative for your use case would be
> > > to create a DAX  filesystem on that CXL memory (IIRC that should work) and
> > > simply providing virtio-mem with a sparse file located on that filesystem.
> > > 
> > > Of course, you can also use some other mechanism as you might have in
> > > your approach, as long as it supports a,b,c.
> > > 
> > > > 
> > > > > 
> > > > > b) (optional) allocate huge pages on that separate NUMA node.
> > > > > c) Use ordinary memory-device-ram or memory-device-memfd (for huge pages),
> > > > > *bidning* the memory backend to that special NUMA node.
> > > > > 
> > > > "-object memory-backend/device-ram or memory-device-memfd, id=mem0, size=768G"
> > > > How to bind backend memory to NUMA node
> > > > 
> > > 
> > > I think the syntax is "policy=bind,host-nodes=X"
> > > 
> > > whereby X is a node mask. So for node "0" you'd use "host-nodes=0x1" for "5"
> > > "host-nodes=0x20" etc.
> > > 
> > > > > 
> > > > > This will dynamically allocate memory from that special NUMA node, resulting
> > > > > in the virtio-mem device completely being backed by that device memory,
> > > > > being able to dynamically resize the memory allocation.
> > > > > 
> > > > > 
> > > > > Exposing an actual devdax to the virtio-mem device, shared by multiple VMs
> > > > > isn't really what we want and won't work without major design changes. Also,
> > > > > I'm not so sure it's a very clean design: exposing memory belonging to other
> > > > > VMs to unrelated QEMU processes. This sounds like a serious security hole:
> > > > > if you managed to escalate to the QEMU process from inside the VM, you can
> > > > > access unrelated VM memory quite happily. You want an abstraction
> > > > > in-between, that makes sure each VM/QEMU process only sees private memory:
> > > > > for example, the buddy via dax/kmem.
> > > > > 
> > > > Hi David
> > > > Thanks for your suggestion, also sorry for my delayed reply due to my long vacation.
> > > > How does current virtio-mem dynamically attach memory to guest, via page fault?
> > > 
> > > Essentially you have a large sparse mmap. Withing that mmap, memory is
> > > populated on demand. Instead if mmap/munmap you perform a single large
> > > mmap and then dynamically populate memory/discard memory.
> > > 
> > > Right now, memory is populated via page faults on access. This is
> > > sub-optimal when dealing with limited resources (i.e., hugetlbfs,
> > > file blocks) and you might run out of backend memory.
> > > 
> > > I'm working on a "prealloc" mode, which will preallocate/populate memory
> > > necessary for exposing the next block of memory to the VM, and which
> > > fails gracefully if preallocation/population fails in the case of such
> > > limited resources.
> > > 
> > > The patch resides on:
> > > 	https://github.com/davidhildenbrand/qemu/tree/virtio-mem-next
> > > 
> > > commit ded0e302c14ae1b68bdce9059dcca344e0a5f5f0
> > > Author: David Hildenbrand <david@redhat.com>
> > > Date:   Mon Aug 2 19:51:36 2021 +0200
> > > 
> > >      virtio-mem: support "prealloc=on" option
> > >      Especially for hugetlb, but also for file-based memory backends, we'd
> > >      like to be able to prealloc memory, especially to make user errors less
> > >      severe: crashing the VM when there are not sufficient huge pages around.
> > >      A common option for hugetlb will be using "reserve=off,prealloc=off" for
> > >      the memory backend and "prealloc=on" for the virtio-mem device. This
> > >      way, no huge pages will be reserved for the process, but we can recover
> > >      if there are no actual huge pages when plugging memory.
> > >      Signed-off-by: David Hildenbrand <david@redhat.com>
> > > 
> > > 
> > > -- 
> > > Thanks,
> > > 
> > > David / dhildenb
> > > 
> > 
> > Hi David,
> > 
> > After read virtio-mem code, I understand what you have expressed, please allow me to describe
> > my understanding to virtio-mem, so that we have a aligned view.
> > 
> > Virtio-mem:
> >   Virtio-mem device initializes and reserved a memory area(GPA), later memory dynamically
> >   growing/shrinking will not exceed this scope, memory-backend-ram has mapped anon. memory
> >   to the whole area, but no ram is attached because Linux have a policy to delay allocation.
> 
> Right, but it can also be any sparse file (memory-backend-memfd,
> memory-backend-file).
> 
> >   When virtio-mem driver apply to dynamically add memory to guest, it first request a region
> >   from the reserved memory area, then notify virtio-mem device to record the information
> >   (virtio-mem device doesn't make real memory allocation). After received response from
> 
> In the upcoming prealloc=on mode I referenced, the allocation will happen
> before the guest is notified about success and starts using the memory.
> 
> With vfio/mdev support, the allocation will happen nowadays already, when
> vfio/mdev is notified about the populated memory ranges (see
> RamDiscardManager). That's essentially what makes virtio-mem device
> passthrough work.
> 
> >   virtio-mem deivce, virtio-mem driver will online the requested region and add it to Linux
> >   page allocator. Real ram allocation will happen via page fault when guest cpu access it.
> >   Memory shrink will be achieved by madvise()
> 
> Right, but you could write a custom virtio-mem driver that pools this memory
> differently.
> 
> Memory shrinking in the hypervisor is either done using madvise(DONMTNEED)
> or fallocate(FALLOC_FL_PUNCH_HOLE)
> 
> > 
> > Questions:
> > 1. heterogeneous computing, memory may be accessed by CPUs on host side and device side.
> >     Memory delayed allocation is not suitable. Host software(for instance, OpenCL) may
> >     allocate a buffer to computing device to place the computing result in.
> 
> That works already with virtio-mem with vfio/mdev via the RamDiscardManager
> infrastructure introduced recently. With "prealloc=on", the delayed memory
> allocation can also be avoided without vfio/mdev.
> 
> > 2. we hope build ourselves page allocator in host kernel, so it can offer customized mmap()
> >     method to build va->pa mapping in MMU and IOMMU.
> 
> Theoretically, you can wire up pretty much any driver in QEMU like vfio/mdev
> via the RamDiscardManager. From there, you can issue whatever syscall you
> need to popualte memory when plugging new memory blocks. All you need to
> support is a sparse mmap and a way to populate/discard memory.
> Populate/discard could be wired up in QEMU virtio-mem code as you need it.
> 
> > 3. some potential requirements also require our driver to manage memory, so that page size
> >     granularity can be controlled to fit small device iotlb cache.
> >     CXL has bias mode for HDM(host managed device memory), it needs physical address to make
> >     bias mode switch between host access and device access. These tell us driver manage memory
> >     is mandatory.
> 
> I think if you write your driver in a certain way and wire it up in QEMU
> virtio-mem accordingly (e.g., using a new memory-backend-whatever), that
> shouldn't be an issue.
>

Thanks a lot, so let me have a try.
 
> 
> -- 
> Thanks,
> 
> David / dhildenb
> 
> 



