Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EBFBBF2C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 01:55:43 +0200 (CEST)
Received: from localhost ([::1]:37530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCYBC-0001Zf-8I
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 19:55:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42940)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iCY9j-0000R9-Jq
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 19:54:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iCY9h-0007jS-F8
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 19:54:11 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:34111)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iCY9h-0007jA-2d
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 19:54:09 -0400
Received: by mail-wm1-x343.google.com with SMTP id y135so340359wmc.1
 for <qemu-devel@nongnu.org>; Mon, 23 Sep 2019 16:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=r7G43dN7UQA4+sc4FbTK0C0QEPqxoDjthn47E733m7Y=;
 b=tzhhkU1rzIzI684cRTtBj/bPle3f+xHVpWW0Ua9uc4vq4hGdG5JKYcboFfDcqDlxUe
 O3ePZ1dh+enOMXoI5fb2llOGNDxcynlxERQQdrcMwg13FtxkoOW5B4MFCIv7j1X4fjE7
 k5Awxt9QJ14Sgls89u2QqkGP05aLVJOmghumiDwALDHYJCiQNQ52aeEWKvCi1v2UHxFS
 UrKVsE7UbkLb2DdsTJQJJMv/0w9rbE0V6tXtNB88Y23y8q5f+F479DDzDBfBQmoY1VJM
 kzQtiBLMouN6BU6f4wu3hIQbaJqLTAcgRHwd14C/+J0tp+Lp2MpYF2O1kEO6kt+v9AtW
 hnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=r7G43dN7UQA4+sc4FbTK0C0QEPqxoDjthn47E733m7Y=;
 b=CLtjg/5AuiGtrYmwFOuC20scS2Hhc9PRTj4uBaRfZLseiNqcKkGiPkw8gUsxQAf8KJ
 rYVfe3opn9PBEqHRr/WVfZO3YSaUCsNB99QRWFi0qr78w1wZKGAJnBUzPnxLy9vXqAc+
 UKB+0gGcsa66VEfzOEt1LKSWEIXLegD+SU6Vo2xTPSax5KsPLDkgNozJcwv6gCZiF4BK
 XEo/mX6fKT6bYGqveJhi8sCIg/05l30m4t3aT9nnIUvWuoXg1K5IaUT/4rfLoNXUeE7n
 c9Moo4GpPHdmqoijhcTQp1iZU2d5hEdPHaBEbu5/YD0mPzNLoo6u4JgS8/EYhniBMH0N
 pIgA==
X-Gm-Message-State: APjAAAXFumnjlq5z7RoatCsIOmPstajoAWTlp8l54Aju/zp43f6sWwxr
 AqBtqM/3/XvUrF4NhNZsa6oFIA==
X-Google-Smtp-Source: APXvYqxtmysJhqrQ2dMN3sFVLn1F3iarlO38f8M0jWacUXnUJ5Pxcop5Pz8iVVM2HN/oJvPffnlKhw==
X-Received: by 2002:a05:600c:2115:: with SMTP id
 u21mr102189wml.168.1569282847655; 
 Mon, 23 Sep 2019 16:54:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z189sm19497252wmc.25.2019.09.23.16.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 16:54:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E510B1FF87;
 Tue, 24 Sep 2019 00:54:05 +0100 (BST)
References: <20190910095610.4546-1-beata.michalska@linaro.org>
 <20190910095610.4546-5-beata.michalska@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: [Qemu-devel] [PATCH 4/4] target/arm: Add support for DC CVAP &
 DC CVADP ins
In-reply-to: <20190910095610.4546-5-beata.michalska@linaro.org>
Date: Tue, 24 Sep 2019 00:54:05 +0100
Message-ID: <87ftkmbmci.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: peter.maydell@linaro.org, Beata Michalska <beata.michalska@linaro.org>,
 quintela@redhat.com, richard.henderson@linaro.org, dgilbert@redhat.com,
 shameerali.kolothum.thodi@huawei.com, eric.auger@redhat.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Beata Michalska <beata.michalska@linaro.org> writes:

> ARMv8.2 introduced support for Data Cache Clean instructions
> to PoP (point-of-persistence) - DC CVAP and PoDP (point-of-deep-persisten=
ce)
> - DV CVADP. Both specify conceptual points in a memory system where all w=
rites
> that are to reach them are considered persistent.
> The support provided considers both to be actually the same so there is no
> distinction between the two. If none is available (there is no backing st=
ore
> for given memory) both will result in Data Cache Clean up to the point of
> coherency. Otherwise sync for the specified range shall be performed.
>
> Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
> ---
>  linux-user/elfload.c       | 18 +++++++++++++++++-

There are conflicts from the recent elfload.c tweaks to fix on your next re=
base.

>  target/arm/cpu.h           | 13 ++++++++++++-
>  target/arm/cpu64.c         |  1 +
>  target/arm/helper.c        | 24 ++++++++++++++++++++++++
>  target/arm/helper.h        |  1 +
>  target/arm/op_helper.c     | 36 ++++++++++++++++++++++++++++++++++++
>  target/arm/translate-a64.c |  5 +++++
>  7 files changed, 96 insertions(+), 2 deletions(-)
>
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 3365e192eb..1ec00308d5 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -609,7 +609,12 @@ enum {
>      ARM_HWCAP_A64_PACG          =3D 1UL << 31,
>  };
>
> +enum {
> +    ARM_HWCAP2_A64_DCPODP   =3D 1 << 0,
> +};
> +
>  #define ELF_HWCAP get_elf_hwcap()
> +#define ELF_HWCAP2 get_elf_hwcap2()
>
>  static uint32_t get_elf_hwcap(void)
>  {
> @@ -644,12 +649,23 @@ static uint32_t get_elf_hwcap(void)
>      GET_FEATURE_ID(aa64_jscvt, ARM_HWCAP_A64_JSCVT);
>      GET_FEATURE_ID(aa64_sb, ARM_HWCAP_A64_SB);
>      GET_FEATURE_ID(aa64_condm_4, ARM_HWCAP_A64_FLAGM);
> +    GET_FEATURE_ID(aa64_dcpop, ARM_HWCAP_A64_DCPOP);
>
> -#undef GET_FEATURE_ID
>
>      return hwcaps;
>  }
>
> +static uint32_t get_elf_hwcap2(void)
> +{
> +    ARMCPU *cpu =3D ARM_CPU(thread_cpu);
> +    uint32_t hwcaps =3D 0;
> +
> +    GET_FEATURE_ID(aa64_dcpodp, ARM_HWCAP2_A64_DCPODP);
> +    return hwcaps;
> +}
> +
> +#undef GET_FEATURE_ID
> +
>  #endif /* not TARGET_AARCH64 */
>  #endif /* TARGET_ARM */
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 297ad5e47a..1713d76590 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2229,7 +2229,8 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpr=
egid)
>  #define ARM_CP_NZCV              (ARM_CP_SPECIAL | 0x0300)
>  #define ARM_CP_CURRENTEL         (ARM_CP_SPECIAL | 0x0400)
>  #define ARM_CP_DC_ZVA            (ARM_CP_SPECIAL | 0x0500)
> -#define ARM_LAST_SPECIAL         ARM_CP_DC_ZVA
> +#define ARM_CP_DC_CVAP           (ARM_CP_SPECIAL | 0x0600)
> +#define ARM_LAST_SPECIAL         ARM_CP_DC_CVAP
>  #define ARM_CP_FPU               0x1000
>  #define ARM_CP_SVE               0x2000
>  #define ARM_CP_NO_GDB            0x4000
> @@ -3572,6 +3573,16 @@ static inline bool isar_feature_aa64_frint(const A=
RMISARegisters *id)
>      return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, FRINTTS) !=3D 0;
>  }
>
> +static inline bool isar_feature_aa64_dcpop(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, DPB) !=3D 0;
> +}
> +
> +static inline bool isar_feature_aa64_dcpodp(const ARMISARegisters *id)
> +{
> +    return (FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, DPB) >> 1) !=3D 0;
> +}
> +
>  static inline bool isar_feature_aa64_fp16(const ARMISARegisters *id)
>  {
>      /* We always set the AdvSIMD and FP fields identically wrt FP16.  */
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index d7f5bf610a..20094f980d 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -331,6 +331,7 @@ static void aarch64_max_initfn(Object *obj)
>          cpu->isar.id_aa64isar0 =3D t;
>
>          t =3D cpu->isar.id_aa64isar1;
> +        t =3D FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);
>          t =3D FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 1);
>          t =3D FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);
>          t =3D FIELD_DP64(t, ID_AA64ISAR1, APA, 1); /* PAuth, architected=
 only */
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 507026c915..99ae01b7e7 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3843,6 +3843,22 @@ static CPAccessResult aa64_cacheop_access(CPUARMSt=
ate *env,
>      return CP_ACCESS_OK;
>  }
>
> +static CPAccessResult aa64_cacheop_persist_access(CPUARMState *env,
> +                                                  const ARMCPRegInfo *ri,
> +                                                  bool isread)
> +{
> +    ARMCPU *cpu =3D env_archcpu(env);
> +    /*
> +     * Access is UNDEF if lacking implementation for either DC CVAP or D=
C CVADP
> +     * DC CVAP ->  CRm: 0xc
> +     * DC CVADP -> CRm: 0xd
> +     */
> +    return (ri->crm =3D=3D 0xc && !cpu_isar_feature(aa64_dcpop, cpu)) ||
> +           (ri->crm =3D=3D 0xd && !cpu_isar_feature(aa64_dcpodp, cpu))
> +           ? CP_ACCESS_TRAP_UNCATEGORIZED
> +           : aa64_cacheop_access(env, ri, isread);
> +}
> +
>  /* See: D4.7.2 TLB maintenance requirements and the TLB maintenance inst=
ructions
>   * Page D4-1736 (DDI0487A.b)
>   */
> @@ -4251,6 +4267,14 @@ static const ARMCPRegInfo v8_cp_reginfo[] =3D {
>        .opc0 =3D 1, .opc1 =3D 3, .crn =3D 7, .crm =3D 10, .opc2 =3D 1,
>        .access =3D PL0_W, .type =3D ARM_CP_NOP,
>        .accessfn =3D aa64_cacheop_access },
> +    { .name =3D "DC_CVAP", .state =3D ARM_CP_STATE_AA64,
> +      .opc0 =3D 1, .opc1 =3D 3, .crn =3D 7, .crm =3D 12, .opc2 =3D 1,
> +      .access =3D PL0_W, .type =3D ARM_CP_DC_CVAP,
> +      .accessfn =3D aa64_cacheop_persist_access },
> +    { .name =3D "DC_CVADP", .state =3D ARM_CP_STATE_AA64,
> +      .opc0 =3D 1, .opc1 =3D 3, .crn =3D 7, .crm =3D 13, .opc2 =3D 1,
> +      .access =3D PL0_W, .type =3D ARM_CP_DC_CVAP,
> +      .accessfn =3D aa64_cacheop_persist_access },
>      { .name =3D "DC_CSW", .state =3D ARM_CP_STATE_AA64,
>        .opc0 =3D 1, .opc1 =3D 0, .crn =3D 7, .crm =3D 10, .opc2 =3D 2,
>        .access =3D PL1_W, .type =3D ARM_CP_NOP },
> diff --git a/target/arm/helper.h b/target/arm/helper.h
> index 1fb2cb5a77..a850364944 100644
> --- a/target/arm/helper.h
> +++ b/target/arm/helper.h
> @@ -561,6 +561,7 @@ DEF_HELPER_FLAGS_3(crypto_sm4ekey, TCG_CALL_NO_RWG, v=
oid, ptr, ptr, ptr)
>  DEF_HELPER_FLAGS_3(crc32, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
>  DEF_HELPER_FLAGS_3(crc32c, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
>  DEF_HELPER_2(dc_zva, void, env, i64)
> +DEF_HELPER_2(dc_cvap, void, env, i64)
>
>  DEF_HELPER_FLAGS_2(neon_pmull_64_lo, TCG_CALL_NO_RWG_SE, i64, i64, i64)
>  DEF_HELPER_FLAGS_2(neon_pmull_64_hi, TCG_CALL_NO_RWG_SE, i64, i64, i64)
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index 0fd4bd0238..75ebf6afa4 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -987,3 +987,39 @@ void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr=
_in)
>      memset(g2h(vaddr), 0, blocklen);
>  #endif
>  }
> +
> +void HELPER(dc_cvap)(CPUARMState *env, uint64_t vaddr_in)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    ARMCPU *cpu =3D env_archcpu(env);
> +    /* CTR_EL0 System register -> DminLine, bits [19:16] */
> +    uint64_t dline_size =3D 4 << ((cpu->ctr >> 16) & 0xF);
> +    uint64_t vaddr =3D vaddr_in & ~(dline_size - 1);
> +    void *haddr;
> +    int mem_idx =3D cpu_mmu_index(env, false);
> +
> +    /* This won't be crossing page boundaries */
> +    haddr =3D probe_read(env, vaddr, dline_size, mem_idx, GETPC());
> +    if (haddr) {
> +
> +        ram_addr_t offset;
> +        MemoryRegion *mr;
> +
> +        /*
> +         * RCU critical section + ref counting,
> +         * so that MR won't disappear behind the scene
> +         */
> +        rcu_read_lock();
> +        mr =3D memory_region_from_host(haddr, &offset);
> +        if (mr) {
> +            memory_region_ref(mr);
> +        }
> +        rcu_read_unlock();
> +
> +        if (mr) {
> +            memory_region_do_writeback(mr, offset, dline_size);
> +            memory_region_unref(mr);
> +        }
> +    }
> +#endif
> +}
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 2d6cd09634..21ea3631d6 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -1746,6 +1746,11 @@ static void handle_sys(DisasContext *s, uint32_t i=
nsn, bool isread,
>          tcg_rt =3D cpu_reg(s, rt);
>          gen_helper_dc_zva(cpu_env, tcg_rt);
>          return;
> +    case ARM_CP_DC_CVAP:
> +        /* DC CVAP / DC CVADP */
> +        tcg_rt =3D cpu_reg(s, rt);
> +        gen_helper_dc_cvap(cpu_env, tcg_rt);
> +        return;
>      default:
>          break;
>      }


--
Alex Benn=C3=A9e

