Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E20597EC5
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 08:47:38 +0200 (CEST)
Received: from localhost ([::1]:49670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOZJV-0004on-HV
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 02:47:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oOYo3-0004ti-5q
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 02:15:03 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:40015
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oOYo1-0007Sp-AI
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 02:15:02 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4M7ZNj6Hgnz4xV5; Thu, 18 Aug 2022 16:14:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1660803285;
 bh=Lx/uT4seEjkJvUW5g0jy0q9PxHSKisj4NCxdK9qV2Ug=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oN02WsqL38yLGLatcUf/Aj3N6p3Wqgc4ndSUWJTi3gGi1Ssm27KQd0aqtjNOoGMMd
 yOt9F8OUS8zueEiAcBzLSGUPE9Qb37+f9pA+TBAokF5svj6Wcvs3GBUf9PGjjBNV4B
 aRDoRktlC2lfwT11Lnc1zEu2ym17s5qlyxCs4DGs=
Date: Thu, 18 Aug 2022 12:48:39 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>
Subject: Re: [PATCH 2/2] hw/mips/boston: Pack fdt in fdt filter
Message-ID: <Yv2oh9aXuQFSd9IT@yekko>
References: <20220813162720.60008-1-jiaxun.yang@flygoat.com>
 <20220813162720.60008-3-jiaxun.yang@flygoat.com>
 <277f1180-02f4-9372-2493-1954a250e35f@amsat.org>
 <BEA08D52-2865-4F4F-8E65-512FF86F1F56@flygoat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5I5lWKSuH+J++qSG"
Content-Disposition: inline
In-Reply-To: <BEA08D52-2865-4F4F-8E65-512FF86F1F56@flygoat.com>
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
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


--5I5lWKSuH+J++qSG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2022 at 12:46:46PM +0100, Jiaxun Yang wrote:
>=20
>=20
> > 2022=E5=B9=B48=E6=9C=8816=E6=97=A5 01:44=EF=BC=8CPhilippe Mathieu-Daud=
=C3=A9 <f4bug@amsat.org> =E5=86=99=E9=81=93=EF=BC=9A
> >=20
> > On 13/8/22 18:27, Jiaxun Yang wrote:
> >> FDT can be awfully fat after series of modifications in fdt
> >> filter. Just pack it up before add to ram.
> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> ---
> >>  hw/mips/boston.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
> >> index 5145179951..a40f193f78 100644
> >> --- a/hw/mips/boston.c
> >> +++ b/hw/mips/boston.c
> >> @@ -400,6 +400,7 @@ static const void *boston_fdt_filter(void *opaque,=
 const void *fdt_orig,
> >>                          1, boston_memmap[BOSTON_HIGHDDR].base + ram_l=
ow_sz,
> >>                          1, ram_high_sz);
> >>  +    fdt_pack(fdt);
> >>      fdt =3D g_realloc(fdt, fdt_totalsize(fdt));
> >>      qemu_fdt_dumpdtb(fdt, fdt_sz);
> >> =20
> >=20
> > Why not pack by default in qemu_fdt_dumpdtb()?
>=20
> qemu_fdt_dumpdtb() is explicitly a function for debugging purpose.
> Donno if it=E2=80=99s wise to hijack it.

Agreed.  Having this modify the dtb sounds like a very bad idea.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5I5lWKSuH+J++qSG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmL9qIAACgkQgypY4gEw
YSL10xAApJPJ4qM0VVbt8rC0nSuV6fOjwFIZmfeSM5Q2Fg2sMM9TWUKVMBFGA3lo
7xTW3RTxFeB/KLdS5gm3H92UMDdE/mh0Pr9Pq+1Q3fVbbja58pllO7RIuFbD3Uus
oHcA7vXWxSpG1kYmGF8ARxxlz0iSveNlGlWgs7a1qbpEHlm9VYoMUE5zoGu9nyEs
6pVLe+vjDXrZmtC5ZNrlp00HCnp1W+PAjFpt159qv4qChRjCCfkEFGbBzXL+lz31
n3QrBXg1VNbBxOBvjjFk1OpdAWUhkR4bLJnQQDlAOOjxzLhfq5vVj5fIUVa/t+N5
8Wy1NMG6+puoTzGKYbZz7Uhy5zoFRgT1JT7cDWFRsoydRTl1rUXhFWq3NdZPSxLL
d4X532OiSgx9/C5K8I2v8a40gFWtKQte6q10qKD3mxgdcQcimrKMtQ6YqmCuu7oU
71ieHvzJHFMwHCxpyzioD671JK7D3FdTwhtytd/UZtNg6/O+1F2mMGTMOeo7PcbV
jZlxOJ+fPZEA4y5yfrJ2KUQEygeqY4l0P7dBJmzYUil+3tAV2+tJxCpihZ1cc68B
w03Wn8yLN88RTQf17mEeT+86kA6nCeFm2pcsnxMw1479zmdnZP1v48+Ipsb1L94j
ihhQ9qQ93F7i53kLyqTqmKnZQxknTBxeSMv4mjoPKZRN13gCY5M=
=fGjW
-----END PGP SIGNATURE-----

--5I5lWKSuH+J++qSG--

