Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 018F33FF88D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 03:00:34 +0200 (CEST)
Received: from localhost ([::1]:37382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLxZJ-0008In-37
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 21:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mLxVh-0005Hr-1E; Thu, 02 Sep 2021 20:56:49 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:38449 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mLxVc-0006E2-QM; Thu, 02 Sep 2021 20:56:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630630598;
 bh=dYFvOAbI0hzwi7bgHPuL2nISN21A/HVkTWCIarLAldc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DMCqqC7Itikgm2VTUEE5MykJBeTtYQkUaBtP+KuJF/Y5jTcUC2LQWs1ef3S2IMUl3
 RysX7Pwh5G3C+1QXEaTzQ5loyPMlyIRqnn+VJrtw1FLSH+R0ynhlUXGg+rbaiWSc1f
 53PPEtkqp6WkbUnSX5FiujxAAdGniXO0crpUxZ60=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H0zrk2nScz9sX3; Fri,  3 Sep 2021 10:56:38 +1000 (AEST)
Date: Fri, 3 Sep 2021 10:50:45 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 21/30] target/ppc: Introduce PowerPCCPUClass::has_work()
Message-ID: <YTFxZb1Vg5pWVW9p@yekko>
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-22-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iHh9kZyoW/xDyYBn"
Content-Disposition: inline
In-Reply-To: <20210902161543.417092-22-f4bug@amsat.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Marek Vasut <marex@denx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--iHh9kZyoW/xDyYBn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 02, 2021 at 06:15:34PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Each POWER cpu has its own has_work() implementation. Instead of
> overloading CPUClass on each PowerPCCPUClass init, register the
> generic ppc_cpu_has_work() handler, and have it call the POWER
> specific has_work().

I don't quite see the rationale for introducing a second layer of
indirection here.  What's wrong with switching the base has_work for
each cpu variant?

>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  target/ppc/cpu-qom.h  |  3 +++
>  target/ppc/cpu_init.c | 26 ++++++++++++++++++--------
>  2 files changed, 21 insertions(+), 8 deletions(-)
>=20
> diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
> index 5800fa324e8..ff2bafcde6f 100644
> --- a/target/ppc/cpu-qom.h
> +++ b/target/ppc/cpu-qom.h
> @@ -189,6 +189,9 @@ struct PowerPCCPUClass {
>      int bfd_mach;
>      uint32_t l1_dcache_size, l1_icache_size;
>  #ifndef CONFIG_USER_ONLY
> +#ifdef CONFIG_TCG
> +    bool (*has_work)(CPUState *cpu);
> +#endif /* CONFIG_TCG */
>      unsigned int gdb_num_sprs;
>      const char *gdb_spr_xml;
>  #endif
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index e2e721c2b81..bbad16cc1ec 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -7583,6 +7583,7 @@ static bool ppc_pvr_match_power7(PowerPCCPUClass *p=
cc, uint32_t pvr)
>      return false;
>  }
> =20
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>  static bool cpu_has_work_POWER7(CPUState *cs)
>  {
>      PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> @@ -7616,12 +7617,12 @@ static bool cpu_has_work_POWER7(CPUState *cs)
>          return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
>      }
>  }
> +#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
> =20
>  POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(oc);
>      PowerPCCPUClass *pcc =3D POWERPC_CPU_CLASS(oc);
> -    CPUClass *cc =3D CPU_CLASS(oc);
> =20
>      dc->fw_name =3D "PowerPC,POWER7";
>      dc->desc =3D "POWER7";
> @@ -7630,7 +7631,6 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
>      pcc->pcr_supported =3D PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
>      pcc->init_proc =3D init_proc_POWER7;
>      pcc->check_pow =3D check_pow_nocheck;
> -    cc->has_work =3D cpu_has_work_POWER7;
>      pcc->insns_flags =3D PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MF=
TB |
>                         PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
>                         PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
> @@ -7673,6 +7673,7 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
>      pcc->lpcr_pm =3D LPCR_P7_PECE0 | LPCR_P7_PECE1 | LPCR_P7_PECE2;
>      pcc->mmu_model =3D POWERPC_MMU_2_06;
>  #if defined(CONFIG_SOFTMMU)
> +    pcc->has_work =3D cpu_has_work_POWER7;
>      pcc->hash64_opts =3D &ppc_hash64_opts_POWER7;
>      pcc->lrg_decr_bits =3D 32;
>  #endif
> @@ -7743,6 +7744,7 @@ static bool ppc_pvr_match_power8(PowerPCCPUClass *p=
cc, uint32_t pvr)
>      return false;
>  }
> =20
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>  static bool cpu_has_work_POWER8(CPUState *cs)
>  {
>      PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> @@ -7784,12 +7786,12 @@ static bool cpu_has_work_POWER8(CPUState *cs)
>          return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
>      }
>  }
> +#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
> =20
>  POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(oc);
>      PowerPCCPUClass *pcc =3D POWERPC_CPU_CLASS(oc);
> -    CPUClass *cc =3D CPU_CLASS(oc);
> =20
>      dc->fw_name =3D "PowerPC,POWER8";
>      dc->desc =3D "POWER8";
> @@ -7798,7 +7800,6 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
>      pcc->pcr_supported =3D PCR_COMPAT_2_07 | PCR_COMPAT_2_06 | PCR_COMPA=
T_2_05;
>      pcc->init_proc =3D init_proc_POWER8;
>      pcc->check_pow =3D check_pow_nocheck;
> -    cc->has_work =3D cpu_has_work_POWER8;
>      pcc->insns_flags =3D PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MF=
TB |
>                         PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
>                         PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
> @@ -7848,6 +7849,7 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
>                     LPCR_P8_PECE3 | LPCR_P8_PECE4;
>      pcc->mmu_model =3D POWERPC_MMU_2_07;
>  #if defined(CONFIG_SOFTMMU)
> +    pcc->has_work =3D cpu_has_work_POWER8;
>      pcc->hash64_opts =3D &ppc_hash64_opts_POWER7;
>      pcc->lrg_decr_bits =3D 32;
>      pcc->n_host_threads =3D 8;
> @@ -7941,6 +7943,7 @@ static bool ppc_pvr_match_power9(PowerPCCPUClass *p=
cc, uint32_t pvr)
>      return false;
>  }
> =20
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>  static bool cpu_has_work_POWER9(CPUState *cs)
>  {
>      PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> @@ -7998,12 +8001,12 @@ static bool cpu_has_work_POWER9(CPUState *cs)
>          return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
>      }
>  }
> +#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
> =20
>  POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(oc);
>      PowerPCCPUClass *pcc =3D POWERPC_CPU_CLASS(oc);
> -    CPUClass *cc =3D CPU_CLASS(oc);
> =20
>      dc->fw_name =3D "PowerPC,POWER9";
>      dc->desc =3D "POWER9";
> @@ -8013,7 +8016,6 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
>                           PCR_COMPAT_2_05;
>      pcc->init_proc =3D init_proc_POWER9;
>      pcc->check_pow =3D check_pow_nocheck;
> -    cc->has_work =3D cpu_has_work_POWER9;
>      pcc->insns_flags =3D PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MF=
TB |
>                         PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
>                         PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
> @@ -8062,6 +8064,7 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
>      pcc->lpcr_pm =3D LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_=
OEE;
>      pcc->mmu_model =3D POWERPC_MMU_3_00;
>  #if defined(CONFIG_SOFTMMU)
> +    pcc->has_work =3D cpu_has_work_POWER9;
>      /* segment page size remain the same */
>      pcc->hash64_opts =3D &ppc_hash64_opts_POWER7;
>      pcc->radix_page_info =3D &POWER9_radix_page_info;
> @@ -8150,6 +8153,7 @@ static bool ppc_pvr_match_power10(PowerPCCPUClass *=
pcc, uint32_t pvr)
>      return false;
>  }
> =20
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>  static bool cpu_has_work_POWER10(CPUState *cs)
>  {
>      PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> @@ -8207,12 +8211,12 @@ static bool cpu_has_work_POWER10(CPUState *cs)
>          return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
>      }
>  }
> +#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
> =20
>  POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(oc);
>      PowerPCCPUClass *pcc =3D POWERPC_CPU_CLASS(oc);
> -    CPUClass *cc =3D CPU_CLASS(oc);
> =20
>      dc->fw_name =3D "PowerPC,POWER10";
>      dc->desc =3D "POWER10";
> @@ -8223,7 +8227,6 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
>                           PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
>      pcc->init_proc =3D init_proc_POWER10;
>      pcc->check_pow =3D check_pow_nocheck;
> -    cc->has_work =3D cpu_has_work_POWER10;
>      pcc->insns_flags =3D PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MF=
TB |
>                         PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
>                         PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
> @@ -8275,6 +8278,7 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
>      pcc->lpcr_pm =3D LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_=
OEE;
>      pcc->mmu_model =3D POWERPC_MMU_3_00;
>  #if defined(CONFIG_SOFTMMU)
> +    pcc->has_work =3D cpu_has_work_POWER10;
>      /* segment page size remain the same */
>      pcc->hash64_opts =3D &ppc_hash64_opts_POWER7;
>      pcc->radix_page_info =3D &POWER10_radix_page_info;
> @@ -8796,6 +8800,12 @@ static bool ppc_cpu_has_work(CPUState *cs)
>      PowerPCCPU *cpu =3D POWERPC_CPU(cs);
>      CPUPPCState *env =3D &cpu->env;
> =20
> +    if (cs->halted) {
> +        PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> +
> +        return pcc->has_work(cs);
> +    }
> +
>      return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
>  }
>  #endif /* CONFIG_TCG && !CONFIG_USER_ONLY */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--iHh9kZyoW/xDyYBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmExcWUACgkQbDjKyiDZ
s5Kd6Q/9ExvXgL0E8gsCJTsKVim2JIFxJm6lfW3Ljf0A7E4onyKybV1Gu4uLlUjF
j5ELZ1+AgWr3vOUIhcBT5V1pGKvYXc37CpiQ15Q92DTTfHCcku03DesecGmle2lS
SiUQFgxVA88pMj1bzbYdQhrwgNebNJzVUdmeGythMdPbN+U4NwFJ5BYs+hkj3v+U
maeTd4I/tJOySTZhNbNsRi+zahzOxt/idmrjbJ/XoT8z9EUCF54IE/Xf9xKvgcbQ
YMK+c4PePo2xQXuDozfJNurhJ++J94hysnxH1nihopOegCgBhy8ZyU2LjsXa6hdA
GkUnVb7tG//kw3uEYkm2z+0a80ZLmXKuR2M0gkkkGQFEftHLF2ZLNo9ou8HuWEzd
1BeejEEKrUKGb7IoNwAZ3XgXZ2dErbwrvzKEIMNo6e0w7nnLSPpEgkEYQe0c6JEE
ZUl0IAd541qcGbI8Ckerg652ymOvv4I3PhG7Rg3GhQhR4+7uByfOkGVAZwf+TPYM
/EBZjio3zJrj3j5tl6xuC6y1GBefg601jAXvJUQzTOuQyxsgcujgKtvexCDztUoG
fJIX+Pn1j5q54OAE7CRHS1YEiJXlzj58FDBMJ2p/sdqETP2iJ1KhfJQ8Vw9ObJ54
1qMEYGBJIChIYtsBLc2OkVECXoXqJr3yjVJ6wp5a+DW7vgtQtNs=
=ay8o
-----END PGP SIGNATURE-----

--iHh9kZyoW/xDyYBn--

