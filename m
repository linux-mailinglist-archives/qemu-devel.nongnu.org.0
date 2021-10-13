Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E9F42BA06
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 10:16:22 +0200 (CEST)
Received: from localhost ([::1]:49698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maZQz-00043S-73
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 04:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1920604e14=david.dai@montage-tech.com>)
 id 1maZOq-0002gG-TF
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 04:14:08 -0400
Received: from usmail.montage-tech.com ([12.176.92.53]:51512)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=1920604e14=david.dai@montage-tech.com>)
 id 1maZOn-0006XO-KP
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 04:14:08 -0400
X-MDAV-Result: clean
X-MDAV-Processed: usmail.montage-tech.com, Wed, 13 Oct 2021 01:14:01 -0700
Received: from shmail.montage-tech.com by usmail.montage-tech.com with ESMTP
 id md5001005837356.msg; Wed, 13 Oct 2021 01:14:00 -0700
X-Spam-Processed: usmail.montage-tech.com, Wed, 13 Oct 2021 01:14:00 -0700
 (not processed: message from trusted or authenticated source)
X-MDArrival-Date: Wed, 13 Oct 2021 01:14:00 -0700
X-Return-Path: prvs=1920604e14=david.dai@montage-tech.com
X-Envelope-From: david.dai@montage-tech.com
X-MDaemon-Deliver-To: qemu-devel@nongnu.org
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=montage-tech.com;
 s=MDaemon; t=1634112803; x=1634717603;
 i=david.dai@montage-tech.com; q=dns/txt; h=Date:From:To:Cc:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To; bh=7t1UpbW+3NO3yWqvIV66sxIAfwa/
 mrISVFjiAOsZzwU=; b=jUVA/XUQeQdhBYIVHh/Tfuvv+EJLkcQHTmTIdMweU4nW
 rbOZWXDKM9a/hM/bBzMzVXQTlZldjAp9QIkcjRb6yZShlPFkIc778ganE2fma8O1
 blsiJTl+qH7OeuzTT4JvG4g+czXmBdSOn5oUWCCPCsGLC2xS8WKymojcd75tEm4=
X-MDAV-Result: clean
X-MDAV-Processed: shmail.montage-tech.com, Wed, 13 Oct 2021 16:13:23 +0800
Received: from tianmu-host-sw-01 by shmail.montage-tech.com with ESMTPA id
 pp5001017635844.msg; Wed, 13 Oct 2021 16:13:21 +0800
X-Spam-Processed: shmail.montage-tech.com, Wed, 13 Oct 2021 16:13:21 +0800
 (not processed: message from trusted or authenticated source)
Date: Wed, 13 Oct 2021 16:13:37 +0800
From: "david.dai" <david.dai@montage-tech.com>
To: "David Hildenbrand (david@redhat.com)" <david@redhat.com>
Subject: Re: [PATCH] hw/misc: Add a virtual pci device to dynamically attach
 memory to QEMU
Message-ID: <20211013081337.GA96268@tianmu-host-sw-01>
References: <20210926021614.76933-1-david.dai@montage-tech.com>
 <YVGAWh7e96f8yed0@stefanha-x1.localdomain>
 <38a0312e-3b00-ac41-3cb0-ab5592b06dc1@redhat.com>
 <20210927122848.GB144947@tianmu-host-sw-01>
 <c87c301e-62af-ab5a-2b9c-fa2ef28898f1@redhat.com>
 <20210930094007.GA239054@tianmu-host-sw-01>
 <5eba1406-4012-481a-b7ed-0090654668d2@redhat.com>
 <20211009094233.GA13867@tianmu-host-sw-01>
 <ea36815e-0b79-b5b2-9735-367404c9b8f6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea36815e-0b79-b5b2-9735-367404c9b8f6@redhat.com>
X-MDCFSigsAdded: montage-tech.com
Received-SPF: pass client-ip=12.176.92.53;
 envelope-from=prvs=1920604e14=david.dai@montage-tech.com;
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

On Mon, Oct 11, 2021 at 09:43:53AM +0200, David Hildenbrand (david@redhat.com) wrote:
> 
> 
> 
> > > virito-mem currently relies on having a single sparse memory region (anon
> > > mmap, mmaped file, mmaped huge pages, mmap shmem) per VM. Although we can
> > > share memory with other processes, sharing with other VMs is not intended.
> > > Instead of actually mmaping parts dynamically (which can be quite
> > > expensive), virtio-mem relies on punching holes into the backend and
> > > dynamically allocating memory/file blocks/... on access.
> > > 
> > > So the easy way to make it work is:
> > > 
> > > a) Exposing the CXL memory to the buddy via dax/kmem, esulting in device
> > > memory getting managed by the buddy on a separate NUMA node.
> > > 
> > 
> > Linux kernel buddy system? how to guarantee other applications don't apply memory
> > from it
> 
> Excellent question. Usually, you would online the memory to ZONE_MOVABLE,
> such that even if some other allocation ended up there, that it could
> get migrated somewhere else.
> 
> For example, "daxctl reconfigure-device" tries doing that as default:
> 
> https://pmem.io/ndctl/daxctl-reconfigure-device.html
> 
> However, I agree that we might actually want to tell the system to not
> use this CPU-less node as fallback for other allocations, and that we
> might not want to swap out such memory etc.
> 
> 
> But, in the end all that virtio-mem needs to work in the hypervisor is
> 
> a) A sparse memmap (anonymous RAM, memfd, file)
> b) A way to populate memory within that sparse memmap (e.g., on fault,
>    using madvise(MADV_POPULATE_WRITE), fallocate())
> c) A way to discard memory (madvise(MADV_DONTNEED),
>    fallocate(FALLOC_FL_PUNCH_HOLE))
> 
> So instead of using anonymous memory+mbind, you can also mmap a sparse file
> and rely on populate-on-demand. One alternative for your use case would be
> to create a DAX  filesystem on that CXL memory (IIRC that should work) and
> simply providing virtio-mem with a sparse file located on that filesystem.
> 
> Of course, you can also use some other mechanism as you might have in
> your approach, as long as it supports a,b,c.
> 
> > 
> > > 
> > > b) (optional) allocate huge pages on that separate NUMA node.
> > > c) Use ordinary memory-device-ram or memory-device-memfd (for huge pages),
> > > *bidning* the memory backend to that special NUMA node.
> > > 
> > "-object memory-backend/device-ram or memory-device-memfd, id=mem0, size=768G"
> > How to bind backend memory to NUMA node
> > 
> 
> I think the syntax is "policy=bind,host-nodes=X"
> 
> whereby X is a node mask. So for node "0" you'd use "host-nodes=0x1" for "5"
> "host-nodes=0x20" etc.
> 
> > > 
> > > This will dynamically allocate memory from that special NUMA node, resulting
> > > in the virtio-mem device completely being backed by that device memory,
> > > being able to dynamically resize the memory allocation.
> > > 
> > > 
> > > Exposing an actual devdax to the virtio-mem device, shared by multiple VMs
> > > isn't really what we want and won't work without major design changes. Also,
> > > I'm not so sure it's a very clean design: exposing memory belonging to other
> > > VMs to unrelated QEMU processes. This sounds like a serious security hole:
> > > if you managed to escalate to the QEMU process from inside the VM, you can
> > > access unrelated VM memory quite happily. You want an abstraction
> > > in-between, that makes sure each VM/QEMU process only sees private memory:
> > > for example, the buddy via dax/kmem.
> > > 
> > Hi David
> > Thanks for your suggestion, also sorry for my delayed reply due to my long vacation.
> > How does current virtio-mem dynamically attach memory to guest, via page fault?
> 
> Essentially you have a large sparse mmap. Withing that mmap, memory is
> populated on demand. Instead if mmap/munmap you perform a single large
> mmap and then dynamically populate memory/discard memory.
> 
> Right now, memory is populated via page faults on access. This is
> sub-optimal when dealing with limited resources (i.e., hugetlbfs,
> file blocks) and you might run out of backend memory.
> 
> I'm working on a "prealloc" mode, which will preallocate/populate memory
> necessary for exposing the next block of memory to the VM, and which
> fails gracefully if preallocation/population fails in the case of such
> limited resources.
> 
> The patch resides on:
> 	https://github.com/davidhildenbrand/qemu/tree/virtio-mem-next
> 
> commit ded0e302c14ae1b68bdce9059dcca344e0a5f5f0
> Author: David Hildenbrand <david@redhat.com>
> Date:   Mon Aug 2 19:51:36 2021 +0200
> 
>     virtio-mem: support "prealloc=on" option
>     Especially for hugetlb, but also for file-based memory backends, we'd
>     like to be able to prealloc memory, especially to make user errors less
>     severe: crashing the VM when there are not sufficient huge pages around.
>     A common option for hugetlb will be using "reserve=off,prealloc=off" for
>     the memory backend and "prealloc=on" for the virtio-mem device. This
>     way, no huge pages will be reserved for the process, but we can recover
>     if there are no actual huge pages when plugging memory.
>     Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> 
> -- 
> Thanks,
> 
> David / dhildenb
> 

Hi David,

After read virtio-mem code, I understand what you have expressed, please allow me to describe
my understanding to virtio-mem, so that we have a aligned view.

Virtio-mem:
 Virtio-mem device initializes and reserved a memory area(GPA), later memory dynamically
 growing/shrinking will not exceed this scope, memory-backend-ram has mapped anon. memory
 to the whole area, but no ram is attached because Linux have a policy to delay allocation.
 When virtio-mem driver apply to dynamically add memory to guest, it first request a region
 from the reserved memory area, then notify virtio-mem device to record the information
 (virtio-mem device doesn't make real memory allocation). After received response from
 virtio-mem deivce, virtio-mem driver will online the requested region and add it to Linux
 page allocator. Real ram allocation will happen via page fault when guest cpu access it.
 Memory shrink will be achieved by madvise()

Questions:
1. heterogeneous computing, memory may be accessed by CPUs on host side and device side.
   Memory delayed allocation is not suitable. Host software(for instance, OpenCL) may
   allocate a buffer to computing device to place the computing result in.
2. we hope build ourselves page allocator in host kernel, so it can offer customized mmap()
   method to build va->pa mapping in MMU and IOMMU.
3. some potential requirements also require our driver to manage memory, so that page size
   granularity can be controlled to fit small device iotlb cache.
   CXL has bias mode for HDM(host managed device memory), it needs physical address to make
   bias mode switch between host access and device access. These tell us driver manage memory
   is mandatory.

My opinion:
 I hope this patch can enter QEMU main tree, it is a self-contain virtual device which doesn't impact QEMU stability.
 It is a mechanism to dynamically attach memory to guest, virtio-mem via pagefault, this patch create new memory region.
 In addition, user has big room to customize frontend and backend implement.
 It can be regarded as a sample code and give other people more idea and help.

Thanks,
David



