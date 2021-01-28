Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8993306AAF
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 02:48:02 +0100 (CET)
Received: from localhost ([::1]:45896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4wPi-0000xS-0N
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 20:48:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l4wO6-0007uN-6w; Wed, 27 Jan 2021 20:46:22 -0500
Received: from ozlabs.org ([203.11.71.1]:58719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l4wO2-0005Au-0Q; Wed, 27 Jan 2021 20:46:21 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DR3GR5yHlz9sW0; Thu, 28 Jan 2021 12:46:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611798367;
 bh=zDK0rzJpCyeiRfdCrbZ/eBzXLAziq3jdN1qhbSITexE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TH3bcdtP1XLq7bP6Pnx/S3mXN0zmm34D0ulxptKDgr7TP1ZztWDhvubmPYehG2+74
 CYtnXN/3+b6meqZ3f8qIC/X4OYkE1t9bDbrCuEmDgxRZtNLNdmvITBLHFcWRh/VFRl
 05SALZPoqeIaMoFUqf50Wt6UXdqRgsDZND4fOuMM=
Date: Thu, 28 Jan 2021 11:45:37 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 2/7] ppc/xive: Add firmware bit when dumping the ENDs
Message-ID: <20210128004537.GE18347@yekko.fritz.box>
References: <20210126171059.307867-1-clg@kaod.org>
 <20210126171059.307867-3-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lkTb+7nhmha7W+c3"
Content-Disposition: inline
In-Reply-To: <20210126171059.307867-3-clg@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--lkTb+7nhmha7W+c3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 26, 2021 at 06:10:54PM +0100, C=E9dric Le Goater wrote:
> ENDs allocated by OPAL for the HW thread VPs are tagged as owned by FW.
> Dump the state in 'info pic'.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied to ppc-for-6.0, thanks.

> ---
>  include/hw/ppc/xive_regs.h | 2 ++
>  hw/intc/xive.c             | 3 ++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/hw/ppc/xive_regs.h b/include/hw/ppc/xive_regs.h
> index 787969282593..b7fde2354e31 100644
> --- a/include/hw/ppc/xive_regs.h
> +++ b/include/hw/ppc/xive_regs.h
> @@ -236,6 +236,8 @@ typedef struct XiveEND {
>      (be32_to_cpu((end)->w0) & END_W0_UNCOND_ESCALATE)
>  #define xive_end_is_silent_escalation(end)              \
>      (be32_to_cpu((end)->w0) & END_W0_SILENT_ESCALATE)
> +#define xive_end_is_firmware(end)              \
> +    (be32_to_cpu((end)->w0) & END_W0_FIRMWARE)
> =20
>  static inline uint64_t xive_end_qaddr(XiveEND *end)
>  {
> diff --git a/hw/intc/xive.c b/hw/intc/xive.c
> index fa8c3d82877f..eeb4e62ba954 100644
> --- a/hw/intc/xive.c
> +++ b/hw/intc/xive.c
> @@ -1294,7 +1294,7 @@ void xive_end_pic_print_info(XiveEND *end, uint32_t=
 end_idx, Monitor *mon)
> =20
>      pq =3D xive_get_field32(END_W1_ESn, end->w1);
> =20
> -    monitor_printf(mon, "  %08x %c%c %c%c%c%c%c%c%c prio:%d nvt:%02x/%04=
x",
> +    monitor_printf(mon, "  %08x %c%c %c%c%c%c%c%c%c%c prio:%d nvt:%02x/%=
04x",
>                     end_idx,
>                     pq & XIVE_ESB_VAL_P ? 'P' : '-',
>                     pq & XIVE_ESB_VAL_Q ? 'Q' : '-',
> @@ -1305,6 +1305,7 @@ void xive_end_pic_print_info(XiveEND *end, uint32_t=
 end_idx, Monitor *mon)
>                     xive_end_is_escalate(end) ? 'e' : '-',
>                     xive_end_is_uncond_escalation(end)   ? 'u' : '-',
>                     xive_end_is_silent_escalation(end)   ? 's' : '-',
> +                   xive_end_is_firmware(end)   ? 'f' : '-',
>                     priority, nvt_blk, nvt_idx);
> =20
>      if (qaddr_base) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--lkTb+7nhmha7W+c3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmASCTEACgkQbDjKyiDZ
s5KqYhAAg7Z+coh8M6/4YsJ0FIuVZ1K6yZc5LY6tHTS1btYSOAzsvU8EK4y3vog4
AhFFezB5mKL0IWzPVvOCPC7InHgciOLX67zIPRRG0ZvUvdSV7jkYCgauFTbs6n4q
K7ciN6UJb79BYYJUabxfLg4zTRPQt3fZlihizMyjp54/hfkuDKuGuKDd/NP2ehIC
qKqXjVuMwOmtxT+nJrlCSF8UbEw7XK4lx4rOTkaDtQz2owTVa5frkFdQles6OSZ8
NB7w3Oep6WF9t5rnFOUN+Y6ctIqHJNcQMQUDQ4hW1dy8WEM24XWYRU9LCjGtHqeb
6PPuTI3YyqltS7/JpL5gVQcOjIYKbQkfnLQbTxH8cXsCy9atqX9NRz3AZOWE22mk
DRMA0rzhd+mqWNs2MV+188MuSePTwgsWsBO9fuSXxurPXQR4dUZLdsdEoiQs7/Rs
CWCW1oRyJCWYYIALVK+tkzAmFnr40hZhdZ1jbIED5HsbCSqSga5gVccNDJLsehyL
/tzGfyvhb3OMqsP7cTFVWAYl+q8rklNFWIc/WEqy+ydLosMUB0QlDApyJyt4bDII
OGZ7/VD/Cp3eMjErSsqXf2YWf4MKA9KpAQfghHDq9H1wsxUwmOS9txflXAlYSbWg
Jrv22bImC7ZXamn6+32SmJXzfLKgSnW4dO7N9njPJqIQ/+b5dhs=
=DSL9
-----END PGP SIGNATURE-----

--lkTb+7nhmha7W+c3--

