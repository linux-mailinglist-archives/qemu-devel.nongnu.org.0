Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7651F48A5BA
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 03:36:50 +0100 (CET)
Received: from localhost ([::1]:37876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n771l-0002Ip-IZ
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 21:36:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n76wq-0006FH-9J; Mon, 10 Jan 2022 21:31:44 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:33885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n76wk-0000yt-90; Mon, 10 Jan 2022 21:31:41 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JXvpB0wD5z4y4c; Tue, 11 Jan 2022 13:31:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1641868290;
 bh=tYAixZnyAAscN4YotVZkQK8c97ppTCon5JCojvDRZak=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=poN7ronRQDTwt6VSmMmQSB1y0/UHpTaduhMiGl5RnrNVWkai+CzEIh16KvYJT9xk4
 r/+xho56ZTB0sA0zvxMQ5OBnD3eCGSMDhkcjvEnN5hM25zD3ylUQAj5caMxAemeWD4
 Cdj/vrS5bwcXfOJXFv4zdtRz8d9zNDrvUbeIRCkE=
Date: Tue, 11 Jan 2022 13:04:14 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 1/8] target/ppc: 405: Add missing MSR bits to msr_mask
Message-ID: <Ydzlnpk8GgUBs5ZY@yekko>
References: <20220110181546.4131853-1-farosas@linux.ibm.com>
 <20220110181546.4131853-2-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="04RdANfxKmebAu/m"
Content-Disposition: inline
In-Reply-To: <20220110181546.4131853-2-farosas@linux.ibm.com>
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


--04RdANfxKmebAu/m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 10, 2022 at 03:15:39PM -0300, Fabiano Rosas wrote:
> Some bits described in the user manual are missing from msr_mask. Add
> them.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  target/ppc/cpu_init.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index e30e86fe9d..a50ddaeaae 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -2535,15 +2535,19 @@ POWERPC_FAMILY(405)(ObjectClass *oc, void *data)
>                         PPC_MEM_SYNC | PPC_MEM_EIEIO |
>                         PPC_40x_TLB | PPC_MEM_TLBIA | PPC_MEM_TLBSYNC |
>                         PPC_4xx_COMMON | PPC_405_MAC | PPC_40x_EXCP;
> -    pcc->msr_mask =3D (1ull << MSR_POW) |
> +    pcc->msr_mask =3D (1ull << MSR_AP) |
> +                    (1ull << MSR_POW) |

If I'm looking at things correctly, the "MSR_POW" bit on 405 is
actually called "MSR_WE", which appears related, but not quite
identical.  I think it would be good to introduce a new define to get
it a name matching the user manual.

>                      (1ull << MSR_CE) |
>                      (1ull << MSR_EE) |
>                      (1ull << MSR_PR) |
>                      (1ull << MSR_FP) |
> +                    (1ull << MSR_ME) |
>                      (1ull << MSR_DWE) |
>                      (1ull << MSR_DE) |
> +                    (1ull << MSR_FE1) |
>                      (1ull << MSR_IR) |
>                      (1ull << MSR_DR);
> +
>      pcc->mmu_model =3D POWERPC_MMU_SOFT_4xx;
>      pcc->excp_model =3D POWERPC_EXCP_40x;
>      pcc->bus_model =3D PPC_FLAGS_INPUT_405;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--04RdANfxKmebAu/m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHc5ZwACgkQbDjKyiDZ
s5JNTg//bSC1pnT+y3tJipjyOdvNexx2Z83sVFCxVrEI+LIcDyBPzgaYzJSGaalP
MXH01khOifDKG/70D3QPd9DDcA5XVj2WhgsPbZ6QVqG7oQ4nV4kL94Rax58lJL2o
LQRGmyR+skML6+q+kSDiCdQlmjS+R+QH9OH/H952DcOsxakTy3lDyu0KcBjwGl5u
tcfNKtJE86msZxEZgdD7UidFk4ZeqoWbSX1BF97//M7g5ZWt6HqRKZwgR0GCECS4
vbl8Fc0VUp0u85g2ndCcIP4iGGj38vF4PqyIPxTQPUBZ94k7idycV2zxwMeu1rif
t8FNSDDii22qA5M/0tXy1yWwxPlDSb8ECgy6zUQvTen0omqb7Q+umcPYhmimiGFi
gqFviW9ch7gsoR8IW9WOlKMOmNEXB48UNZ7ZF60nZuKYX2Up4FwT4DQ1Ur1xrA+V
y+QdtWjaLTEmaa3oHFa0PSjzPRTxNEzrHNJx3EuIOBy9zFaskFhglQo+bt0jrJg1
RSL/Lk3qpy7NVn70xmd446woxyzgTOSCtViJToSnT/Y1PfBMuJla83qYSI6YV0VS
EwdziLHxvP1goIauVJqUmGJxwkJbVXvaonuQNq74OlKk8ZJ8DfODjUVU48UhZrrp
O6rKA2R6emNFSmSR/lq9gdBmELKOBr66Uj8MpuMO1sFhOXsWmWU=
=cPxQ
-----END PGP SIGNATURE-----

--04RdANfxKmebAu/m--

