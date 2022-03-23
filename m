Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 546BF4E4AB8
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 03:06:20 +0100 (CET)
Received: from localhost ([::1]:45818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWqOA-00025d-1k
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 22:06:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nWqJr-0000Se-Bs; Tue, 22 Mar 2022 22:01:51 -0400
Received: from [2404:9400:2221:ea00::3] (port=52027 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nWqJo-0006Xk-CW; Tue, 22 Mar 2022 22:01:50 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4KNWn006Myz4xc5; Wed, 23 Mar 2022 13:01:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1648000900;
 bh=AGaOvqodvo8UaYVKAGN2U04x96fBR6iLwxvQjeL0Wgs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ASDuA+Y1xpEMhrmwhIJOnwxzB2n8Ug8CGvQGd2FCPCRS4ZiAv/IDlr5hyuDRK9Bfk
 89+BH3/HddQ6cZgqHKOKqoyL5OVYpGhmCu8ixILrphDVbFmK356gy2OQN/QHwuiiWr
 5AMPEBA1/9NYX29XAkIs9e6HvQKoX5UPDW2WVTSA=
Date: Wed, 23 Mar 2022 12:49:45 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH for-7.1 0/4] use dc->vmsd with spapr devices vmstate
Message-ID: <Yjp8uQECaWzan3bS@yekko>
References: <20220322183854.196063-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fNX5Ec9cp6OMIz7B"
Content-Disposition: inline
In-Reply-To: <20220322183854.196063-1-danielhb413@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2404:9400:2221:ea00::3
 (failed)
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--fNX5Ec9cp6OMIz7B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 22, 2022 at 03:38:50PM -0300, Daniel Henrique Barboza wrote:
> Hi,
>=20
> This short series converts some spapr devices to use the dc->vmsd
> interface to register the vmstate. For most of them it was needed
> to use qdev_set_legacy_instance_id() to keep compatibility with the
> instance_id being used for awhile.
>=20
> Although no functional changes were made the resulting code is a bit
> shorter and maintainable. After these patches there are only 3 places
> where vmstate_register() APIs are being used.
>=20
> No behavior changes were detected when testing migration scenarios with
> hotplug/unplug of devices.

Looks good tome.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--fNX5Ec9cp6OMIz7B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmI6fLIACgkQgypY4gEw
YSIY7RAAjttG/iD9JoF/lRqv2B16jXbgepZUyrK5jSyaYOBWTc/MdeCRexQ9Lbiw
AV8CTasVd+GE9rJw/MA6VpIHessbqxGYJJm8i4yD1IsQwRiSH1ug3DUC6CEiE56q
nwKrB+0MfJY94xk7l0WtF5kRVj2zDoyDGhD2GQc78SQaFSwUsYvqM23gP8Nn+C4/
tfBeySOS2Y7nK5oiVKDCWWzDBl4uXCuuXB9+XAMOR7F67cf0LcD8a2VWZUr+FNWX
P/wjpthsB6kpom3LD4dHZ5i+JKJvzaXeJxtVCfre/XRUvupxjtk5sHuVVdK6TfWJ
tkOQPcbkLVWnW+dyAf6RH83ip7vSxnpOpg+VPs8YALoWq9B/ggG8RlHE+ziJpdsW
XHH1jSXAre39YMnonR/i3cuHGCKPp+S6CRlDRXhOzkh9SOR0g1VM6u9pg907lqJS
99n3jWGt21safJ/6bYCcMSUno+0852H1486+jFJmddWieuR7FCPX+eAVUtxE3CE+
icxT10pB7RxIwW1a31Qwele/1v4HEs0tqTbM0QwhbqyhKcW1h1asTidAyBiQqxNC
2Dc5AHzgKgflu20UhJE6fQZjlcQjYA1TSMvdzEX5uaUGBWhY/HP3+aos1CftO2/m
h2GByZu2KD46GGgLd2XyaqwyrLZvfdKB4tb04SPD6PdggncIWzc=
=O9LT
-----END PGP SIGNATURE-----

--fNX5Ec9cp6OMIz7B--

