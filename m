Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE873F927C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 04:44:02 +0200 (CEST)
Received: from localhost ([::1]:55004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJRqQ-000726-SU
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 22:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJRme-0006DT-DQ
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 22:39:56 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52607 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJRma-0007Ab-T5
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 22:39:56 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GwkSs47Dqz9sVw; Fri, 27 Aug 2021 12:39:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630031981;
 bh=jFjg7zSHptXuUExa8Hb0/MIGCWZ21BiPvlf+W6uJnhI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RoI1B9cimyPeTABV6a7yIknWTNOEDg1k1G/6N+9/5SVWMiZ2KPwQFYNyNYmWVCtnZ
 9gxBbmFKqEejeY5Py0ax1HFFA7gzB5RVx1k6SGKGmdRJMEB+dnR4dq1FhZN/vI7TlK
 jzm5cmygaXs0oZX6pa1/M7vhPVQTiG8ejdwqzyjo=
Date: Fri, 27 Aug 2021 12:39:34 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH] RFC: build-sys: drop dtc submodule
Message-ID: <YShQZmA24aYsNWhN@yekko>
References: <20210825124309.223622-1-marcandre.lureau@redhat.com>
 <c79fb3c7-e6cc-adea-b694-ffe1f25c0d59@amsat.org>
 <CAFEAcA8YNwe-PCt2VuY4Fhjbyqnm2G7BpZDs6wyXNFh3pmee2Q@mail.gmail.com>
 <CAJ+F1CKx=24Hssrz=yz+D8Q2nTXcgaLeMFdB5tfHfdWRAZ-p+g@mail.gmail.com>
 <CAFEAcA-_Xcep33jG91M3j=bySpWS60zKyydm-jO8nn8nKg_6aQ@mail.gmail.com>
 <CAJ+F1CKo2hVhwKs+fH-W5rq04gCPiwjxe5HfFsg16gvTnH5U-A@mail.gmail.com>
 <YScGLe9HTm404Jc8@yekko>
 <CAJ+F1C+fxCyW+SrORudyoBi=ZYQD_v2MkAdRbaVgW-gh9580QA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nFewlV3cgnRMorpD"
Content-Disposition: inline
In-Reply-To: <CAJ+F1C+fxCyW+SrORudyoBi=ZYQD_v2MkAdRbaVgW-gh9580QA@mail.gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--nFewlV3cgnRMorpD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 26, 2021 at 11:34:59AM +0400, Marc-Andr=E9 Lureau wrote:
> Hi
>=20
> On Thu, Aug 26, 2021 at 7:11 AM David Gibson <david@gibson.dropbear.id.au>
> wrote:
>=20
> > On Thu, Aug 26, 2021 at 12:11:17AM +0400, Marc-Andr=E9 Lureau wrote:
> > > Hi
> > >
> > > On Thu, Aug 26, 2021 at 12:00 AM Peter Maydell <peter.maydell@linaro.=
org
> > >
> > > wrote:
> > >
> > > > On Wed, 25 Aug 2021 at 20:55, Marc-Andr=E9 Lureau
> > > > <marcandre.lureau@gmail.com> wrote:
> > > > > fdt_check_full was added in 1.4.7:
> > > > > https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tag/?h=3Dv1.4.7
> > > > >
> > > > > Only ubuntu appears to be lagging a bit behind. I wonder if they
> > would
> > > > consider an update.
> > > >
> > > > I doubt it. You would need to wait until that actually falls off
> > > > our supported list. You also have a couple of years to wait until
> > > > Debian oldstable is no longer on our supported list.
> > > >
> > > > Maybe, I don't know why debian oldstable would have received a new
> > version
> > > plus fixes, and not ubuntu.
> > >
> > > It seems we could have our own fallback copy of fdt_check_full() thou=
gh..
> > > I'll give that a try.
> >
> > We could, but fdt_check_full() is actually a pretty complex function.
> >
> >
> Yeah, that would be used for those who don't have >=3D 1.4.7.
>=20
> Alternatively we could lower the fdt_check_full to fdt_check_header in th=
is
> case? It seems it is used to verify the DT from SLOF. It may be trusted I
> suppose, or a malformed DT may only impact the guest?

No, fdt_check_header() isn't enough.  We can't trust the dt blob from
SLOF, because it's coming from guest context.  We *expect* it to come
=66rom the SLOF iamge we control, but nothing prevents anything else in
the guest from calling the hypercall, or corrupting the in-memory SLOF
image.

And, a bad DT won't just impact the guest - there's a couple of things
we need from it (that's the only reason we need to have SLOF give us
back the DT at all).  Note that the blob might not just have bad
content, but could have bad formatting which will make the functions
qemu uses to access it misbehave.  So, our options are either be
super-careful on every possible DT access after this point, or
pre-check it when it's loaded with fdt_check_full().

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--nFewlV3cgnRMorpD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEoUGMACgkQbDjKyiDZ
s5I5+xAAlS29VfClVn2zYW3zAW2gDG0rgbi/A96Kw49fIAdEne1lEooWyk5J7PlW
EvX/I6REh6+C7A9gzoo0UaZQsdPFlHxI1ggRGW2BTJo6/8CHkw7gZI0FL8Fu7hrZ
qmCsSUqPi7v5Ohta9MtP5xqydJCyGMa4zcczoMLTTfruXEiYgutupkH3Te5wcsP8
s3dD2Eq5DAe72BzbQqBGfungJMwd5VKD+tsyU+3aztmoZUBzF307gHc/elJNdGZp
zIxX3+cMuFh7+LvmXMppMABTQrSI7kCBBcT/IATG3P9pV402at9QpipEXl9AnUVt
b2vCgEiwJ4yYLbO46lprOnUqkTAF4onAdqsBilorNv2AmGBupC6+uo+CC3Q1VCLk
A11SQhwEJ9lkCxZEdvV1td1O9t6RG9rF8ZaMkdskmaegBClufvQlm5tq2qu32Lfg
8gQ0w9lZgxEJ54QIYpT1f0K0PyEKs7M3/seSHv2KBHhd2FbmBnClG/S6fTkspySl
1IFBhEd/axfyb5KHiO/1IZ1MXpqamrnpcFCbJ3YtqomBHskoR3e7QwEWiSIdy8wQ
bu0+jfuWPBUx7g3fIM0qcSHhDVaqQQazR7eM9cOSKiApzGZb/dIyBDNwV065ERbv
AI36N2wDzjOmk/2V1YnXGIARMm/8+Bt7uKlXCJdk/2Xrs82tvCA=
=YTJt
-----END PGP SIGNATURE-----

--nFewlV3cgnRMorpD--

