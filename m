Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AE42CCCCD
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 03:48:34 +0100 (CET)
Received: from localhost ([::1]:44562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkefZ-00009P-1G
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 21:48:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kkee5-0007t7-QG; Wed, 02 Dec 2020 21:47:03 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:45581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kkee0-0005tW-32; Wed, 02 Dec 2020 21:47:00 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CmgGK44x1z9sVJ; Thu,  3 Dec 2020 13:46:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606963609;
 bh=eRbCz8gNe7SVPkRl+rF+ZXsURa+7t5Im69+b/4mFTUE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G5+OQtN1V2RsWf0CPzZKnceeuSmhImlyJq8aGoAXFD2gjM+VG4HhEx0y+gE48MS8w
 botouBR/YySDGmKGm9HEityO5EbJvhQ+Xk96G1VmOOjCzc77Rr+gPiCv6wmPcbfQ/4
 ce8xc/8QVDg5hRKbP+dC7Te0/eTqKH7V3Ko3u3IE=
Date: Thu, 3 Dec 2020 13:40:13 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] xive: Add more trace events
Message-ID: <20201203024013.GF7801@yekko.fritz.box>
References: <20201127133654.290177-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3oCie2+XPXTnK5a5"
Content-Disposition: inline
In-Reply-To: <20201127133654.290177-1-clg@kaod.org>
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--3oCie2+XPXTnK5a5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2020 at 02:36:54PM +0100, C=E9dric Le Goater wrote:
> These are useful to understand IRQ requests from the OS.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> ---
>=20
> David, Feel free to merge with the previous.

Done, thanks.

>=20
>  hw/intc/spapr_xive.c     | 6 ++++++
>  hw/intc/spapr_xive_kvm.c | 5 +++++
>  hw/intc/trace-events     | 7 +++++++
>  3 files changed, 18 insertions(+)
>=20
> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> index 644cc85cbdc9..db6d0e7a3a12 100644
> --- a/hw/intc/spapr_xive.c
> +++ b/hw/intc/spapr_xive.c
> @@ -563,6 +563,8 @@ static int spapr_xive_claim_irq(SpaprInterruptControl=
ler *intc, int lisn,
> =20
>      assert(lisn < xive->nr_irqs);
> =20
> +    trace_spapr_xive_claim_irq(lisn, lsi);
> +
>      if (xive_eas_is_valid(&xive->eat[lisn])) {
>          error_setg(errp, "IRQ %d is not free", lisn);
>          return -EBUSY;
> @@ -588,6 +590,8 @@ static void spapr_xive_free_irq(SpaprInterruptControl=
ler *intc, int lisn)
>      SpaprXive *xive =3D SPAPR_XIVE(intc);
>      assert(lisn < xive->nr_irqs);
> =20
> +    trace_spapr_xive_free_irq(lisn);
> +
>      xive->eat[lisn].w &=3D cpu_to_be64(~EAS_VALID);
>  }
> =20
> @@ -654,6 +658,8 @@ static void spapr_xive_set_irq(SpaprInterruptControll=
er *intc, int irq, int val)
>  {
>      SpaprXive *xive =3D SPAPR_XIVE(intc);
> =20
> +    trace_spapr_xive_set_irq(irq, val);
> +
>      if (spapr_xive_in_kernel(xive)) {
>          kvmppc_xive_source_set_irq(&xive->source, irq, val);
>      } else {
> diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
> index e8667ce5f621..acc8c3650c4c 100644
> --- a/hw/intc/spapr_xive_kvm.c
> +++ b/hw/intc/spapr_xive_kvm.c
> @@ -20,6 +20,7 @@
>  #include "hw/ppc/spapr_xive.h"
>  #include "hw/ppc/xive.h"
>  #include "kvm_ppc.h"
> +#include "trace.h"
> =20
>  #include <sys/ioctl.h>
> =20
> @@ -163,6 +164,8 @@ int kvmppc_xive_cpu_connect(XiveTCTX *tctx, Error **e=
rrp)
> =20
>      vcpu_id =3D kvm_arch_vcpu_id(tctx->cs);
> =20
> +    trace_kvm_xive_cpu_connect(vcpu_id);
> +
>      ret =3D kvm_vcpu_enable_cap(tctx->cs, KVM_CAP_PPC_IRQ_XIVE, 0, xive-=
>fd,
>                                vcpu_id, 0);
>      if (ret < 0) {
> @@ -308,6 +311,8 @@ uint64_t kvmppc_xive_esb_rw(XiveSource *xsrc, int src=
no, uint32_t offset,
>          return xive_esb_rw(xsrc, srcno, offset, data, 1);
>      }
> =20
> +    trace_kvm_xive_source_reset(srcno);
> +
>      /*
>       * Special Load EOI handling for LSI sources. Q bit is never set
>       * and the interrupt should be re-triggered if the level is still
> diff --git a/hw/intc/trace-events b/hw/intc/trace-events
> index 77addc100f72..8ed397a0d587 100644
> --- a/hw/intc/trace-events
> +++ b/hw/intc/trace-events
> @@ -205,6 +205,9 @@ bcm2835_ic_set_gpu_irq(int irq, int level) "GPU irq #=
%d level %d"
>  bcm2835_ic_set_cpu_irq(int irq, int level) "CPU irq #%d level %d"
> =20
>  # spapr_xive.c
> +spapr_xive_claim_irq(uint32_t lisn, bool lsi) "lisn=3D0x%x lsi=3D%d"
> +spapr_xive_free_irq(uint32_t lisn) "lisn=3D0x%x"
> +spapr_xive_set_irq(uint32_t lisn, uint32_t val) "lisn=3D0x%x val=3D%d"
>  spapr_xive_get_source_info(uint64_t flags, uint64_t lisn) "flags=3D0x%"P=
RIx64" lisn=3D0x%"PRIx64
>  spapr_xive_set_source_config(uint64_t flags, uint64_t lisn, uint64_t tar=
get, uint64_t priority, uint64_t eisn) "flags=3D0x%"PRIx64" lisn=3D0x%"PRIx=
64" target=3D0x%"PRIx64" priority=3D0x%"PRIx64" eisn=3D0x%"PRIx64
>  spapr_xive_get_source_config(uint64_t flags, uint64_t lisn) "flags=3D0x%=
"PRIx64" lisn=3D0x%"PRIx64
> @@ -217,6 +220,10 @@ spapr_xive_esb(uint64_t flags, uint64_t lisn, uint64=
_t offset, uint64_t data) "f
>  spapr_xive_sync(uint64_t flags, uint64_t lisn) "flags=3D0x%"PRIx64" lisn=
=3D0x%"PRIx64
>  spapr_xive_reset(uint64_t flags) "flags=3D0x%"PRIx64
> =20
> +# spapr_xive_kvm.c
> +kvm_xive_cpu_connect(uint32_t id) "connect CPU%d to KVM device"
> +kvm_xive_source_reset(uint32_t srcno) "IRQ 0x%x"
> +
>  # xive.c
>  xive_tctx_accept(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pipr=
, uint8_t cppr, uint8_t nsr) "target=3D%d ring=3D0x%x IBP=3D0x%02x PIPR=3D0=
x%02x CPPR=3D0x%02x NSR=3D0x%02x ACK"
>  xive_tctx_notify(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pipr=
, uint8_t cppr, uint8_t nsr) "target=3D%d ring=3D0x%x IBP=3D0x%02x PIPR=3D0=
x%02x CPPR=3D0x%02x NSR=3D0x%02x raise !"

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3oCie2+XPXTnK5a5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/IUA0ACgkQbDjKyiDZ
s5L5gQ//bDdW3q7V+iQjr7uifESKlGCuGJGVN8VdGVbUj/LFBkzAI9jo5EfQvGqC
XIqSMdrgFIEI+LHF6PsZo5DlUBy32vWKhq2aTXu5tNX2enlSXJPVXICs+KZqHSAv
kUG8Kg8Qa3To3VyM2XjlgwRPuWEoFYcp9yaZd4V98bosMwZ7W3ejzaXUkRt+v2Gr
ZIsZP33zm2U6Clfuq0zOgGcFCuv0i7svNdAlIEHTD6k7HCXppkWIctvKuFf0yOTi
reOnccztYnOF33qRXYT/Lw4tCQbGhwLXA9J1AO37S7s7HekqhXJM40RSTOloITA3
X/JBFKyV5s5sBpDtdUU0bHpFx9woDHPzAXq9wQAKucrUt+f2+MjdPjBEJROL1stI
zQzPR2ilrsVoHJtqhufsj1FdL1Gk0rHQv6Z2TxCPd0jR2M/OzXfdmh/j88bLbBpi
OtHKJmgDIONwT4CVO+EJxjuj3U0LvaXZs3km87bZbhWk1cN5vzMnbzoYDrTsRFMu
KFR+KtrjnTp0+fd/zZYa9owXTt3+gGZV6do2dc3VAMtWPpdU89H6VlZjZ0CS30qe
PWq8IyWLHdztlURhh4i/6EdCB9DbEsHDhNyhhf+8fSlh4eqWMtF9SwiG1DiUBoLc
ZGs/GHJO1WI02CwPrxIxv7DNUtWGsu7TxI60N+TRyZEQgGZFHn8=
=O+4K
-----END PGP SIGNATURE-----

--3oCie2+XPXTnK5a5--

