Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA9C3F6E43
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 06:24:43 +0200 (CEST)
Received: from localhost ([::1]:53540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIkSw-0000EE-HU
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 00:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkGf-0000ih-Fd; Wed, 25 Aug 2021 00:12:01 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34773 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkGd-0007UH-54; Wed, 25 Aug 2021 00:12:00 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GvXbv0Cr4z9t1s; Wed, 25 Aug 2021 14:11:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629864699;
 bh=KUjvSXLaPBElb14YlGjqlr/yPPG1S3QimQFa3b1SKX0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ErdvnorpMsh2QSpYMMLP4vksgfm0akCcGT66l/2wFvekXJFbnVbG7tFfB2hR1UpKC
 ojEVhWb4Wrkd2y/RHIJCC1WpQTM5eep+WDNfyFHEDdANuKysKCz5/gcznFS4oBuz6u
 kiIPAVUg9sd4AyzfHAkVgCYrgRl4sHIYNVcNl300=
Date: Wed, 25 Aug 2021 13:50:09 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v7 3/7] spapr_drc.c: do not error_report() when
 drc->dev->id == NULL
Message-ID: <YSW98bo+4kmpYP/a@yekko>
References: <20210825004835.472919-1-danielhb413@gmail.com>
 <20210825004835.472919-4-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qsdsl/TTsD2FcioZ"
Content-Disposition: inline
In-Reply-To: <20210825004835.472919-4-danielhb413@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: armbru@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--qsdsl/TTsD2FcioZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 09:48:31PM -0300, Daniel Henrique Barboza wrote:
> The error_report() call in drc_unisolate_logical() is not considering
> that drc->dev->id can be NULL, and the underlying functions error_report()
> calls to do its job (vprintf(), g_strdup_printf() ...) has undefined
> behavior when trying to handle "%s" with NULL arguments.
>=20
> Besides, there is no utility into reporting that an unknown device was
> rejected by the guest.
>=20
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr_drc.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index a2f2634601..a4d9496f76 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -167,8 +167,11 @@ static uint32_t drc_unisolate_logical(SpaprDrc *drc)
>              }
> =20
>              drc->unplug_requested =3D false;
> -            error_report("Device hotunplug rejected by the guest "
> -                         "for device %s", drc->dev->id);
> +
> +            if (drc->dev->id) {
> +                error_report("Device hotunplug rejected by the guest "
> +                             "for device %s", drc->dev->id);
> +            }
> =20
>              /*
>               * TODO: send a QAPI DEVICE_UNPLUG_ERROR event when

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qsdsl/TTsD2FcioZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmElvfEACgkQbDjKyiDZ
s5K5fg/+OK+MYeb4XL251XtByvdh55dLHPC1Yp8/Nj94ACY84IG+gG0Hf1LjJ1mD
rZImQKpV2uS/6Qs68vXFNFU8EEURMbhDLcZTSRZ614VTOQDDqlVOME5BbopEQzbZ
qqzYhYsEV7zIhdv6sp6Hy9h34Uoeuq51lgyM8i9BtanrBogxr7BamqSkIKKNzPbj
epyZtiSL0QK///Y1+lS7Joxi5OZTm3b6BidZGQlWC91gxN7I6nbJ2J3VfMMXTYTD
NEnI2ZjsqSyPomfdSOhOBzZdeHfvg4WBB88UNgWTuN72oZZRMpm+qf4/6sXoGOhe
3C/O9yTDmy9u2jPT+OUrHgoHmNL4yuPJ55BbwiOwyV7I44ZMvzozxOUaWuZMRGGO
NZWtG+okD/h3YY7gqWp1G9KHHmpTJoGuXBHR7A4cYAowDxir3HVEY2jK9ZiRI0hn
22B3Ew9zRCl8rlp9XYDnoxOxGENVVShvy0HmfDDC0KTHAhVYUWMTa4EzdoEt9E8y
1EsViMTAIG7YytPknTfUC6VHM3t1Mpv45YJnSODeKvkWlAsDwxbUCzxnef1coMIf
m3JDZ9Cj7zmr38YiTEPVtnPh5m5ZlAwfHzcfUrrv0oGPGCECBOxveHPahmtDFqUA
zgYjrXZ7JlgQx429IRfbthxjVOvlFhgwXTpXawp9WuhyyTEHXbc=
=nFIO
-----END PGP SIGNATURE-----

--qsdsl/TTsD2FcioZ--

