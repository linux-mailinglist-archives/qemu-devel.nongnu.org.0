Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EAA37F238
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 06:31:29 +0200 (CEST)
Received: from localhost ([::1]:60894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh30S-0001EY-40
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 00:31:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sc-0007KA-44; Thu, 13 May 2021 00:23:23 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:44949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sY-0004cG-EE; Thu, 13 May 2021 00:23:21 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fgdms5cBgz9t0Y; Thu, 13 May 2021 14:22:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620879773;
 bh=Fd+LRmAicVgTZGCQquDPF2q5O8OT+DUZUzLjlVmMpHs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AT8pVfEmOn8h/0Gf4a2U07CSde8W00MP4K8PdMZt2u5LN9eMEbHdGM3XButgAvTJi
 bysdWYoXuMH4w+CHQ5vd2lhjmi9Q2+sGp9luhUnlWcZCxYXjXRa+CWi46BRK9lgrjj
 /rYQilDcF8noQTgnaBhoQzmWF5OkAbC8YkEbwRyE=
Date: Thu, 13 May 2021 14:06:52 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v4 04/31] target/ppc: Remove special case for
 POWERPC_SYSCALL
Message-ID: <YJyl3CxhIpfGwcAi@yekko>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
 <20210512185441.3619828-5-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SMu1cqXciZ5WcKEg"
Content-Disposition: inline
In-Reply-To: <20210512185441.3619828-5-matheus.ferst@eldorado.org.br>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 TVD_SUBJ_WIPE_DEBT=1.004 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 luis.pires@eldorado.org.br, qemu-ppc@nongnu.org, lagarcia@br.ibm.com,
 bruno.larsen@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--SMu1cqXciZ5WcKEg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 03:54:14PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> Since POWERPC_SYSCALL is raised by gen_exception_err,
> we will have also set DISAS_NORETURN.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/translate.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 616ffc1508..2303bf259a 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -9416,7 +9416,6 @@ static void ppc_tr_translate_insn(DisasContextBase =
*dcbase, CPUState *cs)
>      /* Check trace mode exceptions */
>      if (unlikely(ctx->singlestep_enabled & CPU_SINGLE_STEP &&
>                   (ctx->base.pc_next <=3D 0x100 || ctx->base.pc_next > 0x=
F00) &&
> -                 ctx->exception !=3D POWERPC_SYSCALL &&
>                   ctx->exception !=3D POWERPC_EXCP_TRAP &&
>                   ctx->exception !=3D POWERPC_EXCP_BRANCH &&
>                   ctx->base.is_jmp !=3D DISAS_NORETURN)) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SMu1cqXciZ5WcKEg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCcpdwACgkQbDjKyiDZ
s5IZ5A/8DuILdjFZS895R05bL9wn/3Whjl/Vfj7OA+CIbc8NtentWXPpT88gvAol
8wvm6cRQUnZbb36dh9pgoJvIJhWd1LzE+9DBLlfUARC4ke7nrK0dESlZlx8Ibi24
bWLMfxIgrP/ulSXm58oxCNVgRa7M9QIfVmD0NuEUM3hiDHAX4A5/dgmSwFFRxXpa
F58eTWvrqaJK3Y+AgHLVNOze3iFAjAr5Ll6gWDlWNBQ6ghp5CaaOiESv+nZGuXtD
hUcFIQfZzunsq2q3bw2YqeYgNSDkfiYn07wGgAnNOIZ5xeDW82gKPAGbTxxnktv/
COc1QlnpvAUFqeEosgRoJeBU0cos1QCHotozlkxJeHzufbc/5FZqIA1t5VCIsDIc
AmZ9PnoNz4pnemGW/B1QV4nMxfCCkdbHvpOg3iaQJBPDdrEVecAV4P4MkVUfe+dE
QKqHkgty+z8h6gDZyGUqhnNJqQzpGjAI/JD4Yx541KynwWtNzrgw/PzemJOFV5q2
+KLLBc2FRxqJKZHS+Htab8xTKVUkUYF3W+hEO+5Zf+XMOZIDPs3czX8EaTjhCQy3
8eX5AYgDnHXiahQEScX961GZoy3h8ZCk4qKgEdXujQn+I7VFcbsAo9q+UEDLuydb
plJBQvYmUnte/EHmtVcROlHCfm6k16089agkfHvYabRvYjtHfsY=
=zwDW
-----END PGP SIGNATURE-----

--SMu1cqXciZ5WcKEg--

