Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C593B011D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:16:27 +0200 (CEST)
Received: from localhost ([::1]:44534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvdSE-0008GA-Sp
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lvdQ5-0005um-1e
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:14:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lvdQ1-0003Io-Hc
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:14:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624356848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FhSashmGI6jL09BlPei0WZX0SO6Tloa+IVuw/Vknw6U=;
 b=Ly5us1a8+DYHxbrmD8MJRRZlAxxmeWwHbcnpgVNGZnhjQlD2zRp7ExkVWpKKbCVqwSPjOB
 n0vpIIg9Pyy2opuSGHO3qvZMG4YifzBPLV5G8JPBeMWf2+dKa90znImpuJRvWWt28TE7Vn
 ldfK/NUVfbSu62YnjqTfQ4McgSTRUXw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-4CK8ehe2OCepehIrLPk7PQ-1; Tue, 22 Jun 2021 06:14:04 -0400
X-MC-Unique: 4CK8ehe2OCepehIrLPk7PQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A475519057A4;
 Tue, 22 Jun 2021 10:14:03 +0000 (UTC)
Received: from localhost (ovpn-114-192.ams2.redhat.com [10.36.114.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E96915D9DE;
 Tue, 22 Jun 2021 10:13:59 +0000 (UTC)
Date: Tue, 22 Jun 2021 11:13:58 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH RESEND] docs: clarify absence of set_features in vhost-user
Message-ID: <YNG35ojC5SeYQ3Nq@stefanha-x1.localdomain>
References: <20210325144846.17520-1-hi@alyssa.is> <87sg4a1dzl.fsf@linaro.org>
 <87y2b8ecwo.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87y2b8ecwo.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lW4ECiSoNxEkwXxC"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Alyssa Ross <hi@alyssa.is>, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--lW4ECiSoNxEkwXxC
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 17, 2021 at 04:19:26PM +0100, Alex Benn=E9e wrote:
>=20
> Alex Benn=E9e <alex.bennee@linaro.org> writes:
>=20
> > Alyssa Ross <hi@alyssa.is> writes:
> >
> >> The previous wording was (at least to me) ambiguous about whether a
> >> backend should enable features immediately after they were set using
> >> VHOST_USER_SET_PROTOCOL_FEATURES, or wait for support for protocol
> >> features to be acknowledged if it hasn't been yet before enabling
> >> those features.
> >>
> >> This patch attempts to make it clearer that
> >> VHOST_USER_SET_PROTOCOL_FEATURES should immediately enable features,
> >> even if support for protocol features has not yet been acknowledged,
> >> while still also making clear that the frontend SHOULD acknowledge
> >> support for protocol features.
> >>
> >> Previous discussion begins here:
> >> <https://lore.kernel.org/qemu-devel/87sgd1ktx9.fsf@alyssa.is/>
> >
> > I totally missed this when I posted a similar attempt at clarification:
> >
> >   Subject: [PATCH v2] vhost-user.rst: add clarifying language about pro=
tocol negotiation
> >   Date: Wed,  3 Mar 2021 14:50:11 +0000
> >   Message-Id: <20210303145011.14547-1-alex.bennee@linaro.org>
> >
> >>
> >> Cc: Michael S. Tsirkin <mst@redhat.com>
> >> Signed-off-by: Alyssa Ross <hi@alyssa.is>
> >> ---
> >>  docs/interop/vhost-user.rst | 14 +++++++++-----
> >>  1 file changed, 9 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> >> index d6085f7045..c42150331d 100644
> >> --- a/docs/interop/vhost-user.rst
> >> +++ b/docs/interop/vhost-user.rst
> >> @@ -871,9 +871,9 @@ Master message types
> >>    ``VHOST_USER_GET_FEATURES``.
> >> =20
> >>  .. Note::
> >> -   Slave that reported ``VHOST_USER_F_PROTOCOL_FEATURES`` must
> >> -   support this message even before ``VHOST_USER_SET_FEATURES`` was
> >> -   called.
> >> +   While QEMU should acknowledge ``VHOST_USER_F_PROTOCOL_FEATURES``, =
a
> >> +   backend must allow ``VHOST_USER_GET_PROTOCOL_FEATURES`` even if
> >> +   ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been acknowledged yet.
> >> =20
> >>  ``VHOST_USER_SET_PROTOCOL_FEATURES``
> >>    :id: 16
> >> @@ -886,8 +886,12 @@ Master message types
> >>    ``VHOST_USER_GET_FEATURES``.
> >> =20
> >>  .. Note::
> >> -   Slave that reported ``VHOST_USER_F_PROTOCOL_FEATURES`` must suppor=
t
> >> -   this message even before ``VHOST_USER_SET_FEATURES`` was called.
> >> +   While QEMU should acknowledge ``VHOST_USER_F_PROTOCOL_FEATURES``, =
a
> >> +   backend must allow ``VHOST_USER_SET_PROTOCOL_FEATURES`` even if
> >> +   ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been acknowledged yet.
> >> +   The backend must not wait for ``VHOST_USER_SET_FEATURES`` before
> >> +   enabling protocol features requested with
> >> +   ``VHOST_USER_SET_PROTOCOL_FEATURES``.
> >
> > I think this is perfectly fine clarification although I think there
> > might be a patch in flight which changes some of the master slave
> > terminology so with that resolved:
> >
> > Reviewed-by: Alex Benn=E9e <alex.bennee@linaro.org>
> >
> > However there is still the edge case of what happens after the vhost
> > pair have negotiated protocol features like REPLY_ACK should
> > VHOST_USER_F_PROTOCOL_FEATURES still be acknowledged by
> > VHOST_USER_SET_FEATURES.
> >
> > Stefan's proposed wording which I incorporated in my patch made it clea=
r
> > that VHOST_USER_F_PROTOCOL_FEATURES is never exposed to the guest by th=
e
> > VMM due to it's UNUSED status. I would just like it explicit if it need=
s
> > to be preserved between the two sides of the VHOST_USER_*_FEATURES for
> > the negotiated protocol features to remain valid.
> >
> > Perhaps you could incorporate some wording for that?
> >
> >> =20
> >>  ``VHOST_USER_SET_OWNER``
> >>    :id: 3
>=20
> General ping to the vhost-user spec maintainers. This was also mentioned
> while merging:
>=20
>   https://github.com/rust-vmm/vhost/pull/24

Alyssa or Alex: Please send another revision rebased on qemu.git/master.
Michael Tsirkin is the vhost-user.rst maintainer but I can help with
reviewing an updated patch.

Stefan

--lW4ECiSoNxEkwXxC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDRt+YACgkQnKSrs4Gr
c8hPWQgArcZh3t49mlJkFNsWBrElI1AW863b+vM4XIXDflgKfvJMg30dULw25o1n
nGRWyUmX11PYrkk4npLEQoITn4xISVqynxQG43eOSqN0HPtXnPcXrGtdWgHzgjOC
XlO2cX+x5Jb/+RH7bjeUziYe6/VwxXQwtJkVUtSU76QaLepMcPl5G/YB92BfBKG3
cD83rgOCxrQ65X6DlZKuSxg9gZRPkEVQIwjpfr89po6tuhbRW06Opq2t5UgKu3V1
gAQMKaCMHj2evEqntu7PSRwX2zpDwB6PAEVjP/bIK1mLTUuWbdWeJ5aChpkgCCut
OFTXz9aJM+HKL/YiTK++m7BN5c/+NQ==
=VDr/
-----END PGP SIGNATURE-----

--lW4ECiSoNxEkwXxC--


