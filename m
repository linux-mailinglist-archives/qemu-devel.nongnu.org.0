Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 324582EC179
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 17:52:24 +0100 (CET)
Received: from localhost ([::1]:48532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxC2p-0007pB-5v
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 11:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kxC0a-0006b1-9B
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 11:50:04 -0500
Received: from mga18.intel.com ([134.134.136.126]:11516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kxC0X-0003L2-Gg
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 11:50:03 -0500
IronPort-SDR: OwZ04BYwFA52wxB0EpGVMr5WRawLUhg2DYkRNxME42H36yavXKtr570c9ICgJghpGDbzShceun
 8UHrTlMJHY0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9856"; a="165001644"
X-IronPort-AV: E=Sophos;i="5.79,327,1602572400"; d="scan'208";a="165001644"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2021 08:49:54 -0800
IronPort-SDR: GS+r00+aSV8JrE1Q/V/6k0qWuKkVQJcN4zfoEtNvUTDYVFoWF/1oKoG8jDM8EAKYJvQxguFraf
 6NHgSvnd13dw==
X-IronPort-AV: E=Sophos;i="5.79,327,1602572400"; d="scan'208";a="565872770"
Received: from pthatich-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.252.142.206])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2021 08:49:50 -0800
Date: Wed, 6 Jan 2021 08:49:48 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [RFC PATCH v2 05/32] hw/cxl/device: Implement the CAP array
 (8.2.8.1-2)
Message-ID: <20210106164948.mhk6a66wcppfzlj4@intel.com>
References: <20210105165323.783725-1-ben.widawsky@intel.com>
 <20210105165323.783725-6-ben.widawsky@intel.com>
 <20210106132805.00007f14@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106132805.00007f14@Huawei.com>
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=ben.widawsky@intel.com; helo=mga18.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Chris Browy <cbrowy@avery-design.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Prashant V Agarwal <agpr123@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-01-06 13:28:05, Jonathan Cameron wrote:
> On Tue, 5 Jan 2021 08:52:56 -0800
> Ben Widawsky <ben.widawsky@intel.com> wrote:
> 
> > This implements all device MMIO up to the first capability .That
> > includes the CXL Device Capabilities Array Register, as well as all of
> > the CXL Device Capability Header Registers. The latter are filled in as
> > they are implemented in the following patches.
> > 
> > v2: Break out register alignment checks (Jonathan)
> > 
> > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> Hi Ben,
> 
> One buglet / inconsistency inline that I spotted whilst chasing that issue
> with size of reads.
> 
> Will get to a full review after messing around ('testing') this a bit more ;)
> 
> Jonathan
> 
> > ---
> >  hw/cxl/cxl-device-utils.c | 72 +++++++++++++++++++++++++++++++++++++++
> >  hw/cxl/meson.build        |  1 +
> >  2 files changed, 73 insertions(+)
> >  create mode 100644 hw/cxl/cxl-device-utils.c
> > 
> > diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
> > new file mode 100644
> > index 0000000000..d1b1371e66
> > --- /dev/null
> > +++ b/hw/cxl/cxl-device-utils.c
> > @@ -0,0 +1,72 @@
> > +/*
> > + * CXL Utility library for devices
> > + *
> > + * Copyright(C) 2020 Intel Corporation.
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2. See the
> > + * COPYING file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/log.h"
> > +#include "hw/cxl/cxl.h"
> > +
> > +static int cxl_device_check_register_alignment(hwaddr offset, unsigned size)
> > +{
> > +    if (unlikely(offset & (size - 1))) {
> > +        return 1;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static uint64_t caps_reg_read(void *opaque, hwaddr offset, unsigned size)
> > +{
> > +    CXLDeviceState *cxl_dstate = opaque;
> > +
> > +    if (cxl_device_check_register_alignment(offset, size)) {
> > +        qemu_log_mask(LOG_UNIMP, "Unaligned register read\n");
> > +        return 0;
> > +    }
> > +
> > +    return ldn_le_p(cxl_dstate->caps_reg_state + offset, size);
> > +}
> > +
> > +static const MemoryRegionOps caps_ops = {
> > +    .read = caps_reg_read,
> > +    .write = NULL,
> > +    .endianness = DEVICE_LITTLE_ENDIAN,
> > +    .valid = {
> > +        .min_access_size = 4,
> > +        .max_access_size = 8,
> > +    },
> > +    .impl = {
> > +        .min_access_size = 4,
> > +        .max_access_size = 8,
> > +    },
> > +};
> > +
> > +void cxl_device_register_block_init(Object *obj, CXLDeviceState *cxl_dstate)
> > +{
> > +    /* This will be a BAR, so needs to be rounded up to pow2 for PCI spec */
> > +    memory_region_init(
> > +        &cxl_dstate->device_registers, obj, "device-registers",
> > +        pow2ceil(CXL_MAILBOX_REGISTERS_LENGTH + CXL_MAILBOX_REGISTERS_OFFSET));
> 
> I can see why you jumped directly to sizing this for the whole region, but the snag
> is that means I think you missed the fact that patch 8 adds a region after the end
> of the mailbox.   Doesn't result in an actual bug because the ceil above takes
> you way past the space needed though (the memory device region is only 8 bytes long).
> 
> 

Maybe I misunderstand, but this is the intended behavior.
cxl_dstate->device_registers is the MemoryRegion container for all the
subregions that are the actual device MMIO.

                     +------------------+
                  ^  |                  |
                  |  |      unused      |
                  |  --------------------
                  |  |   memdev regs    |
                  |  --------------------
                  |  |                  |
                  |  | +--------------+ |
 cxl_dstate->     |  | |              | |
 device_registers |  | |              | |
                  |  | |payload       | |
                  |  | |(2k currently)| |
                  |  | |              | |
                  |  | |              | |
                  |  | +--------------+ |
                  |  |   mailbox regs   |
                  |  --------------------
                  |  |    device regs   |
                  v  --------------------
                     |     caps regs    |
         BAR ------> +------------------+


Perhaps I should add this as a comment in the code?

> > +
> > +    memory_region_init_io(&cxl_dstate->caps, obj, &caps_ops, cxl_dstate,
> > +                          "cap-array", CXL_DEVICE_REGISTERS_OFFSET - 0);
> > +
> > +    memory_region_add_subregion(&cxl_dstate->device_registers, 0,
> > +                                &cxl_dstate->caps);
> > +}
> > +
> > +void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
> > +{
> > +    uint32_t *cap_hdrs = cxl_dstate->caps_reg_state32;
> > +    const int cap_count = 0;
> > +
> > +    /* CXL Device Capabilities Array Register */
> > +    ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_ID, 0);
> > +    ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_VERSION, 1);
> > +    ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY2, CAP_COUNT, cap_count);
> > +}
> > diff --git a/hw/cxl/meson.build b/hw/cxl/meson.build
> > index 00c3876a0f..47154d6850 100644
> > --- a/hw/cxl/meson.build
> > +++ b/hw/cxl/meson.build
> > @@ -1,3 +1,4 @@
> >  softmmu_ss.add(when: 'CONFIG_CXL', if_true: files(
> >    'cxl-component-utils.c',
> > +  'cxl-device-utils.c',
> >  ))
> 

