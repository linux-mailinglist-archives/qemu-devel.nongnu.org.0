Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA7F36056E
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 11:16:05 +0200 (CEST)
Received: from localhost ([::1]:47754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWy6W-0004ba-7a
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 05:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWy4x-00047l-LC
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 05:14:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWy4u-0008TE-IG
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 05:14:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618478063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l6BF1azfV5tGWgLRhxszOUt2XmUfOPPGkUgmN1Rw1OE=;
 b=ZnQQEqUZHHJrXsNwX/MaG+s1P5YLEP8+qeuX68AXZ8Cwq8gqFyJ+4iQCk8RWUONVRJ2xhF
 wEISJt5Vlu0IC1X8pocE7sWDBZD7HTPdpnZiRl0CCvpDY8gz1VKZfcUWkfTtUvbiSbGQxl
 +8ByQYJReSt9PPLfMWSwy7RX9iFTlr4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-IVwqxobXObiuDLuTGDMinw-1; Thu, 15 Apr 2021 05:14:19 -0400
X-MC-Unique: IVwqxobXObiuDLuTGDMinw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 763201006C82
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 09:14:18 +0000 (UTC)
Received: from localhost (ovpn-114-209.ams2.redhat.com [10.36.114.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0513F5D9DE;
 Thu, 15 Apr 2021 09:14:16 +0000 (UTC)
Date: Thu, 15 Apr 2021 10:14:15 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH RFC 3/7] protocol: generic async message-based protocol
 loop
Message-ID: <YHgD52cqe/gSoa8X@stefanha-x1.localdomain>
References: <20210413155553.2660523-1-jsnow@redhat.com>
 <20210413155553.2660523-4-jsnow@redhat.com>
 <YHX4dTmEgNal6Jca@stefanha-x1.localdomain>
 <cf8c94de-e2fe-2416-7062-cc6991149d45@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cf8c94de-e2fe-2416-7062-cc6991149d45@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NyIWghvMyGHZWYNl"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: armbru@redhat.com, crosa@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--NyIWghvMyGHZWYNl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2021 at 01:29:40PM -0400, John Snow wrote:
> On 4/13/21 4:00 PM, Stefan Hajnoczi wrote:
> > On Tue, Apr 13, 2021 at 11:55:49AM -0400, John Snow wrote:
> One of the reasons it's split out here like this is because I also wrote =
a
> qtest protocol that uses the same infrastructure. I tried to keep both of
> those looking as simple as possible.

If infrastructure is needed, let's add it when it's needed but not
before then. Reviewers can't take into account qtest requirements
without seeing that code.

> > > +        try:
> > > +            await self._new_session(self._do_accept(address, ssl))
> > > +        except Exception as err:
> > > +            emsg =3D "Failed to accept incoming connection"
> > > +            self.logger.error("%s:\n%s\n", emsg, pretty_traceback())
> > > +            raise ConnectError(f"{emsg}: {err!s}") from err
> >=20
> > Wrapping the exception in ConnectError() obfuscates what's going on IMO=
.
> >=20
>=20
> It can. I will admit to you that the reason I did it was so that at a hig=
her
> level it was possible to write things like:
>=20
> try:
>     await qmp.connect(('127.0.0.1', 1234))
> except ConnectError:
>     print("Oh no! ...")
>     handle_connect_problem()
>=20
> while still allowing for other problems to "bubble up", for instance,
> keyboard interrupts are BaseException and won't be caught by that wrapper=
.

That's what "except Exception as err" is for. It allows system exiting
exceptions through.

> I adhere to this pattern fairly regularly in this draft; using "container=
"
> exceptions to declare a semantic problem regardless of the actual underly=
ing
> cause, assuming that a high-level user will (probably) be unable to make
> sense of the internal details anyway.
>=20
> Part of the reason I do this is so that I could write in the docstrings w=
hat
> exceptions we actually expect to be raised and under what circumstances.
>=20
> I suppose what I don't document, though, is how to get at the "root"
> exception in these cases. You can do it:
>=20
> try:
>     ...
> except Foo as err:
>     root_err =3D err.__cause__
>     ...
>=20
>=20
> I suppose the specific problem I wanted to solve is this: When we fail to
> connect, what exception will we see? How many types of exceptions? Which
> ones should I try to catch, and which ones should I not? Which error clas=
ses
> merit a retry, and which do not?
>=20
> It seemed almost impossible to enumerate, so writing informed client code
> seemed difficult or impossible.
>=20
> Any thoughts on this perception?

I reviewed error.py again. I was assuming the other exceptions are like
ConnectError, which would have been bad but they seem to be more
actionable. I think ConnectError is okay as a catch-all here.

requests is similar, its exceptions consist mostly of actionable
exceptions but it does have catch-all exceptions for general networking
errors:
https://docs.python-requests.org/en/latest/api/#exceptions

MultiException and the 4-level exception inheritance hierarchy in
error.py still seem complex. Is it really necessary to have
ProtocolError, RawProtocolError, and MsgProtocolError abstract classes?
Having them forces the user to make extra decisions about how to catch
exceptions. If error handling is involved, more mistakes will be made.

The requests package doesn't document the exception hierarchy. They keep
it simple with a flat list of exceptions. (RequestException is the base
class though.)

Stefan

--NyIWghvMyGHZWYNl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmB4A+cACgkQnKSrs4Gr
c8hDtwgAqb0bK6FYUsrNMmwp8C+ds4r5Bgo02UtNSm8rVCYmZeyvIWjTV/OM2Ri7
DeSG8FoV+7RWQ25JNueWTPk700Pj9HcjHl/FqCoC/3xut3jrTDS8Xb7W5YcMWno7
ZJWi2Bv6tBKG8EsmFFhiTWoFuxdP9dXtJLr7kbC6Zzh7xVadR6QPpAamDUMH96N9
KnPUsPPxSggKh62sUPRG8c8FGjuwpoWCvYCtPt1TED2rPyTX8bkPrLsoupbaIooG
DeWhYx+3PRT+vvUHbXNqb2Ag02O9NciRg/c12DerCwiCH+AW7sJo2GGl4cLR2X0Y
0jEGBSbqCoVtSDrX941ZTHeABsL4uw==
=WWqz
-----END PGP SIGNATURE-----

--NyIWghvMyGHZWYNl--


