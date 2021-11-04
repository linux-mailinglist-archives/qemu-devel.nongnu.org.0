Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D395E445780
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 17:50:08 +0100 (CET)
Received: from localhost ([::1]:43212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mifwF-0000io-Hk
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 12:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mifvD-0007pc-Fw
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 12:49:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mifv9-0005Xi-AX
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 12:49:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636044534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jGOsY6pEUDI3nkHGlSmGQPBBWNve3p9Gli2v0sOMYlU=;
 b=EDSXZt3qlbOpybrz2WUbmKM8OYr1pkom58ql8J3GpC30x8lnD8fo4xpyJqr3SWJuwiYTvC
 OqTXk3clMmMoVA3j6nY3dTVRrOutctaWmD23KxCKHBa9EP3HUj3Q1EUeKBHsHztGWN5bVE
 m+vzix0kG7ijsXFhfooVqd3VzUe9S1w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-DHgSSPhLMxuWL7TJ_kO3Nw-1; Thu, 04 Nov 2021 12:48:50 -0400
X-MC-Unique: DHgSSPhLMxuWL7TJ_kO3Nw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30B851006AA6;
 Thu,  4 Nov 2021 16:48:49 +0000 (UTC)
Received: from localhost (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8AC5E5D9D3;
 Thu,  4 Nov 2021 16:48:31 +0000 (UTC)
Date: Thu, 4 Nov 2021 16:48:30 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 03/12] vfio-user: define vfio-user-server object
Message-ID: <YYQO3nQUmTto5zKn@stefanha-x1.localdomain>
References: <cover.1633929457.git.jag.raman@oracle.com>
 <13dba991f1de91711e5c3cad9a332d6e7c5eee7b.1633929457.git.jag.raman@oracle.com>
 <YXly2vSh/bhgr0i/@stefanha-x1.localdomain>
 <6346833B-469B-487B-8382-62EA03BA56C2@oracle.com>
 <YX/Cx7g0D5o8dVtp@stefanha-x1.localdomain>
 <87wnloce5t.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87wnloce5t.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wKS/4iOTpb4wbZfD"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "thuth@redhat.com" <thuth@redhat.com>, Jag Raman <jag.raman@oracle.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--wKS/4iOTpb4wbZfD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 04, 2021 at 01:13:02PM +0100, Markus Armbruster wrote:
> Stefan Hajnoczi <stefanha@redhat.com> writes:
>=20
> > On Fri, Oct 29, 2021 at 02:42:49PM +0000, Jag Raman wrote:
> >> > On Oct 27, 2021, at 11:40 AM, Stefan Hajnoczi <stefanha@redhat.com> =
wrote:
> >> > On Mon, Oct 11, 2021 at 01:31:08AM -0400, Jagannathan Raman wrote:
> >> >> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
> >> >> new file mode 100644
> >> >> index 0000000000..c2a300f0ff
> >> >> --- /dev/null
> >> >> +++ b/hw/remote/vfio-user-obj.c
> >> >> @@ -0,0 +1,173 @@
> >> >> +/**
> >> >> + * QEMU vfio-user-server server object
> >> >> + *
> >> >> + * Copyright =C2=A9 2021 Oracle and/or its affiliates.
> >> >> + *
> >> >> + * This work is licensed under the terms of the GNU GPL-v2, versio=
n 2 or later.
> >> >> + *
> >> >> + * See the COPYING file in the top-level directory.
> >> >> + *
> >> >> + */
> >> >> +
> >> >> +/**
> >> >> + * Usage: add options:
> >> >> + *     -machine x-remote
> >> >> + *     -device <PCI-device>,id=3D<pci-dev-id>
> >> >> + *     -object vfio-user-server,id=3D<id>,type=3Dunix,path=3D<sock=
et-path>,
> >> >=20
> >> > I expected socket.type=3D and socket.path=3D based on the QAPI schem=
a. Is
> >> > this command-line example correct?
> >>=20
> >> When I tried the =E2=80=9Csocket.path=E2=80=9D approach, QEMU was not =
able to parse the
> >> arguments. So I had to break it down to a series of individual members=
.
> >>=20
> >> If =E2=80=9Csocket.path=E2=80=9D is the expected way, I=E2=80=99ll see=
 why the parser is not working
> >> as expected.=20
> >
> > CCing Markus regarding QAPI.
> >
> > I'm surprised because the QAPI schema for vfio-user-server objects is:
> >
> >   { 'struct': 'VfioUserServerProperties',
> >     'data': { 'socket': 'SocketAddress', 'device': 'str' } }
> >
> > It's not clear to me why the command-line parser flattens the 'socket'
> > field into its 'type' and 'path' sub-fields in your example:
> >
> >   -object vfio-user-server,id=3D<id>,type=3Dunix,path=3D<socket-path>,d=
evice=3D<pci-dev-id>
> >
> > Maybe because SocketAddress is an enum instead of a struct?
> >
> > Imagine a second SocketAddress field is added to vfio-user-server. How
> > can the parser know which field 'type' and 'path' belong to? I tried it=
:
> >
> >   { 'struct': 'VfioUserServerProperties',
> >     'data': { 'socket': 'SocketAddress', 'socket2': 'SocketAddress', 'd=
evice': 'str' } }
> >
> > Now the parser refuses any input I've tried. For example:
> >
> >   $ build/qemu-system-x86_64 -object vfio-user-server,id=3Ds,device=3Da=
sdf,type=3Dunix,path=3Dasdf,type=3Dunix
> >   qemu-system-x86_64: -object vfio-user-server,id=3Ds,device=3Dasdf,typ=
e=3Dunix,path=3Dasdf,type=3Dunix: Parameter 'type' is missing
> >
> > A similar case happens if the parent struct has 'type' or 'path' fields=
.
> > They collide with the SocketAddress union fields. I didn't test this
> > though.
> >
> > Questions for Markus:
> > 1. Do you know why the parser behaves like this?
>=20
> Yes: backward compatibility.
>=20
> The straightforward way to do a QAPI-based command line option uses
> qobject_input_visitor_new_str(), which parses either JSON or dotted
> keys, and returns the result wrapped in the appropriate QObject visitor.
>=20
> The JSON syntax is derived from the QAPI schema just like for QMP.  For
> the VfioUserServerProperties shown above, it's something like
>=20
>     {"socket": {"type": "unix", "path": "dir/socket"}, "device" "mumble"}
>=20
> I did not check my derivation by feeding it to QEMU.  Beware of
> screwups.
>=20
> The dotted keys syntax is derived from the JSON syntax as described in
> keyval.c.  For the JSON above, it should be
>=20
>     socket.type=3Dunix,socket.path=3Ddir/socket,device=3Dmumble
>=20
> When we QAPIfy an existing option instead of adding a new QAPI-based
> one, we have an additional problem: the dotted keys syntax has to match
> the old syntax (the JSON syntax is all new, so no problem there).
>=20
> The old syntax almost always has its quirks.  Ideally, we'd somehow get
> from quirky old to boring new in an orderly manner.  Sadly, we still
> don't have good solutions for that.  To make progress, we commonly
> combine JSON new with quirky old.
>=20
> qemu-system-FOO -object works that way.  object_option_parse() parses
> either JSON or QemuOpts.  It wraps the former in a QObject visitor, and
> the latter in an opts visitor.
>=20
> QemuOpts is flat by design[*], so the opts visitor parses flat QemuOpts
> from a (possibly non-flat) QAPI type.  How exactly it flattens, and how
> it handles clashes I don't remember.
>=20
> Sadly, this means that we get quirky old even for new object types.
>=20
> Questions?
>=20
> > 2. Is it good practice to embed SocketAddress into parent structs or
> >    should we force it into a struct?
>=20
> I'm not sure I got your question.  An example might help.

I think Question 2 isn't relevant anymore.

Thanks for the explanation!

> [*] You can play games with dotted keys to simulate nesting, but the
> opts visitor predates all that.
>=20

--wKS/4iOTpb4wbZfD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGEDt4ACgkQnKSrs4Gr
c8jAlgf9F7kEac9LOGtvzr7Ycj4Vmq0TV8x7TFf5f7BHrAQQwABuGzRfKVW2Anih
cvMe/gdmyKHAckKScRMEllUPUdbkTCTQQowZwfPLugkelfIj7YPLMFPcPpjjxRyV
f5xmIVMraGSNSyICRaY7cdfbGopik5cQWRstXWoga8Urk/dQgi1Ceah1mXRgUzEC
Z9sxcnIyGYhoTZPqqTmUfpixlwSTRXU0t/qbq8EBswrKpAJPO8WhRpTCfPbVsdrH
wJ3x4ivOpvwjZYHVkzS0FShdrqVOWQQNrOe9dkI4zeD+MfVhX6FAiHggmtODiE/J
BtDz9cIEsgtG2REEiw2k8kZkXDJNzA==
=aatr
-----END PGP SIGNATURE-----

--wKS/4iOTpb4wbZfD--


