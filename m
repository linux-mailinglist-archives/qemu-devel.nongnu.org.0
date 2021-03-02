Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D044D32959F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 03:14:58 +0100 (CET)
Received: from localhost ([::1]:56630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGuYq-0007dL-Lj
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 21:14:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lGuVq-00068n-Vw; Mon, 01 Mar 2021 21:11:50 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:53645 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lGuVm-0005ZS-RP; Mon, 01 Mar 2021 21:11:50 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DqLGb3wcDz9sWC; Tue,  2 Mar 2021 13:11:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614651095;
 bh=MKic3mDArUovv31IPAtWJYVQM10tSOYWKK/shInYkRM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IMzGVhZ9ZiZ+DRPnniZCUjwbqFEcq9DYyEfQJ0UjeRusl8K7+/6czFgd7K7mexO/7
 AKC9ICmmpzbghRwxBVOcvaNf2jWiTN6lfNYgmV5V5WDehva60pUNDtBmVV406LeGe2
 1MuX2UCbL0tuPgmHxa4ZX8oU0evseSJaKTl2ZNug=
Date: Tue, 2 Mar 2021 13:08:12 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 4/5] spapr_pci.c: add 'unplug already in progress'
 message for PCI unplug
Message-ID: <YD2eDG1lNTrePreB@yekko.fritz.box>
References: <20210226163301.419727-1-danielhb413@gmail.com>
 <20210226163301.419727-5-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JL8L+BWEOMkBk1ZM"
Content-Disposition: inline
In-Reply-To: <20210226163301.419727-5-danielhb413@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--JL8L+BWEOMkBk1ZM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2021 at 01:33:00PM -0300, Daniel Henrique Barboza wrote:
> Hotunplug for all other devices are warning the user when the hotunplug
> is already in progress. Do the same for PCI devices in
> spapr_pci_unplug_request().
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Applied to ppc-for-6.0.

> ---
>  hw/ppc/spapr_pci.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index b00e9609ae..feba18cb12 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -1743,6 +1743,10 @@ static void spapr_pci_unplug_request(HotplugHandle=
r *plug_handler,
>                  }
>              }
>          }
> +    } else {
> +        error_setg(errp,
> +                   "PCI device unplug already in progress for device %s",
> +                   drc->dev->id);
>      }
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JL8L+BWEOMkBk1ZM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA9ngwACgkQbDjKyiDZ
s5LhFBAAq/Kp3AQEz6XqNBpAUcKGAap3Qg9t6wMtYg+t0Eewpw9sYPhexojDwfwF
H9AsG0jk6pfrYw9zIO0fV+IINiD/a8yu168hc09bVHhKJvFkmGSnyxIQN6mv44Fg
yNf/M+2CxE7qzplyXTNGi/XrPWIKaLbxehTsl7BKdxUTCQlMueTnhrrks3FON3h5
uRbOj5N1d+e7ZwQON7+u+9HhnKxiRylxUuPqRIOrPlwdzMw0QhaaKff51xmIMoYD
LBgSCbtS/ZqnsqEQzylboW6TngUyxVAMt/oXwlQKCUJMPhVh/VrixVps8oByRWoY
eozEZi9+IXxBgxOjl3/s/3fepAQc7EfbOlrP6skl604Zc7h3et2IJH/IWQwwjUKI
vlwvXrICfdaqu3hCXzaw+xjiENT58BJ1goiPnqlnAQS3b3uZVDQaZx/4PTTRUpxz
q8XVGRJobliY3FsFWqYhvMtkycK3Pt0ucJzLJRX66hjsY800dQRIutIwMyvvO4b5
tI3SBqAckVls5JiElg984enl+vlcOkN1F4E8FqMjg+ULZfhh94Wm1PQsJ01JMIsz
OnJYoBQlKlAvgkeyS9uWCYmLw/DBlF34+krCyu9TjzLJ9TcH7YI/zi2bWX66ARGF
FAC+hnS2GREQybPnUgWtsRudrJtuot79CySO7NizOEGXsNDE3Nw=
=WCZb
-----END PGP SIGNATURE-----

--JL8L+BWEOMkBk1ZM--

