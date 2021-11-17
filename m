Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B3B4548DD
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 15:33:50 +0100 (CET)
Received: from localhost ([::1]:42288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnM0U-0001Nu-21
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 09:33:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1mnLxJ-0005XP-A1; Wed, 17 Nov 2021 09:30:33 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1mnLxE-0006Ru-Ix; Wed, 17 Nov 2021 09:30:33 -0500
Received: from fraeml742-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4HvQL92yfYz67mnw;
 Wed, 17 Nov 2021 22:29:37 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml742-chm.china.huawei.com (10.206.15.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 17 Nov 2021 15:30:19 +0100
Received: from localhost (10.52.126.160) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 17 Nov
 2021 14:30:17 +0000
Date: Wed, 17 Nov 2021 14:30:15 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2] hw/arm/virt: Expose empty NUMA nodes through ACPI
Message-ID: <20211117143015.00002e0a@Huawei.com>
In-Reply-To: <188faab7-1e57-2bc1-846f-9457433c2f9d@redhat.com>
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
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.126.160]
X-ClientProxiedBy: lhreml719-chm.china.huawei.com (10.201.108.70) To
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
Cc: peter.maydell@linaro.org, Andrew
 Jones <drjones@redhat.com>, Gavin Shan <gshan@redhat.com>, ehabkost@redhat.com,
 alison.schofield@intel.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, shan.gavin@gmail.com,
 Igor Mammedov <imammedo@redhat.com>, Dan
 Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Nov 2021 12:11:29 +0100
David Hildenbrand <david@redhat.com> wrote:

> >>
> >> Examples include exposing HBM or PMEM to the VM. Just like on real HW,
> >> this memory is exposed via cpu-less, special nodes. In contrast to real
> >> HW, the memory is hotplugged later (I don't think HW supports hotplug
> >> like that yet, but it might just be a matter of time).  
> > 
> > I suppose some of that maybe covered by GENERIC_AFFINITY entries in SRAT
> > some by MEMORY entries. Or nodes created dynamically like with normal
> > hotplug memory.
> >   

The naming of the define is unhelpful.  GENERIC_AFFINITY here corresponds
to Generic Initiator Affinity.  So no good for memory. This is meant for
representation of accelerators / network cards etc so you can get the NUMA
characteristics for them accessing Memory in other nodes.

My understanding of 'traditional' memory hotplug is that typically the
PA into which memory is hotplugged is known at boot time whether or not
the memory is physically present.  As such, you present that in SRAT and rely
on the EFI memory map / other information sources to know the memory isn't
there.  When it is hotplugged later the address is looked up in SRAT to identify
the NUMA node.

That model is less useful for more flexible entities like virtio-mem or
indeed physical hardware such as CXL type 3 memory devices which typically
need their own nodes.

For the CXL type 3 option, currently proposal is to use the CXL table entries
representing Physical Address space regions to work out how many NUMA nodes
are needed and just create extra ones at boot.
https://lore.kernel.org/linux-cxl/163553711933.2509508.2203471175679990.stgit@dwillia2-desk3.amr.corp.intel.com

It's a heuristic as we might need more nodes to represent things well kernel
side, but it's better than nothing and less effort that true dynamic node creation.
If you chase through the earlier versions of Alison's patch you will find some
discussion of that.

I wonder if virtio-mem should just grow a CDAT instance via a DOE?

That would make all this stuff discoverable via PCI config space rather than ACPI
CDAT is at:
https://uefi.org/sites/default/files/resources/Coherent%20Device%20Attribute%20Table_1.01.pdf
but the table access protocol over PCI DOE is currently in the CXL 2.0 spec
(nothing stops others using it though AFAIK).

However, then we'd actually need either dynamic node creation in the OS, or
some sort of reserved pool of extra nodes.  Long term it may be the most
flexible option.

Jonathan

> 
> I'm certainly no SRAT expert, but seems like under VMWare something
> similar can happen:
> 
> https://lkml.kernel.org/r/BAE95F0C-FAA7-40C6-A0D6-5049B1207A27@vmware.com
> 
> "VM was powered on with 4 vCPUs (4 NUMA nodes) and 4GB memory.
> ACPI SRAT reports 128 possible CPUs and 128 possible NUMA nodes."
> 
> Note that that discussion is about hotplugging CPUs to memory-less,
> hotplugged nodes.
> 
> But there seems to be some way to expose possible NUMA nodes. Maybe
> that's via GENERIC_AFFINITY.
> 


