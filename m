Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A4E486057
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 06:42:52 +0100 (CET)
Received: from localhost ([::1]:59902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5LY2-0003cn-RG
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 00:42:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n5LNy-0004nL-1A; Thu, 06 Jan 2022 00:32:26 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:58251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n5LNp-0002Wv-0S; Thu, 06 Jan 2022 00:32:23 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JTw3002l0z4y49; Thu,  6 Jan 2022 16:32:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1641447132;
 bh=HT1SPTCUG9IiQxJ4AjIp6c56w1hOzsOPoyKbHolgh6k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RZdetxxMULbKEaoUAWayrxvlqBg4+CVUZnAtpskdqK82BZeyt21HGnb6umCbJhzol
 pX2MjCXmFo389e4YlKELyn8adKcAxqQIDIl/ruFVNcJ+2IXkBrCxYcslzb67l6gH8O
 5aCeG00gwrNwnFw4L93j7SGdPfIThDPaGZcZDbU8=
Date: Thu, 6 Jan 2022 16:31:27 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v2 6/7] target/ppc: Use ppc_interrupts_little_endian in
 powerpc_excp
Message-ID: <YdZ+r2rYXoerdeUO@yekko>
References: <20220105204029.4058500-1-farosas@linux.ibm.com>
 <20220105204029.4058500-7-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bevUz7eh4EC8pY8W"
Content-Disposition: inline
In-Reply-To: <20220105204029.4058500-7-farosas@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--bevUz7eh4EC8pY8W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 05, 2022 at 05:40:28PM -0300, Fabiano Rosas wrote:
> The ppc_interrupts_little_endian function is now suitable for
> determining the endianness of interrupts for all CPUs.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Nice!

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/excp_helper.c | 29 +----------------------------
>  1 file changed, 1 insertion(+), 28 deletions(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 92953af896..d16bdf9283 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -833,36 +833,9 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp)
>       * Sort out endianness of interrupt, this differs depending on the
>       * CPU, the HV mode, etc...
>       */
> -#ifdef TARGET_PPC64
> -    if (excp_model =3D=3D POWERPC_EXCP_POWER7) {
> -        if (!(new_msr & MSR_HVB) && (env->spr[SPR_LPCR] & LPCR_ILE)) {
> -            new_msr |=3D (target_ulong)1 << MSR_LE;
> -        }
> -    } else if (excp_model =3D=3D POWERPC_EXCP_POWER8) {
> -        if (new_msr & MSR_HVB) {
> -            if (env->spr[SPR_HID0] & HID0_HILE) {
> -                new_msr |=3D (target_ulong)1 << MSR_LE;
> -            }
> -        } else if (env->spr[SPR_LPCR] & LPCR_ILE) {
> -            new_msr |=3D (target_ulong)1 << MSR_LE;
> -        }
> -    } else if (excp_model =3D=3D POWERPC_EXCP_POWER9 ||
> -               excp_model =3D=3D POWERPC_EXCP_POWER10) {
> -        if (new_msr & MSR_HVB) {
> -            if (env->spr[SPR_HID0] & HID0_POWER9_HILE) {
> -                new_msr |=3D (target_ulong)1 << MSR_LE;
> -            }
> -        } else if (env->spr[SPR_LPCR] & LPCR_ILE) {
> -            new_msr |=3D (target_ulong)1 << MSR_LE;
> -        }
> -    } else if (msr_ile) {
> +    if (ppc_interrupts_little_endian(cpu, !!(new_msr & MSR_HVB))) {
>          new_msr |=3D (target_ulong)1 << MSR_LE;
>      }
> -#else
> -    if (msr_ile) {
> -        new_msr |=3D (target_ulong)1 << MSR_LE;
> -    }
> -#endif
> =20
>  #if defined(TARGET_PPC64)
>      if (excp_model =3D=3D POWERPC_EXCP_BOOKE) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bevUz7eh4EC8pY8W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHWfq8ACgkQbDjKyiDZ
s5KbHxAAoH2poLZdV56+2FVy8y1MPbqBynb/UnNAGfDq65UnRGCQ8Q66ICvlMOd5
ondrkk8VNqol5C5vZ+nkaagGg6LMou1MCFYFDM0shdldph/7kkJbHruqoRtzZGV4
1NaeDVmpbV/gnNcmQnK7uhVYd7J3fhxP5eS3yBWv63Eh5Nth/Isu+wss+aXWR9vr
10QXk0OiRYt21hgzA5MXCMsv92f8ajZwTkjyoFWxnSaRWiy1ep5alNYy5yY9zqkY
AxL1y6ugb9WQ0ZTewehSdWOJBR1G0Nu97tyVEChFaC/tl7RykI3LEGlzK6zRk7Hf
fNrJIQXy1Bmt+D7RbGhJbjGtKnoO7fv+uXsVr2rsdQ/V9ZAhHGe8I/Uw/Myo2EpF
z6HJwpqDPF8CVgh7gJK4DZZEqehWdsCX/XnlPhH+n1Po4K4PDKOqwikC/Cv2obhV
lVOZtSwEaTL0agptkBhGoQH/Kun3XqwLgvoKvoAuhheqkT/hqy+MeN6rPsHFTGDl
VP21pv+0T322XWaT5tDFbA3rYNH6ioSoRp8EDeahkzb4o1NYWz+UKhzZCTe/naH0
HKFdrg2hDKkXfHA4qxseAuszhd3yY2A1oHPzvkw8LrXhFcbun5S2Kc6YUQgWaEdC
IlP8dEWOaCdk+fPTm4mz4rKaMUQX1I1HRp+9JDl27EKCkPWSVZo=
=cWsL
-----END PGP SIGNATURE-----

--bevUz7eh4EC8pY8W--

