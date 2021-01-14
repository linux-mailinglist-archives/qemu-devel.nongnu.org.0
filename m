Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3646D2F6238
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:42:43 +0100 (CET)
Received: from localhost ([::1]:50362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02te-0008Fm-8d
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:42:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l02sA-0006WO-Ia
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:41:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l02s8-000786-KS
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:41:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610631667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H5Rf7St9TZBSJPhoq6iSIBlxSAPZpwhADSOxkpPT140=;
 b=bfFZlqt/wMT0TwBtUFzANyppd4WU0M4njfMni5TDMFij/xYpfjn7RwCa7UTDECWktieCmR
 ZQbJT1m/1GgPrvwBiyX1VlmoURDz190nXz84GK2cRso04ZEUIOH7wqOuNygQWZTDDJuJxi
 KAeV3NiIBDULFe8pPJxls18MbHn4OpI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-KTo-MPpnMbeV9WTGpsoQcw-1; Thu, 14 Jan 2021 08:40:53 -0500
X-MC-Unique: KTo-MPpnMbeV9WTGpsoQcw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B03C190A7A2;
 Thu, 14 Jan 2021 13:40:52 +0000 (UTC)
Received: from localhost (ovpn-115-113.ams2.redhat.com [10.36.115.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00FA219C78;
 Thu, 14 Jan 2021 13:40:51 +0000 (UTC)
Date: Thu, 14 Jan 2021 13:40:50 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [qemu-web PATCH v2] Use GitLab repo URLs instead of git.qemu.org
 URLs
Message-ID: <20210114134050.GB299876@stefanha-x1.localdomain>
References: <20210113185403.276395-1-stefanha@redhat.com>
 <407faef7-934e-2744-2837-590bc192ff12@redhat.com>
MIME-Version: 1.0
In-Reply-To: <407faef7-934e-2744-2837-590bc192ff12@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="V0207lvV8h4k8FAm"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 10:42:59AM +0100, Thomas Huth wrote:
> On 13/01/2021 19.54, Stefan Hajnoczi wrote:
> > Switch to GitLab repo URLs to reduce qemu.org bandwidth.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> > v2:
> >   * Added missing URL in _posts/2018-06-28-tcg-testing.md. Mark
> >     Cave-Ayland <mark.cave-ayland@ilande.co.uk> and Alex Benn=E9e
> >     <alex.bennee@linaro.org> figured out the issue was that the gitweb
> >     link referenced a blob object (not a commit) whereas GitLab needs t=
he
> >     commit object. Therefore the hash hash in the URL has changed.
> > ---
> >   _download/source.html                           | 4 ++--
> >   _posts/2017-02-04-the-new-qemu-website-is-up.md | 8 ++++----
> >   _posts/2017-10-04-qemu-2-10-1.md                | 4 ++--
> >   _posts/2018-02-09-understanding-qemu-devices.md | 2 +-
> >   _posts/2018-06-28-tcg-testing.md                | 4 ++--
> >   contribute.md                                   | 2 +-
> >   contribute/security-process.md                  | 4 ++--
> >   documentation.md                                | 2 +-
> >   support.md                                      | 2 +-
> >   9 files changed, 16 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/_download/source.html b/_download/source.html
> > index 5798633..14fb6dc 100644
> > --- a/_download/source.html
> > +++ b/_download/source.html
> > @@ -9,7 +9,7 @@
> >   =09{% include releases.html %}
> >   =09</div>
> >   =09<p>or stay on the bleeding edge with the
> > -=09   <a href=3D"https://git.qemu.org/?p=3Dqemu.git">git repository!</=
a></p>
> > +=09   <a href=3D"https://gitlab.com/qemu-project/qemu.git">git reposit=
ory!</a></p>
>=20
> For "clickable" links (i.e. not the URLs used for cloning), I'd suggest t=
o
> drop the ".git" suffix, since there will be a redirection to the suffix-l=
ess
> URL otherwise.
>=20
> If you agree, I can fix it up when picking up the patch, no need to resen=
d
> just because of this.

I don't have a strong opinion either way. I chose this approach because
it results in a clean git clone while also working in a web browser
(with a redirect, as you mentioned).

If you do it the other way then git clone will print a warning, which
seems more distracting than the automatic browser redirect.

Up to you as qemu-web.git maintainer!

Stefan

--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAASeIACgkQnKSrs4Gr
c8jYDQf/aFHNNxCs2dqm1/J4gURgL9KqOPR51QVyeab9F+trcbBqO4Tr2Amjog4V
INGVKs98eTReODj8lspglmjcWNzrHCWKSbj5j2mGnsqnGtKm+uMR7Frslda93LIP
YapfEzcyql6PMNgla0s1b77EV808cyYcONp+ya8jDq6mY+3TUajaC2iBKDnbTdqK
dsemvAa5blSObawCfO7R56L5Xaxd5G2yxKTSXwZsO0QTBiwu5G+Y+KC3SECGTx3l
fny/JME+GZgXkmoRykwyOJ05KCIlXcNT+PTEv15/vqJnzwSY4l0xv26NYPSPyDYx
pLLfg0/8qa11sLPAN8jC2hxV1Ca/2A==
=S9uw
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--


