Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8134337198
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 12:43:49 +0100 (CET)
Received: from localhost ([::1]:58328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKJjI-0005Cw-VI
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 06:43:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lKJiE-0004Cr-GT; Thu, 11 Mar 2021 06:42:42 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:41119 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lKJiB-0007bC-W5; Thu, 11 Mar 2021 06:42:42 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Dx6W94dl6z9sVw; Thu, 11 Mar 2021 22:42:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615462949;
 bh=f8U/Cso+2OgI0g4k20sGUsCcc359SKf3rnWNzXCGRFI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eYHjc+snh+M9kcEdVJP9uhaKide0yAo3r2D7o/Vqi8EnGPmaEx6duMmCIfboHiq5Q
 DewGEU7LDtpiZtUZmunEEtiB0/PcqtHPwQH8auejX6v/6HEFl9RO1eW9KlpQmJswVW
 h+RHKH5I/ElISnuWG4IZxoUpkBYi+RqiqikzavR4=
Date: Thu, 11 Mar 2021 15:56:47 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ivan Warren <ivan@vmfacility.fr>
Subject: Re: [PULL 00/20] ppc-for-6.0 queue 20210310
Message-ID: <YEmjDwpfYwLOaVe/@yekko.fritz.box>
References: <20210310041002.333813-1-david@gibson.dropbear.id.au>
 <503c3c5e-3dd2-adba-2d2c-2e5f8618fc3a@vmfacility.fr>
 <YEl2rC3TOetSiqh8@yekko.fritz.box>
 <e6bee42f-661b-a5a6-bb45-0b93167fb227@vmfacility.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qi0NRN63LLHv3GAz"
Content-Disposition: inline
In-Reply-To: <e6bee42f-661b-a5a6-bb45-0b93167fb227@vmfacility.fr>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, qemu-ppc@nongnu.org,
 groug@kaod.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--qi0NRN63LLHv3GAz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 04:22:44AM +0100, Ivan Warren wrote:
>=20
> On 3/11/2021 2:47 AM, David Gibson wrote:
> >=20
> > Sorry, I've forgotten this issue.  If you had a patch, can you resend
> > it please.
>=20
> Not mine.. (I reported it, but can't remember who sent it)...
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>=20
> index 2609e4082e..4a05e4e544 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -2396,8 +2396,8 @@ static inline void cpu_get_tb_cpu_state(CPUPPCState
> *env, target_ulong *pc,
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 target_ulong *cs_base, uin=
t32_t
> *flags)
> =A0{
> =A0=A0=A0=A0 *pc =3D env->nip;
> -=A0=A0=A0 *cs_base =3D 0;
> -=A0=A0=A0 *flags =3D env->hflags;
> +=A0=A0=A0 *cs_base =3D env->hflags;
> +=A0=A0=A0 *flags =3D 0;
> =A0}

Ah, that one.  It caused a regression, so I dropped it. I pinged
Richard Henderson about it, but I don't think I even had a reply.

I'm afraid I don't have the knowledge or the time to debug this
myself.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qi0NRN63LLHv3GAz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBJowsACgkQbDjKyiDZ
s5JFjw/9EuaPBE50fh84/xT0vnxzzgVJtietRqUuijrHN3P9YVr6rzyQfaVIxsdp
4azgyaSRmyjd5pGabTg+sbHMnzXiiuE/Bukmv+4ilQWl0QbusPwXz6pfmwFWVrkP
UZ60jTHU19JFPmTlEvp3LBa29AeHbmE4A3Zg9M4TCiBYgB6O1ZdjG6qS5NhQojo9
NhCC1k92AutQtqDtSrnKDN12qGc8m3xbgoeuCEOKqR14K7x8JCuZ/GJgPN9qsjdi
GKOhJ7OxLp7jY+NjKI+w2hEchMapgOzJp6/OBcuaQmrc3j/lA/AZfuHCIhiKz+lF
r1B0fvPoi62JpkZKv64F24WgbAQDDTA/sMocJctZk3BXTvd+ma/6g/48jjX8X1v4
L7o9rNoSRPgcI7YZX3gu71y/S76hC/pc+UmL5FcKdY2N8lmfcjzvdzw3KBXxPqnt
xGk11fmvlUr0F/MvEKr9anyRKu/qCsqZpYfDzWLyE/0cT13M3Sj2xJqsCYncyKOl
bphbjYvSOklhYA65oiZMzP3aaJsbN0QUNhitwK+DYwhaeXvW8QABwcf+VJttTvHH
JWZtdz77naMsskj9ThOVBXxVWMpnX4hAi3PsIRgLtF1GpAs/3KUo9haToumOb/ub
3btFxJDpmBFh+miUdiGfBeOwkEZEtBqFuZSsd3CAD0P1TI4HCaM=
=pbBP
-----END PGP SIGNATURE-----

--qi0NRN63LLHv3GAz--

