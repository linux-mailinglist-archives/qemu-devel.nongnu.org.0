Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A546FE34
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 12:58:10 +0200 (CEST)
Received: from localhost ([::1]:60432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpW1B-00056n-Nz
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 06:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40815)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hpW0A-0001XG-2x
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 06:57:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hpW08-0007Tq-Gk
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 06:57:06 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:59343 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hpW06-0007Mz-AP; Mon, 22 Jul 2019 06:57:04 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45sdpg1MMKz9sBZ; Mon, 22 Jul 2019 20:56:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1563793019;
 bh=YnT6kZYVKoju4v2vVypECkcybytJss/RXOwKpjgfGrQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yv7KLz3KAO47S2biYxQ54CkuZhfd6AyRzPTA7cA9JGrr+m693mUZeRu9GH9QEsork
 ohOq2EY+ial4PmqC+0cMoy19mjlGieCA/M0CdhkhsvJ7dEhtIzEGSNc9RwU91IbgAQ
 P+IFyVWm1LmtNK8W/nHTQLYiseSPeHmpeWPDORNM=
Date: Mon, 22 Jul 2019 18:39:10 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Message-ID: <20190722083910.GF25073@umbus.fritz.box>
References: <20190722061752.22114-1-npiggin@gmail.com>
 <20190722061752.22114-2-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="O98KdSgI27dgYlM5"
Content-Disposition: inline
In-Reply-To: <20190722061752.22114-2-npiggin@gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-devel] [PATCH v2 3/3] spapr: Implement ibm,suspend-me
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
Cc: "Liu, Jinsong" <jinsong.liu@intel.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Luiz Capitulino <lcapitulino@redhat.com>,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--O98KdSgI27dgYlM5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2019 at 04:17:52PM +1000, Nicholas Piggin wrote:
> This has been useful to modify and test the Linux pseries suspend
> code but it requires modification to the guest to call it (due to
> being gated by other unimplemented features). It is not otherwise
> used by Linux yet, but work is slowly progressing there.
>=20
> This allows a (lightly modified) guest kernel to suspend with
> `echo mem > /sys/power/state` and be resumed with system_wakeup
> monitor command.
>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr.c         |  7 +++++++
>  hw/ppc/spapr_rtas.c    | 32 ++++++++++++++++++++++++++++++++
>  include/hw/ppc/spapr.h |  3 ++-
>  3 files changed, 41 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 00f7735a31..a580466d01 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3078,6 +3078,13 @@ static void spapr_machine_init(MachineState *machi=
ne)
> =20
>      qemu_register_boot_set(spapr_boot_set, spapr);
> =20
> +    /*
> +     * Nothing needs to be done to resume a suspended guest because
> +     * suspending does not change the machine state, so no need for
> +     * a ->wakeup method.
> +     */
> +    qemu_register_wakeup_support();
> +
>      if (kvm_enabled()) {
>          /* to stop and start vmclock */
>          qemu_add_vm_change_state_handler(cpu_ppc_clock_vm_state_change,
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index a618a2ac0f..87175c1e0a 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -216,6 +216,36 @@ static void rtas_stop_self(PowerPCCPU *cpu, SpaprMac=
hineState *spapr,
>      qemu_cpu_kick(cs);
>  }
> =20
> +static void rtas_ibm_suspend_me(PowerPCCPU *cpu, SpaprMachineState *spap=
r,
> +                           uint32_t token, uint32_t nargs,
> +                           target_ulong args,
> +                           uint32_t nret, target_ulong rets)
> +{
> +    CPUState *cs;
> +
> +    if (nargs !=3D 0 || nret !=3D 1) {
> +        rtas_st(rets, 0, RTAS_OUT_PARAM_ERROR);
> +        return;
> +    }
> +
> +    CPU_FOREACH(cs) {
> +        PowerPCCPU *c =3D POWERPC_CPU(cs);
> +        CPUPPCState *e =3D &c->env;
> +        if (c =3D=3D cpu) {
> +            continue;
> +        }
> +
> +        /* See h_join */
> +        if (!cs->halted || (e->msr & (1ULL << MSR_EE))) {
> +            rtas_st(rets, 0, H_MULTI_THREADS_ACTIVE);
> +            return;
> +        }
> +    }
> +
> +    qemu_system_suspend_request();
> +    rtas_st(rets, 0, RTAS_OUT_SUCCESS);
> +}
> +
>  static inline int sysparm_st(target_ulong addr, target_ulong len,
>                               const void *val, uint16_t vallen)
>  {
> @@ -483,6 +513,8 @@ static void core_rtas_register_types(void)
>                          rtas_query_cpu_stopped_state);
>      spapr_rtas_register(RTAS_START_CPU, "start-cpu", rtas_start_cpu);
>      spapr_rtas_register(RTAS_STOP_SELF, "stop-self", rtas_stop_self);
> +    spapr_rtas_register(RTAS_IBM_SUSPEND_ME, "ibm,suspend-me",
> +                        rtas_ibm_suspend_me);
>      spapr_rtas_register(RTAS_IBM_GET_SYSTEM_PARAMETER,
>                          "ibm,get-system-parameter",
>                          rtas_ibm_get_system_parameter);
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 5d36eec9d0..6e8e18b077 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -631,8 +631,9 @@ target_ulong spapr_hypercall(PowerPCCPU *cpu, target_=
ulong opcode,
>  #define RTAS_IBM_CREATE_PE_DMA_WINDOW           (RTAS_TOKEN_BASE + 0x27)
>  #define RTAS_IBM_REMOVE_PE_DMA_WINDOW           (RTAS_TOKEN_BASE + 0x28)
>  #define RTAS_IBM_RESET_PE_DMA_WINDOW            (RTAS_TOKEN_BASE + 0x29)
> +#define RTAS_IBM_SUSPEND_ME                     (RTAS_TOKEN_BASE + 0x2A)
> =20
> -#define RTAS_TOKEN_MAX                          (RTAS_TOKEN_BASE + 0x2A)
> +#define RTAS_TOKEN_MAX                          (RTAS_TOKEN_BASE + 0x2B)
> =20
>  /* RTAS ibm,get-system-parameter token values */
>  #define RTAS_SYSPARM_SPLPAR_CHARACTERISTICS      20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--O98KdSgI27dgYlM5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl01di4ACgkQbDjKyiDZ
s5L0Ig//YwChtbh4v7H74t8F+Oa5oehLfqGb+vx8bCG6fgxZmVridx4tdhbf0JEM
OFXjzz+WaLeS/TaevcdeGLgUf21E7uqM76YhqfPObPBWgoKXqyo6kTxOzDeVAdU9
h2iyiV/rJ30fpIECydchXI9k/A7kgEkSF92I9jdcnDNOpZLxT2L04jvltqnkRHNb
6tA93yOAEvthZg/VlN/a4r1TdOPu1TQx65XSCx54pVn2sxoCcLyTJiaXUa1vx6wG
5oKR12kDqBJVFz9g2jeMnMcpezYvmGWYzjUFLS4lu4Si29v5aXpGxeR4LEK58NAs
GYMqzEw7YphCG6mGypaa+3Mk3I1YKxFxXL1wFkq28HeYF0HmC6zmgEGSLrXLgfYt
bsjyTNUhxFZkLj8SX7yA2YqvomFrBAnSENdu0dYY4DG7AG3Wn6L1g4YyRo48aOuS
wQ3eY+u6cToouNfw+O+L1w76OoA84GAgCeSe8ihR47TuzoBOII1QGdoSrIC3ueY+
IBPX9kdKHQPQMpexnxsSl3QZAswYKK4RRfQhAVtoGrQL8uDvvl3D/a8SluGnVtwx
BOinAvehIhcSA6nKWJ3zeguyQNOwNW6GiDS4jhB7+5ohNmRy7oDlLQyP1HdDOTKO
ngeNGb//vxymbTY5cV2JpWvSvVO+se73eo5rDvXoiH+06aPsbPA=
=etdV
-----END PGP SIGNATURE-----

--O98KdSgI27dgYlM5--

