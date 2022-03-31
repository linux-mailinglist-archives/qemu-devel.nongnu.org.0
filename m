Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 007114EDE70
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 18:10:30 +0200 (CEST)
Received: from localhost ([::1]:52324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZxNW-0007s5-4L
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 12:10:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZxLi-0006uf-W3
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 12:08:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZxLh-0007NY-3f
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 12:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648742916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=33J2MgMlA4fdMBfyUxxyE8jorwMLgBnnmNhWrt6PJoI=;
 b=BToejBsoDdlzIdCeP55uNeseOZac6YIQRoa8UD3PIgabs4sfYsR5ilcfWEsRXlqjd1vJ5p
 JfflNRRVy9qqLCTq6dEwMG2Kpl8P3EURaXmnMkEpZlVDssyHuY5cGFWUxrxo5LAT992Wtv
 ScJef8ldfBjfMKTArdZMz5VdKIWoaCg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-_lIHuUf6NQeoIhcsw_jvRg-1; Thu, 31 Mar 2022 12:08:30 -0400
X-MC-Unique: _lIHuUf6NQeoIhcsw_jvRg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5801185A794;
 Thu, 31 Mar 2022 16:08:29 +0000 (UTC)
Received: from localhost (unknown [10.39.194.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33CC45E6024;
 Thu, 31 Mar 2022 16:08:28 +0000 (UTC)
Date: Thu, 31 Mar 2022 17:08:27 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 1/5] trace: fix compilation with lttng-ust >= 2.13
Message-ID: <YkXR+11BLUM6PY73@stefanha-x1.localdomain>
References: <20220328084717.367993-1-marcandre.lureau@redhat.com>
 <20220328084717.367993-2-marcandre.lureau@redhat.com>
 <YkRHzqi0y/dA1Ptw@stefanha-x1.localdomain>
 <CAMxuvawDUbHkPwdgk8SnCFXe4mNDVRo5ah1BtQDGEsJjzNFDQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RtXDO1ZntL55U+ZN"
Content-Disposition: inline
In-Reply-To: <CAMxuvawDUbHkPwdgk8SnCFXe4mNDVRo5ah1BtQDGEsJjzNFDQw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Beniamino Galvani <b.galvani@gmail.com>,
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--RtXDO1ZntL55U+ZN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2022 at 07:45:48PM +0400, Marc-Andr=E9 Lureau wrote:
> Hi
>=20
> On Wed, Mar 30, 2022 at 4:06 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> >
> > On Mon, Mar 28, 2022 at 12:47:13PM +0400, marcandre.lureau@redhat.com w=
rote:
> > > From: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> > >
> > > On Fedora 36, with lttng-ust 2.13.1, compilation fails with:
> > >
> > > In file included from trace/trace-ust-all.h:49085,
> > >                  from trace/trace-ust-all.c:13:
> > > /usr/include/lttng/tracepoint-event.h:67:10: error: #include expects =
"FILENAME" or <FILENAME>
> > >    67 | #include LTTNG_UST_TRACEPOINT_INCLUDE
> > >       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >
> > > In lttng-ust commit 41858e2b6e8 ("Fix: don't do macro expansion in
> > > tracepoint file name") from 2012, starting from lttng-ust 2.1, the API
> > > was changed to expect TRACEPOINT_INCLUDE to be defined as a string.
> > >
> > > In lttng-ust commit d2966b4b0b2 ("Remove TRACEPOINT_INCLUDE_FILE
> > > macro"), in 2021, the compatibility macro was removed.
> > >
> > > Use the "new" API from 2012, and bump the version requirement to 2.1 =
to
> > > fix compilation with >=3D 2.13.
> > >
> > > According to repology, all distributions we support have >=3D 2.1 (ce=
ntos
> > > 8 has oldest with 2.8.1 afaict)
> > >
> > > Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> > > ---
> > >  meson.build                              | 4 ++--
> > >  scripts/tracetool/format/ust_events_h.py | 4 ++--
> > >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > Thank you!
> >
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> Given that there is a dependency bump, would you rather wait for 7.1
> or do you think it should be included in 7.0? I think the latter
> should be safe.

Yes, since you've investigated the minimum version available across
supported distros I think we can apply this patch.

Thanks,
Stefan

--RtXDO1ZntL55U+ZN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJF0fsACgkQnKSrs4Gr
c8hxYwf9GYANnSUaDHYSGV10yRSMbXipDyCC2tf3kzIrfRs8e6aJne7Vmp7kfFfH
yQSridM09VRecS9LpVmAs4Ymq0+SDBlpPYxwGNDbOZ8gwMCiSJjRK8U601ioztyz
FWgDRnU1I3abuUPwCGxG3ykAbjzk/fPQY9MQHUArkjjwHwYKOJgbw5D5iYguDWNg
0KWgZ+z/pQYU8Ij7Ig4SgegDH/ShYYZqyLGmEN1SmcMiQv9je+uPjtthSrhgKlxv
q+WWWnLetUF0lK171aiqWr34fKk1V5j/yPlqwnrB8tokiD3I+bUoDSAwdnYXzWL8
WgdEpj3PlXcgO5nPu4dRfCtGVe55MQ==
=odSJ
-----END PGP SIGNATURE-----

--RtXDO1ZntL55U+ZN--


