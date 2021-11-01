Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A79AA441A09
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 11:37:42 +0100 (CET)
Received: from localhost ([::1]:55370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhUhB-0004h8-ON
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 06:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mhUej-0002Kg-4l
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:35:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mhUee-0003XY-2R
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:35:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635762902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UcnOXXiFU7VISMVVErqlaATJPJKb1zICDskpnoTXODE=;
 b=Jd5vyl7avZIpNknmGIspXZZyX/pLAtWRrENpGxKupD/40GTn5KwvBWdrklyyrxkjRDfFel
 FSWCp7NF/DlY5sl4LjkIMvkOwdSXp2mriraKxguGo1N8ph+PEigFwsIJgW0jRv5la6+WNt
 YmeKhA82Da5sJAi3lF9V1NkBxITnsMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-e-ws1lGvNdKgk1zQ66DPZA-1; Mon, 01 Nov 2021 06:34:59 -0400
X-MC-Unique: e-ws1lGvNdKgk1zQ66DPZA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5FE610B3940;
 Mon,  1 Nov 2021 10:34:57 +0000 (UTC)
Received: from localhost (unknown [10.39.192.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80DCF1816A;
 Mon,  1 Nov 2021 10:34:48 +0000 (UTC)
Date: Mon, 1 Nov 2021 10:34:47 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v3 03/12] vfio-user: define vfio-user-server object
Message-ID: <YX/Cx7g0D5o8dVtp@stefanha-x1.localdomain>
References: <cover.1633929457.git.jag.raman@oracle.com>
 <13dba991f1de91711e5c3cad9a332d6e7c5eee7b.1633929457.git.jag.raman@oracle.com>
 <YXly2vSh/bhgr0i/@stefanha-x1.localdomain>
 <6346833B-469B-487B-8382-62EA03BA56C2@oracle.com>
MIME-Version: 1.0
In-Reply-To: <6346833B-469B-487B-8382-62EA03BA56C2@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5Dl9VgW+VMc/PSfq"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.736,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "philmd@redhat.com" <philmd@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--5Dl9VgW+VMc/PSfq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 29, 2021 at 02:42:49PM +0000, Jag Raman wrote:
> > On Oct 27, 2021, at 11:40 AM, Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> > On Mon, Oct 11, 2021 at 01:31:08AM -0400, Jagannathan Raman wrote:
> >> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
> >> new file mode 100644
> >> index 0000000000..c2a300f0ff
> >> --- /dev/null
> >> +++ b/hw/remote/vfio-user-obj.c
> >> @@ -0,0 +1,173 @@
> >> +/**
> >> + * QEMU vfio-user-server server object
> >> + *
> >> + * Copyright =C2=A9 2021 Oracle and/or its affiliates.
> >> + *
> >> + * This work is licensed under the terms of the GNU GPL-v2, version 2=
 or later.
> >> + *
> >> + * See the COPYING file in the top-level directory.
> >> + *
> >> + */
> >> +
> >> +/**
> >> + * Usage: add options:
> >> + *     -machine x-remote
> >> + *     -device <PCI-device>,id=3D<pci-dev-id>
> >> + *     -object vfio-user-server,id=3D<id>,type=3Dunix,path=3D<socket-=
path>,
> >=20
> > I expected socket.type=3D and socket.path=3D based on the QAPI schema. =
Is
> > this command-line example correct?
>=20
> When I tried the =E2=80=9Csocket.path=E2=80=9D approach, QEMU was not abl=
e to parse the
> arguments. So I had to break it down to a series of individual members.
>=20
> If =E2=80=9Csocket.path=E2=80=9D is the expected way, I=E2=80=99ll see wh=
y the parser is not working
> as expected.=20

CCing Markus regarding QAPI.

I'm surprised because the QAPI schema for vfio-user-server objects is:

  { 'struct': 'VfioUserServerProperties',
    'data': { 'socket': 'SocketAddress', 'device': 'str' } }

It's not clear to me why the command-line parser flattens the 'socket'
field into its 'type' and 'path' sub-fields in your example:

  -object vfio-user-server,id=3D<id>,type=3Dunix,path=3D<socket-path>,devic=
e=3D<pci-dev-id>

Maybe because SocketAddress is an enum instead of a struct?

Imagine a second SocketAddress field is added to vfio-user-server. How
can the parser know which field 'type' and 'path' belong to? I tried it:

  { 'struct': 'VfioUserServerProperties',
    'data': { 'socket': 'SocketAddress', 'socket2': 'SocketAddress', 'devic=
e': 'str' } }

Now the parser refuses any input I've tried. For example:

  $ build/qemu-system-x86_64 -object vfio-user-server,id=3Ds,device=3Dasdf,=
type=3Dunix,path=3Dasdf,type=3Dunix
  qemu-system-x86_64: -object vfio-user-server,id=3Ds,device=3Dasdf,type=3D=
unix,path=3Dasdf,type=3Dunix: Parameter 'type' is missing

A similar case happens if the parent struct has 'type' or 'path' fields.
They collide with the SocketAddress union fields. I didn't test this
though.

Questions for Markus:
1. Do you know why the parser behaves like this?
2. Is it good practice to embed SocketAddress into parent structs or
   should we force it into a struct?

Stefan

--5Dl9VgW+VMc/PSfq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF/wscACgkQnKSrs4Gr
c8jJswf+PpzFei9WIr6MQ8HHScLg01Ltn4c6LLbGq3zN4mJgXzHiboZ5NJZmBB0y
rXwQabcQWL6YXyswSGLcUpEq2+Q2m+fcR7NyGIGraRgFBdycZU7TV6sqxKTNZmHW
Lfz14rYhPbFznWBlel3vIoVJR0X9x5G71E7bEd/2fRlPo2D+vM9zsaQVXAEELGXb
96J9ncotPzNwaGUAi52aj9/WxUQzmGfTeejPvc1hkDUESwuAF2BUmgQ+Be2wY3Ie
/fO8lTKqq7DH0eRuVkphUNCMnv2mQ5oQNaUGo6PLrNPQttRiKSJUQ+YZvxIUeWuU
jO5evPdcBm6AcVoVlfOsXY6t5QR8uw==
=nkoY
-----END PGP SIGNATURE-----

--5Dl9VgW+VMc/PSfq--


