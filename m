Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F6D32873B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 18:23:09 +0100 (CET)
Received: from localhost ([::1]:39138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGmGC-0004VJ-L6
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 12:23:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGmCr-0001pN-EF
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 12:19:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGmCh-0000HL-BJ
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 12:19:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614619167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=usrYqhUK653WqHWWL9zX17J4FuB4O9/1CHxpNiA3MXI=;
 b=NIH45H9wqi//GcVw9ILRxyp5ITJfSu/L7WhSvkd+za+ZokPJumdF6+cB7cb36cxVadG51Q
 oZyqAgxEkPwlMPnDo4beIpFRuRvU07DoOvGfm2Z/iZZs/Uh+VAIun1fCP6TlRcLZPmfEXR
 GR7BWMIEb/gUWqo3QGJ1Sqt4kOufFos=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-YcoJvgJNPP6FbxHwyozZtQ-1; Mon, 01 Mar 2021 12:19:25 -0500
X-MC-Unique: YcoJvgJNPP6FbxHwyozZtQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CAD11009615;
 Mon,  1 Mar 2021 17:19:24 +0000 (UTC)
Received: from localhost (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FFC719744;
 Mon,  1 Mar 2021 17:19:23 +0000 (UTC)
Date: Mon, 1 Mar 2021 17:19:22 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] docs: show how to spawn qemu-storage-daemon with fd
 passing
Message-ID: <YD0iGsCKsqzBCoDV@stefanha-x1.localdomain>
References: <20210301153159.35660-1-stefanha@redhat.com>
 <20210301153906.GZ30079@redhat.com> <YD0L6r68S+Rv8a+R@redhat.com>
 <YD0bRoy34wH8slYj@stefanha-x1.localdomain>
 <YD0csS5KptLrmKJF@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YD0csS5KptLrmKJF@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TqitT7muMUXnxwlF"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--TqitT7muMUXnxwlF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 01, 2021 at 04:56:17PM +0000, Daniel P. Berrang=E9 wrote:
> On Mon, Mar 01, 2021 at 04:50:14PM +0000, Stefan Hajnoczi wrote:
> > On Mon, Mar 01, 2021 at 03:44:42PM +0000, Daniel P. Berrang=E9 wrote:
> > > On Mon, Mar 01, 2021 at 03:39:06PM +0000, Richard W.M. Jones wrote:
> > > > On Mon, Mar 01, 2021 at 03:31:59PM +0000, Stefan Hajnoczi wrote:
> > > > > The QMP monitor, NBD server, and vhost-user-blk export all suppor=
t file
> > > > > descriptor passing. This is a useful technique because it allows =
the
> > > > > parent process to spawn and wait for qemu-storage-daemon without =
busy
> > > > > waiting, which may delay startup due to arbitrary sleep() calls.
> > > > >=20
> > > > > This Python example is inspired by the test case written for libn=
bd by
> > > > > Richard W.M. Jones <rjones@redhat.com>:
> > > > > https://gitlab.com/nbdkit/libnbd/-/commit/89113f484effb0e6c322314=
ba75c1cbe07a04543
> > > > >=20
> > > > > Thanks to Daniel P. Berrang=E9 <berrange@redhat.com> for suggesti=
ons on
> > > > > how to get this working. Now let's document it!
> > > > >=20
> > > > > Reported-by: Richard W.M. Jones <rjones@redhat.com>
> > > > > Cc: Kevin Wolf <kwolf@redhat.com>
> > > > > Cc: Daniel P. Berrang=E9 <berrange@redhat.com>
> > > > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > > ---
> > > > >  docs/tools/qemu-storage-daemon.rst | 38 ++++++++++++++++++++++++=
++++--
> > > > >  1 file changed, 36 insertions(+), 2 deletions(-)
> > > > >=20
> > > > > diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu=
-storage-daemon.rst
> > > > > index f63627eaf6..45854c131e 100644
> > > > > --- a/docs/tools/qemu-storage-daemon.rst
> > > > > +++ b/docs/tools/qemu-storage-daemon.rst
> > > > > @@ -101,10 +101,12 @@ Standard options:
> > > > > =20
> > > > >  .. option:: --nbd-server addr.type=3Dinet,addr.host=3D<host>,add=
r.port=3D<port>[,tls-creds=3D<id>][,tls-authz=3D<id>][,max-connections=3D<n=
>]
> > > > >    --nbd-server addr.type=3Dunix,addr.path=3D<path>[,tls-creds=3D=
<id>][,tls-authz=3D<id>][,max-connections=3D<n>]
> > > > > +  --nbd-server addr.type=3Dfd,addr.str=3D<fd>[,tls-creds=3D<id>]=
[,tls-authz=3D<id>][,max-connections=3D<n>]
> > > > > =20
> > > > >    is a server for NBD exports. Both TCP and UNIX domain sockets =
are supported.
> > > > > -  TLS encryption can be configured using ``--object`` tls-creds-=
* and authz-*
> > > > > -  secrets (see below).
> > > > > +  A listen socket can be provided via file descriptor passing (s=
ee Examples
> > > > > +  below). TLS encryption can be configured using ``--object`` tl=
s-creds-* and
> > > > > +  authz-* secrets (see below).
> > > > > =20
> > > > >    To configure an NBD server on UNIX domain socket path ``/tmp/n=
bd.sock``::
> > > > > =20
> > > > > @@ -127,6 +129,38 @@ QMP commands::
> > > > >        --chardev socket,path=3Dqmp.sock,server,nowait,id=3Dchar1 =
\
> > > > >        --monitor chardev=3Dchar1
> > > > > =20
> > > > > +Launch the daemon from Python with a QMP monitor socket using fi=
le descriptor
> > > > > +passing so there is no need to busy wait for the QMP monitor to =
become
> > > > > +available::
> > > > > +
> > > > > +  #!/usr/bin/env python3
> > > > > +  import os
> > > > > +  import subprocess
> > > > > +  import socket
> > > > > +
> > > > > +  sock_path =3D '/tmp/qmp-{}.sock'.format(os.getpid())
> > > >=20
> > > > Not sure how much you worry about the insecure / easily guessable t=
mp
> > > > path here.  I notice that there's already one in the surrounding
> > > > documentation (/tmp/nbd.sock) so maybe it's not a problem :-)
> > > >=20
> > > > > +  with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as list=
en_sock:
> > > > > +      listen_sock.bind(sock_path)
> > > > > +      listen_sock.listen()
> > > > > +
> > > > > +      fd =3D listen_sock.fileno()
> > > > > +
> > > > > +      subprocess.Popen(
> > > > > +          ['qemu-storage-daemon',
> > > > > +           '--chardev', f'socket,fd=3D{fd},server=3Don,id=3Dchar=
1',
> > > > > +           '--monitor', 'chardev=3Dchar1'],
> > > > > +          pass_fds=3D[fd],
> > > > > +      )
> > > > > +
> > > > > +  qmp_sock =3D socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
> > > > > +  qmp_sock.connect(sock_path)
> > > >=20
> > > > A note that the order of opening the sockets is slightly different
> > > > from how I did it in the interop test.  But I believe it makes no
> > > > difference, as long as you don't connect to the socket until it's i=
n
> > > > the listening state, which is what you're doing here.  So it should=
 be
> > > > fine.
> > >=20
> > > Nothing here is closing listen_sock in the parent though.
> > >=20
> > > The trick of passing the listener FD into the child relies on the
> > > listener being closed in the parent, so that the parent can get
> > > a socket error if the child exits abnormally during startup. Keeping
> > > the listen socket open means the parent will wait forever for an
> > > accept() that never comes.
> >=20
> > The listen socket is closed by the context manager at the end of the
> > 'with' statement. This is the modern Python approach for resource
> > acquisition that also handles exceptions automatically. It's like RAII
> > in C++.
>=20
> Hmm, yes, I didn't remember that at first. I'm not sure that is a good
> idea as an example code, because people mapping this example into other
> languages are likely to miss that critical detail.

Let's keep the Pythonic code but add a comment that makes this clear.

Stefan

--TqitT7muMUXnxwlF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA9IhoACgkQnKSrs4Gr
c8g2rQf/R8fWIVNg/hTpclRsnPlqx61lOtKifT3BldLKGEZN+0D23rFXMI345X7C
iUefeN9e/odAXho8XicNIPc5QX2FoRx2mYzgO+sUwthMQk6YLOkmJr7L73qJLLcA
7t60jEQUxQkpu/Tds/D0BdiFa0ct/slLp/35owkEbgdkXZdevLtH+UPIDEqKo8Yj
rANBjaazvdMXTNhe4/M52g4Y2amKdTPX594PTcm2PK3c4oLhKCK9feqwbmfJg5LS
wtQQV8uciRH4iyHCWbNl7O8cpMRZYz+Nf6Icd4ItYN+tQrCnrgkv7oORsrJJoFIO
UnORFqcV1Maaq6L/dneetSarR3if+g==
=p/8i
-----END PGP SIGNATURE-----

--TqitT7muMUXnxwlF--


