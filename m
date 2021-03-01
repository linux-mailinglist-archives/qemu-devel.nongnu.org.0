Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC8932857A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 17:55:24 +0100 (CET)
Received: from localhost ([::1]:49250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGlpL-0007kZ-Ol
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 11:55:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGlnT-0007AX-U0
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:53:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGlnQ-0008Sd-Sx
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:53:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614617603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vO4acQz/RKSc9dvHBZe4j6SnL4tfkBND6aXmXuQXMAo=;
 b=dLv4IT+roIxRLx6YoQX9czItDemLFzgqEgxW0DYBLjloyzsWldI+ZvMij2SDDpo710tu41
 V23e2QXcM3E5edfucI09AafyNXXe3rFPI9ATkMj7ICx3aWaFFjc9MNycozeStgcWzJhxCM
 Ycj991pJDPpHHQ7+zd6bovkLjObR5EY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-el7iJEe3MhuH9cGgEUZbkQ-1; Mon, 01 Mar 2021 11:53:21 -0500
X-MC-Unique: el7iJEe3MhuH9cGgEUZbkQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF290107AD24;
 Mon,  1 Mar 2021 16:53:20 +0000 (UTC)
Received: from localhost (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 674F45C3E5;
 Mon,  1 Mar 2021 16:53:20 +0000 (UTC)
Date: Mon, 1 Mar 2021 16:53:19 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [PATCH] docs: show how to spawn qemu-storage-daemon with fd
 passing
Message-ID: <YD0b//hL5jcIRaLt@stefanha-x1.localdomain>
References: <20210301153159.35660-1-stefanha@redhat.com>
 <20210301153906.GZ30079@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210301153906.GZ30079@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PIRSXE4pRRF9xui2"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--PIRSXE4pRRF9xui2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 01, 2021 at 03:39:06PM +0000, Richard W.M. Jones wrote:
> On Mon, Mar 01, 2021 at 03:31:59PM +0000, Stefan Hajnoczi wrote:
> > The QMP monitor, NBD server, and vhost-user-blk export all support file
> > descriptor passing. This is a useful technique because it allows the
> > parent process to spawn and wait for qemu-storage-daemon without busy
> > waiting, which may delay startup due to arbitrary sleep() calls.
> >=20
> > This Python example is inspired by the test case written for libnbd by
> > Richard W.M. Jones <rjones@redhat.com>:
> > https://gitlab.com/nbdkit/libnbd/-/commit/89113f484effb0e6c322314ba75c1=
cbe07a04543
> >=20
> > Thanks to Daniel P. Berrang=E9 <berrange@redhat.com> for suggestions on
> > how to get this working. Now let's document it!
> >=20
> > Reported-by: Richard W.M. Jones <rjones@redhat.com>
> > Cc: Kevin Wolf <kwolf@redhat.com>
> > Cc: Daniel P. Berrang=E9 <berrange@redhat.com>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  docs/tools/qemu-storage-daemon.rst | 38 ++++++++++++++++++++++++++++--
> >  1 file changed, 36 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-stora=
ge-daemon.rst
> > index f63627eaf6..45854c131e 100644
> > --- a/docs/tools/qemu-storage-daemon.rst
> > +++ b/docs/tools/qemu-storage-daemon.rst
> > @@ -101,10 +101,12 @@ Standard options:
> > =20
> >  .. option:: --nbd-server addr.type=3Dinet,addr.host=3D<host>,addr.port=
=3D<port>[,tls-creds=3D<id>][,tls-authz=3D<id>][,max-connections=3D<n>]
> >    --nbd-server addr.type=3Dunix,addr.path=3D<path>[,tls-creds=3D<id>][=
,tls-authz=3D<id>][,max-connections=3D<n>]
> > +  --nbd-server addr.type=3Dfd,addr.str=3D<fd>[,tls-creds=3D<id>][,tls-=
authz=3D<id>][,max-connections=3D<n>]
> > =20
> >    is a server for NBD exports. Both TCP and UNIX domain sockets are su=
pported.
> > -  TLS encryption can be configured using ``--object`` tls-creds-* and =
authz-*
> > -  secrets (see below).
> > +  A listen socket can be provided via file descriptor passing (see Exa=
mples
> > +  below). TLS encryption can be configured using ``--object`` tls-cred=
s-* and
> > +  authz-* secrets (see below).
> > =20
> >    To configure an NBD server on UNIX domain socket path ``/tmp/nbd.soc=
k``::
> > =20
> > @@ -127,6 +129,38 @@ QMP commands::
> >        --chardev socket,path=3Dqmp.sock,server,nowait,id=3Dchar1 \
> >        --monitor chardev=3Dchar1
> > =20
> > +Launch the daemon from Python with a QMP monitor socket using file des=
criptor
> > +passing so there is no need to busy wait for the QMP monitor to become
> > +available::
> > +
> > +  #!/usr/bin/env python3
> > +  import os
> > +  import subprocess
> > +  import socket
> > +
> > +  sock_path =3D '/tmp/qmp-{}.sock'.format(os.getpid())
>=20
> Not sure how much you worry about the insecure / easily guessable tmp
> path here.  I notice that there's already one in the surrounding
> documentation (/tmp/nbd.sock) so maybe it's not a problem :-)

Yes, the documentation doesn't address those issues. If I respin I'll
change the path to something that's less likely to be a globally
writeable directory (/var/run/... where the pid files usually go).

Stefan

--PIRSXE4pRRF9xui2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA9G/8ACgkQnKSrs4Gr
c8iYcAf/fjwASuRHc6l4Cy3p+9ddrZP7/NBNocJ55kGYO610hlJ+q0ygdpqzSCbO
eu9DyncAQNS2dhaALp5aq7IxWi4jEh3p4g3DfAyf1NMQW4uGVl9qSiYX3ICYezG8
lOxe6RIpJSBRbnUoG6T57kQdSVNC8l5OM9h0EPFMsuvu5vjdgVc/3swW6dqfyuPD
vCYlqYH0kQnjJR24SA521r6YRiBXP72fwECa3BEzw14hTLjH+zlxr5bgr/iLr0dg
7yEwekG0uFXkQnYvPIxKPz+dAW+YsUilzTanzZ58CYNQ+o0o7JmJcSX9k82lbY5E
UsZeHnrDNv0EGpM4clCym2k//ZpEYA==
=pL81
-----END PGP SIGNATURE-----

--PIRSXE4pRRF9xui2--


