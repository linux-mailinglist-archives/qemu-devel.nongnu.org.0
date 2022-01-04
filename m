Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5C1484123
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 12:45:56 +0100 (CET)
Received: from localhost ([::1]:51200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4iGI-0002nT-TK
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 06:45:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n4iEM-00022V-Cy
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 06:43:54 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:33589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n4iEI-0007ji-Ty
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 06:43:54 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MK3FW-1moqIe3pyI-00LW5D; Tue, 04 Jan 2022 12:43:39 +0100
Message-ID: <0065c8e8-dbdb-ea3a-b6c1-1765cf1739ca@vivier.eu>
Date: Tue, 4 Jan 2022 12:43:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/6] linux-user: Split out do_prctl and subroutines
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211227150127.2659293-1-richard.henderson@linaro.org>
 <20211227150127.2659293-2-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211227150127.2659293-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xumV9Qr/EqZKkkvvQnO+rGn8r2oCO93Kd60wMN07AiOwRBOJ++d
 i5DVFM2gBrLZEnceUKpXUwWCECYgi3O71u8TFElROrkSjTfd7RlpcuCiRAq4/h1DtSlnhoP
 AD0LWCMhZjNDj9TkIlvcbN1y01q9OXRsEB9ZuWn1kE2ZtKt+yVtLcjguaUsgz+DXVMpHADz
 iEN9cWQebO4CF48Gq9wsg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:paS377Q8MD8=:3z4J3hYof10kGiF7w2Gv6f
 mzEAy+wjZysHejny0bFpQtVAmMcEFvJRXY4BkrEmK2XSXZEBJ+x63GrtkDL/QyYualNNRuAJ5
 9hkxbYyXmN9EHlMojWGL073fxq++aCjbmh+K1cMzD/nHmpecKtU3EHgOatSKeskwJ7y6G0nu8
 jUZ2wfdI44IHJpyBnfAVRCOtpVh0NKIR2pJYW6qOkLsmaSE5WbzeCUxHm7nlCpsDcNCDbIo9+
 Xrj47v8Dhw5YLOTTlV47W3Vv0SDe90309TPxayyXw+/026YSV5fP6C5jSVr78NHA9A5/EXQD2
 wxQjim/jIGPleFXBlSpo5/+abLyzTqMG9Q0OXFG1dvUi4Fqapm2w8t2wUZJY7a17FjiDLBdCx
 esHLpjPwblTNIDQK2GYOWLj/Q3kynPl+3or0g7E0jNj2pSYus2cH68D2EKm5MA1GHyK4a6P32
 d1iv6BY7Znk3mVAiZj4c3UvGLsmMr7zkqNh9JI+fZWjQGUJG7R9bIuK2xSLXM691/6XIMYPxV
 qtTnPZ62RZOkC5KD8oFE/VTL+k83GFaQX01vU65CuNwmpqkdeLptjsrdVRGQyLTZpGIcnfWXc
 STNsg7MLC4Ct0C4AIRfPJkR2kkVpIBiB7XLeg2Rf7/Waj9QewtEunIB8voAgtZsgOKrJjq0QE
 LEFk5XejpCfM++ddsGXcpY0OoqjGunH5v0P4nec1C0B8L76ZAqnNZ5sytww2qqoKmcnU=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 27/12/2021 à 16:01, Richard Henderson a écrit :
> Since the prctl constants are supposed to be generic, supply
> any that are not provided by the host.
> 
> Split out subroutines for PR_GET_FP_MODE, PR_SET_FP_MODE,
> PR_GET_VL, PR_SET_VL, PR_RESET_KEYS, PR_SET_TAGGED_ADDR_CTRL,
> PR_GET_TAGGED_ADDR_CTRL.  Return EINVAL for guests that do
> not support these options rather than pass them on to the host.
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/aarch64/target_prctl.h    | 160 ++++++++++
>   linux-user/aarch64/target_syscall.h  |  23 --
>   linux-user/alpha/target_prctl.h      |   1 +
>   linux-user/arm/target_prctl.h        |   1 +
>   linux-user/cris/target_prctl.h       |   1 +
>   linux-user/hexagon/target_prctl.h    |   1 +
>   linux-user/hppa/target_prctl.h       |   1 +
>   linux-user/i386/target_prctl.h       |   1 +
>   linux-user/m68k/target_prctl.h       |   1 +
>   linux-user/microblaze/target_prctl.h |   1 +
>   linux-user/mips/target_prctl.h       |  88 ++++++
>   linux-user/mips/target_syscall.h     |   6 -
>   linux-user/mips64/target_prctl.h     |   1 +
>   linux-user/mips64/target_syscall.h   |   6 -
>   linux-user/nios2/target_prctl.h      |   1 +
>   linux-user/openrisc/target_prctl.h   |   1 +
>   linux-user/ppc/target_prctl.h        |   1 +
>   linux-user/riscv/target_prctl.h      |   1 +
>   linux-user/s390x/target_prctl.h      |   1 +
>   linux-user/sh4/target_prctl.h        |   1 +
>   linux-user/sparc/target_prctl.h      |   1 +
>   linux-user/x86_64/target_prctl.h     |   1 +
>   linux-user/xtensa/target_prctl.h     |   1 +
>   linux-user/syscall.c                 | 433 +++++++++------------------
>   24 files changed, 414 insertions(+), 320 deletions(-)
>   create mode 100644 linux-user/aarch64/target_prctl.h
>   create mode 100644 linux-user/alpha/target_prctl.h
>   create mode 100644 linux-user/arm/target_prctl.h
>   create mode 100644 linux-user/cris/target_prctl.h
>   create mode 100644 linux-user/hexagon/target_prctl.h
>   create mode 100644 linux-user/hppa/target_prctl.h
>   create mode 100644 linux-user/i386/target_prctl.h
>   create mode 100644 linux-user/m68k/target_prctl.h
>   create mode 100644 linux-user/microblaze/target_prctl.h
>   create mode 100644 linux-user/mips/target_prctl.h
>   create mode 100644 linux-user/mips64/target_prctl.h
>   create mode 100644 linux-user/nios2/target_prctl.h
>   create mode 100644 linux-user/openrisc/target_prctl.h
>   create mode 100644 linux-user/ppc/target_prctl.h
>   create mode 100644 linux-user/riscv/target_prctl.h
>   create mode 100644 linux-user/s390x/target_prctl.h
>   create mode 100644 linux-user/sh4/target_prctl.h
>   create mode 100644 linux-user/sparc/target_prctl.h
>   create mode 100644 linux-user/x86_64/target_prctl.h
>   create mode 100644 linux-user/xtensa/target_prctl.h
> 
> diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
> new file mode 100644
> index 0000000000..3f5a5d3933
> --- /dev/null
> +++ b/linux-user/aarch64/target_prctl.h
> @@ -0,0 +1,160 @@
> +/*
> + * AArch64 specific prctl functions for linux-user
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#ifndef AARCH64_TARGET_PRCTL_H
> +#define AARCH64_TARGET_PRCTL_H
> +
> +static abi_long do_prctl_get_vl(CPUArchState *env)
> +{
> +    ARMCPU *cpu = env_archcpu(env);
> +    if (cpu_isar_feature(aa64_sve, cpu)) {
> +        return ((cpu->env.vfp.zcr_el[1] & 0xf) + 1) * 16;
> +    }
> +    return -TARGET_EINVAL;
> +}
> +#define do_prctl_get_vl do_prctl_get_vl
> +
> +static abi_long do_prctl_set_vl(CPUArchState *env, abi_long arg2)
> +{
> +    /*
> +     * We cannot support either PR_SVE_SET_VL_ONEXEC or PR_SVE_VL_INHERIT.
> +     * Note the kernel definition of sve_vl_valid allows for VQ=512,
> +     * i.e. VL=8192, even though the current architectural maximum is VQ=16.
> +     */
> +    if (cpu_isar_feature(aa64_sve, env_archcpu(env))
> +        && arg2 >= 0 && arg2 <= 512 * 16 && !(arg2 & 15)) {
> +        ARMCPU *cpu = env_archcpu(env);
> +        uint32_t vq, old_vq;
> +
> +        old_vq = (env->vfp.zcr_el[1] & 0xf) + 1;
> +        vq = MAX(arg2 / 16, 1);
> +        vq = MIN(vq, cpu->sve_max_vq);
> +
> +        if (vq < old_vq) {
> +            aarch64_sve_narrow_vq(env, vq);
> +        }
> +        env->vfp.zcr_el[1] = vq - 1;
> +        arm_rebuild_hflags(env);
> +        return vq * 16;
> +    }
> +    return -TARGET_EINVAL;
> +}
> +#define do_prctl_set_vl do_prctl_set_vl
> +
> +static abi_long do_prctl_reset_keys(CPUArchState *env, abi_long arg2)
> +{
> +    ARMCPU *cpu = env_archcpu(env);
> +
> +    if (cpu_isar_feature(aa64_pauth, cpu)) {
> +        int all = (PR_PAC_APIAKEY | PR_PAC_APIBKEY |
> +                   PR_PAC_APDAKEY | PR_PAC_APDBKEY | PR_PAC_APGAKEY);
> +        int ret = 0;
> +        Error *err = NULL;
> +
> +        if (arg2 == 0) {
> +            arg2 = all;
> +        } else if (arg2 & ~all) {
> +            return -TARGET_EINVAL;
> +        }
> +        if (arg2 & PR_PAC_APIAKEY) {
> +            ret |= qemu_guest_getrandom(&env->keys.apia,
> +                                        sizeof(ARMPACKey), &err);
> +        }
> +        if (arg2 & PR_PAC_APIBKEY) {
> +            ret |= qemu_guest_getrandom(&env->keys.apib,
> +                                        sizeof(ARMPACKey), &err);
> +        }
> +        if (arg2 & PR_PAC_APDAKEY) {
> +            ret |= qemu_guest_getrandom(&env->keys.apda,
> +                                        sizeof(ARMPACKey), &err);
> +        }
> +        if (arg2 & PR_PAC_APDBKEY) {
> +            ret |= qemu_guest_getrandom(&env->keys.apdb,
> +                                        sizeof(ARMPACKey), &err);
> +        }
> +        if (arg2 & PR_PAC_APGAKEY) {
> +            ret |= qemu_guest_getrandom(&env->keys.apga,
> +                                        sizeof(ARMPACKey), &err);
> +        }
> +        if (ret != 0) {
> +            /*
> +             * Some unknown failure in the crypto.  The best
> +             * we can do is log it and fail the syscall.
> +             * The real syscall cannot fail this way.
> +             */
> +            qemu_log_mask(LOG_UNIMP, "PR_PAC_RESET_KEYS: Crypto failure: %s",
> +                          error_get_pretty(err));
> +            error_free(err);
> +            return -TARGET_EIO;
> +        }
> +        return 0;
> +    }
> +    return -TARGET_EINVAL;
> +}
> +#define do_prctl_reset_keys do_prctl_reset_keys
> +
> +static abi_long do_prctl_set_tagged_addr_ctrl(CPUArchState *env, abi_long arg2)
> +{
> +    abi_ulong valid_mask = PR_TAGGED_ADDR_ENABLE;
> +    ARMCPU *cpu = env_archcpu(env);
> +
> +    if (cpu_isar_feature(aa64_mte, cpu)) {
> +        valid_mask |= PR_MTE_TCF_MASK;
> +        valid_mask |= PR_MTE_TAG_MASK;
> +    }
> +
> +    if (arg2 & ~valid_mask) {
> +        return -TARGET_EINVAL;
> +    }
> +    env->tagged_addr_enable = arg2 & PR_TAGGED_ADDR_ENABLE;
> +
> +    if (cpu_isar_feature(aa64_mte, cpu)) {
> +        switch (arg2 & PR_MTE_TCF_MASK) {
> +        case PR_MTE_TCF_NONE:
> +        case PR_MTE_TCF_SYNC:
> +        case PR_MTE_TCF_ASYNC:
> +            break;
> +        default:
> +            return -EINVAL;
> +        }
> +
> +        /*
> +         * Write PR_MTE_TCF to SCTLR_EL1[TCF0].
> +         * Note that the syscall values are consistent with hw.
> +         */
> +        env->cp15.sctlr_el[1] =
> +            deposit64(env->cp15.sctlr_el[1], 38, 2, arg2 >> PR_MTE_TCF_SHIFT);
> +
> +        /*
> +         * Write PR_MTE_TAG to GCR_EL1[Exclude].
> +         * Note that the syscall uses an include mask,
> +         * and hardware uses an exclude mask -- invert.
> +         */
> +        env->cp15.gcr_el1 =
> +            deposit64(env->cp15.gcr_el1, 0, 16, ~arg2 >> PR_MTE_TAG_SHIFT);
> +        arm_rebuild_hflags(env);
> +    }
> +    return 0;
> +}
> +#define do_prctl_set_tagged_addr_ctrl do_prctl_set_tagged_addr_ctrl
> +
> +static abi_long do_prctl_get_tagged_addr_ctrl(CPUArchState *env)
> +{
> +    ARMCPU *cpu = env_archcpu(env);
> +    abi_long ret = 0;
> +
> +    if (env->tagged_addr_enable) {
> +        ret |= PR_TAGGED_ADDR_ENABLE;
> +    }
> +    if (cpu_isar_feature(aa64_mte, cpu)) {
> +        /* See do_prctl_set_tagged_addr_ctrl. */
> +        ret |= extract64(env->cp15.sctlr_el[1], 38, 2) << PR_MTE_TCF_SHIFT;
> +        ret = deposit64(ret, PR_MTE_TAG_SHIFT, 16, ~env->cp15.gcr_el1);
> +    }
> +    return ret;
> +}
> +#define do_prctl_get_tagged_addr_ctrl do_prctl_get_tagged_addr_ctrl
> +
> +#endif /* AARCH64_TARGET_PRCTL_H */
> diff --git a/linux-user/aarch64/target_syscall.h b/linux-user/aarch64/target_syscall.h
> index 76f6c3391d..819f112ab0 100644
> --- a/linux-user/aarch64/target_syscall.h
> +++ b/linux-user/aarch64/target_syscall.h
> @@ -20,27 +20,4 @@ struct target_pt_regs {
>   #define TARGET_MCL_FUTURE  2
>   #define TARGET_MCL_ONFAULT 4
>   
> -#define TARGET_PR_SVE_SET_VL  50
> -#define TARGET_PR_SVE_GET_VL  51
> -
> -#define TARGET_PR_PAC_RESET_KEYS 54
> -# define TARGET_PR_PAC_APIAKEY   (1 << 0)
> -# define TARGET_PR_PAC_APIBKEY   (1 << 1)
> -# define TARGET_PR_PAC_APDAKEY   (1 << 2)
> -# define TARGET_PR_PAC_APDBKEY   (1 << 3)
> -# define TARGET_PR_PAC_APGAKEY   (1 << 4)
> -
> -#define TARGET_PR_SET_TAGGED_ADDR_CTRL 55
> -#define TARGET_PR_GET_TAGGED_ADDR_CTRL 56
> -# define TARGET_PR_TAGGED_ADDR_ENABLE  (1UL << 0)
> -/* MTE tag check fault modes */
> -# define TARGET_PR_MTE_TCF_SHIFT       1
> -# define TARGET_PR_MTE_TCF_NONE        (0UL << TARGET_PR_MTE_TCF_SHIFT)
> -# define TARGET_PR_MTE_TCF_SYNC        (1UL << TARGET_PR_MTE_TCF_SHIFT)
> -# define TARGET_PR_MTE_TCF_ASYNC       (2UL << TARGET_PR_MTE_TCF_SHIFT)
> -# define TARGET_PR_MTE_TCF_MASK        (3UL << TARGET_PR_MTE_TCF_SHIFT)
> -/* MTE tag inclusion mask */
> -# define TARGET_PR_MTE_TAG_SHIFT       3
> -# define TARGET_PR_MTE_TAG_MASK        (0xffffUL << TARGET_PR_MTE_TAG_SHIFT)
> -
>   #endif /* AARCH64_TARGET_SYSCALL_H */
> diff --git a/linux-user/alpha/target_prctl.h b/linux-user/alpha/target_prctl.h
> new file mode 100644
> index 0000000000..eb53b31ad5
> --- /dev/null
> +++ b/linux-user/alpha/target_prctl.h
> @@ -0,0 +1 @@
> +/* No special prctl support required. */
> diff --git a/linux-user/arm/target_prctl.h b/linux-user/arm/target_prctl.h
> new file mode 100644
> index 0000000000..eb53b31ad5
> --- /dev/null
> +++ b/linux-user/arm/target_prctl.h
> @@ -0,0 +1 @@
> +/* No special prctl support required. */
> diff --git a/linux-user/cris/target_prctl.h b/linux-user/cris/target_prctl.h
> new file mode 100644
> index 0000000000..eb53b31ad5
> --- /dev/null
> +++ b/linux-user/cris/target_prctl.h
> @@ -0,0 +1 @@
> +/* No special prctl support required. */
> diff --git a/linux-user/hexagon/target_prctl.h b/linux-user/hexagon/target_prctl.h
> new file mode 100644
> index 0000000000..eb53b31ad5
> --- /dev/null
> +++ b/linux-user/hexagon/target_prctl.h
> @@ -0,0 +1 @@
> +/* No special prctl support required. */
> diff --git a/linux-user/hppa/target_prctl.h b/linux-user/hppa/target_prctl.h
> new file mode 100644
> index 0000000000..eb53b31ad5
> --- /dev/null
> +++ b/linux-user/hppa/target_prctl.h
> @@ -0,0 +1 @@
> +/* No special prctl support required. */
> diff --git a/linux-user/i386/target_prctl.h b/linux-user/i386/target_prctl.h
> new file mode 100644
> index 0000000000..eb53b31ad5
> --- /dev/null
> +++ b/linux-user/i386/target_prctl.h
> @@ -0,0 +1 @@
> +/* No special prctl support required. */
> diff --git a/linux-user/m68k/target_prctl.h b/linux-user/m68k/target_prctl.h
> new file mode 100644
> index 0000000000..eb53b31ad5
> --- /dev/null
> +++ b/linux-user/m68k/target_prctl.h
> @@ -0,0 +1 @@
> +/* No special prctl support required. */
> diff --git a/linux-user/microblaze/target_prctl.h b/linux-user/microblaze/target_prctl.h
> new file mode 100644
> index 0000000000..eb53b31ad5
> --- /dev/null
> +++ b/linux-user/microblaze/target_prctl.h
> @@ -0,0 +1 @@
> +/* No special prctl support required. */
> diff --git a/linux-user/mips/target_prctl.h b/linux-user/mips/target_prctl.h
> new file mode 100644
> index 0000000000..e028333db9
> --- /dev/null
> +++ b/linux-user/mips/target_prctl.h
> @@ -0,0 +1,88 @@
> +/*
> + * MIPS specific prctl functions for linux-user
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#ifndef MIPS_TARGET_PRCTL_H
> +#define MIPS_TARGET_PRCTL_H
> +
> +static abi_long do_prctl_get_fp_mode(CPUArchState *env)
> +{
> +    abi_long ret = 0;
> +
> +    if (env->CP0_Status & (1 << CP0St_FR)) {
> +        ret |= PR_FP_MODE_FR;
> +    }
> +    if (env->CP0_Config5 & (1 << CP0C5_FRE)) {
> +        ret |= PR_FP_MODE_FRE;
> +    }
> +    return ret;
> +}
> +#define do_prctl_get_fp_mode do_prctl_get_fp_mode
> +
> +static abi_long do_prctl_set_fp_mode(CPUArchState *env, abi_long arg2)
> +{
> +    bool old_fr = env->CP0_Status & (1 << CP0St_FR);
> +    bool old_fre = env->CP0_Config5 & (1 << CP0C5_FRE);
> +    bool new_fr = arg2 & PR_FP_MODE_FR;
> +    bool new_fre = arg2 & PR_FP_MODE_FRE;
> +    const unsigned int known_bits = PR_FP_MODE_FR | PR_FP_MODE_FRE;
> +
> +    /* If nothing to change, return right away, successfully.  */
> +    if (old_fr == new_fr && old_fre == new_fre) {
> +        return 0;
> +    }
> +    /* Check the value is valid */
> +    if (arg2 & ~known_bits) {
> +        return -TARGET_EOPNOTSUPP;
> +    }
> +    /* Setting FRE without FR is not supported.  */
> +    if (new_fre && !new_fr) {
> +        return -TARGET_EOPNOTSUPP;
> +    }
> +    if (new_fr && !(env->active_fpu.fcr0 & (1 << FCR0_F64))) {
> +        /* FR1 is not supported */
> +        return -TARGET_EOPNOTSUPP;
> +    }
> +    if (!new_fr && (env->active_fpu.fcr0 & (1 << FCR0_F64))
> +        && !(env->CP0_Status_rw_bitmask & (1 << CP0St_FR))) {
> +        /* cannot set FR=0 */
> +        return -TARGET_EOPNOTSUPP;
> +    }
> +    if (new_fre && !(env->active_fpu.fcr0 & (1 << FCR0_FREP))) {
> +        /* Cannot set FRE=1 */
> +        return -TARGET_EOPNOTSUPP;
> +    }
> +
> +    int i;
> +    fpr_t *fpr = env->active_fpu.fpr;
> +    for (i = 0; i < 32 ; i += 2) {
> +        if (!old_fr && new_fr) {
> +            fpr[i].w[!FP_ENDIAN_IDX] = fpr[i + 1].w[FP_ENDIAN_IDX];
> +        } else if (old_fr && !new_fr) {
> +            fpr[i + 1].w[FP_ENDIAN_IDX] = fpr[i].w[!FP_ENDIAN_IDX];
> +        }
> +    }
> +
> +    if (new_fr) {
> +        env->CP0_Status |= (1 << CP0St_FR);
> +        env->hflags |= MIPS_HFLAG_F64;
> +    } else {
> +        env->CP0_Status &= ~(1 << CP0St_FR);
> +        env->hflags &= ~MIPS_HFLAG_F64;
> +    }
> +    if (new_fre) {
> +        env->CP0_Config5 |= (1 << CP0C5_FRE);
> +        if (env->active_fpu.fcr0 & (1 << FCR0_FREP)) {
> +            env->hflags |= MIPS_HFLAG_FRE;
> +        }
> +    } else {
> +        env->CP0_Config5 &= ~(1 << CP0C5_FRE);
> +        env->hflags &= ~MIPS_HFLAG_FRE;
> +    }
> +
> +    return 0;
> +}
> +#define do_prctl_set_fp_mode do_prctl_set_fp_mode
> +
> +#endif /* MIPS_TARGET_PRCTL_H */
> diff --git a/linux-user/mips/target_syscall.h b/linux-user/mips/target_syscall.h
> index f59057493a..1ce0a5bbf4 100644
> --- a/linux-user/mips/target_syscall.h
> +++ b/linux-user/mips/target_syscall.h
> @@ -36,10 +36,4 @@ static inline abi_ulong target_shmlba(CPUMIPSState *env)
>       return 0x40000;
>   }
>   
> -/* MIPS-specific prctl() options */
> -#define TARGET_PR_SET_FP_MODE  45
> -#define TARGET_PR_GET_FP_MODE  46
> -#define TARGET_PR_FP_MODE_FR   (1 << 0)
> -#define TARGET_PR_FP_MODE_FRE  (1 << 1)
> -
>   #endif /* MIPS_TARGET_SYSCALL_H */
> diff --git a/linux-user/mips64/target_prctl.h b/linux-user/mips64/target_prctl.h
> new file mode 100644
> index 0000000000..18da9ae619
> --- /dev/null
> +++ b/linux-user/mips64/target_prctl.h
> @@ -0,0 +1 @@
> +#include "../mips/target_prctl.h"
> diff --git a/linux-user/mips64/target_syscall.h b/linux-user/mips64/target_syscall.h
> index cd1e1b4969..74f12365bc 100644
> --- a/linux-user/mips64/target_syscall.h
> +++ b/linux-user/mips64/target_syscall.h
> @@ -33,10 +33,4 @@ static inline abi_ulong target_shmlba(CPUMIPSState *env)
>       return 0x40000;
>   }
>   
> -/* MIPS-specific prctl() options */
> -#define TARGET_PR_SET_FP_MODE  45
> -#define TARGET_PR_GET_FP_MODE  46
> -#define TARGET_PR_FP_MODE_FR   (1 << 0)
> -#define TARGET_PR_FP_MODE_FRE  (1 << 1)
> -
>   #endif /* MIPS64_TARGET_SYSCALL_H */
> diff --git a/linux-user/nios2/target_prctl.h b/linux-user/nios2/target_prctl.h
> new file mode 100644
> index 0000000000..eb53b31ad5
> --- /dev/null
> +++ b/linux-user/nios2/target_prctl.h
> @@ -0,0 +1 @@
> +/* No special prctl support required. */
> diff --git a/linux-user/openrisc/target_prctl.h b/linux-user/openrisc/target_prctl.h
> new file mode 100644
> index 0000000000..eb53b31ad5
> --- /dev/null
> +++ b/linux-user/openrisc/target_prctl.h
> @@ -0,0 +1 @@
> +/* No special prctl support required. */
> diff --git a/linux-user/ppc/target_prctl.h b/linux-user/ppc/target_prctl.h
> new file mode 100644
> index 0000000000..eb53b31ad5
> --- /dev/null
> +++ b/linux-user/ppc/target_prctl.h
> @@ -0,0 +1 @@
> +/* No special prctl support required. */
> diff --git a/linux-user/riscv/target_prctl.h b/linux-user/riscv/target_prctl.h
> new file mode 100644
> index 0000000000..eb53b31ad5
> --- /dev/null
> +++ b/linux-user/riscv/target_prctl.h
> @@ -0,0 +1 @@
> +/* No special prctl support required. */
> diff --git a/linux-user/s390x/target_prctl.h b/linux-user/s390x/target_prctl.h
> new file mode 100644
> index 0000000000..eb53b31ad5
> --- /dev/null
> +++ b/linux-user/s390x/target_prctl.h
> @@ -0,0 +1 @@
> +/* No special prctl support required. */
> diff --git a/linux-user/sh4/target_prctl.h b/linux-user/sh4/target_prctl.h
> new file mode 100644
> index 0000000000..eb53b31ad5
> --- /dev/null
> +++ b/linux-user/sh4/target_prctl.h
> @@ -0,0 +1 @@
> +/* No special prctl support required. */
> diff --git a/linux-user/sparc/target_prctl.h b/linux-user/sparc/target_prctl.h
> new file mode 100644
> index 0000000000..eb53b31ad5
> --- /dev/null
> +++ b/linux-user/sparc/target_prctl.h
> @@ -0,0 +1 @@
> +/* No special prctl support required. */
> diff --git a/linux-user/x86_64/target_prctl.h b/linux-user/x86_64/target_prctl.h
> new file mode 100644
> index 0000000000..eb53b31ad5
> --- /dev/null
> +++ b/linux-user/x86_64/target_prctl.h
> @@ -0,0 +1 @@
> +/* No special prctl support required. */
> diff --git a/linux-user/xtensa/target_prctl.h b/linux-user/xtensa/target_prctl.h
> new file mode 100644
> index 0000000000..eb53b31ad5
> --- /dev/null
> +++ b/linux-user/xtensa/target_prctl.h
> @@ -0,0 +1 @@
> +/* No special prctl support required. */
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 56a3e17183..0f0f67d567 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -6294,9 +6294,155 @@ abi_long do_arch_prctl(CPUX86State *env, int code, abi_ulong addr)
>       return ret;
>   }
>   #endif /* defined(TARGET_ABI32 */
> -
>   #endif /* defined(TARGET_I386) */
>   
> +/*
> + * These constants are generic.  Supply any that are missing from the host.
> + */
> +#ifndef PR_SET_NAME
> +# define PR_SET_NAME    15
> +# define PR_GET_NAME    16
> +#endif
> +#ifndef PR_SET_FP_MODE
> +# define PR_SET_FP_MODE 45
> +# define PR_GET_FP_MODE 46
> +# define PR_FP_MODE_FR   (1 << 0)
> +# define PR_FP_MODE_FRE  (1 << 1)
> +#endif
> +#ifndef PR_SVE_SET_VL
> +# define PR_SVE_SET_VL  50
> +# define PR_SVE_GET_VL  51
> +# define PR_SVE_VL_LEN_MASK  0xffff
> +# define PR_SVE_VL_INHERIT   (1 << 17)
> +#endif
> +#ifndef PR_PAC_RESET_KEYS
> +# define PR_PAC_RESET_KEYS  54
> +# define PR_PAC_APIAKEY   (1 << 0)
> +# define PR_PAC_APIBKEY   (1 << 1)
> +# define PR_PAC_APDAKEY   (1 << 2)
> +# define PR_PAC_APDBKEY   (1 << 3)
> +# define PR_PAC_APGAKEY   (1 << 4)
> +#endif
> +#ifndef PR_SET_TAGGED_ADDR_CTRL
> +# define PR_SET_TAGGED_ADDR_CTRL 55
> +# define PR_GET_TAGGED_ADDR_CTRL 56
> +# define PR_TAGGED_ADDR_ENABLE  (1UL << 0)
> +#endif
> +#ifndef PR_MTE_TCF_SHIFT
> +# define PR_MTE_TCF_SHIFT       1
> +# define PR_MTE_TCF_NONE        (0UL << PR_MTE_TCF_SHIFT)
> +# define PR_MTE_TCF_SYNC        (1UL << PR_MTE_TCF_SHIFT)
> +# define PR_MTE_TCF_ASYNC       (2UL << PR_MTE_TCF_SHIFT)
> +# define PR_MTE_TCF_MASK        (3UL << PR_MTE_TCF_SHIFT)
> +# define PR_MTE_TAG_SHIFT       3
> +# define PR_MTE_TAG_MASK        (0xffffUL << PR_MTE_TAG_SHIFT)
> +#endif
> +
> +#include "target_prctl.h"
> +
> +static abi_long do_prctl_inval0(CPUArchState *env)
> +{
> +    return -TARGET_EINVAL;
> +}
> +
> +static abi_long do_prctl_inval1(CPUArchState *env, abi_long arg2)
> +{
> +    return -TARGET_EINVAL;
> +}
> +
> +#ifndef do_prctl_get_fp_mode
> +#define do_prctl_get_fp_mode do_prctl_inval0
> +#endif
> +#ifndef do_prctl_set_fp_mode
> +#define do_prctl_set_fp_mode do_prctl_inval1
> +#endif
> +#ifndef do_prctl_get_vl
> +#define do_prctl_get_vl do_prctl_inval0
> +#endif
> +#ifndef do_prctl_set_vl
> +#define do_prctl_set_vl do_prctl_inval1
> +#endif
> +#ifndef do_prctl_reset_keys
> +#define do_prctl_reset_keys do_prctl_inval1
> +#endif
> +#ifndef do_prctl_set_tagged_addr_ctrl
> +#define do_prctl_set_tagged_addr_ctrl do_prctl_inval1
> +#endif
> +#ifndef do_prctl_get_tagged_addr_ctrl
> +#define do_prctl_get_tagged_addr_ctrl do_prctl_inval0
> +#endif
> +
> +static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
> +                         abi_long arg3, abi_long arg4, abi_long arg5)
> +{
> +    abi_long ret;
> +
> +    switch (option) {
> +    case PR_GET_PDEATHSIG:
> +        {
> +            int deathsig;
> +            ret = get_errno(prctl(PR_GET_PDEATHSIG, &deathsig,
> +                                  arg3, arg4, arg5));
> +            if (!is_error(ret) && arg2 && put_user_s32(deathsig, arg2)) {
> +                return -TARGET_EFAULT;
> +            }
> +            return ret;
> +        }
> +    case PR_GET_NAME:
> +        {
> +            void *name = lock_user(VERIFY_WRITE, arg2, 16, 1);
> +            if (!name) {
> +                return -TARGET_EFAULT;
> +            }
> +            ret = get_errno(prctl(PR_GET_NAME, (uintptr_t)name,
> +                                  arg3, arg4, arg5));
> +            unlock_user(name, arg2, 16);
> +            return ret;
> +        }
> +    case PR_SET_NAME:
> +        {
> +            void *name = lock_user(VERIFY_READ, arg2, 16, 1);
> +            if (!name) {
> +                return -TARGET_EFAULT;
> +            }
> +            ret = get_errno(prctl(PR_SET_NAME, (uintptr_t)name,
> +                                  arg3, arg4, arg5));
> +            unlock_user(name, arg2, 0);
> +            return ret;
> +        }
> +    case PR_GET_FP_MODE:
> +        return do_prctl_get_fp_mode(env);
> +    case PR_SET_FP_MODE:
> +        return do_prctl_set_fp_mode(env, arg2);
> +    case PR_SVE_GET_VL:
> +        return do_prctl_get_vl(env);
> +    case PR_SVE_SET_VL:
> +        return do_prctl_set_vl(env, arg2);
> +    case PR_PAC_RESET_KEYS:
> +        if (arg3 || arg4 || arg5) {
> +            return -TARGET_EINVAL;
> +        }
> +        return do_prctl_reset_keys(env, arg2);
> +    case PR_SET_TAGGED_ADDR_CTRL:
> +        if (arg3 || arg4 || arg5) {
> +            return -TARGET_EINVAL;
> +        }
> +        return do_prctl_set_tagged_addr_ctrl(env, arg2);
> +    case PR_GET_TAGGED_ADDR_CTRL:
> +        if (arg2 || arg3 || arg4 || arg5) {
> +            return -TARGET_EINVAL;
> +        }
> +        return do_prctl_get_tagged_addr_ctrl(env);
> +    case PR_GET_SECCOMP:
> +    case PR_SET_SECCOMP:
> +        /* Disable seccomp to prevent the target disabling syscalls we need. */
> +        return -TARGET_EINVAL;
> +    default:
> +        /* Most prctl options have no pointer arguments */
> +        return get_errno(prctl(option, arg2, arg3, arg4, arg5));
> +    }
> +}
> +
>   #define NEW_STACK_SIZE 0x40000
>   
>   
> @@ -10635,290 +10781,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>           return ret;
>   #endif
>       case TARGET_NR_prctl:
> -        switch (arg1) {
> -        case PR_GET_PDEATHSIG:
> -        {
> -            int deathsig;
> -            ret = get_errno(prctl(arg1, &deathsig, arg3, arg4, arg5));
> -            if (!is_error(ret) && arg2
> -                && put_user_s32(deathsig, arg2)) {
> -                return -TARGET_EFAULT;
> -            }
> -            return ret;
> -        }
> -#ifdef PR_GET_NAME
> -        case PR_GET_NAME:
> -        {
> -            void *name = lock_user(VERIFY_WRITE, arg2, 16, 1);
> -            if (!name) {
> -                return -TARGET_EFAULT;
> -            }
> -            ret = get_errno(prctl(arg1, (unsigned long)name,
> -                                  arg3, arg4, arg5));
> -            unlock_user(name, arg2, 16);
> -            return ret;
> -        }
> -        case PR_SET_NAME:
> -        {
> -            void *name = lock_user(VERIFY_READ, arg2, 16, 1);
> -            if (!name) {
> -                return -TARGET_EFAULT;
> -            }
> -            ret = get_errno(prctl(arg1, (unsigned long)name,
> -                                  arg3, arg4, arg5));
> -            unlock_user(name, arg2, 0);
> -            return ret;
> -        }
> -#endif
> -#ifdef TARGET_MIPS
> -        case TARGET_PR_GET_FP_MODE:
> -        {
> -            CPUMIPSState *env = ((CPUMIPSState *)cpu_env);
> -            ret = 0;
> -            if (env->CP0_Status & (1 << CP0St_FR)) {
> -                ret |= TARGET_PR_FP_MODE_FR;
> -            }
> -            if (env->CP0_Config5 & (1 << CP0C5_FRE)) {
> -                ret |= TARGET_PR_FP_MODE_FRE;
> -            }
> -            return ret;
> -        }
> -        case TARGET_PR_SET_FP_MODE:
> -        {
> -            CPUMIPSState *env = ((CPUMIPSState *)cpu_env);
> -            bool old_fr = env->CP0_Status & (1 << CP0St_FR);
> -            bool old_fre = env->CP0_Config5 & (1 << CP0C5_FRE);
> -            bool new_fr = arg2 & TARGET_PR_FP_MODE_FR;
> -            bool new_fre = arg2 & TARGET_PR_FP_MODE_FRE;
> -
> -            const unsigned int known_bits = TARGET_PR_FP_MODE_FR |
> -                                            TARGET_PR_FP_MODE_FRE;
> -
> -            /* If nothing to change, return right away, successfully.  */
> -            if (old_fr == new_fr && old_fre == new_fre) {
> -                return 0;
> -            }
> -            /* Check the value is valid */
> -            if (arg2 & ~known_bits) {
> -                return -TARGET_EOPNOTSUPP;
> -            }
> -            /* Setting FRE without FR is not supported.  */
> -            if (new_fre && !new_fr) {
> -                return -TARGET_EOPNOTSUPP;
> -            }
> -            if (new_fr && !(env->active_fpu.fcr0 & (1 << FCR0_F64))) {
> -                /* FR1 is not supported */
> -                return -TARGET_EOPNOTSUPP;
> -            }
> -            if (!new_fr && (env->active_fpu.fcr0 & (1 << FCR0_F64))
> -                && !(env->CP0_Status_rw_bitmask & (1 << CP0St_FR))) {
> -                /* cannot set FR=0 */
> -                return -TARGET_EOPNOTSUPP;
> -            }
> -            if (new_fre && !(env->active_fpu.fcr0 & (1 << FCR0_FREP))) {
> -                /* Cannot set FRE=1 */
> -                return -TARGET_EOPNOTSUPP;
> -            }
> -
> -            int i;
> -            fpr_t *fpr = env->active_fpu.fpr;
> -            for (i = 0; i < 32 ; i += 2) {
> -                if (!old_fr && new_fr) {
> -                    fpr[i].w[!FP_ENDIAN_IDX] = fpr[i + 1].w[FP_ENDIAN_IDX];
> -                } else if (old_fr && !new_fr) {
> -                    fpr[i + 1].w[FP_ENDIAN_IDX] = fpr[i].w[!FP_ENDIAN_IDX];
> -                }
> -            }
> -
> -            if (new_fr) {
> -                env->CP0_Status |= (1 << CP0St_FR);
> -                env->hflags |= MIPS_HFLAG_F64;
> -            } else {
> -                env->CP0_Status &= ~(1 << CP0St_FR);
> -                env->hflags &= ~MIPS_HFLAG_F64;
> -            }
> -            if (new_fre) {
> -                env->CP0_Config5 |= (1 << CP0C5_FRE);
> -                if (env->active_fpu.fcr0 & (1 << FCR0_FREP)) {
> -                    env->hflags |= MIPS_HFLAG_FRE;
> -                }
> -            } else {
> -                env->CP0_Config5 &= ~(1 << CP0C5_FRE);
> -                env->hflags &= ~MIPS_HFLAG_FRE;
> -            }
> -
> -            return 0;
> -        }
> -#endif /* MIPS */
> -#ifdef TARGET_AARCH64
> -        case TARGET_PR_SVE_SET_VL:
> -            /*
> -             * We cannot support either PR_SVE_SET_VL_ONEXEC or
> -             * PR_SVE_VL_INHERIT.  Note the kernel definition
> -             * of sve_vl_valid allows for VQ=512, i.e. VL=8192,
> -             * even though the current architectural maximum is VQ=16.
> -             */
> -            ret = -TARGET_EINVAL;
> -            if (cpu_isar_feature(aa64_sve, env_archcpu(cpu_env))
> -                && arg2 >= 0 && arg2 <= 512 * 16 && !(arg2 & 15)) {
> -                CPUARMState *env = cpu_env;
> -                ARMCPU *cpu = env_archcpu(env);
> -                uint32_t vq, old_vq;
> -
> -                old_vq = (env->vfp.zcr_el[1] & 0xf) + 1;
> -                vq = MAX(arg2 / 16, 1);
> -                vq = MIN(vq, cpu->sve_max_vq);
> -
> -                if (vq < old_vq) {
> -                    aarch64_sve_narrow_vq(env, vq);
> -                }
> -                env->vfp.zcr_el[1] = vq - 1;
> -                arm_rebuild_hflags(env);
> -                ret = vq * 16;
> -            }
> -            return ret;
> -        case TARGET_PR_SVE_GET_VL:
> -            ret = -TARGET_EINVAL;
> -            {
> -                ARMCPU *cpu = env_archcpu(cpu_env);
> -                if (cpu_isar_feature(aa64_sve, cpu)) {
> -                    ret = ((cpu->env.vfp.zcr_el[1] & 0xf) + 1) * 16;
> -                }
> -            }
> -            return ret;
> -        case TARGET_PR_PAC_RESET_KEYS:
> -            {
> -                CPUARMState *env = cpu_env;
> -                ARMCPU *cpu = env_archcpu(env);
> -
> -                if (arg3 || arg4 || arg5) {
> -                    return -TARGET_EINVAL;
> -                }
> -                if (cpu_isar_feature(aa64_pauth, cpu)) {
> -                    int all = (TARGET_PR_PAC_APIAKEY | TARGET_PR_PAC_APIBKEY |
> -                               TARGET_PR_PAC_APDAKEY | TARGET_PR_PAC_APDBKEY |
> -                               TARGET_PR_PAC_APGAKEY);
> -                    int ret = 0;
> -                    Error *err = NULL;
> -
> -                    if (arg2 == 0) {
> -                        arg2 = all;
> -                    } else if (arg2 & ~all) {
> -                        return -TARGET_EINVAL;
> -                    }
> -                    if (arg2 & TARGET_PR_PAC_APIAKEY) {
> -                        ret |= qemu_guest_getrandom(&env->keys.apia,
> -                                                    sizeof(ARMPACKey), &err);
> -                    }
> -                    if (arg2 & TARGET_PR_PAC_APIBKEY) {
> -                        ret |= qemu_guest_getrandom(&env->keys.apib,
> -                                                    sizeof(ARMPACKey), &err);
> -                    }
> -                    if (arg2 & TARGET_PR_PAC_APDAKEY) {
> -                        ret |= qemu_guest_getrandom(&env->keys.apda,
> -                                                    sizeof(ARMPACKey), &err);
> -                    }
> -                    if (arg2 & TARGET_PR_PAC_APDBKEY) {
> -                        ret |= qemu_guest_getrandom(&env->keys.apdb,
> -                                                    sizeof(ARMPACKey), &err);
> -                    }
> -                    if (arg2 & TARGET_PR_PAC_APGAKEY) {
> -                        ret |= qemu_guest_getrandom(&env->keys.apga,
> -                                                    sizeof(ARMPACKey), &err);
> -                    }
> -                    if (ret != 0) {
> -                        /*
> -                         * Some unknown failure in the crypto.  The best
> -                         * we can do is log it and fail the syscall.
> -                         * The real syscall cannot fail this way.
> -                         */
> -                        qemu_log_mask(LOG_UNIMP,
> -                                      "PR_PAC_RESET_KEYS: Crypto failure: %s",
> -                                      error_get_pretty(err));
> -                        error_free(err);
> -                        return -TARGET_EIO;
> -                    }
> -                    return 0;
> -                }
> -            }
> -            return -TARGET_EINVAL;
> -        case TARGET_PR_SET_TAGGED_ADDR_CTRL:
> -            {
> -                abi_ulong valid_mask = TARGET_PR_TAGGED_ADDR_ENABLE;
> -                CPUARMState *env = cpu_env;
> -                ARMCPU *cpu = env_archcpu(env);
> -
> -                if (cpu_isar_feature(aa64_mte, cpu)) {
> -                    valid_mask |= TARGET_PR_MTE_TCF_MASK;
> -                    valid_mask |= TARGET_PR_MTE_TAG_MASK;
> -                }
> -
> -                if ((arg2 & ~valid_mask) || arg3 || arg4 || arg5) {
> -                    return -TARGET_EINVAL;
> -                }
> -                env->tagged_addr_enable = arg2 & TARGET_PR_TAGGED_ADDR_ENABLE;
> -
> -                if (cpu_isar_feature(aa64_mte, cpu)) {
> -                    switch (arg2 & TARGET_PR_MTE_TCF_MASK) {
> -                    case TARGET_PR_MTE_TCF_NONE:
> -                    case TARGET_PR_MTE_TCF_SYNC:
> -                    case TARGET_PR_MTE_TCF_ASYNC:
> -                        break;
> -                    default:
> -                        return -EINVAL;
> -                    }
> -
> -                    /*
> -                     * Write PR_MTE_TCF to SCTLR_EL1[TCF0].
> -                     * Note that the syscall values are consistent with hw.
> -                     */
> -                    env->cp15.sctlr_el[1] =
> -                        deposit64(env->cp15.sctlr_el[1], 38, 2,
> -                                  arg2 >> TARGET_PR_MTE_TCF_SHIFT);
> -
> -                    /*
> -                     * Write PR_MTE_TAG to GCR_EL1[Exclude].
> -                     * Note that the syscall uses an include mask,
> -                     * and hardware uses an exclude mask -- invert.
> -                     */
> -                    env->cp15.gcr_el1 =
> -                        deposit64(env->cp15.gcr_el1, 0, 16,
> -                                  ~arg2 >> TARGET_PR_MTE_TAG_SHIFT);
> -                    arm_rebuild_hflags(env);
> -                }
> -                return 0;
> -            }
> -        case TARGET_PR_GET_TAGGED_ADDR_CTRL:
> -            {
> -                abi_long ret = 0;
> -                CPUARMState *env = cpu_env;
> -                ARMCPU *cpu = env_archcpu(env);
> -
> -                if (arg2 || arg3 || arg4 || arg5) {
> -                    return -TARGET_EINVAL;
> -                }
> -                if (env->tagged_addr_enable) {
> -                    ret |= TARGET_PR_TAGGED_ADDR_ENABLE;
> -                }
> -                if (cpu_isar_feature(aa64_mte, cpu)) {
> -                    /* See above. */
> -                    ret |= (extract64(env->cp15.sctlr_el[1], 38, 2)
> -                            << TARGET_PR_MTE_TCF_SHIFT);
> -                    ret = deposit64(ret, TARGET_PR_MTE_TAG_SHIFT, 16,
> -                                    ~env->cp15.gcr_el1);
> -                }
> -                return ret;
> -            }
> -#endif /* AARCH64 */
> -        case PR_GET_SECCOMP:
> -        case PR_SET_SECCOMP:
> -            /* Disable seccomp to prevent the target disabling syscalls we
> -             * need. */
> -            return -TARGET_EINVAL;
> -        default:
> -            /* Most prctl options have no pointer arguments */
> -            return get_errno(prctl(arg1, arg2, arg3, arg4, arg5));
> -        }
> +        return do_prctl(cpu_env, arg1, arg2, arg3, arg4, arg5);
>           break;
>   #ifdef TARGET_NR_arch_prctl
>       case TARGET_NR_arch_prctl:

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent


