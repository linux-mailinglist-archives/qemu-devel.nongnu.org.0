Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F86E4B8035
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 06:32:40 +0100 (CET)
Received: from localhost ([::1]:58116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKCvf-0007rv-3i
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 00:32:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7Z-0001HL-4l; Tue, 15 Feb 2022 23:40:58 -0500
Received: from [2404:9400:2221:ea00::3] (port=56391 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7V-0000QD-Nv; Tue, 15 Feb 2022 23:40:52 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz4y33vjMz4y4k; Wed, 16 Feb 2022 15:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644986411;
 bh=O5QYJSVEf3vG37KpBP4snRmCq9nvetVV/mN55Ba9rJ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J88xo4vIfR8YM7TlXSwH7eeTo/ZStNLIxv3PFpzyW5uiKJMMAeQewgbzxmla9kim5
 Q5x4vsH2ERx1fXWpquTV9SVIUvAD3d1bjw0Dag5c+qdPJV4nUKMueGgCbFiC0jjUzT
 WQ371EaSWg66W/9kYlHP+dwMwb2nPo54j3JoD1B4=
Date: Wed, 16 Feb 2022 13:52:47 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 15/27] target/ppc: cpu_init: Move 755 L2 cache SPRs into
 a function
Message-ID: <Ygxm/wI+YIKc/G/Y@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-16-farosas@linux.ibm.com>
 <Ygxgd1e5+BnU/1mH@yekko>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xLT3M+kB5oIb1LSj"
Content-Disposition: inline
In-Reply-To: <Ygxgd1e5+BnU/1mH@yekko>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2404:9400:2221:ea00::3
 (failed)
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--xLT3M+kB5oIb1LSj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2022 at 01:24:55PM +1100, David Gibson wrote:
> On Tue, Feb 15, 2022 at 06:41:36PM -0300, Fabiano Rosas wrote:
> > Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>=20
> There's only one caller of the new function, and no commit message, so
> the rationale for splitting these out isn't obvious.

Ok, saw the later patch that makes this clear, so altough a commit
message would have smoothed that over:

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

>=20
> > ---
> >  target/ppc/cpu_init.c | 24 +++++++++++++++---------
> >  1 file changed, 15 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> > index 03aa543814..ddd27c21ae 100644
> > --- a/target/ppc/cpu_init.c
> > +++ b/target/ppc/cpu_init.c
> > @@ -503,6 +503,20 @@ static void register_755_sprs(CPUPPCState *env)
> >                   0x00000000);
> >  }
> > =20
> > +static void register_755_L2_cache_sprs(CPUPPCState *env)
> > +{
> > +    /* L2 cache control */
> > +    spr_register(env, SPR_L2CR, "L2CR",
> > +                 SPR_NOACCESS, SPR_NOACCESS,
> > +                 &spr_read_generic, spr_access_nop,
> > +                 0x00000000);
> > +
> > +    spr_register(env, SPR_L2PMCR, "L2PMCR",
> > +                 SPR_NOACCESS, SPR_NOACCESS,
> > +                 &spr_read_generic, &spr_write_generic,
> > +                 0x00000000);
> > +}
> > +
> >  /* SPR common to all 7xx PowerPC implementations */
> >  static void register_7xx_sprs(CPUPPCState *env)
> >  {
> > @@ -4549,16 +4563,8 @@ static void init_proc_755(CPUPPCState *env)
> >      register_sdr1_sprs(env);
> >      register_7xx_sprs(env);
> >      register_755_sprs(env);
> > -    /* L2 cache control */
> > -    spr_register(env, SPR_L2CR, "L2CR",
> > -                 SPR_NOACCESS, SPR_NOACCESS,
> > -                 &spr_read_generic, spr_access_nop,
> > -                 0x00000000);
> > +    register_755_L2_cache_sprs(env);
> > =20
> > -    spr_register(env, SPR_L2PMCR, "L2PMCR",
> > -                 SPR_NOACCESS, SPR_NOACCESS,
> > -                 &spr_read_generic, &spr_write_generic,
> > -                 0x00000000);
> >      /* Thermal management */
> >      register_thrm_sprs(env);
> > =20
>=20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--xLT3M+kB5oIb1LSj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMZvgACgkQgypY4gEw
YSK62Q/6Ag03sn6/yx+znMWST0e+NKy0sJpD0n3PWGsNQv3oAXCDdHHaj1ru3KL0
W086OiCvQyw6gTwnIfiI/Wm8bSsbSmS33y8RqP4ImrUC5XpsNUsFSTzFUeClEX9M
Woz4uW/F9GGLkyL46WGS9QMam8I9iZErVAQnMrGvjvq0h1BtKP9tsf4B+xj6lqUq
TeUvsIleRVSbV7FJ+flw9yCsMIQRarsJ30Lv7Bj4b49Lae2+LBpreIizUsE3VEGD
+JDXnYde+3+aagwa9CUYxAPbv4pBy9eMPT4c0QxFocydyA0cO/TvLH9Lofez2faB
9bL/FU8BRixcNmqbcMmZWmGKW4Ci7hQvQ+Md9hTyp/D+atfIf1eiCTbW5pcMF1jA
DgFUP/wrLgOky1iFv18X7Y0axQQefrV6gjoRSikpE64gjmn6YaEfmCleUcjt5Ofh
ULIndFOcWfcdZHWwxbE2ubgYaiMVM1DIA1TYnezPie73b54NP8jzID9fpKQWjxsv
k5qAzcwos7rVijff1P/JTUkLQ7nygC51tSTqAKx91my+20ZM0DEdR/HhBAn6XJA6
GngFrDGEbCypWRIev+sbvp6fGfkBXxWAMGHFPVQm9IM9EODawS4/c3vE5YJO0LT4
kkTv1BN9KTca2XTuL5ck2gNWj5bM0bHJwWawmjDFPqBti73ry0c=
=bscl
-----END PGP SIGNATURE-----

--xLT3M+kB5oIb1LSj--

