Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B08A374D79
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 04:22:34 +0200 (CEST)
Received: from localhost ([::1]:46890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leTer-0003Kz-JL
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 22:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1leTav-0005ok-8J; Wed, 05 May 2021 22:18:29 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52435 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1leTaq-0004cW-Pl; Wed, 05 May 2021 22:18:27 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FbHLH6N6Bz9sV5; Thu,  6 May 2021 12:18:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620267495;
 bh=daju/0lx5xX6hEq2Bq2XKXme164tGydG2c4rUSaQWGA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XSSvE/GwrA0FW1MGF/w9bi/+KS5Pp28v91Zo2wz1Q4WavLxDQgJ7vL8B1yOuF9NiO
 8ETA1JrhEnR9IdhCaMjVJqGCJDXeweLF5j9swY3rXu+D9Wgq+RcosgEHIxhzeYA2lC
 s+SRSrWB6zDyVYdX+sf4OIC5cIcTJg/cbfYcDvd4=
Date: Thu, 6 May 2021 12:13:16 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 11/23] hw/intc/xics: Avoid dynamic stack allocation
Message-ID: <YJNQvHWqn3Jd3Qkx@yekko>
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-12-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wP+CZw1OggmrE+QJ"
Content-Disposition: inline
In-Reply-To: <20210505211047.1496765-12-philmd@redhat.com>
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--wP+CZw1OggmrE+QJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 05, 2021 at 11:10:35PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Use autofree heap allocation instead of variable-length
> array on the stack.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/intc/xics.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/intc/xics.c b/hw/intc/xics.c
> index 68f9d44feb4..c293d00d5c4 100644
> --- a/hw/intc/xics.c
> +++ b/hw/intc/xics.c
> @@ -566,8 +566,8 @@ static void ics_reset_irq(ICSIRQState *irq)
>  static void ics_reset(DeviceState *dev)
>  {
>      ICSState *ics =3D ICS(dev);
> +    g_autofree uint8_t *flags =3D g_malloc(ics->nr_irqs);
>      int i;
> -    uint8_t flags[ics->nr_irqs];
> =20
>      for (i =3D 0; i < ics->nr_irqs; i++) {
>          flags[i] =3D ics->irqs[i].flags;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wP+CZw1OggmrE+QJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCTULwACgkQbDjKyiDZ
s5JO/A//eboq5NXEV+CkaR/Fxs2uaVpDNp589b7QTMX5WlIbDaBjAHe7VQov8KnT
ComfaGNnWlwAX2dnIpxfEZrfEYtGIr8zunhRpxpG/XhnOFHvBCCkqBlMeVJ6S8T8
7h6Mc1+ZltXb7cGMG6WY9fnb5jLQFC1lHE2BiTsKbwLISiL5lH183swv0K5n9+xi
RKBdfoPoGr7Q36KwDDlwP0nxWG1ts557edqP/M5H1ZJQ3USlk+7Jt6qs4LM0puJY
+35kVybBivkhefKzMjPt0Z72jLVxsSpRwwWk7t/KT663UYCUl6qbX1+4uOuoMzHJ
xd9tDXnZ+B/vOGLvzsSXkibBiFN8wc+cL3iKguIb0gBRXw382kMkUmtaCtW5drJ9
RAspQQUH8AVau8IBhZxm/bDFK1tie79by8Tp4D9V4NbNzPQF2ML3UJqkXnlUUgQA
EYtHmUwJLBFnRs/Upetw5A5pVyzouQcsKrhNQ5jzU9GXgN5N+dUCi4nmy1a9/uOd
aoycsrjNbd+WD2iDc8r91UFJxeGxSEZBI1GX2WY7BtjDNkffjGrXokhxLi3+p5iV
EYlTmA/73YGFRN+WfrBT/sD20f/mnrEpnPlHpRDLMfI1gdmJbHJZIqSKVEqkA4Ha
Lq34UErkvlhHV1miGY2lLtPt5f92L+8xYwuKBYcMl4QX3R6uz1I=
=H4Pv
-----END PGP SIGNATURE-----

--wP+CZw1OggmrE+QJ--

