Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C409B3C6847
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 03:54:42 +0200 (CEST)
Received: from localhost ([::1]:45166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m37dB-0004Lt-Pn
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 21:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m37Yj-0002K2-Cz; Mon, 12 Jul 2021 21:50:05 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:36581 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m37Yg-000714-Va; Mon, 12 Jul 2021 21:50:05 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GP3VG1ncGz9sX5; Tue, 13 Jul 2021 11:49:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626140998;
 bh=7IcVAjelidDyJg5mrF06o/pltcK0LhGOElofgsTNEQs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e4nKkv2y1RNDznehzUpoIR9rY1vUA4QkToLRgw1A9Y/rNeSsyvFg45y8PPwt531zb
 QpSWnz2mFZGg3W8liA0WKj3AkkOICVCKV0oRHN0yhyXtcOPEJQJOQ/9JPoAA8Q1Dyl
 8nJHUdJe5AAXDLYqzKe3Z6n35QxBy0kmWrAoJk1M=
Date: Tue, 13 Jul 2021 10:05:26 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 06/11] hw/ppc/spapr_events: Remove unused variable from
 check_exception
Message-ID: <YOzYxuV8jvzgxe6B@yekko>
References: <20210712215535.1471256-1-richard.henderson@linaro.org>
 <20210712215535.1471256-7-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8bioqZhmv4vMVWMI"
Content-Disposition: inline
In-Reply-To: <20210712215535.1471256-7-richard.henderson@linaro.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--8bioqZhmv4vMVWMI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 12, 2021 at 02:55:30PM -0700, Richard Henderson wrote:
> >From clang-13:
> hw/ppc/spapr_events.c:937:14: error: variable 'xinfo' set but not used \
>     [-Werror,-Wunused-but-set-variable]
>=20
> Cc: qemu-ppc@nongnu.org
> Cc: Greg Kurz <groug@kaod.org>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr_events.c | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
> index 0cfc19be19..23e2e2fff1 100644
> --- a/hw/ppc/spapr_events.c
> +++ b/hw/ppc/spapr_events.c
> @@ -934,7 +934,6 @@ static void check_exception(PowerPCCPU *cpu, SpaprMac=
hineState *spapr,
>                              uint32_t nret, target_ulong rets)
>  {
>      uint32_t mask, buf, len, event_len;
> -    uint64_t xinfo;
>      SpaprEventLogEntry *event;
>      struct rtas_error_log header;
>      int i;
> @@ -944,13 +943,9 @@ static void check_exception(PowerPCCPU *cpu, SpaprMa=
chineState *spapr,
>          return;
>      }
> =20
> -    xinfo =3D rtas_ld(args, 1);
>      mask =3D rtas_ld(args, 2);
>      buf =3D rtas_ld(args, 4);
>      len =3D rtas_ld(args, 5);
> -    if (nargs =3D=3D 7) {
> -        xinfo |=3D (uint64_t)rtas_ld(args, 6) << 32;
> -    }
> =20
>      event =3D rtas_event_log_dequeue(spapr, mask);
>      if (!event) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8bioqZhmv4vMVWMI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDs2MIACgkQbDjKyiDZ
s5Kp4BAApMoi/sJeAkVY5ljdZSf9Yt0nkFVPtNe9rA1EEWL+TA6TrLZWjiwvpgkO
HX+/YssvwDX5nFK02UTE3hdTxeobylwK26AelMFe9Kat47N6SgS3A8nniPxIPjnV
vTAk66W1UDF1d7aH6uyYSAnzEIn/DOnR86EntsvqcGIt8SvEqL3K+0vpD9iKEorK
HDHud8ITwZF/ViOxGfMQNSO8NnyfY/aBIvk028/is/ejDhmzsVn5gxUPdsGxtI6R
70JyIaOBWLiPvdxYLkHYnKigqg4ExbqEv6Mh9FvNc9Vm79+kFxeiR8SHKmdaoMCJ
mMq48srY60lZDtUkxgOJWxk12jhoEOnb6WTa4KTiRjnLHnITjuM7ShONa9c3mppk
LusoAbmmplopwd6smp0liCBfvhC32e4u7lUv/zKrVPy75t2dV13okdd64cuo2PuK
Wmb2ntrpe752Ajl2irFHt9U0JlK0Db0nmtpnrz1KRWI2Iqa6El2j/BIrCFIjZ1tx
kAKR/dfstDoxUP5nNY45YcupzQUHhOGeCpIe26gQTZOCc6hhLYvYnvAOnusAsLcL
d39l72iWuqYXFMWbDOB/TX4fdFIZvwXu7KzDKOqZYELLqzoROHK4KEE1ZFcXYO6r
KZu+htXeTasS7vqF3pa7+qMjDv4Uarn03Jq3nhBPyqeeA/eIFmk=
=gB6D
-----END PGP SIGNATURE-----

--8bioqZhmv4vMVWMI--

