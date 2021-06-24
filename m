Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A30CD3B2564
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 05:20:38 +0200 (CEST)
Received: from localhost ([::1]:38120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwFuv-0001FL-Dd
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 23:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lwFru-0007z9-CJ; Wed, 23 Jun 2021 23:17:30 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:51273 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lwFrq-0006O6-AJ; Wed, 23 Jun 2021 23:17:30 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G9QKr1LJwz9sVt; Thu, 24 Jun 2021 13:17:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1624504640;
 bh=filypjIX3WQKYYRw3sExkyC3EfHJnrwKWAibNrFVBpk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WuKLofQ1yV1tmKFA/h7n9enNStC0pQCqLOCWEUnVso2SW5LfB1yV+/IIsZUhVZT8E
 UrxGKRY8KRkmuiOOj1h93GGDFMCpWA7OcWZAgx/BinN41fsFFd4VwnA7G4dnq7Z53N
 ITSKyVSe+ziL/m4haShFuFrhsEHxjEheP8wqAxcc=
Date: Thu, 24 Jun 2021 11:28:09 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu] spapr: tune rtas-size
Message-ID: <YNPfqRYtsiUuUnoF@yekko>
References: <20210622070336.1463250-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="c3xDY2dSjqhzyZmR"
Content-Disposition: inline
In-Reply-To: <20210622070336.1463250-1-aik@ozlabs.ru>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--c3xDY2dSjqhzyZmR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 22, 2021 at 05:03:36PM +1000, Alexey Kardashevskiy wrote:
> QEMU reserves space for RTAS via /rtas/rtas-size which tells the client
> how much space the RTAS requires to work which includes the RTAS binary
> blob implementing RTAS runtime. Because pseries supports FWNMI which
> requires plenty of space, QEMU reserves more than 2KB which is
> enough for the RTAS blob as it is just 20 bytes (under QEMU).
>=20
> Since FWNMI reset delivery was added, RTAS_SIZE macro is not used anymore.
> This replaces RTAS_SIZE with RTAS_MIN_SIZE and uses it in
> the /rtas/rtas-size calculation to account for the RTAS blob.
>=20
> Fixes: 0e236d347790 ("ppc/spapr: Implement FWNMI System Reset delivery")
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Applied to ppc-for-6.1, thanks.

> ---
>=20
> Alternatively SLOF could add hv_rtas_size to the property itself
> but splitting calculations between 2 chunks of code seems an overkill.
> The RTAS blob has always been 20 bytes and unlikely to ever change.
> ---
>  include/hw/ppc/spapr.h | 2 +-
>  hw/ppc/spapr.c         | 8 ++++++--
>  2 files changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index f05219f75ef6..5697327e4c00 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -770,7 +770,7 @@ void spapr_load_rtas(SpaprMachineState *spapr, void *=
fdt, hwaddr addr);
>  #define SPAPR_IS_PCI_LIOBN(liobn)   (!!((liobn) & 0x80000000))
>  #define SPAPR_PCI_DMA_WINDOW_NUM(liobn) ((liobn) & 0xff)
> =20
> -#define RTAS_SIZE               2048
> +#define RTAS_MIN_SIZE           20 /* hv_rtas_size in SLOF */
>  #define RTAS_ERROR_LOG_MAX      2048
> =20
>  /* Offset from rtas-base where error log is placed */
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 4dd90b75cc52..9e19c570327e 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -919,9 +919,13 @@ static void spapr_dt_rtas(SpaprMachineState *spapr, =
void *fdt)
>       *
>       * The extra 8 bytes is required because Linux's FWNMI error log che=
ck
>       * is off-by-one.
> +     *
> +     * RTAS_MIN_SIZE is required for the RTAS blob itself.
>       */
> -    _FDT(fdt_setprop_cell(fdt, rtas, "rtas-size", RTAS_ERROR_LOG_MAX +
> -			  ms->smp.max_cpus * sizeof(uint64_t)*2 + sizeof(uint64_t)));
> +    _FDT(fdt_setprop_cell(fdt, rtas, "rtas-size", RTAS_MIN_SIZE +
> +                          RTAS_ERROR_LOG_MAX +
> +                          ms->smp.max_cpus * sizeof(uint64_t) * 2 +
> +                          sizeof(uint64_t)));
>      _FDT(fdt_setprop_cell(fdt, rtas, "rtas-error-log-max",
>                            RTAS_ERROR_LOG_MAX));
>      _FDT(fdt_setprop_cell(fdt, rtas, "rtas-event-scan-rate",

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--c3xDY2dSjqhzyZmR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDT36kACgkQbDjKyiDZ
s5K8Uw/+O2Wov8udTft+nHoB6NGgeWANVfrBbVLEJR0DVU/ZzWNY8stS416CoO8J
lQtbQ0uBSvcXCpLehEJNKw6ibPPmMSIP0iJYnm2VpvLWPuEt+HpyPlz2kCbIao5j
ym0lUlnn3DrgG0hzWpBwMVZQNCffayakm43DuNQmHSG0FgwwWjjTD/juQmtpw+Us
Dg8xaz41h/4p7LSGMjm3gTVZV+R0ZZ0qQq2K9CkMQ5btzVyAZPEpdn2TlGHaMCjV
M48dRQLieLmHfBUdlhEP8775muAEmPGo3Ngh22QM2zGXbAhfZjPvMAcDW3ST1Ux4
QxmTrLB24COjxiWet3pc+gJ2H5yFK9xYt0MEXKh8ZsAZlRsYl23GyqmLKoKlW/nS
lu4XnOheygSRsHdx0ZQIQgjbaJp8YbotoCushM+7tYMT1BPJfP4UqSXDlMQQm5lf
jTGS2RkDIxNfk8/SLiTA6X+Gcd5mXL9ej7PTFI7iieAOoVlnIePYcF5Uj3XriIoh
T8fu5qQZ4r4LCaGAMuarqt3vsbz96x9udrHE+K1WFyu34eUBfTaT1MuwJOlGdXvK
4OpAdkFjGlPC6Buk+qi/gKiR2LA1QiPfPApcMqeQA3n7qn10NxX3WSS27s3RffAx
8unF/zlJXSPhuDddrl/fUKgh//k68UOLPNA/qDXCYw4yfQ/BQgI=
=QaNv
-----END PGP SIGNATURE-----

--c3xDY2dSjqhzyZmR--

