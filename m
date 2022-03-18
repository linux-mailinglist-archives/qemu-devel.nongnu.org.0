Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD6D4DD3CA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 04:55:14 +0100 (CET)
Received: from localhost ([::1]:57296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV3hp-0006HU-IJ
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 23:55:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nV3Ux-0001Az-P6; Thu, 17 Mar 2022 23:41:55 -0400
Received: from [2404:9400:2221:ea00::3] (port=60173 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nV3Ut-0004bi-QO; Thu, 17 Mar 2022 23:41:55 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4KKVDk1D1dz4xgw; Fri, 18 Mar 2022 14:41:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1647574902;
 bh=EyExtHR0sSOCTHPNt1p2HTzuYDoIGG7HYPwMywPJ8Yk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ClzG8bIfjomMRwajVBwQD9qhBQvVIjMTeG7NN4W4C0xz4uXEkQWaQRdQ/MydjiKLH
 WsLx9oRhyUJhPHJhicdkKMrKApQa7Wpnz2kDC29xvwqGhSi06PyTFjDUlWEgLGO/8b
 SuxyNkNxStHlN0hlPBWtRjqbfvyo3zhbuxo/pHzU=
Date: Fri, 18 Mar 2022 14:41:36 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 3/3] spapr: Move nested KVM hypercalls under a TCG only
 config.
Message-ID: <YjP/cHK+TQt5Rzpo@yekko>
References: <20220317172049.2681740-1-farosas@linux.ibm.com>
 <20220317172049.2681740-4-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4GHGztTPhhV31MKz"
Content-Disposition: inline
In-Reply-To: <20220317172049.2681740-4-farosas@linux.ibm.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2404:9400:2221:ea00::3
 (failed)
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 npiggin@gmail.com, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--4GHGztTPhhV31MKz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 17, 2022 at 02:20:49PM -0300, Fabiano Rosas wrote:
> These are the spapr virtual hypervisor implementation of the nested
> KVM API. They only make sense when running with TCG.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  hw/ppc/spapr_hcall.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index c0bfc4bc9c..f2c802c155 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -2,6 +2,7 @@
>  #include "qemu/cutils.h"
>  #include "qapi/error.h"
>  #include "sysemu/hw_accel.h"
> +#include "sysemu/tcg.h"
>  #include "sysemu/runstate.h"
>  #include "qemu/log.h"
>  #include "qemu/main-loop.h"
> @@ -1473,7 +1474,8 @@ target_ulong spapr_hypercall(PowerPCCPU *cpu, targe=
t_ulong opcode,
>      return H_FUNCTION;
>  }
> =20
> -/* TCG only */
> +#ifdef CONFIG_TCG
> +
>  #define PRTS_MASK      0x1f
> =20
>  static target_ulong h_set_ptbl(PowerPCCPU *cpu,
> @@ -1807,6 +1809,12 @@ out_restore_l1:
>      g_free(spapr_cpu->nested_host_state);
>      spapr_cpu->nested_host_state =3D NULL;
>  }
> +#else
> +void spapr_exit_nested(PowerPCCPU *cpu, int excp)
> +{
> +    g_assert_not_reached();
> +}
> +#endif
> =20
>  #ifndef CONFIG_TCG
>  static target_ulong h_softmmu(PowerPCCPU *cpu, SpaprMachineState *spapr,
> @@ -1829,7 +1837,10 @@ static void hypercall_register_softmmu(void)
>  #else
>  static void hypercall_register_softmmu(void)
>  {
> -    /* DO NOTHING */
> +    spapr_register_hypercall(KVMPPC_H_SET_PARTITION_TABLE, h_set_ptbl);
> +    spapr_register_hypercall(KVMPPC_H_ENTER_NESTED, h_enter_nested);
> +    spapr_register_hypercall(KVMPPC_H_TLB_INVALIDATE, h_tlb_invalidate);
> +    spapr_register_hypercall(KVMPPC_H_COPY_TOFROM_GUEST, h_copy_tofrom_g=
uest);

This doesn't fit.  This is specifically about the MMU hypercalls - if
you want to put other things in there it needs a name change at least.

>  }
>  #endif
> =20
> @@ -1888,11 +1899,6 @@ static void hypercall_register_types(void)
>      spapr_register_hypercall(KVMPPC_H_CAS, h_client_architecture_support=
);
> =20
>      spapr_register_hypercall(KVMPPC_H_UPDATE_DT, h_update_dt);
> -
> -    spapr_register_hypercall(KVMPPC_H_SET_PARTITION_TABLE, h_set_ptbl);
> -    spapr_register_hypercall(KVMPPC_H_ENTER_NESTED, h_enter_nested);
> -    spapr_register_hypercall(KVMPPC_H_TLB_INVALIDATE, h_tlb_invalidate);
> -    spapr_register_hypercall(KVMPPC_H_COPY_TOFROM_GUEST, h_copy_tofrom_g=
uest);
>  }
> =20
>  type_init(hypercall_register_types)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4GHGztTPhhV31MKz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIz/2gACgkQgypY4gEw
YSIHzg//XhmUMsoeHLENHlGip9/4r+IUZdzuInPsD93y2y1Cj/LFiii++hHPsodO
nJ8trxl8tZGtZec9a2edTUHdmKz1ShmyHj70+a27YizTlzt0o185HKol9PC/oQdA
WQnqz2F1TYYKMIhckglfED299v99dXlY/i+eRYKj6Po+DXR2oZNHmtRpo8XBWarz
8/mvVBlBr0S2++UtdWyPY/o58FLw0xFKfBWajizejR3vPsrzB5oEqWrVsQX0bIWd
0Ifjwpc8xwq2qYjJRY5SEwKN8xojwk1lY+AfukPNMySfxPqd/FnNzhfMxI0mu1Rc
ASD7Uv1dkoEOpkXzI3RqnF9hcZhlgncLhtNn+WHThBhHdG+/LTh0xMGbPe5ZWrrB
uWCYSYyaSN1DmRuw7iUbasP/sz8EClPcftyHuSQyh0lKa5e+SIz2twH6uhVv5JSa
FtAHfE7BoKJBoPLRz3UdZEUO9dVky0fIn0GuJMqgkKQtNIDImft5/vStrSe2M6iQ
bl5A9dCtgVUW0Vq+wwyuJiDJcl+JyFO/5qCkMQbx2f9TnI2LKqd/fl1my5+IWuc1
pmmMWmxdPwkzx22kMeMHMs4l9wGdqTzKs3wff8mykjRokOrzAeBnEb0iFGgawsN2
Tw+/mfD0Hrlpp/lDpe8hkpe3jbkoe14Gbj88ztxD9CCNfxfNPJc=
=jYCe
-----END PGP SIGNATURE-----

--4GHGztTPhhV31MKz--

