Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FA847DE50
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 05:36:14 +0100 (CET)
Received: from localhost ([::1]:37516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Fps-00078a-Nk
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 23:36:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n0FmF-0005My-C1; Wed, 22 Dec 2021 23:32:27 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=53197
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n0FmC-0005Pg-5G; Wed, 22 Dec 2021 23:32:26 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4JKHNG2V7dz4xgw; Thu, 23 Dec 2021 15:32:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1640233934;
 bh=7NRePnoN0kQFSY31MJuK6lQ2jVYqfu1KhzpK1Gvx9jY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jhsDFuWF9xA5ATKSQ6ZYIH1Pa5DfTR0TkLaagr+qsLi8uNrXR66ST5HkD5s3qx4Lw
 OPwFYfVfEBImduzdxe6pkMLvTWXZzZoGR2sWDxgt8Fh6L6/kQmS3n/+fiGS114z+CZ
 xxcMp3fVLHLxIyzIaqJaam09lU4oq1aebgG4EIQY=
Date: Thu, 23 Dec 2021 15:26:30 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 2/8] ppc/ppc4xx: Convert printfs()
Message-ID: <YcP6dikn0wlyZWmU@yekko>
References: <20211222064025.1541490-1-clg@kaod.org>
 <20211222064025.1541490-3-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IbUvyuDO/G4CFRZg"
Content-Disposition: inline
In-Reply-To: <20211222064025.1541490-3-clg@kaod.org>
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--IbUvyuDO/G4CFRZg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 22, 2021 at 07:40:19AM +0100, C=E9dric le Goater wrote:
> Use a QEMU log primitive for errors and trace events for debug.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Reviewed-by: David Gibson <david@gibson.drobear.id.au>

> ---
>  hw/ppc/mpc8544_guts.c |  9 ++++++---
>  hw/ppc/ppc4xx_devs.c  | 39 +++++++++++----------------------------
>  hw/ppc/ppc4xx_pci.c   | 11 +++++++----
>  hw/ppc/trace-events   |  5 +++++
>  4 files changed, 29 insertions(+), 35 deletions(-)
>=20
> diff --git a/hw/ppc/mpc8544_guts.c b/hw/ppc/mpc8544_guts.c
> index e8d2d51c20c0..a26e83d0484b 100644
> --- a/hw/ppc/mpc8544_guts.c
> +++ b/hw/ppc/mpc8544_guts.c
> @@ -19,6 +19,7 @@
> =20
>  #include "qemu/osdep.h"
>  #include "qemu/module.h"
> +#include "qemu/log.h"
>  #include "sysemu/runstate.h"
>  #include "cpu.h"
>  #include "hw/sysbus.h"
> @@ -82,7 +83,9 @@ static uint64_t mpc8544_guts_read(void *opaque, hwaddr =
addr,
>          value =3D env->spr[SPR_E500_SVR];
>          break;
>      default:
> -        fprintf(stderr, "guts: Unknown register read: %x\n", (int)addr);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Unknown register 0x%" HWADDR_PRIx "\n",
> +                      __func__, addr);
>          break;
>      }
> =20
> @@ -101,8 +104,8 @@ static void mpc8544_guts_write(void *opaque, hwaddr a=
ddr,
>          }
>          break;
>      default:
> -        fprintf(stderr, "guts: Unknown register write: %x =3D %x\n",
> -                (int)addr, (unsigned)value);
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Unknown register 0x%" HWADDR=
_PRIx
> +                       " =3D 0x%" PRIx64 "\n", __func__, addr, value);
>          break;
>      }
>  }
> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
> index 980c48944fc7..e7d82ae5016c 100644
> --- a/hw/ppc/ppc4xx_devs.c
> +++ b/hw/ppc/ppc4xx_devs.c
> @@ -35,14 +35,7 @@
>  #include "exec/address-spaces.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
> -
> -/*#define DEBUG_UIC*/
> -
> -#ifdef DEBUG_UIC
> -#  define LOG_UIC(...) qemu_log_mask(CPU_LOG_INT, ## __VA_ARGS__)
> -#else
> -#  define LOG_UIC(...) do { } while (0)
> -#endif
> +#include "trace.h"
> =20
>  static void ppc4xx_reset(void *opaque)
>  {
> @@ -137,8 +130,9 @@ static uint32_t sdram_bcr (hwaddr ram_base,
>          bcr =3D 0x000C0000;
>          break;
>      default:
> -        printf("%s: invalid RAM size " TARGET_FMT_plx "\n", __func__,
> -               ram_size);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid RAM size 0x%" HWADDR_PRIx "\n", __fun=
c__,
> +                      ram_size);
>          return 0x00000000;
>      }
>      bcr |=3D ram_base & 0xFF800000;
> @@ -171,10 +165,8 @@ static void sdram_set_bcr(ppc4xx_sdram_t *sdram, int=
 i,
>  {
>      if (sdram->bcr[i] & 0x00000001) {
>          /* Unmap RAM */
> -#ifdef DEBUG_SDRAM
> -        printf("%s: unmap RAM area " TARGET_FMT_plx " " TARGET_FMT_lx "\=
n",
> -               __func__, sdram_base(sdram->bcr[i]), sdram_size(sdram->bc=
r[i]));
> -#endif
> +        trace_ppc4xx_sdram_unmap(sdram_base(sdram->bcr[i]),
> +                                 sdram_size(sdram->bcr[i]));
>          memory_region_del_subregion(get_system_memory(),
>                                      &sdram->containers[i]);
>          memory_region_del_subregion(&sdram->containers[i],
> @@ -183,10 +175,7 @@ static void sdram_set_bcr(ppc4xx_sdram_t *sdram, int=
 i,
>      }
>      sdram->bcr[i] =3D bcr & 0xFFDEE001;
>      if (enabled && (bcr & 0x00000001)) {
> -#ifdef DEBUG_SDRAM
> -        printf("%s: Map RAM area " TARGET_FMT_plx " " TARGET_FMT_lx "\n",
> -               __func__, sdram_base(bcr), sdram_size(bcr));
> -#endif
> +        trace_ppc4xx_sdram_unmap(sdram_base(bcr), sdram_size(bcr));
>          memory_region_init(&sdram->containers[i], NULL, "sdram-container=
s",
>                             sdram_size(bcr));
>          memory_region_add_subregion(&sdram->containers[i], 0,
> @@ -216,10 +205,8 @@ static void sdram_unmap_bcr (ppc4xx_sdram_t *sdram)
>      int i;
> =20
>      for (i =3D 0; i < sdram->nbanks; i++) {
> -#ifdef DEBUG_SDRAM
> -        printf("%s: Unmap RAM area " TARGET_FMT_plx " " TARGET_FMT_lx "\=
n",
> -               __func__, sdram_base(sdram->bcr[i]), sdram_size(sdram->bc=
r[i]));
> -#endif
> +        trace_ppc4xx_sdram_unmap(sdram_base(sdram->bcr[i]),
> +                                 sdram_size(sdram->bcr[i]));
>          memory_region_del_subregion(get_system_memory(),
>                                      &sdram->ram_memories[i]);
>      }
> @@ -316,16 +303,12 @@ static void dcr_write_sdram (void *opaque, int dcrn=
, uint32_t val)
>          case 0x20: /* SDRAM_CFG */
>              val &=3D 0xFFE00000;
>              if (!(sdram->cfg & 0x80000000) && (val & 0x80000000)) {
> -#ifdef DEBUG_SDRAM
> -                printf("%s: enable SDRAM controller\n", __func__);
> -#endif
> +                trace_ppc4xx_sdram_enable("enable");
>                  /* validate all RAM mappings */
>                  sdram_map_bcr(sdram);
>                  sdram->status &=3D ~0x80000000;
>              } else if ((sdram->cfg & 0x80000000) && !(val & 0x80000000))=
 {
> -#ifdef DEBUG_SDRAM
> -                printf("%s: disable SDRAM controller\n", __func__);
> -#endif
> +                trace_ppc4xx_sdram_enable("disable");
>                  /* invalidate all RAM mappings */
>                  sdram_unmap_bcr(sdram);
>                  sdram->status |=3D 0x80000000;
> diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
> index 304a29349c2e..5df97e6d156f 100644
> --- a/hw/ppc/ppc4xx_pci.c
> +++ b/hw/ppc/ppc4xx_pci.c
> @@ -20,6 +20,7 @@
>   * 4xx SoCs, such as the 440EP. */
> =20
>  #include "qemu/osdep.h"
> +#include "qemu/log.h"
>  #include "hw/irq.h"
>  #include "hw/ppc/ppc.h"
>  #include "hw/ppc/ppc4xx.h"
> @@ -152,8 +153,9 @@ static void ppc4xx_pci_reg_write4(void *opaque, hwadd=
r offset,
>          break;
> =20
>      default:
> -        printf("%s: unhandled PCI internal register 0x%lx\n", __func__,
> -               (unsigned long)offset);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                     "%s: unhandled PCI internal register 0x%" HWADDR_PR=
Ix "\n",
> +                     __func__, offset);
>          break;
>      }
>  }
> @@ -218,8 +220,9 @@ static uint64_t ppc4xx_pci_reg_read4(void *opaque, hw=
addr offset,
>          break;
> =20
>      default:
> -        printf("%s: invalid PCI internal register 0x%lx\n", __func__,
> -               (unsigned long)offset);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid PCI internal register 0x%" HWADDR_PRI=
x "\n",
> +                      __func__, offset);
>          value =3D 0;
>      }
> =20
> diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
> index ada644652d94..0c55aa501471 100644
> --- a/hw/ppc/trace-events
> +++ b/hw/ppc/trace-events
> @@ -164,3 +164,8 @@ ppc4xx_gpt_init(uint64_t addr) "offet 0x%" PRIx64
> =20
>  ppc405ep_clocks_compute(const char *param, uint32_t param2, uint32_t val=
) "%s 0x%1" PRIx32 " %d"
>  ppc405ep_clocks_setup(const char *trace) "%s"
> +
> +# ppc4xx_devs.c
> +ppc4xx_sdram_enable(const char *trace) "%s SDRAM controller"
> +ppc4xx_sdram_unmap(uint64_t addr, uint64_t size) "Unmap RAM area 0x%" PR=
Ix64 " size 0x%" PRIx64
> +ppc4xx_sdram_map(uint64_t addr, uint64_t size) "Map RAM area 0x%" PRIx64=
 " size 0x%" PRIx64

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--IbUvyuDO/G4CFRZg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmHD+nYACgkQbDjKyiDZ
s5J7WhAA1WZTuSzH7DnK8ABQu0ureaePFmqXIVoOoWChzTym4WsGFY0WU25EHRDc
OB1+Cw7vyAcdwPmVz/5Dq4CIPAHDeBkuY8WVPy+HIvNxhfv7v6JYB7lKQklSCPY2
5vjbsfnMTW2zahdFoDO2hsaeZcIZSvtmyrzXy2tgTEA/p086CWBo9f3Cw+y0HMUA
Bv0K8IwyOO0uK+Ov/1exZSg7qiJEyagLY5CTd1X4ybUCUt6qmv8YQCXzPqS2BQCJ
9lEVAxKOzJETPCyzLTC5ktdsrFN7/3rRJohtdx+lcmadFjIqlt2duo8Q8koa07xB
yK9c+38n84Iejv20pkM4XsBkOEAtNGQCuxmToDkeNCSD84qTEMpb9MoImEWsLIcS
R77jQnw7lxTlY9DNux22SGZ9fReQHQFnsPg7vY9qK1iGwY65yyhAEEpVkhIq4ERT
bVhFXXIDCJCe/rRFCtQrzEMA2meFaUdZU4FdOdvixfzy7kocLE49/FWqM0E6YlIH
0vM0LFvhpjnFsnuE9Yq0EGvpJ+vRqW2p3qEqKKjTzFbW/Skv3v1ZInaIkVeCthuM
Q2na0d9bqT84fQUqgEObo1xT56BXvY3aLwUoWAa3kzE1YPXsEbTmdxNs7LbRzI2j
UqPf4Snpa+6LiJ+GlTm8ZkA6EZSlf0mXjEtcfMaSvkNBEiA2Y5U=
=Htt4
-----END PGP SIGNATURE-----

--IbUvyuDO/G4CFRZg--

