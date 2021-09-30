Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1020541D68D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 11:42:46 +0200 (CEST)
Received: from localhost ([::1]:48754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVsaT-00058h-3x
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 05:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=190792ae54=david.dai@montage-tech.com>)
 id 1mVsYE-0003Am-JV
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 05:40:27 -0400
Received: from usmail.montage-tech.com ([12.176.92.53]:50816)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=190792ae54=david.dai@montage-tech.com>)
 id 1mVsYB-0006Wx-VF
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 05:40:26 -0400
X-MDAV-Result: clean
X-MDAV-Processed: usmail.montage-tech.com, Thu, 30 Sep 2021 02:40:20 -0700
Received: from shmail.montage-tech.com by usmail.montage-tech.com with ESMTP
 id md5001005820005.msg; Thu, 30 Sep 2021 02:40:18 -0700
X-Spam-Processed: usmail.montage-tech.com, Thu, 30 Sep 2021 02:40:18 -0700
 (not processed: message from trusted or authenticated source)
X-MDArrival-Date: Thu, 30 Sep 2021 02:40:18 -0700
X-Return-Path: prvs=190792ae54=david.dai@montage-tech.com
X-Envelope-From: david.dai@montage-tech.com
X-MDaemon-Deliver-To: qemu-devel@nongnu.org
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=montage-tech.com;
 s=MDaemon; t=1632994789; x=1633599589;
 i=david.dai@montage-tech.com; q=dns/txt; h=Date:From:To:Cc:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To; bh=x7QUzr5Q7gUY4yvCbEhzUjuD+NTI
 Y+3vNiL7U9ISdS4=; b=TnUR0i+ECt6zzIerkSSiYwLdkf3cpVc6hYZhrolbcZh+
 yOZ8ugR4unjsHk1MemEWOtjFnA7Fq4gLWizApaeMjYlKjuRLkGUxT9uLKLKbiL0g
 7ZhDbGjCSh8cZ6Ol1aErXNQE7ZRD1x2eWSvVaOeethxQ4na2WSILWkoAWAmsJak=
X-MDAV-Result: clean
X-MDAV-Processed: shmail.montage-tech.com, Thu, 30 Sep 2021 17:39:49 +0800
Received: from tianmu-host-sw-01 by shmail.montage-tech.com with ESMTPA id
 pp5001017511762.msg; Thu, 30 Sep 2021 17:39:49 +0800
X-Spam-Processed: shmail.montage-tech.com, Thu, 30 Sep 2021 17:39:49 +0800
 (not processed: message from trusted or authenticated source)
Date: Thu, 30 Sep 2021 17:40:07 +0800
From: "david.dai" <david.dai@montage-tech.com>
To: "David Hildenbrand (david@redhat.com)" <david@redhat.com>
Subject: Re: [PATCH] hw/misc: Add a virtual pci device to dynamically attach
 memory to QEMU
Message-ID: <20210930094007.GA239054@tianmu-host-sw-01>
References: <20210926021614.76933-1-david.dai@montage-tech.com>
 <YVGAWh7e96f8yed0@stefanha-x1.localdomain>
 <38a0312e-3b00-ac41-3cb0-ab5592b06dc1@redhat.com>
 <20210927122848.GB144947@tianmu-host-sw-01>
 <c87c301e-62af-ab5a-2b9c-fa2ef28898f1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c87c301e-62af-ab5a-2b9c-fa2ef28898f1@redhat.com>
X-MDCFSigsAdded: montage-tech.com
Received-SPF: pass client-ip=12.176.92.53;
 envelope-from=prvs=190792ae54=david.dai@montage-tech.com;
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

On Wed, Sep 29, 2021 at 11:30:53AM +0200, David Hildenbrand (david@redhat.com) wrote: 
> 
> On 27.09.21 14:28, david.dai wrote:
> > On Mon, Sep 27, 2021 at 11:07:43AM +0200, David Hildenbrand (david@redhat.com) wrote:
> > > 
> > > CAUTION: This email originated from outside of the organization. Do not
> > > click links or open attachments unless you recognize the sender and know the
> > > content is safe.
> > > 
> > > 
> > > On 27.09.21 10:27, Stefan Hajnoczi wrote:
> > > > On Sun, Sep 26, 2021 at 10:16:14AM +0800, David Dai wrote:
> > > > > Add a virtual pci to QEMU, the pci device is used to dynamically attach memory
> > > > > to VM, so driver in guest can apply host memory in fly without virtualization
> > > > > management software's help, such as libvirt/manager. The attached memory is
> > > 
> > > We do have virtio-mem to dynamically attach memory to a VM. It could be
> > > extended by a mechanism for the VM to request more/less memory, that's
> > > already a planned feature. But yeah, virito-mem memory is exposed as
> > > ordinary system RAM, not only via a BAR to mostly be managed by user space
> > > completely.
> 
> There is a virtio-pmem spec proposal to expose the memory region via a PCI
> BAR. We could do something similar for virtio-mem, however, we would have to
> wire that new model up differently in QEMU (it's no longer a "memory device"
> like a DIMM then).
> 
> > > 
> > 
> > I wish virtio-mem can solve our problem, but it is a dynamic allocation mechanism
> > for system RAM in virtualization. In heterogeneous computing environments, the
> > attached memory usually comes from computing device, it should be managed separately.
> > we doesn't hope Linux MM controls it.
> 
> If that heterogeneous memory would have a dedicated node (which usually is
> the case IIRC) , and you let it manage by the Linux kernel (dax/kmem), you
> can bind the memory backend of virtio-mem to that special NUMA node. So all
> memory managed by that virtio-mem device would come from that heterogeneous
> memory.
> 

Yes, CXL type 2, 3 devices expose memory to host as a dedicated node, the node
is marked as soft_reserved_memory, dax/kmem can take over the node to create a
dax devcie. This dax device can be regarded as the memory backend of virtio-mem

I don't sure whether a dax device can be open by multiple VMs or host applications. 

> You could then further use a separate NUMA node for that virtio-mem device
> inside the VM. But to the VM it would look like System memory with different
> performance characteristics. That would work fore some use cases I guess,
> but not sure for which not (I assume you can tell :) ).
> 

If the NUMA node in guest can be dynamically expanded by virtio-mem, maybe it is
a good thing. Because we will develop our own memory management driver to manage
device memory.
   
> We could even write an alternative virtio-mem mode, where device manage
> isn't exposed to the buddy but using some different way to user space.
> 
> > > > > isolated from System RAM, it can be used in heterogeneous memory management for
> > > > > virtualization. Multiple VMs dynamically share same computing device memory
> > > > > without memory overcommit.
> > > 
> > > This sounds a lot like MemExpand/MemLego ... am I right that this is the
> > > original design? I recall that VMs share a memory region and dynamically
> > > agree upon which part of the memory region a VM uses. I further recall that
> > > there were malloc() hooks that would dynamically allocate such memory in
> > > user space from the shared memory region.
> > > 
> > 
> > Thank you for telling me about Memexpand/MemLego, I have carefully read the paper.
> > some ideas from it are same as this patch, such as software model and stack, but
> > it may have a security risk that whole shared memory is visible to all VMs.
> 
> How will you make sure that not all shared memory can be accessed by the
> other VMs? IOW, emulate !shared memory on shared memory?
> 
> > -----------------------
> >       application
> > -----------------------
> > memory management driver
> > -----------------------
> >       pci driver
> > -----------------------
> >     virtual pci device
> > -----------------------
> > 
> > > I can see some use cases for it, although the shared memory design isn't
> > > what you typically want in most VM environments.
> > > 
> > 
> > The original design for this patch is to share a computing device among multipile
> > VMs. Each VM runs a computing application(for example, OpenCL application)
> > Our computing device can support a few applications in parallel. In addition, it
> > supports SVM(shared virtual memory) via IOMMU/ATS/PASID/PRI. Device exposes its
> > memory to host vis PCIe bar or CXL.mem, host constructs memory pool to uniformly
> > manage device memory, then attach device memory to VM via a virtual PCI device.
> 
> How exactly is that memory pool created/managed? Simply dax/kmem and
> handling it via the buddy in a special NUMA node.
>

We develop MM driver in host and guest to manage reserved memory(NUMA node as you mentioned).
MM Driver is similar to buddy system, it also uses specific page structure to manage physical
memory, then offers mmap() to host application or VM. Device driver adds memory region to MM
driver.

we don't use dax/kmem, because we need to control key software module to reduce risk. we may
add new features into driver overtime.

> > but we don't know how much memory should be assigned when creating VM, so we hope
> > memory is attached to VM on-demand. driver in guest triggers memory attaching, but
> > not outside virtualization management software. so the original requirements are:
> > 1> The managed memory comes from device, it should be isolated from system RAM
> > 2> The memory can be dynamically attached to VM in fly
> > 3> The attached memory supports SVM and DMA operation with IOMMU
> > 
> > Thank you very much.
> 
> Thanks for the info. If virtio-mem is not applicable and cannot be modified
> for this use case, would it make sense to create a new virtio device type?
> 

we had MM driver in host and guest, now we need a way to dynamically attach memory
to guest, join both ends together, this patch is a self-contain device, it doesn't
impact QEMU's stability.

A new virtio device type is a good idea for me, I need some time to understand
virtio spec and virtio-mem, then I may give another proposal, such as
[RFC]hw/virtio: Add virtio-memdev to dynamically attach memory to QEMU


Thanks,
David Dai

> 
> -- 
> Thanks,
> 
> David / dhildenb
> 
> 



