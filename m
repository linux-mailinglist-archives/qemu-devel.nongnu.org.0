Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B33EC419452
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 14:33:25 +0200 (CEST)
Received: from localhost ([::1]:34102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUpoy-0000Dm-7T
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 08:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=19049db00e=david.dai@montage-tech.com>)
 id 1mUpkl-00073w-U8
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 08:29:04 -0400
Received: from usmail.montage-tech.com ([12.176.92.53]:58903)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=19049db00e=david.dai@montage-tech.com>)
 id 1mUpkg-0002wv-97
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 08:29:02 -0400
X-MDAV-Result: clean
X-MDAV-Processed: usmail.montage-tech.com, Mon, 27 Sep 2021 05:28:54 -0700
Received: from shmail.montage-tech.com by usmail.montage-tech.com with ESMTP
 id md5001005814519.msg; Mon, 27 Sep 2021 05:28:53 -0700
X-Spam-Processed: usmail.montage-tech.com, Mon, 27 Sep 2021 05:28:53 -0700
 (not processed: message from trusted or authenticated source)
X-MDArrival-Date: Mon, 27 Sep 2021 05:28:53 -0700
X-Return-Path: prvs=19049db00e=david.dai@montage-tech.com
X-Envelope-From: david.dai@montage-tech.com
X-MDaemon-Deliver-To: qemu-devel@nongnu.org
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=montage-tech.com;
 s=MDaemon; t=1632745705; x=1633350505;
 i=david.dai@montage-tech.com; q=dns/txt; h=Date:From:To:Cc:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To; bh=FWVi1EMJuA0mt2nHPu5vHSYUmNYQ
 EK3tpfJI7uC/Cxc=; b=QBv3TbnGEMRmyCUiWKGb8Gz26axYh8Otu5YVKC2cLUJ/
 pPyKgDEEtOBBuTch6rvWqshHv2rLZU56VCMRIYtN0vhMd4hupDPHoZQGmKo48U+z
 YSg6VdUmrlO2qJ7Pn7YX4WxBgLl05AMaJKD+EjYeswjUDGRi+0v2nMLWqRl+nBg=
X-MDAV-Result: clean
X-MDAV-Processed: shmail.montage-tech.com, Mon, 27 Sep 2021 20:28:25 +0800
Received: from tianmu-host-sw-01 by shmail.montage-tech.com with ESMTPA id
 pp5001017490946.msg; Mon, 27 Sep 2021 20:28:24 +0800
X-Spam-Processed: shmail.montage-tech.com, Mon, 27 Sep 2021 20:28:24 +0800
 (not processed: message from trusted or authenticated source)
Date: Mon, 27 Sep 2021 20:28:48 +0800
From: "david.dai" <david.dai@montage-tech.com>
To: "David Hildenbrand (david@redhat.com)" <david@redhat.com>
Subject: Re: [PATCH] hw/misc: Add a virtual pci device to dynamically attach
 memory to QEMU
Message-ID: <20210927122848.GB144947@tianmu-host-sw-01>
References: <20210926021614.76933-1-david.dai@montage-tech.com>
 <YVGAWh7e96f8yed0@stefanha-x1.localdomain>
 <38a0312e-3b00-ac41-3cb0-ab5592b06dc1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38a0312e-3b00-ac41-3cb0-ab5592b06dc1@redhat.com>
X-MDCFSigsAdded: montage-tech.com
Received-SPF: pass client-ip=12.176.92.53;
 envelope-from=prvs=19049db00e=david.dai@montage-tech.com;
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
 david.dai@montage-tech.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 27, 2021 at 11:07:43AM +0200, David Hildenbrand (david@redhat.com) wrote:
> 
> CAUTION: This email originated from outside of the organization. Do not
> click links or open attachments unless you recognize the sender and know the
> content is safe.
> 
> 
> On 27.09.21 10:27, Stefan Hajnoczi wrote:
> > On Sun, Sep 26, 2021 at 10:16:14AM +0800, David Dai wrote:
> > > Add a virtual pci to QEMU, the pci device is used to dynamically attach memory
> > > to VM, so driver in guest can apply host memory in fly without virtualization
> > > management software's help, such as libvirt/manager. The attached memory is
> 
> We do have virtio-mem to dynamically attach memory to a VM. It could be
> extended by a mechanism for the VM to request more/less memory, that's
> already a planned feature. But yeah, virito-mem memory is exposed as
> ordinary system RAM, not only via a BAR to mostly be managed by user space
> completely.
>

I wish virtio-mem can solve our problem, but it is a dynamic allocation mechanism
for system RAM in virtualization. In heterogeneous computing environments, the
attached memory usually comes from computing device, it should be managed separately.
we doesn't hope Linux MM controls it.
 
> > > isolated from System RAM, it can be used in heterogeneous memory management for
> > > virtualization. Multiple VMs dynamically share same computing device memory
> > > without memory overcommit.
> 
> This sounds a lot like MemExpand/MemLego ... am I right that this is the
> original design? I recall that VMs share a memory region and dynamically
> agree upon which part of the memory region a VM uses. I further recall that
> there were malloc() hooks that would dynamically allocate such memory in
> user space from the shared memory region.
>

Thank you for telling me about Memexpand/MemLego, I have carefully read the paper.
some ideas from it are same as this patch, such as software model and stack, but
it may have a security risk that whole shared memory is visible to all VMs.
-----------------------
     application
-----------------------
memory management driver
-----------------------
     pci driver
-----------------------
   virtual pci device
-----------------------

> I can see some use cases for it, although the shared memory design isn't
> what you typically want in most VM environments.
>

The original design for this patch is to share a computing device among multipile
VMs. Each VM runs a computing application(for example, OpenCL application)
Our computing device can support a few applications in parallel. In addition, it
supports SVM(shared virtual memory) via IOMMU/ATS/PASID/PRI. Device exposes its
memory to host vis PCIe bar or CXL.mem, host constructs memory pool to uniformly
manage device memory, then attach device memory to VM via a virtual PCI device.
but we don't know how much memory should be assigned when creating VM, so we hope
memory is attached to VM on-demand. driver in guest triggers memory attaching, but
not outside virtualization management software. so the original requirements are:
1> The managed memory comes from device, it should be isolated from system RAM
2> The memory can be dynamically attached to VM in fly
3> The attached memory supports SVM and DMA operation with IOMMU

Thank you very much. 


Best Regards,
David Dai

> -- 
> Thanks,
> 
> David / dhildenb
> 
> 



