Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2AE3253A7
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 17:37:35 +0100 (CET)
Received: from localhost ([::1]:56546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFJdu-0007gf-2S
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 11:37:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lFJcH-0006ib-Dc
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 11:35:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lFJcB-0003v9-Kr
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 11:35:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614270946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DCk+iRUEJbfDDf2Ace8CB9/Xcr5J+jAWcnK0qjPgulM=;
 b=jTsw98QbIBKdEnT9pND9wWAOrNxbBhKfEXYFUZGtwsizjA1wF/Ug9U9dZoHk+IbjTHgb21
 dR5HK4WcNjk4Mw9aITl05o5DDGh2ioxjsclmoD6AbC0vl3SByldK3sKoqSNOTIHZ4JjPVW
 HOU7vaudyH72Pip1ULKrGBRcEWyGcDc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-43ln_8AXP8qRVBahJ-6Slw-1; Thu, 25 Feb 2021 11:35:31 -0500
X-MC-Unique: 43ln_8AXP8qRVBahJ-6Slw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70DBF1009634;
 Thu, 25 Feb 2021 16:35:30 +0000 (UTC)
Received: from localhost (ovpn-112-60.ams2.redhat.com [10.36.112.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A6707C1FA;
 Thu, 25 Feb 2021 16:35:28 +0000 (UTC)
Date: Thu, 25 Feb 2021 16:35:27 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] multiprocess: move feature to meson_options.txt
Message-ID: <YDfRz3zhkoTiyoKt@stefanha-x1.localdomain>
References: <20210224122306.451764-1-pbonzini@redhat.com>
 <72fc7d76-f8e3-2c0f-e890-99509bb6230d@redhat.com>
 <e89873e7-d996-0161-8c4f-587aadd2208f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e89873e7-d996-0161-8c4f-587aadd2208f@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ubJ6/4SlK+dEE8oK"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ubJ6/4SlK+dEE8oK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 25, 2021 at 01:15:53PM +0100, Paolo Bonzini wrote:
> On 25/02/21 11:38, Philippe Mathieu-Daud=E9 wrote:
> > On 2/24/21 1:23 PM, Paolo Bonzini wrote:
> > > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > > ---
> > >   configure         | 12 ++++--------
> > >   meson.build       |  9 +++++++--
> > >   meson_options.txt |  2 ++
> > >   3 files changed, 13 insertions(+), 10 deletions(-)
> > ...
> >=20
> > > @@ -2535,6 +2540,7 @@ endif
> > >   summary_info +=3D {'target list':       ' '.join(target_dirs)}
> > >   if have_system
> > >     summary_info +=3D {'default devices':   get_option('default_devic=
es')}
> > > +  summary_info +=3D {'Multiprocess QEMU': multiprocess_allowed}
> >=20
> > Since you are changing this, it is a good opportunity to find a
> > better description to this feature (similarly how we recently clarified
> > the TCI description).
> >=20
> > The current description is confusing with multiprocessing (which is
> > by default on QEMU and every developer want to exploit that).
> >=20
> > So the main multiprocess code resides in hw/remote/mpqemu*.
> >=20
> > I have the impression "monolithic application" is common in
> > software engineering. What about "polylithic QEMU"?
> >=20
> > Stefan once described it as "out of (main) process device emulation".
>=20
> Out of process emulation?

When Multiprocess QEMU switches to the vfio-user protocol the feature
could be renamed to "vfio-user device backends".

Stefan

--ubJ6/4SlK+dEE8oK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA30c8ACgkQnKSrs4Gr
c8gTlggAqi6ZbLcmp+GnNBfN/+j2IQB2FX+xyeJYHpoMqW3K4pCjV7UWC/t3N/tp
MP/Fndofow5N9OVZM58nrWQtfB+coGaBLDpuZj4NPhZWDva2RUapTjSCs+BI7WWR
EXNuOz4RNVahz421fik/GmC1ttJTdW3Sh5ixuHEtzhBmi2d1vt2uj4x44ojxLwIJ
7w4BB8F/z8a4UGEFAFv/yieLENuEvJczczZQIRSdKx0o+PM9c+N7xRi/NXf88ijU
dP357iv27QY/xC87T7br0uy956nPAdaVP0d/SO14jn3ci1wkgTsx0GXoyn9ZScBj
M32Eixyp+Nx27cVsWuyro5ijtQKmmA==
=2bdn
-----END PGP SIGNATURE-----

--ubJ6/4SlK+dEE8oK--


