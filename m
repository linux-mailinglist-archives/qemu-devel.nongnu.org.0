Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D78455A1E
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 12:25:09 +0100 (CET)
Received: from localhost ([::1]:34634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnfXN-00059f-Nj
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 06:25:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1mnfVd-0004Fb-6J; Thu, 18 Nov 2021 06:23:17 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1mnfVZ-000582-Th; Thu, 18 Nov 2021 06:23:16 -0500
Received: from fraeml741-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Hvy7k058qz67rZ8;
 Thu, 18 Nov 2021 19:22:26 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml741-chm.china.huawei.com (10.206.15.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 18 Nov 2021 12:23:10 +0100
Received: from localhost (10.52.127.148) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 18 Nov
 2021 11:23:09 +0000
Date: Thu, 18 Nov 2021 11:23:06 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2] hw/arm/virt: Expose empty NUMA nodes through ACPI
Message-ID: <20211118112306.00004b55@Huawei.com>
In-Reply-To: <655c65af-fd7a-8007-37b3-a56c60a0ec5b@redhat.com>
References: <20211027052958.280741-1-gshan@redhat.com>
 <20211027174028.1f16fcfb@redhat.com>
 <fecb9351-ae78-8fcd-e377-623243ef80df@redhat.com>
 <20211101094431.71e1a50a@redhat.com>
 <47dc3a95-ed77-6c0e-d024-27cb22c338eb@redhat.com>
 <20211102073948.am3p3hcqqd3cfvru@gator.home>
 <b8ed4687-e30a-d70f-0816-bd8ba490ceb7@redhat.com>
 <20211110113304.2d713d4a@redhat.com>
 <5180ecee-62e2-cd6f-d595-c7c29eff6039@redhat.com>
 <20211112142751.4807ab50@redhat.com>
 <188faab7-1e57-2bc1-846f-9457433c2f9d@redhat.com>
 <20211117143015.00002e0a@Huawei.com>
 <8576e0e8-aa06-1c05-9849-806c2bce4141@redhat.com>
 <20211118102837.00002069@Huawei.com>
 <655c65af-fd7a-8007-37b3-a56c60a0ec5b@redhat.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.127.148]
X-ClientProxiedBy: lhreml749-chm.china.huawei.com (10.201.108.199) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, Andrew Jones <drjones@redhat.com>,
 Gavin Shan <gshan@redhat.com>, ehabkost@redhat.com,
 richard.henderson@linaro.org, alison.schofield@intel.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, shan.gavin@gmail.com,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Nov 2021 12:06:27 +0100
David Hildenbrand <david@redhat.com> wrote:

> On 18.11.21 11:28, Jonathan Cameron wrote:
> > On Wed, 17 Nov 2021 19:08:28 +0100
> > David Hildenbrand <david@redhat.com> wrote:
> >   
> >> On 17.11.21 15:30, Jonathan Cameron wrote:  
> >>> On Tue, 16 Nov 2021 12:11:29 +0100
> >>> David Hildenbrand <david@redhat.com> wrote:
> >>>     
> >>>>>>
> >>>>>> Examples include exposing HBM or PMEM to the VM. Just like on real HW,
> >>>>>> this memory is exposed via cpu-less, special nodes. In contrast to real
> >>>>>> HW, the memory is hotplugged later (I don't think HW supports hotplug
> >>>>>> like that yet, but it might just be a matter of time).      
> >>>>>
> >>>>> I suppose some of that maybe covered by GENERIC_AFFINITY entries in SRAT
> >>>>> some by MEMORY entries. Or nodes created dynamically like with normal
> >>>>> hotplug memory.
> >>>>>       
> >>>     
> >>
> >> Hi Jonathan,
> >>  
> >>> The naming of the define is unhelpful.  GENERIC_AFFINITY here corresponds
> >>> to Generic Initiator Affinity.  So no good for memory. This is meant for
> >>> representation of accelerators / network cards etc so you can get the NUMA
> >>> characteristics for them accessing Memory in other nodes.
> >>>
> >>> My understanding of 'traditional' memory hotplug is that typically the
> >>> PA into which memory is hotplugged is known at boot time whether or not
> >>> the memory is physically present.  As such, you present that in SRAT and rely
> >>> on the EFI memory map / other information sources to know the memory isn't
> >>> there.  When it is hotplugged later the address is looked up in SRAT to identify
> >>> the NUMA node.    
> >>
> >> in virtualized environments we use the SRAT only to indicate the hotpluggable
> >> region (-> indicate maximum possible PFN to the guest OS), the actual present
> >> memory+PXM assignment is not done via SRAT. We differ quite a lot here from
> >> actual hardware I think.
> >>  
> >>>
> >>> That model is less useful for more flexible entities like virtio-mem or
> >>> indeed physical hardware such as CXL type 3 memory devices which typically
> >>> need their own nodes.
> >>>
> >>> For the CXL type 3 option, currently proposal is to use the CXL table entries
> >>> representing Physical Address space regions to work out how many NUMA nodes
> >>> are needed and just create extra ones at boot.
> >>> https://lore.kernel.org/linux-cxl/163553711933.2509508.2203471175679990.stgit@dwillia2-desk3.amr.corp.intel.com
> >>>
> >>> It's a heuristic as we might need more nodes to represent things well kernel
> >>> side, but it's better than nothing and less effort that true dynamic node creation.
> >>> If you chase through the earlier versions of Alison's patch you will find some
> >>> discussion of that.
> >>>
> >>> I wonder if virtio-mem should just grow a CDAT instance via a DOE?
> >>>
> >>> That would make all this stuff discoverable via PCI config space rather than ACPI
> >>> CDAT is at:
> >>> https://uefi.org/sites/default/files/resources/Coherent%20Device%20Attribute%20Table_1.01.pdf
> >>> but the table access protocol over PCI DOE is currently in the CXL 2.0 spec
> >>> (nothing stops others using it though AFAIK).
> >>>
> >>> However, then we'd actually need either dynamic node creation in the OS, or
> >>> some sort of reserved pool of extra nodes.  Long term it may be the most
> >>> flexible option.    
> >>
> >>
> >> I think for virtio-mem it's actually a bit simpler:
> >>
> >> a) The user defined on the QEMU cmdline an empty node
> >> b) The user assigned a virtio-mem device to a node, either when 
> >>    coldplugging or hotplugging the device.
> >>
> >> So we don't actually "hotplug" a new node, the (possible) node is already known
> >> to QEMU right when starting up. It's just a matter of exposing that fact to the
> >> guest OS -- similar to how we expose the maximum possible PFN to the guest OS.
> >> It's seems to boild down to an ACPI limitation.
> >>
> >> Conceptually, virtio-mem on an empty node in QEMU is not that different from
> >> hot/coldplugging a CPU to an empty node or hot/coldplugging a DIMM/NVDIMM to
> >> an empty node. But I guess it all just doesn't work with QEMU as of now.  
> > 
> > A side distraction perhaps, but there is a code first acpi proposal to add
> > a 'softer' form of CPU hotplug 
> > https://bugzilla.tianocore.org/show_bug.cgi?id=3706
> > 
> > Whilst the reason for that proposal was for arm64 systems where there is no architected
> > physical hotplug, it might partly solve the empty node question for CPUs.  They won't
> > be empty, there will simply be CPUs that are marked as 'Online capable'.
> >   
> >>
> >> In current x86-64 code, we define the "hotpluggable region" in hw/i386/acpi-build.c via
> >>
> >> 	build_srat_memory(table_data, machine->device_memory->base,
> >> 			  hotpluggable_address_space_size, nb_numa_nodes - 1,
> >> 			  MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
> >>
> >> So we tell the guest OS "this range is hotpluggable" and "it contains to
> >> this node unless the device says something different". From both values we
> >> can -- when under QEMU -- conclude the maximum possible PFN and the maximum
> >> possible node. But the latter is not what Linux does: it simply maps the last
> >> numa node (indicated in the memory entry) to a PXM
> >> (-> drivers/acpi/numa/srat.c:acpi_numa_memory_affinity_init()).  
> > yeah.  There is nothing in ACPI that says there can't be holes in the node numbering
> > so Linux does a remapping as you point out.
> >   
> >>
> >>
> >> I do wonder if we could simply expose the same hotpluggable range via multiple nodes:  
> > 
> > Fairly sure the answer to this is no.  You'd have to indicate different ranges and
> > then put the virtio-mem in the right one.   
> 
> And I repeat, this is in no way different to DIMMs/NVDIMMs. We cannot predict
> the future when hotplugging DIMMS/NVDIMMs/virtio-mem/... to some node later. We only
> have access to that information when coldplugging devices, but even a
> hotunplug+hotplug can change that info. Whatever we expose via ACPI is moot
> already and just a hint to the guest OS "maximum possible PFN".

Sure, so the solution is a large non overlapping extra node for each node on the
underlying physical system.  It uses a lot of PA space, but I'm going to assume
the system isn't so big that that PA space exhaustion is a problem?  For a sensible setup
those node would match the actual memory present on the underlying system.

For physical CCIX systems we did this with SRAT entries with XTB per node to match
what the host supported.  On our particular platform those PA ranges were well separated
from each other due to how the system routing worked, but the principal is the same.
Those supported a huge amount of memory being hotplugged.

> 
> We've been abusing ACPI hotpluggable region for years for virt DIMM hotplug,
> putting it to some fantasy node and having it just work with hotplug of
> DIMMs/NVDIMMs. The only issue we have is empty nodes. We differ from real
> HW already significantly (especially, never exposing DIMMs via e820 to
> the guest, which I call a feature and not a bug).

Understood.
> 
> > Now I can't actually find anywhere in the
> > ACPI spec that says that but I'm 99% sure Linux won't like and I'm fairly sure if we
> > query it with ACPI folks the answer will be a no you can't don't that.  
> 
> I didn't find anything that contradicts it in the spec as well. It's not really
> specified what's allowed and what's not :)
> 
> FWIW, the code I shared works with 5.11.12-300.fc34.x86_64 inside the guest flawlessly.

Hmm. I'm surprised that works at all and my worry is there is no reason it will continue
to work.

Jonathan

 
> 
> #! /bin/bash
> sudo build/qemu-system-x86_64 \
>     --enable-kvm \
>     -m 8G,maxmem=32G,slots=1 \
>     -object memory-backend-memfd,id=mem,size=8G \
>     -numa node,nodeid=0,memdev=mem,cpus=0-4 \
>     -numa node,nodeid=1 -numa node,nodeid=2 \
>     -numa node,nodeid=3 -numa node,nodeid=4 \
>     -smp sockets=2,cores=4 \
>     -nographic \
>     -nodefaults \
>     -net nic -net user \
>     -chardev stdio,nosignal,id=serial \
>     -hda Fedora-Cloud-Base-34-1.2.x86_64.qcow2 \
>     -cdrom /home/dhildenb/git/cloud-init/cloud-init.iso \
>     -device isa-serial,chardev=serial \
>     -chardev socket,id=monitor,path=/var/tmp/mon_src,server,nowait \
>     -mon chardev=monitor,mode=readline \
>     -object memory-backend-memfd,id=mem0,size=8G \
>     -device virtio-mem-pci,id=vmem0,memdev=mem0,node=1,requested-size=128M \
>     -object memory-backend-memfd,id=mem1,size=8G \
>     -device virtio-mem-pci,id=vmem1,memdev=mem1,node=2,requested-size=128M \
>     -object memory-backend-memfd,id=mem2,size=8G \
>     -device virtio-mem-pci,id=vmem2,memdev=mem2,node=3,requested-size=128M
> 
> [root@vm-0 ~]# dmesg | grep "ACPI: SRAT: Node"
> [    0.009933] ACPI: SRAT: Node 0 PXM 0 [mem 0x00000000-0x0009ffff]
> [    0.009939] ACPI: SRAT: Node 0 PXM 0 [mem 0x00100000-0xbfffffff]
> [    0.009941] ACPI: SRAT: Node 0 PXM 0 [mem 0x100000000-0x23fffffff]
> [    0.009942] ACPI: SRAT: Node 1 PXM 1 [mem 0x240000000-0x87fffffff] hotplug
> [    0.009944] ACPI: SRAT: Node 2 PXM 2 [mem 0x240000000-0x87fffffff] hotplug
> [    0.009946] ACPI: SRAT: Node 3 PXM 3 [mem 0x240000000-0x87fffffff] hotplug
> [    0.009947] ACPI: SRAT: Node 4 PXM 4 [mem 0x240000000-0x87fffffff] hotplug
> [root@vm-0 ~]# numactl --hardware
> available: 4 nodes (0-3)
> node 0 cpus: 0 1 2 3 4 5 6 7
> node 0 size: 7950 MB
> node 0 free: 7692 MB
> node 1 cpus:
> node 1 size: 128 MB
> node 1 free: 123 MB
> node 2 cpus:
> node 2 size: 128 MB
> node 2 free: 127 MB
> node 3 cpus:
> node 3 size: 128 MB
> node 3 free: 127 MB
> node distances:
> node   0   1   2   3 
>   0:  10  20  20  20 
>   1:  20  10  20  20 
>   2:  20  20  10  20 
>   3:  20  20  20  10 
> 
> 
> 


