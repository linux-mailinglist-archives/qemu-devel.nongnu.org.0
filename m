Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 193D348A5D2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 03:46:26 +0100 (CET)
Received: from localhost ([::1]:51768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n77B3-0004NO-19
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 21:46:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n76wv-0006Lo-NC; Mon, 10 Jan 2022 21:31:50 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:52795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n76ws-000157-FI; Mon, 10 Jan 2022 21:31:49 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JXvpB2019z4y4k; Tue, 11 Jan 2022 13:31:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1641868290;
 bh=jwmoFAqhyRkfvalGZGG7zBHYeS9S7iIN/cijfGFZI5g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O3a7+opdFN3yZX8a/qDbGqKtmZAfRbrnl0hxyO/97pstBkH5Zo6T2u0imUTluQAQJ
 sWudkwzPgjjKWrJimJyFVBPNai2dAuwB827rkVQmXckfvGiuMZiFFvbEjBix4LNS1y
 6I/vvVSvYszdQ2RTCSsILycP8nq6vuRZejtWx8uI=
Date: Tue, 11 Jan 2022 13:26:46 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 6/8] target/ppc: 405: Machine check exception cleanup
Message-ID: <Ydzq5rfy8H95kWFn@yekko>
References: <20220110181546.4131853-1-farosas@linux.ibm.com>
 <20220110181546.4131853-7-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+mq38bfEvp0WeEL8"
Content-Disposition: inline
In-Reply-To: <20220110181546.4131853-7-farosas@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+mq38bfEvp0WeEL8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 10, 2022 at 03:15:44PM -0300, Fabiano Rosas wrote:
> powerpc_excp_40x applies only to the 405, so remove HV code and
> references to BookE.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/excp_helper.c | 26 ++------------------------
>  1 file changed, 2 insertions(+), 24 deletions(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index fecf4d5a4e..82ade5d7bd 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -449,34 +449,12 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int e=
xcp)
>              cs->halted =3D 1;
>              cpu_interrupt_exittb(cs);
>          }
> -        if (env->msr_mask & MSR_HVB) {
> -            /*
> -             * ISA specifies HV, but can be delivered to guest with HV
> -             * clear (e.g., see FWNMI in PAPR).
> -             */
> -            new_msr |=3D (target_ulong)MSR_HVB;
> -        }
> =20
>          /* machine check exceptions don't have ME set */
>          new_msr &=3D ~((target_ulong)1 << MSR_ME);
> =20
> -        /* XXX: should also have something loaded in DAR / DSISR */
> -        switch (excp_model) {
> -        case POWERPC_EXCP_40x:
> -            srr0 =3D SPR_40x_SRR2;
> -            srr1 =3D SPR_40x_SRR3;
> -            break;
> -        case POWERPC_EXCP_BOOKE:
> -            /* FIXME: choose one or the other based on CPU type */
> -            srr0 =3D SPR_BOOKE_MCSRR0;
> -            srr1 =3D SPR_BOOKE_MCSRR1;
> -
> -            env->spr[SPR_BOOKE_CSRR0] =3D env->nip;
> -            env->spr[SPR_BOOKE_CSRR1] =3D msr;
> -            break;
> -        default:
> -            break;
> -        }
> +        srr0 =3D SPR_40x_SRR2;
> +        srr1 =3D SPR_40x_SRR3;
>          break;
>      case POWERPC_EXCP_DSI:       /* Data storage exception              =
     */
>          trace_ppc_excp_dsi(env->spr[SPR_DSISR], env->spr[SPR_DAR]);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+mq38bfEvp0WeEL8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHc6uYACgkQbDjKyiDZ
s5K2tQ/+PKSf8GQXfYLRyEZl8GjNtGLxplLUVGXgN4BE+4mgNeXKpGa+/LSpwA45
HRFk5yzKALs+u0IJwdof2kACuo6igYU6gA14E9KTV2K94IjrrdR4tndEZX4gVFDx
ccmOT9td0/nZit5BRbHIbnTbbudFCzrBpoEQlJgbCqM/zu7mEFWCQ1rOD/OKlI7l
Goo5vrxfLWdj3dWWtlY2I0yl5V8TQeeCS3wwHotKD32R2h1VAF0zMqgYUU4X70+T
iyI09B/1Dnm8kUigh0NNx+k1xaIy5+rSJW19dvBxix5fUS/NPzvtqeACqG+t9K3u
HZ+b4mIq5H/CI5OstUeMqresbJX08Qc8vhJczKxxpd+TxlUBHYek+SW1G5TEqQkO
jLwKqJAmic5A270gkC6nJcD5Dv9xtOl+4AAaAQ+XalTM5KU8Ts7OcKq3BeejFVN6
cnZnX9DVnVpmnbZ/mQUN3dQIf5qL/AKMtc0dWDoQqepd2wFfJvQXCBqPl5RQA4Ho
/EezQ1TbdjIh4jCrBGvTJS7BHkauyBkbllgJSxfpTALGMlZLFArrR2Nx61kj3kO1
o+KL3/PQaE3Mdfh4Y1qDaoil1bm4X7EGfqqFw5kAWNUPBy3OF4gpA+wrlYxSakBO
ds82c4oQuXl6dwpvzwQ5VDNaRA/m0DSiHY0Cp6qAqnuxTse1jew=
=VPfo
-----END PGP SIGNATURE-----

--+mq38bfEvp0WeEL8--

