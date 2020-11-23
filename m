Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B8B2BFFE4
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 07:21:22 +0100 (CET)
Received: from localhost ([::1]:46408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh5E1-0004RH-PL
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 01:21:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh52K-0001Kh-21; Mon, 23 Nov 2020 01:09:17 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:43027 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh52H-0006dU-4l; Mon, 23 Nov 2020 01:09:15 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CfcDH0CN3z9sVV; Mon, 23 Nov 2020 17:09:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606111743;
 bh=spozFEcAIt9uygBScghoMhnwziexs6QmG4xLt8uCI9s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ng3N59TbaObksEAwroYB3xN0AwaSUum9zw3jAfCfmSPdvhk0+W6O5gCZ8fgCN2Z1D
 x+PIhpnTGTouJg1P5imekn/uuZp5izfcfHx6Q0hEkAqCXRNR8GKeGhdfMiS/VZ5TM3
 QcCwN/gMT53Wm3pO9rPxEWIoxoRFUy2AJgELzXo8=
Date: Mon, 23 Nov 2020 16:45:10 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Chen Qun <kuhn.chenqun@huawei.com>
Subject: Re: [PATCH v3 7/7] target/ppc: replaced the TODO with LOG_UNIMP and
 add break for silence warnings
Message-ID: <20201123054510.GR521467@yekko.fritz.box>
References: <20201116024810.2415819-1-kuhn.chenqun@huawei.com>
 <20201116024810.2415819-8-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JB7KW7Ey7eB5HOHs"
Content-Disposition: inline
In-Reply-To: <20201116024810.2415819-8-kuhn.chenqun@huawei.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: Thomas Huth <thuth@redhat.com>, zhang.zhanghailiang@huawei.com,
 qemu-trivial@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, ganqixin@huawei.com,
 Euler Robot <euler.robot@huawei.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--JB7KW7Ey7eB5HOHs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2020 at 10:48:10AM +0800, Chen Qun wrote:
> When using -Wimplicit-fallthrough in our CFLAGS, the compiler showed warn=
ing:
> target/ppc/mmu_helper.c: In function =E2=80=98dump_mmu=E2=80=99:
> target/ppc/mmu_helper.c:1351:12: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
>  1351 |         if (ppc64_v3_radix(env_archcpu(env))) {
>       |            ^
> target/ppc/mmu_helper.c:1358:5: note: here
>  1358 |     default:
>       |     ^~~~~~~
>=20
> Use "qemu_log_mask(LOG_UNIMP**)" instead of the TODO comment.
> And add the break statement to fix it.
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Acked-by: David Gibson <david@gibson.dropbear.id.au>

Applied to ppc-for-6.0, thanks.

> ---
> v1->v2: replace the TODO by a LOG_UNIMP call and add break statement(Base=
 on Philippe's comments)
>=20
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  target/ppc/mmu_helper.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index 8972714775..3bb50546f8 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -1349,11 +1349,12 @@ void dump_mmu(CPUPPCState *env)
>          break;
>      case POWERPC_MMU_3_00:
>          if (ppc64_v3_radix(env_archcpu(env))) {
> -            /* TODO - Unsupported */
> +            qemu_log_mask(LOG_UNIMP, "%s: the PPC64 MMU is unsupported\n=
",
> +                          __func__);
>          } else {
>              dump_slb(env_archcpu(env));
> -            break;
>          }
> +        break;
>  #endif
>      default:
>          qemu_log_mask(LOG_UNIMP, "%s: unimplemented\n", __func__);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JB7KW7Ey7eB5HOHs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+7TGQACgkQbDjKyiDZ
s5Lc/Q//bLbqwpTPjZ2ali7BsNdujoK+pKMEIb2c/Qr/kM/KehSNPMBU6QAwjGb8
UpKFJgsww6u1JztqsCY6g03ppOk657SNMPANnuLIX0s4sgCTNzptbt5quUvInIgN
M6mGqMs0cZ4j6gDzFGYP8HxuRYdh7hS6QWxA/V+o9xSXHECIAuNqvZwPR2M+EkbA
AAgINJmtjHrXt7rg9+TBLwumwezDlWliCgkfPmd1tc03e0nlIgRxin33Wip42RM1
cN21LA1efF7KSw47govR9LwWPi3WqPcTke6PwZLIJQ4e7hTMRQs7A41Dsa9AZ28C
ti+GyWmoZ1swrAVmYs3qOR8EOVGEjA2ZUU5p9U3jKq2Fb0Mf2UMZbrLzvXqS7Mmd
pcT/YzvIzIphvr0U22Fq8Ei1GcekioHgLPWLN1+6yuzFfijfSJTJto2WJXEzUpd0
BYQbop+uCnxz8UJpbWOu6v3tukUaPnD8bw7i7lU9ITZKUgI/G01GOEV5oo6UcldN
J0MAHCYLh7JFwdY17EYitQiiYEt0iYpupkLjqHtgfimTlw3omBSFnZZco4qNBWBz
HANbZBm71UN2mU6kZpcNSDu2/eT+BxqMW0KGmjAIiusDz8S2FpgCArfV063VCAH4
cHnsZbEjfw2imjAPvGmLXpzY67ZGVTO6ycdO8d506rqjCuS7xCM=
=xa5r
-----END PGP SIGNATURE-----

--JB7KW7Ey7eB5HOHs--

