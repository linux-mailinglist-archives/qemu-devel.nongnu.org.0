Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389FE48E16B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 01:19:33 +0100 (CET)
Received: from localhost ([::1]:35354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8AJX-0003Av-O9
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 19:19:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n8AEh-0002Hr-Oy
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 19:14:31 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=35767
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n8AEd-0003Ns-Il
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 19:14:31 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JZhcR4W1Wz4y4q; Fri, 14 Jan 2022 11:14:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1642119255;
 bh=TVFdGuSS47j8/ryvqV3Sm536yfoPESKqf/5AnicOJ8s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iXAjpIIRmPsokYpikYJh7/CZE2nny/JVLFauOc1Kfi6CcPvm8JX9FJ52xIzITb5O3
 ngprNo6tjsqsMx+ck8ASYaNf79bdV+yu3OEES2iZn2LTOp/8BIgKMb9EuomVDllLlC
 0s1w/lkmuoBo0CV6GPofDfNd1ogVe9F3o/Osyir4=
Date: Fri, 14 Jan 2022 10:41:57 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: ppc pbr403 vmstate
Message-ID: <YeC4xYrYhdAKKwTx@yekko.fritz.box>
References: <YeB0zGRC/ct8DAzM@work-vm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kFpHUR3EA78QXSP6"
Content-Disposition: inline
In-Reply-To: <YeB0zGRC/ct8DAzM@work-vm>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: lvivier@redhat.com, peter.maydell@linaro.org, quintela@redhat.com,
 danielhb413@gmail.com, groug@kaod.org, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--kFpHUR3EA78QXSP6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 13, 2022 at 06:51:56PM +0000, Dr. David Alan Gilbert wrote:
> Hi,
>   Is there any easy way of getting a machine where the pbr403 vmstate
> would be generated?

The condition in pbr403_needed is...

    return (pvr & 0xffff0000) =3D=3D 0x00200000;

=2E. which looks to be the PVR for ppc403 models.  That makes sense with
the section name... but not so much with the fact that it's under
cpu/tlb6xx.  The 6xx MMU is basically unrelated to the 40x MMU.  But
it looks like the vmstate_tlbemb might be shared between then, because
of bad ideas of the past.

But in any case, we already dropped what little 403 support we ever
had - there's nothing with that PVR even listed in
target/ppc/cpu-models.h.

So I think we should just drop it.

>   Given my vague understanding of vmstate subsection naming, I think
> we need:
>=20
> diff --git a/target/ppc/machine.c b/target/ppc/machine.c
> index 756d8de5d8..e535edb7c4 100644
> --- a/target/ppc/machine.c
> +++ b/target/ppc/machine.c
> @@ -718,7 +718,7 @@ static bool pbr403_needed(void *opaque)
>  }
> =20
>  static const VMStateDescription vmstate_pbr403 =3D {
> -    .name =3D "cpu/pbr403",
> +    .name =3D "cpu/tlb6xx/pbr403",
>      .version_id =3D 1,
>      .minimum_version_id =3D 1,
>      .needed =3D pbr403_needed,
>=20
> to fit the rule where the name of a subsection is prefixed
> by the parent name. (Something a new check I added just triggered).
>=20
> Dave
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kFpHUR3EA78QXSP6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmHguKoACgkQgypY4gEw
YSImeA//ff66rjV2ZEG996r3RGwrbdUaL10FB/pZy0uNtLn/UB80dWJqzfuxzY3B
nZ8QpTERuAu6hxS8pwkT+XG0+GtOKwFcZxVL1jcgk9UDBH8731LEI3fyCuSzntoX
tHnrR7YEIIk1z2v2grNJ2iAgcxbzJwOGetfLvymSvTs53vfuaSNFeYdS7CJzGDA9
HHJYvDILuRibghhfVwlFxSULuPZ8bvV/3BuLNRz005Ww1mcQVzdcQ6tSjRoLcGyK
6Crzxwyi5tqbDVbdoXHUph/X7pVjDAnPM0mLdSpPibW2R7GLDu6c1TfKp81YS1qh
Q7w2POAgmcmnP5oGs38ih2Wp4EqzhAjteAaE0i7QD94k4jZMinMqCZiZmdS5leIr
QM49G/1/jJzQrq5qTFYPEOjeJkUek9yGG4PB7s6TRocfTbztAL72VE6BE14UgTQO
UAcOWajLx0ipP0kQwJpfNJ19I8a5Q0FwbquXUYkRjUDitTaHYztDZBVtiZmSCere
aN9hBQFOkcJHIVZBMJUJPFDRTGhQ7czLb8Oyl/1WX4PbKyHXSLJrIzcNZoQNBqvX
77WACX8w8OMM/GBYwOk26ZBH94Cjh461Q0qIqtHwqbwQngdsgLIFSKqxF7JqAPiv
UCFBNGBI3glj/U0dXxhwIZ/6zGqqvii1vNk69iJJQIeEZEvz59E=
=FIMh
-----END PGP SIGNATURE-----

--kFpHUR3EA78QXSP6--

