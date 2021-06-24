Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E24A3B269F
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 06:54:12 +0200 (CEST)
Received: from localhost ([::1]:59358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwHNT-00055k-HQ
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 00:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lwHLr-0002LR-CP; Thu, 24 Jun 2021 00:52:31 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:43065 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lwHLn-0003Q7-Cu; Thu, 24 Jun 2021 00:52:31 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G9SRT1GNGz9sXL; Thu, 24 Jun 2021 14:52:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1624510341;
 bh=eTXlz+ycy89J9DOZzlL3SfEaWuEWVMFl0HFpibNTvyY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qnnkg6GeVFRPwUNAfxzH75Trp2GbQwGEio9BE4U4Eq9lNsdhrskRaKndb8mmuy/gA
 zPtlwZuRTMDg6BGEW1VID1DLfslR/yu0NNWFaoocClBb6u2QantGfWCWItwbQ5wrQh
 SpTtsRKeDs/DbGN4IfXuIVmf+QYVVhv/PfiLZgDc=
Date: Thu, 24 Jun 2021 13:31:10 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v2 04/10] target/ppc: Use bool success for
 ppc_radix64_xlate
Message-ID: <YNP8fsx93ERNXjdQ@yekko>
References: <20210621125115.67717-1-bruno.larsen@eldorado.org.br>
 <20210621125115.67717-5-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lWpAhLNn/jAND+He"
Content-Disposition: inline
In-Reply-To: <20210621125115.67717-5-bruno.larsen@eldorado.org.br>
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
Cc: farosas@linux.ibm.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, clg@kaod.org, matheus.ferst@eldorado.org.br,
 luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--lWpAhLNn/jAND+He
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 21, 2021 at 09:51:09AM -0300, Bruno Larsen (billionai) wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> Instead of returning non-zero for failure, return true for success.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/mmu-radix64.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>=20
> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> index dd5ae69052..2d5f0850c9 100644
> --- a/target/ppc/mmu-radix64.c
> +++ b/target/ppc/mmu-radix64.c
> @@ -463,10 +463,10 @@ static int ppc_radix64_process_scoped_xlate(PowerPC=
CPU *cpu,
>   *              | =3D On        | Process Scoped |    Scoped     |
>   *              +-------------+----------------+---------------+
>   */
> -static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
> -                             MMUAccessType access_type,
> -                             hwaddr *raddr, int *psizep, int *protp,
> -                             bool guest_visible)
> +static bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
> +                              MMUAccessType access_type,
> +                              hwaddr *raddr, int *psizep, int *protp,
> +                              bool guest_visible)
>  {
>      CPUPPCState *env =3D &cpu->env;
>      uint64_t lpid, pid;
> @@ -492,7 +492,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr e=
addr,
>          }
>          *protp =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>          *psizep =3D TARGET_PAGE_BITS;
> -        return 0;
> +        return true;
>      }
> =20
>      /*
> @@ -510,7 +510,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr e=
addr,
>          if (guest_visible) {
>              ppc_radix64_raise_segi(cpu, access_type, eaddr);
>          }
> -        return 1;
> +        return false;
>      }
> =20
>      /* Get Process Table */
> @@ -523,13 +523,13 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr=
 eaddr,
>              if (guest_visible) {
>                  ppc_radix64_raise_si(cpu, access_type, eaddr, DSISR_NOPT=
E);
>              }
> -            return 1;
> +            return false;
>          }
>          if (!validate_pate(cpu, lpid, &pate)) {
>              if (guest_visible) {
>                  ppc_radix64_raise_si(cpu, access_type, eaddr, DSISR_R_BA=
DCONFIG);
>              }
> -            return 1;
> +            return false;
>          }
>      }
> =20
> @@ -549,7 +549,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr e=
addr,
>                                                     pate, &g_raddr, &prot,
>                                                     &psize, guest_visible=
);
>          if (ret) {
> -            return ret;
> +            return false;
>          }
>          *psizep =3D MIN(*psizep, psize);
>          *protp &=3D prot;
> @@ -573,7 +573,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr e=
addr,
>                                                       &prot, &psize, fals=
e,
>                                                       guest_visible);
>              if (ret) {
> -                return ret;
> +                return false;
>              }
>              *psizep =3D MIN(*psizep, psize);
>              *protp &=3D prot;
> @@ -582,7 +582,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr e=
addr,
>          }
>      }
> =20
> -    return 0;
> +    return true;
>  }
> =20
>  int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
> @@ -593,8 +593,8 @@ int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vad=
dr eaddr,
>      hwaddr raddr;
> =20
>      /* Translate eaddr to raddr (where raddr is addr qemu needs for acce=
ss) */
> -    if (ppc_radix64_xlate(cpu, eaddr, access_type, &raddr,
> -                          &page_size, &prot, true)) {
> +    if (!ppc_radix64_xlate(cpu, eaddr, access_type, &raddr,
> +                           &page_size, &prot, true)) {
>          return 1;
>      }
> =20
> @@ -608,8 +608,8 @@ hwaddr ppc_radix64_get_phys_page_debug(PowerPCCPU *cp=
u, target_ulong eaddr)
>      int psize, prot;
>      hwaddr raddr;
> =20
> -    if (ppc_radix64_xlate(cpu, eaddr, MMU_DATA_LOAD, &raddr,
> -                          &psize, &prot, false)) {
> +    if (!ppc_radix64_xlate(cpu, eaddr, MMU_DATA_LOAD, &raddr,
> +                           &psize, &prot, false)) {
>          return -1;
>      }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--lWpAhLNn/jAND+He
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDT/H4ACgkQbDjKyiDZ
s5IzQg/8DbhRYmD0KlddVtFyOx5QarHQXJmoovz84BsBD0N4HMi0UMk8cH23PGy/
51V2H5wjzQqwFaoW060dnkf6HnQajixTkzrTQZE/4YKSdgfWC7swhJTmARvson3D
6BsZUDDGPXSyRq/HumnxPwc76B82woUBEa3CsEbGyrhj93fNHvWy+nMJgpaXYco6
SrOrYpsIkiLLMPSbzqf4NnzxxpO3rBn+qYz2FVkxjtR4JHb9+Ck0TjqHNSTWWU4n
V1X8ZySsGcPE1RAVcNS6+rDiyMRGXe5ihjjIJbJmj0X2ahTaEEbBt9eIxKT+BkPR
0X7lMccsmAd27oVXeCErJb7gcwdJhx0/VUHsvQ0ma3T9Dpy7BMj32AgHE1pAAstC
vy0BpKTgF35vr0OcTD8knfXX1tCGKhmSKqz8jxTAzB5j8bigsUr+XxTw/hdBsBvJ
ks3ruRPaPy4JcuNjaJBkn2OWhMcaCCuTnLmIfYhvx+L/HFgG8DrdCTfjLm21gtLc
prp/oLGvWdwUAQrGn4l6fTjL/A6IpXjeuzctRevGhvLRTD9xPeD7X6by0iW2FqSu
Brf4Iu5jVVQlPd/JKCTWNK8Cxn5gSVps2eZuCauBdsRL7GULLNxFNgvMxps4u581
bZ1h93iYhOVFlmW7Etd60pdkDcJ8jhbMSZu5A7SfJwqLCllEJBQ=
=rAYa
-----END PGP SIGNATURE-----

--lWpAhLNn/jAND+He--

