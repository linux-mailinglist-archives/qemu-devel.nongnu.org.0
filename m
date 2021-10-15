Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 059C942E9FE
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 09:25:09 +0200 (CEST)
Received: from localhost ([::1]:50930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbHaV-0000PP-W3
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 03:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mbHHR-0004Si-KX; Fri, 15 Oct 2021 03:05:25 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:40297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mbHHA-0006MU-GU; Fri, 15 Oct 2021 03:05:22 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HVy2N3CBNz4xbc; Fri, 15 Oct 2021 18:05:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634281500;
 bh=q4arufVCcXYsgNdposnGz3DNan6h0r3csuaQYBLgKao=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B1wQIB9xEnx3h3AShNB5YjDJJkPvxMXBaT6EYorolLJnf6HEHe904iaf/sCF3Ifi1
 XartNVCfNtiOIRxD+EcjMs+XN/Q+chXnLR7fR3vbhv4aLFdyX2O3daLsCDYPDVMG9/
 U0rUXA5KRcrloi7R90qypLtvBSvyzA1BqpW+VGt4=
Date: Fri, 15 Oct 2021 14:15:59 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 2/6] ppc/pegasos2: Warn when using VOF but no kernel is
 specified
Message-ID: <YWjyb4bOur3I0Lz1@yekko>
References: <cover.1634241019.git.balaton@eik.bme.hu>
 <a4ec9a900df772b91e9f69ca7a0799d8ae293e5a.1634241019.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="acRG66+0G6j6ecDt"
Content-Disposition: inline
In-Reply-To: <a4ec9a900df772b91e9f69ca7a0799d8ae293e5a.1634241019.git.balaton@eik.bme.hu>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: 17
X-Spam_score: 1.7
X-Spam_bar: +
X-Spam_report: (1.7 / 5.0 requ) DATE_IN_PAST_03_06=1.592, DKIM_SIGNED=0.1,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--acRG66+0G6j6ecDt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 09:50:19PM +0200, BALATON Zoltan wrote:
> Issue a warning when using VOF (which is the default) but no -kernel
> option given to let users know that it will likely fail as the guest
> has nothing to run. It is not a hard error because it may still be
> useful to start the machine without further options for testing or
> inspecting it from monitor without actually booting it.
>=20
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Applied, thanks.

> ---
>  hw/ppc/pegasos2.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index 474cfdeabf..a1dd1f6752 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -194,7 +194,10 @@ static void pegasos2_init(MachineState *machine)
>          if (!pm->vof) {
>              warn_report("Option -kernel may be ineffective with -bios.");
>          }
> +    } else if (pm->vof) {
> +        warn_report("Using Virtual OpenFirmware but no -kernel option.");
>      }
> +
>      if (!pm->vof && machine->kernel_cmdline && machine->kernel_cmdline[0=
]) {
>          warn_report("Option -append may be ineffective with -bios.");
>      }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--acRG66+0G6j6ecDt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFo8m8ACgkQbDjKyiDZ
s5I00BAA1Zv8iPbSGLX9cjKdh4BU6z35t4wW70X3qugatO0bwTUVwla6Tq65hFka
5oD+tLhyU1zRHC9LaTlQdAHB3/pBhvfUYLrRgv7T89XHS7UTnjOz0jtXFeRdmqVN
BP/JK/Lx49MBmMM6uyWD94/3Fa03u3pkb6LFtSvB7DvWC9DMiY9qF7Nu3vpYwNo+
yXs31OyWwvzhtALLqcT1udJsbhf9jHKpyuPmy07/xTQHTsnMrkKXetpFBg6lB6Z3
5n3C84MqbDELJN6sYIQ3F1BjOABMvEkdraZ9BaCtNBaOY02wO/oA9qgDz9Jlj3Lv
CH7oOrsKQS6NA648LA5cf1ObD2Wxjo9xll0IsX07pc54DpW7O7LBEOD+i7ba5vV4
1GlhFxQiu5J100tfZ/hCF4fxzbUzgnhGLeFF9nPu4e9YpAUERBaCQb5kfjvQxjW9
f5tAaI2LqwnM2NOvjz32xnCMgArSY9LS3YkYvCfRVwW14pNDX7J05ZSol3BQPC1f
VOP+0zTDZxwSapZ/rMXFlFXangPM47EMcrGgxFQphpzS1HEjMXM0XNpQwJCgnZX/
gOOZlMFZgmDrtxf1Cp8MwmxJ4dGLJcCAjYxvP6MPK4bZ3He7aLczlqHTqjHCprcb
dT626mO2bBvvXfWYd2qZhaWe05umtw0doSvZ85YTK4W7aCtP85s=
=tQju
-----END PGP SIGNATURE-----

--acRG66+0G6j6ecDt--

