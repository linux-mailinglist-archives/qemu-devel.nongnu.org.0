Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C56CD486055
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 06:38:31 +0100 (CET)
Received: from localhost ([::1]:53652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5LTq-0007rp-QE
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 00:38:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n5LNx-0004nO-Sn; Thu, 06 Jan 2022 00:32:25 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=46423
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n5LNp-0002Wr-AX; Thu, 06 Jan 2022 00:32:23 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JTw2z707Tz4y48; Thu,  6 Jan 2022 16:32:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1641447131;
 bh=bF4/WXXDVz1l4ZWq3fbP2vN+PUtyUAnkBRF+eEqB3PM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=emqHKgVo2Ghtqf0ZHT+7Biu019w9F/+gHAnOFISOb3inPgZaeVWQP9uEZkwyjAT8Z
 F5SR5xkaN5HXyOoKOQdNwlK1CGRYXjNZEPJP2KeSS0/L70Ok0UeSawmQIuCJnGXTQR
 87PAXFwrzpow1JweM4jmZsLE7PyyvAEwjYnxeKlk=
Date: Thu, 6 Jan 2022 16:30:48 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v2 5/7] target/ppc: Add MSR_ILE support to
 ppc_interrupts_little_endian
Message-ID: <YdZ+iCCCcqrA1EBs@yekko>
References: <20220105204029.4058500-1-farosas@linux.ibm.com>
 <20220105204029.4058500-6-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TjbtGtnU1b9l4ePh"
Content-Disposition: inline
In-Reply-To: <20220105204029.4058500-6-farosas@linux.ibm.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


--TjbtGtnU1b9l4ePh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 05, 2022 at 05:40:27PM -0300, Fabiano Rosas wrote:
> Some CPUs set ILE via an MSR bit. We can make
> ppc_interrupts_little_endian handle that case as well. Now we have a
> centralized way of determining the endianness of interrupts.
>=20
> This change has no functional impact.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index a6fc857ad4..f99cd0ea92 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -2733,7 +2733,7 @@ static inline bool ppc_interrupts_little_endian(Pow=
erPCCPU *cpu, bool hv)
>  {
>      PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
>      CPUPPCState *env =3D &cpu->env;
> -    bool ile =3D false;
> +    bool ile;
> =20
>      if (hv && env->has_hv_mode) {
>          if (is_isa300(pcc)) {
> @@ -2744,6 +2744,8 @@ static inline bool ppc_interrupts_little_endian(Pow=
erPCCPU *cpu, bool hv)
> =20
>      } else if (pcc->lpcr_mask & LPCR_ILE) {
>          ile =3D !!(env->spr[SPR_LPCR] & LPCR_ILE);
> +    } else {
> +        ile =3D !!(msr_ile);
>      }
> =20
>      return ile;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--TjbtGtnU1b9l4ePh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHWfogACgkQbDjKyiDZ
s5JLqA/+KvX++mNCV9ceeWieoDrldMkftpKlHrY4lCfPDsr7kfdfEYXHSwq+nsRA
6buvAlgBonJCW3VH6LpaZXndekHbTBBcOsarNbA4VPv/LgV4Kp9auicwG4xPbxGS
EsiSQdsVHjSUwh5SOQ9euO0GgZy/gjv5k71qz57F3PtsNeA6RteuzIaYQX0YqjQn
9gELdUPTBIviZbbBE6kbhe/Vv14EmdrhcemEl2kzUuPv9cqOdQWQS3mzaX4Xo1hr
S7mJ4BgacqQUfLdZz+JiASfcW6gH9vNRQE2lFjiCPUnI6uRejL1tRo+RNYTSWHRa
lrNnTKxtv+GBPnba5hsZjhRIautttgZo0R9cXd92LddRrTEudNwQgvLmov49jppr
pkr1BjUd21EUYKA9LrUbElw8wmbe2aVgitDiZscu6QvLdcvRxaa1I8CFXnJVmC1V
Fd/8r+F6a6cK+O3z7GZwsI6ChEcmUgN0UBbKi8nEnAyKRcI0x2QBwXmRVq/HPAVb
D1HSx21HIFm4WVx/FuzRXObhXg2niptef8G+8QFc7xBedgaVaoOGGuFaZj2aLbDd
vUVlbO411dslt6eZnIG8YwNEVUuG4d55mCbmccBmcvsA25+CEOaZmRJOAT1ueIoD
Z9i0BMKZcomQ5ZsuMWVE5JsKWnVjGaCmGsTRAcohNsH5u6n7nYI=
=ZBf1
-----END PGP SIGNATURE-----

--TjbtGtnU1b9l4ePh--

