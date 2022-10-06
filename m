Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF135F62FE
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 10:45:16 +0200 (CEST)
Received: from localhost ([::1]:59936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogMVH-0002Im-Kt
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 04:45:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1ogM2K-00013k-SU
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:15:21 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:60903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1ogM2G-00033f-12
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:15:19 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Mjkl31xb2z4xGp; Thu,  6 Oct 2022 19:15:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1665044111;
 bh=YoFcQZRp5xIwY61iCIL4XDA4TzqzHX6ccG4ZQdLlzYo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SV+FcFUKQTgSGUqr6WjETq8pdCil2iMUt8Ti0R/hzpZ5dsyyT6rxXGEmLjJOoCEQn
 kW4M5iZ4tLJyzCFOEd8trtP6xZohEutZ7Ms8dJOlXijTESgcKoX+OqX1ThWY/Oj3uK
 sHOwojP6aVuvm2CMvT8PjCcve4Vb96PVoWTsamwk=
Date: Thu, 6 Oct 2022 19:14:23 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Greg Kurz <groug@kaod.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH v10 08/17] net: stream: Don't ignore EINVAL on netdev
 socket connection
Message-ID: <Yz6OX21D6yKKjk7Z@yekko>
References: <20221005162051.1120041-1-lvivier@redhat.com>
 <20221005162051.1120041-9-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QF8ZkaI8jpuEV5R0"
Content-Disposition: inline
In-Reply-To: <20221005162051.1120041-9-lvivier@redhat.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--QF8ZkaI8jpuEV5R0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 05, 2022 at 06:20:42PM +0200, Laurent Vivier wrote:
> From: Stefano Brivio <sbrivio@redhat.com>
>=20
> Other errors are treated as failure by net_stream_client_init(),
> but if connect() returns EINVAL, we'll fail silently. Remove the
> related exception.
>=20
> Signed-off-by: Stefano Brivio <sbrivio@redhat.com>
> [lvivier: applied to net/stream.c]
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Daniel P. Berrang=E9 <berrange@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  net/stream.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/net/stream.c b/net/stream.c
> index 37965eb74e1a..26e485438718 100644
> --- a/net/stream.c
> +++ b/net/stream.c
> @@ -360,8 +360,7 @@ static int net_stream_client_init(NetClientState *pee=
r,
>                  if (errno =3D=3D EINTR || errno =3D=3D EWOULDBLOCK) {
>                      /* continue */
>                  } else if (errno =3D=3D EINPROGRESS ||
> -                           errno =3D=3D EALREADY ||
> -                           errno =3D=3D EINVAL) {
> +                           errno =3D=3D EALREADY) {
>                      break;
>                  } else {
>                      error_setg_errno(errp, errno, "can't connect socket"=
);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QF8ZkaI8jpuEV5R0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmM+jlQACgkQgypY4gEw
YSL1wA/8DJ5Ixx1awFRhjy2vSaHE0tZRgX2SvjTgZd5SIg+BIjmrSIwznt1wuxT0
X/wwoec0YHy0Ldw+wf8Y3Fr3O3B0fjApueyK4z677elI8AkNQdq8cgxhSRx0MMZj
sFhNIMCnkmmmEBoHnSyiw6XH++8u3CAC1nsv80NiiVo1al6YZrAfsHEit9nIC51p
xIXRW6J92l7wecms5cIgQXVXJrex0iv6QUTqXtT47cpnqWfyFbO/pRSgDP2wqH42
wAT5B6b+LfZeyC3ZkEXXgF+3m0xehUc+SuoEuxqjQhyDCUEUSwbF+EH8UzpkFirJ
NbU9o9JGiBgbB5mz+wsN5Tmo0mYMjQfwLwV8H4dtWH1IW2uauGIfYnL0cRWFeCWS
1wzyaCJpXEsgw1SbWtfY4/ewPRUZ7ZtEssEMvHkrrA2LF4fPx3wKF8jU4vl9O3fL
aZ2kgqhGL/eTBQ8y2mICEutPbOrgFRy2vCtbJNuu7JVs44gODIM4m0Csv3Qg78YZ
2rWipX41kNZW2fwKzKIwQDsQNz9dMpCk2SUHhG+MaWhNepK4v1Wci2PDOr2jkxkb
gMCsONDgiiUJb0pw95AHqK+Y6N3r6fQHoScN5UJgF0Q1z0KMvFu/wXdW7/0ng/O0
TMMv67xXGA45SZxBz7IEvp85e5gtIrmTeuwTIu9iEG+wKfzbZlk=
=PZWF
-----END PGP SIGNATURE-----

--QF8ZkaI8jpuEV5R0--

