Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 740CA3C1CE0
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 02:46:06 +0200 (CEST)
Received: from localhost ([::1]:45310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1eea-0001Ul-VL
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 20:46:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1ead-0000YR-7T; Thu, 08 Jul 2021 20:41:59 -0400
Received: from ozlabs.org ([203.11.71.1]:42391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1eaZ-0003ph-Ay; Thu, 08 Jul 2021 20:41:58 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLZ9T74Krz9sXV; Fri,  9 Jul 2021 10:41:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625791310;
 bh=RXxNglvr4cJDokDW+HNIwFO3QL/rfnB4hUaCv7fnoZE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SDfPEqn5R6K0tC2yVfdbHlaE2IN14B7cnYVZCa0hfhpbkBqUEmxXIjbd8BslkiI8Y
 fti+9bzkPfIPizCb+UuygshPsvlaaWeAO6ocWtB32jXwu5pr7yEHn9hfSRzfqe+pTJ
 cUW2JMBZn8zyjmRMjduKofOORjO51XJJ4KFkcPww=
Date: Fri, 9 Jul 2021 10:40:55 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v2 4/4] ppc/pegasos2: Implement some RTAS functions with
 VOF
Message-ID: <YOebF0kviteqGQ5G@yekko>
References: <20210708215113.B3F747456E3@zero.eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JeWZ4/w4ofeWuV24"
Content-Disposition: inline
In-Reply-To: <20210708215113.B3F747456E3@zero.eik.bme.hu>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--JeWZ4/w4ofeWuV24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 08, 2021 at 11:46:14PM +0200, BALATON Zoltan wrote:
> Linux uses RTAS functions to access PCI devices so we need to provide
> these with VOF. Implement some of the most important functions to
> allow booting Linux with VOF. With this the board is now usable
> without a binary ROM image and we can enable it by default as other
> boards.
>=20
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
> v2: Use named values for /rtas functions, only sending v2 for this,
>     others are unchanged

Merged, replacing v1, thanks.

>=20
>  default-configs/devices/ppc-softmmu.mak |   2 +-
>  hw/ppc/pegasos2.c                       | 137 ++++++++++++++++++++++++
>  2 files changed, 138 insertions(+), 1 deletion(-)
>=20
> diff --git a/default-configs/devices/ppc-softmmu.mak b/default-configs/de=
vices/ppc-softmmu.mak
> index c2d41198cd..4535993d8d 100644
> --- a/default-configs/devices/ppc-softmmu.mak
> +++ b/default-configs/devices/ppc-softmmu.mak
> @@ -14,7 +14,7 @@ CONFIG_SAM460EX=3Dy
>  CONFIG_MAC_OLDWORLD=3Dy
>  CONFIG_MAC_NEWWORLD=3Dy
> =20
> -CONFIG_PEGASOS2=3Dn
> +CONFIG_PEGASOS2=3Dy
> =20
>  # For PReP
>  CONFIG_PREP=3Dy
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index f1741a4512..5c4e2ae8bf 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -43,6 +43,7 @@
>  #define PROM_SIZE     0x80000
> =20
>  #define KVMPPC_HCALL_BASE    0xf000
> +#define KVMPPC_H_RTAS        (KVMPPC_HCALL_BASE + 0x0)
>  #define KVMPPC_H_VOF_CLIENT  (KVMPPC_HCALL_BASE + 0x5)
> =20
>  #define H_SUCCESS     0
> @@ -195,6 +196,30 @@ static void pegasos2_init(MachineState *machine)
>      }
>  }
> =20
> +static uint32_t pegasos2_pci_config_read(AddressSpace *as, int bus,
> +                                         uint32_t addr, uint32_t len)
> +{
> +    hwaddr pcicfg =3D (bus ? 0xf1000c78 : 0xf1000cf8);
> +    uint32_t val =3D 0xffffffff;
> +
> +    stl_le_phys(as, pcicfg, addr | BIT(31));
> +    switch (len) {
> +    case 4:
> +        val =3D ldl_le_phys(as, pcicfg + 4);
> +        break;
> +    case 2:
> +        val =3D lduw_le_phys(as, pcicfg + 4);
> +        break;
> +    case 1:
> +        val =3D ldub_phys(as, pcicfg + 4);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid length\n", __func__);
> +        break;
> +    }
> +    return val;
> +}
> +
>  static void pegasos2_pci_config_write(AddressSpace *as, int bus, uint32_=
t addr,
>                                        uint32_t len, uint32_t val)
>  {
> @@ -304,6 +329,87 @@ static void pegasos2_machine_reset(MachineState *mac=
hine)
>      pm->cpu->vhyp =3D PPC_VIRTUAL_HYPERVISOR(machine);
>  }
> =20
> +enum pegasos2_rtas_tokens {
> +    RTAS_RESTART_RTAS =3D 0,
> +    RTAS_NVRAM_FETCH =3D 1,
> +    RTAS_NVRAM_STORE =3D 2,
> +    RTAS_GET_TIME_OF_DAY =3D 3,
> +    RTAS_SET_TIME_OF_DAY =3D 4,
> +    RTAS_EVENT_SCAN =3D 6,
> +    RTAS_CHECK_EXCEPTION =3D 7,
> +    RTAS_READ_PCI_CONFIG =3D 8,
> +    RTAS_WRITE_PCI_CONFIG =3D 9,
> +    RTAS_DISPLAY_CHARACTER =3D 10,
> +    RTAS_SET_INDICATOR =3D 11,
> +    RTAS_POWER_OFF =3D 17,
> +    RTAS_SUSPEND =3D 18,
> +    RTAS_HIBERNATE =3D 19,
> +    RTAS_SYSTEM_REBOOT =3D 20,
> +};
> +
> +static target_ulong pegasos2_rtas(PowerPCCPU *cpu, Pegasos2MachineState =
*pm,
> +                                  target_ulong args_real)
> +{
> +    AddressSpace *as =3D CPU(cpu)->as;
> +    uint32_t token =3D ldl_be_phys(as, args_real);
> +    uint32_t nargs =3D ldl_be_phys(as, args_real + 4);
> +    uint32_t nrets =3D ldl_be_phys(as, args_real + 8);
> +    uint32_t args =3D args_real + 12;
> +    uint32_t rets =3D args_real + 12 + nargs * 4;
> +
> +    if (nrets < 1) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "Too few return values in RTAS ca=
ll\n");
> +        return H_PARAMETER;
> +    }
> +    switch (token) {
> +    case RTAS_READ_PCI_CONFIG:
> +    {
> +        uint32_t addr, len, val;
> +
> +        if (nargs !=3D 2 || nrets !=3D 2) {
> +            stl_be_phys(as, rets, -1);
> +            return H_PARAMETER;
> +        }
> +        addr =3D ldl_be_phys(as, args);
> +        len =3D ldl_be_phys(as, args + 4);
> +        val =3D pegasos2_pci_config_read(as, !(addr >> 24),
> +                                       addr & 0x0fffffff, len);
> +        stl_be_phys(as, rets, 0);
> +        stl_be_phys(as, rets + 4, val);
> +        return H_SUCCESS;
> +    }
> +    case RTAS_WRITE_PCI_CONFIG:
> +    {
> +        uint32_t addr, len, val;
> +
> +        if (nargs !=3D 3 || nrets !=3D 1) {
> +            stl_be_phys(as, rets, -1);
> +            return H_PARAMETER;
> +        }
> +        addr =3D ldl_be_phys(as, args);
> +        len =3D ldl_be_phys(as, args + 4);
> +        val =3D ldl_be_phys(as, args + 8);
> +        pegasos2_pci_config_write(as, !(addr >> 24),
> +                                  addr & 0x0fffffff, len, val);
> +        stl_be_phys(as, rets, 0);
> +        return H_SUCCESS;
> +    }
> +    case RTAS_DISPLAY_CHARACTER:
> +        if (nargs !=3D 1 || nrets !=3D 1) {
> +            stl_be_phys(as, rets, -1);
> +            return H_PARAMETER;
> +        }
> +        qemu_log_mask(LOG_UNIMP, "%c", ldl_be_phys(as, args));
> +        stl_be_phys(as, rets, 0);
> +        return H_SUCCESS;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "Unknown RTAS token %u (args=3D%u, rets=
=3D%u)\n",
> +                      token, nargs, nrets);
> +        stl_be_phys(as, rets, 0);
> +        return H_SUCCESS;
> +    }
> +}
> +
>  static void pegasos2_hypercall(PPCVirtualHypervisor *vhyp, PowerPCCPU *c=
pu)
>  {
>      Pegasos2MachineState *pm =3D PEGASOS2_MACHINE(vhyp);
> @@ -315,6 +421,8 @@ static void pegasos2_hypercall(PPCVirtualHypervisor *=
vhyp, PowerPCCPU *cpu)
>      if (msr_pr) {
>          qemu_log_mask(LOG_GUEST_ERROR, "Hypercall made with MSR[PR]=3D1\=
n");
>          env->gpr[3] =3D H_PRIVILEGE;
> +    } else if (env->gpr[3] =3D=3D KVMPPC_H_RTAS) {
> +        env->gpr[3] =3D pegasos2_rtas(cpu, pm, env->gpr[4]);
>      } else if (env->gpr[3] =3D=3D KVMPPC_H_VOF_CLIENT) {
>          int ret =3D vof_client_call(MACHINE(pm), pm->vof, pm->fdt_blob,
>                                    env->gpr[4]);
> @@ -687,6 +795,35 @@ static void *build_fdt(MachineState *machine, int *f=
dt_size)
>      qemu_fdt_setprop_string(fdt, "/failsafe", "device_type", "serial");
>      qemu_fdt_setprop_string(fdt, "/failsafe", "name", "failsafe");
> =20
> +    qemu_fdt_add_subnode(fdt, "/rtas");
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "system-reboot", RTAS_SYSTEM_REB=
OOT);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "hibernate", RTAS_HIBERNATE);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "suspend", RTAS_SUSPEND);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "power-off", RTAS_POWER_OFF);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "set-indicator", RTAS_SET_INDICA=
TOR);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "display-character",
> +                          RTAS_DISPLAY_CHARACTER);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "write-pci-config",
> +                          RTAS_WRITE_PCI_CONFIG);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "read-pci-config",
> +                          RTAS_READ_PCI_CONFIG);
> +    /* Pegasos2 firmware misspells check-exception and guests use that */
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "check-execption",
> +                          RTAS_CHECK_EXCEPTION);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "event-scan", RTAS_EVENT_SCAN);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "set-time-of-day",
> +                          RTAS_SET_TIME_OF_DAY);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "get-time-of-day",
> +                          RTAS_GET_TIME_OF_DAY);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "nvram-store", RTAS_NVRAM_STORE);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "nvram-fetch", RTAS_NVRAM_FETCH);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "restart-rtas", RTAS_RESTART_RTA=
S);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "rtas-error-log-max", 0);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "rtas-event-scan-rate", 0);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "rtas-display-device", 0);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "rtas-size", 20);
> +    qemu_fdt_setprop_cell(fdt, "/rtas", "rtas-version", 1);
> +
>      /* cpus */
>      qemu_fdt_add_subnode(fdt, "/cpus");
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#cpus", 1);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JeWZ4/w4ofeWuV24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDnmxUACgkQbDjKyiDZ
s5JTbw//aXY1IpDwosBscuoCiHzr0Yo/8eiFBoUtgYMLd+TzPqORKgy1PR7PEz+N
b16J1KexKNWTk2qHVTC8WBqH4IxduWlNAI50UpO9nAuzmYqrLkR/Iibih140fh6Y
etbYeqXkWIEC/49JR0jiX4YcCuViU6jA9Q9ATW2XjHbl4xHjTGK6Z3A7tPCpONZm
FhE0tdDTUlOmRMkA1M2HAbJIJFx3yxXpF3BkAIHs9Y3O8bM6TT08E6rjHrc4BgVq
vBmezg5dPmVmOYxenECzoHMDe9ZA/Nrv/dvob6HgZNd0VA9g8qbHvgCSNaKt29LA
+AnRAzFtrdMY+d4Xou7zoPNpH6Yq0I3SFUIuduv67zdv5Jz4GGEWLROUIGKrXKgo
r8353/T4oGgVoXaKdqQnu9HL8SHkLvf7sG5AKIFLPV5wQkhn3rcUc/MUSSfR3CMi
gjARh5dHQMxqwUmYqlyReeCQKdozVw8iC1MfpwZbwIwmu3mV5salMfYDMXoQtnaJ
nycGHfW2DuHEB0X9dBLbkWPcOtXbeREju4OlXReaNjrVmvs8fj0mC69ZAXAlQFug
NWyQNWX8lNEdtUQ6nZxrR5a1ograWQVVSR2mkMoa07+ea+Rl48+NQqYNjbCXW9Sp
O/en/zHgSXp5D/levTj5aLiap3eQZ3G4pV+IA1pm0o8KHUaL3L4=
=cw9H
-----END PGP SIGNATURE-----

--JeWZ4/w4ofeWuV24--

