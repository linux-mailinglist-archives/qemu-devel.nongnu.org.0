Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2234B513127
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 12:18:11 +0200 (CEST)
Received: from localhost ([::1]:51506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk1Du-0006uJ-6f
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 06:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nk0kR-0003CE-GR
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:47:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nk0kP-0008Jy-Lj
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:47:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651139261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+MdgyjxUgVx1HWNOX+1LC4H0NFNVts062eNbGeTLUxw=;
 b=Bv1Tb2QI98O1hlcsaOZ+ubvl2c9o4WTbbaib/X9M2PHKuqRo5AD1zLsFvXKBNiOi1jfT8n
 KBO8gJqYqZqzM4ofS5AYV2k/8dk5GeecCF7BkptYWeYmcar7Uhv2vXIP9/bFkvMYFz/ity
 +hViaNZGOeJWkJ5oqh53ekiW/+cd3uM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-lIalBS9_OAOM6biDc-Vs2w-1; Thu, 28 Apr 2022 05:47:39 -0400
X-MC-Unique: lIalBS9_OAOM6biDc-Vs2w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C5D7802803;
 Thu, 28 Apr 2022 09:47:34 +0000 (UTC)
Received: from localhost (unknown [10.39.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9955040E80E3;
 Thu, 28 Apr 2022 09:47:33 +0000 (UTC)
Date: Thu, 28 Apr 2022 10:47:32 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v8 12/17] vfio-user: IOMMU support for remote device
Message-ID: <YmpitM+WKiOIbeDc@stefanha-x1.localdomain>
References: <cover.1650379269.git.jag.raman@oracle.com>
 <2a42664b61cef7cdd44688679b60a8c6c397b075.1650379269.git.jag.raman@oracle.com>
 <9D4970CA-122E-4F1C-8598-D841A4A7E78D@oracle.com>
 <YmZsMnoJ6ZZkEP5g@stefanha-x1.localdomain>
 <4A2BD588-33D6-41B2-88E4-22C7766CCD8B@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pArfGmsyV6SZdKow"
Content-Disposition: inline
In-Reply-To: <4A2BD588-33D6-41B2-88E4-22C7766CCD8B@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Thomas Huth <thuth@redhat.com>,
 John Johnson <john.g.johnson@oracle.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, John Levon <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--pArfGmsyV6SZdKow
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2022 at 05:30:19PM +0000, Jag Raman wrote:
>=20
>=20
> > On Apr 25, 2022, at 5:38 AM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> >=20
> > On Wed, Apr 20, 2022 at 11:15:16AM +0000, Jag Raman wrote:
> >>=20
> >>=20
> >>> On Apr 19, 2022, at 4:45 PM, Jag Raman <jag.raman@oracle.com> wrote:
> >>>=20
> >>> Assign separate address space for each device in the remote processes.
> >>>=20
> >>> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> >>> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> >>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> >>> ---
> >>> include/hw/remote/iommu.h |  40 +++++++++++++
> >>> hw/remote/iommu.c         | 114 ++++++++++++++++++++++++++++++++++++++
> >>> hw/remote/machine.c       |  13 ++++-
> >>> MAINTAINERS               |   2 +
> >>> hw/remote/meson.build     |   1 +
> >>> 5 files changed, 169 insertions(+), 1 deletion(-)
> >>> create mode 100644 include/hw/remote/iommu.h
> >>> create mode 100644 hw/remote/iommu.c
> >>>=20
> >>> diff --git a/include/hw/remote/iommu.h b/include/hw/remote/iommu.h
> >>> new file mode 100644
> >>> index 0000000000..33b68a8f4b
> >>> --- /dev/null
> >>> +++ b/include/hw/remote/iommu.h
> >>> @@ -0,0 +1,40 @@
> >>> +/**
> >>> + * Copyright =C2=A9 2022 Oracle and/or its affiliates.
> >>> + *
> >>> + * This work is licensed under the terms of the GNU GPL, version 2 o=
r later.
> >>> + * See the COPYING file in the top-level directory.
> >>> + *
> >>> + */
> >>> +
> >>> +#ifndef REMOTE_IOMMU_H
> >>> +#define REMOTE_IOMMU_H
> >>> +
> >>> +#include "hw/pci/pci_bus.h"
> >>> +#include "hw/pci/pci.h"
> >>> +
> >>> +#ifndef INT2VOIDP
> >>> +#define INT2VOIDP(i) (void *)(uintptr_t)(i)
> >>> +#endif
> >>> +
> >>> +typedef struct RemoteIommuElem {
> >>> +    MemoryRegion *mr;
> >>> +
> >>> +    AddressSpace as;
> >>> +} RemoteIommuElem;
> >>> +
> >>> +#define TYPE_REMOTE_IOMMU "x-remote-iommu"
> >>> +OBJECT_DECLARE_SIMPLE_TYPE(RemoteIommu, REMOTE_IOMMU)
> >>> +
> >>> +struct RemoteIommu {
> >>> +    Object parent;
> >>> +
> >>> +    GHashTable *elem_by_devfn;
> >>> +
> >>> +    QemuMutex lock;
> >>> +};
> >>> +
> >>> +void remote_iommu_setup(PCIBus *pci_bus);
> >>> +
> >>> +void remote_iommu_unplug_dev(PCIDevice *pci_dev);
> >>> +
> >>> +#endif
> >>> diff --git a/hw/remote/iommu.c b/hw/remote/iommu.c
> >>> new file mode 100644
> >>> index 0000000000..16c6b0834e
> >>> --- /dev/null
> >>> +++ b/hw/remote/iommu.c
> >>> @@ -0,0 +1,114 @@
> >>> +/**
> >>> + * IOMMU for remote device
> >>> + *
> >>> + * Copyright =C2=A9 2022 Oracle and/or its affiliates.
> >>> + *
> >>> + * This work is licensed under the terms of the GNU GPL, version 2 o=
r later.
> >>> + * See the COPYING file in the top-level directory.
> >>> + *
> >>> + */
> >>> +
> >>> +#include "qemu/osdep.h"
> >>> +#include "qemu-common.h"
> >>> +
> >>> +#include "hw/remote/iommu.h"
> >>> +#include "hw/pci/pci_bus.h"
> >>> +#include "hw/pci/pci.h"
> >>> +#include "exec/memory.h"
> >>> +#include "exec/address-spaces.h"
> >>> +#include "trace.h"
> >>> +
> >>> +static AddressSpace *remote_iommu_find_add_as(PCIBus *pci_bus,
> >>> +                                              void *opaque, int devf=
n)
> >>> +{
> >>> +    RemoteIommu *iommu =3D opaque;
> >>> +    RemoteIommuElem *elem =3D NULL;
> >>> +
> >>> +    qemu_mutex_lock(&iommu->lock);
> >>> +
> >>> +    elem =3D g_hash_table_lookup(iommu->elem_by_devfn, INT2VOIDP(dev=
fn));
> >>> +
> >>> +    if (!elem) {
> >>> +        elem =3D g_malloc0(sizeof(RemoteIommuElem));
> >>> +        g_hash_table_insert(iommu->elem_by_devfn, INT2VOIDP(devfn), =
elem);
> >>> +    }
> >>> +
> >>> +    if (!elem->mr) {
> >>> +        elem->mr =3D MEMORY_REGION(object_new(TYPE_MEMORY_REGION));
> >>> +        memory_region_set_size(elem->mr, UINT64_MAX);
> >>> +        address_space_init(&elem->as, elem->mr, NULL);
> >>=20
> >> Hi,
> >>=20
> >> I=E2=80=99d like to add a note here.
> >>=20
> >> We tried to add "elem->mr=E2=80=9D as a child of PCIDevice. That way, =
when PCIDevice is
> >> unplugged, the child is also finalized.
> >=20
> > Do you mean via a memory_region_init()-family function where a parent
> > object is given? Or do you mean by adding a QOM child property?
>=20
> I mean by adding =E2=80=9Celem->mr=E2=80=9D as a QOM child property of PC=
IDevice.
>=20
> >=20
> >> However, there was some issue with hotplug. During the hotplug, there=
=E2=80=99s a window
> >> during initialization where we couldn=E2=80=99t lookup the PCIDevice b=
y =E2=80=9Cdevfn=E2=80=9D.
> >>=20
> >> do_pci_register_device() -> pci_init_bus_master() -> pci_device_iommu_=
address_space()
> >> happens before do_pci_register_device() -> =E2=80=9Cbus->devices[devfn=
] =3D pci_dev=E2=80=9D. As such,
> >> pci_find_device() doesn=E2=80=99t work at this time.
> >=20
> > I don't follow. What calls pci_find_device()?
>=20
> To add the MemoryRegion as a child of PCIDevice, remote_iommu_find_add_as=
()
> would need to lookup the PCIDevice using devfn. The function that looks up
> PCIDevice by devfn is pci_find_device().
>=20
> The above note explains why we didn=E2=80=99t lookup the PCIDevice using =
pci_find_device()
> and then adding the MemoryRegion as its child.

If I understand correctly you're saying it's not possible to use
memory_region_init(&elem->mr, OBJECT(pci_dev), ...) inside
remote_iommu_find_add_as() because there is no way to find the
PCIDevice?

It would be nice to automatically clean up the memory region but the
AddressSpace needs to be destroyed too and there isn't an automatic way
of doing that, so the approach in this patch is fine.

Stefan

--pArfGmsyV6SZdKow
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJqYrQACgkQnKSrs4Gr
c8hAYQf/dBvY18Jz2xhNH02/VjL2dq8BnemjrqrUIgWkwTLc5b7WaPKvvKtZRmwB
AZitVh5zAa10tuQO6iXpZSbXRLsGdVJ/66hFALSlw4SMz9oLfN3ecWblWbjX6rme
gMDZAsWx8XtpZkNAtth0eVD3xCHcIBhybA7OvoLLOukuvbY6e87E/pU+HCeesZ+m
aZSQrsLbG75AmCv0QLE2J4/Ks8oClBdD7h+GC99WkeX90Ojqov/Gg3o9dUd9jo/S
3H0itLN8DW1D4s18IX8RH8S0Ub224uC/ZGm76mib5M7Xqa9qPzYLEETRLRA33Z/w
/P3ryHFBowZdULYdQfoOeu396vdeaA==
=yfD7
-----END PGP SIGNATURE-----

--pArfGmsyV6SZdKow--


