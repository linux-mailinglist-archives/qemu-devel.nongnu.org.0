Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 980C21996BF
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 14:44:43 +0200 (CEST)
Received: from localhost ([::1]:37388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJGG2-0007Ki-ES
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 08:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37182)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yi.l.liu@intel.com>) id 1jJGFE-0006vD-8O
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 08:43:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yi.l.liu@intel.com>) id 1jJGFA-0003I4-Ta
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 08:43:51 -0400
Received: from mga02.intel.com ([134.134.136.20]:53146)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yi.l.liu@intel.com>) id 1jJGFA-0003Bu-JO
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 08:43:48 -0400
IronPort-SDR: fURC5Fv99QpfSiiyBFsvDkGi1WscysSfm4gxfo8eyPB2egHnxb5J5BUKcMNea4F3k2jJmEzopM
 83W6GWHFjNcA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2020 05:43:43 -0700
IronPort-SDR: 0pmWaSXKjGEBThp8w/U1ogPxmLxI5Ozlba45MQzhXyuUZvPMXjQGCVk1MEx89mibPhddw6hOIH
 7jJLPEvdVVGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; d="scan'208";a="241903511"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga008.fm.intel.com with ESMTP; 31 Mar 2020 05:43:43 -0700
Received: from fmsmsx111.amr.corp.intel.com (10.18.116.5) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 31 Mar 2020 05:43:43 -0700
Received: from shsmsx107.ccr.corp.intel.com (10.239.4.96) by
 fmsmsx111.amr.corp.intel.com (10.18.116.5) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 31 Mar 2020 05:43:42 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.225]) by
 SHSMSX107.ccr.corp.intel.com ([169.254.9.191]) with mapi id 14.03.0439.000;
 Tue, 31 Mar 2020 20:43:38 +0800
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Auger Eric <eric.auger@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "peterx@redhat.com" <peterx@redhat.com>
Subject: RE: [PATCH v2 04/22] hw/iommu: introduce HostIOMMUContext
Thread-Topic: [PATCH v2 04/22] hw/iommu: introduce HostIOMMUContext
Thread-Index: AQHWBkpipXk9AcbvW0ea4lbMrBMnp6hg3OsAgAEj3XD//83RgIAA1Bkw
Date: Tue, 31 Mar 2020 12:43:38 +0000
Message-ID: <A2975661238FB949B60364EF0F2C25743A21AF91@SHSMSX104.ccr.corp.intel.com>
References: <1585542301-84087-1-git-send-email-yi.l.liu@intel.com>
 <1585542301-84087-5-git-send-email-yi.l.liu@intel.com>
 <aa1bfbd5-e6de-6475-809e-a6ca46089aaa@redhat.com>
 <A2975661238FB949B60364EF0F2C25743A21A3D6@SHSMSX104.ccr.corp.intel.com>
 <34ca7553-089e-b05c-b923-1f2a9bd3eb23@redhat.com>
In-Reply-To: <34ca7553-089e-b05c-b923-1f2a9bd3eb23@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 134.134.136.20
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
Cc: "jean-philippe@linaro.org" <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, Jacob Pan <jacob.jun.pan@linux.intel.com>,
 Yi Sun <yi.y.sun@linux.intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mst@redhat.com" <mst@redhat.com>, "Tian, 
 Jun J" <jun.j.tian@intel.com>, "Sun, Yi Y" <yi.y.sun@intel.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "Wu, Hao" <hao.wu@intel.com>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

> From: Auger Eric <eric.auger@redhat.com>
> Sent: Tuesday, March 31, 2020 3:48 PM
> To: Liu, Yi L <yi.l.liu@intel.com>; qemu-devel@nongnu.org;
> Subject: Re: [PATCH v2 04/22] hw/iommu: introduce HostIOMMUContext
>=20
> Yi,
>=20
> On 3/31/20 6:10 AM, Liu, Yi L wrote:
> > Hi Eric,
> >
> >> From: Auger Eric < eric.auger@redhat.com >
> >> Sent: Tuesday, March 31, 2020 1:23 AM
> >> To: Liu, Yi L <yi.l.liu@intel.com>; qemu-devel@nongnu.org;
> >> Subject: Re: [PATCH v2 04/22] hw/iommu: introduce HostIOMMUContext
> >>
> >> Yi,
> >>
> >> On 3/30/20 6:24 AM, Liu Yi L wrote:
> >>> Currently, many platform vendors provide the capability of dual
> >>> stage DMA address translation in hardware. For example, nested
> >>> translation on Intel VT-d scalable mode, nested stage translation on
> >>> ARM SMMUv3, and etc. In dual stage DMA address translation, there
> >>> are two stages address translation, stage-1 (a.k.a first-level) and
> >>> stage-2 (a.k.a
> >>> second-level) translation structures. Stage-1 translation results
> >>> are also subjected to stage-2 translation structures. Take vSVA
> >>> (Virtual Shared Virtual Addressing) as an example, guest IOMMU
> >>> driver owns
> >>> stage-1 translation structures (covers GVA->GPA translation), and
> >>> host IOMMU driver owns stage-2 translation structures (covers
> >>> GPA->HPA translation). VMM is responsible to bind stage-1
> >>> translation structures to host, thus hardware could achieve GVA->GPA
> >>> and then GPA->HPA translation. For more background on SVA, refer the =
below
> links.
> >>>  - https://www.youtube.com/watch?v=3DKq_nfGK5MwQ
> >>>  - https://events19.lfasiallc.com/wp-content/uploads/2017/11/\
> >>> Shared-Virtual-Memory-in-KVM_Yi-Liu.pdf
> >>>
> >>> In QEMU, vIOMMU emulators expose IOMMUs to VM per their own spec (e.g=
.
> >>> Intel VT-d spec). Devices are pass-through to guest via device pass-
> >>> through components like VFIO. VFIO is a userspace driver framework
> >>> which exposes host IOMMU programming capability to userspace in a
> >>> secure manner. e.g. IOVA MAP/UNMAP requests. Thus the major
> >>> connection between VFIO and vIOMMU are MAP/UNMAP. However, with the
> >>> dual stage DMA translation support, there are more interactions
> >>> between vIOMMU and VFIO as below:
> >>
> >> I think it is key to justify at some point why the IOMMU MR notifiers
> >> are not usable for that purpose. If I remember correctly this is due
> >> to the fact MR notifiers are not active on x86 in that use xase,
> >> which is not the case on ARM dual stage enablement.
> >
> > yes, it's the major reason. Also I listed the former description here.
> > BTW. I don't think notifier is suitable as it is unable to return value=
.
> > right? The pasid alloc in this series actually requires to get the
> > alloc result from vfio. So it's also a reason why notifier is not prope=
r.
> >
> >   "Qemu has an existing notifier framework based on MemoryRegion, which
> >   are used for MAP/UNMAP. However, it is not well suited for virt-SVA.
> >   Reasons are as below:
> >   - virt-SVA works along with PT =3D 1
> >   - if PT =3D 1 IOMMU MR are disabled so MR notifier are not registered
> >   - new notifiers do not fit nicely in this framework as they need to b=
e
> >     registered even if PT =3D 1
> >   - need a new framework to attach the new notifiers
> >   - Additional background can be got from:
> >     https://lists.gnu.org/archive/html/qemu-devel/2017-04/msg04931.html=
"
> >
> > And there is a history on it. I think the earliest idea to introduce a
> > new mechanism instead of using MR notifier for vSVA is from below link.
> > https://lists.gnu.org/archive/html/qemu-devel/2017-04/msg05295.html
> >
> > And then, I have several versions patch series which try to add a
> > notifier framework for vSVA based on IOMMUSVAContext.
> > https://lists.gnu.org/archive/html/qemu-devel/2018-03/msg00078.html
> >
> > After the vSVA notifier framework patchset, then we somehow agreed to
> > use PCIPASIDOps which sits in PCIDevice. This is proposed in below link=
.
> > https://patchwork.kernel.org/cover/11033657/
> > However, it was questioned to provide pasid allocation interface in a
> > per-device manner.
> >   "On Fri, Jul 05, 2019 at 07:01:38PM +0800, Liu Yi L wrote:
> >   > This patch adds vfio implementation PCIPASIDOps.alloc_pasid/free_pa=
sid().
> >   > These two functions are used to propagate guest pasid allocation an=
d
> >   > free requests to host via vfio container ioctl.
> >
> >   As I said in an earlier comment, I think doing this on the device is
> >   conceptually incorrect.  I think we need an explcit notion of an SVM
> >   context (i.e. the namespace in which all the PASIDs live) - which wil=
l
> >   IIUC usually be shared amongst multiple devices.  The create and free
> >   PASID requests should be on that object."
> > https://patchwork.kernel.org/patch/11033659/
> >
> > And the explicit notion of an SVM context from David inspired me to
> > make an explicit way to facilitate the interaction between vfio and
> > vIOMMU. So I came up with the SVMContext direction, and finally
> > renamed it as HostIOMMUContext and place it in VFIOContainer as it is
> > supposed to be per -container.
>=20
> Thank you for summarizing the whole history. To make things clear I do no=
t put into
> question this last approach, I just meant the commit message should justi=
fy why this
> is needed and why the existing IOMMUMRNotifier approach cannot be used.

Ah, it's also a good recall for me. :-)

> >> maybe: "Information, different from map/unmap notifications need to
> >> be passed from QEMU vIOMMU device to/from the host IOMMU driver
> >> through the VFIO/IOMMU layer: ..."
> >
> > I see. I'll adopt your description. thanks.
> >
> >>>  1) PASID allocation (allow host to intercept in PASID allocation)
> >>>  2) bind stage-1 translation structures to host
> >>>  3) propagate stage-1 cache invalidation to host
> >>>  4) DMA address translation fault (I/O page fault) servicing etc.
> >>
> >>>
> >>> With the above new interactions in QEMU, it requires an abstract
> >>> layer to facilitate the above operations and expose to vIOMMU
> >>> emulators as an explicit way for vIOMMU emulators call into VFIO.
> >>> This patch introduces HostIOMMUContext to stand for hardware IOMMU
> >>> w/ dual stage DMA address translation capability. And introduces
> >>> HostIOMMUContextClass to provide methods for vIOMMU emulators to
> >>> propagate dual-stage translation related requests to host. As a
> >>> beginning, PASID allocation/free are defined to propagate PASID
> >>> allocation/free requests to host which is helpful for the vendors
> >>> who manage PASID in system-wide. In future, there will be more operat=
ions
> like bind_stage1_pgtbl, flush_stage1_cache and etc.
> >>>
> >>> Cc: Kevin Tian <kevin.tian@intel.com>
> >>> Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
> >>> Cc: Peter Xu <peterx@redhat.com>
> >>> Cc: Eric Auger <eric.auger@redhat.com>
> >>> Cc: Yi Sun <yi.y.sun@linux.intel.com>
> >>> Cc: David Gibson <david@gibson.dropbear.id.au>
> >>> Cc: Michael S. Tsirkin <mst@redhat.com>
> >>> Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
> >>> ---
> >>>  hw/Makefile.objs                      |  1 +
> >>>  hw/iommu/Makefile.objs                |  1 +
> >>>  hw/iommu/host_iommu_context.c         | 97
> >> +++++++++++++++++++++++++++++++++++
> >>>  include/hw/iommu/host_iommu_context.h | 75
> >>> +++++++++++++++++++++++++++
> >>>  4 files changed, 174 insertions(+)
> >>>  create mode 100644 hw/iommu/Makefile.objs  create mode 100644
> >>> hw/iommu/host_iommu_context.c  create mode 100644
> >>> include/hw/iommu/host_iommu_context.h
> >>>
> >>> diff --git a/hw/Makefile.objs b/hw/Makefile.objs index
> >>> 660e2b4..cab83fe 100644
> >>> --- a/hw/Makefile.objs
> >>> +++ b/hw/Makefile.objs
> >>> @@ -40,6 +40,7 @@ devices-dirs-$(CONFIG_MEM_DEVICE) +=3D mem/
> >>>  devices-dirs-$(CONFIG_NUBUS) +=3D nubus/  devices-dirs-y +=3D
> >>> semihosting/  devices-dirs-y +=3D smbios/
> >>> +devices-dirs-y +=3D iommu/
> >>>  endif
> >>>
> >>>  common-obj-y +=3D $(devices-dirs-y)
> >>> diff --git a/hw/iommu/Makefile.objs b/hw/iommu/Makefile.objs new
> >>> file mode 100644 index 0000000..e6eed4e
> >>> --- /dev/null
> >>> +++ b/hw/iommu/Makefile.objs
> >>> @@ -0,0 +1 @@
> >>> +obj-y +=3D host_iommu_context.o
> >>> diff --git a/hw/iommu/host_iommu_context.c
> >> b/hw/iommu/host_iommu_context.c
> >>> new file mode 100644
> >>> index 0000000..5fb2223
> >>> --- /dev/null
> >>> +++ b/hw/iommu/host_iommu_context.c
> >>> @@ -0,0 +1,97 @@
> >>> +/*
> >>> + * QEMU abstract of Host IOMMU
> >>> + *
> >>> + * Copyright (C) 2020 Intel Corporation.
> >>> + *
> >>> + * Authors: Liu Yi L <yi.l.liu@intel.com>
> >>> + *
> >>> + * This program is free software; you can redistribute it and/or
> >>> +modify
> >>> + * it under the terms of the GNU General Public License as
> >>> +published by
> >>> + * the Free Software Foundation; either version 2 of the License,
> >>> +or
> >>> + * (at your option) any later version.
> >>> +
> >>> + * This program is distributed in the hope that it will be useful,
> >>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >>> + * GNU General Public License for more details.
> >>> +
> >>> + * You should have received a copy of the GNU General Public
> >>> + License along
> >>> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> >>> + */
> >>> +
> >>> +#include "qemu/osdep.h"
> >>> +#include "qapi/error.h"
> >>> +#include "qom/object.h"
> >>> +#include "qapi/visitor.h"
> >>> +#include "hw/iommu/host_iommu_context.h"
> >>> +
> >>> +int host_iommu_ctx_pasid_alloc(HostIOMMUContext *iommu_ctx, uint32_t
> min,
> >>> +                               uint32_t max, uint32_t *pasid) {
> >>> +    HostIOMMUContextClass *hicxc;
> >>> +
> >>> +    if (!iommu_ctx) {
> >>> +        return -EINVAL;
> >>> +    }
> >>> +
> >>> +    hicxc =3D HOST_IOMMU_CONTEXT_GET_CLASS(iommu_ctx);
> >>> +
> >>> +    if (!hicxc) {
> >>> +        return -EINVAL;
> >>> +    }
> >>> +
> >>> +    if (!(iommu_ctx->flags & HOST_IOMMU_PASID_REQUEST) ||
> >>> +        !hicxc->pasid_alloc) {
> >> At this point of the reading, I fail to understand why we need the fla=
g.
> >> Why isn't it sufficient to test whether the ops is set?
> >
> > I added it in case of the architecture which has no requirement for
> > pasid alloc/free and only needs the other callbacks in the class. I'm
> > not sure if I'm correct, it looks to be unnecessary for vSMMU. right?
> vSMMU does not require it at the moment. But in that case, it shall not p=
rovide any
> implementation for it and that should be sufficient, shouldn't it?

Emm, but the hook is implemented by vfio. Forget it. I provided a bad
argument.

I'd better say it works when there is backend which doesn't
want to provide pasid alloc/free. Also, the flags can be used
by vIOMMU to enumerate host side's capability (e.g. pasid
alloc/free, pasid bind, cache_inv, and pasid_table_bind). I
guess my series has not made use of it in vIOMMU, but I
do have such plan.

> >
> >>> +        return -EINVAL;
> >>> +    }
> >>> +
> >>> +    return hicxc->pasid_alloc(iommu_ctx, min, max, pasid); }
> >>> +
> >>> +int host_iommu_ctx_pasid_free(HostIOMMUContext *iommu_ctx, uint32_t
> >> pasid)
> >>> +{
> >>> +    HostIOMMUContextClass *hicxc;
> >>> +
> >>> +    if (!iommu_ctx) {
> >>> +        return -EINVAL;
> >>> +    }
> >>> +
> >>> +    hicxc =3D HOST_IOMMU_CONTEXT_GET_CLASS(iommu_ctx);
> >>> +    if (!hicxc) {
> >>> +        return -EINVAL;
> >>> +    }
> >>> +
> >>> +    if (!(iommu_ctx->flags & HOST_IOMMU_PASID_REQUEST) ||
> >>> +        !hicxc->pasid_free) {
> >>> +        return -EINVAL;
> >>> +    }
> >>> +
> >>> +    return hicxc->pasid_free(iommu_ctx, pasid); }
> >>> +
> >>> +void host_iommu_ctx_init(void *_iommu_ctx, size_t instance_size,
> >>> +                         const char *mrtypename,
> >>> +                         uint64_t flags) {
> >>> +    HostIOMMUContext *iommu_ctx;
> >>> +
> >>> +    object_initialize(_iommu_ctx, instance_size, mrtypename);
> >>> +    iommu_ctx =3D HOST_IOMMU_CONTEXT(_iommu_ctx);
> >>> +    iommu_ctx->flags =3D flags;
> >>> +    iommu_ctx->initialized =3D true;
> >>> +}
> >>> +
> >>> +static const TypeInfo host_iommu_context_info =3D {
> >>> +    .parent             =3D TYPE_OBJECT,
> >>> +    .name               =3D TYPE_HOST_IOMMU_CONTEXT,
> >>> +    .class_size         =3D sizeof(HostIOMMUContextClass),
> >>> +    .instance_size      =3D sizeof(HostIOMMUContext),
> >>> +    .abstract           =3D true,
> >> Can't we use the usual .instance_init and .instance_finalize?
> >>> +};
> >>> +
> >>> +static void host_iommu_ctx_register_types(void)
> >>> +{
> >>> +    type_register_static(&host_iommu_context_info);
> >>> +}
> >>> +
> >>> +type_init(host_iommu_ctx_register_types)
> >>> diff --git a/include/hw/iommu/host_iommu_context.h
> >> b/include/hw/iommu/host_iommu_context.h
> >>> new file mode 100644
> >>> index 0000000..35c4861
> >>> --- /dev/null
> >>> +++ b/include/hw/iommu/host_iommu_context.h
> >>> @@ -0,0 +1,75 @@
> >>> +/*
> >>> + * QEMU abstraction of Host IOMMU
> >>> + *
> >>> + * Copyright (C) 2020 Intel Corporation.
> >>> + *
> >>> + * Authors: Liu Yi L <yi.l.liu@intel.com>
> >>> + *
> >>> + * This program is free software; you can redistribute it and/or
> >>> +modify
> >>> + * it under the terms of the GNU General Public License as
> >>> +published by
> >>> + * the Free Software Foundation; either version 2 of the License,
> >>> +or
> >>> + * (at your option) any later version.
> >>> +
> >>> + * This program is distributed in the hope that it will be useful,
> >>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >>> + * GNU General Public License for more details.
> >>> +
> >>> + * You should have received a copy of the GNU General Public
> >>> + License along
> >>> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> >>> + */
> >>> +
> >>> +#ifndef HW_IOMMU_CONTEXT_H
> >>> +#define HW_IOMMU_CONTEXT_H
> >>> +
> >>> +#include "qemu/queue.h"
> >>> +#include "qemu/thread.h"
> >>> +#include "qom/object.h"
> >>> +#include <linux/iommu.h>
> >>> +#ifndef CONFIG_USER_ONLY
> >>> +#include "exec/hwaddr.h"
> >>> +#endif
> >>> +
> >>> +#define TYPE_HOST_IOMMU_CONTEXT "qemu:host-iommu-context"
> >>> +#define HOST_IOMMU_CONTEXT(obj) \
> >>> +        OBJECT_CHECK(HostIOMMUContext, (obj),
> >>> +TYPE_HOST_IOMMU_CONTEXT) #define
> HOST_IOMMU_CONTEXT_GET_CLASS(obj) \
> >>> +        OBJECT_GET_CLASS(HostIOMMUContextClass, (obj), \
> >>> +                         TYPE_HOST_IOMMU_CONTEXT)
> >>> +
> >>> +typedef struct HostIOMMUContext HostIOMMUContext;
> >>> +
> >>> +typedef struct HostIOMMUContextClass {
> >>> +    /* private */
> >>> +    ObjectClass parent_class;
> >>> +
> >>> +    /* Allocate pasid from HostIOMMUContext (a.k.a. host software)
> >>> + */
> >> Request the host to allocate a PASID?
> >> "from HostIOMMUContext (a.k.a. host software)" is a bit cryptic to me.
> >
> > oh, I mean to request pasid allocation from host.. sorry for the confus=
ion.
> >
> >> Actually at this stage I do not understand what this HostIOMMUContext
> >> abstracts. Is it an object associated to one guest FL context entry
> >> (attached to one PASID). Meaning for just vIOMMU/VFIO using nested
> >> paging (single PASID) I would use a single of such context per IOMMU M=
R?
> >
> > No, it's not for a single guest FL context. It's for the abstraction
> > of the capability provided by a nested-translation capable host backend=
.
> > In vfio, it's VFIO_IOMMU_TYPE1_NESTING.
> >
> > Here is the notion behind introducing the HostIOMMUContext. Existing
> > vfio is a secure framework which provides userspace the capability to
> > program mappings into a single isolation domain in host side. Compared
> > with the legacy host IOMMU, nested-translation capable IOMMU provides
> > more. It gives the user-space with the capability to program a
> > FL/Stage
> > -1 page table to host side. This is also called as bind_gpasid in this
> > series. VFIO exposes nesting capability to userspace with the
> > VFIO_IOMMU_TYPE1_NESTING type. And along with the type, the pasid
> > alloc/ free and iommu_cache_inv are exposed as the capabilities
> > provided by VFIO_IOMMU_TYPE1_NESTING.
>=20
> OK so let me try to rephrase:
>=20
> "the HostIOMMUContext is an object which allows to manage the stage-1
> translation when a vIOMMU is implemented upon physical IOMMU nested pagin=
g
> (VFIO case).
>=20
> It is an abstract object which needs to be derived for each vIOMMU
> immplementation based on physical nested paging.
>=20
> An HostIOMMUContext derived object will be passed to each VFIO device pro=
tected
> by a vIOMMU using physical nested paging.
> "
>=20
> Is that correct?

you're better writer than me. yes, I think so.

>  Also, if we want, actually we could migrate
> > the MAP/UNMAP notifier to be hooks in HostIOMMUContext. Then we can
> > have an unified abstraction for the capabilities provided by host.
> So then it becomes contradictory to what we said before because MAP/UNMAP=
 are
> used with single stage HW implementation.

If we want to migrate the MAP/UNMAP to host context. Then, the object
description should be updated as below. I don't think we'll do it so
far. So just keep the above description for nesting case.

"the HostIOMMUContext is an object which allows to manage the stage-1
translation when a vIOMMU is implemented upon physical IOMMU nested paging
or program single stage page mapping to host (VFIO case).

It is an abstract object which needs to be derived for each vIOMMU
implementation based on physical iommu paging.

An HostIOMMUContext derived object will be passed to each VFIO device prote=
cted
by a vIOMMU using physical iommu paging."

Regards,
Yi Liu


