Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3901A8732
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 20:11:40 +0200 (CEST)
Received: from localhost ([::1]:36156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5Zkp-0004m9-I1
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 14:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56816)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1i5Zjs-0004NC-Tp
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 14:10:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1i5Zjq-00037A-96
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 14:10:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59772)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1i5Zjp-00036o-W4
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 14:10:38 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 211121026FFB
 for <qemu-devel@nongnu.org>; Wed,  4 Sep 2019 18:10:37 +0000 (UTC)
Received: from localhost (ovpn-116-88.ams2.redhat.com [10.36.116.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59D6E5D70D;
 Wed,  4 Sep 2019 18:10:31 +0000 (UTC)
Date: Wed, 4 Sep 2019 19:10:30 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20190904181030.GA26826@stefanha-x1.localdomain>
References: <20190829104133.17418-1-stefanha@redhat.com>
 <20190903153539.GM2744@work-vm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <20190903153539.GM2744@work-vm>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Wed, 04 Sep 2019 18:10:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] virtiofsd: add man page
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 03, 2019 at 04:35:39PM +0100, Dr. David Alan Gilbert wrote:
> * Stefan Hajnoczi (stefanha@redhat.com) wrote:
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  Makefile                         |  7 +++
> >  contrib/virtiofsd/virtiofsd.texi | 85 ++++++++++++++++++++++++++++++++
> >  2 files changed, 92 insertions(+)
> >  create mode 100644 contrib/virtiofsd/virtiofsd.texi
> >=20
> > diff --git a/Makefile b/Makefile
> > index a3dfdd6fa8..cc18025753 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -334,6 +334,9 @@ DOCS+=3Ddocs/qemu-cpu-models.7
> >  ifdef CONFIG_VIRTFS
> >  DOCS+=3Dfsdev/virtfs-proxy-helper.1
> >  endif
> > +ifdef CONFIG_LINUX
>=20
> Is there a reason that's CONFIG_LINUX not CONFIG_VHOST_USER_FS ?
> (Although I guess it's guest vs daemon so the two are independent?)

Yes, this is virtiofsd, not vhost-user-fs-pci.  We don't have a
CONFIG_VIRTIOFSD.

> > +DOCS+=3Dcontrib/virtiofsd/virtiofsd.1
> > +endif
> >  ifdef CONFIG_TRACE_SYSTEMTAP
> >  DOCS+=3Dscripts/qemu-trace-stap.1
> >  endif
> > @@ -834,6 +837,9 @@ ifdef CONFIG_VIRTFS
> >  	$(INSTALL_DIR) "$(DESTDIR)$(mandir)/man1"
> >  	$(INSTALL_DATA) fsdev/virtfs-proxy-helper.1 "$(DESTDIR)$(mandir)/man1"
> >  endif
> > +ifdef CONFIG_LINUX
> > +	$(INSTALL_DATA) contrib/virtiofsd.1 "$(DESTDIR)$(mandir)/man1"
>=20
> I had to fix that to contrib/virtiofsd/virtiofsd.1 to get make install
> happy.

Thanks for spotting it!

> > +@c man begin DESCRIPTION
> > +
> > +Share a host directory tree with a guest through a virtio-fs device.  =
This
> > +program is a vhost-user backend that implements the virtio-fs device. =
 Each
> > +virtio-fs device instance requires its own virtiofsd process.
> > +
> > +This program is designed to work with QEMU's @code{--device vhost-user=
-fs-pci}
>=20
> Should we include the -pci there?
>=20
> (Merged with the path fix above)

We could also be more general and say "vhost-user virtio-fs device" to
avoid the issue.

Stefan

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl1v/hYACgkQnKSrs4Gr
c8jtAQgAna0dQRA6RKpt4vAGNm9rRvw0sQ7/Vua3kBzhTp6kQPk5W7VIpLh+HHcs
STKfJ5Fvy7nH0FV8w9vrJmv6BsrP6/Jw3I2ZRv+I2/usHLA1sZRcYdX+a7nk3w+/
y1HkwJeG9NOkoYWBBEvUHN+aZlVcefypy1aH3NdSTTvi8vNcABXXu+vMfLVN/rGO
h0nX/3mFs7IFYI3DY45wFT3fQavVo5tSo7pjM5WeIx3I3JppxdhxWtTMzQoBIpCC
LcSZ8SX9Sxc6rNWWpAFtbCGAzrDCFpO0SdrrcownX2ryXvGeW8pD4Uz209VZUwIB
tpANPWJpOghUCN1FeMl+BF9QEQOpFw==
=NByF
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--

