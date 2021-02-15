Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF6B31B562
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 07:28:22 +0100 (CET)
Received: from localhost ([::1]:47290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBXMq-0007BR-Qf
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 01:28:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lBXLf-0006fk-E2; Mon, 15 Feb 2021 01:27:07 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:38751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lBXLb-0001ro-18; Mon, 15 Feb 2021 01:27:06 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DfDf15chDz9rx8; Mon, 15 Feb 2021 17:26:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1613370409;
 bh=6QFspuApKUBbyTIz8sE6Qx/yiCNx6BcNoJ3Mo20FJ5Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dndp2/sOtTOe+eJu4ADslsAIU8kdkCmbywR3WI4nNSRAudE4I9rwfl4Emy6jHJnfz
 YBPLpR4mOYXtZ+7nssNGLsmRG6lyUu+jEwpYX82dWYTzZFnHrnDHUgDGPrftZMy5a7
 uZO9iUYXmN/gcH21lITCtqYKXeLBR+XfJSgjnXiY=
Date: Mon, 15 Feb 2021 17:12:38 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 0/3] hw/display/sm501: Tidy up template header
Message-ID: <YCoQ1mnORNTAjyIY@yekko.fritz.box>
References: <20210212180653.27588-1-peter.maydell@linaro.org>
 <8642ea4f-e75a-e12-211b-6495546aaee3@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ld0tJR9XIKA+7m0E"
Content-Disposition: inline
In-Reply-To: <8642ea4f-e75a-e12-211b-6495546aaee3@eik.bme.hu>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Ld0tJR9XIKA+7m0E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 12, 2021 at 09:28:35PM +0100, BALATON Zoltan wrote:
> On Fri, 12 Feb 2021, Peter Maydell wrote:
> > For a long time now the UI layer has guaranteed that the console
> > surface is always 32 bits per pixel RGB, but some older display device
> > models still have the code to handle other formats. This patchset
> > cleans up that dead code for the sm501 device, which allows us
> > to remove the multiply-included sm501_template.h header entirely.
> >=20
> > There have been a few attempts at doing this cleanup on this
> > device in the past by various people; rather than trying to
> > resurrect those old patchsets and get them to apply to the current
> > code in master, I just started from scratch.
> >=20
> > Tested with AROS ISO image on sam460ex.
> >=20
> > thanks
> > -- PMM
> >=20
> > Peter Maydell (3):
> >  hw/display/sm501: Remove dead code for non-32-bit RGB surfaces
> >  hw/display/sm501: Expand out macros in template header
> >  hw/display/sm501: Inline template header into C file
>=20
> I've tried with AmigaOS and MorphOS and those also work. Unfortunately the
> drivers for sm501 on those are restricted to 16bit modes (maybe because r=
eal
> hardware is too slow otherwise or does not have enough memory) so every
> screen update in QEMU needs conversion which makes it quite slow. But this
> was like that before and unless we want to allow other than 32bit surfaces
> again we can't use the code removed here but that was the reason I've kept
> it and not removed so far in case we want to do this optimisation again.
>=20
> Otherwise,
>=20
> Acked-by: BALATON Zoltan <balaton@eik.bme.hu>
>=20
> The sm501 is also used on the SH4 r2d machine I think. Aurelien probably
> knows more about that. I've found some images for it here:
>=20
> https://people.debian.org/~aurel32/qemu/sh4/
> https://lists.nongnu.org/archive/html/qemu-devel/2008-08/msg01308.html
>=20
> in case you want to test that too.

I've queued these to ppc-for-6.0.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Ld0tJR9XIKA+7m0E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAqENQACgkQbDjKyiDZ
s5KK6A/9FH1Oj3Cs8G/viifqHwyOK4SRJ+VUgBnhPkt9wKCQVt7fX0VqxZiM4Pjp
VSiW3YPpzYK9cHaaJeyLoUOVvYEwXNKyDEqiNSFJNPhWixJcnL+6Zoa/vNkWCHww
u5BTqPt3vMBUGK9z8KGlxlU/qYue5NTY42MITUDRElmioyNl1QBlHEUlw58BYxOB
Dsmx+/ToP+I/nKhkvyxVhgGkRgWelU0tIrKMYAzbUboh4wGmBIWU0EQQhvsO6SxV
/LUWwrhJeUJ07rWF/QVcLMzfCB6AthSOysROfRD/ctjEm7AClewkoydhR6lhKelS
eYUkScBs0bocr+aPPE8kld6P3Ta2KviaThtzjmBW35EWbkT5J+hUMclPEwLeVGBs
Fk60vJX2h5Sblk0vEbL6q1FzmbHm611JJkA0itGcQh4A336Ruw6Ay4oyRHjf6ZlT
fRpoLC2VpW4H7lOVWqRcntK78Mi6pL0k4Wi0dA1OSZuF+sYCzZL+Llp3FVtaBSB3
LvA1tydGNVHj/EQlJ1lMaR13yQYxr2p+228SKdlN9y53A6TfTRELZDCSGrIjZh09
kOaSQswgL/fx57RWSWpA26ptzVpSf1gq5Vp8gTd0ZILfAoG2Tom7HdSbv1p30Cpb
bzOcaxXwc8w7Dj8geyRVUqR8bcso8PkGFtlJ4SkAStNYGUrgtTQ=
=pPmI
-----END PGP SIGNATURE-----

--Ld0tJR9XIKA+7m0E--

