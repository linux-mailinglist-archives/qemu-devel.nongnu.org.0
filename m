Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 114DF334C23
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 00:02:44 +0100 (CET)
Received: from localhost ([::1]:53354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK7qk-0000wG-NE
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 18:02:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lK7pH-0000Sv-BI; Wed, 10 Mar 2021 18:01:12 -0500
Received: from ozlabs.org ([203.11.71.1]:39331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lK7pB-0005r2-Ol; Wed, 10 Mar 2021 18:01:09 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DwncV6Kd1z9sWQ; Thu, 11 Mar 2021 10:00:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615417258;
 bh=x+dAgMlCBwlWyBRJeUdzPHyPuceDZh43EbfNPt4C8Kg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iuSZr8F4PZhNnjTr5gUgTnsTeP/kYsbcKueC9cNaQQtjcC1La6DI9s1ZtN0cSFLv6
 eX2udMyxSDLm1PJ8f4biG1ff0TTzwHFnhOWLf8qE5+6BCOg8u78S6DQkluPMVQJWKW
 s6aQgRteeyEqon3cbxkSWcUVflwLHgmH1mzSRSqI=
Date: Wed, 10 Mar 2021 17:00:02 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PULL 00/20] ppc-for-6.0 queue 20210310
Message-ID: <YEhgYnobMORMwaH5@yekko.fritz.box>
References: <20210310041002.333813-1-david@gibson.dropbear.id.au>
 <CAEUhbmWKHYxHvRfZ+Z24+gxLQrSvxxq2uqRjB9Fx2jLqdiSrZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wVUpL4Y0m3UB7jqf"
Content-Disposition: inline
In-Reply-To: <CAEUhbmWKHYxHvRfZ+Z24+gxLQrSvxxq2uqRjB9Fx2jLqdiSrZw@mail.gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--wVUpL4Y0m3UB7jqf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 10, 2021 at 12:43:53PM +0800, Bin Meng wrote:
> Hi David,
>=20
> On Wed, Mar 10, 2021 at 12:10 PM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> >
> > The following changes since commit b2ae1009d7cca2701e17eae55ae2d44fd22c=
942a:
> >
> >   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-202103=
07' into staging (2021-03-09 13:50:35 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.0-20210310
> >
> > for you to fetch changes up to eb7f80fd26d73e7e1af105431da58971b1dba517:
> >
> >   spapr.c: send QAPI event when memory hotunplug fails (2021-03-10 09:0=
7:09 +1100)
> >
> > ----------------------------------------------------------------
> > ppc patch queue for 2021-03-10
> >
> > Next batch of patches for the ppc target and machine types.  Includes:
> >  * Several cleanups for sm501 from Peter Maydell
> >  * An update to the SLOF guest firmware
> >  * Improved handling of hotplug failures in spapr, associated cleanups
> >    to the hotplug handling code
> >  * Several etsec fixes and cleanups from Bin Meng
> >  * Assorted other fixes and cleanups
> >
> > ----------------------------------------------------------------
> > Alexey Kardashevskiy (1):
> >       pseries: Update SLOF firmware image
> >
> > Bin Meng (2):
> >       hw/net: fsl_etsec: Fix build error when HEX_DUMP is on
> >       hw/ppc: e500: Add missing <ranges> in the eTSEC node
>=20
> It seems the following patch was missing?
> http://patchwork.ozlabs.org/project/qemu-devel/patch/1613660319-76960-1-g=
it-send-email-bmeng.cn@gmail.com/

Huh, sorry.  I don't know how that dropped out of my tree.

I don't really want to delay this batch, so can you resend please, and
I'll include it in the next batch.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wVUpL4Y0m3UB7jqf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBIYGEACgkQbDjKyiDZ
s5KVRw//Y24/5bNUuivh8o7GQEtTre59MTm6dFa/mMiprfQTIcyp0VBJCwgFVrJu
5ElKkXCfKV8R7cpI3TYSFel4jqZ/pPr+uuhpegdCKj3jB/ojfxqqWqbjdL2M+MAx
9ZPHf7SV6x1e0o4dGNY6zR+zxoMwFEf9DxVTaJiB2axkWIWA/K0l4gVUZZdlOV3S
+R09zOJna/mQsXMqAakSqzdT/WogbRFOA59xB4cFgEkcfleW7R0dBWYrGzQbGnsv
5xgxiedZzCnYSfr6wxhinfRjVZtgeQ1J1vNuNNaiMcsm5FsHI8mvm45Fv4z3I83j
J6UG1DUTejqHc9vM8OWtec3h8tGUQ3Up5RnueXIm7r6w4A8Fb2O9G/AwBReXSMRc
pAqJhT4epbuIJ4pIt/I65n+IiyH6wu2n29fHWCKeswEUasZB8izTqTng4MjbS+rL
tnqrgjN6B64Obu5txSYUzzFh1506ya0XcVHBDgXyV1vtUy7ivp5f5H1D9FcTXLiF
j/qcUOymBhbuOoe9g6qarL82idS//uZEGiP5MS+oEHTiGJZe7OEb/HrhLgZpk1Jp
WB0el/zLc7YyRL/2JoF8jWKejUKcyEu05y69WGB7NxdF/iWilaandvywwRweDWTf
DdTV+7izSd9EZoCPEBVNTKH/FXZf6xK/mtWHfhSjeosWMF7JoMU=
=rS8z
-----END PGP SIGNATURE-----

--wVUpL4Y0m3UB7jqf--

