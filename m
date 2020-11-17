Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5872B5F25
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 13:31:31 +0100 (CET)
Received: from localhost ([::1]:52034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf08w-0003gd-7B
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 07:31:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1kf07b-0003BH-1a
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:30:07 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1kf07X-0007HK-0z
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:30:06 -0500
Received: from fraeml735-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Cb4wK1lCsz67Djw;
 Tue, 17 Nov 2020 20:28:01 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml735-chm.china.huawei.com (10.206.15.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 17 Nov 2020 13:29:49 +0100
Received: from localhost (10.47.31.177) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 17 Nov
 2020 12:29:49 +0000
Date: Tue, 17 Nov 2020 12:29:40 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Ben Widawsky <ben.widawsky@intel.com>
Subject: Re: [RFC PATCH 03/25] hw/cxl/component: Introduce CXL components
 (8.1.x, 8.2.5)
Message-ID: <20201117122940.00002902@Huawei.com>
In-Reply-To: <20201116191936.nhchktyrnc5ijoue@intel.com>
References: <20201111054724.794888-1-ben.widawsky@intel.com>
 <20201111054724.794888-4-ben.widawsky@intel.com>
 <20201116120352.00004f25@Huawei.com>
 <20201116191936.nhchktyrnc5ijoue@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.31.177]
X-ClientProxiedBy: lhreml736-chm.china.huawei.com (10.201.108.87) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 07:29:50
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, Dan
 Williams <dan.j.williams@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Nov 2020 11:19:36 -0800
Ben Widawsky <ben.widawsky@intel.com> wrote:

> On 20-11-16 12:03:52, Jonathan Cameron wrote:
> > On Tue, 10 Nov 2020 21:47:02 -0800
> > Ben Widawsky <ben.widawsky@intel.com> wrote:
> >   
> > > A CXL 2.0 component is any entity in the CXL topology. All components
> > > have a analogous function in PCIe. Except for the CXL host bridge, all
> > > have a PCIe config space that is accessible via the common PCIe
> > > mechanisms. CXL components are enumerated via DVSEC fields in the
> > > extended PCIe header space. CXL components will minimally implement some
> > > subset of CXL.mem and CXL.cache registers defined in 8.2.5 of the CXL
> > > 2.0 specification. Two headers and a utility library are introduced to
> > > support the minimum functionality needed to enumerate components.
> > > 
> > > The cxl_pci header manages bits associated with PCI, specifically the
> > > DVSEC and related fields. The cxl_component.h variant has data
> > > structures and APIs that are useful for drivers implementing any of the
> > > CXL 2.0 components. The library takes care of making use of the DVSEC
> > > bits and the CXL.[mem|cache] regisetrs.
> > > 
> > > None of the mechanisms required to enumerate a CXL capable hostbridge
> > > are introduced at this point.
> > > 
> > > Note that the CXL.mem and CXL.cache registers used are always 4B wide.
> > > It's possible in the future that this constraint will not hold.
> > > 
> > > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> > > 
> > > --
> > > It's tempting to have a more generalized DVSEC infrastructure. As far as
> > > I can tell, the amount this would actually save in terms of code is
> > > minimal because most of DVESC is vendor specific.  
> > 
> > Agreed.  Probably not worth bothering with generic infrastructure for 2.5 DW.
> > 
> > A few comments inline.
> > 
> > Jonathan
> >   
> 
> Anything I didn't respond to is accepted and will be in v2.
> 
> Thanks.
> Ben
> 
Hi Ben,

...

> >   
> > > +
> > > +/* 8.2.5.10 - CXL Security Capability Structure */
> > > +#define CXL_SEC_REGISTERS_OFFSET (CXL_RAS_REGISTERS_OFFSET + CXL_RAS_REGISTERS_SIZE)
> > > +#define CXL_SEC_REGISTERS_SIZE   0 /* We don't implement 1.1 downstream ports */
> > > +
> > > +/* 8.2.5.11 - CXL Link Capability Structure */
> > > +#define CXL_LINK_REGISTERS_OFFSET (CXL_SEC_REGISTERS_OFFSET + CXL_SEC_REGISTERS_SIZE)
> > > +#define CXL_LINK_REGISTERS_SIZE   0x38  
> > 
> > Bit odd to introduce this but not define anything... Can't we bring these
> > in when we need them later?  
> 
> Repeating my comment from 00/25...
> 
> For this specific patch series I liked providing #defines in bulk so that it's
> easy enough to just bring up the spec and review them. Not sure if there is a
> preference from others in the community on this.

Personally I'd prefer to see the lot if you are going to do that, on basis
should only need reviewing against the spec once.
Not sure others will agree though as "the lot" is an awful lot.

> 
> I could also introduce the library that generates the capability headers with
> this. Either is fine, I just wanted to point out the intent.
> 
> >   
> > > +
> > > +/* 8.2.5.12 - CXL HDM Decoder Capability Structure */
> > > +#define HDM_DECODE_MAX 10 /* 8.2.5.12.1 */
> > > +#define CXL_HDM_REGISTERS_OFFSET \
> > > +    (CXL_LINK_REGISTERS_OFFSET + CXL_LINK_REGISTERS_SIZE) /* 8.2.5.12 */
> > > +#define CXL_HDM_REGISTERS_SIZE (0x20 + HDM_DECODE_MAX * 10)
> > > +#define HDM_DECODER_INIT(n, base)                          \
> > > +    REG32(CXL_HDM_DECODER##n##_BASE_LO, base + 0x10)       \  
> > 
> > Offset n should be included in the address calc.  It's always 0 at the moment
> > but might as well put it in now.  Mind you there is something a bit odd
> > in the spec I'm looking at. Nothing defined at 0x2c but no reserved line
> > either in the table.  
> 
> My guess is some earlier version of the spec had the decoder registers as 64b
> and so they wanted to keep natural alignment.

Agreed, but having a hole in the spec isn't great.  Looks like a reserved
field should be inserted.

> 
> > 
...

> >   
> > > +#define PCIE_DVSEC_ID_OFFSET     0x8
> > > +
> > > +#define PCIE_CXL_DEVICE_DVSEC_LENGTH 0x38
> > > +#define PCIE_CXL_DEVICE_DVSEC_REVID  1  
> > 
> > Make it clear this is the CXL 2.0 revid.
> > It would be 0 for CXL 1.1 I think? (8.1.3 of CXL 2.0 spec)  
> 
> Got it. BTW, you're correct. It is in the verbiage there
> "DVSEC Revision ID of 0h represents the structure as defined in CXL 1.1 specification."
> 
> A bit hidden IMO.

Yes, it's 'fun' finding some stuff in that doc, though most things you are looking
for turn out to be somewhere at least.

> 
> > 
> >   
> > > +
> > > +#define EXTENSIONS_PORT_DVSEC_LENGTH 0x28
> > > +#define EXTENSIONS_PORT_DVSEC_REVID  1  
> > 
> > I'm assuming this is the CXL 2.0 exensions DVSEC for ports
> > in figure 128?
> > 
> > If so table 128 has dvsec revision as 0. 
> >   
> 
> Good catch, btw a shortcut is to look at Table 124.

Good point - I'd missed the revision column in that :)

> 
> > > +
> > > +#define GPF_PORT_DVSEC_LENGTH 0x10
> > > +#define GPF_PORT_DVSEC_REVID  0
> > > +
> > > +#define PCIE_FLEXBUS_PORT_DVSEC_LENGTH_2_0 0x14
> > > +#define PCIE_FLEXBUS_PORT_DVSEC_REVID_2_0  1
> > > +
> > > +#define REG_LOC_DVSEC_LENGTH 0x24
> > > +#define REG_LOC_DVSEC_REVID  0  
> > 
> > Whilst I appreciate this is an RFC it would seem more logical
> > to me to only list things in the following enum if we
> > have also defined them here.  E.g. GPF_DEVICE_DVSEC doesn't
> > have length and revid defines.
> >   
> > > +
> > > +enum {
> > > +    PCIE_CXL_DEVICE_DVSEC      = 0,
> > > +    NON_CXL_FUNCTION_MAP_DVSEC = 2,
> > > +    EXTENSIONS_PORT_DVSEC      = 3,
> > > +    GPF_PORT_DVSEC             = 4,
> > > +    GPF_DEVICE_DVSEC           = 5,
> > > +    PCIE_FLEXBUS_PORT_DVSEC    = 7,
> > > +    REG_LOC_DVSEC              = 8,
> > > +    MLD_DVSEC                  = 9,
> > > +    CXL20_MAX_DVSEC
> > > +};
> > > +
> > > +struct dvsec_header {
> > > +    uint32_t cap_hdr;
> > > +    uint32_t dv_hdr1;
> > > +    uint16_t dv_hdr2;
> > > +} __attribute__((__packed__));
> > > +_Static_assert(sizeof(struct dvsec_header) == 10,
> > > +               "dvsec header size incorrect");
> > > +
> > > +/*
> > > + * CXL 2.0 devices must implement certain DVSEC IDs, and can [optionally]
> > > + * implement others.
> > > + *
> > > + * CXL 2.0 Device: 0, [2], 5, 8
> > > + * CXL 2.0 RP: 3, 4, 7, 8
> > > + * CXL 2.0 Upstream Port: [2], 7, 8
> > > + * CXL 2.0 Downstream Port: 3, 4, 7, 8
> > > + */
> > > +
> > > +/* CXL 2.0 - 8.1.5 (ID 0003) */
> > > +struct dvsec_port {  
> > 
> > I'd keep naming consistent.  It's called EXTENSIONS_PORT_DVSEC above
> > so extensions_dvsec_port here.
> >   
> > > +    struct dvsec_header hdr;
> > > +    uint16_t status;
> > > +    uint16_t control;
> > > +    uint8_t alt_bus_base;
> > > +    uint8_t alt_bus_limit;
> > > +    uint16_t alt_memory_base;
> > > +    uint16_t alt_memory_limit;
> > > +    uint16_t alt_prefetch_base;
> > > +    uint16_t alt_prefetch_limit;
> > > +    uint32_t alt_prefetch_base_high;
> > > +    uint32_t alt_prefetch_base_low;
> > > +    uint32_t rcrb_base;
> > > +    uint32_t rcrb_base_high;
> > > +};
> > > +_Static_assert(sizeof(struct dvsec_port) == 0x28, "dvsec port size incorrect");
> > > +#define PORT_CONTROL_OVERRIDE_OFFSET 0xc  
> > I'm not totally sure what this define is, but seems
> > like it's simply the offset of the control field above.
> > If so can't we get it from the there directly?  
> 
> Firstly, I only define these to show how one would handle DVSEC writes. I don't
> actually have a use for them as of now. It is just the offset, but I don't know
> what you mean by getting it from there directly. Could you elaborate a bit?

As you have a packed representation you should be able to do some
address arthmetic to get it.  offsetof(dvsec_port, control) I think....

Thanks,

Jonathan

