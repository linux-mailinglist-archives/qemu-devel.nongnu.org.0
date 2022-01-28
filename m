Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7705049FC31
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 15:54:33 +0100 (CET)
Received: from localhost ([::1]:60546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDSdy-0003xF-Vj
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 09:54:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nDSX2-0006v4-VF
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 09:47:26 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nDSWJ-0007kL-QO
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 09:46:39 -0500
Received: from fraeml744-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JlgHx4v9Zz67Xkw;
 Fri, 28 Jan 2022 22:46:05 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml744-chm.china.huawei.com (10.206.15.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 28 Jan 2022 15:46:32 +0100
Received: from localhost (10.47.76.156) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Fri, 28 Jan
 2022 14:46:31 +0000
Date: Fri, 28 Jan 2022 14:46:22 +0000
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
CC: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, <linuxarm@huawei.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: Re: [PATCH v4 02/42] hw/cxl/component: Introduce CXL components
 (8.1.x, 8.2.5)
Message-ID: <20220128144622.00004b7f@Huawei.com>
In-Reply-To: <20220128142251.0000437f@Huawei.com>
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-3-Jonathan.Cameron@huawei.com>
 <87bkzyd3c7.fsf@linaro.org> <20220128142251.0000437f@Huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.47.76.156]
X-ClientProxiedBy: lhreml731-chm.china.huawei.com (10.201.108.82) To
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

On Fri, 28 Jan 2022 14:22:51 +0000
Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:

> On Wed, 26 Jan 2022 12:32:01 +0000
> Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>=20
> > Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:
> >  =20
> > > From: Ben Widawsky <ben.widawsky@intel.com>
> > >
> > > A CXL 2.0 component is any entity in the CXL topology. All components
> > > have a analogous function in PCIe. Except for the CXL host bridge, all
> > > have a PCIe config space that is accessible via the common PCIe
> > > mechanisms. CXL components are enumerated via DVSEC fields in the
> > > extended PCIe header space. CXL components will minimally implement s=
ome
> > > subset of CXL.mem and CXL.cache registers defined in 8.2.5 of the CXL
> > > 2.0 specification. Two headers and a utility library are introduced to
> > > support the minimum functionality needed to enumerate components.
> > >
> > > The cxl_pci header manages bits associated with PCI, specifically the
> > > DVSEC and related fields. The cxl_component.h variant has data
> > > structures and APIs that are useful for drivers implementing any of t=
he
> > > CXL 2.0 components. The library takes care of making use of the DVSEC
> > > bits and the CXL.[mem|cache] registers. Per spec, the registers are
> > > little endian.
> > >
> > > None of the mechanisms required to enumerate a CXL capable hostbridge
> > > are introduced at this point.
> > >
> > > Note that the CXL.mem and CXL.cache registers used are always 4B wide.
> > > It's possible in the future that this constraint will not hold.
> > >
> > > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> > > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > ---
> > >  hw/Kconfig                     |   1 +
> > >  hw/cxl/Kconfig                 |   3 +
> > >  hw/cxl/cxl-component-utils.c   | 212 +++++++++++++++++++++++++++++++=
++
> > >  hw/cxl/meson.build             |   3 +
> > >  hw/meson.build                 |   1 +
> > >  include/hw/cxl/cxl.h           |  16 +++
> > >  include/hw/cxl/cxl_component.h | 196 ++++++++++++++++++++++++++++++
> > >  include/hw/cxl/cxl_pci.h       | 138 +++++++++++++++++++++
> > >  8 files changed, 570 insertions(+)
> > >
> > > diff --git a/hw/Kconfig b/hw/Kconfig
> > > index ad20cce0a9..50e0952889 100644
> > > --- a/hw/Kconfig
> > > +++ b/hw/Kconfig
> > > @@ -6,6 +6,7 @@ source audio/Kconfig
> > >  source block/Kconfig
> > >  source char/Kconfig
> > >  source core/Kconfig
> > > +source cxl/Kconfig
> > >  source display/Kconfig
> > >  source dma/Kconfig
> > >  source gpio/Kconfig
> > > diff --git a/hw/cxl/Kconfig b/hw/cxl/Kconfig
> > > new file mode 100644
> > > index 0000000000..8e67519b16
> > > --- /dev/null
> > > +++ b/hw/cxl/Kconfig
> > > @@ -0,0 +1,3 @@
> > > +config CXL
> > > +    bool
> > > +    default y if PCI_EXPRESS
> > > diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-util=
s.c
> > > new file mode 100644
> > > index 0000000000..5007b29ebb
> > > --- /dev/null
> > > +++ b/hw/cxl/cxl-component-utils.c
> > > @@ -0,0 +1,212 @@
> > > +/*
> > > + * CXL Utility library for components
> > > + *
> > > + * Copyright(C) 2020 Intel Corporation.
> > > + *
> > > + * This work is licensed under the terms of the GNU GPL, version 2. =
See the
> > > + * COPYING file in the top-level directory.
> > > + */
> > > +
> > > +#include "qemu/osdep.h"
> > > +#include "qemu/log.h"
> > > +#include "hw/pci/pci.h"
> > > +#include "hw/cxl/cxl.h"
> > > +
> > > +static uint64_t cxl_cache_mem_read_reg(void *opaque, hwaddr offset,
> > > +                                       unsigned size)
> > > +{
> > > +    CXLComponentState *cxl_cstate =3D opaque;
> > > +    ComponentRegisters *cregs =3D &cxl_cstate->crb;
> > > +
> > > +    assert(size =3D=3D 4);   =20
> >=20
> > You assert here but bellow:
> >  =20
> > > +
> > > +/*
> > > + * 8.2.3
> > > + *   The access restrictions specified in Section 8.2.2 also apply t=
o CXL 2.0
> > > + *   Component Registers.
> > > + *
> > > + * 8.2.2
> > > + *   =E2=80=A2 A 32 bit register shall be accessed as a 4 Bytes quan=
tity. Partial
> > > + *   reads are not permitted.
> > > + *   =E2=80=A2 A 64 bit register shall be accessed as a 8 Bytes quan=
tity. Partial
> > > + *   reads are not permitted.
> > > + *
> > > + * As of the spec defined today, only 4 byte registers exist.
> > > + */
> > > +static const MemoryRegionOps cache_mem_ops =3D {
> > > +    .read =3D cxl_cache_mem_read_reg,
> > > +    .write =3D cxl_cache_mem_write_reg,
> > > +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> > > +    .valid =3D {
> > > +        .min_access_size =3D 4,
> > > +        .max_access_size =3D 8,
> > > +        .unaligned =3D false,
> > > +    },
> > > +    .impl =3D {
> > > +        .min_access_size =3D 4,
> > > +        .max_access_size =3D 4,
> > > +    },
> > > +};   =20
> >=20
> > You have constrained the access to 4 so you will only see 4 bytes
> > accesses. If it is valid for the guest to access 64bit words then it
> > would be better to no-op that case and maybe LOG_UNIMP the fact.
> >  =20
>=20
> Ugh. This looks suspiciously like a work around for a kernel bug (possibly
> an accidental one).
>=20
> If the comment above is correct (I've checked the spec and agree with it)=
..
>=20
> https://elixir.bootlin.com/linux/v5.17-rc1/source/drivers/cxl/core/regs.c=
#L48
>=20
> cap_array =3D readq(base + CXL_CM_CAP_HDR_OFFSET);
>=20
> is undefined behavior as CAP_HDR is a 32bit register.
>=20
> I guess the undefined choice on all the hardware people actually have
> is to service the 8 byte read, but there is no reason to believe future
> hardware will.
>=20
> ... and this is why we like having emulation in Qemu :)
> + eagle eyed reviewers!
>=20
> Guess I'd better send a kernel fix sometime soon.

However, after another read of the spec there are link related registers
which we currently don't implement emulation for but do advertise as
being present (as they are required) are 8 bytes long.

Linux doesn't use them yet, but it may come so I'll need to leave
max_access_size =3D 8 enabled and as you suggested LOG_UNIMP.

Probably makes sense to implement the link registers in a follow up
patch set along with (possibly) some kernel support to expose
the information available in those registers.

Jonathan

>=20
> Jonathan
>=20
> > Otherwise the rest looks ok to me:
> >=20
> > Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >  =20
>=20


