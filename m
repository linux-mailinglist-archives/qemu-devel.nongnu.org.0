Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2AA5EC789
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:23:02 +0200 (CEST)
Received: from localhost ([::1]:38492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odCQI-0006Vt-2e
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odAzO-0008Hu-EE
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:51:15 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:38632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odAzH-0001W5-0T
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:51:09 -0400
Received: by mail-ej1-x629.google.com with SMTP id nb11so20834537ejc.5
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 06:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=OCpsrcbN4DrHCaXpWWCuZ4eEwUJIuTCZE/fozzuu7qY=;
 b=muU87FcJ4+UHQGpe21pyeg7A5toyRtnJi77NpcWoLWScI6YXWgu7IBQ3xFQ+CNkuri
 dlIQNodi6w3YZA6NqiMwNFYm1BjBhBQfke+YPxFBZS4EINhrox/E9zxe1/IZuhkLnsTc
 4pz3QG7APZYVN4EB6NYvbb8qOYHGT5smB+bbAf9u9zY6S6ruVrUtas3isB4h6k67vErK
 0edeo6pQBbLB7B0Q3kGSQzvKx3lZpp1KjKOirdAF7Vlaxam5A9sygPR048DAUUE5uIHC
 JFQ6X/I+TxLKqNsVEZySUj1sTHzzBqNISSSY2KPS6fXTiJcJxX/A+dRWW077SmnPoiuU
 uj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=OCpsrcbN4DrHCaXpWWCuZ4eEwUJIuTCZE/fozzuu7qY=;
 b=I4A5+Kn9XP7cG1zds1g/ovsDazgrngMhwliQvTrYWp9rDex4p8Go527OTGKVhDwVDg
 IOKGZ6mwvkZnXTY36Wf0cy/lSclTD3cxakSUZNVpAq8s9jsc3sgU4KzjXsxMnO3itCao
 3lUdSe+39JuxRMjo1AaBXRaMASvgNlbWIES4tgqFOApMQUddnaFO9rMD9dV/1a/p4rMY
 RuALB/4a2095LURNMkp2hgXEgcpgwP84PZHX5bS6ZCVdZjOZcqnfB9nuHG5oDd4o65My
 S+gRlOMO7psqcIrcKGgTHX6oIxgihrQ++RBHDMJKEiDdyybTkJE3PzYpTcqbnAU7xqzM
 wU3g==
X-Gm-Message-State: ACrzQf1u6mUe5Oy9tIvuCeRw9j1easU9nD/p6SvZEo9mi/+6B+307DaQ
 5Qa+j0eEBatDdrrC/YRNTqfcLZuW0O6Fdf7CYKafzA==
X-Google-Smtp-Source: AMsMyM4rbO34OTfqAErrTzlfAQAbam3320l4SpSCqQi6zqzQ8KUxrBCv9Ay1rY8ViZrPtwLlzo0RXC7kWR9lMJyRTF8=
X-Received: by 2002:a17:907:2bd5:b0:76f:591c:466b with SMTP id
 gv21-20020a1709072bd500b0076f591c466bmr21935348ejc.504.1664286660750; Tue, 27
 Sep 2022 06:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220820141914.217399-1-tobias.roehmel@rwth-aachen.de>
 <20220820141914.217399-8-tobias.roehmel@rwth-aachen.de>
In-Reply-To: <20220820141914.217399-8-tobias.roehmel@rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Sep 2022 14:50:49 +0100
Message-ID: <CAFEAcA8o4GfuY0yB4A3FeADuyzbHdRYFL_402-RxkXBy5kh7-w@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] target/arm: Add PMSAv8r registers
To: tobias.roehmel@rwth-aachen.de
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 20 Aug 2022 at 15:19, <tobias.roehmel@rwth-aachen.de> wrote:
>
> From: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
>
> Signed-off-by: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
> ---
>  target/arm/cpu.h    |  10 +++
>  target/arm/helper.c | 171 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 181 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 86e06116a9..632d0d13c6 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -726,8 +726,18 @@ typedef struct CPUArchState {
>           */
>          uint32_t *rbar[M_REG_NUM_BANKS];
>          uint32_t *rlar[M_REG_NUM_BANKS];
> +        uint32_t prbarn[255];
> +        uint32_t prlarn[255];
> +        uint32_t hprbarn[255];
> +        uint32_t hprlarn[255];

Don't use magic constants, please. In fact, don't use
fixed size arrays at all here. The v8R PRBAR/PRLAR
register arrays are exactly the same format as the v8M
pmsav8.rbar[] and pmsav8.rlar[], so please use the same
state fields that does. (You'll need to add equivalent
new arrays to handle the HPRBAR/HPRLAR.)

>          uint32_t mair0[M_REG_NUM_BANKS];
>          uint32_t mair1[M_REG_NUM_BANKS];
> +        uint32_t prbar;
> +        uint32_t prlar;

You should not need separate prbar/prlar fields, as those
registers only indirectly access the state for thecurrently
selected region. Similarly hprbar, hprlar below.

> +        uint32_t prselr;

PRSELR is just a renamed PMSAv7 RGNR, for which we already
have a state field, pmsav7.rnr[M_REG_NS] (and indeed a cpreg
struct).

> +        uint32_t hprbar;
> +        uint32_t hprlar;
> +        uint32_t hprselr;
>      } pmsav8;

Some of this new state must be handled for migration.
Where state is directly accessed via a coprocessor
register that will be migrated for you. However, where
there is state that is not directly accessible, i.e. for
the rbar/rlar arrays, you need to add code/vmstate structs
to target/arm/machine.c to migrate them. vmstate_pmsav8
already does this for rbar and rlar, but you'll need to
add something similar for the hyp versions. (Watch out that
you maintain migration compat for the existing CPUs -- you
can't just add new fields to existing VMStateDescription
structs. Ask if you need advice.)

The arrays will also need explicit handling in reset.
Again, look at how PMSAv7 is doing it.

>      /* v8M SAU */
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 23461397e0..1730383f28 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7422,6 +7422,78 @@ static CPAccessResult access_joscr_jmcr(CPUARMStat=
e *env,
>      return CP_ACCESS_OK;
>  }
>
> +static void prbar_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                          uint64_t value)
> +{
> +    env->pmsav8.prbarn[env->pmsav8.prselr] =3D value;
> +}
> +
> +static void prlar_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                          uint64_t value)
> +{
> +    env->pmsav8.prlarn[env->pmsav8.prselr] =3D value;
> +}

For writes you will need to do some kind of tlb flush.
Compare pmsav7_write().

> +
> +static uint64_t prbar_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    return env->pmsav8.prbarn[env->pmsav8.prselr];
> +}
> +
> +static uint64_t prlar_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    return env->pmsav8.prlarn[env->pmsav8.prselr];
> +}
> +
> +static void hprbar_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                          uint64_t value)
> +{
> +    env->pmsav8.hprbarn[env->pmsav8.hprselr] =3D value;
> +}
> +
> +static void hprlar_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                          uint64_t value)
> +{
> +    env->pmsav8.hprlarn[env->pmsav8.hprselr] =3D value;
> +}
> +
> +static void hprenr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                          uint64_t value)
> +{
> +    uint32_t n;
> +    ARMCPU *cpu =3D env_archcpu(env);
> +    for (n =3D 0; n < (int)cpu->pmsav7_dregion; ++n) {

What's the cast for here ?

The architecture allows EL1 and EL2 MPUs to have different
numbers of regions, so this loop bound shouldn't be on
pmsav7_dregion, which is (I assume) the number of
EL1 MPU regions.

You need to also bound n to less than 32, to avoid
undefined behaviour.

> +        if (value & (1 << n)) {
> +            env->pmsav8.hprlarn[n] |=3D 0x1;
> +        } else {
> +            env->pmsav8.hprlarn[n] &=3D (~0x1);

Brackets unnecessary.

> +        }

Consider replacing this if() with

       bit =3D extract32(value, n, 1);
       env->pmsav8.hprlarn[n] =3D deposit32(env->pmsav8.hprlarn[n], 0, 1, b=
it);

> +    }
> +}
> +
> +static uint64_t hprbar_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    return env->pmsav8.hprbarn[env->pmsav8.hprselr];
> +}
> +
> +static uint64_t hprlar_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    return env->pmsav8.hprlarn[env->pmsav8.hprselr];
> +}
> +
> +static uint64_t hprenr_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    uint32_t n;
> +    uint32_t result =3D 0x0;
> +    ARMCPU *cpu =3D env_archcpu(env);
> +
> +    for (n =3D 0; n < (int)cpu->pmsav7_dregion; ++n) {

> +        if (env->pmsav8.hprlarn[n] & 0x1) {
> +            result |=3D (0x1 << n);
> +        }
> +    }
> +    return result;
> +}
> +
>  static const ARMCPRegInfo jazelle_regs[] =3D {
>      { .name =3D "JIDR",
>        .cp =3D 14, .crn =3D 0, .crm =3D 0, .opc1 =3D 7, .opc2 =3D 0,
> @@ -8249,6 +8321,46 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .access =3D PL1_R, .type =3D ARM_CP_CONST,
>                .resetvalue =3D cpu->pmsav7_dregion << 8
>          };
> +        /* PMSAv8-R registers*/
> +        ARMCPRegInfo id_pmsav8_r_reginfo[] =3D {
> +            { .name =3D "HMPUIR",
> +              .cp =3D 15, .crn =3D 0, .crm =3D 0, .opc1 =3D 4, .opc2 =3D=
 4,
> +              .access =3D PL2_R, .type =3D ARM_CP_CONST,
> +              .resetvalue =3D cpu->pmsav7_dregion},
> +             /* PMSAv8-R registers */
> +            { .name =3D "PRBAR",
> +              .cp =3D 15, .opc1 =3D 0, .crn =3D 6, .crm =3D 3, .opc2 =3D=
 0,
> +              .access =3D PL1_RW, .resetvalue =3D 0,
> +              .readfn =3D prbar_read, .writefn =3D prbar_write,
> +              .fieldoffset =3D offsetof(CPUARMState, pmsav8.prbar)},
> +            { .name =3D "PRLAR",
> +              .cp =3D 15, .opc1 =3D 0, .crn =3D 6, .crm =3D 3, .opc2 =3D=
 1,
> +              .access =3D PL1_RW, .resetvalue =3D 0,
> +              .readfn =3D prlar_read, .writefn =3D prlar_write,
> +              .fieldoffset =3D offsetof(CPUARMState, pmsav8.prlar)},
> +            { .name =3D "PRSELR", .resetvalue =3D 0,
> +              .cp =3D 15, .opc1 =3D 0, .crn =3D 6, .crm =3D 2, .opc2 =3D=
 1,
> +              .access =3D PL1_RW, .accessfn =3D access_tvm_trvm,
> +              .fieldoffset =3D offsetof(CPUARMState, pmsav8.prselr)},
> +            { .name =3D "HPRBAR", .resetvalue =3D 0,
> +              .readfn =3D hprbar_read, .writefn =3D hprbar_write,
> +              .cp =3D 15, .opc1 =3D 4, .crn =3D 6, .crm =3D 3, .opc2 =3D=
 0,
> +              .access =3D PL2_RW, .resetvalue =3D 0,
> +              .fieldoffset =3D offsetof(CPUARMState, pmsav8.hprbar)},
> +            { .name =3D "HPRLAR",
> +              .cp =3D 15, .opc1 =3D 4, .crn =3D 6, .crm =3D 3, .opc2 =3D=
 1,
> +              .access =3D PL2_RW, .resetvalue =3D 0,
> +              .readfn =3D hprlar_read, .writefn =3D hprlar_write,
> +              .fieldoffset =3D offsetof(CPUARMState, pmsav8.hprlar)},
> +            { .name =3D "HPRSELR", .resetvalue =3D 0,
> +              .cp =3D 15, .opc1 =3D 4, .crn =3D 6, .crm =3D 2, .opc2 =3D=
 1,
> +              .access =3D PL2_RW, .accessfn =3D access_tvm_trvm,
> +              .fieldoffset =3D offsetof(CPUARMState, pmsav8.hprselr)},
> +            { .name =3D "HPRENR",
> +              .cp =3D 15, .opc1 =3D 4, .crn =3D 6, .crm =3D 1, .opc2 =3D=
 1,
> +              .access =3D PL2_RW, .resetvalue =3D 0,
> +              .readfn =3D hprenr_read, .writefn =3D hprenr_write},
> +        };

Unless you need to write into some of the fields of this array
at runtime, make it a static const file-level global. (Compare
others, like eg pmsav7_cp_reginfo[].)

I think you are missing the VSCTLR register.

>          static const ARMCPRegInfo crn0_wi_reginfo =3D {
>              .name =3D "CRN0_WI", .cp =3D 15, .crn =3D 0, .crm =3D CP_ANY=
,
>              .opc1 =3D CP_ANY, .opc2 =3D CP_ANY, .access =3D PL1_W,
> @@ -8292,6 +8404,65 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>          define_arm_cp_regs(cpu, id_cp_reginfo);
>          if (!arm_feature(env, ARM_FEATURE_PMSA)) {
>              define_one_arm_cp_reg(cpu, &id_tlbtr_reginfo);
> +        } else if (arm_feature(env, ARM_FEATURE_V8_R)) {
> +            uint32_t i =3D 0;
> +            char hprbar_string[] =3D "HPRBAR%u";
> +            char hprlar_string[] =3D "HPRLAR%u";
> +
> +            char prbar_string[] =3D "PRBAR%u";
> +            char prlar_string[] =3D "PRLAR%u";
> +            char tmp_string[50];

Don't use fixed arrays and sprintf(), please, and don't define
the format string in a variable either. Look at eg the handling
of RES_0_C0_C%d_X -- use of g_autofree and g_strdup_printf() is
usually the clearest approach.

> +            define_one_arm_cp_reg(cpu, &id_mpuir_reginfo);
> +            define_arm_cp_regs(cpu, id_pmsav8_r_reginfo);
> +            for (i =3D 0; i < cpu->pmsav7_dregion; ++i) {

This needs to be bounded so it doesn't go above 31, because
only the first 32 regions get these aliases.

> +                uint8_t crm =3D 0b1000 | ((i & 0b1110) >> 1);
> +                uint8_t opc2 =3D (i & 0x1) << 2;
> +
> +                sprintf(tmp_string, hprbar_string, i);
> +                ARMCPRegInfo tmp_hprbarn_reginfo =3D {
> +                    .name =3D tmp_string,
> +                    .cp =3D 15, .opc1 =3D 4, .crn =3D 6, .crm =3D crm, .=
opc2 =3D opc2,
> +                    .access =3D PL2_RW, .resetvalue =3D 0,
> +                    .accessfn =3D access_tvm_trvm,
> +                    .fieldoffset =3D offsetof(CPUARMState, pmsav8.hprbar=
n)
> +                    + i * sizeof(env->pmsav8.hprbarn[0])
> +                };
> +                define_one_arm_cp_reg(cpu, &tmp_hprbarn_reginfo);
> +
> +                sprintf(tmp_string, prbar_string, i);
> +                ARMCPRegInfo tmp_prbarn_reginfo =3D {
> +                    .name =3D tmp_string,
> +                    .cp =3D 15, .opc1 =3D 0, .crn =3D 6, .crm =3D crm, .=
opc2 =3D opc2,
> +                    .access =3D PL1_RW, .resetvalue =3D 0,
> +                    .accessfn =3D access_tvm_trvm,
> +                    .fieldoffset =3D offsetof(CPUARMState, pmsav8.prbarn=
)
> +                    + i * sizeof(env->pmsav8.prbarn[0])
> +                };
> +                define_one_arm_cp_reg(cpu, &tmp_prbarn_reginfo);
> +
> +                opc2 =3D (i & 0x1) << 2 | 0x1;
> +                sprintf(tmp_string, hprlar_string, i);
> +                ARMCPRegInfo tmp_hprlarn_reginfo =3D {
> +                    .name =3D tmp_string,
> +                    .cp =3D 15, .opc1 =3D 4, .crn =3D 6, .crm =3D crm, .=
opc2 =3D opc2,
> +                    .access =3D PL2_RW, .resetvalue =3D 0,
> +                    .accessfn =3D access_tvm_trvm,
> +                    .fieldoffset =3D offsetof(CPUARMState, pmsav8.hprlar=
n)
> +                    + i * sizeof(env->pmsav8.hprlarn[0])
> +                };
> +                define_one_arm_cp_reg(cpu, &tmp_hprlarn_reginfo);
> +
> +                sprintf(tmp_string, prlar_string, i);
> +                ARMCPRegInfo tmp_prlarn_reginfo =3D {
> +                    .name =3D tmp_string,
> +                    .cp =3D 15, .opc1 =3D 0, .crn =3D 6, .crm =3D crm, .=
opc2 =3D opc2,
> +                    .access =3D PL1_RW, .resetvalue =3D 0,
> +                    .accessfn =3D access_tvm_trvm,
> +                    .fieldoffset =3D offsetof(CPUARMState, pmsav8.prlarn=
)
> +                    + i * sizeof(env->pmsav8.prlarn[0])
> +                };

These registers all need to be marked as ARM_CP_ALIAS,
because they're just aliases into a different register which is
handling the migration and reset.

> +                define_one_arm_cp_reg(cpu, &tmp_prlarn_reginfo);
> +            }
>          } else if (arm_feature(env, ARM_FEATURE_V7)) {
>              define_one_arm_cp_reg(cpu, &id_mpuir_reginfo);
>          }
> --

thanks
-- PMM

