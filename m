Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F22375EF8
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 05:05:03 +0200 (CEST)
Received: from localhost ([::1]:52612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leqnW-00023m-1u
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 23:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1leqjT-0007x4-Fb; Thu, 06 May 2021 23:00:55 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47593 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1leqjP-0004qy-Gh; Thu, 06 May 2021 23:00:50 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FbwDm2j3Tz9sXS; Fri,  7 May 2021 13:00:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620356440;
 bh=V3Col8QuO+oqxyxGF4EMsfKrF/pUgQZGNFIpssOh0AI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=edza2LeyxxkxmGtfpPhcz3XklUpdUgN1Aqkrr6AcESVHjA5NDMONhLDq8vdFR0mA9
 Ev2aVcmxor+FyG9jCJ03f7dIGIn4hb2rHFiwsWWm+ATaBNAgAA30gKGrnmOTaCbya4
 p4Coak2+knhaXxjx8cMB2Ef29JD/zmObxV8j8DFo=
Date: Fri, 7 May 2021 11:05:35 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 9/9] target/ppc/kvm: Replace alloca() by g_malloc()
Message-ID: <YJSSX1eUIecBpwwX@yekko>
References: <20210506133758.1749233-1-philmd@redhat.com>
 <20210506133758.1749233-10-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="g1x6QJlBgI8sUhxy"
Content-Disposition: inline
In-Reply-To: <20210506133758.1749233-10-philmd@redhat.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kvm@vger.kernel.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--g1x6QJlBgI8sUhxy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 06, 2021 at 03:37:58PM +0200, Philippe Mathieu-Daud=E9 wrote:
> The ALLOCA(3) man-page mentions its "use is discouraged".
>=20
> Replace it by a g_malloc() call.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  target/ppc/kvm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 104a308abb5..63c458e2211 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -2698,11 +2698,10 @@ int kvmppc_save_htab(QEMUFile *f, int fd, size_t =
bufsize, int64_t max_ns)
>  int kvmppc_load_htab_chunk(QEMUFile *f, int fd, uint32_t index,
>                             uint16_t n_valid, uint16_t n_invalid, Error *=
*errp)
>  {
> -    struct kvm_get_htab_header *buf;
>      size_t chunksize =3D sizeof(*buf) + n_valid * HASH_PTE_SIZE_64;
> +    g_autofree struct kvm_get_htab_header *buf =3D g_malloc(chunksize);

Um.. that doesn't look like it would compile, since you use
sizeof(*buf) before declaring buf.

>      ssize_t rc;
> =20
> -    buf =3D alloca(chunksize);
>      buf->index =3D index;
>      buf->n_valid =3D n_valid;
>      buf->n_invalid =3D n_invalid;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--g1x6QJlBgI8sUhxy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCUkl0ACgkQbDjKyiDZ
s5JeShAAtE6r+nLzXGSDEwW1F4BeqX9QVewuCmaxNGgnLxraxLHuO0ME9IMsp0jM
xJg2sv+KFC9axYu1o2RZeGeH8+wGBusgofIRlxmL28+jIgYyFeD/VQZM5Fh2C/Qz
apTpHA6Pjn6Ed6d8qk+6cTCAYj4cEZkq+4PvI7Rf492WLPDJxKMa28DeUdJ4Oe/K
SsYZIgJMRXrgk8ckPEJ7faYweaBtVxlvIK8yt/dKJuv+u33oHMoFwwqfPJP2i5ed
LKCl5bN/wEMGkaD5iP39AgPbLf5ICl2W3wB42+jbsewTBwCzr//+Oudl1Qt7Okns
08kk6GFbK/9jLrSUDUAN8JUblIzPGu0QF+QEsWGaCvgnL+EXHUDBNjv9BtEpupPt
KauPOUXwA6XA6gEnU3N3S5kP9QlN1sWs9Df0wH0flbJo62cGFAg1A1ZxgCmyayfZ
H3c7bPsQvTm1lB6YEHAirHe2FB5G9blsNAZU4dtMsxxdm2uOK87rEwuwFzW3XfZY
aNcENy3aYUbKVLSOWoeRLLlvtVXHAT8afhN1RYtaby+mA8w/fI22IW1F55scEz1B
AZSDqkJ0ZDmNM3KUY+n6YRJeYvTTQJNIgAO5Lud5533d9hZFxD3HVD7oogXykAaL
XYG+MJamQEwkV5wZr9VXyy543zqIwRatQdJk7RAxeHPsqt8lYsY=
=JBda
-----END PGP SIGNATURE-----

--g1x6QJlBgI8sUhxy--

