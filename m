Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6677A386F87
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 03:43:36 +0200 (CEST)
Received: from localhost ([::1]:44398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liolj-0005XG-Es
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 21:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeO-000733-Ca; Mon, 17 May 2021 21:36:01 -0400
Received: from ozlabs.org ([203.11.71.1]:40867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeK-00077K-Lp; Mon, 17 May 2021 21:35:59 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fkdqf0bywz9sj1; Tue, 18 May 2021 11:35:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621301742;
 bh=2QvATueHZG6ivbntKmJLa0ln6UCm5in9Xyxpgwyi7k4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c72J2k7H0EFos9WClnrZJiPwcAovxqJoHOSq4ITvwTBncZ+dN4OXSMLrpR9+ao1v9
 vtvPsPaaeDsNTyh7AGe5MiHAbcLu/88mQxedVh94DDv6BbUHxgOnggmRqhXBVBU1kM
 7PhdlWpharVyT5VDVM/x7cfRoce9eSJS2BF5+dnc=
Date: Tue, 18 May 2021 10:36:58 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v5 13/23] target/ppc: Implement PNOP
Message-ID: <YKMMKkdpuBzrSC2N@yekko>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-14-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ev4Ptu0a2lfamOAV"
Content-Disposition: inline
In-Reply-To: <20210517205025.3777947-14-matheus.ferst@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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


--Ev4Ptu0a2lfamOAV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 05:50:15PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> The illegal suffix behavior matches what was observed in a
> POWER10 DD2.0 machine.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
> v5:
> - Remove argument set from PNOP;
> - Use no_overlap_group for invalid suffixes.
> ---
>  target/ppc/insn64.decode                   | 67 ++++++++++++++++++++++
>  target/ppc/translate/fixedpoint-impl.c.inc | 11 ++++
>  2 files changed, 78 insertions(+)
>=20
> diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
> index 1965088915..9aa5097a98 100644
> --- a/target/ppc/insn64.decode
> +++ b/target/ppc/insn64.decode
> @@ -28,3 +28,70 @@
> =20
>  PADDI           000001 10 0--.-- ..................     \
>                  001110 ..... ..... ................     @PLS_D
> +
> +### Prefixed No-operation Instruction
> +
> +@PNOP           000001 11 0000-- 000000000000000000     \
> +                ................................
> +
> +{
> +  [
> +    ## Invalid suffixes: Branch instruction
> +    # bc[l][a]
> +    INVALID     ................................        \
> +                010000--------------------------        @PNOP
> +    # b[l][a]
> +    INVALID     ................................        \
> +                010010--------------------------        @PNOP
> +    # bclr[l]
> +    INVALID     ................................        \
> +                010011---------------0000010000-        @PNOP
> +    # bcctr[l]
> +    INVALID     ................................        \
> +                010011---------------1000010000-        @PNOP
> +    # bctar[l]
> +    INVALID     ................................        \
> +                010011---------------1000110000-        @PNOP
> +
> +    ## Invalid suffixes: rfebb
> +    INVALID     ................................        \
> +                010011---------------0010010010-        @PNOP
> +
> +    ## Invalid suffixes: context synchronizing other than isync
> +    # sc
> +    INVALID     ................................        \
> +                010001------------------------1-        @PNOP
> +    # scv
> +    INVALID     ................................        \
> +                010001------------------------01        @PNOP
> +    # rfscv
> +    INVALID     ................................        \
> +                010011---------------0001010010-        @PNOP
> +    # rfid
> +    INVALID     ................................        \
> +                010011---------------0000010010-        @PNOP
> +    # hrfid
> +    INVALID     ................................        \
> +                010011---------------0100010010-        @PNOP
> +    # urfid
> +    INVALID     ................................        \
> +                010011---------------0100110010-        @PNOP
> +    # stop
> +    INVALID     ................................        \
> +                010011---------------0101110010-        @PNOP
> +    # mtmsr w/ L=3D0
> +    INVALID     ................................        \
> +                011111---------0-----0010010010-        @PNOP
> +    # mtmsrd w/ L=3D0
> +    INVALID     ................................        \
> +                011111---------0-----0010110010-        @PNOP
> +
> +    ## Invalid suffixes: Service Processor Attention
> +    INVALID     ................................        \
> +                000000----------------100000000-        @PNOP
> +  ]
> +
> +  ## Valid suffixes
> +  PNOP          ................................        \
> +                --------------------------------        @PNOP
> +}
> diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/tran=
slate/fixedpoint-impl.c.inc
> index 344a3ed54b..ce034a14a7 100644
> --- a/target/ppc/translate/fixedpoint-impl.c.inc
> +++ b/target/ppc/translate/fixedpoint-impl.c.inc
> @@ -60,3 +60,14 @@ static bool trans_ADDIS(DisasContext *ctx, arg_D *a)
>      a->si <<=3D 16;
>      return trans_ADDI(ctx, a);
>  }
> +
> +static bool trans_INVALID(DisasContext *ctx, arg_INVALID *a)
> +{
> +    gen_invalid(ctx);
> +    return true;
> +}
> +
> +static bool trans_PNOP(DisasContext *ctx, arg_PNOP *a)
> +{
> +    return true;
> +}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Ev4Ptu0a2lfamOAV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCjDCoACgkQbDjKyiDZ
s5JxOw/9FBNYPEcNQQ3G1eF5pLbAtSRn3vgzsT/3e3S1RhwhgWFFeNK0C04aXDRk
A1f/PXeqoqC+gFLaHKn3UZc1tcMJ+PdvNB6d7Lw+5CHphi2Pfle6m58I6OUQkDHU
cqbZ085ZMk+c5uZiG9SQk1mEhICMcxztpE6gO/AejtQsAaKOnonjsmu7425M3yxN
ompzbDIEO8s+2WcJ0IhoqEuDgrdlnjRN7L2ye0l/ygP6F/Rc6ew3EulLgXfNITxe
D56+b95rGBacV/HNT4MfvVYjJH0cwTRx1kK5VYTw2epPP9az+d9KeKqlJ4eOlqIp
At7cIqq2tTILJWVyPi/I/YuQ8JBIhaLrvgCg6nM1HNHnk31UYJmwCQuOejPtq9vZ
k0fv5M9Mish/HcO8AVBibSn24P3vYsObubqs72QrgCQ9DXs/VxyBsnCJxhIjl26f
WICTxI2IwW+WQRIlW38PZm7p+WNwnrkwQOLfKCeQhcpFmc7F4givYvUXRB+gEl7l
izoov5MTf1w6hUybJHPzX4LOBngWW7nrMfShOGTqnG9M/eVNJES3UBwp42DHJ4FQ
E2iTBK7CWEhDhqhfdlQtEjjc98DD4RszxeCPWSlqp9BndEoSiWEBwiVmMMQQjoqo
1DFBnLJT1XLq4xn//vlajhG79BN4j9X/1t7ix/aMj7HweM76hMc=
=c9+2
-----END PGP SIGNATURE-----

--Ev4Ptu0a2lfamOAV--

