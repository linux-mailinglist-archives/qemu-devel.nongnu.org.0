Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E79113289F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 15:16:07 +0100 (CET)
Received: from localhost ([::1]:49490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iopeP-0004kK-42
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 09:16:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35313)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iooLI-0005vz-Fd
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:52:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iooLG-0007sY-Ud
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:52:16 -0500
Received: from 10.mo7.mail-out.ovh.net ([178.33.250.56]:59415)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iooLG-0007rD-O2
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:52:14 -0500
Received: from player789.ha.ovh.net (unknown [10.108.54.156])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 714E7149E41
 for <qemu-devel@nongnu.org>; Tue,  7 Jan 2020 13:52:12 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: clg@kaod.org)
 by player789.ha.ovh.net (Postfix) with ESMTPSA id 27AEFDF85F73;
 Tue,  7 Jan 2020 12:52:00 +0000 (UTC)
Subject: Re: [PATCH v2 02/10] ppc: Remove stub of PPC970 HID4 implementation
To: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 groug@kaod.org, philmd@redhat.com
References: <20200107044827.471355-1-david@gibson.dropbear.id.au>
 <20200107044827.471355-3-david@gibson.dropbear.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c88da3c8-6f58-48e0-dd23-f29f88bd95ea@kaod.org>
Date: Tue, 7 Jan 2020 13:51:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200107044827.471355-3-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 9150188544498043686
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdehgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdduleehrddvuddvrddvledrudeiieenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeekledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.33.250.56
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
Cc: aik@ozlabs.ru, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-ppc@nongnu.org, lvivier@redhat.com, paulus@samba.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/20 5:48 AM, David Gibson wrote:
> The PowerPC 970 CPU was a cut-down POWER4, which had hypervisor capabil=
ity.
> However, it can be (and often was) strapped into "Apple mode", where th=
e
> hypervisor capabilities were disabled (essentially putting it always in
> hypervisor mode).
>=20
> That's actually the only mode of the 970 we support in qemu, and we're
> unlikely to change that any time soon.  However, we do have a partial
> implementation of the 970's HID4 register which affects things only
> relevant for hypervisor mode.
>=20
> That stub is also really ugly, since it attempts to duplicate the effec=
ts
> of HID4 by re-encoding it into the LPCR register used in newer CPUs, bu=
t
> in a really confusing way.
>=20
> Just get rid of it.
>=20
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>


Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>


> ---
>  target/ppc/mmu-hash64.c         | 28 +---------------------------
>  target/ppc/translate_init.inc.c | 17 ++++++-----------
>  2 files changed, 7 insertions(+), 38 deletions(-)
>=20
> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
> index da8966ccf5..a881876647 100644
> --- a/target/ppc/mmu-hash64.c
> +++ b/target/ppc/mmu-hash64.c
> @@ -1091,33 +1091,6 @@ void ppc_store_lpcr(PowerPCCPU *cpu, target_ulon=
g val)
> =20
>      /* Filter out bits */
>      switch (env->mmu_model) {
> -    case POWERPC_MMU_64B: /* 970 */
> -        if (val & 0x40) {
> -            lpcr |=3D LPCR_LPES0;
> -        }
> -        if (val & 0x8000000000000000ull) {
> -            lpcr |=3D LPCR_LPES1;
> -        }
> -        if (val & 0x20) {
> -            lpcr |=3D (0x4ull << LPCR_RMLS_SHIFT);
> -        }
> -        if (val & 0x4000000000000000ull) {
> -            lpcr |=3D (0x2ull << LPCR_RMLS_SHIFT);
> -        }
> -        if (val & 0x2000000000000000ull) {
> -            lpcr |=3D (0x1ull << LPCR_RMLS_SHIFT);
> -        }
> -        env->spr[SPR_RMOR] =3D ((lpcr >> 41) & 0xffffull) << 26;
> -
> -        /*
> -         * XXX We could also write LPID from HID4 here
> -         * but since we don't tag any translation on it
> -         * it doesn't actually matter
> -         *
> -         * XXX For proper emulation of 970 we also need
> -         * to dig HRMOR out of HID5
> -         */
> -        break;
>      case POWERPC_MMU_2_03: /* P5p */
>          lpcr =3D val & (LPCR_RMLS | LPCR_ILE |
>                        LPCR_LPES0 | LPCR_LPES1 |
> @@ -1154,6 +1127,7 @@ void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong=
 val)
>          }
>          break;
>      default:
> +        g_assert_not_reached();
>          ;
>      }
>      env->spr[SPR_LPCR] =3D lpcr;
> diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_ini=
t.inc.c
> index d33d65dff7..436d0d5a51 100644
> --- a/target/ppc/translate_init.inc.c
> +++ b/target/ppc/translate_init.inc.c
> @@ -7884,25 +7884,20 @@ static void spr_write_lpcr(DisasContext *ctx, i=
nt sprn, int gprn)
>  {
>      gen_helper_store_lpcr(cpu_env, cpu_gpr[gprn]);
>  }
> -
> -static void spr_write_970_hid4(DisasContext *ctx, int sprn, int gprn)
> -{
> -#if defined(TARGET_PPC64)
> -    spr_write_generic(ctx, sprn, gprn);
> -    gen_helper_store_lpcr(cpu_env, cpu_gpr[gprn]);
> -#endif
> -}
> -
>  #endif /* !defined(CONFIG_USER_ONLY) */
> =20
>  static void gen_spr_970_lpar(CPUPPCState *env)
>  {
>  #if !defined(CONFIG_USER_ONLY)
>      /* Logical partitionning */
> -    /* PPC970: HID4 is effectively the LPCR */
> +    /* PPC970: HID4 covers things later controlled by the LPCR and
> +     * RMOR in later CPUs, but with a different encoding.  We only
> +     * support the 970 in "Apple mode" which has all hypervisor
> +     * facilities disabled by strapping, so we can basically just
> +     * ignore it */
>      spr_register(env, SPR_970_HID4, "HID4",
>                   SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_970_hid4,
> +                 &spr_read_generic, &spr_write_generic,
>                   0x00000000);
>  #endif
>  }
>=20


