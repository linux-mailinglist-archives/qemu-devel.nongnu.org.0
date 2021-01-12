Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9E62F36C0
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:14:23 +0100 (CET)
Received: from localhost ([::1]:39114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNFO-0001gL-3G
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:14:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kzN2U-0003Ln-KP
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:01:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kzN2O-0007we-FB
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:01:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610470855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bvjTondmR2XDfCNBElowjMeh856PAZu9guIH1I2ZhRs=;
 b=MQFmIb5oRnSsizJd8/FwbgmwJGSlleRSBxhJi98OPtF0NcFudOJAcihww6gj50KhNXy3UM
 6Kl7OIg2vNVXLzIAgFL8H/SWYcvf3Msxl8aR4s73+QwmRXEPXpcTs5d+OAPq8JyYtgC4le
 5DgczBTccnrqIuokTOzBPvfGzi8UOKM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-GRlOTjyZO6WQI4DrkfWO1A-1; Tue, 12 Jan 2021 12:00:52 -0500
X-MC-Unique: GRlOTjyZO6WQI4DrkfWO1A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DEDC1081B2C;
 Tue, 12 Jan 2021 17:00:51 +0000 (UTC)
Received: from localhost (ovpn-115-99.ams2.redhat.com [10.36.115.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 384195D762;
 Tue, 12 Jan 2021 17:00:51 +0000 (UTC)
Date: Tue, 12 Jan 2021 17:00:50 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v2 3/3] trace: recommend "log" backend for getting
 started with tracing
Message-ID: <20210112170050.GB203591@stefanha-x1.localdomain>
References: <20201216160923.722894-1-stefanha@redhat.com>
 <20201216160923.722894-4-stefanha@redhat.com>
 <CAFEAcA8_cFGtU=_6a7XzD6ky-fvn1k9_usjaKrwjBxAP2Ls3Yg@mail.gmail.com>
 <8b81184b-b0b6-2b1b-62c-8de94c279e70@eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <8b81184b-b0b6-2b1b-62c-8de94c279e70@eik.bme.hu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="v9Ux+11Zm5mwPlX6"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--v9Ux+11Zm5mwPlX6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 31, 2020 at 09:36:50PM +0100, BALATON Zoltan wrote:
> On Thu, 31 Dec 2020, Peter Maydell wrote:
> > On Wed, 16 Dec 2020 at 16:09, Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> > >=20
> > > The "simple" backend is actually more complicated to use than the "lo=
g"
> > > backend. Update the quickstart documentation to feature the "log"
> > > backend instead of the "simple" backend.
> > >=20
> > > Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > ---
> > >  docs/devel/tracing.rst | 35 ++++++++++++++++++-----------------
> > >  1 file changed, 18 insertions(+), 17 deletions(-)
> > >=20
> > > diff --git a/docs/devel/tracing.rst b/docs/devel/tracing.rst
> > > index 76cc1b24fa..e60058bf55 100644
> > > --- a/docs/devel/tracing.rst
> > > +++ b/docs/devel/tracing.rst
> > > @@ -11,22 +11,22 @@ for debugging, profiling, and observing execution=
.
> > >  Quickstart
> > >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >=20
> > > -1. Build with the 'simple' trace backend::
> > > +Enable tracing of ``memory_region_ops_read`` and ``memory_region_ops=
_write``
> > > +events::
> > >=20
> > > -    ./configure --enable-trace-backends=3Dsimple
> > > -    make
> > > +    $ qemu --trace "memory_region_ops_*" ...
> > > +    ...
> > > +    719585@1608130130.441188:memory_region_ops_read cpu 0 mr 0x562fd=
fbb3820 addr 0x3cc value 0x67 size 1
> > > +    719585@1608130130.441190:memory_region_ops_write cpu 0 mr 0x562f=
dfbd2f00 addr 0x3d4 value 0x70e size 2
> > >=20
> > > -2. Create a file with the events you want to trace::
> > > +This output comes from the "log" trace backend that is enabled by de=
fault when
> > > +``./configure --enable-trace-backends=3DBACKENDS`` was not explicitl=
y specified.
> > >=20
> > > -    echo memory_region_ops_read >/tmp/events
> > > +More than one trace event pattern can be specified by providing a fi=
le
> > > +instead::
> >=20
> > Does --trace really not let you specify more than one pattern
> > without resorting to putting them into a file? That sounds like a
> > deficiency compared to -d (which allows -d trace:PATTERN,trace:PATTERN.=
..)
> > that we could look at fixing...
>=20
> Ir's possible to give more patterns in multiple options, I'm using that,
> such as:
>=20
> -trace enable=3D"pci*" -trace enable=3D"ide*"
>=20
> For a lot of patterns using a file may be clearer though.
>=20
> This reminds me to the plainlog backend I've submitted. What happened to
> that? See:
>=20
> https://lists.nongnu.org/archive/html/qemu-devel/2020-06/msg07296.html
>=20
> I'd like a solution that can be set at compile time and does not need
> another command line option to turn off time stamps. (Timestamps are
> annoyong when comparing logs that's often necessary to check changes.) I'=
m
> still using my plainlog patch but I have to disable that when bisecting.

Thanks for reminding me. I don't remember what happened to that, sorry!

I will revisit the plainlog series and let you know.

Stefan

--v9Ux+11Zm5mwPlX6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/91cIACgkQnKSrs4Gr
c8ghXQgAhAPZKQZ1TIayvs6reojCg5Qx+oEF9Jwk2arIhQ8Emuy1KXZifAviM3Q6
EFDBr9+cTV1oCPphrMVzz4FmImjZkwk8gy6O8kKWKDBIwuq4/ImQI9wlG/+BEij+
dIOG8E9sI+hxmxUQ4OmDvkNyMms6wKWprbEcl59+BGTgBld7Eba4vomKJhNLCftZ
VUuAwAMO0DFrE/fFHfTNDNRunsXxksehfVd54dKTEqJJEUi7tyn/p3HFhmSG+rdf
jVQCNMo2E1j/8ABAmLPYSCKYLq49K64FoDGSo2vYigmb57mETWYJLhnpl8j7YN9+
SVRnW74GhDoxcMs4FaG/0vKI6IFWDQ==
=bd3t
-----END PGP SIGNATURE-----

--v9Ux+11Zm5mwPlX6--


