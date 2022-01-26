Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F01A049C6C9
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 10:47:49 +0100 (CET)
Received: from localhost ([::1]:56980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCeu4-0007z5-Kl
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 04:47:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCerg-0006fA-0Q
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 04:45:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCerZ-0003M8-Bq
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 04:45:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643190307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n5kNo3liM31wItd5HunKs6/MFs0EV507lFJvF8u1AiI=;
 b=gg9J7P0zxugovXy7Enl+gXme1kld7Vi91tHwDBx2H05bvkKhQMTX4Wrnrz7DxCjApzFT32
 7XY4aV3avBnOy27kpVIOwZWlubH/xubQbQGaUlzUugbMqE1iwJWR5aI7XMPsmxyJUb56PC
 4perUZ0pzP+NVvwbKoyjo/5I6ctpQzQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-wZEd3uTlOfKnhwN56_pS-Q-1; Wed, 26 Jan 2022 04:45:03 -0500
X-MC-Unique: wZEd3uTlOfKnhwN56_pS-Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1910D6123E;
 Wed, 26 Jan 2022 09:45:02 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41D6F7314A;
 Wed, 26 Jan 2022 09:45:01 +0000 (UTC)
Date: Wed, 26 Jan 2022 09:45:00 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Message-ID: <YfEYHBhrsdF9Edpp@stefanha-x1.localdomain>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <2971c1bec04acaac4eb3c1f2b104cbeabad01e22.1642626515.git.jag.raman@oracle.com>
 <20220119190742-mutt-send-email-mst@kernel.org>
 <1CACFB08-1BBC-4ECC-9C0B-6F377018D795@oracle.com>
 <YfBDqMuO/l/gWzL8@work-vm>
 <AE47B5D2-6515-4BD3-B541-23E5274174AC@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f/JItRIp+HGV+oxv"
Content-Disposition: inline
In-Reply-To: <AE47B5D2-6515-4BD3-B541-23E5274174AC@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
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
 John Johnson <john.g.johnson@oracle.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--f/JItRIp+HGV+oxv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 26, 2022 at 05:27:32AM +0000, Jag Raman wrote:
>=20
>=20
> > On Jan 25, 2022, at 1:38 PM, Dr. David Alan Gilbert <dgilbert@redhat.co=
m> wrote:
> >=20
> > * Jag Raman (jag.raman@oracle.com) wrote:
> >>=20
> >>=20
> >>> On Jan 19, 2022, at 7:12 PM, Michael S. Tsirkin <mst@redhat.com> wrot=
e:
> >>>=20
> >>> On Wed, Jan 19, 2022 at 04:41:52PM -0500, Jagannathan Raman wrote:
> >>>> Allow PCI buses to be part of isolated CPU address spaces. This has a
> >>>> niche usage.
> >>>>=20
> >>>> TYPE_REMOTE_MACHINE allows multiple VMs to house their PCI devices in
> >>>> the same machine/server. This would cause address space collision as
> >>>> well as be a security vulnerability. Having separate address spaces =
for
> >>>> each PCI bus would solve this problem.
> >>>=20
> >>> Fascinating, but I am not sure I understand. any examples?
> >>=20
> >> Hi Michael!
> >>=20
> >> multiprocess QEMU and vfio-user implement a client-server model to all=
ow
> >> out-of-process emulation of devices. The client QEMU, which makes ioct=
ls
> >> to the kernel and runs VCPUs, could attach devices running in a server
> >> QEMU. The server QEMU needs access to parts of the client=E2=80=99s RA=
M to
> >> perform DMA.
> >=20
> > Do you ever have the opposite problem? i.e. when an emulated PCI device
>=20
> That=E2=80=99s an interesting question.
>=20
> > exposes a chunk of RAM-like space (frame buffer, or maybe a mapped file)
> > that the client can see.  What happens if two emulated devices need to
> > access each others emulated address space?
>=20
> In this case, the kernel driver would map the destination=E2=80=99s chunk=
 of internal RAM into
> the DMA space of the source device. Then the source device could write to=
 that
> mapped address range, and the IOMMU should direct those writes to the
> destination device.
>=20
> I would like to take a closer look at the IOMMU implementation on how to =
achieve
> this, and get back to you. I think the IOMMU would handle this. Could you=
 please
> point me to the IOMMU implementation you have in mind?

I don't know if the current vfio-user client/server patches already
implement device-to-device DMA, but the functionality is supported by
the vfio-user protocol.

Basically: if the DMA regions lookup inside the vfio-user server fails,
fall back to VFIO_USER_DMA_READ/WRITE messages instead.
https://github.com/nutanix/libvfio-user/blob/master/docs/vfio-user.rst#vfio=
-user-dma-read

Here is the flow:
1. The vfio-user server with device A sends a DMA read to QEMU.
2. QEMU finds the MemoryRegion associated with the DMA address and sees
   it's a device.
   a. If it's emulated inside the QEMU process then the normal
      device emulation code kicks in.
   b. If it's another vfio-user PCI device then the vfio-user PCI proxy
      device forwards the DMA to the second vfio-user server's device B.

Stefan

--f/JItRIp+HGV+oxv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHxGBsACgkQnKSrs4Gr
c8jzfwgAyiYI+iqLPwGnazH/KQXxHTLYyRuTUA/KNli9ySXVKRGhlbc7kYBbaUI3
BxroH8X8i+DDK2OdwZuX3ov/JHO+kIQiCE/ypyJEeZAHH9roajTbH7CoVSQ1DkaC
R3KH/ASfwHEv4Zd5m436X6NdCrPaBlgbyTc2N3kz+xMoVWWfJuyY4prNKtBUdqq2
jUE+3QutFe6wzhnSssr9WuPHOaCjKkThwrTTVWqkvAfHSvJNuLhe78k2xJOvga7X
KoHWDjCOfL0Yg4I2YunS4lxaRB9u0vIgBE1f/nj1L5Z/a8H3BU+8q/lUxClrARpJ
3v7Vfy2vd1XY5LStctOmF3rqb6HtKw==
=9gXT
-----END PGP SIGNATURE-----

--f/JItRIp+HGV+oxv--


