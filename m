Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EED4A6DD8
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 10:33:29 +0100 (CET)
Received: from localhost ([::1]:58266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFC11-0007QZ-Iu
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 04:33:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nFBqx-0004VV-Ij
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 04:23:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nFBqo-0005fo-B2
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 04:23:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643793773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hMgvPoUiNdLw8qZOaS66ohgCOaiDxw8jPXW4CwiWehE=;
 b=aGIELEWvjgflHajyVngfGCSPHcLyOUqOT3nLo6QtKqJf+aEhUKGHpY//9djzZ0VzgqwGpc
 pD9EYG7XADrqVGdSphQtymqNE1cTxqbly6bnXo6g7XNlXXoMEftVEu8QaqC1JGhQ75kaga
 coUcV8i8nzNms3LsQnUw+i4XQu+b7Qo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-MkTg9-CDOx6kfCSfwLc9jw-1; Wed, 02 Feb 2022 04:22:50 -0500
X-MC-Unique: MkTg9-CDOx6kfCSfwLc9jw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C7F081424F;
 Wed,  2 Feb 2022 09:22:48 +0000 (UTC)
Received: from localhost (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D9687B6E8;
 Wed,  2 Feb 2022 09:22:22 +0000 (UTC)
Date: Wed, 2 Feb 2022 09:22:21 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Message-ID: <YfpNTfyQ3Y/Q7Tf4@stefanha-x1.localdomain>
References: <YfJYFbBVQzho7mGp@stefanha-x1.localdomain>
 <20220127142253.21ab0025.alex.williamson@redhat.com>
 <YfO00O4sT2UgaW31@stefanha-x1.localdomain>
 <20220131091623.6739464e.alex.williamson@redhat.com>
 <Yfj9u26F6/RdlhoB@stefanha-x1.localdomain>
 <20220201082437.7dd940eb.alex.williamson@redhat.com>
 <9BD98DD7-CC28-49E1-8150-BDECF0324FFA@oracle.com>
 <20220201154736.576e2a7e.alex.williamson@redhat.com>
 <BA348811-5C6D-4F9F-AC3C-824AC1681F1D@oracle.com>
 <20220201223432.4f58518f.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wI21tKL6ukhTRmRP"
Content-Disposition: inline
In-Reply-To: <20220201223432.4f58518f.alex.williamson@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Jag Raman <jag.raman@oracle.com>,
 Beraldo Leal <bleal@redhat.com>, John Johnson <john.g.johnson@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--wI21tKL6ukhTRmRP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 01, 2022 at 10:34:32PM -0700, Alex Williamson wrote:
> On Wed, 2 Feb 2022 01:13:22 +0000
> Jag Raman <jag.raman@oracle.com> wrote:
>=20
> > > On Feb 1, 2022, at 5:47 PM, Alex Williamson <alex.williamson@redhat.c=
om> wrote:
> > >=20
> > > On Tue, 1 Feb 2022 21:24:08 +0000
> > > Jag Raman <jag.raman@oracle.com> wrote:
> > >  =20
> > >>> On Feb 1, 2022, at 10:24 AM, Alex Williamson <alex.williamson@redha=
t.com> wrote:
> > >>>=20
> > >>> On Tue, 1 Feb 2022 09:30:35 +0000
> > >>> Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > >>>  =20
> > >>>> On Mon, Jan 31, 2022 at 09:16:23AM -0700, Alex Williamson wrote:  =
 =20
> > >>>>> On Fri, 28 Jan 2022 09:18:08 +0000
> > >>>>> Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > >>>>>  =20
> > >>>>>> On Thu, Jan 27, 2022 at 02:22:53PM -0700, Alex Williamson wrote:=
     =20
> > >>>>>>> If the goal here is to restrict DMA between devices, ie. peer-t=
o-peer
> > >>>>>>> (p2p), why are we trying to re-invent what an IOMMU already doe=
s?       =20
> > >>>>>>=20
> > >>>>>> The issue Dave raised is that vfio-user servers run in separate
> > >>>>>> processses from QEMU with shared memory access to RAM but no dir=
ect
> > >>>>>> access to non-RAM MemoryRegions. The virtiofs DAX Window BAR is =
one
> > >>>>>> example of a non-RAM MemoryRegion that can be the source/target =
of DMA
> > >>>>>> requests.
> > >>>>>>=20
> > >>>>>> I don't think IOMMUs solve this problem but luckily the vfio-user
> > >>>>>> protocol already has messages that vfio-user servers can use as a
> > >>>>>> fallback when DMA cannot be completed through the shared memory =
RAM
> > >>>>>> accesses.
> > >>>>>>  =20
> > >>>>>>> In
> > >>>>>>> fact, it seems like an IOMMU does this better in providing an I=
OVA
> > >>>>>>> address space per BDF.  Is the dynamic mapping overhead too muc=
h?  What
> > >>>>>>> physical hardware properties or specifications could we leverag=
e to
> > >>>>>>> restrict p2p mappings to a device?  Should it be governed by ma=
chine
> > >>>>>>> type to provide consistency between devices?  Should each "isol=
ated"
> > >>>>>>> bus be in a separate root complex?  Thanks,       =20
> > >>>>>>=20
> > >>>>>> There is a separate issue in this patch series regarding isolati=
ng the
> > >>>>>> address space where BAR accesses are made (i.e. the global
> > >>>>>> address_space_memory/io). When one process hosts multiple vfio-u=
ser
> > >>>>>> server instances (e.g. a software-defined network switch with mu=
ltiple
> > >>>>>> ethernet devices) then each instance needs isolated memory and i=
o address
> > >>>>>> spaces so that vfio-user clients don't cause collisions when the=
y map
> > >>>>>> BARs to the same address.
> > >>>>>>=20
> > >>>>>> I think the the separate root complex idea is a good solution. T=
his
> > >>>>>> patch series takes a different approach by adding the concept of
> > >>>>>> isolated address spaces into hw/pci/.     =20
> > >>>>>=20
> > >>>>> This all still seems pretty sketchy, BARs cannot overlap within t=
he
> > >>>>> same vCPU address space, perhaps with the exception of when they'=
re
> > >>>>> being sized, but DMA should be disabled during sizing.
> > >>>>>=20
> > >>>>> Devices within the same VM context with identical BARs would need=
 to
> > >>>>> operate in different address spaces.  For example a translation o=
ffset
> > >>>>> in the vCPU address space would allow unique addressing to the de=
vices,
> > >>>>> perhaps using the translation offset bits to address a root compl=
ex and
> > >>>>> masking those bits for downstream transactions.
> > >>>>>=20
> > >>>>> In general, the device simply operates in an address space, ie. an
> > >>>>> IOVA.  When a mapping is made within that address space, we perfo=
rm a
> > >>>>> translation as necessary to generate a guest physical address.  T=
he
> > >>>>> IOVA itself is only meaningful within the context of the address =
space,
> > >>>>> there is no requirement or expectation for it to be globally uniq=
ue.
> > >>>>>=20
> > >>>>> If the vfio-user server is making some sort of requirement that I=
OVAs
> > >>>>> are unique across all devices, that seems very, very wrong.  Than=
ks,     =20
> > >>>>=20
> > >>>> Yes, BARs and IOVAs don't need to be unique across all devices.
> > >>>>=20
> > >>>> The issue is that there can be as many guest physical address spac=
es as
> > >>>> there are vfio-user clients connected, so per-client isolated addr=
ess
> > >>>> spaces are required. This patch series has a solution to that prob=
lem
> > >>>> with the new pci_isol_as_mem/io() API.   =20
> > >>>=20
> > >>> Sorry, this still doesn't follow for me.  A server that hosts multi=
ple
> > >>> devices across many VMs (I'm not sure if you're referring to the de=
vice
> > >>> or the VM as a client) needs to deal with different address spaces =
per
> > >>> device.  The server needs to be able to uniquely identify every DMA,
> > >>> which must be part of the interface protocol.  But I don't see how =
that
> > >>> imposes a requirement of an isolated address space.  If we want the
> > >>> device isolated because we don't trust the server, that's where an =
IOMMU
> > >>> provides per device isolation.  What is the restriction of the
> > >>> per-client isolated address space and why do we need it?  The server
> > >>> needing to support multiple clients is not a sufficient answer to
> > >>> impose new PCI bus types with an implicit restriction on the VM.   =
=20
> > >>=20
> > >> Hi Alex,
> > >>=20
> > >> I believe there are two separate problems with running PCI devices in
> > >> the vfio-user server. The first one is concerning memory isolation a=
nd
> > >> second one is vectoring of BAR accesses (as explained below).
> > >>=20
> > >> In our previous patches (v3), we used an IOMMU to isolate memory
> > >> spaces. But we still had trouble with the vectoring. So we implement=
ed
> > >> separate address spaces for each PCIBus to tackle both problems
> > >> simultaneously, based on the feedback we got.
> > >>=20
> > >> The following gives an overview of issues concerning vectoring of
> > >> BAR accesses.
> > >>=20
> > >> The device=E2=80=99s BAR regions are mapped into the guest physical =
address
> > >> space. The guest writes the guest PA of each BAR into the device=E2=
=80=99s BAR
> > >> registers. To access the BAR regions of the device, QEMU uses
> > >> address_space_rw() which vectors the physical address access to the
> > >> device BAR region handlers. =20
> > >=20
> > > The guest physical address written to the BAR is irrelevant from the
> > > device perspective, this only serves to assign the BAR an offset with=
in
> > > the address_space_mem, which is used by the vCPU (and possibly other
> > > devices depending on their address space).  There is no reason for the
> > > device itself to care about this address. =20
> >=20
> > Thank you for the explanation, Alex!
> >=20
> > The confusion at my part is whether we are inside the device already wh=
en
> > the server receives a request to access BAR region of a device. Based on
> > your explanation, I get that your view is the BAR access request has
> > propagated into the device already, whereas I was under the impression
> > that the request is still on the CPU side of the PCI root complex.
>=20
> If you are getting an access through your MemoryRegionOps, all the
> translations have been made, you simply need to use the hwaddr as the
> offset into the MemoryRegion for the access.  Perform the read/write to
> your device, no further translations required.

The access comes via libvfio-user's vfu_region_access_cb_t callback, not
via MemoryRegionOps. The callback is currently implemented by calling
address_space_rw() on the pci_isol_as_mem/io() address space, depending
on the BAR type. The code in "[PATCH v5 15/18] vfio-user: handle PCI BAR
accesses".

It's possible to reimplement the patch to directly call
memory_region_dispatch_read/write() on r->memory instead of
address_space_rw() as you've described.

> > Your view makes sense to me - once the BAR access request reaches the
> > client (on the other side), we could consider that the request has reac=
hed
> > the device.
> >=20
> > On a separate note, if devices don=E2=80=99t care about the values in B=
AR
> > registers, why do the default PCI config handlers intercept and map
> > the BAR region into address_space_mem?
> > (pci_default_write_config() -> pci_update_mappings())
>=20
> This is the part that's actually placing the BAR MemoryRegion as a
> sub-region into the vCPU address space.  I think if you track it,
> you'll see PCIDevice.io_regions[i].address_space is actually
> system_memory, which is used to initialize address_space_system.
>=20
> The machine assembles PCI devices onto buses as instructed by the
> command line or hot plug operations.  It's the responsibility of the
> guest firmware and guest OS to probe those devices, size the BARs, and
> place the BARs into the memory hierarchy of the PCI bus, ie. system
> memory.  The BARs are necessarily in the "guest physical memory" for
> vCPU access, but it's essentially only coincidental that PCI devices
> might be in an address space that provides a mapping to their own BAR.
> There's no reason to ever use it.

Good, I think nothing uses address_space_system/io when BAR dispatch is
implemented with memory_region_dispatch_read/write() as you suggested.

It would be nice if there was a way to poison address_space_system/io to
abort on dispatch - nothing should use them.

We now have the option of dropping pci_isol_as_mem/io() again and using
->iommu_fn() to return an isolated memory address space containing the
vfio-user client's VFIO_USER_DMA_MAP regions.

Stefan

--wI21tKL6ukhTRmRP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmH6TUwACgkQnKSrs4Gr
c8jdHggAw3tylPyKY5dE/QQWcbD/PdQ1jZafpHo9tnKmTzyY3TOY44xVD73UCPz/
4UQPZ7O1FU+KmAxzn7YLS84Eti8ce2Q8hV16KBDjpb5Biifgfgz5zWv3zyTvr9WY
s4B3pwAZUuCyM4S5myhZUg+8DgNdifqDPxKi0ICueOhncd1nkLFeUEEocR+ykMx1
27Fs1qXrtSIII1MFAAUbjcjNSDzrTe/Df7LdTyQKsjvYjO2GvbODTJBjj7QW1P41
Q3QwLMoAYd/qa5wihl+NJZ/OuL3A9/cm66l6xbPIbbIJakBu1AmSBc/UZTwt2Cgg
U/WL51HMJPyRV2z/l8TYRiC1Cz0jvA==
=5r17
-----END PGP SIGNATURE-----

--wI21tKL6ukhTRmRP--


