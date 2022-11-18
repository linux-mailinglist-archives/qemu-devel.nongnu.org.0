Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F183062F69A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 14:53:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow1nI-0004oj-O8; Fri, 18 Nov 2022 08:52:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow1nC-0004jX-Na
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 08:52:31 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow1n9-0004y4-RX
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 08:52:30 -0500
Received: by mail-pl1-x630.google.com with SMTP id g10so4582199plo.11
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 05:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/x2PHD/c4i7TQbkDHyGfhn18RTpBcpNMyeMfPPSlLPs=;
 b=iPWbDwiXW1WqW1T/l1L09tY573OqR4RHZFC8QvYFNMvDwICYisBo9lqWbglwdrEZzT
 Wx4siQl0AhxGu0agu7vZYfy4raDKBPO0SAp+NbVIta6ea22ZxOFxTEOQzC1GQWjDpBSe
 p6nTO4OBaDE7XHEd/4rDyG3AxQB1+r2koOq9+95zrvqtDyAsMUi3kspAQJQWgPYW8JOs
 huV4GfkQ+TQS9PcPKuqyk2kWzdmnh1x86/HugLxj4sZAcjQkKBGz5K32tEwag7KDl3CU
 MuU62w80Unet2+6k6ygE7e7hrGG7IkAHOav+nRzwl/Y+6yUWl3Tfk7ULWgAZ22BZNczl
 vrEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/x2PHD/c4i7TQbkDHyGfhn18RTpBcpNMyeMfPPSlLPs=;
 b=BlmgQKRZsdIdpBl6OH9gOdYFM0P/+iPzaxDfxnBW1kL4qlDJ2Z3hDx0uRH5QL35HRt
 fde2dioEfTK8cIXqn7DtCThQByYCxWZZ3qC5X/MVy2xvIX98mAKIKUWNb8X2qL0pAOCp
 tr7PmI6GxtmoilhN5Jw1dKMl4qH1KXHuskYuljYlMWSOm6d8f1E/lrW7sxZzWbZS/0vc
 kWHKt5hR/9eZ6F4/sash3YbdP9l3qH/lLLWNlyMyn7qR7o4owtxd9kfP1fyfE4j948MV
 ttu79pOQWGtwm4IS735/+Dast7mfS9DwRHHhQATaTtr6m0nN0/+um9ONp7UFsYyOPYVk
 v0iw==
X-Gm-Message-State: ANoB5pk9i/XzfrsQniV9u2GJwZ2yXzg+1Ib2uMGdHjIoT5Gvn/o5tGVK
 xB/McdaVrRbrSLwqSDiZbuu++FAdVtjhSzyQSOHDfQ==
X-Google-Smtp-Source: AA0mqf7zy8XVPfipU/gR4TIiW3uEgXgvEV0k4V5LEFFGWpdpKwA/nkz4Bc2l8j5ac+xJGAM/IpQE4RgqXLkcV4WAZu8=
X-Received: by 2002:a17:902:f10c:b0:186:9295:2012 with SMTP id
 e12-20020a170902f10c00b0018692952012mr7606437plb.19.1668779545176; Fri, 18
 Nov 2022 05:52:25 -0800 (PST)
MIME-Version: 1.0
References: <20221023153659.121138-1-tobias.roehmel@rwth-aachen.de>
 <20221023153659.121138-6-tobias.roehmel@rwth-aachen.de>
In-Reply-To: <20221023153659.121138-6-tobias.roehmel@rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Nov 2022 13:52:13 +0000
Message-ID: <CAFEAcA-D6V7Cm310J4Xa7XykE+VU7buRmh7TP-+5wMJN86QWOA@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] target/arm: Add PMSAv8r registers
To: tobias.roehmel@rwth-aachen.de
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 23 Oct 2022 at 16:37, <tobias.roehmel@rwth-aachen.de> wrote:
>
> From: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
>
> Signed-off-by: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>

This patch is basically the right shape, but there's a big
simplification you can make and then a bunch of minor tweaks.

> ---
>  target/arm/cpu.c     |  26 +++-
>  target/arm/cpu.h     |  12 ++
>  target/arm/helper.c  | 290 +++++++++++++++++++++++++++++++++++++++++++
>  target/arm/machine.c |  28 +++++
>  target/arm/ptw.c     |   9 +-
>  5 files changed, 363 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index b642749d6d..468150ad6c 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -463,6 +463,16 @@ static void arm_cpu_reset(DeviceState *dev)
>                         sizeof(*env->pmsav7.dracr) * cpu->pmsav7_dregion)=
;
>              }
>          }
> +
> +        if (cpu->pmsav8r_hdregion > 0) {
> +            memset(env->pmsav8.hprbar[M_REG_NS], 0,
> +                sizeof(*env->pmsav8.hprbar[M_REG_NS])
> +                * cpu->pmsav8r_hdregion);
> +            memset(env->pmsav8.hprlar[M_REG_NS], 0,
> +                sizeof(*env->pmsav8.hprlar[M_REG_NS])
> +                * cpu->pmsav8r_hdregion);
> +        }
> +
>          env->pmsav7.rnr[M_REG_NS] =3D 0;
>          env->pmsav7.rnr[M_REG_S] =3D 0;
>          env->pmsav8.mair0[M_REG_NS] =3D 0;
> @@ -1965,8 +1975,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>       */
>      if (!cpu->has_mpu) {
>          cpu->pmsav7_dregion =3D 0;
> +        cpu->pmsav8r_hdregion =3D 0;
>      }
> -    if (cpu->pmsav7_dregion =3D=3D 0) {
> +    if ((cpu->pmsav7_dregion =3D=3D 0) && (cpu->pmsav8r_hdregion =3D=3D =
0)) {
>          cpu->has_mpu =3D false;
>      }
>
> @@ -1994,6 +2005,19 @@ static void arm_cpu_realizefn(DeviceState *dev, Er=
ror **errp)
>                  env->pmsav7.dracr =3D g_new0(uint32_t, nr);
>              }
>          }
> +
> +        if (cpu->pmsav8r_hdregion > 0xFF) {
> +            error_setg(errp, "PMSAv8 MPU EL2 #regions invalid %" PRIu32,
> +                              cpu->pmsav8r_hdregion);
> +            return;
> +        }
> +
> +        if (cpu->pmsav8r_hdregion) {
> +            env->pmsav8.hprbar[M_REG_NS] =3D g_new0(uint32_t,
> +                                            cpu->pmsav8r_hdregion);
> +            env->pmsav8.hprlar[M_REG_NS] =3D g_new0(uint32_t,
> +                                            cpu->pmsav8r_hdregion);
> +        }
>      }
>
>      if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 429ed42eec..1bb3c24db1 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -307,6 +307,13 @@ typedef struct CPUArchState {
>              };
>              uint64_t sctlr_el[4];
>          };
> +        union { /* Virtualization System control register. */
> +            struct {
> +                uint32_t vsctlr_ns;
> +                uint32_t vsctlr_s;
> +            };
> +            uint32_t vsctlr_el[2];
> +        };

v8R only has a single security state, so you don't need to make this
a union or have _ns and _s versions, you can just have a single field.
We should make the field a uint64_t because this register in
PMSAv8-64 is 64 bits, and having the field be 64 bits to start with will
make life slightly easier if we need to implement that in future. So

  uint64_t vsctlr;

>          uint64_t cpacr_el1; /* Architectural feature access control regi=
ster */
>          uint64_t cptr_el[4];  /* ARMv8 feature trap registers */
>          uint32_t c1_xscaleauxcr; /* XScale auxiliary control register.  =
*/
> @@ -740,8 +747,11 @@ typedef struct CPUArchState {
>           */
>          uint32_t *rbar[M_REG_NUM_BANKS];
>          uint32_t *rlar[M_REG_NUM_BANKS];
> +        uint32_t *hprbar[M_REG_NUM_BANKS];
> +        uint32_t *hprlar[M_REG_NUM_BANKS];

These don't need to be arrays, so just
  uint32_t *hprbar;
  uint32_t *hprlar;

(PMSAv8-64 also has these as 64-bit registers, but that is also true
of the existing rbar/rlar. So I think on balance it's better to
keep hprbar/hprlar the same length as rbar/rlar, and if we ever
implement PMSAv8-64 we'll have to sort out extending the length
of both sets of registers at the same time.)

>          uint32_t mair0[M_REG_NUM_BANKS];
>          uint32_t mair1[M_REG_NUM_BANKS];
> +        uint32_t hprselr[M_REG_NUM_BANKS];

Similarly this can just be
 uint32_t hprselr;

>      } pmsav8;
>
>      /* v8M SAU */
> @@ -901,6 +911,8 @@ struct ArchCPU {
>      bool has_mpu;
>      /* PMSAv7 MPU number of supported regions */
>      uint32_t pmsav7_dregion;
> +    /* PMSAv8 MPU number of supported hyp regions */
> +    uint32_t pmsav8r_hdregion;
>      /* v8M SAU number of supported regions */
>      uint32_t sau_sregion;
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 2e9e420d4e..6a27a618bc 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3607,6 +3607,215 @@ static void pmsav7_rgnr_write(CPUARMState *env, c=
onst ARMCPRegInfo *ri,
>      raw_write(env, ri, value);
>  }
>
> +static void prbar_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                          uint64_t value)
> +{
> +    ARMCPU *cpu =3D env_archcpu(env);
> +
> +    tlb_flush(CPU(cpu)); /* Mappings may have changed - purge! */
> +    env->pmsav8.rbar[M_REG_NS][env->pmsav7.rnr[M_REG_NS]] =3D value;
> +}
> +
> +static uint64_t prbar_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    return env->pmsav8.rbar[M_REG_NS][env->pmsav7.rnr[M_REG_NS]];
> +}
> +
> +static void prlar_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                          uint64_t value)
> +{
> +    ARMCPU *cpu =3D env_archcpu(env);
> +
> +    tlb_flush(CPU(cpu)); /* Mappings may have changed - purge! */
> +    env->pmsav8.rlar[M_REG_NS][env->pmsav7.rnr[M_REG_NS]] =3D value;
> +}
> +
> +static uint64_t prlar_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    return env->pmsav8.rlar[M_REG_NS][env->pmsav7.rnr[M_REG_NS]];
> +}
> +
> +static void prselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                           uint64_t value)
> +{
> +    ARMCPU *cpu =3D env_archcpu(env);
> +
> +    /* Ignore writes that would select not implemented region */

It's worth mentioning that this is architecturally UNPREDICTABLE.

> +    if (value >=3D cpu->pmsav7_dregion) {
> +        return;
> +    }
> +
> +    env->pmsav7.rnr[M_REG_NS] =3D value;
> +}
> +
> +static void hprbar_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                          uint64_t value)
> +{
> +    ARMCPU *cpu =3D env_archcpu(env);
> +
> +    tlb_flush(CPU(cpu)); /* Mappings may have changed - purge! */
> +    env->pmsav8.hprbar[M_REG_NS][env->pmsav8.hprselr[M_REG_NS]] =3D valu=
e;
> +}
> +
> +static uint64_t hprbar_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    return env->pmsav8.hprbar[M_REG_NS][env->pmsav8.hprselr[M_REG_NS]];
> +}
> +
> +static void hprlar_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                          uint64_t value)
> +{
> +    ARMCPU *cpu =3D env_archcpu(env);
> +
> +    tlb_flush(CPU(cpu)); /* Mappings may have changed - purge! */
> +    env->pmsav8.hprlar[M_REG_NS][env->pmsav8.hprselr[M_REG_NS]] =3D valu=
e;
> +}
> +
> +static uint64_t hprlar_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    return env->pmsav8.hprlar[M_REG_NS][env->pmsav8.hprselr[M_REG_NS]];
> +}
> +
> +static void hprenr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                          uint64_t value)
> +{
> +    uint32_t n;
> +    uint32_t bit;
> +    ARMCPU *cpu =3D env_archcpu(env);
> +
> +    /* Ignore writes to unimplemented regions */
> +    value &=3D (1 << cpu->pmsav8r_hdregion) - 1;

This is undefined behaviour if cpu->pmsav8r_hdregion is greater than 31.

I suggest defining a local variable
 int rmax =3D MIN(cpu->pmsav8r_hdregion, 32);

Then you can do
   value &=3D MAKE_64BIT_MASK(0, rmax);

> +
> +    tlb_flush(CPU(cpu)); /* Mappings may have changed - purge! */
> +
> +    /* Register alias is only valid for first 32 indexes */
> +    for (n =3D 0; n < (cpu->pmsav8r_hdregion & 0x1F); ++n) {

This isn't the right boundary -- for instance if pmsav8r_hdregion
is 33 then this will only set bit 0. If you take my suggestion
above then you can just use 'rmax' as the upper bound.

> +        bit =3D extract32(value, n, 1);
> +        env->pmsav8.hprlar[M_REG_NS][n] =3D deposit32(
> +                    env->pmsav8.hprlar[M_REG_NS][n], 0, 1, bit);
> +    }
> +}
> +
> +static uint64_t hprenr_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    uint32_t n;
> +    uint32_t result =3D 0x0;
> +    ARMCPU *cpu =3D env_archcpu(env);
> +
> +    /* Register alias is only valid for first 32 indexes */
> +    for (n =3D 0; n < (cpu->pmsav8r_hdregion & 0x1F); ++n) {

Same remark as above about the upper bound.

> +        if (env->pmsav8.hprlar[M_REG_NS][n] & 0x1) {
> +            result |=3D (0x1 << n);
> +        }
> +    }
> +    return result;
> +}
> +
> +static void hprselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                           uint64_t value)
> +{
> +    ARMCPU *cpu =3D env_archcpu(env);
> +
> +    /* Ignore writes that would select not implemented region */
> +    if (value >=3D cpu->pmsav8r_hdregion) {
> +        return;
> +    }
> +
> +    env->pmsav8.hprselr[M_REG_NS] =3D value;
> +}
> +
> +static void pmsav8r_regn_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                          uint64_t value)
> +{
> +    ARMCPU *cpu =3D env_archcpu(env);
> +    uint8_t index =3D (ri->crm & 0b111) << 1;
> +    index |=3D (ri->opc2 & 1 << 2) >> 2;

This is missing the 5th bit of index, which is in opc0 bit 0.

I would suggest

 index =3D (extract32(ri->opc0, 0, 1) << 4) | (extract32(ri->crm, 0, 3)
<< 1) | extract32(ri->opc2, 2, 1);



> +    tlb_flush(CPU(cpu)); /* Mappings may have changed - purge! */
> +
> +    if (ri->opc1 =3D=3D 4) {

This should be checking (ri->opc1 & 2).

> +        if (index >=3D cpu->pmsav8r_hdregion) {
> +            return;
> +        }
> +        if (ri->opc2 & 0x1) {
> +            env->pmsav8.hprlar[M_REG_NS][index] =3D value;
> +        } else {
> +            env->pmsav8.hprbar[M_REG_NS][index] =3D value;
> +        }
> +    } else {
> +        if (index >=3D cpu->pmsav7_dregion) {
> +            return;
> +        }
> +        if (ri->opc2 & 0x1) {
> +            env->pmsav8.rlar[M_REG_NS][index] =3D value;
> +        } else {
> +            env->pmsav8.rbar[M_REG_NS][index] =3D value;
> +        }
> +    }
> +}
> +
> +static uint64_t pmsav8r_regn_read(CPUARMState *env, const ARMCPRegInfo *=
ri)
> +{
> +    ARMCPU *cpu =3D env_archcpu(env);
> +    uint8_t index =3D (ri->crm & 0b111) << 1;
> +    index |=3D (ri->opc2 & 1 << 2) >> 2;

Same remarks apply to this function as above.

> +
> +    if (ri->opc1 =3D=3D 4) {
> +        if (index >=3D cpu->pmsav8r_hdregion) {
> +            return 0x0;
> +        }
> +        if (ri->opc2 & 0x1) {
> +            return env->pmsav8.hprlar[M_REG_NS][index];
> +        } else {
> +            return env->pmsav8.hprbar[M_REG_NS][index];
> +        }
> +    } else {
> +        if (index >=3D cpu->pmsav7_dregion) {
> +            return 0x0;
> +        }
> +        if (ri->opc2 & 0x1) {
> +            return env->pmsav8.rlar[M_REG_NS][index];
> +        } else {
> +            return env->pmsav8.rbar[M_REG_NS][index];
> +        }
> +    }
> +}
> +
> +static const ARMCPRegInfo pmsav8r_cp_reginfo[] =3D {
> +    { .name =3D "PRBAR",
> +        .cp =3D 15, .opc1 =3D 0, .crn =3D 6, .crm =3D 3, .opc2 =3D 0,

Indent here seems odd (even by the ad-hoc standards we apply
to cpreginfo array declarations): generally we make all the '.'s line up.

> +        .access =3D PL1_RW, .type =3D ARM_CP_ALIAS,
> +        .accessfn =3D access_tvm_trvm,
> +        .readfn =3D prbar_read, .writefn =3D prbar_write},

We generally put a space before the closing } on this kind of line.

> +    { .name =3D "PRLAR",
> +        .cp =3D 15, .opc1 =3D 0, .crn =3D 6, .crm =3D 3, .opc2 =3D 1,
> +        .access =3D PL1_RW, .type =3D ARM_CP_ALIAS,
> +        .accessfn =3D access_tvm_trvm,
> +        .readfn =3D prlar_read, .writefn =3D prlar_write},

These two should be .type =3D ARM_CP_NO_RAW

> +    { .name =3D "PRSELR", .resetvalue =3D 0,
> +        .cp =3D 15, .opc1 =3D 0, .crn =3D 6, .crm =3D 2, .opc2 =3D 1,
> +        .access =3D PL1_RW, .accessfn =3D access_tvm_trvm,
> +        .writefn =3D prselr_write,
> +        .fieldoffset =3D offsetof(CPUARMState, pmsav7.rnr[M_REG_NS])},
> +    { .name =3D "HPRBAR", .resetvalue =3D 0,
> +        .cp =3D 15, .opc1 =3D 4, .crn =3D 6, .crm =3D 3, .opc2 =3D 0,
> +        .access =3D PL2_RW, .type =3D ARM_CP_ALIAS,
> +        .readfn =3D hprbar_read, .writefn =3D hprbar_write},
> +    { .name =3D "HPRLAR",
> +        .cp =3D 15, .opc1 =3D 4, .crn =3D 6, .crm =3D 3, .opc2 =3D 1,
> +        .access =3D PL2_RW, .type =3D ARM_CP_ALIAS,
> +        .readfn =3D hprlar_read, .writefn =3D hprlar_write},

These two also should be ARM_CP_NO_RAW

> +    { .name =3D "HPRSELR", .resetvalue =3D 0,
> +        .cp =3D 15, .opc1 =3D 4, .crn =3D 6, .crm =3D 2, .opc2 =3D 1,
> +        .access =3D PL2_RW,
> +        .writefn =3D hprselr_write,
> +        .fieldoffset =3D offsetof(CPUARMState, pmsav8.hprselr[M_REG_NS])=
},
> +    { .name =3D "HPRENR",
> +        .cp =3D 15, .opc1 =3D 4, .crn =3D 6, .crm =3D 1, .opc2 =3D 1,
> +        .access =3D PL2_RW, .type =3D ARM_CP_ALIAS,
> +        .readfn =3D hprenr_read, .writefn =3D hprenr_write},
> +};
> +
>  static const ARMCPRegInfo pmsav7_cp_reginfo[] =3D {
>      /* Reset for all these registers is handled in arm_cpu_reset(),
>       * because the PMSAv7 is also used by M-profile CPUs, which do
> @@ -8079,6 +8288,13 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .access =3D PL1_R, .type =3D ARM_CP_CONST,
>                .resetvalue =3D cpu->pmsav7_dregion << 8
>          };
> +        /* HMPUIR is specific to PMSA V8 */
> +        ARMCPRegInfo id_hmpuir_reginfo =3D {
> +            .name =3D "HMPUIR",
> +            .cp =3D 15, .crn =3D 0, .crm =3D 0, .opc1 =3D 4, .opc2 =3D 4=
,

Prefer the order cp, opc1, crn, crm, opc2

> +            .access =3D PL2_R, .type =3D ARM_CP_CONST,
> +            .resetvalue =3D cpu->pmsav8r_hdregion
> +        };
>          static const ARMCPRegInfo crn0_wi_reginfo =3D {
>              .name =3D "CRN0_WI", .cp =3D 15, .crn =3D 0, .crm =3D CP_ANY=
,
>              .opc1 =3D CP_ANY, .opc2 =3D CP_ANY, .access =3D PL1_W,
> @@ -8122,6 +8338,67 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>          define_arm_cp_regs(cpu, id_cp_reginfo);
>          if (!arm_feature(env, ARM_FEATURE_PMSA)) {
>              define_one_arm_cp_reg(cpu, &id_tlbtr_reginfo);
> +        } else if (arm_feature(env, ARM_FEATURE_PMSA)
> +              && !arm_feature(env, ARM_FEATURE_M)

M-profile is checked for at the top of the function and it returns
early and never gets to this code, so you can skip this test.

> +               && arm_feature(env, ARM_FEATURE_V8)) {
> +            uint32_t i =3D 0;
> +            g_autofree char *tmp_string;
> +
> +            define_one_arm_cp_reg(cpu, &id_mpuir_reginfo);
> +            define_one_arm_cp_reg(cpu, &id_hmpuir_reginfo);
> +            define_arm_cp_regs(cpu, pmsav8r_cp_reginfo);
> +
> +            /* Register alias is only valid for first 32 indexes */
> +            for (i =3D 0; i < (cpu->pmsav7_dregion & 0x1F); ++i) {

Bad upper index again.

> +                uint8_t crm =3D 0b1000 | ((i & 0b1110) >> 1);
> +                uint8_t opc2 =3D (i & 0x1) << 2;

Doesn't handle the 5th bit in the index (the one that ends up in opc1).

> +
> +                tmp_string =3D g_strdup_printf("PRBAR%u", i);
> +                ARMCPRegInfo tmp_prbarn_reginfo =3D {
> +                    .name =3D tmp_string, .type =3D ARM_CP_ALIAS,

ARM_CP_NO_RAW

> +                    .cp =3D 15, .opc1 =3D 0, .crn =3D 6, .crm =3D crm, .=
opc2 =3D opc2,
> +                    .access =3D PL1_RW, .resetvalue =3D 0,
> +                    .accessfn =3D access_tvm_trvm,
> +                    .writefn =3D pmsav8r_regn_write, .readfn =3D pmsav8r=
_regn_read
> +                };
> +                define_one_arm_cp_reg(cpu, &tmp_prbarn_reginfo);
> +
> +                opc2 =3D (i & 0x1) << 2 | 0x1;
> +                tmp_string =3D g_strdup_printf("PRLAR%u", i);

If you're going to use g_autofree, you can't reuse the same variable
for a new string allocation -- this leaks the first string when we
assign to tmp_string again. You need to use separate variables so
that both allocations are auto-freed when they go out of scope.

> +                ARMCPRegInfo tmp_prlarn_reginfo =3D {
> +                    .name =3D tmp_string, .type =3D ARM_CP_ALIAS,

ARM_CP_NO_RAW

> +                    .cp =3D 15, .opc1 =3D 0, .crn =3D 6, .crm =3D crm, .=
opc2 =3D opc2,
> +                    .access =3D PL1_RW, .resetvalue =3D 0,
> +                    .accessfn =3D access_tvm_trvm,
> +                    .writefn =3D pmsav8r_regn_write, .readfn =3D pmsav8r=
_regn_read
> +                };
> +                define_one_arm_cp_reg(cpu, &tmp_prlarn_reginfo);
> +            }
> +
> +            /* Register alias is only valid for first 32 indexes */
> +            for (i =3D 0; i < (cpu->pmsav8r_hdregion & 0x1F); ++i) {
> +                uint8_t crm =3D 0b1000 | ((i & 0b1110) >> 1);
> +                uint8_t opc2 =3D (i & 0x1) << 2;

Same comments for the first loop all apply to this loop.

> +
> +                tmp_string =3D g_strdup_printf("HPRBAR%u", i);
> +                ARMCPRegInfo tmp_hprbarn_reginfo =3D {
> +                    .name =3D tmp_string, .type =3D ARM_CP_ALIAS,
> +                    .cp =3D 15, .opc1 =3D 4, .crn =3D 6, .crm =3D crm, .=
opc2 =3D opc2,
> +                    .access =3D PL2_RW, .resetvalue =3D 0,
> +                    .writefn =3D pmsav8r_regn_write, .readfn =3D pmsav8r=
_regn_read
> +                };
> +                define_one_arm_cp_reg(cpu, &tmp_hprbarn_reginfo);
> +
> +                opc2 =3D (i & 0x1) << 2 | 0x1;
> +                tmp_string =3D g_strdup_printf("HPRLAR%u", i);
> +                ARMCPRegInfo tmp_hprlarn_reginfo =3D {
> +                    .name =3D tmp_string, .type =3D ARM_CP_ALIAS,
> +                    .cp =3D 15, .opc1 =3D 4, .crn =3D 6, .crm =3D crm, .=
opc2 =3D opc2,
> +                    .access =3D PL2_RW, .resetvalue =3D 0,
> +                    .writefn =3D pmsav8r_regn_write, .readfn =3D pmsav8r=
_regn_read
> +                };
> +                define_one_arm_cp_reg(cpu, &tmp_hprlarn_reginfo);
> +            }
>          } else if (arm_feature(env, ARM_FEATURE_V7)) {
>              define_one_arm_cp_reg(cpu, &id_mpuir_reginfo);
>          }
> @@ -8243,6 +8520,19 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>              sctlr.type |=3D ARM_CP_SUPPRESS_TB_END;
>          }
>          define_one_arm_cp_reg(cpu, &sctlr);
> +
> +        if (arm_feature(env, ARM_FEATURE_PMSA)
> +            && !arm_feature(env, ARM_FEATURE_M)

Don't need to check for not-M.

> +            && arm_feature(env, ARM_FEATURE_V8)) {
> +            ARMCPRegInfo vsctlr =3D {
> +                .name =3D "VSCTLR", .state =3D ARM_CP_STATE_AA32,
> +                .cp =3D 15, .opc1 =3D 4, .crn =3D 2, .crm =3D 0, .opc2 =
=3D 0,
> +                .access =3D PL2_RW, .resetvalue =3D 0x0,
> +                .bank_fieldoffsets =3D { offsetof(CPUARMState, cp15.vsct=
lr_s),
> +                                    offsetof(CPUARMState, cp15.vsctlr_ns=
) },

This will get simpler when you aren't trying to describe it as
a banked register. Note that if you make the field a uint64_t
as I suggest above then you will want to use offsetoflow32()
rather than plain offsetof() (so that on a big-endian host the
field offset is pointed to the high half of the uint64_t.)

> +            };
> +            define_one_arm_cp_reg(cpu, &vsctlr);
> +        }
>      }
>
>      if (cpu_isar_feature(aa64_lor, cpu)) {
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index 54c5c62433..923da8d0bc 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -487,6 +487,30 @@ static bool pmsav8_needed(void *opaque)
>          arm_feature(env, ARM_FEATURE_V8);
>  }
>
> +static bool pmsav8r_needed(void *opaque)
> +{
> +    ARMCPU *cpu =3D opaque;
> +    CPUARMState *env =3D &cpu->env;
> +
> +    return arm_feature(env, ARM_FEATURE_PMSA) &&
> +        arm_feature(env, ARM_FEATURE_V8) &&
> +        !arm_feature(env, ARM_FEATURE_M);
> +}
> +
> +static const VMStateDescription vmstate_pmsav8r =3D {
> +    .name =3D "cpu/pmsav8/pmsav8r",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .needed =3D pmsav8r_needed,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_VARRAY_UINT32(env.pmsav8.hprbar[M_REG_NS], ARMCPU,
> +                        pmsav8r_hdregion, 0, vmstate_info_uint32, uint32=
_t),
> +        VMSTATE_VARRAY_UINT32(env.pmsav8.hprlar[M_REG_NS], ARMCPU,
> +                        pmsav8r_hdregion, 0, vmstate_info_uint32, uint32=
_t),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
>  static const VMStateDescription vmstate_pmsav8 =3D {
>      .name =3D "cpu/pmsav8",
>      .version_id =3D 1,
> @@ -500,6 +524,10 @@ static const VMStateDescription vmstate_pmsav8 =3D {
>          VMSTATE_UINT32(env.pmsav8.mair0[M_REG_NS], ARMCPU),
>          VMSTATE_UINT32(env.pmsav8.mair1[M_REG_NS], ARMCPU),
>          VMSTATE_END_OF_LIST()
> +    },
> +    .subsections =3D (const VMStateDescription * []) {
> +        &vmstate_pmsav8r,
> +        NULL
>      }
>  };

You'll need to adjust the vmstate field array a bit to allow for
hprbar and hprlar not being arrays, but otherwise the vmstate
changes look good.

> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index db50715fa7..4bd7389fa9 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1718,6 +1718,13 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t =
address,
>      bool hit =3D false;
>      uint32_t addr_page_base =3D address & TARGET_PAGE_MASK;
>      uint32_t addr_page_limit =3D addr_page_base + (TARGET_PAGE_SIZE - 1)=
;
> +    int region_counter;
> +
> +    if (regime_el(env, mmu_idx) =3D=3D 2) {
> +        region_counter =3D cpu->pmsav8r_hdregion;
> +    } else {
> +        region_counter =3D cpu->pmsav7_dregion;
> +    }
>
>      result->page_size =3D TARGET_PAGE_SIZE;
>      result->phys =3D address;
> @@ -1742,7 +1749,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t a=
ddress,
>              hit =3D true;
>          }
>
> -        for (n =3D (int)cpu->pmsav7_dregion - 1; n >=3D 0; n--) {
> +        for (n =3D region_counter - 1; n >=3D 0; n--) {
>              /* region search */
>              /*
>               * Note that the base address is bits [31:5] from the regist=
er

The changes to ptw.c here should be moved to the following patch.

thanks
-- PMM

