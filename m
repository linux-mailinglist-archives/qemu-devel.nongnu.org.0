Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 912DB3F6E30
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 06:17:10 +0200 (CEST)
Received: from localhost ([::1]:34598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIkLY-0004HF-9s
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 00:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkGd-0000fV-Bc; Wed, 25 Aug 2021 00:11:59 -0400
Received: from ozlabs.org ([203.11.71.1]:45057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkGb-0007Tb-DC; Wed, 25 Aug 2021 00:11:59 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GvXbt6FSGz9t18; Wed, 25 Aug 2021 14:11:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629864698;
 bh=6jga2dDoFxeOs4eunpZO5DN8xczZuRtl/DE6QKzmo6o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YzwWfPV5GxgTltttI5wjmBwobJj0XwVxnbGPaEnI0Dyd14gVVfOdY5QKDxdci8SCj
 EwWz8HFyyEDgE5HSTwZGt3gt6Whk0OWSycMIHQHM9h0UFYr4AEB1hvwtv0oenZXyZi
 wTopggM5hCI7qE7RIExQ/Ma+/dBuiEj8iHwqw5tM=
Date: Wed, 25 Aug 2021 13:46:34 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Luis Pires <luis.pires@eldorado.org.br>
Subject: Re: [PATCH 08/19] target/ppc: Introduce REQUIRE_FPU
Message-ID: <YSW9Gtim2F+MqaCm@yekko>
References: <20210824142730.102421-1-luis.pires@eldorado.org.br>
 <20210824142730.102421-9-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Gjz4Q0XQWd+h+s2/"
Content-Disposition: inline
In-Reply-To: <20210824142730.102421-9-luis.pires@eldorado.org.br>
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
Cc: richard.henderson@linaro.org,
 Fernando Valle <fernando.valle@eldorado.org.br>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Gjz4Q0XQWd+h+s2/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 11:27:19AM -0300, Luis Pires wrote:
> From: Fernando Valle <fernando.valle@eldorado.org.br>
>=20
> Signed-off-by: Fernando Valle <fernando.valle@eldorado.org.br>
> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/translate.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 4749ecdaa9..5489b4b6e0 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -7461,6 +7461,14 @@ static int times_4(DisasContext *ctx, int x)
>          }                                               \
>      } while (0)
> =20
> +#define REQUIRE_FPU(ctx)                                \
> +    do {                                                \
> +        if (unlikely(!(ctx)->fpu_enabled)) {            \
> +            gen_exception((ctx), POWERPC_EXCP_FPU);     \
> +            return true;                                \
> +        }                                               \
> +    } while (0)
> +
>  /*
>   * Helpers for implementing sets of trans_* functions.
>   * Defer the implementation of NAME to FUNC, with optional extra argumen=
ts.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Gjz4Q0XQWd+h+s2/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmElvRoACgkQbDjKyiDZ
s5IR4A//dXh5la45v/DA5G71Z+qxMk2miulKqYawijiucOdEXUacd4E+E1LF0zvH
zffBJk3OFtplLihvel/W4JHjsJWRjrft5UDTU0tCreqy9teTHbQr8uymCqdLRWCk
U6LTqCzZ7uallEN2hBe5QlYUPToDSbrjjkmKcgJT1M9s7PB+KDH/1t/yLaQ/l0bo
peIl2fgmomLS3XLAGpM0FyaYj1TbINOPxpAq273AldfOEeDMCiizQz8l58yOPNPT
d4bktf8F6hVbqg6DbJcjNS1+i+klDJ+g4a0NSLduiVuvp22IwB5nzRHMT9eMFWZ5
yJzfXJxnNkpSRer01hwjjXuOsFM+yGE5l65pX5jWR5eR/KtgMv377d9iqy8u+juj
HuD88Aw/zIBTfbYYoXQlrq4uya6JZdnveH8ngBh/y79mnJuY0xrLsyttlAYlsPQg
zFWuIZpXDOP/K7lXWaWWsaixEl8PfGRFsbK+c9ybhhg9WVzJ4IWzPVMYs/rFhBRS
31073ydWNWqfGwuUUs+Dvq4RNRzWN+qws66dFLxq/zzVp1pBD/INwt/5TgnoL3cW
9M9hUa9tEmlx8NggbLnBpWYnZW+8muYJxHUsExyQCCe4YPuE5GEDUjYEAXhV7RSx
dUk9fL6ATbbKWabcODiHA3LHPcge1DZsTI3b/eU2jfQCQEe00h8=
=UUgA
-----END PGP SIGNATURE-----

--Gjz4Q0XQWd+h+s2/--

