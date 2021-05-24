Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D20438E07B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 06:51:16 +0200 (CEST)
Received: from localhost ([::1]:44568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll2Yd-0007nL-3v
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 00:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll2Wy-00067q-2b; Mon, 24 May 2021 00:49:32 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:51773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll2Wv-0008IZ-P1; Mon, 24 May 2021 00:49:31 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FpPrP3lfSz9sPf; Mon, 24 May 2021 14:49:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621831765;
 bh=TYSEoVvepypGulY3hx66YvaoKLjvj6EpNj205Et0BrE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C5BBSvbKkjdjKcjNCzkLOgwE2O14skIo1hPWsGpJBIGTAm1udS2qHyuXcd+ODNs2X
 rH9O2z0xwiv5cAjsnAGHlGg3b/dIytfNdghlqvAUjzrvzORztGcQI5H/QcKVbCPXke
 Jx5QPHmzGqImbqvsrCcYt7pEdx5IJ+Lbh5D78Kbc=
Date: Mon, 24 May 2021 14:45:23 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Subject: Re: [PATCH v5 1/3] spapr: nvdimm: Forward declare and move the
 definitions
Message-ID: <YKsvY5h837sbO3UB@yekko>
References: <162133924680.610.15121309741756314238.stgit@4f1e6f2bd33e>
 <162133925415.610.11584121797866216417.stgit@4f1e6f2bd33e>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FRUbPektJYbiNupX"
Content-Disposition: inline
In-Reply-To: <162133925415.610.11584121797866216417.stgit@4f1e6f2bd33e>
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
Cc: nvdimm@lists.linux.dev, aneesh.kumar@linux.ibm.com, groug@kaod.org,
 kvm-ppc@vger.kernel.org, qemu-devel@nongnu.org, shivaprasadbhat@gmail.com,
 qemu-ppc@nongnu.org, bharata@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--FRUbPektJYbiNupX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 18, 2021 at 08:03:17AM -0400, Shivaprasad G Bhat wrote:
> The subsequent patches add definitions which tend to get
> the compilation to cyclic dependency. So, prepare with
> forward declarations, move the definitions and clean up.
>=20
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>

This is a reasonable cleanup regardless of the rest of the series, so
I've applied this to ppc-for-6.1.

> ---
>  hw/ppc/spapr_nvdimm.c         |   12 ++++++++++++
>  include/hw/ppc/spapr_nvdimm.h |   14 ++------------
>  2 files changed, 14 insertions(+), 12 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
> index 252204e25f..3f57a8b6fa 100644
> --- a/hw/ppc/spapr_nvdimm.c
> +++ b/hw/ppc/spapr_nvdimm.c
> @@ -35,6 +35,18 @@
>  /* SCM device is unable to persist memory contents */
>  #define PAPR_PMEM_UNARMED PPC_BIT(0)
> =20
> +/*
> + * The nvdimm size should be aligned to SCM block size.
> + * The SCM block size should be aligned to SPAPR_MEMORY_BLOCK_SIZE
> + * in order to have SCM regions not to overlap with dimm memory regions.
> + * The SCM devices can have variable block sizes. For now, fixing the
> + * block size to the minimum value.
> + */
> +#define SPAPR_MINIMUM_SCM_BLOCK_SIZE SPAPR_MEMORY_BLOCK_SIZE
> +
> +/* Have an explicit check for alignment */
> +QEMU_BUILD_BUG_ON(SPAPR_MINIMUM_SCM_BLOCK_SIZE % SPAPR_MEMORY_BLOCK_SIZE=
);
> +
>  bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nv=
dimm,
>                             uint64_t size, Error **errp)
>  {
> diff --git a/include/hw/ppc/spapr_nvdimm.h b/include/hw/ppc/spapr_nvdimm.h
> index 73be250e2a..764f999f54 100644
> --- a/include/hw/ppc/spapr_nvdimm.h
> +++ b/include/hw/ppc/spapr_nvdimm.h
> @@ -11,19 +11,9 @@
>  #define HW_SPAPR_NVDIMM_H
> =20
>  #include "hw/mem/nvdimm.h"
> -#include "hw/ppc/spapr.h"
> =20
> -/*
> - * The nvdimm size should be aligned to SCM block size.
> - * The SCM block size should be aligned to SPAPR_MEMORY_BLOCK_SIZE
> - * inorder to have SCM regions not to overlap with dimm memory regions.
> - * The SCM devices can have variable block sizes. For now, fixing the
> - * block size to the minimum value.
> - */
> -#define SPAPR_MINIMUM_SCM_BLOCK_SIZE SPAPR_MEMORY_BLOCK_SIZE
> -
> -/* Have an explicit check for alignment */
> -QEMU_BUILD_BUG_ON(SPAPR_MINIMUM_SCM_BLOCK_SIZE % SPAPR_MEMORY_BLOCK_SIZE=
);
> +typedef struct SpaprDrc SpaprDrc;
> +typedef struct SpaprMachineState SpaprMachineState;
> =20
>  int spapr_pmem_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
>                             void *fdt, int *fdt_start_offset, Error **err=
p);
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--FRUbPektJYbiNupX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCrL2MACgkQbDjKyiDZ
s5J9Rw//V1W1q5wDmubYAkWlySjaEe2fY+4Fzxr0Ic+qh4oJP1Y3JZCIw7sKCZoC
lcIHfI/hBVHp/xBMo2oa5RmL6CJa8iAf5toE/HDNsOAInKmGbhJ3OTR71HFLj0wh
EK9MlbsIxLhIL73/XIzsAYd+C1wz8tp0/UGstvHMk7VJMoPAIkDhHki+WOt1gonK
ZySnrL4orrr5cDUVKiDHYc/PClQl3KLp0Foog6G2/fD2dn+lElIVM1uEbgxPJf2V
TgCoaNX+CNIkMaJzYbe4bQ5toidOrBrfh5fPLhT/DMD295EIzLk38nns7j8h2Wn1
4i4MF8Dj+2+fjuHd0TJvuq98m6HwJE3H2SngIBvQkCmA/imla9GfjNTxQFKsOjXZ
JtVkVIQlCXJOaWCbVKE47msphsYZ6p0YH000bmBUkq8ADeqB6FpbwLP9W5+pjTuq
SNQ0MLLX01ZrpcsFCpAbKpVU6It2p9MC4mfZjNTQU30/RGljtBL8rUNxkBsQYYTa
CD6I0LL5f8yNlIoTqyVFzwKA31QmRh+YSDvwsHvZ5f5Dhxh0DMrfmBVVE+jZH8nr
RcqNGGGuoJVZ0z+lzfyV4xKWkSzLDpCpXlBZ0BO2BlUHr3mFAJd9momQU5JzgYVj
8EES1xs3FbzTvR/YjeLlNvjFUi0WIZnew829KC/RzTdgoyk5ic0=
=Ptw/
-----END PGP SIGNATURE-----

--FRUbPektJYbiNupX--

