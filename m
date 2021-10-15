Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D105442E723
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 05:14:43 +0200 (CEST)
Received: from localhost ([::1]:39532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbDgA-0003XH-BC
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 23:14:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mbDcl-0001pV-SH; Thu, 14 Oct 2021 23:11:11 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:36499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mbDch-0005Wi-Fz; Thu, 14 Oct 2021 23:11:11 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HVrrG3PrZz4xbP; Fri, 15 Oct 2021 14:10:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634267454;
 bh=NvbWod8VhIpnMmM3hnnFM/7XaARJlfRR7O4JKDa3RCs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MnD3/e2qteUiu6N8A9iab4qm7aKxpd/oHpi3jK5xWRRE1lJA41PSBr2ReAGrJUBmv
 9y471/UaVYD8iJU45XiwPcpIZidwOaBPb4AffhNxmphiTk2Cz6XR4lgNuROiLWTBiW
 bNBthoZPL/bM/dhSkvfvvBMV6ItmSMMwZFS7w4y0=
Date: Fri, 15 Oct 2021 11:30:29 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH 1/4] linux-user/ppc: Fix XER access in
 save/restore_user_regs
Message-ID: <YWjLpVEBp6Sktlw6@yekko>
References: <20211014223234.127012-1-matheus.ferst@eldorado.org.br>
 <20211014223234.127012-2-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RDLtMGi4T2+OrB11"
Content-Disposition: inline
In-Reply-To: <20211014223234.127012-2-matheus.ferst@eldorado.org.br>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: laurent@vivier.eu, richard.henderson@linaro.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--RDLtMGi4T2+OrB11
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 07:32:31PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>=20
> We should use cpu_read_xer/cpu_write_xer to save/restore the complete
> register since some of its bits are in other fields of CPUPPCState. A
> test is added to prevent future regressions.
>=20
> Fixes: da91a00f191f ("target-ppc: Split out SO, OV, CA fields from XER")
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.2, thanks.

> ---
>  linux-user/ppc/signal.c                     |  9 +++--
>  tests/tcg/ppc64/Makefile.target             |  2 +
>  tests/tcg/ppc64le/Makefile.target           |  2 +
>  tests/tcg/ppc64le/signal_save_restore_xer.c | 42 +++++++++++++++++++++
>  4 files changed, 52 insertions(+), 3 deletions(-)
>  create mode 100644 tests/tcg/ppc64le/signal_save_restore_xer.c
>=20
> diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
> index edfad28a37..4413a4a28f 100644
> --- a/linux-user/ppc/signal.c
> +++ b/linux-user/ppc/signal.c
> @@ -244,7 +244,7 @@ static void save_user_regs(CPUPPCState *env, struct t=
arget_mcontext *frame)
>      __put_user(env->nip, &frame->mc_gregs[TARGET_PT_NIP]);
>      __put_user(env->ctr, &frame->mc_gregs[TARGET_PT_CTR]);
>      __put_user(env->lr, &frame->mc_gregs[TARGET_PT_LNK]);
> -    __put_user(env->xer, &frame->mc_gregs[TARGET_PT_XER]);
> +    __put_user(cpu_read_xer(env), &frame->mc_gregs[TARGET_PT_XER]);
> =20
>      for (i =3D 0; i < ARRAY_SIZE(env->crf); i++) {
>          ccr |=3D env->crf[i] << (32 - ((i + 1) * 4));
> @@ -319,6 +319,7 @@ static void restore_user_regs(CPUPPCState *env,
>  {
>      target_ulong save_r2 =3D 0;
>      target_ulong msr;
> +    target_ulong xer;
>      target_ulong ccr;
> =20
>      int i;
> @@ -334,9 +335,11 @@ static void restore_user_regs(CPUPPCState *env,
>      __get_user(env->nip, &frame->mc_gregs[TARGET_PT_NIP]);
>      __get_user(env->ctr, &frame->mc_gregs[TARGET_PT_CTR]);
>      __get_user(env->lr, &frame->mc_gregs[TARGET_PT_LNK]);
> -    __get_user(env->xer, &frame->mc_gregs[TARGET_PT_XER]);
> +
> +    __get_user(xer, &frame->mc_gregs[TARGET_PT_XER]);
> +    cpu_write_xer(env, xer);
> +
>      __get_user(ccr, &frame->mc_gregs[TARGET_PT_CCR]);
> -
>      for (i =3D 0; i < ARRAY_SIZE(env->crf); i++) {
>          env->crf[i] =3D (ccr >> (32 - ((i + 1) * 4))) & 0xf;
>      }
> diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.t=
arget
> index a6a4ddaeca..6ab7934fdf 100644
> --- a/tests/tcg/ppc64/Makefile.target
> +++ b/tests/tcg/ppc64/Makefile.target
> @@ -23,4 +23,6 @@ run-plugin-byte_reverse-with-%:
>  	$(call skip-test, "RUN of byte_reverse ($*)", "not built")
>  endif
> =20
> +PPC64_TESTS +=3D signal_save_restore_xer
> +
>  TESTS +=3D $(PPC64_TESTS)
> diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefi=
le.target
> index c0c14ffbad..5e65b1590d 100644
> --- a/tests/tcg/ppc64le/Makefile.target
> +++ b/tests/tcg/ppc64le/Makefile.target
> @@ -22,4 +22,6 @@ run-plugin-byte_reverse-with-%:
>  	$(call skip-test, "RUN of byte_reverse ($*)", "not built")
>  endif
> =20
> +PPC64LE_TESTS +=3D signal_save_restore_xer
> +
>  TESTS +=3D $(PPC64LE_TESTS)
> diff --git a/tests/tcg/ppc64le/signal_save_restore_xer.c b/tests/tcg/ppc6=
4le/signal_save_restore_xer.c
> new file mode 100644
> index 0000000000..e4f8a07dd7
> --- /dev/null
> +++ b/tests/tcg/ppc64le/signal_save_restore_xer.c
> @@ -0,0 +1,42 @@
> +#include <assert.h>
> +#include <stdint.h>
> +#include <signal.h>
> +#include <sys/user.h>
> +
> +#define XER_SO   (1 << 31)
> +#define XER_OV   (1 << 30)
> +#define XER_CA   (1 << 29)
> +#define XER_OV32 (1 << 19)
> +#define XER_CA32 (1 << 18)
> +
> +uint64_t saved;
> +
> +void sigill_handler(int sig, siginfo_t *si, void *ucontext)
> +{
> +    ucontext_t *uc =3D ucontext;
> +    uc->uc_mcontext.regs->nip +=3D 4;
> +    saved =3D uc->uc_mcontext.regs->xer;
> +    uc->uc_mcontext.regs->xer |=3D XER_OV | XER_OV32;
> +}
> +
> +int main(void)
> +{
> +    uint64_t initial =3D XER_CA | XER_CA32, restored;
> +    struct sigaction sa =3D {
> +        .sa_sigaction =3D sigill_handler,
> +        .sa_flags =3D SA_SIGINFO
> +    };
> +
> +    sigaction(SIGILL, &sa, NULL);
> +
> +    asm("mtspr 1, %1\n\t"
> +        ".long 0x0\n\t"
> +        "mfspr %0, 1\n\t"
> +        : "=3Dr" (restored)
> +        : "r" (initial));
> +
> +    assert(saved =3D=3D initial);
> +    assert(restored =3D=3D (XER_OV | XER_OV32 | XER_CA | XER_CA32));
> +
> +    return 0;
> +}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RDLtMGi4T2+OrB11
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFoy6MACgkQbDjKyiDZ
s5K+ehAAhphF4d+OI4Bw/gESiTykxnm7Ni8m2Ab7J0nItrLnTOzTmH+8+G0v4gP8
ENNKVy4HNld+EHfOTZ9nDhLT+dW2UFnx/PPPUfcqhfRDG5y6FzmsL9MMTH5/E24N
3xj7ISCH8DOJOIv1uthXhVDz2B4aHKRaL+/mGpI7a4tq7BA0n9bI2TpZ+ScHhbFR
mhbNYMYAUDuWQMzkXq3RMg/a+q58sGzQ8E/VxMxrdqeu0YSPSfu47JxX18ZXF2HB
4mTECQyM4oBF1uDRYzriXlTiyUPGkSHtg3bKFG0nSpxpEitpxwpcmIuNUbIEPM9Q
ar24j+s0H5L9iuTCIyC50GCPm5qBk9ncHeu1GORH3nJlMAZF2ejXY4iXgfvqoZL9
k6ppnbAYsZTK4/QnNqu2Kxfk3C0lCzsOir4t158kLNtLT84/7dLyUurS97p1OiBH
EFIrl+YOC2SZzHIx6k4L7IC74HuBbelFNFq9Y4gIQ2MEeuYSLN7eq9a5w9jxpTJs
oKP6hJxrid9SCjWOUkXUjS5vcRz5os3MyR5GddYl0ngB9QeQrCa9JyIAdrHWeGft
a/FZF4+MFNdE7rx1vJwFG0+wWvTs3f0JUgH0kPDuZSQZvYA1kLPyxRyaInP+zNF3
JxGVfZ1qiNx4aUXB9XG6B9UwJ9o21tglMSi7mQSdcTBwk5cD5nA=
=RJxJ
-----END PGP SIGNATURE-----

--RDLtMGi4T2+OrB11--

