Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4212E349F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 08:08:24 +0100 (CET)
Received: from localhost ([::1]:35360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktmdj-0004h0-Tv
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 02:08:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ktmcH-0004AT-A6; Mon, 28 Dec 2020 02:06:53 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:32953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ktmcF-0007PB-Eo; Mon, 28 Dec 2020 02:06:53 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D47rj0LP7z9sWb; Mon, 28 Dec 2020 18:06:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609139205;
 bh=M5io8LeK4w2/1J3/77YhoIp4slCRM9kSQ55AcC3j5QE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d/xyPZRp1AgXgdwQ8JBam3hSXhsWSP5l0J0/17raUzv0sW9bk3MngE2Zy/krK/5NJ
 5bOwrPnOFamw7D53s85mMllKo58KsZyVzPsJp7fRTFCPb/Yai4AQ+XnuvRwr8POIxw
 cFPbtJ0SJNPpVx+LQfh7vt0z2T66UTzJ8IpxBNbc=
Date: Mon, 28 Dec 2020 18:06:39 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 1/7] mac_oldworld: remove duplicate bus check for
 PPC_INPUT(env)
Message-ID: <20201228070639.GC6952@yekko.fritz.box>
References: <20201219104229.1964-1-mark.cave-ayland@ilande.co.uk>
 <20201219104229.1964-2-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rQ2U398070+RC21q"
Content-Disposition: inline
In-Reply-To: <20201219104229.1964-2-mark.cave-ayland@ilande.co.uk>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: thuth@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--rQ2U398070+RC21q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 19, 2020 at 10:42:23AM +0000, Mark Cave-Ayland wrote:
> This condition will have already been caught when wiring the heathrow PIC
> irqs to the CPU.
>=20
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/mac_oldworld.c | 6 ------
>  1 file changed, 6 deletions(-)
>=20
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index 04f98a4d81..2ead34bdf1 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -251,12 +251,6 @@ static void ppc_heathrow_init(MachineState *machine)
>          tbfreq =3D TBFREQ;
>      }
> =20
> -    /* init basic PC hardware */
> -    if (PPC_INPUT(env) !=3D PPC_FLAGS_INPUT_6xx) {
> -        error_report("Only 6xx bus is supported on heathrow machine");
> -        exit(1);
> -    }
> -
>      /* Grackle PCI host bridge */
>      dev =3D qdev_new(TYPE_GRACKLE_PCI_HOST_BRIDGE);
>      qdev_prop_set_uint32(dev, "ofw-addr", 0x80000000);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rQ2U398070+RC21q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/pg/8ACgkQbDjKyiDZ
s5KCTRAAugJBksZLM4yQmzW2410i9ZBelqSOtPmCtkExM6UMf7zbmfbhx8j2Najs
rq7ww36ad5RYOynbUWL5d2DNzcENF19pywKvMbvREE26Tj/eyVczr9EPjcB1vVSs
CYYRsE7LXfr25/bwHUeu03WQq6YkGX+tjt6bzFpn6KIAoeuvFxPNPSjhf4aa8Nyq
WY0ihprYq/omTf6Crx4AP0Xg0azpaV+Ql6/8IW1c6lxiqOx81GgYdN5oq02G3XTk
5G5nC7W2aDe2uKKWcIs7rkwO0bU/k636pDBG0TPzcBUcbTPiZcbowbpcu73ck+kv
fcVRpxgBTeE7M1HYhb8m4UxzbsdwpwCSeD/BX/4CfklcDhtpjgKiGxq3FmZPyEjt
EXZ2jYFFQP0QXm2LiQC9GXEfYiAxoizGz8jDf8iw8LtZBSCk5LiiP+zp1IpJ7LW+
PEY8veqGCeZP17iyuv4iCtvGVcZtMvNN/vjOkvRRnsKG+o7fcC5NmmUmNM+4FbIQ
yDUJl51IbxlKu0+Xld7RRa3f8bGszlc3gGr6a/RWwLbHW2E38qJI54P0YmkEifY/
aXCmQ50flvOnhqUNyjiBxUWDZLdw9+ZKGY2gQikfw24GwYWnGFjqjTuw375Ndq85
z0pY8NCyFjMomksJ7GS413OWf6OJ4rd3I3inZE2ZlcDHW6qA7x0=
=F9DC
-----END PGP SIGNATURE-----

--rQ2U398070+RC21q--

