Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6B51389B4
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 04:25:19 +0100 (CET)
Received: from localhost ([::1]:45086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iqqLu-0008AK-7w
	for lists+qemu-devel@lfdr.de; Sun, 12 Jan 2020 22:25:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33628)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iqqKp-0007IJ-Ui
 for qemu-devel@nongnu.org; Sun, 12 Jan 2020 22:24:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iqqKo-0003IQ-Rq
 for qemu-devel@nongnu.org; Sun, 12 Jan 2020 22:24:11 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:46221)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iqqKl-00036u-2e; Sun, 12 Jan 2020 22:24:07 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47wzTB5Mnvz9sP3; Mon, 13 Jan 2020 14:23:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1578885838;
 bh=GSzB1/RoqRWSpXQnvdZLFlk4mB9lNaa5NXZOktq/Pdg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kqX/uxq7YKvFvznFeTSk2Z1zXdJ5jVrQcZGikvBIAJnmZCH6fSYKG83W0Wsa9xoy4
 AXBbAaSyDXA9Nufd3jE7gMp7PYrdO2OOS+ECa9IeMgOd24wso2X1IBzZitintMzx27
 2oIBwq3YGF/dpFVzhqmFMCRiLIn/JK1gCYbOJxVY=
Date: Mon, 13 Jan 2020 11:11:05 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 02/15] hw/ppc/spapr_rtas: Use local MachineState variable
Message-ID: <20200113011105.GA7045@umbus>
References: <20200109152133.23649-1-philmd@redhat.com>
 <20200109152133.23649-3-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline
In-Reply-To: <20200109152133.23649-3-philmd@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Juan Quintela <quintela@redhat.com>, qemu-ppc@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 09, 2020 at 04:21:20PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Since we have the MachineState already available locally,
> ues it instead of the global current_machine.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr_rtas.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index 8d8d8cdfcb..e88bb1930e 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -281,7 +281,7 @@ static void rtas_ibm_get_system_parameter(PowerPCCPU =
*cpu,
>                                            "DesProcs=3D%d,"
>                                            "MaxPlatProcs=3D%d",
>                                            max_cpus,
> -                                          current_machine->ram_size / Mi=
B,
> +                                          ms->ram_size / MiB,
>                                            ms->smp.cpus,
>                                            max_cpus);
>          if (pcc->n_host_threads > 0) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4bw6MACgkQbDjKyiDZ
s5J3Rg/+PcAF6N1hOCWdn3fjZ7uZ8Dc6XsXHNfrNBUKNNZR5evR3f/Uw91FbBnWU
93bkX39mSNqucWhzHGS3AH0bryt5f//anWrTpzbBE+yYT2Zw1I9u355c5/FzJlVW
5qfcth5UPcqmQ0QJwtq46xpwMoOi7lH8mXsM8/LTBdRqgy9jMnW+tjuUOoC9vP+2
+55HExP5h03MBB3kKMxCGPogC8wzdo6PLueDD8TSm9OXSEQGrQKmG/0kXRjVxpRb
YUlT6u7R9P/pN+sVZ/+denw7CBYqMjrAhnu8tHP9PdGT7uRadR8VbfoUe9QEREwd
kd7BHhyN9RtspDMwx5vUDuICtjoFZW9gsVYzo80XCgVHMHqazBtcjIJMoyCP4u0d
jMDRCeKMX7/iXjjZ0BK4bAol/TbT/luZF+aQQRTT4uhK4H3aeQdheOanj3nsWB1t
kMbGTwUAKvLDFRPfUnUfDGyf1QxsO31izD2XRqHUiu1kbFHn3c83zBf5IOOXE1qP
IoD1ldQ5SMQ/anRHbvDyhhQyLHBNJlua2/baqj5U9a3J/nNKlrl1mrYCHMsShqUO
/QymmpNf/uwMtJoInAUeCPe5m+SfZmPewDawfebcSljiNPL2JFK2ixXXSlFDNQpp
uMusEfKsDPY8r/42sDhIerUu/TulgIa0YrDi0gf31NwV3sHaIRo=
=tUZF
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--

