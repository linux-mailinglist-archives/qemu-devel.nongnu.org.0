Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 516284EC30E
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 14:18:04 +0200 (CEST)
Received: from localhost ([::1]:51030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZXH1-0004j4-5K
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 08:18:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nZXFN-0003pB-3h
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:16:21 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nZXFK-0002vX-3H
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:16:20 -0400
Received: from fraeml713-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KT5300QRQz67ms2;
 Wed, 30 Mar 2022 20:14:36 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml713-chm.china.huawei.com (10.206.15.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 30 Mar 2022 14:16:03 +0200
Received: from localhost (10.47.70.51) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.24; Wed, 30 Mar
 2022 13:16:01 +0100
Date: Wed, 30 Mar 2022 13:15:58 +0100
To: Davidlohr Bueso <dave@stgolabs.net>
CC: Adam Manzanares <a.manzanares@samsung.com>, "linuxarm@huawei.com"
 <linuxarm@huawei.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Alex
 =?ISO-8859-1?Q?Benn=EF=BF=BDe?= <alex.bennee@linaro.org>, Marcel Apfelbaum
 <marcel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, Ben Widawsky
 <ben.widawsky@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=EF=BF=BD?= <f4bug@amsat.org>, Peter Xu
 <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Saransh Gupta1 <saransh@ibm.com>, Shreyas Shah
 <shreyas.shah@elastics.cloud>, Chris Browy <cbrowy@avery-design.com>,
 "Samarth Saxena" <samarths@cadence.com>, Dan Williams
 <dan.j.williams@intel.com>, "Mark Cave-Ayland"
 <mark.cave-ayland@ilande.co.uk>, Tong Zhang <t.zhang2@samsung.com>,
 "k.jensen@samsung.com" <k.jensen@samsung.com>
Subject: Re: [PATCH v8 04/46] hw/cxl/device: Introduce a CXL device (8.2.8)
Message-ID: <20220330131558.00004c26@Huawei.com>
In-Reply-To: <20220329195351.mzlbgxu2riscdb22@offworld>
References: <20220318150635.24600-1-Jonathan.Cameron@huawei.com>
 <20220318150635.24600-5-Jonathan.Cameron@huawei.com>
 <CGME20220329181401uscas1p2b229afdbb479a012e140f84367c35ccd@uscas1p2.samsung.com>
 <20220329181353.GA59203@bgt-140510-bm01>
 <20220329195351.mzlbgxu2riscdb22@offworld>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.70.51]
X-ClientProxiedBy: lhreml706-chm.china.huawei.com (10.201.108.55) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Tue, 29 Mar 2022 12:53:51 -0700
Davidlohr Bueso <dave@stgolabs.net> wrote:

> On Tue, 29 Mar 2022, Adam Manzanares wrote:
> >> +typedef struct cxl_device_state {
> >> +    MemoryRegion device_registers;
> >> +
> >> +    /* mmio for device capabilities array - 8.2.8.2 */
> >> +    MemoryRegion device;
> >> +    MemoryRegion caps;
> >> +
> >> +    /* mmio for the mailbox registers 8.2.8.4 */
> >> +    MemoryRegion mailbox;
> >> +
> >> +    /* memory region for persistent memory, HDM */
> >> +    uint64_t pmem_size;  
> >
> >Can we switch this to mem_size and drop the persistent comment? It is my
> >understanding that HDM is independent of persistence.  
> 
> Agreed, but ideally both volatile and persistent capacities would have been
> supported in this patchset. I'm also probably missing specific reasons as to
> why this isn't the case.

Whilst it doesn't add a huge amount of complexity it does add some
and the software paths in Linux we were developing this for are pmem focused.
Hence volatile is on the todo list rather than in this first patch set.
Not sensible to aim for feature complete in one go.

> 
> Looking at it briefly could it be just a matter of adding to cxl_type3_dev
> a new hostmem along with it's AddressSpace for the volatile? If so, I'm
> thinking something along these lines:
> 
> @@ -123,8 +123,8 @@ typedef struct cxl_device_state {
> 	 uint64_t host_set;
>       } timestamp;
> 
> -    /* memory region for persistent memory, HDM */
> -    uint64_t pmem_size;
> +    /* memory region for persistent and volatile memory, HDM */
> +    uint64_t pmem_size, mem_size;
>   } CXLDeviceState;
> 
>   /* Initialize the register block for a device */
> @@ -235,9 +235,9 @@ typedef struct cxl_type3_dev {
>       PCIDevice parent_obj;
> 
>       /* Properties */
> -    AddressSpace hostmem_as;
> +    AddressSpace hostmem_as, hostmemv_as;
>       uint64_t size;
> -    HostMemoryBackend *hostmem;
> +    HostMemoryBackend *hostmem, *hostmemv;
>       HostMemoryBackend *lsa;
>       uint64_t sn;
> 
> Then for cxl_setup_memory(), with ct3d->hostmem and/or ct3d->hostmemv
> non-nil, set the respective MemoryRegions:
> 
> +    if (ct3d->hostmem) {
> +            memory_region_set_nonvolatile(mr, true);
> +            memory_region_set_enabled(mr, true);
> +            host_memory_backend_set_mapped(ct3d->hostmem, true);
> +            address_space_init(&ct3d->hostmem_as, mr, name);
> +            ct3d->cxl_dstate.pmem_size = ct3d->hostmem->size;
> +    }
> +    if (ct3d->hostmemv) {
> +            memory_region_set_nonvolatile(mrv, false);
> +            memory_region_set_enabled(mrv, true);
> +            host_memory_backend_set_mapped(ct3d->hostmemv, true);
> +            address_space_init(&ct3d->hostmem_as, mrv, name);
> +            ct3d->cxl_dstate.pmem_size = ct3d->hostmem->size;
> +    }
> 
> For corresponding MB commands, it's mostly IDENTIFY_MEMORY_DEVICE that needs
> updating:
> 
> @@ -281,7 +281,7 @@ static ret_code cmd_identify_memory_device(struct cxl_cmd *cmd,
> 
>       CXLType3Dev *ct3d = container_of(cxl_dstate, CXLType3Dev, cxl_dstate);
>       CXLType3Class *cvc = CXL_TYPE3_DEV_GET_CLASS(ct3d);
> -    uint64_t size = cxl_dstate->pmem_size;
> +    uint64_t size = cxl_dstate->pmem_size + cxl_dstate->mem_size;
> 
>       if (!QEMU_IS_ALIGNED(size, 256 << 20)) {
> 	 return CXL_MBOX_INTERNAL_ERROR;
> @@ -290,11 +290,11 @@ static ret_code cmd_identify_memory_device(struct cxl_cmd *cmd,
>       id = (void *)cmd->payload;
>       memset(id, 0, sizeof(*id));
> 
> -    /* PMEM only */
>       snprintf(id->fw_revision, 0x10, "BWFW VERSION %02d", 0);
> 
>       id->total_capacity = size / (256 << 20);
> -    id->persistent_capacity = size / (256 << 20);
> +    id->persistent_capacity = cxl_dstate->pmem_size / (256 << 20);
> +    id->volatile_capacity = cxl_dstate->mem_size / (256 << 20);
>       id->lsa_size = cvc->get_lsa_size(ct3d);
> 
>       *len = sizeof(*id);
> @@ -312,16 +312,16 @@ static ret_code cmd_ccls_get_partition_info(struct cxl_cmd *cmd,
> 	 uint64_t next_pmem;
>       } QEMU_PACKED *part_info = (void *)cmd->payload;
>       QEMU_BUILD_BUG_ON(sizeof(*part_info) != 0x20);
> -    uint64_t size = cxl_dstate->pmem_size;
> +    uint64_t psize = cxl_dstate->pmem_size;
> +    uint64_t vsize = cxl_dstate->mem_size;
> 
> -    if (!QEMU_IS_ALIGNED(size, 256 << 20)) {
> +    if (!QEMU_IS_ALIGNED(psize + vsize, 256 << 20)) {
> 	 return CXL_MBOX_INTERNAL_ERROR;
>       }
> 
> -    /* PMEM only */
> -    part_info->active_vmem = 0;
> -    part_info->next_vmem = 0;
> -    part_info->active_pmem = size / (256 << 20);
> +    part_info->active_vmem = vsize / (256 << 20);
> +    part_info->next_vmem = part_info->active_vmem;
> +    part_info->active_pmem = psize / (256 << 20);
>       part_info->next_pmem = part_info->active_pmem;
> 
> Then for reads/writes, both cxl_type3_write() and _read() would, after computing the dpa_offset,
> first try the volatile region then upon error attempt the same in the persistent memory - this
> assuming the DPA space is consistent among both types of memory. Ie:
> 
> address_space_read(&ct3d->hostmemv_as, dpa_offset, attrs, data, size)
> or
> address_space_read(&ct3d->hostmem_as, dpa_offset, attrs, data, size)
> 
> ... but then again all this is probably just wishful thinking.

Without looking in detail, will indeed be something along those lines.
Gets more fiddly if you include partitioning control that Alison was interested
in adding.

Also, we probably need to support multiple HDM decoders.  Also not a huge
complexity to add, but left for now as main focus is to get the base
patch set merged.

So I'm happy to queue stuff up on top of this series and carry it forward
but I don't want to add features to what we try to merge initially.
This set is already huge and hard to review even with what think is a
minimum set of features to be useful.

Note I'm already carrying a few features on top if this on the gitlab
branch gitlab.com/jic23/qemu (DOE + CDAT and serial numbers) and
have a few other things out of tree for now (SPDM, emulating most
of the PCI Config space controls). 

Jonathan

> 
> Thanks,
> Davidlohr


