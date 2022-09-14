Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4AE5B8115
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 07:47:07 +0200 (CEST)
Received: from localhost ([::1]:50758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYLEm-0008Rb-I2
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 01:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oYKvM-0007Rp-1s
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 01:27:00 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:53933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oYKvE-00045y-EB
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 01:26:57 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4MS82t6nftz4xD1; Wed, 14 Sep 2022 15:26:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1663133206;
 bh=osNp/gKtHxkIA61WMFZfKKTF9l5uRUtiJXnKQA5TEEo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c8roiZ+qKTUxXB2RV6iCY1YIojWI25YMKujt8L4KFzxm40vu8eK5Iv21iCVSOlW32
 VGDnDCyCvSI5UOEunfiiZTrHjuRwojjSqHTBZkXys6yKM9Vr4XT0thN3nSyTRXwB2P
 VuHVueYokbNRqKiK2hMUvzWaB1zd0cbyDR91B4L4=
Date: Wed, 14 Sep 2022 15:05:04 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gregory Kurz <gregory.kurz@free.fr>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH v8 06/14] net: stream: Don't ignore EINVAL on netdev
 socket connection
Message-ID: <YyFhADVRPSB4ZT4p@yekko>
References: <20220913064000.79353-1-lvivier@redhat.com>
 <20220913064000.79353-7-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZcmHfb9vcptNWw15"
Content-Disposition: inline
In-Reply-To: <20220913064000.79353-7-lvivier@redhat.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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


--ZcmHfb9vcptNWw15
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 13, 2022 at 08:39:52AM +0200, Laurent Vivier wrote:
> From: Stefano Brivio <sbrivio@redhat.com>
>=20
> Other errors are treated as failure by net_stream_client_init(),
> but if connect() returns EINVAL, we'll fail silently. Remove the
> related exception.

Is this also a bug in net_socket_connect_init()?  Is there an
equivalent bug in dgram.c?

> Signed-off-by: Stefano Brivio <sbrivio@redhat.com>
> [lvivier: applied to net/stream.c]
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Daniel P. Berrang=E9 <berrange@redhat.com>
> ---
>  net/stream.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/net/stream.c b/net/stream.c
> index 0851e90becca..e8afbaca50b6 100644
> --- a/net/stream.c
> +++ b/net/stream.c
> @@ -363,8 +363,7 @@ static int net_stream_client_init(NetClientState *pee=
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

--ZcmHfb9vcptNWw15
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmMhYPoACgkQgypY4gEw
YSIgeRAAyNX47IO2ryxgL+2DZa8OKt/WHuk7uYy+zpTcb0dS8SCLmHBtzeqwO13c
eUdFRx/Zde9+dZG5qnoCCUC/JeBtk9j1uWwy1BR8trTW352k8AVtgojGhZBeabRV
GVr6mUU3v56euuJ4r5sCkRcOqmbAKrxx70xRAXo5MDZvR/x2dJRZuSQJMrMWl5vv
MsxwylB9bosViRKwHZMkTGXFIkiZLTLpTt9iStxZj/z6Ap6X8BmOw/tIZLG3A4N5
kiGf40t4D7STAyM8YEausWcEPET47GLTn4KZeUc631sc8ct8apoc3VFmNP6fgE8v
Fm0YUglU5rnDlJV3w/Wu9SOA/zBFcoooKcBjpM7APBpkoU2EV+m3wC5+mkWbJJeP
d8Ar4XCTNudR2IqlsFG/ZfUOsrPJu81ePSoRcn/WFYb04xQrg288j34tyjtta7L9
/l+k29dWOCLP2qUBrZ48Gc3cocNZDTJrlFavBzUZ87cgGniQQMhGR+eAE63y9JHP
3x5GvSf1QwmGmtmMqrKoBDSztfRSZSwT+l1ttX7gYY1mCuHNQXluY7gw/I9gdwNv
PtErqEpIQ77bDXc9unjbYskztMpsx5alOigmA4mb/VnHLrvkt+VgrrsUwwSTnEFi
QrIo4ylEoEMBwrgsHccUq9gU4oc1AlRRjb1z83b9tkTqukFFRBU=
=lhtN
-----END PGP SIGNATURE-----

--ZcmHfb9vcptNWw15--

