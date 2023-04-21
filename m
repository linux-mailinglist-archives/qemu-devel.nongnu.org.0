Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F596EB14B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 20:00:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppv3E-0005nB-D2; Fri, 21 Apr 2023 14:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>) id 1ppv3C-0005mY-3y
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 14:00:02 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>) id 1ppv39-0003Wv-ER
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 14:00:01 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7FB7B60EF4;
 Fri, 21 Apr 2023 17:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63FDC433EF;
 Fri, 21 Apr 2023 17:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682099983;
 bh=m5P6nliT6+94yARLAxNnuMjQHm1sO5fRsduqFS1dG6A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LOwHu9AtKmesRuGzJupttG8Wzx14+JadCsYVpZE8uKkeyj7+BGG2Ia3I5gOKkIV0O
 GXn/1deKJmjXiFojl+FFvlI1xZ3Qk1Wz8DhQfCxbYlN7dLvcUms4wSlfYp1iaZrqcJ
 ZS7YGn2yd9k8VLgTVM9kCHX42lJkUENpUtmLMn7DmYSuQrGrwGXqcEJvhuTFq2Ipjd
 9jCvPkEaegrfe11Gg/nFW+/zEezxTDRQkoGHua9X+NsfyG/BpA+0CGpzG8iE9PW2xV
 KOwPSVTgrQfeXz+nWEopUf5Mqyq0eti2TTOf7QbAJRNjxLnedw0lv2b8hK3l773lEC
 Rkf951DhQGEtw==
Date: Fri, 21 Apr 2023 18:59:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: qemu-devel@nongnu.org, ycliang@andestech.com, dylan@andestech.com,
 conor.dooley@microchip.com
Subject: Re: [PATCH] target/riscv: Fix PMU node property for virt machine
Message-ID: <20230421-profanity-debug-2ef7d4740c33@spud>
References: <20230421131437.19036-1-peterlin@andestech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WXuYodcwKeHTXE4s"
Content-Disposition: inline
In-Reply-To: <20230421131437.19036-1-peterlin@andestech.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=conor@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--WXuYodcwKeHTXE4s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 21, 2023 at 09:14:37PM +0800, Yu Chien Peter Lin wrote:
> The length of fdt_event_ctr_map[20] will add 5 dummy cells in
> "riscv,event-to-mhpmcounters" property, so directly initialize
> the array without an explicit size.
>=20
> This patch also fixes the typo of PMU cache operation result ID
> of MISS (0x1) in the comments, and renames event idx 0x10021 to
> RISCV_PMU_EVENT_CACHE_ITLB_READ_MISS.
>=20
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
>=20
>   $ ./build/qemu-system-riscv64 -M virt,dumpdtb=3D/tmp/virt.dtb -cpu rv64=
,sscofpmf=3Don && dtc /tmp/virt.dtb | grep mhpmcounters
>   [...]
>     riscv,event-to-mhpmcounters =3D <0x01 0x01 0x7fff9=20
>                                    0x02 0x02 0x7fffc
>                                    0x10019 0x10019 0x7fff8
>                                    0x1001b 0x1001b 0x7fff8
>                                    0x10021 0x10021 0x7fff8
>                dummy cells --->    0x00 0x00 0x00 0x00 0x00>;
>=20
> This won't break the OpenSBI, but will cause it to incorrectly increment
> num_hw_events [1] to 6, and DT validation failure in kernel [2].
>=20
>   $ dt-validate -p Documentation/devicetree/bindings/processed-schema.jso=
n virt.dtb
>   [...]
>   virt.dtb: soc: pmu: {'riscv,event-to-mhpmcounters': [[1, 1, 524281], [2=
, 2, 524284], [65561, 65561, 524280], [65563, 65563, 524280], [65569, 65569=
, 524280], [0, 0, 0], [0, 0]], 'compatible': ['riscv,pmu']} should not be v=
alid under {'type': 'object'}

I would note that this warning here does not go away with this patch ^^
It's still on my todo list, unless you want to fix it!

>           From schema: /home/peterlin/.local/lib/python3.10/site-packages=
/dtschema/schemas/simple-bus.yaml
>   virt.dtb: pmu: riscv,event-to-mhpmcounters:6: [0, 0] is too short
>   [...]

And with the binding below there is a 3rd warning, but I think it is
incorrect and I submitted a patch for the binding to fix it.

That said, this doesn't seem to have been submitted on top of my naive
s/20/15/ patch that Alistair picked up. Is this intended to replace, or
for another branch? Replace works fine for me, don't have sentimental
feelings for that patch!

I think your approach here was better than my s/20/15/, but seems like a
bit of a fix and a bit of cleanup all-in-one.

Either way, warnings gone so WFM :) :)

Thanks,
Conor.

> [1] https://github.com/riscv-software-src/opensbi/blob/master/lib/sbi/sbi=
_pmu.c#L255
> [2] https://github.com/torvalds/linux/blob/v6.3-rc7/Documentation/devicet=
ree/bindings/perf/riscv%2Cpmu.yaml#L54-L66
> ---
>  target/riscv/cpu.h        |  2 +-
>  target/riscv/cpu_helper.c |  2 +-
>  target/riscv/pmu.c        | 88 +++++++++++++++++++--------------------
>  3 files changed, 45 insertions(+), 47 deletions(-)
>=20
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 638e47c75a..eab518542c 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -812,7 +812,7 @@ enum riscv_pmu_event_idx {
>      RISCV_PMU_EVENT_HW_INSTRUCTIONS =3D 0x02,
>      RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS =3D 0x10019,
>      RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS =3D 0x1001B,
> -    RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS =3D 0x10021,
> +    RISCV_PMU_EVENT_CACHE_ITLB_READ_MISS =3D 0x10021,
>  };
> =20
>  /* CSR function table */
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f88c503cf4..5d3e032ec9 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1210,7 +1210,7 @@ static void pmu_tlb_fill_incr_ctr(RISCVCPU *cpu, MM=
UAccessType access_type)
> =20
>      switch (access_type) {
>      case MMU_INST_FETCH:
> -        pmu_event_type =3D RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS;
> +        pmu_event_type =3D RISCV_PMU_EVENT_CACHE_ITLB_READ_MISS;
>          break;
>      case MMU_DATA_LOAD:
>          pmu_event_type =3D RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS;
> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> index b8e56d2b7b..0b21c3fa38 100644
> --- a/target/riscv/pmu.c
> +++ b/target/riscv/pmu.c
> @@ -35,51 +35,49 @@
>   */
>  void riscv_pmu_generate_fdt_node(void *fdt, int num_ctrs, char *pmu_name)
>  {
> -    uint32_t fdt_event_ctr_map[20] =3D {};
> -    uint32_t cmask;
> -
>      /* All the programmable counters can map to any event */
> -    cmask =3D MAKE_32BIT_MASK(3, num_ctrs);
> -
> -   /*
> -    * The event encoding is specified in the SBI specification
> -    * Event idx is a 20bits wide number encoded as follows:
> -    * event_idx[19:16] =3D type
> -    * event_idx[15:0] =3D code
> -    * The code field in cache events are encoded as follows:
> -    * event_idx.code[15:3] =3D cache_id
> -    * event_idx.code[2:1] =3D op_id
> -    * event_idx.code[0:0] =3D result_id
> -    */
> -
> -   /* SBI_PMU_HW_CPU_CYCLES: 0x01 : type(0x00) */
> -   fdt_event_ctr_map[0] =3D cpu_to_be32(0x00000001);
> -   fdt_event_ctr_map[1] =3D cpu_to_be32(0x00000001);
> -   fdt_event_ctr_map[2] =3D cpu_to_be32(cmask | 1 << 0);
> -
> -   /* SBI_PMU_HW_INSTRUCTIONS: 0x02 : type(0x00) */
> -   fdt_event_ctr_map[3] =3D cpu_to_be32(0x00000002);
> -   fdt_event_ctr_map[4] =3D cpu_to_be32(0x00000002);
> -   fdt_event_ctr_map[5] =3D cpu_to_be32(cmask | 1 << 2);
> -
> -   /* SBI_PMU_HW_CACHE_DTLB : 0x03 READ : 0x00 MISS : 0x00 type(0x01) */
> -   fdt_event_ctr_map[6] =3D cpu_to_be32(0x00010019);
> -   fdt_event_ctr_map[7] =3D cpu_to_be32(0x00010019);
> -   fdt_event_ctr_map[8] =3D cpu_to_be32(cmask);
> -
> -   /* SBI_PMU_HW_CACHE_DTLB : 0x03 WRITE : 0x01 MISS : 0x00 type(0x01) */
> -   fdt_event_ctr_map[9] =3D cpu_to_be32(0x0001001B);
> -   fdt_event_ctr_map[10] =3D cpu_to_be32(0x0001001B);
> -   fdt_event_ctr_map[11] =3D cpu_to_be32(cmask);
> -
> -   /* SBI_PMU_HW_CACHE_ITLB : 0x04 READ : 0x00 MISS : 0x00 type(0x01) */
> -   fdt_event_ctr_map[12] =3D cpu_to_be32(0x00010021);
> -   fdt_event_ctr_map[13] =3D cpu_to_be32(0x00010021);
> -   fdt_event_ctr_map[14] =3D cpu_to_be32(cmask);
> -
> -   /* This a OpenSBI specific DT property documented in OpenSBI docs */
> -   qemu_fdt_setprop(fdt, pmu_name, "riscv,event-to-mhpmcounters",
> -                    fdt_event_ctr_map, sizeof(fdt_event_ctr_map));
> +    uint32_t cmask =3D MAKE_32BIT_MASK(3, num_ctrs);
> +
> +    /*
> +     * The event encoding is specified in the SBI specification
> +     * Event idx is a 20bits wide number encoded as follows:
> +     * event_idx[19:16] =3D type
> +     * event_idx[15:0] =3D code
> +     * The code field in cache events are encoded as follows:
> +     * event_idx.code[15:3] =3D cache_id
> +     * event_idx.code[2:1] =3D op_id
> +     * event_idx.code[0:0] =3D result_id
> +     */
> +    const uint32_t fdt_event_ctr_map[] =3D {
> +        /* SBI_PMU_HW_CPU_CYCLES: 0x01 : type(0x00) */
> +        cpu_to_be32(RISCV_PMU_EVENT_HW_CPU_CYCLES),
> +        cpu_to_be32(RISCV_PMU_EVENT_HW_CPU_CYCLES),
> +        cpu_to_be32(cmask | 1 << 0),
> +
> +        /* SBI_PMU_HW_INSTRUCTIONS: 0x02 : type(0x00) */
> +        cpu_to_be32(RISCV_PMU_EVENT_HW_INSTRUCTIONS),
> +        cpu_to_be32(RISCV_PMU_EVENT_HW_INSTRUCTIONS),
> +        cpu_to_be32(cmask | 1 << 2),
> +
> +        /* SBI_PMU_HW_CACHE_DTLB : 0x03 READ : 0x00 MISS : 0x01 type(0x0=
1) */
> +        cpu_to_be32(RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS),
> +        cpu_to_be32(RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS),
> +        cpu_to_be32(cmask),
> +
> +        /* SBI_PMU_HW_CACHE_DTLB : 0x03 WRITE : 0x01 MISS : 0x01 type(0x=
01) */
> +        cpu_to_be32(RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS),
> +        cpu_to_be32(RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS),
> +        cpu_to_be32(cmask),
> +
> +        /* SBI_PMU_HW_CACHE_ITLB : 0x04 READ : 0x00 MISS : 0x01 type(0x0=
1) */
> +        cpu_to_be32(RISCV_PMU_EVENT_CACHE_ITLB_READ_MISS),
> +        cpu_to_be32(RISCV_PMU_EVENT_CACHE_ITLB_READ_MISS),
> +        cpu_to_be32(cmask),
> +    };
> +
> +    /* This a OpenSBI specific DT property documented in OpenSBI docs */
> +    qemu_fdt_setprop(fdt, pmu_name, "riscv,event-to-mhpmcounters",
> +                     fdt_event_ctr_map, sizeof(fdt_event_ctr_map));
>  }
> =20
>  static bool riscv_pmu_counter_valid(RISCVCPU *cpu, uint32_t ctr_idx)
> @@ -317,7 +315,7 @@ int riscv_pmu_update_event_map(CPURISCVState *env, ui=
nt64_t value,
>      case RISCV_PMU_EVENT_HW_INSTRUCTIONS:
>      case RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS:
>      case RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS:
> -    case RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS:
> +    case RISCV_PMU_EVENT_CACHE_ITLB_READ_MISS:
>          break;
>      default:
>          /* We don't support any raw events right now */
> --=20
> 2.34.1
>=20
>=20

--WXuYodcwKeHTXE4s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZELPDAAKCRB4tDGHoIJi
0sOPAQDJWKPxQZF+KYHnSOd4xDwsxKp0ek2XgLzQq+MK68VoogEAm++bmUkG4MWP
t87ITkYggy8zQhypePGsNMFoFDUJ1wA=
=9rfI
-----END PGP SIGNATURE-----

--WXuYodcwKeHTXE4s--

