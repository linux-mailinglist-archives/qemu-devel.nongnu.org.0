Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BAC49F51B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 09:30:05 +0100 (CET)
Received: from localhost ([::1]:53248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDMdv-00026P-QR
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 03:30:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nDMTl-0004bL-BD
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 03:19:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nDMTi-00057p-3q
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 03:19:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643357968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vuVnPdqiJeSO7LrnWx2mZUd3/7oV5AldOWIBI4ynoxY=;
 b=CCSOdkeJUtkWMOpNKhpOxV7Ko8Nk7tcN9vmq1NoLIfdJD1HPmv8+8ynpzHs6RJtrK1iVxG
 mi/tIBZ7zGPA4YHpBU2sN67+lPg+NKSEetfzlkPw5X6NlTJeAcCIzS7bB3WH0rZzwaUvQX
 FUlGgrjnLZ8ZMznsvHEDheDxIgOCa20=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-dpcAPhxYNsuNz6Zs4x_PDA-1; Fri, 28 Jan 2022 03:19:25 -0500
X-MC-Unique: dpcAPhxYNsuNz6Zs4x_PDA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F34C1083F60;
 Fri, 28 Jan 2022 08:19:23 +0000 (UTC)
Received: from localhost (unknown [10.39.193.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20FF360C36;
 Fri, 28 Jan 2022 08:19:07 +0000 (UTC)
Date: Fri, 28 Jan 2022 08:19:06 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Message-ID: <YfOm+hhspMIfZnY/@stefanha-x1.localdomain>
References: <2971c1bec04acaac4eb3c1f2b104cbeabad01e22.1642626515.git.jag.raman@oracle.com>
 <20220119190742-mutt-send-email-mst@kernel.org>
 <1CACFB08-1BBC-4ECC-9C0B-6F377018D795@oracle.com>
 <YfBDqMuO/l/gWzL8@work-vm>
 <AE47B5D2-6515-4BD3-B541-23E5274174AC@oracle.com>
 <YfEYHBhrsdF9Edpp@stefanha-x1.localdomain>
 <YfGqCJeTD9bmkZx6@work-vm>
 <20220126161120-mutt-send-email-mst@kernel.org>
 <YfJYFbBVQzho7mGp@stefanha-x1.localdomain>
 <20220127142253.21ab0025.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7IjNXegecZu1fJcC"
Content-Disposition: inline
In-Reply-To: <20220127142253.21ab0025.alex.williamson@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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


--7IjNXegecZu1fJcC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 27, 2022 at 02:22:53PM -0700, Alex Williamson wrote:
> On Thu, 27 Jan 2022 08:30:13 +0000
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> > On Wed, Jan 26, 2022 at 04:13:33PM -0500, Michael S. Tsirkin wrote:
> > > On Wed, Jan 26, 2022 at 08:07:36PM +0000, Dr. David Alan Gilbert wrot=
e: =20
> > > > * Stefan Hajnoczi (stefanha@redhat.com) wrote: =20
> > > > > On Wed, Jan 26, 2022 at 05:27:32AM +0000, Jag Raman wrote: =20
> > > > > >=20
> > > > > >  =20
> > > > > > > On Jan 25, 2022, at 1:38 PM, Dr. David Alan Gilbert <dgilbert=
@redhat.com> wrote:
> > > > > > >=20
> > > > > > > * Jag Raman (jag.raman@oracle.com) wrote: =20
> > > > > > >>=20
> > > > > > >>  =20
> > > > > > >>> On Jan 19, 2022, at 7:12 PM, Michael S. Tsirkin <mst@redhat=
=2Ecom> wrote:
> > > > > > >>>=20
> > > > > > >>> On Wed, Jan 19, 2022 at 04:41:52PM -0500, Jagannathan Raman=
 wrote: =20
> > > > > > >>>> Allow PCI buses to be part of isolated CPU address spaces.=
 This has a
> > > > > > >>>> niche usage.
> > > > > > >>>>=20
> > > > > > >>>> TYPE_REMOTE_MACHINE allows multiple VMs to house their PCI=
 devices in
> > > > > > >>>> the same machine/server. This would cause address space co=
llision as
> > > > > > >>>> well as be a security vulnerability. Having separate addre=
ss spaces for
> > > > > > >>>> each PCI bus would solve this problem. =20
> > > > > > >>>=20
> > > > > > >>> Fascinating, but I am not sure I understand. any examples? =
=20
> > > > > > >>=20
> > > > > > >> Hi Michael!
> > > > > > >>=20
> > > > > > >> multiprocess QEMU and vfio-user implement a client-server mo=
del to allow
> > > > > > >> out-of-process emulation of devices. The client QEMU, which =
makes ioctls
> > > > > > >> to the kernel and runs VCPUs, could attach devices running i=
n a server
> > > > > > >> QEMU. The server QEMU needs access to parts of the client=E2=
=80=99s RAM to
> > > > > > >> perform DMA. =20
> > > > > > >=20
> > > > > > > Do you ever have the opposite problem? i.e. when an emulated =
PCI device =20
> > > > > >=20
> > > > > > That=E2=80=99s an interesting question.
> > > > > >  =20
> > > > > > > exposes a chunk of RAM-like space (frame buffer, or maybe a m=
apped file)
> > > > > > > that the client can see.  What happens if two emulated device=
s need to
> > > > > > > access each others emulated address space? =20
> > > > > >=20
> > > > > > In this case, the kernel driver would map the destination=E2=80=
=99s chunk of internal RAM into
> > > > > > the DMA space of the source device. Then the source device coul=
d write to that
> > > > > > mapped address range, and the IOMMU should direct those writes =
to the
> > > > > > destination device.
> > > > > >=20
> > > > > > I would like to take a closer look at the IOMMU implementation =
on how to achieve
> > > > > > this, and get back to you. I think the IOMMU would handle this.=
 Could you please
> > > > > > point me to the IOMMU implementation you have in mind? =20
> > > > >=20
> > > > > I don't know if the current vfio-user client/server patches alrea=
dy
> > > > > implement device-to-device DMA, but the functionality is supporte=
d by
> > > > > the vfio-user protocol.
> > > > >=20
> > > > > Basically: if the DMA regions lookup inside the vfio-user server =
fails,
> > > > > fall back to VFIO_USER_DMA_READ/WRITE messages instead.
> > > > > https://github.com/nutanix/libvfio-user/blob/master/docs/vfio-use=
r.rst#vfio-user-dma-read
> > > > >=20
> > > > > Here is the flow:
> > > > > 1. The vfio-user server with device A sends a DMA read to QEMU.
> > > > > 2. QEMU finds the MemoryRegion associated with the DMA address an=
d sees
> > > > >    it's a device.
> > > > >    a. If it's emulated inside the QEMU process then the normal
> > > > >       device emulation code kicks in.
> > > > >    b. If it's another vfio-user PCI device then the vfio-user PCI=
 proxy
> > > > >       device forwards the DMA to the second vfio-user server's de=
vice B. =20
> > > >=20
> > > > I'm starting to be curious if there's a way to persuade the guest k=
ernel
> > > > to do it for us; in general is there a way to say to PCI devices th=
at
> > > > they can only DMA to the host and not other PCI devices? =20
> > >=20
> > >=20
> > > But of course - this is how e.g. VFIO protects host PCI devices from
> > > each other when one of them is passed through to a VM. =20
> >=20
> > Michael: Are you saying just turn on vIOMMU? :)
> >=20
> > Devices in different VFIO groups have their own IOMMU context, so their
> > IOVA space is isolated. Just don't map other devices into the IOVA space
> > and those other devices will be inaccessible.
>=20
> Devices in different VFIO *containers* have their own IOMMU context.
> Based on the group attachment to a container, groups can either have
> shared or isolated IOVA space.  That determination is made by looking
> at the address space of the bus, which is governed by the presence of a
> vIOMMU.

Oops, thank you for pointing that out!

Stefan

--7IjNXegecZu1fJcC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHzpvoACgkQnKSrs4Gr
c8jyIAgAxp/Qq/kNZaQ9EF7hOggS85uH1WPJ57K4n+4oeYpjohVuwrt2i+d+WRwY
tJx7Dz7i1x/e2Bh92V+PyfhHBtfHfgKJXv5uheUE5x0XghfDl5hj9oMpUDEG5VOA
ntzrSHdv+EI83mmU6eNqWp4iE2SMORgwvLUUGAPP6nc0I6OBOO+2UvsKInPPYqDZ
bHefDI98e6faVLvrkBEap5d3GKGqHUokpVLUcoBt7QBwQzyZ144+qNaWPTbn0u+W
/ZWOdPEN/pV4Owgy0f1AMNRVf73njRCWuvGgJSxOvbWgw/jsHHo0s9bNU8867RHg
2yfCuaAjU248dlOiXe0k3H4ALfem2A==
=sQMU
-----END PGP SIGNATURE-----

--7IjNXegecZu1fJcC--


