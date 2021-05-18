Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A32BB386F7C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 03:41:23 +0200 (CEST)
Received: from localhost ([::1]:35078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lioja-0007iS-NM
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 21:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeH-0006ty-0R; Mon, 17 May 2021 21:35:53 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:43667 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeF-00072R-4v; Mon, 17 May 2021 21:35:52 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fkdqc3yRQz9sXL; Tue, 18 May 2021 11:35:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621301740;
 bh=BERKvbpjBMEFC4qlP81lXzc6QWJm8AbLui0xZR1n9QM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Srx4kXaF2GHsasdmTd39GMA2ZsYa0zyny7Lw4CGbUleg1ITW9kMo5v3SXrzY2BF0U
 KCWttVq6VwmOjV4R126hJWNYgC6KLXSk4RnY2ix3NcqVpKZS0oBu8YlNKo9pbU8unL
 KXyG7EYyBbuyH89s7KIvI96pqbXX4ZHt/1MZyaW4=
Date: Tue, 18 May 2021 10:20:55 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v5 08/23] target/ppc: Use translator_loop_temp_check
Message-ID: <YKMIZxXqjWbk8o84@yekko>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-9-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7qH6o9WCGVTtOMi4"
Content-Disposition: inline
In-Reply-To: <20210517205025.3777947-9-matheus.ferst@eldorado.org.br>
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 luis.pires@eldorado.org.br, qemu-ppc@nongnu.org, lagarcia@br.ibm.com,
 bruno.larsen@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--7qH6o9WCGVTtOMi4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 05:50:10PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> The special logging is unnecessary.  It will have been done
> immediately before in the log file.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> Reviewed-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/translate.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index e68152810e..ea200f9637 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -9091,11 +9091,7 @@ static void ppc_tr_translate_insn(DisasContextBase=
 *dcbase, CPUState *cs)
>      handler->count++;
>  #endif
> =20
> -    if (tcg_check_temp_count()) {
> -        qemu_log("Opcode %02x %02x %02x %02x (%08x) leaked "
> -                 "temporaries\n", opc1(ctx->opcode), opc2(ctx->opcode),
> -                 opc3(ctx->opcode), opc4(ctx->opcode), ctx->opcode);
> -    }
> +    translator_loop_temp_check(&ctx->base);
>  }
> =20
>  static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--7qH6o9WCGVTtOMi4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCjCGcACgkQbDjKyiDZ
s5KkAg//TXi4IeQHoQXxr2AUnvLiem2XMl+ThThBKIpXbZfKRqprcvmPkIx6BNfe
tmBJ5/2vozaDeSlnuvbOQP0eAaXfqbZu+h+ZBYaoGQ2P2i9x0hdgEZ3fUYtPyfX4
LqUTIfeKL0sHd532rbWCMlB1GNh84QOqAZ7T1AXqj2UkTJEuMjJO9PNdq3Tv7Iyv
4mfLofH+z+QClI0grdNuBmtt8nlt/My0uBJVA9knUj/7gVcn2zsk/+m8h2560m12
GToI1hLg415x4LULe8AFH+D0zNoDmpBUFYONnEm+5psukbCprdSLAi9A6jbpZPlL
kO1ncDtuDwYDREQ42fZu484TMCgVa9fezmP91qFJ6ledwN27K0/j7aX4lW8Aab8d
qEDPUUfCRf+xsiX8GW6VHuZjc3CcGDH3LhZ8CmWAz6S5XS/Rm2T+4CWBSkD1qirV
fjcifeOwWxfa6qXQ7d3MR89/OHzuF93eyGDWVMQkbmmJ6AsJP53q1jjn4Oo/TlOf
7WOWIwvtV148zI4SQFMNna61+e2a4N+D8JTmOR2ciguCirW6apLPTxj9vridHayN
AC4L1PYSt3IytDW0rv31Nb8mjgXESa94a4HRwCXLg90HjajF83NMvou18BZUUkpo
TWafW3I2vnSLbRuNL+WcfCtS2CLbGLGw0pHy7Ihgf6roFKmlf2g=
=b6SO
-----END PGP SIGNATURE-----

--7qH6o9WCGVTtOMi4--

