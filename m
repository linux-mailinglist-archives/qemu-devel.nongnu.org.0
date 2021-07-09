Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C90E93C1CF9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 03:12:53 +0200 (CEST)
Received: from localhost ([::1]:57308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1f4W-0004xC-Q9
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 21:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1eyz-0006pq-00; Thu, 08 Jul 2021 21:07:09 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:40683 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1eys-0003Cx-ED; Thu, 08 Jul 2021 21:07:08 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLZkT3yvqz9sXV; Fri,  9 Jul 2021 11:06:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625792817;
 bh=8Sm1vKe4CzqOc9Dt7bTjMOSkvdEB3wQVyzVia0w0suk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QciY2+p/cBAfbMZHjl6w2+0m/ofdqrJmoQkcfU31TrjSmxGTuqv3eFihtSQUav+WI
 Mh4szps/EuGOJPACGbYfQGqEscjtyffu86PqOWtpA8bpoxVcVWmAKKv7McVEPl/Hiw
 IauTueaZvdYfnsTQJhO1K4wbhM6pc/8rIk2PibS0=
Date: Fri, 9 Jul 2021 10:52:33 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v23] spapr: Fix implementation of Open Firmware
 client interface
Message-ID: <YOed0RlOchEZYtff@yekko>
References: <20210708065625.548396-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HTYj/qjIWTNKxOpg"
Content-Disposition: inline
In-Reply-To: <20210708065625.548396-1-aik@ozlabs.ru>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--HTYj/qjIWTNKxOpg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 08, 2021 at 04:56:25PM +1000, Alexey Kardashevskiy wrote:
> This addresses the comments from v22.
>=20
> The functional changes are (the VOF ones need retesting with Pegasos2):
>=20
> (VOF) setprop will start failing if the machine class callback
> did not handle it;
> (VOF) unit addresses are lowered in path_offset();
> (SPAPR) /chosen/bootargs is initialized from kernel_cmdline if
> the client did not change it.
>=20
> Fixes: 5c991e5d4378 ("spapr: Implement Open Firmware client interface")
> Cc: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Applied to ppc-for-6.1, thanks.

> ---
>  include/hw/ppc/spapr.h |   3 +--
>  pc-bios/vof/vof.h      |   2 --
>  hw/ppc/spapr.c         |  10 +---------
>  hw/ppc/spapr_hcall.c   |   5 ++---
>  hw/ppc/spapr_vof.c     |  32 +++++++++++++++++++++++---------
>  hw/ppc/vof.c           |  30 +++++++++++++++++-------------
>  pc-bios/vof/ci.c       |   2 +-
>  pc-bios/vof/libc.c     |  26 --------------------------
>  pc-bios/vof/main.c     |   2 +-
>  MAINTAINERS            |   4 ++--
>  pc-bios/vof.bin        | Bin 3784 -> 3456 bytes
>  11 files changed, 48 insertions(+), 68 deletions(-)
>=20
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index a25e69fe4cf4..779f707fb8b9 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -964,8 +964,7 @@ void spapr_set_all_lpcrs(target_ulong value, target_u=
long mask);
>  hwaddr spapr_get_rtas_addr(void);
>  bool spapr_memory_hot_unplug_supported(SpaprMachineState *spapr);
> =20
> -void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
> -                     target_ulong *stack_ptr, Error **errp);
> +void spapr_vof_reset(SpaprMachineState *spapr, void *fdt, Error **errp);
>  void spapr_vof_quiesce(MachineState *ms);
>  bool spapr_vof_setprop(MachineState *ms, const char *path, const char *p=
ropname,
>                         void *val, int vallen);
> diff --git a/pc-bios/vof/vof.h b/pc-bios/vof/vof.h
> index 2d8958076907..5f12c077f513 100644
> --- a/pc-bios/vof/vof.h
> +++ b/pc-bios/vof/vof.h
> @@ -10,11 +10,9 @@ typedef unsigned short uint16_t;
>  typedef unsigned long uint32_t;
>  typedef unsigned long long uint64_t;
>  #define NULL (0)
> -#define PROM_ERROR (-1u)
>  typedef unsigned long ihandle;
>  typedef unsigned long phandle;
>  typedef int size_t;
> -typedef void client(void);
> =20
>  /* globals */
>  extern void _prom_entry(void); /* OF CI entry point (i.e. this firmware)=
 */
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index e9b6d0f58756..3808d4705304 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1645,15 +1645,7 @@ static void spapr_machine_reset(MachineState *mach=
ine)
> =20
>      fdt =3D spapr_build_fdt(spapr, true, FDT_MAX_SIZE);
>      if (spapr->vof) {
> -        target_ulong stack_ptr =3D 0;
> -
> -        spapr_vof_reset(spapr, fdt, &stack_ptr, &error_fatal);
> -
> -        spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
> -                                  stack_ptr, spapr->initrd_base,
> -                                  spapr->initrd_size);
> -        /* VOF is 32bit BE so enforce MSR here */
> -        first_ppc_cpu->env.msr &=3D ~((1ULL << MSR_SF) | (1ULL << MSR_LE=
));
> +        spapr_vof_reset(spapr, fdt, &error_fatal);
>          /*
>           * Do not pack the FDT as the client may change properties.
>           * VOF client does not expect the FDT so we do not load it to th=
e VM.
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 80ae8eaadd34..0e9a5b2e4053 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1080,7 +1080,7 @@ target_ulong do_client_architecture_support(PowerPC=
CPU *cpu,
>      SpaprOptionVector *ov1_guest, *ov5_guest;
>      bool guest_radix;
>      bool raw_mode_supported =3D false;
> -    bool guest_xive, reset_fdt =3D false;
> +    bool guest_xive;
>      CPUState *cs;
>      void *fdt;
>      uint32_t max_compat =3D spapr->max_compat_pvr;
> @@ -1233,8 +1233,7 @@ target_ulong do_client_architecture_support(PowerPC=
CPU *cpu,
>          spapr_setup_hpt(spapr);
>      }
> =20
> -    reset_fdt =3D spapr->vof !=3D NULL;
> -    fdt =3D spapr_build_fdt(spapr, reset_fdt, fdt_bufsize);
> +    fdt =3D spapr_build_fdt(spapr, spapr->vof !=3D NULL, fdt_bufsize);
>      g_free(spapr->fdt_blob);
>      spapr->fdt_size =3D fdt_totalsize(fdt);
>      spapr->fdt_initial_size =3D spapr->fdt_size;
> diff --git a/hw/ppc/spapr_vof.c b/hw/ppc/spapr_vof.c
> index 1d5bec146c49..951fed0e191d 100644
> --- a/hw/ppc/spapr_vof.c
> +++ b/hw/ppc/spapr_vof.c
> @@ -9,6 +9,7 @@
>  #include "qapi/error.h"
>  #include "hw/ppc/spapr.h"
>  #include "hw/ppc/spapr_vio.h"
> +#include "hw/ppc/spapr_cpu_core.h"
>  #include "hw/ppc/fdt.h"
>  #include "hw/ppc/vof.h"
>  #include "sysemu/sysemu.h"
> @@ -30,13 +31,19 @@ target_ulong spapr_h_vof_client(PowerPCCPU *cpu, Spap=
rMachineState *spapr,
>  void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt)
>  {
>      char *stdout_path =3D spapr_vio_stdout_path(spapr->vio_bus);
> -    int chosen;
> =20
>      vof_build_dt(fdt, spapr->vof);
> =20
> -    _FDT(chosen =3D fdt_path_offset(fdt, "/chosen"));
> -    _FDT(fdt_setprop_string(fdt, chosen, "bootargs",
> -                            spapr->vof->bootargs ? : ""));
> +    if (spapr->vof->bootargs) {
> +        int chosen;
> +
> +        _FDT(chosen =3D fdt_path_offset(fdt, "/chosen"));
> +        /*
> +         * If the client did not change "bootargs", spapr_dt_chosen() mu=
st have
> +         * stored machine->kernel_cmdline in it before getting here.
> +         */
> +        _FDT(fdt_setprop_string(fdt, chosen, "bootargs", spapr->vof->boo=
targs));
> +    }
> =20
>      /*
>       * SLOF-less setup requires an open instance of stdout for early
> @@ -49,20 +56,21 @@ void spapr_vof_client_dt_finalize(SpaprMachineState *=
spapr, void *fdt)
>      }
>  }
> =20
> -void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
> -                     target_ulong *stack_ptr, Error **errp)
> +void spapr_vof_reset(SpaprMachineState *spapr, void *fdt, Error **errp)
>  {
> +    target_ulong stack_ptr;
>      Vof *vof =3D spapr->vof;
> +    PowerPCCPU *first_ppc_cpu =3D POWERPC_CPU(first_cpu);
> =20
>      vof_init(vof, spapr->rma_size, errp);
> =20
> -    *stack_ptr =3D vof_claim(vof, 0, VOF_STACK_SIZE, VOF_STACK_SIZE);
> -    if (*stack_ptr =3D=3D -1) {
> +    stack_ptr =3D vof_claim(vof, 0, VOF_STACK_SIZE, VOF_STACK_SIZE);
> +    if (stack_ptr =3D=3D -1) {
>          error_setg(errp, "Memory allocation for stack failed");
>          return;
>      }
>      /* Stack grows downwards plus reserve space for the minimum stack fr=
ame */
> -    *stack_ptr +=3D VOF_STACK_SIZE - 0x20;
> +    stack_ptr +=3D VOF_STACK_SIZE - 0x20;
> =20
>      if (spapr->kernel_size &&
>          vof_claim(vof, spapr->kernel_addr, spapr->kernel_size, 0) =3D=3D=
 -1) {
> @@ -78,6 +86,12 @@ void spapr_vof_reset(SpaprMachineState *spapr, void *f=
dt,
> =20
>      spapr_vof_client_dt_finalize(spapr, fdt);
> =20
> +    spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
> +                              stack_ptr, spapr->initrd_base,
> +                              spapr->initrd_size);
> +    /* VOF is 32bit BE so enforce MSR here */
> +    first_ppc_cpu->env.msr &=3D ~((1ULL << MSR_SF) | (1ULL << MSR_LE));
> +
>      /*
>       * At this point the expected allocation map is:
>       *
> diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
> index a17fd9d2fe94..8d307cd048ba 100644
> --- a/hw/ppc/vof.c
> +++ b/hw/ppc/vof.c
> @@ -144,15 +144,16 @@ static int path_offset(const void *fdt, const char =
*path)
>       * the lower case forms of the hexadecimal digits in the range a..f,
>       * suppressing leading zeros".
>       */
> -    at =3D strchr(path, '@');
> -    if (!at) {
> -        return fdt_path_offset(fdt, path);
> -    }
> -
>      p =3D g_strdup(path);
> -    for (at =3D at - path + p + 1; *at; ++at) {
> -        *at =3D tolower(*at);
> +    for (at =3D strchr(p, '@'); at && *at; ) {
> +            if (*at =3D=3D '/') {
> +                at =3D strchr(at, '@');
> +            } else {
> +                *at =3D tolower(*at);
> +                ++at;
> +            }
>      }
> +
>      return fdt_path_offset(fdt, p);
>  }
> =20
> @@ -300,6 +301,7 @@ static uint32_t vof_setprop(MachineState *ms, void *f=
dt, Vof *vof,
>      char trval[64] =3D "";
>      char nodepath[VOF_MAX_PATH] =3D "";
>      Object *vmo =3D object_dynamic_cast(OBJECT(ms), TYPE_VOF_MACHINE_IF);
> +    VofMachineIfClass *vmc;
>      g_autofree char *val =3D NULL;
> =20
>      if (vallen > VOF_MAX_SETPROPLEN) {
> @@ -322,13 +324,13 @@ static uint32_t vof_setprop(MachineState *ms, void =
*fdt, Vof *vof,
>          goto trace_exit;
>      }
> =20
> -    if (vmo) {
> -        VofMachineIfClass *vmc =3D VOF_MACHINE_GET_CLASS(vmo);
> +    if (!vmo) {
> +        goto trace_exit;
> +    }
> =20
> -        if (vmc->setprop &&
> -            !vmc->setprop(ms, nodepath, propname, val, vallen)) {
> -            goto trace_exit;
> -        }
> +    vmc =3D VOF_MACHINE_GET_CLASS(vmo);
> +    if (!vmc->setprop || !vmc->setprop(ms, nodepath, propname, val, vall=
en)) {
> +        goto trace_exit;
>      }
> =20
>      ret =3D fdt_setprop(fdt, offset, propname, val, vallen);
> @@ -919,6 +921,8 @@ static uint32_t vof_client_handle(MachineState *ms, v=
oid *fdt, Vof *vof,
>          ret =3D -1;
>      }
> =20
> +#undef cmpserv
> +
>      return ret;
>  }
> =20
> diff --git a/pc-bios/vof/ci.c b/pc-bios/vof/ci.c
> index 2b56050238a3..fc4821b3e970 100644
> --- a/pc-bios/vof/ci.c
> +++ b/pc-bios/vof/ci.c
> @@ -69,7 +69,7 @@ static int call_ci(const char *service, int nargs, int =
nret, ...)
>      }
> =20
>      if (ci_entry((uint32_t)(&args)) < 0) {
> -        return PROM_ERROR;
> +        return -1;
>      }
> =20
>      return (nret > 0) ? args.args[nargs] : 0;
> diff --git a/pc-bios/vof/libc.c b/pc-bios/vof/libc.c
> index 00c10e6e7da1..fdbc30f777d4 100644
> --- a/pc-bios/vof/libc.c
> +++ b/pc-bios/vof/libc.c
> @@ -54,32 +54,6 @@ int memcmp(const void *ptr1, const void *ptr2, size_t =
n)
>      return 0;
>  }
> =20
> -void *memmove(void *dest, const void *src, size_t n)
> -{
> -    char *cdest;
> -    const char *csrc;
> -    int i;
> -
> -    /* Do the buffers overlap in a bad way? */
> -    if (src < dest && src + n >=3D dest) {
> -        /* Copy from end to start */
> -        cdest =3D dest + n - 1;
> -        csrc =3D src + n - 1;
> -        for (i =3D 0; i < n; i++) {
> -            *cdest-- =3D *csrc--;
> -        }
> -    } else {
> -        /* Normal copy is possible */
> -        cdest =3D dest;
> -        csrc =3D src;
> -        for (i =3D 0; i < n; i++) {
> -            *cdest++ =3D *csrc++;
> -        }
> -    }
> -
> -    return dest;
> -}
> -
>  void *memset(void *dest, int c, size_t size)
>  {
>      unsigned char *d =3D (unsigned char *)dest;
> diff --git a/pc-bios/vof/main.c b/pc-bios/vof/main.c
> index 9fc30d2d0957..0f0f6b4cb194 100644
> --- a/pc-bios/vof/main.c
> +++ b/pc-bios/vof/main.c
> @@ -6,7 +6,7 @@ void do_boot(unsigned long addr, unsigned long _r3, unsig=
ned long _r4)
>      register unsigned long r4 __asm__("r4") =3D _r4;
>      register unsigned long r5 __asm__("r5") =3D (unsigned long) _prom_en=
try;
> =20
> -    ((client *)(uint32_t)addr)();
> +    ((void (*)(void))(uint32_t)addr)();
>  }
> =20
>  void entry_c(void)
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ce122eeced16..89d71b42b24f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1362,8 +1362,8 @@ F: include/hw/pci-host/mv64361.h
> =20
>  Virtual Open Firmware (VOF)
>  M: Alexey Kardashevskiy <aik@ozlabs.ru>
> -M: David Gibson <david@gibson.dropbear.id.au>
> -M: Greg Kurz <groug@kaod.org>
> +R: David Gibson <david@gibson.dropbear.id.au>
> +R: Greg Kurz <groug@kaod.org>
>  L: qemu-ppc@nongnu.org
>  S: Maintained
>  F: hw/ppc/spapr_vof*
> diff --git a/pc-bios/vof.bin b/pc-bios/vof.bin
> index 1ec670be82134adcb5ae128732aff6e371281360..300cb7c7f9d9d77ffa7cbb7f0=
f26919246ef2d14 100755
> GIT binary patch
> delta 151
> zcmX>h+aSGxjghy9!GnR}jEw^WLxNM!WMRf~rtUM7dl>VWx??8)VQgaRda${HDTtA&
> zvuE-Z<}9X8h0P8uhZvdKV<xk(#WA)0nViCw#?&@t@)@=3D|rZ$VsKI~hWCdYEJZ`R>H
> uz%*HauS<{T1Oo%l10a6Gz`)A@#2gF^j0r&O17wQ;u?!Gv0I>lOTL1tL)F-q6
>=20
> delta 369
> zcmZpWJ|Vk-jghyH!GnR}jEw^WLxNM^WMRf~re2ZBJ&buwJxeD4VQgaR(b(L;6vW8X
> zb!GAu<}9YJjLi-#hZvbUmP}@0i(~3=3DnViCw#?*di@)@=3D|ruK%-KI~hW>f;$?8toY*
> zYPdWc92yuV0NDzSK(SgaFA*RO7I$o9r~rvuYX1KZ5(CLiv}fQz5(BFTit$(~FfagV
> z0iZ(-fNFUxwf_GHi38PgSaJf{@(diEUJMK~JsB8)VgeSHnhcB}4M4>LAOnF8VQ_5t
> ze*$Pg43IAYlml5L12P2J@X0?olqCgl>7J~^X|b7u>j2Y40hP%oc)IlX1Q;0jG=3DSIy
> dh=3DFGF1u!r$CIGPykR1cWDL`BR#1%l?005cvU&jCd
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--HTYj/qjIWTNKxOpg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDnndEACgkQbDjKyiDZ
s5LMxhAAxQdZ51CL/jYSg8RZn3mMpJLJR2fIgzN/VmplLWa8cVamNVFQsu3w3OiD
oLjOVpxj9xF/3PPFTbb+ufFEDpd/0DAnvV5m10zl+n4LcujALyOcjtONwbSC45LF
W/TnJSqUucrqcn7BDkDg1HOJYZNsvUfXmNZ292+ehM++rqSs/UH3iF8/EX9aHrJ0
/OZsvaZ4IghqCsOUZEpCX3gW7mKSnqbkHIBytjccAZlMQO/+L7VrmmRRZi3afrWG
TO1z+lcTGhL5xTeZoSJWhQRqt5BZSfNi7MGz7MCocKQGXsvP9TzI0esKaKcBtxfV
vNMqZnwxrJpzVlvQpyBkFGXDmznS3qa2FT/8Qe8a1r7/zn9iU1GX4HvToxpXJ7QB
znjjppQFGoly1mmUKy5fO7iMce5r8KpvvhxQVGjmmpXM9wA0ZnhHrX9r0cYEplU5
AsNdn3ODevTVgEalu9tRVcRzfjMg0wEq6VfZYzxQ0pkBX19slVs5S/e1sg9ospZE
8V/ldmSdOoIfPhJG66ihVMjWztcoUUDkUUeKmk4O3T7iyB8BDVZXjzyxQTMo7TjN
T69fNZcS7sjqtSSr++IkVprBHSwOJBMlb0zRJoA+oDic7jlJXX3N9BZOspTrFFlK
DY/yrWc+uMXkCUYSg5N/TwbW2TFgyjI/h2SCy992cwN8Z1rxghk=
=QdRk
-----END PGP SIGNATURE-----

--HTYj/qjIWTNKxOpg--

