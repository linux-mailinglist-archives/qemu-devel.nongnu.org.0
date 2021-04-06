Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6791354C9A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 08:13:54 +0200 (CEST)
Received: from localhost ([::1]:60850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTeyH-0000F4-FE
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 02:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lTewP-000899-HY; Tue, 06 Apr 2021 02:11:57 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:42919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lTewM-0005jG-Qk; Tue, 06 Apr 2021 02:11:57 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FDxxT2HLtz9sW1; Tue,  6 Apr 2021 16:11:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617689501;
 bh=U9q5mvqYI3eiuzsklh79CWhe+YWT7ayJrKnhr3pov58=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PRwRweTqY2BZJuQ0yhvrMSzC3kLQ8AkS5YL/uhx3CpSMj7K/+vdD+p+h7uM22X1H9
 74uv/RaD0IK/ca3fX10dYnBz6hf+vE1jSaZS6zxSrvGMRhzSgq+RsNVKD1YMabNQVG
 FHUVqSVrISq1zL4rNzZQ1IQx+3ilcCFrW8liQKiQ=
Date: Tue, 6 Apr 2021 16:11:30 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Subject: Re: Discussion: Patch series that adds disable-tcg option for ppc
 targets
Message-ID: <YGv7ku+6XNMW1QFM@yekko.fritz.box>
References: <CP2PR80MB44990766F1D104E630ADFDDAC7779@CP2PR80MB4499.lamprd80.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VLRC6jUEnB73qPvG"
Content-Disposition: inline
In-Reply-To: <CP2PR80MB44990766F1D104E630ADFDDAC7779@CP2PR80MB4499.lamprd80.prod.outlook.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Andre Fernando da Silva <andre.silva@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--VLRC6jUEnB73qPvG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 05, 2021 at 01:32:18PM +0000, Bruno Piazera Larsen wrote:
> Hi all,
>=20
> The team I'm working on started to work on adding support for
> building the ppc target with the disable-tcg option. However, we're
> not quite sure on where to start with such a big patch.
>=20
>     * Should we focus first on changing the .c files, so that it
>       will build when we finally patch the meson.build everything
>       build correctly? Or should we start by changing the meson
>       file, so that everyone agrees that the excluded files can
>       indeed be excluded?

It's usually best to focus on logical changes, rather than
file-by-file.  That said, I'd probably suggest changing the .c files
first, then changing the meson file.

>     * Should we first finish the whole series to then mail it, or
>       should we send one file at a time, as soon as we have them
>       ready?

I'd lean towards building a whole series, since I think the individual
file changes won't make a lot of sense on their own.  That said, it's
ok and encouraged to post a relatively early draft of the series as an
RFC, so that the overall idea can be reviewed, even if it has obvious
omissions (just mention them in the cover letter).

> So far we're thinking we'll need to:
>     * change 6 files (arch_dump.c, machine.c, mmu-hash32.c,
>       mmu-hash64.c, mmu-radix64.c and meson.build);

I'd expect  mmu-*.c to be excluded.  Those are softmmu implementations
which shouldn't be used with KVM.  It's possible there are a few
helpers that will need to be extracted, though.

You'll probably also need changes in hw/ppc/spapr_hcall.c and maybe
some other parts of the spapr code: there are a number of hypercalls
that we implement in qemu for TCG, but which are (and must be)
implemented in KVM when KVM is in use.  So, I expect you'll need to
suppress compilation of h_enter, h_remove, h_protect, h_read and
h_bulk_remove at least in the !TCG case.

>     * exclude 8 files from the build (dfp_helper.c, excp_helper.c,
>       fpu_helper.c, int_helper.c, mem_helper.c, misc_helper.c, *
>       translate.c, timebase_helper.c);

That looks about right.

>     * create a new one that holds stubs.

Sounds reasonable.

> Does this sound about right? This is mostly guesswork based on how
> x86, s390x and ARM are doing it.

Sounds fine so far.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--VLRC6jUEnB73qPvG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBr+5AACgkQbDjKyiDZ
s5L77BAAlafce95p2Q1YiPwLsEyigqRjZFOCZTplOX1zaVIhfY1/gBB/q7X1qTNG
xDXyabN9Z+EhFfj8P9QEHeKTMQbhrg9vQKQpkIIfEjpFUwr6LVg+Mcd3VmmOgvd7
Hk2DHPgYN/NJyGVWAiYoKJHXtJo79Am9xymRiJNHM0K/KwFh54KJEJ84qOkOTtpF
6rRufEyNvkpxxKAGZ4HhhLeuPwaxqj/jvXv11ViO/y5WFCWkNkuthdfH9D5XuGuA
BWJXKw36MJDUOj3bqBfzQTlIaNV+hb0yyd5zyLTNCk0UjTlBHrE5/DJIvQw30ikq
eYC0TsDQju3kCYQdBogCF0fpoMiquyy+VmTgBDmITgcTvSmsg2oP/R60L9wABaia
swGkS8q0/Gt665OIcyH9ph6yZmpsXpBT85hwpuamkKWaUuwxbBltdPx6i9UD/AeZ
EDk8NAyx4uWEu7PtpzodjTP6rAfs281UP7FH5wKdLNlVzive+1EItraXKPm0Zvvn
sBsd23woR0j+rLI8SpNibg2cgEUcbe2bfxsmLLYtjAp9EJFRDCsp686xthA3470Y
Yu7T8yafXAZ+c3ONnoUn5RZ/owFdkLbuNesLBovrkafvdJlx9R3lZA56jh6ag/pi
cw2F6hVPAETdM0erFN5ZWtWkj8zHuMTq5p9akmDEBHpKQ45bArU=
=xPhJ
-----END PGP SIGNATURE-----

--VLRC6jUEnB73qPvG--

