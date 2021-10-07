Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 298D3424B69
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 02:56:17 +0200 (CEST)
Received: from localhost ([::1]:59478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYHho-0002FT-6v
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 20:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mYHan-0006K6-Ok; Wed, 06 Oct 2021 20:49:02 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:44189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mYHal-0005LF-FV; Wed, 06 Oct 2021 20:49:01 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HPt3x0Ft6z4xbP; Thu,  7 Oct 2021 11:48:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1633567725;
 bh=N0nkwjYA8I3O9uT9AQOmH1H/BgnLAR5/VwP8ZF3AANU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Py9tIfEjf1NWpO1mumvQG5bt82Un4mGbPaaxzEomqj6LHFLRsP+oZTm6yqh1thzg6
 iwzW2IqPNP1qJZfR73O7TUb6DZ+zTYMk7h/S2WuErMYEVZGJJW+huKs1OHHbUj6pGw
 aKqljZLFPr6H1YVta8f+L2WG+ZDF+m2bbzz6UT4w=
Date: Thu, 7 Oct 2021 11:47:22 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] spapr/xive: Use xive_esb_rw() to trigger interrupts
Message-ID: <YV5Dmk3j1OLCBFxa@yekko>
References: <20211006210546.641102-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EORHAcXlCpYIGPNQ"
Content-Disposition: inline
In-Reply-To: <20211006210546.641102-1-clg@kaod.org>
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--EORHAcXlCpYIGPNQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 06, 2021 at 11:05:46PM +0200, C=E9dric Le Goater wrote:
> xive_esb_rw() is the common routine used for memory accesses on ESB
> page. Use it for triggers also.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-fot-6.2, thanks.

> ---
>  hw/intc/spapr_xive_kvm.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
> index 630a719d578e..2f79950a644e 100644
> --- a/hw/intc/spapr_xive_kvm.c
> +++ b/hw/intc/spapr_xive_kvm.c
> @@ -318,9 +318,7 @@ static uint8_t xive_esb_read(XiveSource *xsrc, int sr=
cno, uint32_t offset)
> =20
>  static void kvmppc_xive_esb_trigger(XiveSource *xsrc, int srcno)
>  {
> -    uint64_t *addr =3D xsrc->esb_mmap + xive_source_esb_page(xsrc, srcno=
);
> -
> -    *addr =3D 0x0;
> +    xive_esb_rw(xsrc, srcno, 0, 0, true);
>  }
> =20
>  uint64_t kvmppc_xive_esb_rw(XiveSource *xsrc, int srcno, uint32_t offset,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--EORHAcXlCpYIGPNQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFeQ5oACgkQbDjKyiDZ
s5KQFBAAqtduEl2I78jjVUUZ5CmY9lP9ymD/mPc58VhHNggUox7/0adeG1/EX6S3
Z3G/rdXrcZBJMj1GL3c4VeeSCz36HwGdGCsaAx0MBRhornrp6ns7CeKUpWGdbwLY
iNe/B1yQAQT0W0GiOjiujmb+/kIzM7reyN8KbDL/qsDhWyZzUdWYaLU7ZlOndTGx
4hg6C2cUff8cEPtlSeZKFzk1uKElqeAIaBpA+l55bUqLk9DqVILxOTFjTm+pHG5j
hFja2qABJVRXlnhzMT8Bti9KIplBlHt6X3TurOgxe4D6UZV92khd1VJSEgBRtjBW
zCO1ua3WTNRWpeVwENbq9oCs3zgCrkhlhGYqGY3IaOJ4hiJOdiXp7cak3MyT0ApA
Ta/QIrKo7MPg40WenQBqZbkfPGNpZ9z5FwXQVqedslCCmlgZAMZ3WfsjXfrpY3+G
HjQEGiW0c8kIzRORPBnerOGSjEVcsRBeG8TNxkbqZokhqqpdgxR+8rHSWD1nVVQJ
BwCxPBU7Y7eSrTmJtk8NmOMKq51pE1DrnhyAp9DmXdg3xlSa4qawIoIHJZRZdY+x
LJOd1vl7WNVDS5EoHj9AusojGD6Tjb1/x97UNv1NwwcbdBRzQfhHIxtokGoN5ABa
cy+5D5844nw6sQ+L3Lzfj2shzYVSXGdtsfrKBr5wUIZ6q5UwNOg=
=kTby
-----END PGP SIGNATURE-----

--EORHAcXlCpYIGPNQ--

