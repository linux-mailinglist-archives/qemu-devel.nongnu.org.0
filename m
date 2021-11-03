Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C41443A5E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 01:22:45 +0100 (CET)
Received: from localhost ([::1]:51348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi439-0001Ps-KG
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 20:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mi3yv-0007wP-J5; Tue, 02 Nov 2021 20:18:23 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:48867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mi3ys-0001As-Mk; Tue, 02 Nov 2021 20:18:21 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HkS6B0nwWz4xbc; Wed,  3 Nov 2021 11:18:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1635898690;
 bh=TYvPL/wXDTOcmb5oa8jGw+YHO7dH4zfjiSQKh8bG6hg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A6WBXphaEJsEh9WBPvDBFm3wM9XZjDURnsrF6pR8g7fPflESEpbQpKT36garsLEdr
 m/PC9Gaqw+Vp3f7cS/AT8mC9g9Ufz2oV5/iyG8Nbsee7p37XD1kjSCkr5kJpkhfSQZ
 51RJCbemC0icqPduTuxLKoYJYT5KIWIUvsKNWwpA=
Date: Wed, 3 Nov 2021 11:11:15 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] ppc/pnv: Fix check on block device before updating drive
 contents
Message-ID: <YYHTo6XJq/4KNrj0@yekko>
References: <20211102162905.762078-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yXRlbLp9B4hBxJJ7"
Content-Disposition: inline
In-Reply-To: <20211102162905.762078-1-clg@kaod.org>
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--yXRlbLp9B4hBxJJ7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 02, 2021 at 05:29:05PM +0100, C=E9dric Le Goater wrote:
> Test is wrong and the backend can never updated. It could have led to
> a QEMU crash but since the firmware deactivates flash access if a valid
> layout is not detected, it went unnoticed.
>=20
> Reported-by: Coverity CID 1465223
> Fixes: 35dde5766211 ("ppc/pnv: Add a PNOR model")
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-6.2, thanks.

> ---
>  hw/ppc/pnv_pnor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/pnv_pnor.c b/hw/ppc/pnv_pnor.c
> index 5ef1cf2afbe1..83ecccca28df 100644
> --- a/hw/ppc/pnv_pnor.c
> +++ b/hw/ppc/pnv_pnor.c
> @@ -36,7 +36,7 @@ static void pnv_pnor_update(PnvPnor *s, int offset, int=
 size)
>      int offset_end;
>      int ret;
> =20
> -    if (s->blk) {
> +    if (!s->blk || !blk_is_writable(s->blk)) {
>          return;
>      }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--yXRlbLp9B4hBxJJ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGB06MACgkQbDjKyiDZ
s5ILlBAAmEqm1RwZ9MmGfR5GOptyuLP1aM5qRDe+ptJbx1po97igjDyv7Rlsl8NH
PxaGU9Fb8ApBKaurVP0DdLr1K/s6ilhPLB1/UXRqP55sqYR2gbuqKOL2d6dT5169
6PzN44LZbXDx0GrlOcMbqY7YPkZlDi9VztoHSMYJBbrkjF9nk8N3czedeODrvFdL
VhH8SYT8g8UdASucTUTC0P2jJlQ+wYdXAxxFokozsMSQREd0B/jUUa/UgSlDvvTD
tj92s8QymnZw+NPG4iXPxq55FTMMYx/Kz/Zd5oOh049QOvN7vus8TmnBoWtSkCFr
OoanS1aAa0ZSRt2OUKjNW0cT9T3k8ohex4hApi3vA6Vnv+381to90O5dZT8llXvf
ykdIfhbFx81KnR3JMh2FpDa52lzFqVXyG6lXenzDOctBWys0J6CSclD42DLVZGYq
JzGGYNuwWkE0moziD/fTwBPZncU8ksBcS/ObABFrir7BRB61cB7S5CoQ/RSdSn+P
kkroEzVhUzgJ6iRnuC321qLdzth84tC2HNIeD9RZTi1kFJyyWtF0lWZEDODxHTmZ
s5CuRrJlqxV2U9vw3kjp3HNyAvo7z12KJsGuSWouiWbVdPsumBbFi4vLqSr8uT6O
Y0O9HWYjnQjG0HbRCX93RB2oNSk3ldxSsIdXGizxLMXfSc3JRVc=
=zyXY
-----END PGP SIGNATURE-----

--yXRlbLp9B4hBxJJ7--

