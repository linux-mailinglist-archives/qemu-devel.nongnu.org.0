Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFDD3EA4AE
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 14:28:14 +0200 (CEST)
Received: from localhost ([::1]:43950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE9oj-000367-O0
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 08:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mE9nf-0002DQ-Hm; Thu, 12 Aug 2021 08:27:07 -0400
Received: from redisdead.crans.org ([2a0c:700:2::ff:fe01:2402]:49228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mE9nd-000847-OH; Thu, 12 Aug 2021 08:27:07 -0400
Received: from [IPv6:2a0c:700:3012:13:7783:661a:ffa4:4d1f] (unknown
 [IPv6:2a0c:700:3012:13:7783:661a:ffa4:4d1f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id A7E1A251;
 Thu, 12 Aug 2021 14:27:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1628771222; bh=Sz4xjoMFQyq2+Tf5YFpPUeLNWXw7+iMJJctcJBs19rU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=GBPZ12GyMI/JjcL1mvAQvyVQTSw+DYJsU1Iq+ZUrz8U2bB8QIKWx0hlrx0gHzmUm6
 UCKIRTeURdNsywrqqJ215M0U9YuHvSOpKd8GDbH0nGy4z6NlFvt+/bq8DU+P9hwsz/
 RImqLTzPiFLvZl3rjSF3OsS3mNf/YzEJBxi6CsoamzflNRjYWHZsxWz3a6aU5jXZht
 tWf+xySjumSyo7wHFib9fPK9wvkITf36bEkOTIaaqeAcoty7EbP6C66l6HkbY+rDts
 IToV2Q3uC+0vVuFLyL36/weYzp8V5EibUY82UQGLZNvOg4LZ10GPmhPzTUOwEh9s/F
 HJblyuwpvjsdVZjRSF+Rt6KIAJ2HMvg2r3jSQ+oMrDXZ7WHU9UVZYa3ldz9hsyzrQO
 Y4/0Kpv/aI3+NiV4T+vx45ytGlgzmZ1kQQuNdUHO5rEvPwCXaOjuRcoBYg6xcQLbVI
 SQV2eN2FnYJ8R4e3dyae2LatRg9rFM/dddhQWtoDBt1HJF19U+mw5iLsRUNtKA5j16
 tuR2Ebqrb/CsOVNYxnkh2wbdO239+WEnzcwQR44k6kN6r311dUZgaoR/KMvIYdJ8Lx
 0u1R8FQg36U8wAmhr5h1fG09aLbtSsMNAAWCMVq6I3WdmBB3BozG1sAJc2GOOg0ceJ
 Kxj6PjelCT+RzBZZ1rMwsqNo=
Subject: Re: [PATCH for-6.2 14/25] hw/arm/stm32vldiscovery: Delete trailing
 blank line
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-15-peter.maydell@linaro.org>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Message-ID: <cd01ec10-d648-19a0-4abd-2a263815cd8b@crans.org>
Date: Thu, 12 Aug 2021 14:27:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210812093356.1946-15-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="fIAhslYSOWGT5tecnf7JL9P8y81fJlGk5"
Received-SPF: pass client-ip=2a0c:700:2::ff:fe01:2402;
 envelope-from=erdnaxe@crans.org; helo=redisdead.crans.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <alistair@alistair23.me>, Luc Michel <luc@lmichel.fr>,
 Joel Stanley <joel@jms.id.au>, Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fIAhslYSOWGT5tecnf7JL9P8y81fJlGk5
Content-Type: multipart/mixed; boundary="ntQfvTq6GbBMkGNkfiX0LybC6YmKfbWFC";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Luc Michel <luc@lmichel.fr>, Damien Hedde <damien.hedde@greensocs.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>
Message-ID: <cd01ec10-d648-19a0-4abd-2a263815cd8b@crans.org>
Subject: Re: [PATCH for-6.2 14/25] hw/arm/stm32vldiscovery: Delete trailing
 blank line
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-15-peter.maydell@linaro.org>
In-Reply-To: <20210812093356.1946-15-peter.maydell@linaro.org>

--ntQfvTq6GbBMkGNkfiX0LybC6YmKfbWFC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


On 8/12/21 11:33 AM, Peter Maydell wrote:
> Delete the trailing blank line at the end of the source file.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/stm32vldiscovery.c | 1 -
>   1 file changed, 1 deletion(-)
>=20
> diff --git a/hw/arm/stm32vldiscovery.c b/hw/arm/stm32vldiscovery.c
> index 07e401a818d..9b79004703b 100644
> --- a/hw/arm/stm32vldiscovery.c
> +++ b/hw/arm/stm32vldiscovery.c
> @@ -65,4 +65,3 @@ static void stm32vldiscovery_machine_init(MachineClas=
s *mc)
>   }
>  =20
>   DEFINE_MACHINE("stm32vldiscovery", stm32vldiscovery_machine_init)
> -
>=20

Reviewed-by: Alexandre Iooss <erdnaxe@crans.org>

Thanks,
-- Alexandre


--ntQfvTq6GbBMkGNkfiX0LybC6YmKfbWFC--

--fIAhslYSOWGT5tecnf7JL9P8y81fJlGk5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmEVE5YFAwAAAAAACgkQbHknjz/NzALG
8hAAsWzUo2ry57dmtrgUHDcnY1gTBm8V7BhyKWRCPn50osIzFALd6zFqZNhFrVcawsY/KHJeidUO
14aYByj90PGe5tsrh+ijAbfKXP+29ngNMDlTov+a5HNHANRDbc+B6QngyTS98WPehqzJZaFGijtr
e2hzK6VRkgjj2XzXCrgw1sgMr8n46opaZyOYkCk/mOw2g2nRhPQk3GOeOGW5Ihdlrzeci6L4sLkY
ijmA/dW1ce+BWs+6dbAosfOkCoO7+ahtULkXsM+46XC99XXaeP9xQqIBT3N12F7WRvBDShZgEWTK
bxTc1Wk/1E3tT8TYaxVBsoj4VRgA+25dV/PPapjiwRQ8GHqg+S/J2/q6QMK244/EvdfjPCLTi9sC
YmnTLJHePQNnEytDwJcYrQrxHgWVB6FgCRJRbuHlZ+lbgV3iOmDKG06eESEhy3YQGts7xywtrtZ0
76pIZU3If95Hc4CDEDEfY/47y86XG4AIDBu3Y319nyHOvF3Zj+TC2oNYCws7F2SpVOejaiGga8D+
UnlsKJqERaWiHDuULsV9eipWGWMOTrePqs3y25kGunfPRtMWUVgv5/ZAvzpJW2qdKqHU+8RvOML0
RF0jUytWSKW1yyCQfJY58UOwSmtolujcJ3n0tjOkOlkiMUQE00sd/2fVauGEX+0i+Z2TrXbn+RC8
nVI=
=E7ue
-----END PGP SIGNATURE-----

--fIAhslYSOWGT5tecnf7JL9P8y81fJlGk5--

