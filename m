Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEA84B2B16
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:57:31 +0100 (CET)
Received: from localhost ([::1]:44464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIZEg-0008Es-I6
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:57:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nIZ7r-0003pM-Sq
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:50:28 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nIZ7p-0004Xt-Q3
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:50:27 -0500
Received: from fraeml714-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JwKN03S7Xz67YxD;
 Sat, 12 Feb 2022 00:49:36 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml714-chm.china.huawei.com (10.206.15.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 11 Feb 2022 17:50:22 +0100
Received: from localhost (10.202.226.41) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Fri, 11 Feb
 2022 16:50:21 +0000
Date: Fri, 11 Feb 2022 16:50:18 +0000
To: <qemu-devel@nongnu.org>, Alex =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>, Marcel Apfelbaum <marcel@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, <linuxarm@huawei.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: Re: [PATCH v6 17/43] hw/cxl/device: Add a memory device (8.2.8.5)
Message-ID: <20220211165018.0000739c@Huawei.com>
In-Reply-To: <20220211120747.3074-18-Jonathan.Cameron@huawei.com>
References: <20220211120747.3074-1-Jonathan.Cameron@huawei.com>
 <20220211120747.3074-18-Jonathan.Cameron@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.41]
X-ClientProxiedBy: lhreml727-chm.china.huawei.com (10.201.108.78) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

On Fri, 11 Feb 2022 12:07:21 +0000
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> From: Ben Widawsky <ben.widawsky@intel.com>
> 
> A CXL memory device (AKA Type 3) is a CXL component that contains some
> combination of volatile and persistent memory. It also implements the
> previously defined mailbox interface as well as the memory device
> firmware interface.
> 
> Although the memory device is configured like a normal PCIe device, the
> memory traffic is on an entirely separate bus conceptually (using the
> same physical wires as PCIe, but different protocol).
> 
> Once the CXL topology is fully configure and address decoders committed,
> the guest physical address for the memory device is part of a larger
> window which is owned by the platform.  The creation of these windows
> is later in this series.
> 
> The following example will create a 256M device in a 512M window:
> -object "memory-backend-file,id=cxl-mem1,share,mem-path=cxl-type3,size=512M"
> -device "cxl-type3,bus=rp0,memdev=cxl-mem1,id=cxl-pmem0"
> 
> Note: Dropped PCDIMM info interfaces for now.  They can be added if
> appropriate at a later date.
> 
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

...

> +
> +static void cxl_setup_memory(CXLType3Dev *ct3d, Error **errp)
> +{
> +    MemoryRegion *mr;
> +
> +    if (!ct3d->hostmem) {
> +        error_setg(errp, "memdev property must be set");
> +        return;
> +    }
> +
> +    mr = host_memory_backend_get_memory(ct3d->hostmem);
> +    if (!mr) {
> +        error_setg(errp, "memdev property must be set");
> +        return;
> +    }
> +    memory_region_set_nonvolatile(mr, true);
> +    memory_region_set_enabled(mr, true);
> +    host_memory_backend_set_mapped(ct3d->hostmem, true);
> +    ct3d->cxl_dstate.pmem_size = ct3d->hostmem->size;
> +}
> +
> +
> +static void ct3_realize(PCIDevice *pci_dev, Error **errp)
> +{
> +    CXLType3Dev *ct3d = CT3(pci_dev);
> +    CXLComponentState *cxl_cstate = &ct3d->cxl_cstate;
> +    ComponentRegisters *regs = &cxl_cstate->crb;
> +    MemoryRegion *mr = &regs->component_registers;
> +    uint8_t *pci_conf = pci_dev->config;
> +
> +    if (!ct3d->hostmem) {

Ben pointed out in reply to v5 that this is backwards.
I'll fix in v7.  Clearly some of the cxl_setup_memory()
logic may also not be needed seeing as it wasn't running.


> +        cxl_setup_memory(ct3d, errp);
> +    }
> +
> +    pci_config_set_prog_interface(pci_conf, 0x10);
> +    pci_config_set_class(pci_conf, PCI_CLASS_MEMORY_CXL);
> +

