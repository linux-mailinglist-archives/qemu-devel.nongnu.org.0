Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C818B49DCFB
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 09:53:20 +0100 (CET)
Received: from localhost ([::1]:36774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD0Wt-0002rG-Fk
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 03:53:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nD0Ai-0003u8-8f
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 03:30:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nD0Af-0006IU-Eq
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 03:30:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643272220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uBTthIW8KbInjHJ8upFwcgHEYhiRkg8n5HoVQFfex/4=;
 b=LeqiTuHKPYkZav2tiwBU0o+CqyLVd9LuA0zRo6RbPwsNn8SfPQBveP83hBbV58kOuO5K+/
 VIFiqtG895CNb4GyAlCCupFn1o45kKh7/0lk86gPaN1PEU2ZUm1zBeX42PvhJSFaTK5x/1
 9gwz88OD4SMj8LK79ax9vnNfZxjwztc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-avYWxHwlMeyuHqHEXgObBg-1; Thu, 27 Jan 2022 03:30:16 -0500
X-MC-Unique: avYWxHwlMeyuHqHEXgObBg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EACBC101F7B9;
 Thu, 27 Jan 2022 08:30:14 +0000 (UTC)
Received: from localhost (unknown [10.39.193.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38CFE4EC8E;
 Thu, 27 Jan 2022 08:30:13 +0000 (UTC)
Date: Thu, 27 Jan 2022 08:30:13 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Message-ID: <YfJYFbBVQzho7mGp@stefanha-x1.localdomain>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <2971c1bec04acaac4eb3c1f2b104cbeabad01e22.1642626515.git.jag.raman@oracle.com>
 <20220119190742-mutt-send-email-mst@kernel.org>
 <1CACFB08-1BBC-4ECC-9C0B-6F377018D795@oracle.com>
 <YfBDqMuO/l/gWzL8@work-vm>
 <AE47B5D2-6515-4BD3-B541-23E5274174AC@oracle.com>
 <YfEYHBhrsdF9Edpp@stefanha-x1.localdomain>
 <YfGqCJeTD9bmkZx6@work-vm>
 <20220126161120-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UtsycOu6mYknyxFv"
Content-Disposition: inline
In-Reply-To: <20220126161120-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>, Jag Raman <jag.raman@oracle.com>,
 Beraldo Leal <bleal@redhat.com>, "quintela@redhat.com" <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, "armbru@redhat.com" <armbru@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--UtsycOu6mYknyxFv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 26, 2022 at 04:13:33PM -0500, Michael S. Tsirkin wrote:
> On Wed, Jan 26, 2022 at 08:07:36PM +0000, Dr. David Alan Gilbert wrote:
> > * Stefan Hajnoczi (stefanha@redhat.com) wrote:
> > > On Wed, Jan 26, 2022 at 05:27:32AM +0000, Jag Raman wrote:
> > > >=20
> > > >=20
> > > > > On Jan 25, 2022, at 1:38 PM, Dr. David Alan Gilbert <dgilbert@red=
hat.com> wrote:
> > > > >=20
> > > > > * Jag Raman (jag.raman@oracle.com) wrote:
> > > > >>=20
> > > > >>=20
> > > > >>> On Jan 19, 2022, at 7:12 PM, Michael S. Tsirkin <mst@redhat.com=
> wrote:
> > > > >>>=20
> > > > >>> On Wed, Jan 19, 2022 at 04:41:52PM -0500, Jagannathan Raman wro=
te:
> > > > >>>> Allow PCI buses to be part of isolated CPU address spaces. Thi=
s has a
> > > > >>>> niche usage.
> > > > >>>>=20
> > > > >>>> TYPE_REMOTE_MACHINE allows multiple VMs to house their PCI dev=
ices in
> > > > >>>> the same machine/server. This would cause address space collis=
ion as
> > > > >>>> well as be a security vulnerability. Having separate address s=
paces for
> > > > >>>> each PCI bus would solve this problem.
> > > > >>>=20
> > > > >>> Fascinating, but I am not sure I understand. any examples?
> > > > >>=20
> > > > >> Hi Michael!
> > > > >>=20
> > > > >> multiprocess QEMU and vfio-user implement a client-server model =
to allow
> > > > >> out-of-process emulation of devices. The client QEMU, which make=
s ioctls
> > > > >> to the kernel and runs VCPUs, could attach devices running in a =
server
> > > > >> QEMU. The server QEMU needs access to parts of the client=E2=80=
=99s RAM to
> > > > >> perform DMA.
> > > > >=20
> > > > > Do you ever have the opposite problem? i.e. when an emulated PCI =
device
> > > >=20
> > > > That=E2=80=99s an interesting question.
> > > >=20
> > > > > exposes a chunk of RAM-like space (frame buffer, or maybe a mappe=
d file)
> > > > > that the client can see.  What happens if two emulated devices ne=
ed to
> > > > > access each others emulated address space?
> > > >=20
> > > > In this case, the kernel driver would map the destination=E2=80=99s=
 chunk of internal RAM into
> > > > the DMA space of the source device. Then the source device could wr=
ite to that
> > > > mapped address range, and the IOMMU should direct those writes to t=
he
> > > > destination device.
> > > >=20
> > > > I would like to take a closer look at the IOMMU implementation on h=
ow to achieve
> > > > this, and get back to you. I think the IOMMU would handle this. Cou=
ld you please
> > > > point me to the IOMMU implementation you have in mind?
> > >=20
> > > I don't know if the current vfio-user client/server patches already
> > > implement device-to-device DMA, but the functionality is supported by
> > > the vfio-user protocol.
> > >=20
> > > Basically: if the DMA regions lookup inside the vfio-user server fail=
s,
> > > fall back to VFIO_USER_DMA_READ/WRITE messages instead.
> > > https://github.com/nutanix/libvfio-user/blob/master/docs/vfio-user.rs=
t#vfio-user-dma-read
> > >=20
> > > Here is the flow:
> > > 1. The vfio-user server with device A sends a DMA read to QEMU.
> > > 2. QEMU finds the MemoryRegion associated with the DMA address and se=
es
> > >    it's a device.
> > >    a. If it's emulated inside the QEMU process then the normal
> > >       device emulation code kicks in.
> > >    b. If it's another vfio-user PCI device then the vfio-user PCI pro=
xy
> > >       device forwards the DMA to the second vfio-user server's device=
 B.
> >=20
> > I'm starting to be curious if there's a way to persuade the guest kernel
> > to do it for us; in general is there a way to say to PCI devices that
> > they can only DMA to the host and not other PCI devices?
>=20
>=20
> But of course - this is how e.g. VFIO protects host PCI devices from
> each other when one of them is passed through to a VM.

Michael: Are you saying just turn on vIOMMU? :)

Devices in different VFIO groups have their own IOMMU context, so their
IOVA space is isolated. Just don't map other devices into the IOVA space
and those other devices will be inaccessible.

Stefan

--UtsycOu6mYknyxFv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHyWBQACgkQnKSrs4Gr
c8ggIQf+IvNPe2uWXLhCPWy4DCh56SK/YjTiS2bxkeV7BIeFeCRsvlgS5iaB7srO
NWW2/6jy4Z+EyFXNJTAAJnP2aR0U3XYtE6yp2y7hTi9BwClzW/utLcZVvEKeAQ1p
O+QhOfBVZALsa9EchQII+eVEIRebG2geLr3gVKuYcO2+psXvZqwBpDFJ624DgV34
58upDA6ecXSWCVe5BIuryMMyAeixxgOrG+SoNAGlvimxItEM4/j1vrfuU0O4wXWB
qM624SpAXpKw0P9ksa5x66LfaalGhjBy5grWx0ZilTQPGaxBojpf7U4X/4gr2hCW
ONhw3JqhzGAhlPc4gGNyagUI45pXWw==
=4lXa
-----END PGP SIGNATURE-----

--UtsycOu6mYknyxFv--


