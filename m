Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDFE35B9CD
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 07:27:51 +0200 (CEST)
Received: from localhost ([::1]:52916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVp70-0002WV-FD
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 01:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lVp4P-0000vK-TA; Mon, 12 Apr 2021 01:25:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:55779 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lVp4L-0000mI-Uu; Mon, 12 Apr 2021 01:25:09 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FJccj4Fbyz9sWl; Mon, 12 Apr 2021 15:24:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618205093;
 bh=XQZ72UvLNDN+jX6XJRjsg7zg3Vglx0xSxysTkPNbdUc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eKZ5CCfYo//uieVBA/v7og+dda+99EV9sRJdWlT/h7/w2oq35iZDlNYJG/cocJPyA
 gmpI5YylIWzmd3VmMrSsBrhLqeS7dtb3hkh529MYacB8GOnHsW0uGc7MjWURVVSsLF
 fdDOltkHqVfAnCmo4bGTfV/DCUxA1tYt9q7OesO4=
Date: Mon, 12 Apr 2021 15:08:39 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH 2/4] target/ppc: added solutions for building with
 disable-tcg
Message-ID: <YHPV19l06sgXCNEj@yekko.fritz.box>
References: <20210409151916.97326-1-bruno.larsen@eldorado.org.br>
 <20210409151916.97326-3-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XWx5h/o7l+7+1WAy"
Content-Disposition: inline
In-Reply-To: <20210409151916.97326-3-bruno.larsen@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: qemu-devel@nongnu.org, andre.silva@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, lagarcia@br.ibm.com, matheus.ferst@eldorado.org.br,
 luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--XWx5h/o7l+7+1WAy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 09, 2021 at 12:19:14PM -0300, Bruno Larsen (billionai) wrote:
> this commit presents 2 possible solutions for substituting TCG emulation
> with KVM calls. One - used in machine.c and arch_dump.c - explicitly
> adds the KVM function and has the possibility of adding the TCG one
> for more generic compilation, prioritizing te KVM option. The second
> option, implemented in kvm_ppc.h, transparently changes the helper
> into the KVM call, if TCG is not enabled. I believe the first solution
> is better, but it is less readable, so I wanted to have some feedback
>=20
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  target/ppc/arch_dump.c | 17 +++++++++++++++++
>  target/ppc/kvm.c       | 30 ++++++++++++++++++++++++++++++
>  target/ppc/kvm_ppc.h   | 11 +++++++++++
>  target/ppc/machine.c   | 33 ++++++++++++++++++++++++++++++++-
>  4 files changed, 90 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
> index 9ab04b2c38..c53e01011a 100644
> --- a/target/ppc/arch_dump.c
> +++ b/target/ppc/arch_dump.c
> @@ -17,7 +17,10 @@
>  #include "elf.h"
>  #include "sysemu/dump.h"
>  #include "sysemu/kvm.h"
> +#include "kvm_ppc.h"
> +#if defined(CONFIG_TCG)
>  #include "exec/helper-proto.h"
> +#endif /* CONFIG_TCG */
> =20
>  #ifdef TARGET_PPC64
>  #define ELFCLASS ELFCLASS64
> @@ -176,7 +179,21 @@ static void ppc_write_elf_vmxregset(NoteFuncArg *arg=
, PowerPCCPU *cpu)
>              vmxregset->avr[i].u64[1] =3D avr->u64[1];
>          }
>      }
> +    /* This is the first solution implemented. My personal favorite as it
> +     * allows for explicit error handling, however it is much less reada=
ble */
> +#if defined(CONFIG_KVM)
> +    if(kvm_enabled()){
> +        vmxregset->vscr.u32[3] =3D cpu_to_dump32(s, kvmppc_mfvscr(cpu));
> +    }else
> +#endif
> +
> +#if defined(CONFIG_TCG)
>      vmxregset->vscr.u32[3] =3D cpu_to_dump32(s, helper_mfvscr(&cpu->env)=
);
> +#else
> +    {
> +        /* TODO: add proper error handling, even tough this should never=
 be reached */
> +    }
> +#endif

I think this is more complex than you need.  AFAICT, the logic in
helper_mfcsvr() is still valid even without TCG (we still have a copy
of the state in 'env' with KVM).

You could move helper_mfvscr() to a file that isn't going to get
excluded for !TCG builds.

Not directly related to what you're trying to accomplish here, but the
whole vscr_sat thing looks really weird.  I have no idea why we're
splitting out the storage of VSCR[SAT] for the TCG case at all.  If
you wanted to clean that up as a preliminary, I'd be grateful.

>  }
> =20
>  static void ppc_write_elf_vsxregset(NoteFuncArg *arg, PowerPCCPU *cpu)
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 104a308abb..8ed54d12d8 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -51,6 +51,7 @@
>  #include "elf.h"
>  #include "sysemu/kvm_int.h"
> =20
> +
>  #define PROC_DEVTREE_CPU      "/proc/device-tree/cpus/"
> =20
>  #define DEBUG_RETURN_GUEST 0
> @@ -2947,3 +2948,32 @@ bool kvm_arch_cpu_check_are_resettable(void)
>  {
>      return true;
>  }
> +
> +/* Functions added to replace helper_m(t|f)vscr from int_helper.c */
> +int kvmppc_mtvscr(PowerPCCPU *cpu, uint32_t val){
> +    CPUState *cs =3D CPU(cpu);
> +    CPUPPCState *env =3D &cpu->env;
> +    struct kvm_one_reg reg;
> +    int ret;
> +    reg.id =3D KVM_REG_PPC_VSCR;
> +    reg.addr =3D (uintptr_t) &env->vscr;
> +    ret =3D kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +    if(ret < 0){
> +        fprintf(stderr, "Unable to set VSCR to KVM: %s", strerror(errno)=
);
> +    }
> +    return ret;
> +}
> +
> +int kvmppc_mfvscr(PowerPCCPU *cpu){
> +    CPUState *cs =3D CPU(cpu);
> +    CPUPPCState *env =3D &cpu->env;
> +    struct kvm_one_reg reg;
> +    int ret;
> +    reg.id =3D KVM_REG_PPC_VSCR;
> +    reg.addr =3D (uintptr_t) &env->vscr;
> +    ret =3D kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> +    if(ret < 0){
> +        fprintf(stderr, "Unable to get VSCR to KVM: %s", strerror(errno)=
);
> +    }
> +    return ret;
> +}
> diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
> index 989f61ace0..f618cb28b1 100644
> --- a/target/ppc/kvm_ppc.h
> +++ b/target/ppc/kvm_ppc.h
> @@ -86,6 +86,17 @@ void kvmppc_set_reg_tb_offset(PowerPCCPU *cpu, int64_t=
 tb_offset);
> =20
>  int kvm_handle_nmi(PowerPCCPU *cpu, struct kvm_run *run);
> =20
> +int kvmppc_mtvscr(PowerPCCPU*, uint32_t);
> +int kvmppc_mfvscr(PowerPCCPU*);
> +
> +/* This is the second (quick and dirty) solution. Not my personal favori=
te
> + * as it hides what is actually happening from the user and doesn't allow
> + * for error checking. but it requires less change in other files */
> +#ifndef CONFIG_TCG
> +#define helper_mtvscr(env, val) kvmppc_mtvscr(env_archcpu(env),val)
> +#define helper_mfvscr(env) kvmppc_mfvscr(env_archcpu(env))
> +#endif
> +
>  #else
> =20
>  static inline uint32_t kvmppc_get_tbfreq(void)
> diff --git a/target/ppc/machine.c b/target/ppc/machine.c
> index 283db1d28a..d92bc18859 100644
> --- a/target/ppc/machine.c
> +++ b/target/ppc/machine.c
> @@ -8,7 +8,9 @@
>  #include "qapi/error.h"
>  #include "qemu/main-loop.h"
>  #include "kvm_ppc.h"
> +#ifdef CONFIG_TCG
>  #include "exec/helper-proto.h"
> +#endif /*CONFIG_TCG*/
> =20
>  static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
>  {
> @@ -95,7 +97,18 @@ static int cpu_load_old(QEMUFile *f, void *opaque, int=
 version_id)
>          ppc_store_sdr1(env, sdr1);
>      }
>      qemu_get_be32s(f, &vscr);
> -    helper_mtvscr(env, vscr);

Likewise here, the existing helper_mtvscr() is fine (if perhaps more
complex than necessary), so you don't need separate paths here.

> +#if defined(CONFIG_KVM)
> +    if(kvm_enabled()){
> +        kvmppc_mtvscr(cpu, vscr);
> +    }else
> +#endif
> +#if defined(CONFIG_TCG)
> +        helper_mtvscr(env, vscr);
> +#else
> +    {
> +        /* TODO: Add correct error handling, even though this should nev=
er be reached */
> +    }
> +#endif
>      qemu_get_be64s(f, &env->spe_acc);
>      qemu_get_be32s(f, &env->spe_fscr);
>      qemu_get_betls(f, &env->msr_mask);
> @@ -450,7 +463,16 @@ static int get_vscr(QEMUFile *f, void *opaque, size_=
t size,
>                      const VMStateField *field)
>  {
>      PowerPCCPU *cpu =3D opaque;
> +#if defined(CONFIG_KVM)
> +    if(kvm_enabled()){
> +        kvmppc_mtvscr(cpu, qemu_get_be32(f));
> +        return 0;
> +    }
> +#endif /*CONFIG_KVM*/
> +
> +#if defined(CONFIG_TCG)
>      helper_mtvscr(&cpu->env, qemu_get_be32(f));
> +#endif /*CONFIG_TCG*/
>      return 0;
>  }
> =20
> @@ -458,7 +480,16 @@ static int put_vscr(QEMUFile *f, void *opaque, size_=
t size,
>                      const VMStateField *field, JSONWriter *vmdesc)
>  {
>      PowerPCCPU *cpu =3D opaque;
> +#if defined(CONFIG_KVM)
> +    if(kvm_enabled()){
> +        qemu_put_be32(f, kvmppc_mfvscr(cpu));
> +        return 0;
> +    }
> +#endif /*CONFIG_KVM*/
> +
> +#if defined(CONFIG_TCG)
>      qemu_put_be32(f, helper_mfvscr(&cpu->env));
> +#endif /*CONFIG_TCG*/
>      return 0;
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--XWx5h/o7l+7+1WAy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBz1dUACgkQbDjKyiDZ
s5L/EhAAnle5dbyesFjTQQTGT8nexNez/Ctip1cIW1kYW/ijtkpXRSO4xzyyvji8
GPOk7NPo5octvsa4/endooDd7Vz27S0o/Y/Dw8jA8wB9wZCsEeCZYrRy5UgtW2nw
daI+tntJysYZU/U/OH9drfacx2G180rvXx3OWZK2sgUQQ1+yTsZ35meSsELgL+0P
/bx33DNwLIZWp39nADMM/HZjVWQG3ymXp00GxFAlcd5I97qp4h+IrXauG0kj75P/
iKvD21G7vAhpHTaJaOEHfmQ6p2HhGSKRrtAplpmltv+nELv3thU3QmQdGEKq8O2W
V8bzzhixGSagUNDhomsqFWD8bSbMP3Tb5esbnkGX9ZebfVcV0mmF1ou/loavcTFf
JoZCZVUiN/ng1H8+xgCaxyWe+dhHTzo27YDZL366jSLn+ne9/Wb8gJp3viDhNh8G
O7+KPbyARYZyHJ7CwMiuhIk12lr4ClMpKlYZbfpIzZVU0pGWyn/96CMzB4l1p0E5
J1JnPXSaoIWE0euoN2V4IMAG7NXKAVZ8e2VsNX8XDcgPOY2PFNP0lD42xVVComvA
WWC4Eyo9xiapJK/oA0RIGou6bYOXlCRC41z48udPxil6+pRh9UBycE8vXWpYvqMz
YfDhzai9odclZzEpgc+IfDvCVVVinWJ+7F/0wCrIjEKJiPvZLyI=
=mBYa
-----END PGP SIGNATURE-----

--XWx5h/o7l+7+1WAy--

