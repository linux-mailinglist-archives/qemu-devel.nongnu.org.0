Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97784EE6E6
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 05:46:23 +0200 (CEST)
Received: from localhost ([::1]:51940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na8Ew-0007ch-51
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 23:46:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1na89t-0005p8-T6; Thu, 31 Mar 2022 23:41:09 -0400
Received: from [2404:9400:2221:ea00::3] (port=53649 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1na89o-0008Jt-OC; Thu, 31 Mar 2022 23:41:09 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4KV5Y91XPFz4xYD; Fri,  1 Apr 2022 14:40:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1648784445;
 bh=PSTZZHE2oIyHTTFSEtzNGi0bmIWqY4W65eZK6AOHU44=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d7m6U7EIU3kKG+hM9p5A/yK8gphqGs1+2YJKgHdg4lm8HPYlG0upYfJyKEen2MT3o
 KA4+AWLY3ehZhgtplXHhOGFhxxvslHIhW/eMwz3XIHudsuOcNE9Qj4Fc0dSD+P99/l
 YHP7OGlu73FRHRtcOQQswDVm1/i+K2u9TDRpkXpQ=
Date: Fri, 1 Apr 2022 14:38:13 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 2/4] target/ppc: init 'lpcr' in
 kvmppc_enable_cap_large_decr()
Message-ID: <YkZzpaXgkxYZEFXn@yekko>
References: <20220331001717.616938-1-danielhb413@gmail.com>
 <20220331001717.616938-3-danielhb413@gmail.com>
 <YkUDCdUsjjmzFgJr@yekko>
 <d5b622c6-81b4-9d3f-9777-5233fe5a2be4@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rzKSepAQ8JTyW1Gq"
Content-Disposition: inline
In-Reply-To: <d5b622c6-81b4-9d3f-9777-5233fe5a2be4@gmail.com>
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
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--rzKSepAQ8JTyW1Gq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2022 at 02:17:42PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 3/30/22 22:25, David Gibson wrote:
> > On Wed, Mar 30, 2022 at 09:17:15PM -0300, Daniel Henrique Barboza wrote:
> > > 'lpcr' is used as an input of kvm_get_one_reg(). Valgrind doesn't
> > > understand that and it returns warnings as such for this function:
> > >=20
> > > =3D=3D55240=3D=3D Thread 1:
> > > =3D=3D55240=3D=3D Conditional jump or move depends on uninitialised v=
alue(s)
> > > =3D=3D55240=3D=3D    at 0xB011E4: kvmppc_enable_cap_large_decr (kvm.c=
:2546)
> > > =3D=3D55240=3D=3D    by 0x92F28F: cap_large_decr_cpu_apply (spapr_cap=
s.c:523)
> > > =3D=3D55240=3D=3D    by 0x930C37: spapr_caps_cpu_apply (spapr_caps.c:=
921)
> > > =3D=3D55240=3D=3D    by 0x955D3B: spapr_reset_vcpu (spapr_cpu_core.c:=
73)
> > > =3D=3D55240=3D=3D    by 0x95612B: spapr_cpu_core_reset (spapr_cpu_cor=
e.c:209)
> > > =3D=3D55240=3D=3D    by 0x95619B: spapr_cpu_core_reset_handler (spapr=
_cpu_core.c:218)
> > > =3D=3D55240=3D=3D    by 0xD3605F: qemu_devices_reset (reset.c:69)
> > > =3D=3D55240=3D=3D    by 0x92112B: spapr_machine_reset (spapr.c:1641)
> > > =3D=3D55240=3D=3D    by 0x4FBD63: qemu_system_reset (runstate.c:444)
> > > =3D=3D55240=3D=3D    by 0x62812B: qdev_machine_creation_done (machine=
=2Ec:1247)
> > > =3D=3D55240=3D=3D    by 0x5064C3: qemu_machine_creation_done (vl.c:27=
25)
> > > =3D=3D55240=3D=3D    by 0x5065DF: qmp_x_exit_preconfig (vl.c:2748)
> > > =3D=3D55240=3D=3D  Uninitialised value was created by a stack allocat=
ion
> > > =3D=3D55240=3D=3D    at 0xB01158: kvmppc_enable_cap_large_decr (kvm.c=
:2540)
> > >=20
> > > Init 'lpcr' to avoid this warning.
> >=20
> > Hmm... this is seeming a bit like whack-a-mole.  Could we instead use
> > one of the valgrind hinting mechanisms to inform it that
> > kvm_get_one_reg() writes the variable at *target?
>=20
> I didn't find a way of doing that looking in the memcheck helpers
> (https://valgrind.org/docs/manual/mc-manual.html section 4.7). That would=
 be a
> good way of solving this warning because we would put stuff inside a spec=
ific
> function X and all callers of X would be covered by it.
>=20
> What I did find instead is a memcheck macro called VALGRIND_MAKE_MEM_DEFI=
NED that
> tells Valgrind that the var was initialized.

I think that's the one I was thinking of.

> This patch would then be something as follows:
>=20
>=20
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index dc93b99189..b0e22fa283 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -56,6 +56,10 @@
>  #define DEBUG_RETURN_GUEST 0
>  #define DEBUG_RETURN_GDB   1
> +#ifdef CONFIG_VALGRIND_H
> +#include <valgrind/memcheck.h>
> +#endif
> +
>  const KVMCapabilityInfo kvm_arch_required_capabilities[] =3D {
>      KVM_CAP_LAST_INFO
>  };
> @@ -2539,6 +2543,10 @@ int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, =
int enable)
>      CPUState *cs =3D CPU(cpu);
>      uint64_t lpcr;
> +#ifdef CONFIG_VALGRIND_H
> +    VALGRIND_MAKE_MEM_DEFINED(lpcr, sizeof(uint64_t));
> +#endif
> +
>      kvm_get_one_reg(cs, KVM_REG_PPC_LPCR_64, &lpcr);
>      /* Do we need to modify the LPCR? */

The macro call should only go after the get_one_reg, of course.

> CONFIG_VALGRIND_H needs 'valgrind-devel=B4 installed.

Right.. better would probably be to make a wrapper macro defined as a
no-op in the !CONFIG_VALGRIND_H case, so you don't need the ifdefs at
the point you use it.
>=20
> I agree that this "Valgrind is complaining about variable initialization"=
 is a whack-a-mole
> situation that will keep happening in the future if we keep adding this s=
ame code pattern
> (passing as reference an uninitialized var). For now, given that we have =
only 4 instances
> to fix it in ppc code (as far as I'm aware of), and we don't have a bette=
r way of telling
> Valgrind that we know what we're doing, I think we're better of
> initializing these vars.

Hmm... still feels like it would be better to put the
MAKE_MEM_DEFINED inside kvm_get_one_reg().  I think the difficulty
with that is that it handles both 32-bit and 64-bit registers and I'm
not sure if there's an easy way to work out exactly how many bits
*have* been initialized.

>=20
>=20
> Thanks,
>=20
>=20
> Daniel
>=20
>=20
>=20
> >=20
> > > Reviewed-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > ---
> > >   target/ppc/kvm.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> > > index 858866ecd4..42814e1b97 100644
> > > --- a/target/ppc/kvm.c
> > > +++ b/target/ppc/kvm.c
> > > @@ -2538,7 +2538,7 @@ int kvmppc_get_cap_large_decr(void)
> > >   int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable)
> > >   {
> > >       CPUState *cs =3D CPU(cpu);
> > > -    uint64_t lpcr;
> > > +    uint64_t lpcr =3D 0;
> > >       kvm_get_one_reg(cs, KVM_REG_PPC_LPCR_64, &lpcr);
> > >       /* Do we need to modify the LPCR? */
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rzKSepAQ8JTyW1Gq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmJGc4kACgkQgypY4gEw
YSISrA//a5R8thiZw9QSzVsqHhcU9rTYwN0a9pnPeUOSyNdosWnYx5R0HTVEEMm8
zW+LgnTYOPNS5xMLiEPruMsCStnJ1IMoFmJ7QS3hEcNxB+SzbxuV3GZL4sMkai1Z
olta9UJhSPt2YDkPshVfvP23HxRJXNUnnEO86Nf2xXG94X9IcWbZHxfUSLFcFvnw
SQJ/x4/sYagw6YhJWJxf8uNn7e9ukbep5/1wtUX3i1E5iOTtwqDMiJfWHrKeptnS
DOROH67kNd0uJ/572cyRR6x4cNuv8vJ6Oc8+Z2hygidwLDV37nzp+aWO0dgelmf3
Z8Up0wnVrTILfKd5wfCRvYei8w8KHNIY5YgwnWJptSgBRk37KpoBYLxGvvjo+4vD
jOaoaA11Z7JWv75J3ggKmWZGDulaVKa3pAA5eKqVRya9bFZvAFzljM8X6UxIP6Bu
cepFu2SimB29a6omcL3zkwJ4o10Mt95y7jSRfzMaZXMgStGbs/TdFidEiOkJTVOm
i7XeyhJ0uGL4JVbbKEJEclEJOuHBi+g7My+wmgKqQhRUlFLZpMnwyiVQGxCvpI7v
RXX/gC5iO7Akb/Gejr4YD0NWsVoCJ4i8Ylzk55bS08K0FR2WndK3OUtp3G9/gPUx
zqGpnhPjn+s2q/d0uchbX/NkjOmYDY9YOc5B3/4CFYpDW2WYcKQ=
=8wKY
-----END PGP SIGNATURE-----

--rzKSepAQ8JTyW1Gq--

