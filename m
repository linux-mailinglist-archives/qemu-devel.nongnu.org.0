Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 690C9297A0F
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Oct 2020 02:37:45 +0200 (CEST)
Received: from localhost ([::1]:39564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kW7Z1-0006cc-Rt
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 20:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kW7W3-0005UA-FZ; Fri, 23 Oct 2020 20:34:39 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:36749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kW7Vy-0001Sl-Nx; Fri, 23 Oct 2020 20:34:39 -0400
Received: by mail-io1-xd44.google.com with SMTP id u19so4080747ion.3;
 Fri, 23 Oct 2020 17:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XBnoAFTTNc7dbzD7DRxkJnNwxFwSFACDUBLobcq1mL0=;
 b=ofcT0TVQnppG6nmiqw6lLpx3l9SNHX5wKDn8VKzlF4ugUDEzmbz8N8xOlvWT11eelL
 uTbvdg4Kj7FU8iH5b1cMl3vQmuiiRH9jrZ78F6XkMyAi2ZxC1k7cMvbWv9ZxDBLbWkRl
 6yl8xoO5e1q5ycgYBCO1AgAOWqyxHTaP+zhsYX9zuH81y4LIEPvSnuYNGfhooPd7mskv
 uOxcxBB8ZRPZJocssCkXeYgM2gyncAY1r7dw4pyCzI4Eabh1IqOluGVWRG2pDElGNYL9
 vJ/eR8ObGK7kLxp9l7+MkstxL5N9/1aSq0CRN74XPh/nBJjbc7qc69BiX0tpZXPMWQ9i
 0i/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XBnoAFTTNc7dbzD7DRxkJnNwxFwSFACDUBLobcq1mL0=;
 b=jWSZJ2LBwAMHXuveOUzvcGU/qUGkyMEIZZweUm48adOQ9S9Ph0ke0K04uVO2g5bBSO
 GPUag6yE11gUDYVrW4OimrrN78hpJf8paKz/Xc3MiNxby1qAFKl1ZZ7wesvByWGEsaiY
 vaVhIm8WBXFCZ6I+vMoWCSdkFyhtcpV1gwAgNcZ/10DAf1bxCpQJQCGEQzAuh7a1+h1x
 yx2jc0mwavp7vAMccl0qeSUPG0rvsWAVYgiHgq7UEFI22sQZ6OVpl4FdjQaF/nCmUAVJ
 c4juy9vpRaH1QeEMigXRBx+kYHaQUBs0ooQwWZ0P1WBnFUl8wpG2cIk4zVelTR0bAnLV
 1asw==
X-Gm-Message-State: AOAM531UXDrSp4Eyggv/ltgcvj9L+9mBaS1ImU/2BxaPrUJnTNKU6LpD
 3j/fjv9jBIr+lfHMpiiwm5K7+On9CDn9HPbiuCo=
X-Google-Smtp-Source: ABdhPJzvF0xkL4wSBZJqBAscUqHIcJrlFv+vp/y8fpGT2kuVOWz76GqBkUZwIuqRjWsGcZXLrU3k1t2Eq5qJZO4l2mg=
X-Received: by 2002:a02:c956:: with SMTP id u22mr3928452jao.135.1603499672607; 
 Fri, 23 Oct 2020 17:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201023214940.917885-1-keithp@keithp.com>
In-Reply-To: <20201023214940.917885-1-keithp@keithp.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Oct 2020 17:22:45 -0700
Message-ID: <CAKmqyKMzHARF7C9Lo8SYFBbPNa_=ibbWBNnedwFbe8AY=DdXVA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add semihosting support [v8]
To: Keith Packard <keithp@keithp.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 23, 2020 at 2:51 PM Keith Packard via <qemu-devel@nongnu.org> w=
rote:
>
> Adapt the arm semihosting support code for RISCV. This implementation
> is based on the standard for RISC-V semihosting version 0.2 as
> documented in
>
>    https://github.com/riscv/riscv-semihosting-spec/releases/tag/0.2
>
> Signed-off-by: Keith Packard <keithp@keithp.com>

Hey Keith,

>
> ---
>
> v2:
>         Update PC after exception is handled to follow
>         change in the ARM version for SYS_READC
>
> v3:
>         Disallow semihosting in user mode; report a regular
>         breakpoint in that case.
>
> v4:
>         Fix errors reported by checkpatch
>
> v5:
>         Reference current RISC-V semihosting specification
>
> v6:
>         Add support for semihosting in riscv64-linux-user and
>         riscv32-linux-user
>
> v7:
>         Add meson build support
>
> v8:
>         Fix errors reported by checkpatch that crept in.
> ---
>  MAINTAINERS                                   |    1 +
>  default-configs/devices/riscv32-softmmu.mak   |    1 +
>  default-configs/devices/riscv64-softmmu.mak   |    1 +
>  linux-user/meson.build                        |    1 +
>  linux-user/qemu.h                             |    4 +-
>  linux-user/riscv/meson.build                  |    2 +
>  linux-user/riscv/semihost.c                   |   76 ++
>  qemu-options.hx                               |   10 +-
>  target/riscv/cpu.h                            |    7 +
>  target/riscv/cpu_bits.h                       |    1 +
>  target/riscv/cpu_helper.c                     |    9 +
>  .../riscv/insn_trans/trans_privileged.c.inc   |   24 +-
>  target/riscv/meson.build                      |    1 +
>  target/riscv/riscv-semi.c                     | 1086 +++++++++++++++++
>  target/riscv/translate.c                      |   11 +
>  15 files changed, 1229 insertions(+), 6 deletions(-)
>  create mode 100644 linux-user/riscv/meson.build
>  create mode 100644 linux-user/riscv/semihost.c
>  create mode 100644 target/riscv/riscv-semi.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6a197bd358..8cf5b1e448 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -279,6 +279,7 @@ M: Palmer Dabbelt <palmer@dabbelt.com>
>  M: Alistair Francis <Alistair.Francis@wdc.com>
>  M: Sagar Karandikar <sagark@eecs.berkeley.edu>
>  M: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> +M: Keith Packard <keithp@keithp.com>

I don't think you should be a maintainer just yet. In general people
have to be actively reviewing patches to be listed as a maintainer.

>  L: qemu-riscv@nongnu.org
>  S: Supported
>  F: target/riscv/
> diff --git a/default-configs/devices/riscv32-softmmu.mak b/default-config=
s/devices/riscv32-softmmu.mak
> index 94a236c9c2..e8a4eeebec 100644
> --- a/default-configs/devices/riscv32-softmmu.mak
> +++ b/default-configs/devices/riscv32-softmmu.mak
> @@ -3,6 +3,7 @@
>  # Uncomment the following lines to disable these optional devices:
>  #
>  #CONFIG_PCI_DEVICES=3Dn
> +CONFIG_SEMIHOSTING=3Dy
>
>  # Boards:
>  #
> diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-config=
s/devices/riscv64-softmmu.mak
> index 76b6195648..d8a87b7671 100644
> --- a/default-configs/devices/riscv64-softmmu.mak
> +++ b/default-configs/devices/riscv64-softmmu.mak
> @@ -3,6 +3,7 @@
>  # Uncomment the following lines to disable these optional devices:
>  #
>  #CONFIG_PCI_DEVICES=3Dn
> +CONFIG_SEMIHOSTING=3Dy
>
>  # Boards:
>  #
> diff --git a/linux-user/meson.build b/linux-user/meson.build
> index 2b94e4ba24..31b5ed99b5 100644
> --- a/linux-user/meson.build
> +++ b/linux-user/meson.build
> @@ -29,6 +29,7 @@ subdir('microblaze')
>  subdir('mips64')
>  subdir('mips')
>  subdir('ppc')
> +subdir('riscv')
>  subdir('s390x')
>  subdir('sh4')
>  subdir('sparc64')
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index 941ca99722..faeaab9614 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -105,6 +105,8 @@ typedef struct TaskState {
>      /* FPA state */
>      FPA11 fpa;
>  # endif
> +#endif
> +#if defined(TARGET_ARM) || defined(TARGET_RISCV)
>      int swi_errno;
>  #endif
>  #if defined(TARGET_I386) && !defined(TARGET_X86_64)
> @@ -118,7 +120,7 @@ typedef struct TaskState {
>  #ifdef TARGET_M68K
>      abi_ulong tp_value;
>  #endif
> -#if defined(TARGET_ARM) || defined(TARGET_M68K)
> +#if defined(TARGET_ARM) || defined(TARGET_M68K) || defined(TARGET_RISCV)
>      /* Extra fields for semihosted binaries.  */
>      abi_ulong heap_base;
>      abi_ulong heap_limit;
> diff --git a/linux-user/riscv/meson.build b/linux-user/riscv/meson.build
> new file mode 100644
> index 0000000000..aee3179cdb
> --- /dev/null
> +++ b/linux-user/riscv/meson.build
> @@ -0,0 +1,2 @@
> +linux_user_ss.add(when: 'TARGET_RISCV64', if_true: files('semihost.c'))
> +linux_user_ss.add(when: 'TARGET_RISCV32', if_true: files('semihost.c'))
> diff --git a/linux-user/riscv/semihost.c b/linux-user/riscv/semihost.c
> new file mode 100644
> index 0000000000..2d35ebab68
> --- /dev/null
> +++ b/linux-user/riscv/semihost.c
> @@ -0,0 +1,76 @@
> +/*
> + * RISC-V Semihosting Console Support
> + *
> + * Copyright (c) 2019 Linaro Ltd
> + *
> + * Currently RISC-V and ARM are unique in having support for semihosting=
 support
> + * in linux-user. So for now we implement the common console API but
> + * just for risc-v and arm linux-user.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "hw/semihosting/console.h"
> +#include "qemu.h"
> +#include <termios.h>
> +
> +int qemu_semihosting_console_outs(CPUArchState *env, target_ulong addr)
> +{
> +    int len =3D target_strlen(addr);
> +    void *s;
> +    if (len < 0) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: passed inaccessible address " TARGET_FMT_lx,
> +                      __func__, addr);
> +        return 0;
> +    }
> +    s =3D lock_user(VERIFY_READ, addr, (long)(len + 1), 1);
> +    g_assert(s);  /* target_strlen has already verified this will work *=
/
> +    len =3D write(STDERR_FILENO, s, len);
> +    unlock_user(s, addr, 0);
> +    return len;
> +}
> +
> +void qemu_semihosting_console_outc(CPUArchState *env, target_ulong addr)
> +{
> +    char c;
> +
> +    if (get_user_u8(c, addr)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: passed inaccessible address " TARGET_FMT_lx,
> +                      __func__, addr);
> +    } else {
> +        if (write(STDERR_FILENO, &c, 1) !=3D 1) {
> +            qemu_log_mask(LOG_UNIMP, "%s: unexpected write to stdout fai=
lure",
> +                          __func__);
> +        }
> +    }
> +}
> +
> +/*
> + * For linux-user we can safely block. However as we want to return as
> + * soon as a character is read we need to tweak the termio to disable
> + * line buffering. We restore the old mode afterwards in case the
> + * program is expecting more normal behaviour. This is slow but
> + * nothing using semihosting console reading is expecting to be fast.
> + */
> +target_ulong qemu_semihosting_console_inc(CPUArchState *env)
> +{
> +    uint8_t c;
> +    struct termios old_tio, new_tio;
> +
> +    /* Disable line-buffering and echo */
> +    tcgetattr(STDIN_FILENO, &old_tio);
> +    new_tio =3D old_tio;
> +    new_tio.c_lflag &=3D (~ICANON & ~ECHO);
> +    tcsetattr(STDIN_FILENO, TCSANOW, &new_tio);
> +
> +    c =3D getchar();
> +
> +    /* restore config */
> +    tcsetattr(STDIN_FILENO, TCSANOW, &old_tio);
> +
> +    return (target_ulong) c;
> +}
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 1da52a269c..0dcf15b480 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4192,10 +4192,10 @@ ERST
>  DEF("semihosting", 0, QEMU_OPTION_semihosting,
>      "-semihosting    semihosting mode\n",
>      QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA | QEMU_ARCH_LM32 |
> -    QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2)
> +    QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
>  SRST
>  ``-semihosting``
> -    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II only).
> +    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V on=
ly).
>
>      Note that this allows guest direct access to the host filesystem, so
>      should only be used with a trusted guest OS.
> @@ -4207,10 +4207,10 @@ DEF("semihosting-config", HAS_ARG, QEMU_OPTION_se=
mihosting_config,
>      "-semihosting-config [enable=3Don|off][,target=3Dnative|gdb|auto][,c=
hardev=3Did][,arg=3Dstr[,...]]\n" \
>      "                semihosting configuration\n",
>  QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA | QEMU_ARCH_LM32 |
> -QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2)
> +QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
>  SRST
>  ``-semihosting-config [enable=3Don|off][,target=3Dnative|gdb|auto][,char=
dev=3Did][,arg=3Dstr[,...]]``
> -    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II
> +    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II, =
RISC-V
>      only).
>
>      Note that this allows guest direct access to the host filesystem, so
> @@ -4225,6 +4225,8 @@ SRST
>      open/read/write/seek/select. Tensilica baremetal libc for ISS and
>      linux platform "sim" use this interface.
>
> +    On RISC-V this implements the standard semihosting API, version 0.2.
> +
>      ``target=3Dnative|gdb|auto``
>          Defines where the semihosting calls will be addressed, to QEMU
>          (``native``) or to GDB (``gdb``). The default is ``auto``, which
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index de275782e6..2ab5220964 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -460,4 +460,11 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operatio=
ns *ops);
>
>  void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
>
> +typedef CPURISCVState CPUArchState;
> +typedef RISCVCPU ArchCPU;
> +
> +target_ulong do_riscv_semihosting(CPURISCVState *env);
> +
> +#include "exec/cpu-all.h"

This isn't used in the header so it shouldn't be here.

> +
>  #endif /* RISCV_CPU_H */
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index bd36062877..26a60b9e27 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -556,6 +556,7 @@
>  #define RISCV_EXCP_INST_PAGE_FAULT               0xc /* since: priv-1.10=
.0 */
>  #define RISCV_EXCP_LOAD_PAGE_FAULT               0xd /* since: priv-1.10=
.0 */
>  #define RISCV_EXCP_STORE_PAGE_FAULT              0xf /* since: priv-1.10=
.0 */
> +#define RISCV_EXCP_SEMIHOST                      0x10

I don't see this in the RISC-V spec, it seems to just be reserved, not
for semihosting.

>  #define RISCV_EXCP_INST_GUEST_PAGE_FAULT         0x14
>  #define RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT       0x15
>  #define RISCV_EXCP_VIRT_INSTRUCTION_FAULT        0x16
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 904899054d..ddb751df26 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -856,6 +856,15 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>      target_ulong htval =3D 0;
>      target_ulong mtval2 =3D 0;
>
> +    if  (cause =3D=3D RISCV_EXCP_SEMIHOST) {
> +        if (env->priv >=3D PRV_S) {
> +            env->gpr[xA0] =3D do_riscv_semihosting(env);
> +            env->pc +=3D 4;
> +            return;
> +        }
> +        cause =3D RISCV_EXCP_BREAKPOINT;
> +    }
> +
>      if (!async) {
>          /* set tval to badaddr for traps with address information */
>          switch (cause) {
> diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/risc=
v/insn_trans/trans_privileged.c.inc
> index 2a61a853bf..8104f7b13c 100644
> --- a/target/riscv/insn_trans/trans_privileged.c.inc
> +++ b/target/riscv/insn_trans/trans_privileged.c.inc
> @@ -29,7 +29,29 @@ static bool trans_ecall(DisasContext *ctx, arg_ecall *=
a)
>
>  static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
>  {
> -    generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
> +    uint32_t pre    =3D opcode_at(&ctx->base, ctx->base.pc_next - 4);
> +    uint32_t ebreak =3D opcode_at(&ctx->base, ctx->base.pc_next);
> +    uint32_t post   =3D opcode_at(&ctx->base, ctx->base.pc_next + 4);
> +
> +    /*
> +     * The RISC-V semihosting spec specifies the following
> +     * three-instruction sequence to flag a semihosting call:
> +     *
> +     *      slli zero, zero, 0x1f       0x01f01013
> +     *      ebreak                      0x00100073
> +     *      srai zero, zero, 0x7        0x40705013
> +     *
> +     * The two shift operations on the zero register are no-ops, used
> +     * here to signify a semihosting exception, rather than a breakpoint=
.
> +     *
> +     * Uncompressed instructions are used so that the sequence is easy
> +     * to validate.
> +     */
> +    if  (pre =3D=3D 0x01f01013 && ebreak =3D=3D 0x00100073 && post =3D=
=3D 0x40705013) {
> +        generate_exception(ctx, RISCV_EXCP_SEMIHOST);
> +    } else {
> +        generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
> +    }
>      exit_tb(ctx); /* no chaining */
>      ctx->base.is_jmp =3D DISAS_NORETURN;
>      return true;
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index abd647fea1..3d95282cb3 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -22,6 +22,7 @@ riscv_ss.add(files(
>    'op_helper.c',
>    'vector_helper.c',
>    'translate.c',
> +  'riscv-semi.c'
>  ))
>
>  riscv_softmmu_ss =3D ss.source_set()
> diff --git a/target/riscv/riscv-semi.c b/target/riscv/riscv-semi.c
> new file mode 100644
> index 0000000000..ea705899ea
> --- /dev/null
> +++ b/target/riscv/riscv-semi.c
> @@ -0,0 +1,1086 @@
> +/*
> + *  RISC-V semihosting syscalls
> + *
> + *  Copyright (c) 2005, 2007 CodeSourcery.
> + *  Copyright (c) 2019 Linaro
> + *  Copyright =C2=A9 2019 Keith Packard
> + *  Written by Paul Brook.
> + *  Adapted for RISC-V by Keith Packard
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> + *
> + *  ARM Semihosting is documented in:
> + *     Semihosting for AArch32 and AArch64 Release 2.0
> + *     https://static.docs.arm.com/100863/0200/semihosting.pdf

Maybe just point to the RISC-V doc instead.

> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "cpu.h"
> +#include "hw/semihosting/semihost.h"
> +#include "hw/semihosting/console.h"
> +#include "qemu/log.h"
> +#ifdef CONFIG_USER_ONLY
> +#include "qemu.h"
> +
> +#define RISCV_HEAP_SIZE (128 * 1024 * 1024)
> +#else
> +#include "exec/gdbstub.h"
> +#include "qemu/cutils.h"
> +#endif
> +
> +#define TARGET_SYS_OPEN        0x01
> +#define TARGET_SYS_CLOSE       0x02
> +#define TARGET_SYS_WRITEC      0x03
> +#define TARGET_SYS_WRITE0      0x04
> +#define TARGET_SYS_WRITE       0x05
> +#define TARGET_SYS_READ        0x06
> +#define TARGET_SYS_READC       0x07
> +#define TARGET_SYS_ISTTY       0x09
> +#define TARGET_SYS_SEEK        0x0a
> +#define TARGET_SYS_FLEN        0x0c
> +#define TARGET_SYS_TMPNAM      0x0d
> +#define TARGET_SYS_REMOVE      0x0e
> +#define TARGET_SYS_RENAME      0x0f
> +#define TARGET_SYS_CLOCK       0x10
> +#define TARGET_SYS_TIME        0x11
> +#define TARGET_SYS_SYSTEM      0x12
> +#define TARGET_SYS_ERRNO       0x13
> +#define TARGET_SYS_GET_CMDLINE 0x15
> +#define TARGET_SYS_HEAPINFO    0x16
> +#define TARGET_SYS_EXIT        0x18
> +#define TARGET_SYS_SYNCCACHE   0x19
> +#define TARGET_SYS_EXIT_EXTENDED 0x20
> +
> +/*
> + * ADP_Stopped_ApplicationExit is used for exit(0),
> + * anything else is implemented as exit(1)
> + */
> +#define ADP_Stopped_ApplicationExit     (0x20026)
> +
> +#ifndef O_BINARY
> +#define O_BINARY 0
> +#endif
> +
> +#define GDB_O_RDONLY  0x000
> +#define GDB_O_WRONLY  0x001
> +#define GDB_O_RDWR    0x002
> +#define GDB_O_APPEND  0x008
> +#define GDB_O_CREAT   0x200
> +#define GDB_O_TRUNC   0x400
> +#define GDB_O_BINARY  0
> +
> +static int gdb_open_modeflags[12] =3D {
> +    GDB_O_RDONLY,
> +    GDB_O_RDONLY | GDB_O_BINARY,
> +    GDB_O_RDWR,
> +    GDB_O_RDWR | GDB_O_BINARY,
> +    GDB_O_WRONLY | GDB_O_CREAT | GDB_O_TRUNC,
> +    GDB_O_WRONLY | GDB_O_CREAT | GDB_O_TRUNC | GDB_O_BINARY,
> +    GDB_O_RDWR | GDB_O_CREAT | GDB_O_TRUNC,
> +    GDB_O_RDWR | GDB_O_CREAT | GDB_O_TRUNC | GDB_O_BINARY,
> +    GDB_O_WRONLY | GDB_O_CREAT | GDB_O_APPEND,
> +    GDB_O_WRONLY | GDB_O_CREAT | GDB_O_APPEND | GDB_O_BINARY,
> +    GDB_O_RDWR | GDB_O_CREAT | GDB_O_APPEND,
> +    GDB_O_RDWR | GDB_O_CREAT | GDB_O_APPEND | GDB_O_BINARY
> +};
> +
> +static int open_modeflags[12] =3D {
> +    O_RDONLY,
> +    O_RDONLY | O_BINARY,
> +    O_RDWR,
> +    O_RDWR | O_BINARY,
> +    O_WRONLY | O_CREAT | O_TRUNC,
> +    O_WRONLY | O_CREAT | O_TRUNC | O_BINARY,
> +    O_RDWR | O_CREAT | O_TRUNC,
> +    O_RDWR | O_CREAT | O_TRUNC | O_BINARY,
> +    O_WRONLY | O_CREAT | O_APPEND,
> +    O_WRONLY | O_CREAT | O_APPEND | O_BINARY,
> +    O_RDWR | O_CREAT | O_APPEND,
> +    O_RDWR | O_CREAT | O_APPEND | O_BINARY
> +};
> +
> +typedef enum GuestFDType {
> +    GuestFDUnused =3D 0,
> +    GuestFDHost =3D 1,
> +    GuestFDGDB =3D 2,
> +    GuestFDFeatureFile =3D 3,
> +} GuestFDType;
> +
> +/*
> + * Guest file descriptors are integer indexes into an array of
> + * these structures (we will dynamically resize as necessary).
> + */
> +typedef struct GuestFD {
> +    GuestFDType type;
> +    union {
> +        int hostfd;
> +        target_ulong featurefile_offset;
> +    };
> +} GuestFD;
> +
> +static GArray *guestfd_array;
> +
> +#define FIRST_GUEST_FD  3
> +
> +/*
> + * Allocate a new guest file descriptor and return it; if we
> + * couldn't allocate a new fd then return -1.
> + * This is a fairly simplistic implementation because we don't
> + * expect that most semihosting guest programs will make very
> + * heavy use of opening and closing fds.
> + */
> +static int alloc_guestfd(void)
> +{
> +    guint i;
> +
> +    if (!guestfd_array) {
> +        /* New entries zero-initialized, i.e. type GuestFDUnused */
> +        guestfd_array =3D g_array_new(FALSE, TRUE, sizeof(GuestFD));
> +    }
> +
> +    for (i =3D FIRST_GUEST_FD; i < guestfd_array->len; i++) {
> +        GuestFD *gf =3D &g_array_index(guestfd_array, GuestFD, i);
> +
> +        if (gf->type =3D=3D GuestFDUnused) {
> +            return i;
> +        }
> +    }
> +
> +    /* All elements already in use: expand the array */
> +    g_array_set_size(guestfd_array, i + 1);
> +    return i;
> +}
> +
> +/*
> + * Look up the guestfd in the data structure; return NULL
> + * for out of bounds, but don't check whether the slot is unused.
> + * This is used internally by the other guestfd functions.
> + */
> +static GuestFD *do_get_guestfd(int guestfd)
> +{
> +    if (!guestfd_array) {
> +        return NULL;
> +    }
> +
> +    if (guestfd < 0 || guestfd >=3D guestfd_array->len) {
> +        return NULL;
> +    }
> +
> +    return &g_array_index(guestfd_array, GuestFD, guestfd);
> +}
> +
> +/*
> + * Associate the specified guest fd (which must have been
> + * allocated via alloc_fd() and not previously used) with
> + * the specified host/gdb fd.
> + */
> +static void associate_guestfd(int guestfd, int hostfd)
> +{
> +    GuestFD *gf =3D do_get_guestfd(guestfd);
> +
> +    assert(gf);
> +    gf->type =3D use_gdb_syscalls() ? GuestFDGDB : GuestFDHost;
> +    gf->hostfd =3D hostfd;
> +}
> +
> +/*
> + * Deallocate the specified guest file descriptor. This doesn't
> + * close the host fd, it merely undoes the work of alloc_fd().
> + */
> +static void dealloc_guestfd(int guestfd)
> +{
> +    GuestFD *gf =3D do_get_guestfd(guestfd);
> +
> +    assert(gf);
> +    gf->type =3D GuestFDUnused;
> +}
> +
> +/*
> + * Given a guest file descriptor, get the associated struct.
> + * If the fd is not valid, return NULL. This is the function
> + * used by the various semihosting calls to validate a handle
> + * from the guest.
> + * Note: calling alloc_guestfd() or dealloc_guestfd() will
> + * invalidate any GuestFD* obtained by calling this function.
> + */
> +static GuestFD *get_guestfd(int guestfd)
> +{
> +    GuestFD *gf =3D do_get_guestfd(guestfd);
> +
> +    if (!gf || gf->type =3D=3D GuestFDUnused) {
> +        return NULL;
> +    }
> +    return gf;
> +}
> +
> +/*
> + * The semihosting API has no concept of its errno being thread-safe,
> + * as the API design predates SMP CPUs and was intended as a simple
> + * real-hardware set of debug functionality. For QEMU, we make the
> + * errno be per-thread in linux-user mode; in softmmu it is a simple
> + * global, and we assume that the guest takes care of avoiding any races=
.
> + */
> +#ifndef CONFIG_USER_ONLY
> +static target_ulong syscall_err;
> +
> +#include "exec/softmmu-semi.h"
> +#endif
> +
> +static inline uint32_t set_swi_errno(CPURISCVState *env, uint32_t code)
> +{
> +    if (code =3D=3D (uint32_t)-1) {
> +#ifdef CONFIG_USER_ONLY
> +        CPUState *cs =3D env_cpu(env);
> +        TaskState *ts =3D cs->opaque;
> +
> +        ts->swi_errno =3D errno;
> +#else
> +        syscall_err =3D errno;
> +#endif
> +    }
> +    return code;
> +}
> +
> +static inline uint32_t get_swi_errno(CPURISCVState *env)
> +{
> +#ifdef CONFIG_USER_ONLY
> +    CPUState *cs =3D env_cpu(env);
> +    TaskState *ts =3D cs->opaque;
> +
> +    return ts->swi_errno;
> +#else
> +    return syscall_err;
> +#endif
> +}
> +
> +static target_ulong riscv_semi_syscall_len;

Could we split all of the shared code out somewhere?

> +
> +static void riscv_semi_cb(CPUState *cs, target_ulong ret, target_ulong e=
rr)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +    CPURISCVState *env =3D &cpu->env;
> +    target_ulong reg0 =3D env->gpr[xA0];
> +
> +    if (ret =3D=3D (target_ulong)-1) {
> +        errno =3D err;
> +        set_swi_errno(env, -1);
> +        reg0 =3D ret;
> +    } else {
> +        /* Fixup syscalls that use nonstardard return conventions.  */
> +        switch (reg0) {
> +        case TARGET_SYS_WRITE:
> +        case TARGET_SYS_READ:
> +            reg0 =3D riscv_semi_syscall_len - ret;
> +            break;
> +        case TARGET_SYS_SEEK:
> +            reg0 =3D 0;
> +            break;
> +        default:
> +            reg0 =3D ret;
> +            break;
> +        }
> +    }
> +    env->gpr[xA0] =3D reg0;
> +}
> +
> +static target_ulong riscv_flen_buf(RISCVCPU *cpu)
> +{
> +    /*
> +     * Return an address in target memory of 64 bytes where the remote
> +     * gdb should write its stat struct. (The format of this structure
> +     * is defined by GDB's remote protocol and is not target-specific.)
> +     * We put this on the guest's stack just below SP.
> +     */
> +    CPURISCVState *env =3D &cpu->env;
> +    target_ulong sp;
> +
> +    sp =3D env->gpr[xSP];
> +
> +    return sp - 64;
> +}
> +
> +static void riscv_semi_flen_cb(CPUState *cs, target_ulong ret, target_ul=
ong err)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +    CPURISCVState *env =3D &cpu->env;
> +    /*
> +     * The size is always stored in big-endian order, extract
> +     *  the value. We assume the size always fit in 32 bits.
> +     */
> +    uint32_t size;
> +    cpu_memory_rw_debug(cs, riscv_flen_buf(cpu) + 32, (uint8_t *)&size, =
4, 0);
> +    size =3D be32_to_cpu(size);
> +    env->gpr[xA0] =3D size;
> +    errno =3D err;
> +    set_swi_errno(env, -1);
> +}
> +
> +static int riscv_semi_open_guestfd;
> +
> +static void riscv_semi_open_cb(CPUState *cs, target_ulong ret, target_ul=
ong err)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +    CPURISCVState *env =3D &cpu->env;
> +    if (ret =3D=3D (target_ulong)-1) {
> +        errno =3D err;
> +        set_swi_errno(env, -1);
> +        dealloc_guestfd(riscv_semi_open_guestfd);
> +    } else {
> +        associate_guestfd(riscv_semi_open_guestfd, ret);
> +        ret =3D riscv_semi_open_guestfd;
> +    }
> +
> +    env->gpr[xA0] =3D ret;
> +}
> +
> +static target_ulong riscv_gdb_syscall(RISCVCPU *cpu, gdb_syscall_complet=
e_cb cb,
> +                                    const char *fmt, ...)
> +{
> +    va_list va;
> +    CPURISCVState *env =3D &cpu->env;
> +
> +    va_start(va, fmt);
> +    gdb_do_syscallv(cb, fmt, va);
> +    va_end(va);
> +
> +    /*
> +     * FIXME: in softmmu mode, the gdbstub will schedule our callback
> +     * to occur, but will not actually call it to complete the syscall
> +     * until after this function has returned and we are back in the
> +     * CPU main loop. Therefore callers to this function must not
> +     * do anything with its return value, because it is not necessarily
> +     * the result of the syscall, but could just be the old value of X0.
> +     * The only thing safe to do with this is that the callers of
> +     * do_riscv_semihosting() will write it straight back into X0.
> +     * (In linux-user mode, the callback will have happened before
> +     * gdb_do_syscallv() returns.)
> +     *
> +     * We should tidy this up so neither this function nor
> +     * do_riscv_semihosting() return a value, so the mistake of
> +     * doing something with the return value is not possible to make.
> +     */
> +
> +    return env->gpr[xA0];
> +}
> +
> +/*
> + * Types for functions implementing various semihosting calls
> + * for specific types of guest file descriptor. These must all
> + * do the work and return the required return value for the guest,
> + * setting the guest errno if appropriate.
> + */
> +typedef uint32_t sys_closefn(RISCVCPU *cpu, GuestFD *gf);
> +typedef uint32_t sys_writefn(RISCVCPU *cpu, GuestFD *gf,
> +                             target_ulong buf, uint32_t len);
> +typedef uint32_t sys_readfn(RISCVCPU *cpu, GuestFD *gf,
> +                            target_ulong buf, uint32_t len);
> +typedef uint32_t sys_isattyfn(RISCVCPU *cpu, GuestFD *gf);
> +typedef uint32_t sys_seekfn(RISCVCPU *cpu, GuestFD *gf,
> +                            target_ulong offset);
> +typedef uint32_t sys_flenfn(RISCVCPU *cpu, GuestFD *gf);
> +
> +static uint32_t host_closefn(RISCVCPU *cpu, GuestFD *gf)
> +{
> +    CPURISCVState *env =3D &cpu->env;
> +
> +    return set_swi_errno(env, close(gf->hostfd));
> +}
> +
> +static uint32_t host_writefn(RISCVCPU *cpu, GuestFD *gf,
> +                             target_ulong buf, uint32_t len)
> +{
> +    uint32_t ret;
> +    CPURISCVState *env =3D &cpu->env;
> +    char *s =3D lock_user(VERIFY_READ, buf, len, 1);
> +    if (!s) {
> +        /* Return bytes not written on error */
> +        return len;
> +    }
> +    ret =3D set_swi_errno(env, write(gf->hostfd, s, len));
> +    unlock_user(s, buf, 0);
> +    if (ret =3D=3D (uint32_t)-1) {
> +        ret =3D 0;
> +    }
> +    /* Return bytes not written */
> +    return len - ret;
> +}
> +
> +static uint32_t host_readfn(RISCVCPU *cpu, GuestFD *gf,
> +                            target_ulong buf, uint32_t len)
> +{
> +    uint32_t ret;
> +    CPURISCVState *env =3D &cpu->env;
> +    char *s =3D lock_user(VERIFY_WRITE, buf, len, 0);
> +    if (!s) {
> +        /* return bytes not read */
> +        return len;
> +    }
> +    do {
> +        ret =3D set_swi_errno(env, read(gf->hostfd, s, len));
> +    } while (ret =3D=3D -1 && errno =3D=3D EINTR);
> +    unlock_user(s, buf, len);
> +    if (ret =3D=3D (uint32_t)-1) {
> +        ret =3D 0;
> +    }
> +    /* Return bytes not read */
> +    return len - ret;
> +}
> +
> +static uint32_t host_isattyfn(RISCVCPU *cpu, GuestFD *gf)
> +{
> +    return isatty(gf->hostfd);
> +}
> +
> +static uint32_t host_seekfn(RISCVCPU *cpu, GuestFD *gf, target_ulong off=
set)
> +{
> +    CPURISCVState *env =3D &cpu->env;
> +    uint32_t ret =3D set_swi_errno(env, lseek(gf->hostfd, offset, SEEK_S=
ET));
> +    if (ret =3D=3D (uint32_t)-1) {
> +        return -1;
> +    }
> +    return 0;
> +}
> +
> +static uint32_t host_flenfn(RISCVCPU *cpu, GuestFD *gf)
> +{
> +    CPURISCVState *env =3D &cpu->env;
> +    struct stat buf;
> +    uint32_t ret =3D set_swi_errno(env, fstat(gf->hostfd, &buf));
> +    if (ret =3D=3D (uint32_t)-1) {
> +        return -1;
> +    }
> +    return buf.st_size;
> +}
> +
> +static uint32_t gdb_closefn(RISCVCPU *cpu, GuestFD *gf)
> +{
> +    return riscv_gdb_syscall(cpu, riscv_semi_cb, "close,%x", gf->hostfd)=
;
> +}
> +
> +static uint32_t gdb_writefn(RISCVCPU *cpu, GuestFD *gf,
> +                            target_ulong buf, uint32_t len)
> +{
> +    riscv_semi_syscall_len =3D len;
> +    return riscv_gdb_syscall(cpu, riscv_semi_cb, "write,%x,%x,%x",
> +                           gf->hostfd, buf, len);
> +}
> +
> +static uint32_t gdb_readfn(RISCVCPU *cpu, GuestFD *gf,
> +                           target_ulong buf, uint32_t len)
> +{
> +    riscv_semi_syscall_len =3D len;
> +    return riscv_gdb_syscall(cpu, riscv_semi_cb, "read,%x,%x,%x",
> +                           gf->hostfd, buf, len);
> +}
> +
> +static uint32_t gdb_isattyfn(RISCVCPU *cpu, GuestFD *gf)
> +{
> +    return riscv_gdb_syscall(cpu, riscv_semi_cb, "isatty,%x", gf->hostfd=
);
> +}
> +
> +static uint32_t gdb_seekfn(RISCVCPU *cpu, GuestFD *gf, target_ulong offs=
et)
> +{
> +    return riscv_gdb_syscall(cpu, riscv_semi_cb, "lseek,%x,%x,0",
> +                           gf->hostfd, offset);
> +}
> +
> +static uint32_t gdb_flenfn(RISCVCPU *cpu, GuestFD *gf)
> +{
> +    return riscv_gdb_syscall(cpu, riscv_semi_flen_cb, "fstat,%x,%x",
> +                           gf->hostfd, riscv_flen_buf(cpu));
> +}
> +
> +#define SHFB_MAGIC_0 0x53
> +#define SHFB_MAGIC_1 0x48
> +#define SHFB_MAGIC_2 0x46
> +#define SHFB_MAGIC_3 0x42
> +
> +/* Feature bits reportable in feature byte 0 */
> +#define SH_EXT_EXIT_EXTENDED (1 << 0)
> +#define SH_EXT_STDOUT_STDERR (1 << 1)
> +
> +static const uint8_t featurefile_data[] =3D {
> +    SHFB_MAGIC_0,
> +    SHFB_MAGIC_1,
> +    SHFB_MAGIC_2,
> +    SHFB_MAGIC_3,
> +    SH_EXT_EXIT_EXTENDED | SH_EXT_STDOUT_STDERR, /* Feature byte 0 */
> +};
> +
> +static void init_featurefile_guestfd(int guestfd)
> +{
> +    GuestFD *gf =3D do_get_guestfd(guestfd);
> +
> +    assert(gf);
> +    gf->type =3D GuestFDFeatureFile;
> +    gf->featurefile_offset =3D 0;
> +}
> +
> +static uint32_t featurefile_closefn(RISCVCPU *cpu, GuestFD *gf)
> +{
> +    /* Nothing to do */
> +    return 0;
> +}
> +
> +static uint32_t featurefile_writefn(RISCVCPU *cpu, GuestFD *gf,
> +                                    target_ulong buf, uint32_t len)
> +{
> +    /* This fd can never be open for writing */
> +    CPURISCVState *env =3D &cpu->env;
> +
> +    errno =3D EBADF;
> +    return set_swi_errno(env, -1);
> +}
> +
> +static uint32_t featurefile_readfn(RISCVCPU *cpu, GuestFD *gf,
> +                                   target_ulong buf, uint32_t len)
> +{
> +    uint32_t i;
> +#ifndef CONFIG_USER_ONLY
> +    CPURISCVState *env =3D &cpu->env;
> +#endif
> +    char *s;
> +
> +    s =3D lock_user(VERIFY_WRITE, buf, len, 0);
> +    if (!s) {
> +        return len;
> +    }
> +
> +    for (i =3D 0; i < len; i++) {
> +        if (gf->featurefile_offset >=3D sizeof(featurefile_data)) {
> +            break;
> +        }
> +        s[i] =3D featurefile_data[gf->featurefile_offset];
> +        gf->featurefile_offset++;
> +    }
> +
> +    unlock_user(s, buf, len);
> +
> +    /* Return number of bytes not read */
> +    return len - i;
> +}
> +
> +static uint32_t featurefile_isattyfn(RISCVCPU *cpu, GuestFD *gf)
> +{
> +    return 0;
> +}
> +
> +static uint32_t featurefile_seekfn(RISCVCPU *cpu, GuestFD *gf,
> +                                   target_ulong offset)
> +{
> +    gf->featurefile_offset =3D offset;
> +    return 0;
> +}
> +
> +static uint32_t featurefile_flenfn(RISCVCPU *cpu, GuestFD *gf)
> +{
> +    return sizeof(featurefile_data);
> +}
> +
> +typedef struct GuestFDFunctions {
> +    sys_closefn *closefn;
> +    sys_writefn *writefn;
> +    sys_readfn *readfn;
> +    sys_isattyfn *isattyfn;
> +    sys_seekfn *seekfn;
> +    sys_flenfn *flenfn;
> +} GuestFDFunctions;
> +
> +static const GuestFDFunctions guestfd_fns[] =3D {
> +    [GuestFDHost] =3D {
> +        .closefn =3D host_closefn,
> +        .writefn =3D host_writefn,
> +        .readfn =3D host_readfn,
> +        .isattyfn =3D host_isattyfn,
> +        .seekfn =3D host_seekfn,
> +        .flenfn =3D host_flenfn,
> +    },
> +    [GuestFDGDB] =3D {
> +        .closefn =3D gdb_closefn,
> +        .writefn =3D gdb_writefn,
> +        .readfn =3D gdb_readfn,
> +        .isattyfn =3D gdb_isattyfn,
> +        .seekfn =3D gdb_seekfn,
> +        .flenfn =3D gdb_flenfn,
> +    },
> +    [GuestFDFeatureFile] =3D {
> +        .closefn =3D featurefile_closefn,
> +        .writefn =3D featurefile_writefn,
> +        .readfn =3D featurefile_readfn,
> +        .isattyfn =3D featurefile_isattyfn,
> +        .seekfn =3D featurefile_seekfn,
> +        .flenfn =3D featurefile_flenfn,
> +    },
> +};
> +
> +/*
> + * Read the input value from the argument block; fail the semihosting
> + * call if the memory read fails.
> + */
> +#define GET_ARG(n) do {                                                 =
\
> +        if (get_user_ual(arg ## n, args + (n) * sizeof(target_ulong))) {=
 \
> +            errno =3D EFAULT;                                           =
  \
> +            return set_swi_errno(env, -1);                              =
\
> +        }                                                               =
\
> +    } while (0)
> +
> +#define SET_ARG(n, val)                                 \
> +    put_user_ual(val, args + (n) * sizeof(target_ulong))
> +
> +/*
> + * Do a semihosting call.
> + *
> + * The specification always says that the "return register" either
> + * returns a specific value or is corrupted, so we don't need to
> + * report to our caller whether we are returning a value or trying to
> + * leave the register unchanged. We use 0xdeadbeef as the return value
> + * when there isn't a defined return value for the call.
> + */
> +target_ulong do_riscv_semihosting(CPURISCVState *env)
> +{
> +    RISCVCPU *cpu =3D env_archcpu(env);
> +    CPUState *cs =3D env_cpu(env);
> +    target_ulong args;
> +    target_ulong arg0, arg1, arg2, arg3;
> +    char *s;
> +    int nr;
> +    uint32_t ret;
> +    uint32_t len;
> +    GuestFD *gf;
> +
> +    nr =3D env->gpr[xA0] & 0xffffffffU;
> +    args =3D env->gpr[xA1];
> +
> +    switch (nr) {
> +    case TARGET_SYS_OPEN:
> +    {
> +        int guestfd;
> +
> +        GET_ARG(0);
> +        GET_ARG(1);
> +        GET_ARG(2);
> +        s =3D lock_user_string(arg0);
> +        if (!s) {
> +            errno =3D EFAULT;
> +            return set_swi_errno(env, -1);
> +        }
> +        if (arg1 >=3D 12) {
> +            unlock_user(s, arg0, 0);
> +            errno =3D EINVAL;
> +            return set_swi_errno(env, -1);
> +        }
> +
> +        guestfd =3D alloc_guestfd();
> +        if (guestfd < 0) {
> +            unlock_user(s, arg0, 0);
> +            errno =3D EMFILE;
> +            return set_swi_errno(env, -1);
> +        }
> +
> +        if (strcmp(s, ":tt") =3D=3D 0) {
> +            int result_fileno;
> +
> +            /*
> +             * We implement SH_EXT_STDOUT_STDERR, so:
> +             *  open for read =3D=3D stdin
> +             *  open for write =3D=3D stdout
> +             *  open for append =3D=3D stderr
> +             */
> +            if (arg1 < 4) {
> +                result_fileno =3D STDIN_FILENO;
> +            } else if (arg1 < 8) {
> +                result_fileno =3D STDOUT_FILENO;
> +            } else {
> +                result_fileno =3D STDERR_FILENO;
> +            }
> +            associate_guestfd(guestfd, result_fileno);
> +            unlock_user(s, arg0, 0);
> +            return guestfd;
> +        }
> +        if (strcmp(s, ":semihosting-features") =3D=3D 0) {
> +            unlock_user(s, arg0, 0);
> +            /* We must fail opens for modes other than 0 ('r') or 1 ('rb=
') */
> +            if (arg1 !=3D 0 && arg1 !=3D 1) {
> +                dealloc_guestfd(guestfd);
> +                errno =3D EACCES;
> +                return set_swi_errno(env, -1);
> +            }
> +            init_featurefile_guestfd(guestfd);
> +            return guestfd;
> +        }
> +
> +        if (use_gdb_syscalls()) {
> +            riscv_semi_open_guestfd =3D guestfd;
> +            ret =3D riscv_gdb_syscall(cpu, riscv_semi_open_cb,
> +                                    "open,%s,%x,1a4", arg0,
> +                                    (int)arg2 + 1, gdb_open_modeflags[ar=
g1]);
> +        } else {
> +            ret =3D set_swi_errno(env, open(s, open_modeflags[arg1], 064=
4));
> +            if (ret =3D=3D (uint32_t)-1) {
> +                dealloc_guestfd(guestfd);
> +            } else {
> +                associate_guestfd(guestfd, ret);
> +                ret =3D guestfd;
> +            }
> +        }
> +        unlock_user(s, arg0, 0);
> +        return ret;
> +    }
> +    case TARGET_SYS_CLOSE:
> +        GET_ARG(0);
> +
> +        gf =3D get_guestfd(arg0);
> +        if (!gf) {
> +            errno =3D EBADF;
> +            return set_swi_errno(env, -1);
> +        }
> +
> +        ret =3D guestfd_fns[gf->type].closefn(cpu, gf);
> +        dealloc_guestfd(arg0);
> +        return ret;
> +    case TARGET_SYS_WRITEC:
> +        qemu_semihosting_console_outc(env, args);
> +        return 0xdeadbeef;
> +    case TARGET_SYS_WRITE0:
> +        return qemu_semihosting_console_outs(env, args);
> +    case TARGET_SYS_WRITE:
> +        GET_ARG(0);
> +        GET_ARG(1);
> +        GET_ARG(2);
> +        len =3D arg2;
> +
> +        gf =3D get_guestfd(arg0);
> +        if (!gf) {
> +            errno =3D EBADF;
> +            return set_swi_errno(env, -1);
> +        }
> +
> +        return guestfd_fns[gf->type].writefn(cpu, gf, arg1, len);
> +    case TARGET_SYS_READ:
> +        GET_ARG(0);
> +        GET_ARG(1);
> +        GET_ARG(2);
> +        len =3D arg2;
> +
> +        gf =3D get_guestfd(arg0);
> +        if (!gf) {
> +            errno =3D EBADF;
> +            return set_swi_errno(env, -1);
> +        }
> +
> +        return guestfd_fns[gf->type].readfn(cpu, gf, arg1, len);
> +    case TARGET_SYS_READC:
> +        return qemu_semihosting_console_inc(env);
> +    case TARGET_SYS_ISTTY:
> +        GET_ARG(0);
> +
> +        gf =3D get_guestfd(arg0);
> +        if (!gf) {
> +            errno =3D EBADF;
> +            return set_swi_errno(env, -1);
> +        }
> +
> +        return guestfd_fns[gf->type].isattyfn(cpu, gf);
> +    case TARGET_SYS_SEEK:
> +        GET_ARG(0);
> +        GET_ARG(1);
> +
> +        gf =3D get_guestfd(arg0);
> +        if (!gf) {
> +            errno =3D EBADF;
> +            return set_swi_errno(env, -1);
> +        }
> +
> +        return guestfd_fns[gf->type].seekfn(cpu, gf, arg1);
> +    case TARGET_SYS_FLEN:
> +        GET_ARG(0);
> +
> +        gf =3D get_guestfd(arg0);
> +        if (!gf) {
> +            errno =3D EBADF;
> +            return set_swi_errno(env, -1);
> +        }
> +
> +        return guestfd_fns[gf->type].flenfn(cpu, gf);
> +    case TARGET_SYS_TMPNAM:
> +        qemu_log_mask(LOG_UNIMP, "%s: SYS_TMPNAM not implemented", __fun=
c__);
> +        return -1;
> +    case TARGET_SYS_REMOVE:
> +        GET_ARG(0);
> +        GET_ARG(1);
> +        if (use_gdb_syscalls()) {
> +            ret =3D riscv_gdb_syscall(cpu, riscv_semi_cb, "unlink,%s",
> +                                  arg0, (int)arg1 + 1);
> +        } else {
> +            s =3D lock_user_string(arg0);
> +            if (!s) {
> +                errno =3D EFAULT;
> +                return set_swi_errno(env, -1);
> +            }
> +            ret =3D  set_swi_errno(env, remove(s));
> +            unlock_user(s, arg0, 0);
> +        }
> +        return ret;
> +    case TARGET_SYS_RENAME:
> +        GET_ARG(0);
> +        GET_ARG(1);
> +        GET_ARG(2);
> +        GET_ARG(3);
> +        if (use_gdb_syscalls()) {
> +            return riscv_gdb_syscall(cpu, riscv_semi_cb, "rename,%s,%s",
> +                                   arg0, (int)arg1 + 1, arg2, (int)arg3 =
+ 1);
> +        } else {
> +            char *s2;
> +            s =3D lock_user_string(arg0);
> +            s2 =3D lock_user_string(arg2);
> +            if (!s || !s2) {
> +                errno =3D EFAULT;
> +                ret =3D set_swi_errno(env, -1);
> +            } else {
> +                ret =3D set_swi_errno(env, rename(s, s2));
> +            }
> +            if (s2) {
> +                unlock_user(s2, arg2, 0);
> +            }
> +            if (s) {
> +                unlock_user(s, arg0, 0);
> +            }
> +            return ret;
> +        }
> +    case TARGET_SYS_CLOCK:
> +        return clock() / (CLOCKS_PER_SEC / 100);
> +    case TARGET_SYS_TIME:
> +        return set_swi_errno(env, time(NULL));
> +    case TARGET_SYS_SYSTEM:
> +        GET_ARG(0);
> +        GET_ARG(1);
> +        if (use_gdb_syscalls()) {
> +            return riscv_gdb_syscall(cpu, riscv_semi_cb, "system,%s",
> +                                   arg0, (int)arg1 + 1);
> +        } else {
> +            s =3D lock_user_string(arg0);
> +            if (!s) {
> +                errno =3D EFAULT;
> +                return set_swi_errno(env, -1);
> +            }
> +            ret =3D set_swi_errno(env, system(s));
> +            unlock_user(s, arg0, 0);
> +            return ret;
> +        }
> +    case TARGET_SYS_ERRNO:
> +        return get_swi_errno(env);
> +    case TARGET_SYS_GET_CMDLINE:
> +        {
> +            /*
> +             * Build a command-line from the original argv.
> +             *
> +             * The inputs are:
> +             *     * arg0, pointer to a buffer of at least the size
> +             *               specified in arg1.
> +             *     * arg1, size of the buffer pointed to by arg0 in
> +             *               bytes.
> +             *
> +             * The outputs are:
> +             *     * arg0, pointer to null-terminated string of the
> +             *               command line.
> +             *     * arg1, length of the string pointed to by arg0.
> +             */
> +
> +            char *output_buffer;
> +            size_t input_size;
> +            size_t output_size;
> +            int status =3D 0;
> +#if !defined(CONFIG_USER_ONLY)
> +            const char *cmdline;
> +#else
> +            TaskState *ts =3D cs->opaque;
> +#endif
> +            GET_ARG(0);
> +            GET_ARG(1);
> +            input_size =3D arg1;
> +            /* Compute the size of the output string.  */
> +#if !defined(CONFIG_USER_ONLY)
> +            cmdline =3D semihosting_get_cmdline();
> +            if (cmdline =3D=3D NULL) {
> +                cmdline =3D ""; /* Default to an empty line. */
> +            }
> +            output_size =3D strlen(cmdline) + 1; /* Count terminating 0.=
 */
> +#else
> +            unsigned int i;
> +
> +            output_size =3D ts->info->arg_end - ts->info->arg_start;
> +            if (!output_size) {
> +                /*
> +                 * We special-case the "empty command line" case (argc=
=3D=3D0).
> +                 * Just provide the terminating 0.
> +                 */
> +                output_size =3D 1;
> +            }
> +#endif
> +
> +            if (output_size > input_size) {
> +                /* Not enough space to store command-line arguments.  */
> +                errno =3D E2BIG;
> +                return set_swi_errno(env, -1);
> +            }
> +
> +            /* Adjust the command-line length.  */
> +            if (SET_ARG(1, output_size - 1)) {
> +                /* Couldn't write back to argument block */
> +                errno =3D EFAULT;
> +                return set_swi_errno(env, -1);
> +            }
> +
> +            /* Lock the buffer on the RISC-V side.  */
> +            output_buffer =3D lock_user(VERIFY_WRITE, arg0, output_size,=
 0);
> +            if (!output_buffer) {
> +                errno =3D EFAULT;
> +                return set_swi_errno(env, -1);
> +            }
> +
> +            /* Copy the command-line arguments.  */
> +#if !defined(CONFIG_USER_ONLY)
> +            pstrcpy(output_buffer, output_size, cmdline);
> +#else
> +            if (output_size =3D=3D 1) {
> +                /* Empty command-line.  */
> +                output_buffer[0] =3D '\0';
> +                goto out;
> +            }
> +
> +            if (copy_from_user(output_buffer, ts->info->arg_start,
> +                               output_size)) {
> +                errno =3D EFAULT;
> +                status =3D set_swi_errno(env, -1);
> +                goto out;
> +            }
> +
> +            /* Separate arguments by white spaces.  */
> +            for (i =3D 0; i < output_size - 1; i++) {
> +                if (output_buffer[i] =3D=3D 0) {
> +                    output_buffer[i] =3D ' ';
> +                }
> +            }
> +        out:
> +#endif
> +            /* Unlock the buffer on the RISC-V side.  */
> +            unlock_user(output_buffer, arg0, output_size);
> +
> +            return status;
> +        }
> +    case TARGET_SYS_HEAPINFO:
> +        {
> +            target_ulong retvals[4];
> +            target_ulong limit;
> +            int i;
> +#ifdef CONFIG_USER_ONLY
> +            TaskState *ts =3D cs->opaque;
> +#endif
> +
> +            GET_ARG(0);
> +
> +#ifdef CONFIG_USER_ONLY
> +            /*
> +             * Some C libraries assume the heap immediately follows .bss=
, so
> +             * allocate it using sbrk.
> +             */
> +            if (!ts->heap_limit) {
> +                abi_ulong ret;
> +
> +                ts->heap_base =3D do_brk(0);
> +                limit =3D ts->heap_base + RISCV_HEAP_SIZE;
> +                /* Try a big heap, and reduce the size if that fails.  *=
/
> +                for (;;) {
> +                    ret =3D do_brk(limit);
> +                    if (ret >=3D limit) {
> +                        break;
> +                    }
> +                    limit =3D (ts->heap_base >> 1) + (limit >> 1);
> +                }
> +                ts->heap_limit =3D limit;
> +            }
> +
> +            retvals[0] =3D ts->heap_base;
> +            retvals[1] =3D ts->heap_limit;
> +            retvals[2] =3D ts->stack_base;
> +            retvals[3] =3D 0; /* Stack limit.  */
> +#else
> +            limit =3D ram_size;
> +            /* TODO: Make this use the limit of the loaded application. =
 */
> +            retvals[0] =3D limit / 2;
> +            retvals[1] =3D limit;
> +            retvals[2] =3D limit; /* Stack base */
> +            retvals[3] =3D 0; /* Stack limit.  */
> +#endif
> +
> +            for (i =3D 0; i < ARRAY_SIZE(retvals); i++) {
> +                bool fail;
> +
> +                fail =3D put_user_ual(retvals[i],
> +                                    arg0 + i * sizeof(target_ulong));
> +
> +                if (fail) {
> +                    /* Couldn't write back to argument block */
> +                    errno =3D EFAULT;
> +                    return set_swi_errno(env, -1);
> +                }
> +            }
> +            return 0;
> +        }
> +    case TARGET_SYS_EXIT:
> +    case TARGET_SYS_EXIT_EXTENDED:
> +        if (nr =3D=3D TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) =
=3D=3D 0) {
> +            /*
> +             * The A64 version of SYS_EXIT takes a parameter block,
> +             * so the application-exit type can return a subcode which
> +             * is the exit status code from the application.
> +             * SYS_EXIT_EXTENDED is an a new-in-v2.0 optional function
> +             * which allows A32/T32 guests to also provide a status code=
.
> +             */
> +            GET_ARG(0);
> +            GET_ARG(1);
> +
> +            if (arg0 =3D=3D ADP_Stopped_ApplicationExit) {
> +                ret =3D arg1;
> +            } else {
> +                ret =3D 1;
> +            }
> +        } else {
> +            /*
> +             * The A32/T32 version of SYS_EXIT specifies only
> +             * Stopped_ApplicationExit as normal exit, but does not
> +             * allow the guest to specify the exit status code.
> +             * Everything else is considered an error.
> +             */
> +            ret =3D (args =3D=3D ADP_Stopped_ApplicationExit) ? 0 : 1;
> +        }
> +        gdb_exit(env, ret);
> +        exit(ret);
> +    case TARGET_SYS_SYNCCACHE:
> +        /*
> +         * Clean the D-cache and invalidate the I-cache for the specifie=
d
> +         * virtual address range. This is a nop for us since we don't
> +         * implement caches. This is only present on A64.
> +         */
> +        if (sizeof(target_ulong) =3D=3D 8) {
> +            return 0;
> +        }
> +        /* fall through -- invalid for A32/T32 */
> +    default:
> +        fprintf(stderr, "qemu: Unsupported SemiHosting SWI 0x%02x\n", nr=
);
> +        cpu_dump_state(cs, stderr, 0);
> +        abort();
> +    }
> +}
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 79dca2291b..ecf594babc 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -63,6 +63,7 @@ typedef struct DisasContext {
>      uint16_t vlen;
>      uint16_t mlen;
>      bool vl_eq_vlmax;
> +    CPUState *cs;

I'm not sure we should do this.

>  } DisasContext;
>
>  #ifdef TARGET_RISCV64
> @@ -746,6 +747,15 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
>      return true;
>  }
>
> +static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
> +{
> +    DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
> +    CPUState *cpu =3D ctx->cs;
> +    CPURISCVState *env =3D cpu->env_ptr;
> +
> +    return cpu_ldl_code(env, pc);

@Richard Henderson is this ok?

Alistair

> +}
> +
>  /* Include insn module translation function */
>  #include "insn_trans/trans_rvi.c.inc"
>  #include "insn_trans/trans_rvm.c.inc"
> @@ -812,6 +822,7 @@ static void riscv_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
>      ctx->lmul =3D FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
>      ctx->mlen =3D 1 << (ctx->sew  + 3 - ctx->lmul);
>      ctx->vl_eq_vlmax =3D FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
> +    ctx->cs =3D cs;
>  }
>
>  static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
> --
> 2.28.0
>
>
>

