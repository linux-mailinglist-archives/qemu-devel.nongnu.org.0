Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB5D71116
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 07:21:07 +0200 (CEST)
Received: from localhost ([::1]:39218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpnEY-0000Yh-IX
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 01:21:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39803)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hpnCj-00019D-9R
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 01:19:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hpnCh-0003rN-DQ
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 01:19:13 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:47369 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hpnCf-0003nL-By; Tue, 23 Jul 2019 01:19:10 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45t6G83tF3z9sNF; Tue, 23 Jul 2019 15:18:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1563859136;
 bh=hg8jrXVFmhJ7hicC/dItzC7sTBEJw4F4P4xmIeE5Sc4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HyK/QS1gtLwTuvZLT1r29Y9C2NLO8pnTcB8/6LOfmKVGLxZovlKt9hALAStXSN/QM
 tw6l0m80BM5uRAGwHPtHx0qN/mPatFiYtqw0UZmIkmg+6hihecRSjFbPCCYetCkjPX
 fKJZjUEbQk1hcNmaF+9PMn7dRVFzrFiNYSFIrq+s=
Date: Tue, 23 Jul 2019 13:49:08 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <20190723034908.GO25073@umbus.fritz.box>
References: <20190720012850.14369-1-aik@ozlabs.ru>
 <20190720012850.14369-2-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gqEssfNGWsEa4HfM"
Content-Disposition: inline
In-Reply-To: <20190720012850.14369-2-aik@ozlabs.ru>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-devel] [PATCH qemu RFC 1/4] spapr: Allow changing kernel
 loading address
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
Cc: Paul Mackerras <paulus@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--gqEssfNGWsEa4HfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 20, 2019 at 11:28:47AM +1000, Alexey Kardashevskiy wrote:
> Useful for the debugging purposes.

Am I correct in understanding this isn't actually necessary for the
rest of the series to work, just useful for debugging?

>=20
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  include/hw/ppc/spapr.h |  1 +
>  hw/ppc/spapr.c         | 33 +++++++++++++++++++++++++++------
>  2 files changed, 28 insertions(+), 6 deletions(-)
>=20
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 74e427b588fc..ff82bb8554e1 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -159,6 +159,7 @@ struct SpaprMachineState {
>      void *fdt_blob;
>      long kernel_size;
>      bool kernel_le;
> +    uint64_t kernel_addr;
>      uint32_t initrd_base;
>      long initrd_size;
>      uint64_t rtc_offset; /* Now used only during incoming migration */
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 7fad42350538..6d13d65d8996 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1179,7 +1179,7 @@ static void spapr_dt_chosen(SpaprMachineState *spap=
r, void *fdt)
>                            spapr->initrd_base + spapr->initrd_size));
> =20
>      if (spapr->kernel_size) {
> -        uint64_t kprop[2] =3D { cpu_to_be64(KERNEL_LOAD_ADDR),
> +        uint64_t kprop[2] =3D { cpu_to_be64(spapr->kernel_addr),
>                                cpu_to_be64(spapr->kernel_size) };
> =20
>          _FDT(fdt_setprop(fdt, chosen, "qemu,boot-kernel",
> @@ -1365,7 +1365,7 @@ static void *spapr_build_fdt(SpaprMachineState *spa=
pr)
> =20
>      /* Build memory reserve map */
>      if (spapr->kernel_size) {
> -        _FDT((fdt_add_mem_rsv(fdt, KERNEL_LOAD_ADDR, spapr->kernel_size)=
));
> +        _FDT((fdt_add_mem_rsv(fdt, spapr->kernel_addr, spapr->kernel_siz=
e)));
>      }
>      if (spapr->initrd_size) {
>          _FDT((fdt_add_mem_rsv(fdt, spapr->initrd_base, spapr->initrd_siz=
e)));
> @@ -1391,7 +1391,8 @@ static void *spapr_build_fdt(SpaprMachineState *spa=
pr)
> =20
>  static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
>  {
> -    return (addr & 0x0fffffff) + KERNEL_LOAD_ADDR;
> +    SpaprMachineState *spapr =3D opaque;
> +    return (addr & 0x0fffffff) + spapr->kernel_addr;
>  }
> =20
>  static void emulate_spapr_hypercall(PPCVirtualHypervisor *vhyp,
> @@ -2995,12 +2996,12 @@ static void spapr_machine_init(MachineState *mach=
ine)
>          uint64_t lowaddr =3D 0;
> =20
>          spapr->kernel_size =3D load_elf(kernel_filename, NULL,
> -                                      translate_kernel_address, NULL,
> +                                      translate_kernel_address, spapr,
>                                        NULL, &lowaddr, NULL, 1,
>                                        PPC_ELF_MACHINE, 0, 0);
>          if (spapr->kernel_size =3D=3D ELF_LOAD_WRONG_ENDIAN) {
>              spapr->kernel_size =3D load_elf(kernel_filename, NULL,
> -                                          translate_kernel_address, NULL=
, NULL,
> +                                          translate_kernel_address, spap=
r, NULL,
>                                            &lowaddr, NULL, 0, PPC_ELF_MAC=
HINE,
>                                            0, 0);
>              spapr->kernel_le =3D spapr->kernel_size > 0;
> @@ -3016,7 +3017,7 @@ static void spapr_machine_init(MachineState *machin=
e)
>              /* Try to locate the initrd in the gap between the kernel
>               * and the firmware. Add a bit of space just in case
>               */
> -            spapr->initrd_base =3D (KERNEL_LOAD_ADDR + spapr->kernel_size
> +            spapr->initrd_base =3D (spapr->kernel_addr + spapr->kernel_s=
ize
>                                    + 0x1ffff) & ~0xffff;
>              spapr->initrd_size =3D load_image_targphys(initrd_filename,
>                                                       spapr->initrd_base,
> @@ -3253,6 +3254,18 @@ static void spapr_set_vsmt(Object *obj, Visitor *v=
, const char *name,
>      visit_type_uint32(v, name, (uint32_t *)opaque, errp);
>  }
> =20
> +static void spapr_get_kernel_addr(Object *obj, Visitor *v, const char *n=
ame,
> +                                  void *opaque, Error **errp)
> +{
> +    visit_type_uint64(v, name, (uint64_t *)opaque, errp);
> +}
> +
> +static void spapr_set_kernel_addr(Object *obj, Visitor *v, const char *n=
ame,
> +                                  void *opaque, Error **errp)
> +{
> +    visit_type_uint64(v, name, (uint64_t *)opaque, errp);
> +}
> +
>  static char *spapr_get_ic_mode(Object *obj, Error **errp)
>  {
>      SpaprMachineState *spapr =3D SPAPR_MACHINE(obj);
> @@ -3358,6 +3371,14 @@ static void spapr_instance_init(Object *obj)
>      object_property_add_bool(obj, "vfio-no-msix-emulation",
>                               spapr_get_msix_emulation, NULL, NULL);
> =20
> +    object_property_add(obj, "kernel-addr", "uint64", spapr_get_kernel_a=
ddr,
> +                        spapr_set_kernel_addr, NULL, &spapr->kernel_addr,
> +                        &error_abort);
> +    object_property_set_description(obj, "kernel-addr",
> +                                    stringify(KERNEL_LOAD_ADDR)
> +                                    " for -kernel is the default",
> +                                    NULL);
> +    spapr->kernel_addr =3D KERNEL_LOAD_ADDR;
>      /* The machine class defines the default interrupt controller mode */
>      spapr->irq =3D smc->irq;
>      object_property_add_str(obj, "ic-mode", spapr_get_ic_mode,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gqEssfNGWsEa4HfM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl02g7QACgkQbDjKyiDZ
s5LlwQ/9GRBn6NYe0LgYurg7VW7bbyTqbzeB0swXTxwkm56+19Q8hIHI0s81IrRO
jDCl5pWWhqMx8qYAR4E9ay9Qvqd2ShFN5J4IpAT/n6HQiMi5MI274vyZMkc98Ooa
OaxfLhmOsoQGK74/ZPVQb+dc5PabTMF6WoznIiaN4aZfYMmoladmnzeh+4L/mpNK
Qb8rZrDFjVQrhEq2cAx/UnMb5ES4qWvyn7zb/ptCgTMtyd0wv4lvJXA+vcwsBUXh
uBmsLN3lxIoPtRQFodoGCOxXHpoYB6T3ivPFL91iH7jQKABlHNQ/gistYbunYI/t
nTwpvqG2SGmiRLkgdlP7xrB+1HIFq4YNaKyG8QMia0ZB8u5PZsDfUoKwP9lDt6x9
0/WTQbFfFKxEF3+jSa/Y5NvEcEvy6mECOx6VRlqip6RUdPBFV88Z2bj+WwiCxpXw
+ceInQvHHhZTmQsAMCVVGQ8qUo5/lQMu+APPBz0sQl9xmmmstftySTITzr1ial8u
LxvVbZJwaNsKc3YGpi10lM7Le4OD2phpxIZaAZLT+uQcrmGx1jxSIjgEeVcJW/5D
2DJ1xaP1lY8evnxID4vG2wzl1TMvyFeo1D0duGZfJJsF7H1pEt9+4f3BcvXAl7RY
QlZtp+X7g/3K1pOO18oDqHQTC+aMS6kShCid3mcSSpD3AoqiGa4=
=qauR
-----END PGP SIGNATURE-----

--gqEssfNGWsEa4HfM--

