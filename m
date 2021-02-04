Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8D431012F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 01:02:31 +0100 (CET)
Received: from localhost ([::1]:60056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7oZx-0005SD-RQ
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 19:02:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l7oYb-0004uE-0D; Thu, 04 Feb 2021 19:01:05 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:60723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l7oYX-00058R-Jl; Thu, 04 Feb 2021 19:01:04 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DWwYN0wbTz9sXV; Fri,  5 Feb 2021 11:00:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612483256;
 bh=fYSxbQTl3ie6d6oEb60s21DifOw/wFjU6lXoRogpTyw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JEAO685VzILZwsTK3Bp9RsoDg3I/KgzISA8ONu772meDTyhBdYW5T+CrsHjp/hZWG
 V6fvgNfGtAMnGOmYhoVkTx7hZ4O3RpNzfxyK92AGbHkYTGrWztjzcej1I48c1bVDW1
 AMSlMQvDs0+drYlhFNzDEg/sD0Wlw+0wnXE8TBPw=
Date: Fri, 5 Feb 2021 10:51:30 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v2 2/2] hw/ppc: e500: Fill in correct <clock-frequency>
 for the serial nodes
Message-ID: <20210204235130.GF4729@yekko.fritz.box>
References: <1612362288-22216-1-git-send-email-bmeng.cn@gmail.com>
 <1612362288-22216-2-git-send-email-bmeng.cn@gmail.com>
 <20210204025953.GE4729@yekko.fritz.box>
 <CAEUhbmWVCur36ZS4QNjiDfYrotsH-8=-uDn=rpxOiwAnwSGf6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aZoGpuMECXJckB41"
Content-Disposition: inline
In-Reply-To: <CAEUhbmWVCur36ZS4QNjiDfYrotsH-8=-uDn=rpxOiwAnwSGf6Q@mail.gmail.com>
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--aZoGpuMECXJckB41
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 04, 2021 at 01:05:19PM +0800, Bin Meng wrote:
> On Thu, Feb 4, 2021 at 12:58 PM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> >
> > On Wed, Feb 03, 2021 at 10:24:48PM +0800, Bin Meng wrote:
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > At present the <clock-frequency> property of the serial node is
> > > populated with value zero. U-Boot's ns16550 driver is not happy
> > > about this, so let's fill in a meaningful value.
> >
> > Are you sure this is correct - that is that the serial clock is really
> > the same as the overall system clock?  Quite often there's some kind
> > of divider in between.
> >
>=20
> Yes, see the U-Boot codes include/configs/qemu-ppce500.h
>=20
> #define CONFIG_SYS_NS16550_CLK          (get_bus_freq(0))
>=20
> get_bus_freq(0) eventually returns the platform clock frequency which is =
400MHz.
>=20
> But the value doesn't matter anyway for QEMU. We don't emulate any
> baud rate specific thing for a serial port. We only need a sane value
> that is non-zero.

Understood.  Applied to ppc-for-6.0.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--aZoGpuMECXJckB41
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAciIAACgkQbDjKyiDZ
s5Lc8Q/9Ha52t2SlcRrM4mh/bHXww82BmeHJ6+DUNhRB5Iu8xMDB58EUZh6IspZy
JIvRRD8F5Cq6s0AxmMJk3hRd0Y0tV/CeQ7Hd5PXcapiw4irPD27q//S68yipF6S8
zt0By9Dve2+5yhdTCYwiRMKsEVTHIxZDR2wpiid/hndu7k7KWy83fmRzzApBFdUV
h3YNwPwfidsRv+k836kGD1WP+qT70tTKpnZ7S2xan5iquSAMl811E1Qwbrq2Wl1f
GqwC5fBasixKMEntimq2nNaBwPhMyzH/9zqyJXroLKfNnCOsAJiQyVHQ3WDdIFIv
tbZ9XTco64O0V0+jNBAcT0jRKPLuUtj+eaETmKVRWvaHNgxFZFplTzxOGmos3YRG
B+CwZg7AkI7FxXOD1GhRrgeDWvLK/Wev0ByR3ju3dii22iBTdviPbp3ufcokoZ3D
t+aUDgz78nIizFELRoWGmBLg+rqzULl288wHKB/Z2lLIbQbCCdKN/5+zblKsiIzo
vmoRafdMUjuW6RphIOTBkiKrYejcSZ4eger80kxPBBygzuXuLBARsQ9eiIQjxwV8
5cQZIqod3wfn5K2BKQu2JptKdS15dRkleMaOlbTZ/FAbshhjbJXcSOmtdNPlrZhk
KKXYMzO7im0tqHwfVEY4nZMTv5zWSh9C3hkvQeEB53UA/Mxdl5I=
=EuzK
-----END PGP SIGNATURE-----

--aZoGpuMECXJckB41--

