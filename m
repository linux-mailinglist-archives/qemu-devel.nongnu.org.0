Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2B6305E0B
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 15:20:00 +0100 (CET)
Received: from localhost ([::1]:55352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4lfr-0004UL-4f
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 09:19:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l4lex-00044F-NE
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 09:19:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l4lev-0004HS-Ql
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 09:19:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611757141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wVtpZSA/3iKsmhFehQ/YIChJX7Ua0EQoMYEMx4GK3Tc=;
 b=V2uHZ3cUN59azH4jkO0YHXcRgO19IRVXnXxE87twWYGBkBN7O+OYjcl5CkENKt/ju4JTYe
 AOVghB/sNZoUKoRcrCYSxr0/JyvM30qXxn3umC9lFWQTeJZwd99Oinc0n/rwlo2TW5C7+V
 mJElhmCaXOse7gdRCyIba8pwLZrvioM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-jjWrMB9KOb-nxWsL-eiewA-1; Wed, 27 Jan 2021 09:18:58 -0500
X-MC-Unique: jjWrMB9KOb-nxWsL-eiewA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9867591222;
 Wed, 27 Jan 2021 14:18:57 +0000 (UTC)
Received: from localhost (ovpn-115-15.ams2.redhat.com [10.36.115.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57BC35D6D5;
 Wed, 27 Jan 2021 14:18:54 +0000 (UTC)
Date: Wed, 27 Jan 2021 14:18:53 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: lagarcia@br.ibm.com
Subject: Re: [PATCH] IOMMU and ATS not supported by vhost-user filesystem.
Message-ID: <20210127141853.GB310142@stefanha-x1.localdomain>
References: <e76462fdcfaa07208380e2a7df9b281b6e6717b8.1611685180.git.lagarcia@br.ibm.com>
 <20210127111938.GH299797@stefanha-x1.localdomain>
 <b7080a33-a192-45d6-2b02-9cda4ff8c9b4@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <b7080a33-a192-45d6-2b02-9cda4ff8c9b4@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 27, 2021 at 09:30:35AM -0300, Leonardo Augusto Guimar=E3es Garc=
ia wrote:
> On 1/27/21 8:19 AM, Stefan Hajnoczi wrote:
> > On Tue, Jan 26, 2021 at 03:23:38PM -0300, lagarcia@linux.ibm.com wrote:
> > > From: Leonardo Garcia <lagarcia@br.ibm.com>
> > >=20
> > > Currently, as IOMMU and ATS are not supported, if a user mistakenly s=
et
> > > any of them and tries to mount the vhost-user filesystem inside the
> > > guest, whenever the user tries to access the mount point, the system
> > > will hang forever.
> > >=20
> > > Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
> > > ---
> > >   hw/virtio/vhost-user-fs-pci.c | 7 +++++++
> > >   hw/virtio/vhost-user-fs.c     | 5 +++++
> > >   2 files changed, 12 insertions(+)
> > >=20
> > > diff --git a/hw/virtio/vhost-user-fs-pci.c b/hw/virtio/vhost-user-fs-=
pci.c
> > > index 2ed8492b3f..564d1fd108 100644
> > > --- a/hw/virtio/vhost-user-fs-pci.c
> > > +++ b/hw/virtio/vhost-user-fs-pci.c
> > > @@ -11,6 +11,8 @@
> > >    * top-level directory.
> > >    */
> > > +#include "qemu/osdep.h"
> > > +#include "qapi/error.h"
> > >   #include "qemu/osdep.h"
> > >   #include "hw/qdev-properties.h"
> > >   #include "hw/virtio/vhost-user-fs.h"
> > > @@ -45,6 +47,11 @@ static void vhost_user_fs_pci_realize(VirtIOPCIPro=
xy *vpci_dev, Error **errp)
> > >           vpci_dev->nvectors =3D dev->vdev.conf.num_request_queues + =
2;
> > >       }
> > > +    if (vpci_dev->flags & VIRTIO_PCI_FLAG_ATS) {
> > > +        error_setg(errp, "ATS is currently not supported with vhost-=
user-fs-pci");
> > > +        return;
> > > +    }
> > Why is this check needed in addition to VIRTIO_F_IOMMU_PLATFORM?
>=20
>=20
> I don't know if VIRTIO_PCI_FLAG_ATS should depend on
> VIRTIO_F_IOMMU_PLATFORM. At least from a code perspective today, they are
> completely independent. A user can specify one or the other or both. And =
if
> a user specifies VIRTIO_PCI_FLAG_ATS without specifying
> VIRTIO_F_IOMMU_PLATFORM, the same issue described in the original message
> will happen inside the guest.

I don't see any PCI ATS-specific code in Linux drivers/virtio/ so I
wonder what the issue is?

Also, I thought PCI ATS is an optional feature. It's still possible to
have IOMMUs without ATS.

Michael: Can you help us understand why enabling ATS on a device in QEMU
would cause issues with a VIRTIO device that does not support
VIRTIO_F_IOMMU_PLATFORM?

> >=20
> > > +
> > >       qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
> > >   }
> > > diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> > > index ac4fc34b36..914d68b3ee 100644
> > > --- a/hw/virtio/vhost-user-fs.c
> > > +++ b/hw/virtio/vhost-user-fs.c
> > > @@ -203,6 +203,11 @@ static void vuf_device_realize(DeviceState *dev,=
 Error **errp)
> > >           return;
> > >       }
> > > +    if (virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
> > > +        error_setg(errp, "IOMMU is currently not supported with vhos=
t-user-fs");
> > > +        return;
> > > +    }
> > > +
> > >       if (!vhost_user_init(&fs->vhost_user, &fs->conf.chardev, errp))=
 {
> > I thought IOMMU support depends on the vhost-user device backend (e.g.
> > virtiofsd), so the vhost-user backend should participate in advertising
> > this feature.
> >=20
> > Perhaps the check should be:
> >=20
> >      ret =3D vhost_dev_init(&fs->vhost_dev, &fs->vhost_user,
> >                           VHOST_BACKEND_TYPE_USER, 0);
> >      if (ret < 0) {
> >          error_setg_errno(errp, -ret, "vhost_dev_init failed");
> >          goto err_virtio;
> >      }
> > +
> > +   if (virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM) &&
> > +       !(fs->vhost_dev.hdev_features & (1ull << VIRTIO_F_IOMMU_PLATFOR=
M))) {
> > +       error_setg(errp, "IOMMU is not supported by the vhost-user devi=
ce backend");
> > +       goto err_iommu_needed;
> > +   }
> >=20
> > Also, can this logic be made generic for all vhost-user devices? It's
> > not really specific to vhost-user-fs.
>=20
>=20
> Sure, I can do that. I wasn't sure whether this restriction was only for
> vhost-user-fs or whether it was generic for all vhost-user devices. I wil=
l
> include this in a next version of the patch.

Awesome, thanks!

Stefan

--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmARdk0ACgkQnKSrs4Gr
c8gHDgf+PBjO4Jqh2EFy/RtNJBm0TIXh/oBI6QyiWCV7SrsdJjKrVnBjm+f6e3rm
q4f4Db+16Ja0H6FFC1CMQ255LBWpFSPa3flESJYgEMYbxKLdxD8QB80hxcDsI2e3
k89LHyzshFgNWwx8W3sgV+i0PgvTW8cW4+Q4ydDgmy9teNZ0XH53iz73m7kzJ133
kcUIBbBErQfZ2nMF0Fg1z16EOkLAyHMTkEtFWzFABrhhUH+012QS+K7y/j0to4M6
9dt10MxGKKK1W5SX6P/UXrc7kEqEsK2vIBfnG+LpI/KWvqXFC2WhlwpqqsoM3FmA
pBsc0W606G11+LYtuYQ/ycZ28yNtuA==
=esja
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--


