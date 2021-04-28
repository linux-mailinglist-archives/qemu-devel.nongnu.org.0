Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C5836D0A2
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 04:43:45 +0200 (CEST)
Received: from localhost ([::1]:58660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbaAy-00007A-B2
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 22:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lba9R-0007WT-25; Tue, 27 Apr 2021 22:42:09 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:54451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lba9N-0003nf-MN; Tue, 27 Apr 2021 22:42:08 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FVNFB67KQz9t10; Wed, 28 Apr 2021 12:41:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1619577710;
 bh=ANWjgwDe1TjUZ/Q32WH1tFN1UZrwFMH1UbzwNEbau5I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SZBVgaVIAGO+OixOp6EYCgW6UMoDmvE5/IgUBAN0OmABIXCHz+ZWUZbbEROauOjlO
 Aa22p6caGeFrE+FmcOjv+RoNIZeMubzeriZj7qWd92t1FAoyveyHdYkMX1U5nsagii
 POGnrt7P6qdocWADHlmzXDDUG8/8AU96aNaeelrw=
Date: Wed, 28 Apr 2021 11:59:12 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/5] hw/ppc/spapr_iommu: Register machine reset handler
Message-ID: <YIjBcIwjzs/sXw/8@yekko.fritz.box>
References: <20210424162229.3312116-1-f4bug@amsat.org>
 <20210424162229.3312116-2-f4bug@amsat.org>
 <YIdso1hf+bXwZHmG@yekko.fritz.box>
 <9dcc20c7-6371-dc77-1cd4-706301ec5c54@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9Lvzg736IYh6VK8T"
Content-Disposition: inline
In-Reply-To: <9dcc20c7-6371-dc77-1cd4-706301ec5c54@amsat.org>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9Lvzg736IYh6VK8T
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 27, 2021 at 11:20:07AM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 4/27/21 3:45 AM, David Gibson wrote:
> > On Sat, Apr 24, 2021 at 06:22:25PM +0200, Philippe Mathieu-Daud=E9 wrot=
e:
> >> The TYPE_SPAPR_TCE_TABLE device is bus-less, thus isn't reset
> >> automatically.  Register a reset handler to get reset with the
> >> machine.
> >>
> >> It doesn't seem to be an issue because it is that way since the
> >> device QDev'ifycation 8 years ago, in commit a83000f5e3f
> >> ("spapr-tce: make sPAPRTCETable a proper device").
> >> Still, correct to have a proper API usage.
> >=20
> > So, the reason this works now is that we explicitly call
> > device_reset() on the TCE table from the TCE tables "owner", either a
> > PHB (spapr_phb_reset()) or a VIO device (spapr_vio_quiesce_one()).
> >=20
> > I think we want either that, or the register_reset(), not both.
>=20
> rtas_quiesce() seems to call a DeviceClass::reset() on the
> children of TYPE_SPAPR_VIO_BUS:
>=20
> Abstract TYPE_VIO_SPAPR_DEVICE has the TYPE_SPAPR_VIO_BUS bus_type,
> and registers the spapr_vio_busdev_reset() handler, which calls
> spapr_vio_quiesce_one()...
>=20
> So either we already have 2 resets, or the bus is never reset?

There are 2 resets, and this is intentional.  We reset once at machine
reset time, via the bus.  Once a booting OS is done with the firmware
it calls "quiesce" to put all the devices back into a safe state.  The
easiest way to do that is just to invoke their reset callbacks, so
that's what we do.

> The bus is created in spapr_machine_init():
>=20
>     /* Set up VIO bus */
>     spapr->vio_bus =3D spapr_vio_bus_init();
>=20
> TYPE_SPAPR_MACHINE class registers spapr_machine_reset(), which
> manually calls qemu_devices_reset() and spapr_drc_reset_all(),
> but I can't understand if a callee resets vio_bus...
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9Lvzg736IYh6VK8T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCIwWwACgkQbDjKyiDZ
s5KbLRAA3PlW/qwbtrbccUaH7QHJiZGmMinRs3JRCLXz+gR1Ha+vPFrIVfGJPf12
QosuOZF2lUNNwzfUzhNp5EoUAbRw1me50kGKYkueStRSVBQKiRYfnB/t0O/MtNoj
bkxwcbDjjpFwhkp0u66+kKqb/9qpC2GebUE+JS1Xt+c7W7LXjY4FhveaI79Si5Li
bRWgoAw8pyxjcLJ7b6Z08N+WR94nS26G7K8lSjzy4EkkqakY8z2vhiMfgqDRQdQL
eUQMxZql60Tuj+vaF3u+CMcEVFAhV2V6/+bC/USdXyrr1nMpVd6h42lzjgHC3RbF
67c9tPpm3XSThJzWb/pRpANxk0SDJcLvCI/gIL6hPA/gPuPzgG1d//ruXJCCAT8K
Fn7ajvIdaHBa9wJrFhqNzRQieRGPb+a9moX3X3DmWNXxxFgxX+4tcOp2v1Lt6Fon
oboXa6ZLX9D/9ytgcpR7v59SdjIwPPEViPT0njYdvGLL9mXwK7bIt4CLd9bMiML6
35w2QYZ6emGZFZuJCQSTaMf2FDeZY3e2Ozr9JjUFa2kHnVnxkZeaGFsyTBQusm5q
ytm4XY52PYJrczmI+lCCWOdKTcHmHW/zn1AncpvEegipK1UJ/v8ePvDb28eD7349
Oz6bbsOHheSghLm+kO/mO5DckcUhLS770HI+vk8QD2pwZZqUVoE=
=4NfW
-----END PGP SIGNATURE-----

--9Lvzg736IYh6VK8T--

