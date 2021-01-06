Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3B32EC1CD
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 18:11:41 +0100 (CET)
Received: from localhost ([::1]:59244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxCLT-0000Pp-TX
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 12:11:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1kxCHN-0003IZ-Jw
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 12:07:25 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1kxCHK-0006ar-Gk
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 12:07:25 -0500
Received: from fraeml706-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4D9wdz3CB2z67D3C;
 Thu,  7 Jan 2021 01:02:31 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml706-chm.china.huawei.com (10.206.15.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Wed, 6 Jan 2021 18:07:18 +0100
Received: from localhost (10.47.75.92) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 6 Jan 2021
 17:07:17 +0000
Date: Wed, 6 Jan 2021 17:06:41 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Ben Widawsky <ben.widawsky@intel.com>
Subject: Re: [RFC PATCH v2 05/32] hw/cxl/device: Implement the CAP array
 (8.2.8.1-2)
Message-ID: <20210106170641.0000557c@Huawei.com>
In-Reply-To: <20210106164948.mhk6a66wcppfzlj4@intel.com>
References: <20210105165323.783725-1-ben.widawsky@intel.com>
 <20210105165323.783725-6-ben.widawsky@intel.com>
 <20210106132805.00007f14@Huawei.com>
 <20210106164948.mhk6a66wcppfzlj4@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.75.92]
X-ClientProxiedBy: lhreml720-chm.china.huawei.com (10.201.108.71) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 Chris Browy <cbrowy@avery-design.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Da?= =?ISO-8859-1?Q?ud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Prashant V Agarwal <agpr123@gmail.com>, Dan
 Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 6 Jan 2021 08:49:48 -0800
Ben Widawsky <ben.widawsky@intel.com> wrote:

> On 21-01-06 13:28:05, Jonathan Cameron wrote:
> > On Tue, 5 Jan 2021 08:52:56 -0800
> > Ben Widawsky <ben.widawsky@intel.com> wrote:
> >   
> > > This implements all device MMIO up to the first capability .That
> > > includes the CXL Device Capabilities Array Register, as well as all of
> > > the CXL Device Capability Header Registers. The latter are filled in as
> > > they are implemented in the following patches.
> > > 
> > > v2: Break out register alignment checks (Jonathan)
> > > 
> > > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>  
> > Hi Ben,
> > 
> > One buglet / inconsistency inline that I spotted whilst chasing that issue
> > with size of reads.
> > 
> > Will get to a full review after messing around ('testing') this a bit more ;)
> > 
> > Jonathan
> >   
> > > ---
> > >  hw/cxl/cxl-device-utils.c | 72 +++++++++++++++++++++++++++++++++++++++
> > >  hw/cxl/meson.build        |  1 +
> > >  2 files changed, 73 insertions(+)
> > >  create mode 100644 hw/cxl/cxl-device-utils.c
> > > 
> > > diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
> > > new file mode 100644
> > > index 0000000000..d1b1371e66
> > > --- /dev/null
> > > +++ b/hw/cxl/cxl-device-utils.c
> > > @@ -0,0 +1,72 @@
> > > +/*
> > > + * CXL Utility library for devices
> > > + *
> > > + * Copyright(C) 2020 Intel Corporation.
> > > + *
> > > + * This work is licensed under the terms of the GNU GPL, version 2. See the
> > > + * COPYING file in the top-level directory.
> > > + */
> > > +
> > > +#include "qemu/osdep.h"
> > > +#include "qemu/log.h"
> > > +#include "hw/cxl/cxl.h"
> > > +
> > > +static int cxl_device_check_register_alignment(hwaddr offset, unsigned size)
> > > +{
> > > +    if (unlikely(offset & (size - 1))) {
> > > +        return 1;
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +static uint64_t caps_reg_read(void *opaque, hwaddr offset, unsigned size)
> > > +{
> > > +    CXLDeviceState *cxl_dstate = opaque;
> > > +
> > > +    if (cxl_device_check_register_alignment(offset, size)) {
> > > +        qemu_log_mask(LOG_UNIMP, "Unaligned register read\n");
> > > +        return 0;
> > > +    }
> > > +
> > > +    return ldn_le_p(cxl_dstate->caps_reg_state + offset, size);
> > > +}
> > > +
> > > +static const MemoryRegionOps caps_ops = {
> > > +    .read = caps_reg_read,
> > > +    .write = NULL,
> > > +    .endianness = DEVICE_LITTLE_ENDIAN,
> > > +    .valid = {
> > > +        .min_access_size = 4,
> > > +        .max_access_size = 8,
> > > +    },
> > > +    .impl = {
> > > +        .min_access_size = 4,
> > > +        .max_access_size = 8,
> > > +    },
> > > +};
> > > +
> > > +void cxl_device_register_block_init(Object *obj, CXLDeviceState *cxl_dstate)
> > > +{
> > > +    /* This will be a BAR, so needs to be rounded up to pow2 for PCI spec */
> > > +    memory_region_init(
> > > +        &cxl_dstate->device_registers, obj, "device-registers",
> > > +        pow2ceil(CXL_MAILBOX_REGISTERS_LENGTH + CXL_MAILBOX_REGISTERS_OFFSET));  
> > 
> > I can see why you jumped directly to sizing this for the whole region, but the snag
> > is that means I think you missed the fact that patch 8 adds a region after the end
> > of the mailbox.   Doesn't result in an actual bug because the ceil above takes
> > you way past the space needed though (the memory device region is only 8 bytes long).
> > 
> >   
> 
> Maybe I misunderstand, but this is the intended behavior.
> cxl_dstate->device_registers is the MemoryRegion container for all the
> subregions that are the actual device MMIO.
> 
>                      +------------------+
>                   ^  |                  |
>                   |  |      unused      |
>                   |  --------------------
>                   |  |   memdev regs    |
>                   |  --------------------
>                   |  |                  |
>                   |  | +--------------+ |
>  cxl_dstate->     |  | |              | |
>  device_registers |  | |              | |
>                   |  | |payload       | |
>                   |  | |(2k currently)| |
>                   |  | |              | |
>                   |  | |              | |
>                   |  | +--------------+ |
>                   |  |   mailbox regs   |
>                   |  --------------------
>                   |  |    device regs   |
>                   v  --------------------
>                      |     caps regs    |
>          BAR ------> +------------------+
> 
> 
> Perhaps I should add this as a comment in the code?

I agree with intent but above it is setting limit to the top of
the mailbox regs, not the memdev regs which I'd expect to see.

> 
> > > +
> > > +    memory_region_init_io(&cxl_dstate->caps, obj, &caps_ops, cxl_dstate,
> > > +                          "cap-array", CXL_DEVICE_REGISTERS_OFFSET - 0);
> > > +
> > > +    memory_region_add_subregion(&cxl_dstate->device_registers, 0,
> > > +                                &cxl_dstate->caps);
> > > +}
> > > +
> > > +void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
> > > +{
> > > +    uint32_t *cap_hdrs = cxl_dstate->caps_reg_state32;
> > > +    const int cap_count = 0;
> > > +
> > > +    /* CXL Device Capabilities Array Register */
> > > +    ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_ID, 0);
> > > +    ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_VERSION, 1);
> > > +    ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY2, CAP_COUNT, cap_count);
> > > +}
> > > diff --git a/hw/cxl/meson.build b/hw/cxl/meson.build
> > > index 00c3876a0f..47154d6850 100644
> > > --- a/hw/cxl/meson.build
> > > +++ b/hw/cxl/meson.build
> > > @@ -1,3 +1,4 @@
> > >  softmmu_ss.add(when: 'CONFIG_CXL', if_true: files(
> > >    'cxl-component-utils.c',
> > > +  'cxl-device-utils.c',
> > >  ))  
> >   


