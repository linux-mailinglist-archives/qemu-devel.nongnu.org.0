Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCCA2F6FD6
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 02:10:12 +0100 (CET)
Received: from localhost ([::1]:47620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Dcx-0005j6-4k
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 20:10:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l0DaH-00041W-ES; Thu, 14 Jan 2021 20:07:26 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:35379 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l0DaC-0003QA-JJ; Thu, 14 Jan 2021 20:07:23 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DH31b4vSpz9sP7; Fri, 15 Jan 2021 12:07:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610672835;
 bh=8AW8NelBjLkty43bdMJHP6o0DHoMkPCrqDOibvHqv0E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HTUrlKi+sgPoRE7WtU5oeEOM6AOuTlveGgtJ6pnYkpcs9jN2Y0QOn6P+PJxGl0Ghp
 a51LPp+FJhFSGz3nK59LWr3DyWf4Mi+OQPuF9cb8PgbIdO/sGJ4rR1+y1n/ZK4nrcz
 tTX4//nBAHiPUpK7F+R5rMDKu/xqy3ksm4XxlDJw=
Date: Fri, 15 Jan 2021 11:44:58 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v1 3/7] spapr_rtas.c: fix identation in
 rtas_ibm_nmi_interlock() string
Message-ID: <20210115004458.GS435587@yekko.fritz.box>
References: <20210114180628.1675603-1-danielhb413@gmail.com>
 <20210114180628.1675603-4-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="s9pXJW6w71JX4l3T"
Content-Disposition: inline
In-Reply-To: <20210114180628.1675603-4-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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


--s9pXJW6w71JX4l3T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 03:06:24PM -0300, Daniel Henrique Barboza wrote:
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Nack.  I believe the general consensus is that greppability for long
error message strings is sufficient reason to break the normal coding
style rules.

> ---
>  hw/ppc/spapr_rtas.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index 513c7a8435..d014684d60 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -463,7 +463,8 @@ static void rtas_ibm_nmi_interlock(PowerPCCPU *cpu,
> =20
>      if (spapr->fwnmi_machine_check_addr =3D=3D -1) {
>          qemu_log_mask(LOG_GUEST_ERROR,
> -"FWNMI: ibm,nmi-interlock RTAS called with FWNMI not registered.\n");
> +                      "FWNMI: ibm,nmi-interlock RTAS called with "
> +                      "FWNMI not registered.\n");
> =20
>          /* NMI register not called */
>          rtas_st(rets, 0, RTAS_OUT_PARAM_ERROR);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--s9pXJW6w71JX4l3T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAA5YoACgkQbDjKyiDZ
s5KkuA//b/vWmpKyx8s1E9Igm+6njWQT3MsuGBNnC/cn8fW5YKgMTp1mwnRmHq2r
RNvAOu6m4k29Sp3wpqHbMyzNRvV4GNDFg2OHbflYyIna8iiAuYsdYabFNL2WUxCu
BiNLxHalkVp5RZD5HAAw4NPrqu/69fUJM/Eb+VhMFK5h9QdrZ+t5UOjUwuXk2aY/
yu7ImWjk4zaN3CEKkSD2dzd5UkrndJ2vcI5oJmqp8mgYWIX+a0Zgykyfe1eOduIc
K+vvlzOBt90guOk6RoMfp+PkGM2nUC9bm6lmmApRNcAO4AVI020sdID9e6Is2buc
vx7Qyh43cZZevrWPZgC0R6jb4pNWmhhnUJMleWz3opATMlUv/sMAjicKFK7whHFu
R+X6VXbkE5pCZ63bbYWbEfptBne+L4m24ABUDmLe4F4KV6K7SgaF4F31ksSMsOZS
3Eqiyp7J4DsZOqcEe7ZQKzNRJmVkJL/6QPprVCckZwIqkGuMGSjiAbjwu0UvLNoe
YFGMKomkt42Hom5BG5RX5fKlZxX9gpgGRBPPySElp1HGIXKV9/vZ1MlQZvZAX0hJ
I/10Y6kLGwS9NMkMZMmUkg6+l1JcS4Pnfj584oHkdnHqMgAEABD6rQ3EgkaMYGTw
DDcghWZnxQ0TUxrg1GiHnD9ZHseqLIO1K1cYXT9+qFAq2rVl9eA=
=JGCB
-----END PGP SIGNATURE-----

--s9pXJW6w71JX4l3T--

